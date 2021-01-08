Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C52EEB0E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC2789C6E;
	Fri,  8 Jan 2021 01:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F24189C6E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:47:13 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m25so19153277lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZxL3+je1NSV6woTHci+B4W89aIv+lfAiXbpBbR8SMjQ=;
 b=UUD/9qxMtsnsshJ+iDgCtjlr+LJM0x/3OQnsg+Uspf6Y4mFvgayEsmYP8/m1Glyts6
 CdUyN7Haj5Ckn2foLWvZVCpicGLjY55NqUCRWJ3Ya8JOG03XR9RAORwNl96oBms9K04r
 pw7ucMQFbmzpH6cvjR3phCD1LTSK32e0W985o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZxL3+je1NSV6woTHci+B4W89aIv+lfAiXbpBbR8SMjQ=;
 b=QzmZ3ucacc6OXkpgSVTc6x9FdInFgUitkc+EJ0OUleyPfpude6jCXBSmyzDrm63Nif
 thwZkCYu5K7chPxE5jE4n5RTqrD1vbX/kZTOg6wg54lfQnclYs5jCK2QkXHPofVGw7Qz
 KkW2vOQWB+LCFWn/qRkGGeyiGk2riIXzkdv2uld2WGB+Q8WTYbvLcmdwA4rwvef0R7hd
 Dbffs21SIiBDQs/ild08AY4o2B6sJ3T3WP672VV0c/4fYRhjqMhUqEgtiz9n0f/f2x/L
 /BiXGYWf1CeDDhmiJ6Wf0mIm+yuT2arYX7zVcHXF2wrRom1KdIUP36pW91Q1YRnXe/Qb
 z/Lg==
X-Gm-Message-State: AOAM531lPKolQSIh3/eXrd23o7Mx8KJtg4W000XkSGcIgFbfrzQ13cec
 mhlJXMt/9IhNnDTnGq2uQw0+5qzStpwWdA==
X-Google-Smtp-Source: ABdhPJxtMvvdVMNPScJeo7wJ/wvqMMcDZ3qay3T/isS9chit9fTTfeHgE3JHGW7/LdYgtZLFB4Mzgg==
X-Received: by 2002:a19:3f12:: with SMTP id m18mr568084lfa.519.1610070431262; 
 Thu, 07 Jan 2021 17:47:11 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id c14sm1542453lfd.186.2021.01.07.17.47.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 17:47:10 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id l11so19366330lfg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:47:10 -0800 (PST)
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr667681lfo.145.1610070430334; 
 Thu, 07 Jan 2021 17:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20210107210726.269584-1-olvaffe@gmail.com>
In-Reply-To: <20210107210726.269584-1-olvaffe@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 7 Jan 2021 17:46:58 -0800
X-Gmail-Original-Message-ID: <CAAfnVBm16mYG+fZrQp+gW6YZHcNBWRxbom6-L8Gxz273mjK4dw@mail.gmail.com>
Message-ID: <CAAfnVBm16mYG+fZrQp+gW6YZHcNBWRxbom6-L8Gxz273mjK4dw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: make sure context is created in gem open
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0599167135=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0599167135==
Content-Type: multipart/alternative; boundary="00000000000010a6fd05b859bc70"

--00000000000010a6fd05b859bc70
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 1:07 PM Chia-I Wu <olvaffe@gmail.com> wrote:

> The context might still be missing when DRM_IOCTL_PRIME_FD_TO_HANDLE is
> the first ioctl on the drm_file.
>
> Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context after
> the first 3D ioctl")
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c
> b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index c30c75ee83fc..8502400b2f9c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -39,9 +39,6 @@ static int virtio_gpu_gem_create(struct drm_file *file,
>         int ret;
>         u32 handle;
>
> -       if (vgdev->has_virgl_3d)
> -               virtio_gpu_create_context(dev, file);
> -
>         ret = virtio_gpu_object_create(vgdev, params, &obj, NULL);
>         if (ret < 0)
>                 return ret;
> @@ -119,6 +116,11 @@ int virtio_gpu_gem_object_open(struct drm_gem_object
> *obj,
>         if (!vgdev->has_virgl_3d)
>                 goto out_notify;
>
> +       /* the context might still be missing when the first ioctl is
> +        * DRM_IOCTL_MODE_CREATE_DUMB or DRM_IOCTL_PRIME_FD_TO_HANDLE
> +        */
> +       virtio_gpu_create_context(obj->dev, file);
> +
>         objs = virtio_gpu_array_alloc(1);
>         if (!objs)
>                 return -ENOMEM;
> --
> 2.29.2.729.g45daf8777d-goog
>
> Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>

--00000000000010a6fd05b859bc70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 1:07 PM Chia-I=
 Wu &lt;<a href=3D"mailto:olvaffe@gmail.com">olvaffe@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The context m=
ight still be missing when DRM_IOCTL_PRIME_FD_TO_HANDLE is<br>
the first ioctl on the drm_file.<br>
<br>
Fixes: 72b48ae800da (&quot;drm/virtio: enqueue virtio_gpu_create_context af=
ter the first 3D ioctl&quot;)<br>
Cc: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org" targ=
et=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Signed-off-by: Chia-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" target=3D=
"_blank">olvaffe@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_gem.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/=
virtgpu_gem.c<br>
index c30c75ee83fc..8502400b2f9c 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
@@ -39,9 +39,6 @@ static int virtio_gpu_gem_create(struct drm_file *file,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 handle;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vgdev-&gt;has_virgl_3d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_create_c=
ontext(dev, file);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D virtio_gpu_object_create(vgdev, params,=
 &amp;obj, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
@@ -119,6 +116,11 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *=
obj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vgdev-&gt;has_virgl_3d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_notify;<br=
>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* the context might still be missing when the =
first ioctl is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * DRM_IOCTL_MODE_CREATE_DUMB or DRM_IOCTL_PRIM=
E_FD_TO_HANDLE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_create_context(obj-&gt;dev, file);<b=
r>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 objs =3D virtio_gpu_array_alloc(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!objs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
-- <br>
2.29.2.729.g45daf8777d-goog<br>
<br></blockquote><div>Reviewed-by: Gurchetan Singh &lt;<a href=3D"mailto:gu=
rchetansingh@chromium.org">gurchetansingh@chromium.org</a>&gt;<br></div><di=
v>=C2=A0</div></div></div>

--00000000000010a6fd05b859bc70--

--===============0599167135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0599167135==--
