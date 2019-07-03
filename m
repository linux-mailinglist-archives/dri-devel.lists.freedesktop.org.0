Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181BC5D88B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 02:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974E06E0AC;
	Wed,  3 Jul 2019 00:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9B6E0AC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 00:09:01 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i21so427184ljj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 17:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNtFYT8BtuomxlUg8xi3fcZO+B51JPnYiNYJzEJDncg=;
 b=faV6Wyma83KPU0gnRcxOwXOpa4SATku/waoptQ1pWI9y6U+VUUnbc4rJrsapyeXfRz
 xsPNHkcUuT1fxBW2VzxxGJ5jbvLx+taWDEgvtzeB2qk3noC0VfvZGTc3uONrg16c3oYI
 1mc9+9+ObywEHxPmycvXlVv/mwvupFgEaInZEBZH0YVJid/1/U1FyzlSbeS8konN4a4n
 VGO6gMIQhWAz/khiHo0KM2vuxCj4tmpBz2QPK4CTif8+feYjKOV1g5a8Rt2mN4kf1tct
 dKe13m30+q2SlPsFxe+1HAeqeuhqKp0ToU9bdNpFRyl1+l5Wt+cvaNqSbhukYbech6aM
 Emdg==
X-Gm-Message-State: APjAAAXlcWFK6AhDm1UaKeEMTM3BEMFprClhtqsPlbwS00OCWPrCTFiR
 utQF7YeYvQ/UGwxsIEJQRGVbsg1e5so=
X-Google-Smtp-Source: APXvYqwY4jWZVDdAD53biV8aLzei/X/3wMn1iUWX2ADY6mcBj9qZkGSrfF+H1uiq9vKA+wcATWh0vw==
X-Received: by 2002:a2e:824f:: with SMTP id j15mr19355822ljh.117.1562112539139; 
 Tue, 02 Jul 2019 17:08:59 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id o187sm85791lfa.88.2019.07.02.17.08.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 17:08:58 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id y17so409294lfe.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 17:08:58 -0700 (PDT)
X-Received: by 2002:ac2:4904:: with SMTP id n4mr15335267lfi.53.1562112537990; 
 Tue, 02 Jul 2019 17:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-17-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-17-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 2 Jul 2019 17:08:46 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmKotCfkrM4hph4++FDrVUYR8WKpomP7Y0-aergqHTSyA@mail.gmail.com>
Message-ID: <CAAfnVBmKotCfkrM4hph4++FDrVUYR8WKpomP7Y0-aergqHTSyA@mail.gmail.com>
Subject: Re: [PATCH v6 16/18] drm/virtio: rework
 virtio_gpu_cmd_context_{attach, detach}_resource
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BNtFYT8BtuomxlUg8xi3fcZO+B51JPnYiNYJzEJDncg=;
 b=Jx65H2/774HktKAbFgWzzuwGMwxdjrFJrGb/QkrCwJqTfb9yUofmDRnIhLmF4e83D4
 d9tZr1Gi2lf6fulyJGfuU1g5fk9/bkPHQKWeEc7dU2NPlQOwoikY3ierthSQEGobmKd6
 sDr9PABi9LQPFtQcUd+o6grnz9VXjUo/sqXWE=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1897961369=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1897961369==
Content-Type: multipart/alternative; boundary="000000000000ed7192058cbbaa00"

--000000000000ed7192058cbbaa00
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 2, 2019 at 7:19 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Switch to the virtio_gpu_array_* helper workflow.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h |  4 ++--
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 24 +++++++++++-------------
>  drivers/gpu/drm/virtio/virtgpu_vq.c  | 10 ++++++----
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index b1f63a21abb6..d99c54abd090 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -292,10 +292,10 @@ void virtio_gpu_cmd_context_destroy(struct
> virtio_gpu_device *vgdev,
>                                     uint32_t id);
>  void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device
> *vgdev,
>                                             uint32_t ctx_id,
> -                                           uint32_t resource_id);
> +                                           struct virtio_gpu_object_array
> *objs);
>  void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device
> *vgdev,
>                                             uint32_t ctx_id,
> -                                           uint32_t resource_id);
> +                                           struct virtio_gpu_object_array
> *objs);
>  void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
>                            void *data, uint32_t data_size,
>                            uint32_t ctx_id,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c
> b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 6baf64141645..e75819dbba80 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -111,19 +111,18 @@ int virtio_gpu_gem_object_open(struct drm_gem_object
> *obj,
>  {
>         struct virtio_gpu_device *vgdev = obj->dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> -       struct virtio_gpu_object *qobj = gem_to_virtio_gpu_obj(obj);
> -       int r;
> +       struct virtio_gpu_object_array *objs;
>
>         if (!vgdev->has_virgl_3d)
>                 return 0;
>
> -       r = virtio_gpu_object_reserve(qobj);
> -       if (r)
> -               return r;
> +       objs = virtio_gpu_array_alloc(1);
> +       if (!objs)
> +               return -ENOMEM;
> +       virtio_gpu_array_add_obj(objs, obj);
>
>         virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
> -                                              qobj->hw_res_handle);
> -       virtio_gpu_object_unreserve(qobj);
> +                                              objs);
>         return 0;
>  }
>
> @@ -132,19 +131,18 @@ void virtio_gpu_gem_object_close(struct
> drm_gem_object *obj,
>  {
>         struct virtio_gpu_device *vgdev = obj->dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> -       struct virtio_gpu_object *qobj = gem_to_virtio_gpu_obj(obj);
> -       int r;
> +       struct virtio_gpu_object_array *objs;
>
>         if (!vgdev->has_virgl_3d)
>                 return;
>
> -       r = virtio_gpu_object_reserve(qobj);
> -       if (r)
> +       objs = virtio_gpu_array_alloc(1);
> +       if (!objs)
>                 return;
> +       virtio_gpu_array_add_obj(objs, obj);
>

This seems to call drm_gem_object_get.  Without adding the objects to the
vbuf, aren't we missing the corresponding drm_gem_object_put_unlocked?

Some miscellaneous comments:
1) Maybe virtio_gpu_array can have it's own header and file?  virtgpu_drv.h
is getting rather big..
2) What data are you trying to protect with the additional references?  Is
it host side resources (i.e, the host GL texture or buffer object) or is it
guest side resources (fences)?  Guest side resources seem properly counted
to me.  GL is supposed to reference count pending resources as well, but
that's not always the case in practice.  A little blurb somewhere like
"hold on to 3D GEM buffers until the host response as a safety measure" or
"we could potential cause a kernel oops if [...]" would be useful.

The guest side looks sufficiently referenced to me, while the GL spec
indicates


>
>         virtio_gpu_cmd_context_detach_resource(vgdev, vfpriv->ctx_id,
> -                                               qobj->hw_res_handle);
> -       virtio_gpu_object_unreserve(qobj);
> +                                              objs);
>  }
>
>  struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c
> b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 1c0097de419a..799d1339ee0f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -835,8 +835,9 @@ void virtio_gpu_cmd_context_destroy(struct
> virtio_gpu_device *vgdev,
>
>  void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device
> *vgdev,
>                                             uint32_t ctx_id,
> -                                           uint32_t resource_id)
> +                                           struct virtio_gpu_object_array
> *objs)
>  {
> +       struct virtio_gpu_object *bo =
> gem_to_virtio_gpu_obj(objs->objs[0]);
>         struct virtio_gpu_ctx_resource *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
>
> @@ -845,15 +846,16 @@ void virtio_gpu_cmd_context_attach_resource(struct
> virtio_gpu_device *vgdev,
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE);
>         cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
> -       cmd_p->resource_id = cpu_to_le32(resource_id);
> +       cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
>         virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
>
>  }
>
>  void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device
> *vgdev,
>                                             uint32_t ctx_id,
> -                                           uint32_t resource_id)
> +                                           struct virtio_gpu_object_array
> *objs)
>  {
> +       struct virtio_gpu_object *bo =
> gem_to_virtio_gpu_obj(objs->objs[0]);
>         struct virtio_gpu_ctx_resource *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
>
> @@ -862,7 +864,7 @@ void virtio_gpu_cmd_context_detach_resource(struct
> virtio_gpu_device *vgdev,
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE);
>         cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
> -       cmd_p->resource_id = cpu_to_le32(resource_id);
> +       cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
>         virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
>  }
>
> --
> 2.18.1
>
>

--000000000000ed7192058cbbaa00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2, 2019 at 7:19 AM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Switch to the virtio_gpu_array_* helper workflow.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.h |=C2=A0 4 ++--<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_gem.c | 24 +++++++++++-------------<br=
>
=C2=A0drivers/gpu/drm/virtio/virtgpu_vq.c=C2=A0 | 10 ++++++----<br>
=C2=A03 files changed, 19 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/=
virtgpu_drv.h<br>
index b1f63a21abb6..d99c54abd090 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
@@ -292,10 +292,10 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu=
_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t id);<br>
=C2=A0void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device =
*vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t ctx_id,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t resource_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct virtio_gpu_object_array *objs);<br>
=C2=A0void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device =
*vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t ctx_id,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t resource_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct virtio_gpu_object_array *objs);<br>
=C2=A0void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *data, uint32_t data_size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ctx_id,<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/=
virtgpu_gem.c<br>
index 6baf64141645..e75819dbba80 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
@@ -111,19 +111,18 @@ int virtio_gpu_gem_object_open(struct drm_gem_object =
*obj,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_device *vgdev =3D obj-&gt;dev=
-&gt;dev_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_fpriv *vfpriv =3D file-&gt;dr=
iver_priv;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *qobj =3D gem_to_virti=
o_gpu_obj(obj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object_array *objs;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vgdev-&gt;has_virgl_3d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D virtio_gpu_object_reserve(qobj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0objs =3D virtio_gpu_array_alloc(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!objs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_array_add_obj(objs, obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cmd_context_attach_resource(vgdev, v=
fpriv-&gt;ctx_id,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 qobj-&gt;hw_res_handle);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_object_unreserve(qobj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 objs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
@@ -132,19 +131,18 @@ void virtio_gpu_gem_object_close(struct drm_gem_objec=
t *obj,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_device *vgdev =3D obj-&gt;dev=
-&gt;dev_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_fpriv *vfpriv =3D file-&gt;dr=
iver_priv;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *qobj =3D gem_to_virti=
o_gpu_obj(obj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object_array *objs;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vgdev-&gt;has_virgl_3d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D virtio_gpu_object_reserve(qobj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0objs =3D virtio_gpu_array_alloc(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!objs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_array_add_obj(objs, obj);<br></block=
quote><div><br></div><div>This seems to call=C2=A0drm_gem_object_get.=C2=A0=
 Without adding the objects to the vbuf, aren&#39;t we missing the correspo=
nding=C2=A0drm_gem_object_put_unlocked?</div><div><br></div><div>Some misce=
llaneous comments:</div><div>1) Maybe virtio_gpu_array can have it&#39;s ow=
n header and file?=C2=A0 virtgpu_drv.h is getting rather big..</div><div>2)=
 What data are you trying to protect with the additional references?=C2=A0 =
Is it host side resources (i.e, the host GL texture or buffer object) or is=
 it guest side resources (fences)?=C2=A0 Guest side resources seem properly=
 counted to me.=C2=A0 GL is supposed to reference count pending resources a=
s well, but that&#39;s not always the case in practice.=C2=A0 A little blur=
b somewhere like &quot;hold on to 3D GEM buffers until the host response as=
 a safety measure&quot; or &quot;we could potential cause a kernel oops if =
[...]&quot; would be useful.</div><div><br></div><div>The guest side looks =
sufficiently referenced to me, while the GL spec indicates=C2=A0 =C2=A0</di=
v><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cmd_context_detach_resource(vgdev, v=
fpriv-&gt;ctx_id,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0qobj-&gt;hw_res_handle);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_object_unreserve(qobj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 objs);<br>
=C2=A0}<br>
<br>
=C2=A0struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/v=
irtgpu_vq.c<br>
index 1c0097de419a..799d1339ee0f 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c<br>
@@ -835,8 +835,9 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_d=
evice *vgdev,<br>
<br>
=C2=A0void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device =
*vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t ctx_id,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t resource_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct virtio_gpu_object_array *objs)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *bo =3D gem_to_virtio_=
gpu_obj(objs-&gt;objs[0]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctx_resource *cmd_p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_vbuffer *vbuf;<br>
<br>
@@ -845,15 +846,16 @@ void virtio_gpu_cmd_context_attach_resource(struct vi=
rtio_gpu_device *vgdev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p-&gt;hdr.type =3D cpu_to_le32(VIRTIO_GPU_C=
MD_CTX_ATTACH_RESOURCE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p-&gt;hdr.ctx_id =3D cpu_to_le32(ctx_id);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;resource_id =3D cpu_to_le32(resource_=
id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;resource_id =3D cpu_to_le32(bo-&gt;hw=
_res_handle);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);<br>
<br>
=C2=A0}<br>
<br>
=C2=A0void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device =
*vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t ctx_id,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t resource_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct virtio_gpu_object_array *objs)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *bo =3D gem_to_virtio_=
gpu_obj(objs-&gt;objs[0]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctx_resource *cmd_p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_vbuffer *vbuf;<br>
<br>
@@ -862,7 +864,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virt=
io_gpu_device *vgdev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p-&gt;hdr.type =3D cpu_to_le32(VIRTIO_GPU_C=
MD_CTX_DETACH_RESOURCE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p-&gt;hdr.ctx_id =3D cpu_to_le32(ctx_id);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;resource_id =3D cpu_to_le32(resource_=
id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;resource_id =3D cpu_to_le32(bo-&gt;hw=
_res_handle);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);<br>
=C2=A0}<br>
<br>
-- <br>
2.18.1<br>
<br>
</blockquote></div></div>

--000000000000ed7192058cbbaa00--

--===============1897961369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1897961369==--
