Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02263218037
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041956E863;
	Wed,  8 Jul 2020 07:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D3889F2E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 11:29:54 +0000 (UTC)
Received: from localhost (unknown [192.168.167.209])
 by regular1.263xmail.com (Postfix) with ESMTP id 81FA331F;
 Tue,  7 Jul 2020 19:29:50 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P12916T139765240280832S1594121389719512_; 
 Tue, 07 Jul 2020 19:29:50 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7974086b14bc74d87f4ceb6a443756c6>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH] drm/of: Consider the state in which the ep is disabled
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20200706075944.11558-1-hjc@rock-chips.com>
 <5521346.QZMSPK5NSd@diego>
From: Huang Jiachai <hjc@rock-chips.com>
Message-ID: <345ce9d4-c1ac-7a19-a1ab-79e4fce12382@rock-chips.com>
Date: Tue, 7 Jul 2020 19:29:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5521346.QZMSPK5NSd@diego>
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: huangtao@rock-chips.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, kever.yang@rock-chips.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy.yan@rock-chips.com
Content-Type: multipart/mixed; boundary="===============0618979061=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0618979061==
Content-Type: multipart/alternative;
 boundary="------------C99958DA3B571F5D36C332F1"

This is a multi-part message in MIME format.
--------------C99958DA3B571F5D36C332F1
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit

Hi heiko

在 2020/7/6 17:47, Heiko Stübner 写道:
> Hi Sandy,
>
> Am Montag, 6. Juli 2020, 09:59:44 CEST schrieb Sandy Huang:
>> don't mask possible_crtcs if remote-point is disabled.
>>
>> Signed-off-by: Sandy Huang <hjc@rock-chips.com>
>> ---
>>   drivers/gpu/drm/drm_of.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
>> index fdb05fbf72a0..f5f250435add 100644
>> --- a/drivers/gpu/drm/drm_of.c
>> +++ b/drivers/gpu/drm/drm_of.c
>> @@ -66,6 +66,11 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
>>   	uint32_t possible_crtcs = 0;
>>   
>>   	for_each_endpoint_of_node(port, ep) {
>> +		if (!of_device_is_available(ep)) {
>> +			of_node_put(ep);
> You'd only need the of_node_put here, if you were exiting the loop.
>
> With the "continue" below, the next iteration of for_each_endpoint_of_node
> will do the put on "ep"
Just as we communicate on the google talk, the v2 patch will delete 
of_node_put(ep) and leave continue, thanks.
>
> Heiko
>
>> +			continue;
>> +		}
>> +
>>   		remote_port = of_graph_get_remote_port(ep);
>>   		if (!remote_port) {
>>   			of_node_put(ep);
>>
>
>
>
>
>
-- 
Best Regard

黄家钗
Sandy Huang
Addr: 福州市鼓楼区铜盘路软件大道89号福州软件园A区21号楼(350003)
       No. 21 Building, A District, No.89,software Boulevard Fuzhou,Fujian,PRC
Tel：+86 0591-87884919  8690
E-mail：hjc@rock-chips.com


--------------C99958DA3B571F5D36C332F1
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <p>Hi heiko<br>
    </p>
    <div class="moz-cite-prefix">在 2020/7/6 17:47, Heiko Stübner 写道:<br>
    </div>
    <blockquote type="cite" cite="mid:5521346.QZMSPK5NSd@diego">
      <pre class="moz-quote-pre" wrap="">Hi Sandy,

Am Montag, 6. Juli 2020, 09:59:44 CEST schrieb Sandy Huang:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">don't mask possible_crtcs if remote-point is disabled.

Signed-off-by: Sandy Huang <a class="moz-txt-link-rfc2396E" href="mailto:hjc@rock-chips.com">&lt;hjc@rock-chips.com&gt;</a>
---
 drivers/gpu/drm/drm_of.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index fdb05fbf72a0..f5f250435add 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -66,6 +66,11 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 	uint32_t possible_crtcs = 0;
 
 	for_each_endpoint_of_node(port, ep) {
+		if (!of_device_is_available(ep)) {
+			of_node_put(ep);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You'd only need the of_node_put here, if you were exiting the loop.

With the "continue" below, the next iteration of for_each_endpoint_of_node
will do the put on "ep"
</pre>
    </blockquote>
    <span style="color: rgb(51, 51, 51); font-family: Arial, 'Microsoft
      YaHei', '\\5FAE软雅黑', '\\5B8B体', 'Malgun Gothic', Meiryo,
      sans-serif; font-size: 14px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      26px; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(247, 248, 250); display: inline !important;
      float: none;">Just as we communicate on the google talk, the v2
      patch will delete of_node_put(ep) and leave continue, thanks.<br>
    </span>
    <blockquote type="cite" cite="mid:5521346.QZMSPK5NSd@diego">
      <pre class="moz-quote-pre" wrap="">

Heiko

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+			continue;
+		}
+
 		remote_port = of_graph_get_remote_port(ep);
 		if (!remote_port) {
 			of_node_put(ep);

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">





</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Best Regard 

黄家钗
Sandy Huang
Addr: 福州市鼓楼区铜盘路软件大道89号福州软件园A区21号楼(350003)
      No. 21 Building, A District, No.89,software Boulevard Fuzhou,Fujian,PRC
Tel：+86 0591-87884919  8690
E-mail：<a class="moz-txt-link-abbreviated" href="mailto:hjc@rock-chips.com">hjc@rock-chips.com</a></pre>
  </body>
</html>

--------------C99958DA3B571F5D36C332F1--



--===============0618979061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0618979061==--


