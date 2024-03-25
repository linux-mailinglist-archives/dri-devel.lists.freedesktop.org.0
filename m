Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E288B5D9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 01:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A582F10EBAC;
	Tue, 26 Mar 2024 00:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ti06sSPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7BC10EB38
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 22:35:32 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-428405a0205so56291cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 15:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711406131; x=1712010931;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z9O2hLUchEVVeuKfLPpnhfBdXDSt1ojBd1rzB6Oq1DE=;
 b=Ti06sSPetpwl5KB4gOiZlp+OD80z+BMevAEdzqpvu4xSAwKDEZPZ5NrcpXiFGknN+i
 C7bAH1kf4OycnJq7wtoQXDE/sPbRzrOO8zJqxERuy9IgyVIjHs0xZYlaaq9/hXOXGG58
 q+IL2tYFmkQnWMU2/lL+z0XbhiNg8yTQex6pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406131; x=1712010931;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z9O2hLUchEVVeuKfLPpnhfBdXDSt1ojBd1rzB6Oq1DE=;
 b=Af9MnkxF2BvG1zK5zvG4/bd7ak94FYqzxNIQcAKm0BuVOX//hCePjiP5F7jxd5sj2B
 O+l3cygVCPXhv2jYZYlfrIQIveL5eygB1RIeNF69jtvU6rloZCcypenyWaJu5cz6/cW+
 MNeGBDlSWJCOaIAjAjDFcc+n0nkwxz5R64Knmxfoxuf2ooeU4IrhFWVq+2bYgQJnG/Rs
 fAqk8PQrgyDNlfpmLx1vEUzfcTNncB9wRPfDHKqG8OOTtvGPQvbOpXZlz1zn7eUzETtz
 xFPlMhQ1YUsH2SH2qunHq3dEgRwxhW11yIcOItWzevcvvJIQS8IsxY2PsQI/ui1hrBPr
 49OA==
X-Gm-Message-State: AOJu0YyfaCjHxHiqZAX529UiO/VC+/mm0ktAw3ZnBISdr1dFglj3BxCc
 Yq2fbn2Rz5djEsFUArQO5uDNRQrZs6ZBLueQ4lTPcn8JKbQ3NJjBLUUJgk5BoUkI4Ghm7g/EZYP
 OToCazXi3GCEWZ6T6OX1nQRfluKoeREapS0gI
X-Google-Smtp-Source: AGHT+IF3UeSx9WrvmsztbAdy0WfGEM5UslvDm6a69zl+U91zSEPIjIiXW9ZsS8+kS5LPMH8ZCSkvpRCNm40CVVhi6nE=
X-Received: by 2002:a05:622a:17cc:b0:431:5fcb:4fba with SMTP id
 u12-20020a05622a17cc00b004315fcb4fbamr49764qtk.24.1711406130647; Mon, 25 Mar
 2024 15:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240322214801.319975-1-robdclark@gmail.com>
In-Reply-To: <20240322214801.319975-1-robdclark@gmail.com>
From: Dominik Behr <dbehr@chromium.org>
Date: Mon, 25 Mar 2024 15:35:17 -0700
Message-ID: <CABUrSUAykXUoX0y6jzCw1s=E=E08Z54Ygo1TvBm49_iT88oDFg@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Dominik Behr <dbehr@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Ser <contact@emersion.fr>, open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007c1e2d061483cad8"
X-Mailman-Approved-At: Tue, 26 Mar 2024 00:13:32 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007c1e2d061483cad8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It also fixes importing virtgpu blobs into real hardware, for instance
amdgpu for DRI_PRIME rendering.

On Fri, Mar 22, 2024 at 2:48=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:

> From: Rob Clark <robdclark@chromium.org>
>
> virtgpu "vram" GEM objects do not implement obj->get_sg_table().  But
> they also don't use drm_gem_map_dma_buf().  In fact they may not even
> have guest visible pages.  But it is perfectly fine to export and share
> with other virtual devices.
>
> Reported-by: Dominik Behr <dbehr@chromium.org>
> Fixes: 207395da5a97 ("drm/prime: reject DMA-BUF attach when get_sg_table
> is missing")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_prime.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 7352bde299d5..64dd6276e828 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -582,7 +582,12 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
>  {
>         struct drm_gem_object *obj =3D dma_buf->priv;
>
> -       if (!obj->funcs->get_sg_table)
> +       /*
> +        * drm_gem_map_dma_buf() requires obj->get_sg_table(), but driver=
s
> +        * that implement their own ->map_dma_buf() do not.
> +        */
> +       if ((dma_buf->ops->map_dma_buf =3D=3D drm_gem_map_dma_buf) &&
> +           !obj->funcs->get_sg_table)
>                 return -ENOSYS;
>
>         return drm_gem_pin(obj);
> --
> 2.44.0
>
>

--0000000000007c1e2d061483cad8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It also fixes importing virtgpu=C2=A0blobs into real hardw=
are, for instance amdgpu for DRI_PRIME rendering.<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 22, 2024=
 at 2:48=E2=80=AFPM Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com">ro=
bdclark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.o=
rg" target=3D"_blank">robdclark@chromium.org</a>&gt;<br>
<br>
virtgpu &quot;vram&quot; GEM objects do not implement obj-&gt;get_sg_table(=
).=C2=A0 But<br>
they also don&#39;t use drm_gem_map_dma_buf().=C2=A0 In fact they may not e=
ven<br>
have guest visible pages.=C2=A0 But it is perfectly fine to export and shar=
e<br>
with other virtual devices.<br>
<br>
Reported-by: Dominik Behr &lt;<a href=3D"mailto:dbehr@chromium.org" target=
=3D"_blank">dbehr@chromium.org</a>&gt;<br>
Fixes: 207395da5a97 (&quot;drm/prime: reject DMA-BUF attach when get_sg_tab=
le is missing&quot;)<br>
Signed-off-by: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" targ=
et=3D"_blank">robdclark@chromium.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_prime.c | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c<br>
index 7352bde299d5..64dd6276e828 100644<br>
--- a/drivers/gpu/drm/drm_prime.c<br>
+++ b/drivers/gpu/drm/drm_prime.c<br>
@@ -582,7 +582,12 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D dma_buf-&gt;priv=
;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj-&gt;funcs-&gt;get_sg_table)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * drm_gem_map_dma_buf() requires obj-&gt;get_s=
g_table(), but drivers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * that implement their own -&gt;map_dma_buf() =
do not.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((dma_buf-&gt;ops-&gt;map_dma_buf =3D=3D drm=
_gem_map_dma_buf) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!obj-&gt;funcs-&gt;get_sg_table)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return drm_gem_pin(obj);<br>
-- <br>
2.44.0<br>
<br>
</blockquote></div>

--0000000000007c1e2d061483cad8--
