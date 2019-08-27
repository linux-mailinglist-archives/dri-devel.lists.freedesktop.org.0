Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B59DCF1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 07:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7860289A7A;
	Tue, 27 Aug 2019 05:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8276089A7A;
 Tue, 27 Aug 2019 05:06:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 22:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; 
 d="scan'208,217";a="185177486"
Received: from sharmash-mobl3.gar.corp.intel.com (HELO [10.252.72.100])
 ([10.252.72.100])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2019 22:06:12 -0700
Subject: Re: [PATCH v9 3/6] drm: Extend I915 mei interface for transcoder info
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20190822151904.17919-1-ramalingam.c@intel.com>
 <20190822151904.17919-4-ramalingam.c@intel.com>
From: "Sharma, Shashank" <shashank.sharma@intel.com>
Message-ID: <1b554810-f289-a5cf-4e1e-1397088fcc5f@intel.com>
Date: Tue, 27 Aug 2019 10:36:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822151904.17919-4-ramalingam.c@intel.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jani Nikula <jani.nikula@intel.com>, tomas.winkler@intel.com
Content-Type: multipart/mixed; boundary="===============0327244998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0327244998==
Content-Type: multipart/alternative;
 boundary="------------60B69BBEACA2F5E23FBDF21B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------60B69BBEACA2F5E23FBDF21B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/22/2019 8:49 PM, Ramalingam C wrote:
> I915 needs to send the index of the transcoder as per ME FW.
> To support this, define enum mei_fw_ddi and add as a member into
> the struct hdcp_port_data.
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   include/drm/i915_mei_hdcp_interface.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/include/drm/i915_mei_hdcp_interface.h b/include/drm/i915_mei_hdcp_interface.h
> index a97acf1c9710..0de629bf2f62 100644
> --- a/include/drm/i915_mei_hdcp_interface.h
> +++ b/include/drm/i915_mei_hdcp_interface.h
> @@ -54,9 +54,21 @@ enum mei_fw_ddi {
>   	MEI_DDI_RANGE_END = MEI_DDI_A,
>   };
>   
> +enum mei_fw_tc {
> +	MEI_INVALID_TRANSCODER = 0x00,	/* Invalid transcoder type */
> +	MEI_TC_EDP,			/* Transcoder for eDP */
> +	MEI_TC_DSI0,			/* Transcoder for DSI0 */
> +	MEI_TC_DSI1,			/* Transcoder for DSI1 */
Also, this is a bit odd, coz ports above can't do HDCP, so it doesn't 
make sense to have them here. But seems like we want to be in sync with 
MEI FW definitions, so we should change the function

intel_get_mei_fw_ddi_index to accept only from ports A to D, not above 
or below.

- Shashank

> +	MEI_TC_A = 0x10,		/* Transcoder TCA */
> +	MEI_TC_B,			/* Transcoder TCB */
> +	MEI_TC_C,			/* Transcoder TCC */
> +	MEI_TC_D			/* Transcoder TCD */
> +};
> +
>   /**
>    * struct hdcp_port_data - intel specific HDCP port data
>    * @fw_ddi: ddi index as per ME FW
> + * @fw_tc: transcoder index as per ME FW
>    * @port_type: HDCP port type as per ME FW classification
>    * @protocol: HDCP adaptation as per ME FW
>    * @k: No of streams transmitted on a port. Only on DP MST this is != 1
> @@ -69,6 +81,7 @@ enum mei_fw_ddi {
>    */
>   struct hdcp_port_data {
>   	enum mei_fw_ddi fw_ddi;
> +	enum mei_fw_tc fw_tc;
>   	u8 port_type;
>   	u8 protocol;
>   	u16 k;

--------------60B69BBEACA2F5E23FBDF21B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/22/2019 8:49 PM, Ramalingam C
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190822151904.17919-4-ramalingam.c@intel.com">
      <pre class="moz-quote-pre" wrap="">I915 needs to send the index of the transcoder as per ME FW.
To support this, define enum mei_fw_ddi and add as a member into
the struct hdcp_port_data.

Signed-off-by: Ramalingam C <a class="moz-txt-link-rfc2396E" href="mailto:ramalingam.c@intel.com">&lt;ramalingam.c@intel.com&gt;</a>
Acked-by: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>
---
 include/drm/i915_mei_hdcp_interface.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm/i915_mei_hdcp_interface.h b/include/drm/i915_mei_hdcp_interface.h
index a97acf1c9710..0de629bf2f62 100644
--- a/include/drm/i915_mei_hdcp_interface.h
+++ b/include/drm/i915_mei_hdcp_interface.h
@@ -54,9 +54,21 @@ enum mei_fw_ddi {
 	MEI_DDI_RANGE_END = MEI_DDI_A,
 };
 
+enum mei_fw_tc {
+	MEI_INVALID_TRANSCODER = 0x00,	/* Invalid transcoder type */
+	MEI_TC_EDP,			/* Transcoder for eDP */
+	MEI_TC_DSI0,			/* Transcoder for DSI0 */
+	MEI_TC_DSI1,			/* Transcoder for DSI1 */</pre>
    </blockquote>
    Also, this is a bit odd, coz ports above can't do HDCP, so it
    doesn't make sense to have them here. But seems like we want to be
    in sync with MEI FW definitions, so we should change the function 
    <div class="WordSection1">
      <p class="MsoNormal"
        style="margin-top:2.0pt;margin-right:0in;margin-bottom:2.0pt;
        margin-left:0in;line-height:normal;text-autospace:none"><span
          style="font-size:
          10.0pt;font-family:&quot;Courier New&quot;">intel_get_mei_fw_ddi_index
          to accept only from ports A to D, not above or below. <br>
        </span></p>
      <p class="MsoNormal"
        style="margin-top:2.0pt;margin-right:0in;margin-bottom:2.0pt;
        margin-left:0in;line-height:normal;text-autospace:none"><span
          style="font-size:
          10.0pt;font-family:&quot;Courier New&quot;">- Shashank </span><span
          style="font-size:10.0pt;font-family:&quot;Segoe
          UI&quot;,sans-serif;color:black"> </span></p>
    </div>
     
    <style><!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{margin-bottom:8.0pt;
	line-height:107%;}
 /* Page Definitions */
 @page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
-->
</style>
    <blockquote type="cite"
      cite="mid:20190822151904.17919-4-ramalingam.c@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	MEI_TC_A = 0x10,		/* Transcoder TCA */
+	MEI_TC_B,			/* Transcoder TCB */
+	MEI_TC_C,			/* Transcoder TCC */
+	MEI_TC_D			/* Transcoder TCD */
+};
+
 /**
  * struct hdcp_port_data - intel specific HDCP port data
  * @fw_ddi: ddi index as per ME FW
+ * @fw_tc: transcoder index as per ME FW
  * @port_type: HDCP port type as per ME FW classification
  * @protocol: HDCP adaptation as per ME FW
  * @k: No of streams transmitted on a port. Only on DP MST this is != 1
@@ -69,6 +81,7 @@ enum mei_fw_ddi {
  */
 struct hdcp_port_data {
 	enum mei_fw_ddi fw_ddi;
+	enum mei_fw_tc fw_tc;
 	u8 port_type;
 	u8 protocol;
 	u16 k;
</pre>
    </blockquote>
  </body>
</html>

--------------60B69BBEACA2F5E23FBDF21B--

--===============0327244998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0327244998==--
