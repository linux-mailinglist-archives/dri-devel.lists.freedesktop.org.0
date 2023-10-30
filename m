Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59F7DB63F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A36610E25F;
	Mon, 30 Oct 2023 09:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s01.bc.larksuite.com (s01.bc.larksuite.com [209.127.230.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352A310E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=dingdao-com.20200927.dkim.feishu.cn; t=1698658202;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=iFF8VMdPPW/OLos7aQJ3HZ2/YcZmTxfq8zTAq0FXorc=;
 b=18QWj7OXagmy9rHs+PUkMqT9DxjRUfyRXhzPxNGzrxPqgCVHYxYDzO+P9NlY/B+hPyrxOZ
 uMNj4cyDdprDRlLUuCUPEsVRKBNSrJtcKePmWvpQ1i32hNxRb3zmvfa9DOeE/+wXr3ioAC
 w7ydnqJfQXS7a8INBiCMG0x9bJzXqi9Ghkc/gd+jlJMrij/0/zs1l46rAweXMvVwfruSJj
 Kh1gHdg56K//aZsEzQVcYEACqY5ire5O4axEDmqxDKanYzFK1bvRSns5+RHcocDnI3588A
 qckqIsYf0Epo2dmj3Jyrx9QrWjaCjkV86ZqiBw8bmiovKrO+bd0dZShfeYXWYg==
X-Lms-Return-Path: <lba+1653f7799+4f5213+lists.freedesktop.org+penghao@dingdao.com>
Content-Type: multipart/alternative;
 boundary=55fec1dd2ea403562e013d757560ba7e619964ffbd2d7240e9459c61cbf5
Message-Id: <5f94acf38665f92299e88c460ea01bb1bfb08824.641f7310.3393.4dd7.83bc.64278ef36063@feishu.cn>
To: "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "mripard" <mripard@kernel.org>, "tzimmermann" <tzimmermann@suse.de>, 
 "airlied" <airlied@gmail.com>, "daniel" <daniel@ffwll.ch>
Subject: [PATCH] gpu/drm/drm_framebuffer.c: Add judgement for return value of
 drm_get_format_info().
From: =?utf-8?q?=E5=BD=AD=E6=98=8A?= <penghao@dingdao.com>
Mime-Version: 1.0
Date: Mon, 30 Oct 2023 17:30:00 +0800
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
Cc: =?utf-8?q?=E5=BD=AD=E6=98=8A?= <penghao@dingdao.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--55fec1dd2ea403562e013d757560ba7e619964ffbd2d7240e9459c61cbf5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

According to your(Villie) reply, the *info has been checked info earlier, a=
nd I have read the code of framebuffer_check() and related drm_get_format_i=
nfo() which it calls, but unfortunatelly, I haven't seen=C2=A0 judgement(ch=
eck) for it. What I only found related with check=C2=A0is the sentence belo=
w (in *drm_format_info() in drivers/gpu/drm/drm_fourcc.c)=EF=BC=9A
```
info =3D __drm_format_info(format);
WARN_ON(!info);
```=C2=A0
But to the best of my knowledge, "WARN_ON" only gives a dump_stack(), not=
=C2=A0 discontinue the program going on, so it will indeed go to the below =
line in framebuffer_check() and raise an error:
```
for (i =3D 0; i < info->num_planes; i++) {
```
So maybe it will make=C2=A0 sense of my commited code.

Signed-off-by: Peng Hao <penghao@dingdao.com>
---
=C2=A0drivers/gpu/drm/drm_framebuffer.c | 4 ++++
=C2=A01 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index aff3746dedfb..be7dd1998c04 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -194,6 +194,10 @@ static int framebuffer_check(struct drm_device *dev,
=C2=A0
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* now let the driver pick its own format=
 info */
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D drm_get_format_info(dev, r);
+ =C2=A0 =C2=A0 =C2=A0=C2=A0 if (!info) {
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 drm_dbg_kms(dev, "=
no matched format info\n");
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 return -EFAULT;
+ =C2=A0 =C2=A0 =C2=A0=C2=A0 }
=C2=A0
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < info->num_planes; i++) =
{
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int =
width =3D fb_plane_width(r->width, info, i);
--=C2=A0
2.37.1
--55fec1dd2ea403562e013d757560ba7e619964ffbd2d7240e9459c61cbf5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div id=3D"editor_version_1.35.4_3JKtNYEF" style=3D"word-break:break-word;"=
><div data-zone-id=3D"0" data-line-index=3D"0" data-line=3D"true" style=3D"=
font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">Ac=
cording to your(Villie) reply, the *info has been checked info earlier, and=
 I have read the code of framebuffer_check() and related drm_get_format_inf=
o() which it calls, but unfortunatelly, I haven't seen&nbsp; judgement(chec=
k) for it. What I only found related with check&nbsp;is the sentence below =
(in *drm_format_info() in drivers/gpu/drm/drm_fourcc.c)=EF=BC=9A</div><div =
data-zone-id=3D"0" data-line-index=3D"1" data-line=3D"true" style=3D"font-s=
ize: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">```</div=
><div data-zone-id=3D"0" data-line-index=3D"2" data-line=3D"true" style=3D"=
font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">in=
fo =3D __drm_format_info(format);</div><div data-zone-id=3D"0" data-line-in=
dex=3D"3" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; mar=
gin-bottom: 4px; line-height: 1.6;">WARN_ON(!info);</div><div data-zone-id=
=3D"0" data-line-index=3D"4" data-line=3D"true" style=3D"font-size: 14px; m=
argin-top: 4px; margin-bottom: 4px; line-height: 1.6;">```&nbsp;</div><div =
data-zone-id=3D"0" data-line-index=3D"5" data-line=3D"true" style=3D"font-s=
ize: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">But to t=
he best of my knowledge, "WARN_ON" only gives a dump_stack(), not&nbsp; dis=
continue the program going on, so it will indeed go to the below line in fr=
amebuffer_check() and raise an error:</div><div data-zone-id=3D"0" data-lin=
e-index=3D"6" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px;=
 margin-bottom: 4px; line-height: 1.6;">```</div><div data-zone-id=3D"0" da=
ta-line-index=3D"7" data-line=3D"true" style=3D"font-size: 14px; margin-top=
: 4px; margin-bottom: 4px; line-height: 1.6;">for (i =3D 0; i &lt; info-&gt=
;num_planes; i++) {</div><div data-zone-id=3D"0" data-line-index=3D"8" data=
-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;">```</div><div data-zone-id=3D"0" data-line-index=3D"9=
" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bott=
om: 4px; line-height: 1.6;">So maybe it will make&nbsp; sense of my commite=
d code.</div><div data-zone-id=3D"0" data-line-index=3D"10" data-line=3D"tr=
ue" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-hei=
ght: 1.6;"><br></div><div data-zone-id=3D"0" data-line-index=3D"11" data-li=
ne=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; =
line-height: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-si=
ze: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, L=
arkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang =
SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span=
 style=3D"background-color: rgb(255, 255, 255);">Signed-off-by: Peng Hao &l=
t;</span></span></span></span></span><span style=3D"font-weight: 400;"><spa=
n style=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFont=
, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahom=
a, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(3=
1, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255);"><a href=
=3D"mailto:penghao@dingdao.com" target=3D"_blank" rel=3D"noopener noreferre=
r" style=3D"transition: color 0.3s ease 0s; cursor: pointer; text-decoratio=
n: none; color: rgb(36, 91, 219);">penghao@dingdao.com</a></span></span></s=
pan></span></span><span style=3D"font-weight: 400;"><span style=3D"font-siz=
e: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, La=
rkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang S=
C&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span =
style=3D"background-color: rgb(255, 255, 255);">&gt;</span></span></span></=
span></span></div><div data-zone-id=3D"0" data-line-index=3D"12" data-line=
=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; li=
ne-height: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-size=
: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, Lar=
kChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC=
&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span s=
tyle=3D"background-color: rgb(255, 255, 255);">---</span></span></span></sp=
an></span></div><div data-zone-id=3D"0" data-line-index=3D"13" data-line=3D=
"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-=
height: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-size: 1=
4px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkCh=
ineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&qu=
ot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span styl=
e=3D"background-color: rgb(255, 255, 255);">&nbsp;drivers/gpu/drm/drm_frame=
buffer.c | 4 ++++</span></span></span></span></span></div><div data-zone-id=
=3D"0" data-line-index=3D"14" data-line=3D"true" style=3D"font-size: 14px; =
margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font=
-weight: 400;"><span style=3D"font-size: 14px;"><span style=3D"font-family:=
 LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkM=
acSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span st=
yle=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 2=
55, 255);">&nbsp;1 file changed, 4 insertions(+)</span></span></span></span=
></span></div><div data-zone-id=3D"0" data-line-index=3D"15" data-line=3D"t=
rue" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-he=
ight: 1.6;"><br></div><div data-zone-id=3D"0" data-line-index=3D"16" data-l=
ine=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px;=
 line-height: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-s=
ize: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, =
LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang=
 SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><spa=
n style=3D"background-color: rgb(255, 255, 255);">diff --git a/drivers/gpu/=
drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c</span></span></sp=
an></span></span></div><div data-zone-id=3D"0" data-line-index=3D"17" data-=
line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-=
size: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont,=
 LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFan=
g SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><sp=
an style=3D"background-color: rgb(255, 255, 255);">index aff3746dedfb..be7d=
d1998c04 100644</span></span></span></span></span></div><div data-zone-id=
=3D"0" data-line-index=3D"18" data-line=3D"true" style=3D"font-size: 14px; =
margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font=
-weight: 400;"><span style=3D"font-size: 14px;"><span style=3D"font-family:=
 LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkM=
acSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span st=
yle=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 2=
55, 255);">--- a/drivers/gpu/drm/drm_framebuffer.c</span></span></span></sp=
an></span></div><div data-zone-id=3D"0" data-line-index=3D"19" data-line=3D=
"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-=
height: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-size: 1=
4px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkCh=
ineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&qu=
ot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span styl=
e=3D"background-color: rgb(255, 255, 255);">+++ b/drivers/gpu/drm/drm_frame=
buffer.c</span></span></span></span></span></div><div data-zone-id=3D"0" da=
ta-line-index=3D"20" data-line=3D"true" style=3D"font-size: 14px; margin-to=
p: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-weight: =
400;"><span style=3D"font-size: 14px;"><span style=3D"font-family: LarkHack=
SafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemF=
ont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"co=
lor: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255);=
">@@ -194,6 +194,10 @@ static int framebuffer_check(struct drm_device *dev,=
</span></span></span></span></span></div><div data-zone-id=3D"0" data-line-=
index=3D"21" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; =
margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-weight: 400;"><s=
pan style=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFo=
nt, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tah=
oma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb=
(31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255);"><span>=
&nbsp;<wbr></span></span></span></span></span></span></div><div data-zone-i=
d=3D"0" data-line-index=3D"22" data-line=3D"true" style=3D"font-size: 14px;=
 margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"fon=
t-weight: 400;"><span style=3D"font-size: 14px;"><span style=3D"font-family=
: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, Blink=
MacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span s=
tyle=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, =
255, 255);">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; /* now let the driver pick it=
s own format info */</span></span></span></span></span></div><div data-zone=
-id=3D"0" data-line-index=3D"23" data-line=3D"true" style=3D"font-size: 14p=
x; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"f=
ont-weight: 400;"><span style=3D"font-size: 14px;"><span style=3D"font-fami=
ly: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, Bli=
nkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span=
 style=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255=
, 255, 255);">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; info =3D drm_get_format_inf=
o(dev, r);</span></span></span></span></span></div><div data-zone-id=3D"0" =
data-line-index=3D"24" data-line=3D"true" style=3D"font-size: 14px; margin-=
top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-weight=
: 400;"><span style=3D"font-size: 14px;"><span style=3D"font-family: LarkHa=
ckSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSyste=
mFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"=
color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255=
);">+ &nbsp; &nbsp; &nbsp;&nbsp; if (!info) {</span></span></span></span></=
span></div><div data-zone-id=3D"0" data-line-index=3D"25" data-line=3D"true=
" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-heigh=
t: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-size: 14px;"=
><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChinese=
Quote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, =
Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=3D"=
background-color: rgb(255, 255, 255);">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;&nbsp; drm_dbg_kms(dev, "no matched format info\n");</span></=
span></span></span></span></div><div data-zone-id=3D"0" data-line-index=3D"=
26" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bo=
ttom: 4px; line-height: 1.6;"><span style=3D"font-weight: 400;"><span style=
=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkE=
mojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quo=
t;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, =
41);"><span style=3D"background-color: rgb(255, 255, 255);">+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return -EFAULT;</span></span></sp=
an></span></span></div><div data-zone-id=3D"0" data-line-index=3D"27" data-=
line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><span style=3D"font-weight: 400;"><span style=3D"font-=
size: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont,=
 LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFan=
g SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><sp=
an style=3D"background-color: rgb(255, 255, 255);">+ &nbsp; &nbsp; &nbsp;&n=
bsp; }</span></span></span></span></span></div><div data-zone-id=3D"0" data=
-line-index=3D"28" data-line=3D"true" style=3D"font-size: 14px; margin-top:=
 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-weight: 40=
0;"><span style=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSa=
fariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFon=
t, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"colo=
r: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255);">=
<span>&nbsp;<wbr></span></span></span></span></span></span></div><div data-=
zone-id=3D"0" data-line-index=3D"29" data-line=3D"true" style=3D"font-size:=
 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=
=3D"font-weight: 400;"><span style=3D"font-size: 14px;"><span style=3D"font=
-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system=
, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;">=
<span style=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rg=
b(255, 255, 255);">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; i=
nfo-&gt;num_planes; i++) {</span></span></span></span></span></div><div dat=
a-zone-id=3D"0" data-line-index=3D"30" data-line=3D"true" style=3D"font-siz=
e: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span styl=
e=3D"font-weight: 400;"><span style=3D"font-size: 14px;"><span style=3D"fon=
t-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-syste=
m, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"=
><span style=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: r=
gb(255, 255, 255);">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; unsigned int width =3D fb_plane_width(r-&gt;width, info, i);</span><=
/span></span></span></span></div><div data-zone-id=3D"0" data-line-index=3D=
"31" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-b=
ottom: 4px; line-height: 1.6;"><span style=3D"font-weight: 400;"><span styl=
e=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFont, Lark=
EmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &qu=
ot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35,=
 41);"><span style=3D"background-color: rgb(255, 255, 255);">--&nbsp;</span=
></span></span></span></span></div><div data-zone-id=3D"0" data-line-index=
=3D"32" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margi=
n-bottom: 4px; line-height: 1.6;"><span style=3D"font-weight: 400;"><span s=
tyle=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFont, L=
arkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, =
&quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, =
35, 41);"><span style=3D"background-color: rgb(255, 255, 255);">2.37.1</spa=
n></span></span></span></span></div></div>
--55fec1dd2ea403562e013d757560ba7e619964ffbd2d7240e9459c61cbf5--
