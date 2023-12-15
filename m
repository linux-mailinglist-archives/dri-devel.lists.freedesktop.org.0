Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAA8140DE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 05:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B6E10E310;
	Fri, 15 Dec 2023 04:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAD110E310
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 04:04:26 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4b2e50b58ffso54228e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702613065; x=1703217865; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t0vkBHNkl9s9IG29nB8l45kmYN9xxfHGULgMolF3khM=;
 b=fcJnXE6CfYOKoqjSnvXvdv8ar9yKYB5u8hr5sA/HeIQu3C6uaC/Or0cNpeEDDd/ZX/
 RN4EE3x18CdWT9nIe+9yCq1gvH37QPeDQByTcHkt5rBAKBsvGF78PhFPUSZVmdI5228+
 qaouH/OMrwNAOYyiL/1zBYD+N5XtNJ3dA1eTJLhXBsjYH6CZo3pOBCS6pQ/kEjHpzZqz
 AxAPETFprVwvB/XYWdZZQYCA9ceomtAnEcLN1g/p/Sd1PCgdHzVaqI43elmXSX8bSLzY
 yOLAuDYYKyQnzK++i6hASx9VF/rpT20AwBMwWHcXqPDIeHj/FIgFHLWSBdsIPgFeYRg2
 G9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702613065; x=1703217865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t0vkBHNkl9s9IG29nB8l45kmYN9xxfHGULgMolF3khM=;
 b=gSE/a1eJU47zI7fpPPcUUZsDPEGh82gVXeE+VNiMJWV0vjXHByu8DZOzxiKE1PnJSb
 0Ox+1Kk0Nfg0qsywyZgjagMzJE3gU6LxmsY3SoW/8RfsA4SdLEdDI6juNTQMdNCLJbIv
 BBXjXsIxcSTbZVJ6kdGs8JAR+ZkAFVgCJwAf3IrckihmyvOXCz2iZwRTvrMxUu07+4YT
 Tsk8XbaEGy8vhnSERin3/98u+gfuDgEYDVDiQMjQmlYPFR935dshN4Ypir/UumXOBfAx
 ezWoRCjgY7uyDubAQ2F0tNWFFbJavokqZgUSDypLQihDG1J8sK1hbjqdAuSDFcJ9+nG6
 LlgA==
X-Gm-Message-State: AOJu0Yw1IyEOtCefGExon6Xlq2xF00PgHrnD5i7A1P0aYUiUsxw9uDoU
 IvU7t7tK9ek6Gpt/10d3OKWOhMmGJFZRQNFN+4s=
X-Google-Smtp-Source: AGHT+IFracEO+G1e9ztg/EO/+QZcNrPu2wjlT95JBy75Utabm+ORxBzKUeZY9vJy68jVV1iy9LgtdpPOrtEhi5fEicw=
X-Received: by 2002:a05:6102:6cb:b0:461:fb:1d6c with SMTP id
 m11-20020a05610206cb00b0046100fb1d6cmr5480983vsg.5.1702613065350; Thu, 14 Dec
 2023 20:04:25 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231214123248eucas1p1577bc2064401fce57a752234e1338f5a@eucas1p1.samsung.com>
 <20231214123237.1727428-1-arnd@kernel.org>
 <699636b7-d737-4df4-92e9-43b0f52d4b99@samsung.com>
In-Reply-To: <699636b7-d737-4df4-92e9-43b0f52d4b99@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 15 Dec 2023 13:04:13 +0900
Message-ID: <CAAQKjZNxnRJwed7XSYO3a4EVDgRYxupQBasmW=nDWjd7B=i5Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix accidental on-stack copy of
 exynos_drm_plane
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/alternative; boundary="000000000000f3460f060c847e9f"
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Steven Price <steven.price@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f3460f060c847e9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 12=EC=9B=94 15=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 12:59,=
 Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1:

> On 14.12.2023 13:32, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > gcc rightfully complains about excessive stack usage in the
> fimd_win_set_pixfmt()
> > function:
> >
> > drivers/gpu/drm/exynos/exynos_drm_fimd.c: In function
> 'fimd_win_set_pixfmt':
> > drivers/gpu/drm/exynos/exynos_drm_fimd.c:750:1: error: the frame size o=
f
> 1032 bytes is larger than 1024 byte
> > drivers/gpu/drm/exynos/exynos5433_drm_decon.c: In function
> 'decon_win_set_pixfmt':
> > drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:1: error: the frame
> size of 1032 bytes is larger than 1024 bytes
> >
> > There is really no reason to copy the large exynos_drm_plane
> > structure to the stack before using one of its members, so just
> > use a pointer instead.
> >
> > Fixes: 6f8ee5c21722 ("drm/exynos: fimd: Make plane alpha configurable")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>
> Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
>

Thanks,
Inki Dae

>
>
> > ---
> >   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
> >   drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> > index 4d986077738b..bce027552474 100644
> > --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> > +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> > @@ -319,9 +319,9 @@ static void decon_win_set_bldmod(struct
> decon_context *ctx, unsigned int win,
> >   static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned
> int win,
> >                                struct drm_framebuffer *fb)
> >   {
> > -     struct exynos_drm_plane plane =3D ctx->planes[win];
> > +     struct exynos_drm_plane *plane =3D &ctx->planes[win];
> >       struct exynos_drm_plane_state *state =3D
> > -             to_exynos_plane_state(plane.base.state);
> > +             to_exynos_plane_state(plane->base.state);
> >       unsigned int alpha =3D state->base.alpha;
> >       unsigned int pixel_alpha;
> >       unsigned long val;
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > index 8dde7b1e9b35..5bdc246f5fad 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -661,9 +661,9 @@ static void fimd_win_set_bldmod(struct fimd_context
> *ctx, unsigned int win,
> >   static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned in=
t
> win,
> >                               struct drm_framebuffer *fb, int width)
> >   {
> > -     struct exynos_drm_plane plane =3D ctx->planes[win];
> > +     struct exynos_drm_plane *plane =3D &ctx->planes[win];
> >       struct exynos_drm_plane_state *state =3D
> > -             to_exynos_plane_state(plane.base.state);
> > +             to_exynos_plane_state(plane->base.state);
> >       uint32_t pixel_format =3D fb->format->format;
> >       unsigned int alpha =3D state->base.alpha;
> >       u32 val =3D WINCONx_ENWIN;
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>

--000000000000f3460f060c847e9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 12=EC=9B=94 15=EC=9D=BC (=EA=B8=88) =EC=
=98=A4=EC=A0=84 12:59, Marek Szyprowski &lt;<a href=3D"mailto:m.szyprowski@=
samsung.com">m.szyprowski@samsung.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 14.12.2023 13:32, Arn=
d Bergmann wrote:<br>
&gt; From: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_bl=
ank" rel=3D"noreferrer">arnd@arndb.de</a>&gt;<br>
&gt;<br>
&gt; gcc rightfully complains about excessive stack usage in the fimd_win_s=
et_pixfmt()<br>
&gt; function:<br>
&gt;<br>
&gt; drivers/gpu/drm/exynos/exynos_drm_fimd.c: In function &#39;fimd_win_se=
t_pixfmt&#39;:<br>
&gt; drivers/gpu/drm/exynos/exynos_drm_fimd.c:750:1: error: the frame size =
of 1032 bytes is larger than 1024 byte<br>
&gt; drivers/gpu/drm/exynos/exynos5433_drm_decon.c: In function &#39;decon_=
win_set_pixfmt&#39;:<br>
&gt; drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:1: error: the frame =
size of 1032 bytes is larger than 1024 bytes<br>
&gt;<br>
&gt; There is really no reason to copy the large exynos_drm_plane<br>
&gt; structure to the stack before using one of its members, so just<br>
&gt; use a pointer instead.<br>
&gt;<br>
&gt; Fixes: 6f8ee5c21722 (&quot;drm/exynos: fimd: Make plane alpha configur=
able&quot;)<br>
&gt; Signed-off-by: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" targ=
et=3D"_blank" rel=3D"noreferrer">arnd@arndb.de</a>&gt;<br>
<br>
<br>
Reviewed-by: Marek Szyprowski &lt;<a href=3D"mailto:m.szyprowski@samsung.co=
m" target=3D"_blank" rel=3D"noreferrer">m.szyprowski@samsung.com</a>&gt;<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks,</div><div dir=3D"auto">Inki Dae</div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c=C2=A0 =C2=A0 =C2=
=A0 | 4 ++--<br>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/g=
pu/drm/exynos/exynos5433_drm_decon.c<br>
&gt; index 4d986077738b..bce027552474 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c<br>
&gt; @@ -319,9 +319,9 @@ static void decon_win_set_bldmod(struct decon_cont=
ext *ctx, unsigned int win,<br>
&gt;=C2=A0 =C2=A0static void decon_win_set_pixfmt(struct decon_context *ctx=
, unsigned int win,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_framebuffer *fb)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct exynos_drm_plane plane =3D ctx-&gt;planes[=
win];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct exynos_drm_plane *plane =3D &amp;ctx-&gt;p=
lanes[win];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct exynos_drm_plane_state *state =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_exynos_plane_state=
(plane.base.state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_exynos_plane_state=
(plane-&gt;base.state);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int alpha =3D state-&gt;base.alpha;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int pixel_alpha;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long val;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/dr=
m/exynos/exynos_drm_fimd.c<br>
&gt; index 8dde7b1e9b35..5bdc246f5fad 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; @@ -661,9 +661,9 @@ static void fimd_win_set_bldmod(struct fimd_contex=
t *ctx, unsigned int win,<br>
&gt;=C2=A0 =C2=A0static void fimd_win_set_pixfmt(struct fimd_context *ctx, =
unsigned int win,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb, int wi=
dth)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct exynos_drm_plane plane =3D ctx-&gt;planes[=
win];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct exynos_drm_plane *plane =3D &amp;ctx-&gt;p=
lanes[win];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct exynos_drm_plane_state *state =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_exynos_plane_state=
(plane.base.state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_exynos_plane_state=
(plane-&gt;base.state);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t pixel_format =3D fb-&gt;format-&gt;=
format;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int alpha =3D state-&gt;base.alpha;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D WINCONx_ENWIN;<br>
<br>
Best regards<br>
-- <br>
Marek Szyprowski, PhD<br>
Samsung R&amp;D Institute Poland<br>
<br>
</blockquote></div></div></div>

--000000000000f3460f060c847e9f--
