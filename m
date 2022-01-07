Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D06487F6B
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 00:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC0510E690;
	Fri,  7 Jan 2022 23:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4E510E690
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 23:34:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m21so28033505edc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 15:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6RfbULMQmWmI8HuUvl95Pjwv+4zm3q8U8akXNuzZLEg=;
 b=RGMCxHiZetzlQvKF2rsRndOID7+6Rmk9zDeA5A0s7bkW3YTvMYXdRn2nn/bxkYFIcM
 QDyBuXLNTr2ri3J119Hpet5XmWpxnsAYs98RyVbsqaCsg0rOm502dHJscJ9grwtCLM0D
 Zfqbjcr/kXXb8rnKx5uX2qcVS+eEvmrjfBd9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6RfbULMQmWmI8HuUvl95Pjwv+4zm3q8U8akXNuzZLEg=;
 b=6CTrtJmkEpiYV11Y21LJ1I3BlgkgJBcPM2xKGieBbGNRpCqZnzR74buWb8iCM9hS1Z
 0iLD1sPWFP8E8lohcaZY0A4I1LiN/c9C8rtzerj/Ij3b9r0v1nqCaS7FYKqQ0qtNYY5J
 JYE90+bPGwHkY6GUApQ7ZyUXGVEz/LRAat8vZEMPwG2tzFbycZFk4ZwIoDaR284+ibzR
 2nsdF1OSRABHjWbV7o3tV1MpMsXX3/IsDJePg1ID0LvM0ZAkFFkqzDkPn3lCHBqJ1KKd
 1bn9EwvTelJXiqrJq+7hbIjY7WZ76tx8RyJyDzrcRAEeR8IMMv5FFutQxz0lG6QLnBVP
 P/yA==
X-Gm-Message-State: AOAM530WnSH/D+rVP1o7pxtFn/GGCw5yhJwsJ7XsIDi25tb5yOfjYzuv
 /HeIyNLhybqBlXRy+0WA+sp0B/xc1dDvoQ==
X-Google-Smtp-Source: ABdhPJxgurP735Rh+4EVPQcouuFlI4Qlgwfg0QQsbTuDt9Ne2MhSTXYA+BSt/UIlkYtBqBSI+0FPfQ==
X-Received: by 2002:a05:6402:154a:: with SMTP id
 p10mr2709134edx.20.1641598491769; 
 Fri, 07 Jan 2022 15:34:51 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id ot19sm22089ejb.63.2022.01.07.15.34.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 15:34:51 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id q8so13793745wra.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 15:34:51 -0800 (PST)
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr56873454wrz.513.1641598490665; 
 Fri, 07 Jan 2022 15:34:50 -0800 (PST)
MIME-Version: 1.0
References: <20211222072649.18169-1-linmq006@gmail.com>
In-Reply-To: <20211222072649.18169-1-linmq006@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 7 Jan 2022 15:34:38 -0800
X-Gmail-Original-Message-ID: <CAAfnVBn-VFzjQ8A+mYJF9=O-NeSFRS+4j36bBPohBD5QBzLf4g@mail.gmail.com>
Message-ID: <CAAfnVBn-VFzjQ8A+mYJF9=O-NeSFRS+4j36bBPohBD5QBzLf4g@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix NULL vs IS_ERR checking in
 virtio_gpu_object_shmem_init
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e70cda05d5066ed0"
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e70cda05d5066ed0
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 21, 2021 at 11:26 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> Since drm_prime_pages_to_sg() function return error pointers.
> The drm_gem_shmem_get_sg_table() function returns error pointers too.
> Using IS_ERR() to check the return value to fix this.
>
> Fixes: f651c8b05542("drm/virtio: factor out the sg_table from
> virtio_gpu_object")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>

Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>


> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index f648b0e24447..8bb80289672c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -168,9 +168,9 @@ static int virtio_gpu_object_shmem_init(struct
> virtio_gpu_device *vgdev,
>          * since virtio_gpu doesn't support dma-buf import from other
> devices.
>          */
>         shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
> -       if (!shmem->pages) {
> +       if (IS_ERR(shmem->pages)) {
>                 drm_gem_shmem_unpin(&bo->base.base);
> -               return -EINVAL;
> +               return PTR_ERR(shmem->pages);
>         }
>
>         if (use_dma_api) {
> --
> 2.17.1
>
>

--000000000000e70cda05d5066ed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 21, 2021 at 11:26 PM Miao=
qian Lin &lt;<a href=3D"mailto:linmq006@gmail.com">linmq006@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since =
drm_prime_pages_to_sg() function return error pointers.<br>
The drm_gem_shmem_get_sg_table() function returns error pointers too.<br>
Using IS_ERR() to check the return value to fix this.<br>
<br>
Fixes: f651c8b05542(&quot;drm/virtio: factor out the sg_table from virtio_g=
pu_object&quot;)<br>
Signed-off-by: Miaoqian Lin &lt;<a href=3D"mailto:linmq006@gmail.com" targe=
t=3D"_blank">linmq006@gmail.com</a>&gt;<br></blockquote><div><br></div>Revi=
ewed-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org"=
>gurchetansingh@chromium.org</a>&gt;<br><div>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virt=
io/virtgpu_object.c<br>
index f648b0e24447..8bb80289672c 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_object.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>
@@ -168,9 +168,9 @@ static int virtio_gpu_object_shmem_init(struct virtio_g=
pu_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since virtio_gpu doesn&#39;t support dm=
a-buf import from other devices.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 shmem-&gt;pages =3D drm_gem_shmem_get_sg_table(=
&amp;bo-&gt;base.base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!shmem-&gt;pages) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(shmem-&gt;pages)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_gem_shmem_unpin=
(&amp;bo-&gt;base.base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(shme=
m-&gt;pages);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (use_dma_api) {<br>
-- <br>
2.17.1<br>
<br></blockquote><div><br></div><div>=C2=A0</div></div></div>

--000000000000e70cda05d5066ed0--
