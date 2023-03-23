Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C06C71FE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 21:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FDF10E128;
	Thu, 23 Mar 2023 20:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E7210E128
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 20:58:24 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id be16so17267508oib.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679605103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJokjdq98cQ3XjpUvB+9HOyzzUBkPupsxZ8j8mSC1Kg=;
 b=k8/kbzfPpThQ/ZnJ5Yy/w9ayTJINc8eHiH+cAhoUh1EDM9QPbVkh4Nc5CrmDi/EPDa
 WcE4MiNPoFx0jhSLODf+R9E5n+3PZyMK95X4/cYAA/1t49BHca9sn5YA6dpt366pMOqM
 BS4eTTl52tmJ3m0qILcpTJY5QnGlnhRfSmu5yxTx5XUnAJX7YIZf2s2RmIe7vX66yd2/
 alqQWZwyNAFuVb9abfsW95Z7yxnZbsaMLCemoH080Qx81vREbE4iOR/2X6JFMPHW/lCT
 2dh7DM40uCUqvTPkYwKs39Eao2Dq6QM2Ur2pGsv3linVapLbqUbThth1eJuUxv566TkF
 9JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679605103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJokjdq98cQ3XjpUvB+9HOyzzUBkPupsxZ8j8mSC1Kg=;
 b=X0QlGIkvbQgp60eUiFd/hqJJR1HyUX6zmIe47OQ8qi0B0mM+rHap6756QdoLTO+R3+
 TkbI9wHvSkKUIbOJGodY7OAkP1aUZz/jqMn2D+a98JWmmDI0WF/VH6+/ddlFdqtTEcra
 /yFCy00j4ClgqKFS2P+jJXXP5772dtVcqhAGjrH+V9ETpQs5TFxDnLTPHXvMOaA9Uid3
 r+qLtvCiDtzxofPmRB1YWWpnQ4lWR8kpWXyzR8KtvSvJKdjV3fJh3MwM4WRWUqUYIrfk
 AOKho/fspusDutQ53vBo/XBmswBMmjCIJ7LuASarbXgdUNKij6Z6kch8Co6pqLRA20yZ
 +93g==
X-Gm-Message-State: AO0yUKX1p5N+Ah0QZd4z2xwaoewmjWIAB+z7283zsTw5A/njFjvwBAKR
 Wx5xmVLsb7QcWcMzC0Pj8kOSSVF3AunJ2rVY8Gs=
X-Google-Smtp-Source: AK7set9GdP4eMULq4fedqrhCD0+6rFeLNqbaROe3yGBNgr8n7NuQNLlX0G4Z/TW+/9/nVh38RuZGLuJ/PevzFMseVmk=
X-Received: by 2002:a54:4716:0:b0:384:1e6a:bf10 with SMTP id
 k22-20020a544716000000b003841e6abf10mr13983oik.5.1679605103190; Thu, 23 Mar
 2023 13:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230323190340.950875-1-dmitry.osipenko@collabora.com>
 <20230323190340.950875-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20230323190340.950875-2-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 23 Mar 2023 13:58:12 -0700
Message-ID: <CAF6AEGs5q_2bKSjZps6BXF9zq0DUe=fRw-hah35BmWtR0JBO9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/virtio: Refactor job submission code path
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 12:05=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Move virtio_gpu_execbuffer_ioctl() into separate virtgpu_submit.c file
> and refactor the code along the way to ease addition of new features to
> the ioctl.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/virtio/Makefile         |   2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 182 --------------
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 302 ++++++++++++++++++++++++
>  4 files changed, 307 insertions(+), 183 deletions(-)
>  create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c
>
> diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Mak=
efile
> index b99fa4a73b68..d2e1788a8227 100644
> --- a/drivers/gpu/drm/virtio/Makefile
> +++ b/drivers/gpu/drm/virtio/Makefile
> @@ -6,6 +6,6 @@
>  virtio-gpu-y :=3D virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram=
.o \
>         virtgpu_display.o virtgpu_vq.o \
>         virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.=
o \
> -       virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
> +       virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o virtgpu_su=
bmit.o
>
>  obj-$(CONFIG_DRM_VIRTIO_GPU) +=3D virtio-gpu.o
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virti=
o/virtgpu_drv.h
> index af6ffb696086..4126c384286b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -486,4 +486,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev=
,
>                                    struct sg_table *sgt,
>                                    enum dma_data_direction dir);
>
> +/* virtgpu_submit.c */
> +int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> +                               struct drm_file *file);
> +
>  #endif
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/vir=
tio/virtgpu_ioctl.c
> index da45215a933d..b24b11f25197 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -38,36 +38,6 @@
>                                     VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
>                                     VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
>
> -static int virtio_gpu_fence_event_create(struct drm_device *dev,
> -                                        struct drm_file *file,
> -                                        struct virtio_gpu_fence *fence,
> -                                        uint32_t ring_idx)
> -{
> -       struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
> -       struct virtio_gpu_fence_event *e =3D NULL;
> -       int ret;
> -
> -       if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
> -               return 0;
> -
> -       e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> -       if (!e)
> -               return -ENOMEM;
> -
> -       e->event.type =3D VIRTGPU_EVENT_FENCE_SIGNALED;
> -       e->event.length =3D sizeof(e->event);
> -
> -       ret =3D drm_event_reserve_init(dev, file, &e->base, &e->event);
> -       if (ret)
> -               goto free;
> -
> -       fence->e =3D e;
> -       return 0;
> -free:
> -       kfree(e);
> -       return ret;
> -}
> -
>  /* Must be called with &virtio_gpu_fpriv.struct_mutex held. */
>  static void virtio_gpu_create_context_locked(struct virtio_gpu_device *v=
gdev,
>                                              struct virtio_gpu_fpriv *vfp=
riv)
> @@ -108,158 +78,6 @@ static int virtio_gpu_map_ioctl(struct drm_device *d=
ev, void *data,
>                                          &virtio_gpu_map->offset);
>  }
>
> -/*
> - * Usage of execbuffer:
> - * Relocations need to take into account the full VIRTIO_GPUDrawable siz=
e.
> - * However, the command as passed from user space must *not* contain the=
 initial
> - * VIRTIO_GPUReleaseInfo struct (first XXX bytes)
> - */
> -static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *dat=
a,
> -                                struct drm_file *file)
> -{
> -       struct drm_virtgpu_execbuffer *exbuf =3D data;
> -       struct virtio_gpu_device *vgdev =3D dev->dev_private;
> -       struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
> -       struct virtio_gpu_fence *out_fence;
> -       int ret;
> -       uint32_t *bo_handles =3D NULL;
> -       void __user *user_bo_handles =3D NULL;
> -       struct virtio_gpu_object_array *buflist =3D NULL;
> -       struct sync_file *sync_file;
> -       int out_fence_fd =3D -1;
> -       void *buf;
> -       uint64_t fence_ctx;
> -       uint32_t ring_idx;
> -
> -       fence_ctx =3D vgdev->fence_drv.context;
> -       ring_idx =3D 0;
> -
> -       if (vgdev->has_virgl_3d =3D=3D false)
> -               return -ENOSYS;
> -
> -       if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
> -               return -EINVAL;
> -
> -       if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
> -               if (exbuf->ring_idx >=3D vfpriv->num_rings)
> -                       return -EINVAL;
> -
> -               if (!vfpriv->base_fence_ctx)
> -                       return -EINVAL;
> -
> -               fence_ctx =3D vfpriv->base_fence_ctx;
> -               ring_idx =3D exbuf->ring_idx;
> -       }
> -
> -       virtio_gpu_create_context(dev, file);
> -       if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
> -               struct dma_fence *in_fence;
> -
> -               in_fence =3D sync_file_get_fence(exbuf->fence_fd);
> -
> -               if (!in_fence)
> -                       return -EINVAL;
> -
> -               /*
> -                * Wait if the fence is from a foreign context, or if the=
 fence
> -                * array contains any fence from a foreign context.
> -                */
> -               ret =3D 0;
> -               if (!dma_fence_match_context(in_fence, fence_ctx + ring_i=
dx))
> -                       ret =3D dma_fence_wait(in_fence, true);
> -
> -               dma_fence_put(in_fence);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
> -               out_fence_fd =3D get_unused_fd_flags(O_CLOEXEC);
> -               if (out_fence_fd < 0)
> -                       return out_fence_fd;
> -       }
> -
> -       if (exbuf->num_bo_handles) {
> -               bo_handles =3D kvmalloc_array(exbuf->num_bo_handles,
> -                                           sizeof(uint32_t), GFP_KERNEL)=
;
> -               if (!bo_handles) {
> -                       ret =3D -ENOMEM;
> -                       goto out_unused_fd;
> -               }
> -
> -               user_bo_handles =3D u64_to_user_ptr(exbuf->bo_handles);
> -               if (copy_from_user(bo_handles, user_bo_handles,
> -                                  exbuf->num_bo_handles * sizeof(uint32_=
t))) {
> -                       ret =3D -EFAULT;
> -                       goto out_unused_fd;
> -               }
> -
> -               buflist =3D virtio_gpu_array_from_handles(file, bo_handle=
s,
> -                                                       exbuf->num_bo_han=
dles);
> -               if (!buflist) {
> -                       ret =3D -ENOENT;
> -                       goto out_unused_fd;
> -               }
> -               kvfree(bo_handles);
> -               bo_handles =3D NULL;
> -       }
> -
> -       buf =3D vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size=
);
> -       if (IS_ERR(buf)) {
> -               ret =3D PTR_ERR(buf);
> -               goto out_unused_fd;
> -       }
> -
> -       if (buflist) {
> -               ret =3D virtio_gpu_array_lock_resv(buflist);
> -               if (ret)
> -                       goto out_memdup;
> -       }
> -
> -       out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> -       if(!out_fence) {
> -               ret =3D -ENOMEM;
> -               goto out_unresv;
> -       }
> -
> -       ret =3D virtio_gpu_fence_event_create(dev, file, out_fence, ring_=
idx);
> -       if (ret)
> -               goto out_unresv;
> -
> -       if (out_fence_fd >=3D 0) {
> -               sync_file =3D sync_file_create(&out_fence->f);
> -               if (!sync_file) {
> -                       dma_fence_put(&out_fence->f);
> -                       ret =3D -ENOMEM;
> -                       goto out_unresv;
> -               }
> -
> -               exbuf->fence_fd =3D out_fence_fd;
> -               fd_install(out_fence_fd, sync_file->file);
> -       }
> -
> -       virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
> -                             vfpriv->ctx_id, buflist, out_fence);
> -       dma_fence_put(&out_fence->f);
> -       virtio_gpu_notify(vgdev);
> -       return 0;
> -
> -out_unresv:
> -       if (buflist)
> -               virtio_gpu_array_unlock_resv(buflist);
> -out_memdup:
> -       kvfree(buf);
> -out_unused_fd:
> -       kvfree(bo_handles);
> -       if (buflist)
> -               virtio_gpu_array_put_free(buflist);
> -
> -       if (out_fence_fd >=3D 0)
> -               put_unused_fd(out_fence_fd);
> -
> -       return ret;
> -}
> -
>  static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
>                                      struct drm_file *file)
>  {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/vi=
rtio/virtgpu_submit.c
> new file mode 100644
> index 000000000000..2ce2459c6bc2
> --- /dev/null
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (C) 2015 Red Hat, Inc.
> + * All Rights Reserved.
> + *
> + * Authors:
> + *    Dave Airlie
> + *    Alon Levy
> + */
> +
> +#include <linux/dma-fence-unwrap.h>
> +#include <linux/file.h>
> +#include <linux/sync_file.h>
> +#include <linux/uaccess.h>
> +
> +#include <drm/drm_file.h>
> +#include <drm/virtgpu_drm.h>
> +
> +#include "virtgpu_drv.h"
> +
> +struct virtio_gpu_submit {
> +       struct virtio_gpu_object_array *buflist;
> +       struct drm_virtgpu_execbuffer *exbuf;
> +       struct virtio_gpu_fence *out_fence;
> +       struct virtio_gpu_fpriv *vfpriv;
> +       struct virtio_gpu_device *vgdev;
> +       struct drm_file *file;
> +       uint64_t fence_ctx;
> +       uint32_t ring_idx;
> +       int out_fence_fd;
> +       void *buf;
> +};
> +
> +static int virtio_gpu_do_fence_wait(struct virtio_gpu_submit *submit,
> +                                   struct dma_fence *in_fence)
> +{
> +       uint32_t context =3D submit->fence_ctx + submit->ring_idx;
> +
> +       if (dma_fence_match_context(in_fence, context))
> +               return 0;
> +
> +       return dma_fence_wait(in_fence, true);
> +}
> +
> +static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
> +                                    struct dma_fence *fence)
> +{
> +       struct dma_fence_unwrap itr;
> +       struct dma_fence *f;
> +       int err;
> +
> +       dma_fence_unwrap_for_each(f, &itr, fence) {
> +               err =3D virtio_gpu_do_fence_wait(submit, f);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_gpu_fence_event_create(struct drm_device *dev,
> +                                        struct drm_file *file,
> +                                        struct virtio_gpu_fence *fence,
> +                                        uint32_t ring_idx)
> +{
> +       struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
> +       struct virtio_gpu_fence_event *e =3D NULL;
> +       int ret;
> +
> +       if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
> +               return 0;
> +
> +       e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> +       if (!e)
> +               return -ENOMEM;
> +
> +       e->event.type =3D VIRTGPU_EVENT_FENCE_SIGNALED;
> +       e->event.length =3D sizeof(e->event);
> +
> +       ret =3D drm_event_reserve_init(dev, file, &e->base, &e->event);
> +       if (ret) {
> +               kfree(e);
> +               return ret;
> +       }
> +
> +       fence->e =3D e;
> +
> +       return 0;
> +}
> +
> +static int virtio_gpu_init_submit_buflist(struct virtio_gpu_submit *subm=
it)
> +{
> +       struct drm_virtgpu_execbuffer *exbuf =3D submit->exbuf;
> +       uint32_t *bo_handles;
> +
> +       if (!exbuf->num_bo_handles)
> +               return 0;
> +
> +       bo_handles =3D kvmalloc_array(exbuf->num_bo_handles, sizeof(uint3=
2_t),
> +                                   GFP_KERNEL);
> +       if (!bo_handles)
> +               return -ENOMEM;
> +
> +       if (copy_from_user(bo_handles, u64_to_user_ptr(exbuf->bo_handles)=
,
> +                          exbuf->num_bo_handles * sizeof(uint32_t))) {
> +               kvfree(bo_handles);
> +               return -EFAULT;
> +       }
> +
> +       submit->buflist =3D virtio_gpu_array_from_handles(submit->file, b=
o_handles,
> +                                                       exbuf->num_bo_han=
dles);
> +       if (!submit->buflist) {
> +               kvfree(bo_handles);
> +               return -ENOENT;
> +       }
> +
> +       kvfree(bo_handles);
> +
> +       return 0;
> +}
> +
> +static void virtio_gpu_cleanup_submit(struct virtio_gpu_submit *submit)
> +{
> +       if (!IS_ERR(submit->buf))
> +               kvfree(submit->buf);
> +
> +       if (submit->buflist)
> +               virtio_gpu_array_put_free(submit->buflist);
> +
> +       if (submit->out_fence_fd >=3D 0)
> +               put_unused_fd(submit->out_fence_fd);
> +
> +       if (submit->out_fence)
> +               dma_fence_put(&submit->out_fence->f);
> +}
> +
> +static void virtio_gpu_submit(struct virtio_gpu_submit *submit)
> +{
> +       virtio_gpu_cmd_submit(submit->vgdev, submit->buf, submit->exbuf->=
size,
> +                             submit->vfpriv->ctx_id, submit->buflist,
> +                             submit->out_fence);
> +       virtio_gpu_notify(submit->vgdev);
> +}
> +
> +static void virtio_gpu_complete_submit(struct virtio_gpu_submit *submit)
> +{
> +       submit->buf =3D NULL;
> +       submit->buflist =3D NULL;
> +       submit->out_fence =3D NULL;
> +       submit->out_fence_fd =3D -1;
> +}
> +
> +static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
> +                                 struct drm_virtgpu_execbuffer *exbuf,
> +                                 struct drm_device *dev,
> +                                 struct drm_file *file,
> +                                 uint64_t fence_ctx, uint32_t ring_idx)
> +{
> +       struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
> +       struct virtio_gpu_device *vgdev =3D dev->dev_private;
> +       struct virtio_gpu_fence *out_fence;
> +       int err;
> +
> +       memset(submit, 0, sizeof(*submit));
> +
> +       out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> +       if (!out_fence)
> +               return -ENOMEM;
> +
> +       err =3D virtio_gpu_fence_event_create(dev, file, out_fence, ring_=
idx);
> +       if (err) {
> +               dma_fence_put(&out_fence->f);
> +               return err;
> +       }
> +
> +       submit->out_fence =3D out_fence;
> +       submit->fence_ctx =3D fence_ctx;
> +       submit->ring_idx =3D ring_idx;
> +       submit->out_fence_fd =3D -1;
> +       submit->vfpriv =3D vfpriv;
> +       submit->vgdev =3D vgdev;
> +       submit->exbuf =3D exbuf;
> +       submit->file =3D file;
> +
> +       err =3D virtio_gpu_init_submit_buflist(submit);
> +       if (err)
> +               return err;
> +
> +       submit->buf =3D vmemdup_user(u64_to_user_ptr(exbuf->command), exb=
uf->size);
> +       if (IS_ERR(submit->buf))
> +               return PTR_ERR(submit->buf);
> +
> +       if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
> +               err =3D get_unused_fd_flags(O_CLOEXEC);
> +               if (err < 0)
> +                       return err;
> +
> +               submit->out_fence_fd =3D err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_gpu_wait_in_fence(struct virtio_gpu_submit *submit)
> +{
> +       int ret =3D 0;
> +
> +       if (submit->exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
> +               struct dma_fence *in_fence =3D
> +                               sync_file_get_fence(submit->exbuf->fence_=
fd);
> +               if (!in_fence)
> +                       return -EINVAL;
> +
> +               /*
> +                * Wait if the fence is from a foreign context, or if the=
 fence
> +                * array contains any fence from a foreign context.
> +                */
> +               ret =3D virtio_gpu_dma_fence_wait(submit, in_fence);
> +
> +               dma_fence_put(in_fence);
> +       }
> +
> +       return ret;
> +}
> +
> +static int virtio_gpu_install_out_fence_fd(struct virtio_gpu_submit *sub=
mit)
> +{
> +       if (submit->out_fence_fd >=3D 0) {
> +               struct sync_file *sync_file =3D
> +                                       sync_file_create(&submit->out_fen=
ce->f);
> +               if (!sync_file)
> +                       return -ENOMEM;
> +
> +               submit->exbuf->fence_fd =3D submit->out_fence_fd;
> +               fd_install(submit->out_fence_fd, sync_file->file);
> +       }
> +
> +       return 0;
> +}
> +
> +static int virtio_gpu_lock_buflist(struct virtio_gpu_submit *submit)
> +{
> +       if (submit->buflist)
> +               return virtio_gpu_array_lock_resv(submit->buflist);
> +
> +       return 0;
> +}
> +
> +int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> +                               struct drm_file *file)
> +{
> +       struct virtio_gpu_device *vgdev =3D dev->dev_private;
> +       struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
> +       uint64_t fence_ctx =3D vgdev->fence_drv.context;
> +       struct drm_virtgpu_execbuffer *exbuf =3D data;
> +       struct virtio_gpu_submit submit;
> +       uint32_t ring_idx =3D 0;
> +       int ret =3D -EINVAL;
> +
> +       if (vgdev->has_virgl_3d =3D=3D false)
> +               return -ENOSYS;
> +
> +       if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
> +               return ret;
> +
> +       if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
> +               if (exbuf->ring_idx >=3D vfpriv->num_rings)
> +                       return ret;
> +
> +               if (!vfpriv->base_fence_ctx)
> +                       return ret;
> +
> +               fence_ctx =3D vfpriv->base_fence_ctx;
> +               ring_idx =3D exbuf->ring_idx;
> +       }
> +
> +       virtio_gpu_create_context(dev, file);
> +
> +       ret =3D virtio_gpu_init_submit(&submit, exbuf, dev, file,
> +                                    fence_ctx, ring_idx);
> +       if (ret)
> +               goto cleanup;
> +
> +       ret =3D virtio_gpu_wait_in_fence(&submit);
> +       if (ret)
> +               goto cleanup;
> +
> +       ret =3D virtio_gpu_install_out_fence_fd(&submit);
> +       if (ret)
> +               goto cleanup;
> +
> +       ret =3D virtio_gpu_lock_buflist(&submit);
> +       if (ret)
> +               goto cleanup;
> +
> +       virtio_gpu_submit(&submit);
> +       virtio_gpu_complete_submit(&submit);
> +cleanup:
> +       virtio_gpu_cleanup_submit(&submit);
> +
> +       return ret;
> +}
> --
> 2.39.2
>
