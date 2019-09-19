Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56675B71EB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 05:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A9D6F982;
	Thu, 19 Sep 2019 03:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754D96F9A5;
 Thu, 19 Sep 2019 03:30:52 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 32B69613A3; Thu, 19 Sep 2019 03:30:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,HTML_MESSAGE,SPF_NONE autolearn=no
 autolearn_force=no version=3.4.0
Received: from JEYKUMAR1 (cpe-70-95-204-145.san.res.rr.com [70.95.204.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: jsanka@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C89ED602E1;
 Thu, 19 Sep 2019 03:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C89ED602E1
From: <jsanka@codeaurora.org>
To: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: [RFC] checking drm_framebuffer against config width/height
Date: Wed, 18 Sep 2019 20:30:49 -0700
Message-ID: <09ee01d56e9a$a2739380$e75aba80$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdVuic1Q68qyvJSiR/WK5DIhhjoTcw==
Content-Language: en-us
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568863852;
 bh=MFSShw46IThMxlg2OAlSapOx66+ujPzhaas5GRgKZrU=;
 h=From:To:Cc:Subject:Date:From;
 b=C2Lnb47f5qTKYRLCE+otTmnfuGC8XJJh1HghpUISa40HbveazoKHo1TvFFG6Rm6wL
 iQJvH+XCC3uovMOjeydNVVfN5r1qrfBm0ewTxGFVAmQdAyQaJClTQy1CHwscBYjOA1
 7iflwxvS1kjEMEvODFUJvT0nbE2f7IXR2lg7m8Is=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568863851;
 bh=MFSShw46IThMxlg2OAlSapOx66+ujPzhaas5GRgKZrU=;
 h=From:To:Cc:Subject:Date:From;
 b=hxjcsL74YsYh9hFxCXW4j7W/IWat8R+xPWhku5o07zmZKFo6L408u10kn/4lUgLEO
 e7WY+EbteyZCs57yqX1pwstyxlSBgj1ljtw/UvVedQxsRUGOVaHKfTgyLk6lPfDEQZ
 CWzBEq3gliBYd/PGbWd1zHU/mhpbESkvEFJTgHPo=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jsanka@codeaurora.org
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
Cc: sean@poorly.run, 'Sean Paul' <seanpaul@chromium.org>
Content-Type: multipart/mixed; boundary="===============1867652099=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multipart message in MIME format.

--===============1867652099==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_09EF_01D56E5F.F61816E0"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_09EF_01D56E5F.F61816E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello All, 

I bumped into the below check [1] enforced in drm_framebuffer creation which
checks the requested framebuffer width/height parameters against the drm
mode config width/height limits. As I understand, drm_mode_config: min/max
width/height indicate the upper and lower bounds of the display panel
(drm_connector) resolutions the DRM device can support. But the pixel
processing pipeline can apply cropping/scaling transformations on much
larger input framebuffers and flip the buffers within the display
resolution. Such configurations are very common and the final resolution
will be still within drm_mode_config bounds. So I believe the checks should
be relaxed / removed from the drm_framebuffer creation api's. 

 

If my understanding is incorrect, could somehow explain the motivation
behind having these checks here?

 

Thanks and Regards,

Jeykumar S.

 

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/driv
ers/gpu/drm/drm_framebuffer.c?h=v5.3#n303

 

struct drm_framebuffer *
drm_internal_framebuffer_create(struct drm_device *dev,
                               const struct drm_mode_fb_cmd2 *r,
                               struct drm_file *file_priv)
{

                     /* snip */

 

        if ((config->min_width > r->width) || (r->width >
config->max_width)) {

               DRM_DEBUG_KMS("bad framebuffer width %d, should be >= %d &&
<= %d\n",

                         r->width, config->min_width, config->max_width);

               return ERR_PTR(-EINVAL);

        }

        if ((config->min_height > r->height) || (r->height >
config->max_height)) {

               DRM_DEBUG_KMS("bad framebuffer height %d, should be >= %d &&
<= %d\n",

                         r->height, config->min_height, config->max_height);

               return ERR_PTR(-EINVAL);

        }

        /* snip */

}

 


------=_NextPart_000_09EF_01D56E5F.F61816E0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Latha;
	panose-1:2 0 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.k
	{mso-style-name:k;}
span.p
	{mso-style-name:p;}
span.n
	{mso-style-name:n;}
span.o
	{mso-style-name:o;}
span.s
	{mso-style-name:s;}
span.se
	{mso-style-name:se;}
span.nf
	{mso-style-name:nf;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello All, <o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-indent:.5in'>I bumped into the below check [1] enforced in =
drm_framebuffer creation which checks the requested framebuffer =
width/height parameters against the drm mode config width/height limits. =
As I understand, drm_mode_config: min/max width/height indicate the =
upper and lower bounds of the display panel (drm_connector) resolutions =
the DRM device can support. But the pixel processing pipeline can apply =
cropping/scaling transformations on much larger input framebuffers and =
flip the buffers within the display resolution. Such configurations are =
very common and the final resolution will be still within =
drm_mode_config bounds. So I believe the checks should be relaxed / =
removed from the drm_framebuffer creation api&#8217;s. <o:p></o:p></p><p =
class=3DMsoNormal style=3D'text-indent:.5in'><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal style=3D'text-indent:.5in'>If my understanding is =
incorrect, could somehow explain the motivation behind having these =
checks here?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks and Regards,<o:p></o:p></p><p =
class=3DMsoNormal>Jeykumar S.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>[1] <a =
href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/gpu/drm/drm_framebuffer.c?h=3Dv5.3#n303">https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/dr=
m_framebuffer.c?h=3Dv5.3#n303</a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><pre =
style=3D'background:white'><span class=3Dk><b><span =
style=3D'color:#008800'>struct</span></b></span><span =
style=3D'color:black'> <span class=3Dn>drm_framebuffer</span> <span =
class=3Do>*</span><o:p></o:p></span></pre><pre =
style=3D'background:white'><span class=3Dnf><b><span =
style=3D'color:#0066BB'>drm_internal_framebuffer_create</span></b></span>=
<span class=3Dp><span style=3D'color:black'>(</span></span><span =
class=3Dk><b><span style=3D'color:#008800'>struct</span></b></span><span =
style=3D'color:black'> <span class=3Dn>drm_device</span> <span =
class=3Do>*</span><span class=3Dn>dev</span><span =
class=3Dp>,</span><o:p></o:p></span></pre><pre =
style=3D'background:white'><span =
style=3D'color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3Dk><b><span style=3D'color:#008800'>const</span></b></span><span =
style=3D'color:black'> </span><span class=3Dk><b><span =
style=3D'color:#008800'>struct</span></b></span><span =
style=3D'color:black'> <span class=3Dn>drm_mode_fb_cmd2</span> <span =
class=3Do>*</span><span class=3Dn>r</span><span =
class=3Dp>,</span><o:p></o:p></span></pre><pre =
style=3D'background:white'><span =
style=3D'color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3Dk><b><span style=3D'color:#008800'>struct</span></b></span><span =
style=3D'color:black'> <span class=3Dn>drm_file</span> <span =
class=3Do>*</span><span class=3Dn>file_priv</span><span =
class=3Dp>)</span><o:p></o:p></span></pre><pre =
style=3D'background:white'><span class=3Dp><span =
style=3D'color:black'>{</span></span><span =
style=3D'color:black'><o:p></o:p></span></pre><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;/* snip =
*/<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><b><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#008800'>if</span></b><span =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> =
((config-&gt;min_width &gt; r-&gt;width) || (r-&gt;width &gt; =
config-&gt;max_width)) {<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#DD2200;background:#FFF0F0'>&quot;bad framebuffer width %d, =
should be &gt;=3D %d &amp;&amp; &lt;=3D %d</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0044DD;background:#FFF0F0'>\n</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#DD2200;background:#FFF0F0'>&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &nbsp; r-&gt;width, config-&gt;min_width, =
config-&gt;max_width);<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#008800'>return</span></b><span =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> =
ERR_PTR(-EINVAL);<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
}<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><b><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#008800'>if</span></b><span =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> =
((config-&gt;min_height &gt; r-&gt;height) || (r-&gt;height &gt; =
config-&gt;max_height)) {<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#DD2200;background:#FFF0F0'>&quot;bad framebuffer height %d, =
should be &gt;=3D %d &amp;&amp; &lt;=3D %d</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0044DD;background:#FFF0F0'>\n</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#DD2200;background:#FFF0F0'>&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &nbsp; r-&gt;height, config-&gt;min_height, =
config-&gt;max_height);<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#008800'>return</span></b><span =
style=3D'font-size:10.0pt;font-family:"Courier New";color:black'> =
ERR_PTR(-EINVAL);<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
}<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* snip =
*/<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black'>}<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_09EF_01D56E5F.F61816E0--


--===============1867652099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1867652099==--

