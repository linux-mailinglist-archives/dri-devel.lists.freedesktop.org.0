Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1007DB5EC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A2110E252;
	Mon, 30 Oct 2023 09:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s01.bc.feishu.cn (s01.bc.feishu.cn [103.149.242.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6B610E252
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=dingdao-com.20200927.dkim.feishu.cn; t=1698656927;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=KFOaSdJp4k0+g1ffK6qjCcUNyIR2AX7CCjiJcEKGcaA=;
 b=nAcTuQJd3hs2YXmaxrWDdYtTKjdiLCzMDTZbKF4zsmllhrR7lF8/qedvSa8roeEADg56fp
 jIQwjRqbXku4tV7qHg0xz7xUDDxdjUJv8s1s5Zu4esMLifT2+f6CGZDFvL41H88YNE48dD
 X2Dli8NxkJ0lUbCss/TrRzz0EOdIavberOylJa7ntO9uAMxht8TQkN6SgFd0flbL4XyahF
 5XCRdmd4mLJFAFWfZl/KYZjeRleLdWgc074JzvuiPtt2UGjE96lYfjIW5Dv0GKoLSYj8DU
 KG2eNa3dY6jna/CyuCuEqDJkQAtLRj1UhhpyQAuNfPph2rEK4VrkaX2g7y1T4w==
Message-Id: <5f94acf38665f92299e88c460ea01bb1bfb08824.59fb3652.088c.44cb.b4bc.8b7efeed5c9a@feishu.cn>
Mime-Version: 1.0
In-Reply-To: <ZTut09A43yidJD9Z@intel.com>
X-Lms-Return-Path: <lba+1653f729e+5f4fdc+lists.freedesktop.org+penghao@dingdao.com>
Content-Type: multipart/alternative;
 boundary=edfdcbac36db9693c46f4a399aa407b44f8a8187747f5df14bc04c2a7b1d
Date: Mon, 30 Oct 2023 17:08:45 +0800
To: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] gpu/drm/drm_framebuffer.c: Add judgement for return value
 of drm_get_format_info().
From: =?utf-8?q?=E5=BD=AD=E6=98=8A?= <penghao@dingdao.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--edfdcbac36db9693c46f4a399aa407b44f8a8187747f5df14bc04c2a7b1d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi, Ville & all
Thanks for=C2=A0quick reply!
According to your reply, the *info has been checked info earlier, and I hav=
e read the code of framebuffer_check() and related drm_get_format_info() wh=
ich it calls, but unfortunatelly, I haven't seen=C2=A0 judgement(check) for=
 it. What I only found related with check=C2=A0is the sentence below (in *d=
rm_format_info() in drivers/gpu/drm/drm_fourcc.c)=EF=BC=9A
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

Looking forward to your reply and guidance.
> From: "Ville Syrj=C3=A4l=C3=A4"<ville.syrjala@linux.intel.com>
> Date:  Fri, Oct 27, 2023, 20:33
> Subject:  Re: [PATCH] gpu/drm/drm_framebuffer.c: Add judgement for return=
 value of drm_get_format_info().
> To: "Peng Hao"<penghao@dingdao.com>
> Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmerma=
nn@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>, <linux-kernel@vger.ker=
nel.org>, <dri-devel@lists.freedesktop.org>
> On Fri, Oct 27, 2023 at 05:19:12PM +0800, Peng Hao wrote:
> > Since drm_get_format_info() may return NULL,
>=20
> Not in this case since we already checked it earlier.
>=20
> > so a judgement of return
> > value is needed to add.
> >=20
> > Signed-off-by: Peng Hao <penghao@dingdao.com>
> > ---
> >  drivers/gpu/drm/drm_framebuffer.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fr=
amebuffer.c
> > index aff3746dedfb..be7dd1998c04 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -194,6 +194,10 @@ static int framebuffer_check(struct drm_device *de=
v,
> > =20
> >  	/* now let the driver pick its own format info */
> >  	info =3D drm_get_format_info(dev, r);
> > +	if (!info) {
> > +		drm_dbg_kms(dev, "no matched format info\n");
> > +		return -EFAULT;
> > +	}
> > =20
> >  	for (i =3D 0; i < info->num_planes; i++) {
> >  		unsigned int width =3D fb_plane_width(r->width, info, i);
> > --=20
> > 2.37.1
>=20
> --=20
> Ville Syrj=C3=A4l=C3=A4
> Intel

--edfdcbac36db9693c46f4a399aa407b44f8a8187747f5df14bc04c2a7b1d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div id=3D"editor_version_1.35.4_IdkxA2Ph" style=
=3D"word-break:break-word;"><div data-zone-id=3D"0" data-line-index=3D"0" d=
ata-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom:=
 4px; line-height: 1.6;">Hi, Ville &amp; all</div><div data-zone-id=3D"0" d=
ata-line-index=3D"1" data-line=3D"true" style=3D"font-size: 14px; margin-to=
p: 4px; margin-bottom: 4px; line-height: 1.6;">Thanks for=C2=A0quick reply!=
</div><div data-zone-id=3D"0" data-line-index=3D"2" data-line=3D"true" styl=
e=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6=
;">According to your reply, the *info has been checked info earlier, and I =
have read the code of framebuffer_check() and related drm_get_format_info()=
 which it calls, but unfortunatelly, I haven&#39;t seen=C2=A0 judgement(che=
ck) for it. What I only found related with check=C2=A0is the sentence below=
 (in *drm_format_info() in drivers/gpu/drm/drm_fourcc.c)=EF=BC=9A</div><div=
 data-zone-id=3D"0" data-line-index=3D"3" data-line=3D"true" style=3D"font-=
size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">```</di=
v><div data-zone-id=3D"0" data-line-index=3D"4" data-line=3D"true" style=3D=
"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">i=
nfo =3D __drm_format_info(format);</div><div data-zone-id=3D"0" data-line-i=
ndex=3D"5" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; ma=
rgin-bottom: 4px; line-height: 1.6;">WARN_ON(!info);</div><div data-zone-id=
=3D"0" data-line-index=3D"6" data-line=3D"true" style=3D"font-size: 14px; m=
argin-top: 4px; margin-bottom: 4px; line-height: 1.6;">```=C2=A0</div><div =
data-zone-id=3D"0" data-line-index=3D"7" data-line=3D"true" style=3D"font-s=
ize: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">But to t=
he best of my knowledge, &#34;WARN_ON&#34; only gives a dump_stack(), not=
=C2=A0 discontinue the program going on, so it will indeed go to the below =
line in framebuffer_check() and raise an error:</div><div data-zone-id=3D"0=
" data-line-index=3D"8" data-line=3D"true" style=3D"font-size: 14px; margin=
-top: 4px; margin-bottom: 4px; line-height: 1.6;">```</div><div data-zone-i=
d=3D"0" data-line-index=3D"9" data-line=3D"true" style=3D"font-size: 14px; =
margin-top: 4px; margin-bottom: 4px; line-height: 1.6;">for (i =3D 0; i &lt=
; info-&gt;num_planes; i++) {</div><div data-zone-id=3D"0" data-line-index=
=3D"10" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margi=
n-bottom: 4px; line-height: 1.6;">```</div><div data-zone-id=3D"0" data-lin=
e-index=3D"11" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px=
; margin-bottom: 4px; line-height: 1.6;">So maybe it will make=C2=A0 sense =
of my commited code.</div><div data-zone-id=3D"0" data-line-index=3D"12" da=
ta-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: =
4px; line-height: 1.6;"><br/></div><div data-zone-id=3D"0" data-line-index=
=3D"13" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margi=
n-bottom: 4px; line-height: 1.6;">Looking forward to your reply and guidanc=
e.</div></div><div class=3D"history-quote-wrapper" id=3D"lark-mail-quote-16=
9865692"><div style=3D"list-style-position: inside" data-mail-html-ignore=
=3D"" data-html-block=3D"quote"><div class=3D"adit-html-block adit-html-blo=
ck--collapsed" style=3D"border-left: none; padding-left: 0px;"><div><div cl=
ass=3D"adit-html-block__attr history-quote-meta-wrapper history-quote-gap-t=
ag" id=3D"lark-mail-meta-iluJYQH3A" style=3D"padding: 12px; background: rgb=
(245, 246, 247); color: rgb(31, 35, 41); border-radius: 4px; margin-top: 24=
px; margin-bottom: 12px;"><div id=3D"lark-mail-quote-be3d56183c0dd58949effc=
df7fab0549"><div style=3D"word-break: break-word;"><div style=3D""><span st=
yle=3D"white-space:nowrap;">From: </span><span style=3D"white-space: nowrap=
;">&#34;Ville Syrj=C3=A4l=C3=A4&#34;&lt;<a style=3D"overflow-wrap: break-wo=
rd; white-space: pre-wrap; hyphens: none; word-break: break-word; cursor: p=
ointer; text-decoration: none; color: inherit;" href=3D"mailto:ville.syrjal=
a@linux.intel.com" class=3D"quote-head-meta-mailto" data-mailto=3D"mailto:v=
ille.syrjala@linux.intel.com">ville.syrjala@linux.intel.com</a>&gt;</span><=
/div><div style=3D""><span style=3D"white-space:nowrap;">Date: </span> Fri,=
 Oct 27, 2023, 20:33</div><div style=3D""><span style=3D"white-space:nowrap=
;">Subject: </span> Re: [PATCH] gpu/drm/drm_framebuffer.c: Add judgement fo=
r return value of drm_get_format_info().</div><div style=3D""><span style=
=3D"white-space:nowrap;">To: </span><span style=3D"white-space: nowrap;">&#=
34;Peng Hao&#34;&lt;<a style=3D"overflow-wrap: break-word; white-space: pre=
-wrap; hyphens: none; word-break: break-word; cursor: pointer; text-decorat=
ion: none; color: inherit;" href=3D"mailto:penghao@dingdao.com" class=3D"qu=
ote-head-meta-mailto" data-mailto=3D"mailto:penghao@dingdao.com">penghao@di=
ngdao.com</a>&gt;</span></div><div style=3D""><span style=3D"white-space:no=
wrap;">Cc: </span><span style=3D"white-space: nowrap;">&lt;<a style=3D"over=
flow-wrap: break-word; white-space: pre-wrap; hyphens: none; word-break: br=
eak-word; cursor: pointer; text-decoration: none; color: inherit;" href=3D"=
mailto:maarten.lankhorst@linux.intel.com" class=3D"quote-head-meta-mailto" =
data-mailto=3D"mailto:maarten.lankhorst@linux.intel.com">maarten.lankhorst@=
linux.intel.com</a>&gt;</span>, <span style=3D"white-space: nowrap;">&lt;<a=
 style=3D"overflow-wrap: break-word; white-space: pre-wrap; hyphens: none; =
word-break: break-word; cursor: pointer; text-decoration: none; color: inhe=
rit;" href=3D"mailto:mripard@kernel.org" class=3D"quote-head-meta-mailto" d=
ata-mailto=3D"mailto:mripard@kernel.org">mripard@kernel.org</a>&gt;</span>,=
 <span style=3D"white-space: nowrap;">&lt;<a style=3D"overflow-wrap: break-=
word; white-space: pre-wrap; hyphens: none; word-break: break-word; cursor:=
 pointer; text-decoration: none; color: inherit;" href=3D"mailto:tzimmerman=
n@suse.de" class=3D"quote-head-meta-mailto" data-mailto=3D"mailto:tzimmerma=
nn@suse.de">tzimmermann@suse.de</a>&gt;</span>, <span style=3D"white-space:=
 nowrap;">&lt;<a style=3D"overflow-wrap: break-word; white-space: pre-wrap;=
 hyphens: none; word-break: break-word; cursor: pointer; text-decoration: n=
one; color: inherit;" href=3D"mailto:airlied@gmail.com" class=3D"quote-head=
-meta-mailto" data-mailto=3D"mailto:airlied@gmail.com">airlied@gmail.com</a=
>&gt;</span>, <span style=3D"white-space: nowrap;">&lt;<a style=3D"overflow=
-wrap: break-word; white-space: pre-wrap; hyphens: none; word-break: break-=
word; cursor: pointer; text-decoration: none; color: inherit;" href=3D"mail=
to:daniel@ffwll.ch" class=3D"quote-head-meta-mailto" data-mailto=3D"mailto:=
daniel@ffwll.ch">daniel@ffwll.ch</a>&gt;</span>, <span style=3D"white-space=
: nowrap;">&lt;<a style=3D"overflow-wrap: break-word; white-space: pre-wrap=
; hyphens: none; word-break: break-word; cursor: pointer; text-decoration: =
none; color: inherit;" href=3D"mailto:linux-kernel@vger.kernel.org" class=
=3D"quote-head-meta-mailto" data-mailto=3D"mailto:linux-kernel@vger.kernel.=
org">linux-kernel@vger.kernel.org</a>&gt;</span>, <span style=3D"white-spac=
e: nowrap;">&lt;<a style=3D"overflow-wrap: break-word; white-space: pre-wra=
p; hyphens: none; word-break: break-word; cursor: pointer; text-decoration:=
 none; color: inherit;" href=3D"mailto:dri-devel@lists.freedesktop.org" cla=
ss=3D"quote-head-meta-mailto" data-mailto=3D"mailto:dri-devel@lists.freedes=
ktop.org">dri-devel@lists.freedesktop.org</a>&gt;</span></div></div></div><=
/div><div><div data-type=3D"plainText" style=3D"white-space: pre-wrap"><spa=
n>On Fri, Oct 27, 2023 at 05:19:12PM +0800, Peng Hao wrote:
&gt; Since drm_get_format_info() may return NULL,

Not in this case since we already checked it earlier.

&gt; so a judgement of return
&gt; value is needed to add.
&gt;=20
&gt; Signed-off-by: Peng Hao &lt;<a href=3D"mailto:penghao@dingdao.com" tar=
get=3D"_blank" ref=3D"noopener noreferrer">penghao@dingdao.com</a>&gt;
&gt; ---
&gt;  drivers/gpu/drm/drm_framebuffer.c | 4 ++++
&gt;  1 file changed, 4 insertions(+)
&gt;=20
&gt; diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_f=
ramebuffer.c
&gt; index aff3746dedfb..be7dd1998c04 100644
&gt; --- a/drivers/gpu/drm/drm_framebuffer.c
&gt; +++ b/drivers/gpu/drm/drm_framebuffer.c
&gt; @@ -194,6 +194,10 @@ static int framebuffer_check(struct drm_device *d=
ev,
&gt; =20
&gt;  	/* now let the driver pick its own format info */
&gt;  	info =3D drm_get_format_info(dev, r);
&gt; +	if (!info) {
&gt; +		drm_dbg_kms(dev, &#34;no matched format info\n&#34;);
&gt; +		return -EFAULT;
&gt; +	}
&gt; =20
&gt;  	for (i =3D 0; i &lt; info-&gt;num_planes; i++) {
&gt;  		unsigned int width =3D fb_plane_width(r-&gt;width, info, i);
&gt; --=20
&gt; 2.37.1

--=20
Ville Syrj=C3=A4l=C3=A4
Intel</span></div></div></div></div></div></div></body></html>
--edfdcbac36db9693c46f4a399aa407b44f8a8187747f5df14bc04c2a7b1d--
