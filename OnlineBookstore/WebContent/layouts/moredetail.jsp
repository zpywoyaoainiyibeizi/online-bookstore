<%@page import="com.chicken.model.BookDetailBean"%>
<%@page import="com.chicken.util.C"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%
	BookDetailBean bookDetailBean=(BookDetailBean)request.getAttribute("bookDetailBean");
	int bookCommentPageCount=(Integer)request.getAttribute("bookCommentPageCount");
	int bookTradeRecordPageCount=(Integer)request.getAttribute("bookTradeRecordPageCount");
%> 

<!-- 选项卡 -->
<div class="tabcontainer" id='detail_tab'>
	<ul>
	   	<li id="content_tab">商品详情</li>
	   	<li id="comment_tab">商品评价</li>
	   	<li id="traderecord_tab">成交记录</li>
	</ul>
    		
    <!-- 商品详情选项卡 -->
    <div class="tabdiv" id="content_div">
	    <div class="bookinfo" style="height:100px;">
	  		<span>版次:&nbsp;&nbsp;<%=bookDetailBean.getBversion() %></span>
	  		<span>页数:&nbsp;&nbsp;<%=bookDetailBean.getBpagenum() %></span>
	  		<span>字数:&nbsp;&nbsp;<%=bookDetailBean.getBwordnum() %></span>
	    	<span>印刷时间:&nbsp;&nbsp;<%=bookDetailBean.getBprintdate() %></span>
	    	<span>开本:&nbsp;&nbsp;<%=bookDetailBean.getBsize() %>开</span>
	    	<span>纸张:&nbsp;&nbsp;<%=bookDetailBean.getBpaperstyle() %></span>
	    	<span>印次:&nbsp;&nbsp;<%=bookDetailBean.getBprintnum() %></span>
	    	<span>包装:&nbsp;&nbsp;<%=bookDetailBean.getBpackage() %></span>
	    	<span>国际标准书号ISBN:&nbsp;&nbsp;<%=bookDetailBean.getBisbn() %></span>
	    </div>
    
		<!-- 内容简介 -->
		<div class="title"><span>&nbsp;内容简介&nbsp;</span></div><br>
		<hr class="titlehr">
		<p>
		<%=bookDetailBean.getBcontentsummary() %>
		</p>

 		<!-- 作者简介 -->
	    <div class="title"><span>&nbsp;作者简介&nbsp;</span></div><br>
	    <hr class="titlehr">
	    <p>
	   	<%=bookDetailBean.getBauthorsummary() %>
	    </p>

		<!-- 媒体评价 -->		    
	    <div class="title"><span>&nbsp;媒体评价&nbsp;</span></div><br>
	    <hr class="titlehr">
	    <p>
	    <%=bookDetailBean.getBmediacomment() %>
	    </p>
    
		<!-- 试读章节 -->		    
		<div class="title"><span>&nbsp;试读章节&nbsp;</span></div><br>
		<hr class="titlehr">
		<p>
		<%=bookDetailBean.getBtastecontent() %>
		</p>
	</div>
		    
	<!-- 商品评价选项卡 -->
    <div class="tabdiv" id="comment_div"></div>
    
    
    <!-- 成交记录选项卡 -->
    <div class="tabdiv" id="traderecord_div">
    	<table class="datatable" id="traderecord_table"></table> 
    </div>
</div>




	
<script type="text/javascript" src="js/checkJumpPageInfo.js"></script>	
<script type="text/javascript" src="js/ajaxRequestOnTab.js"></script>	
<script type="text/javascript">

$(document).ready(function(){

	//构造事件附加参数(json对象，已转换后)
	comment_json=eval("("+"{'Bid':\"<%=bookDetailBean.getBid()%>\",'type': 'comment','pageCount':<%=bookCommentPageCount%>,'pageRange':<%=C.pageRange%>}"+")");
	traderecord_json=eval("("+"{'Bid':\"<%=bookDetailBean.getBid()%>\",'type':'traderecord','pageCount':<%=bookTradeRecordPageCount%>,'pageRange':<%=C.pageRange%>}"+")");
	
	
	//为评价、成交记录选项卡设置ajax响应，为商品详情设置操作
	$('#content_tab').click(onContentTabListener);
	
    $('#comment_tab').click({'json':comment_json},ajaxListener);
    $('#comment_a').click(function(){$("#comment_tab").trigger("click");});
  	
  	
	$('#traderecord_tab').click({'json':traderecord_json},ajaxListener);
	$('#traderecord_a').click(function(){$("#traderecord_tab").trigger("click");});
});
</script>
