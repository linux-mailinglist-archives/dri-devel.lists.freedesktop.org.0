Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D0B7E0B52
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 23:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DE610EAF1;
	Fri,  3 Nov 2023 22:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1B010EAF1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 22:55:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5435336ab0bso4299442a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 15:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699052145; x=1699656945;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s8gJ/6Dms6nSMrxLtuGhWj2j28xDomoJuFDLzheuPjg=;
 b=Q5B9Ale328HcvB8KpUXsT/fMUAsqnc0gtBx8E+z3M6KRdu1ynUWmDSLCHqTHdzMLdM
 sqLvM6HHdWsiWvoQN9VgYPQgq8Fg0sAFD8j1wtm9SKu0iuXDdwwna3VWY/uBzU9PUZ3s
 jgrge4hoXH7EtyM7kOw402jzloM44hxVIke4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699052145; x=1699656945;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s8gJ/6Dms6nSMrxLtuGhWj2j28xDomoJuFDLzheuPjg=;
 b=YGL69uINCYnLfodRbhSLHFga9YJqlD/sANVuqwtHfS0bv2jo4LLOux444Zb/tUFRIo
 mJp3OigcWhCOi8lrSYOngFMoxzAXjI7gP5C1bk2SYUcz509PD3c+tJ7mycfKZWgjBeO9
 WVyjM9Oxq2HojIBTUkb3dv78+dtXAWsdBcm776F5IMc8Jg7qAfGzAobMeHj/nYyLYh9R
 5E66hAL1oT4uplLHKggiXSpkNAt/HHfAZs1xdSQ1Jdb8IRFHIafuO75uVmUYYg9xj8Ku
 24fddiA+6Uh6MbTyZgnu50CW/A73Uv5946+HzphAIowoGwUu/y2an6aI7n1u5Xh5rsQj
 mkbA==
X-Gm-Message-State: AOJu0Yy55YkNdIk53wREvzUnW87PZZINNrSyFVw50iecmdWIcYrfgKnM
 sM3tlnah/dkfS3SOJhj1d7Gdk4ltaYzobKegKsFc1Q==
X-Google-Smtp-Source: AGHT+IHZN7T4Rmt/dGvPU0/UJJhYifihoRck/1T6FU+v38V0+9Rw/qbK1jdTrtlIXtI14m62qpen9Q==
X-Received: by 2002:a17:906:c3a2:b0:9da:fd18:1fdc with SMTP id
 t34-20020a170906c3a200b009dafd181fdcmr5042945ejz.44.1699052145337; 
 Fri, 03 Nov 2023 15:55:45 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a1-20020a170906368100b0099bd453357esm1349936ejc.41.2023.11.03.15.55.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 15:55:44 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-53eeb28e8e5so1891a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 15:55:44 -0700 (PDT)
X-Received: by 2002:a05:6402:1f0a:b0:544:466b:3b20 with SMTP id
 b10-20020a0564021f0a00b00544466b3b20mr22838edb.5.1699052143868; Fri, 03 Nov
 2023 15:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-26-dmitry.osipenko@collabora.com>
In-Reply-To: <20231029230205.93277-26-dmitry.osipenko@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 3 Nov 2023 15:55:31 -0700
X-Gmail-Original-Message-ID: <CAAfnVBk3gbxVL+WwY9pi27ts8JGPM=0VuOkTo8KOZcuO634UeQ@mail.gmail.com>
Message-ID: <CAAfnVBk3gbxVL+WwY9pi27ts8JGPM=0VuOkTo8KOZcuO634UeQ@mail.gmail.com>
Subject: Re: [PATCH v18 25/26] drm/virtio: Support shmem shrinking
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000007e679306094767fc"
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Melissa Wen <mwen@igalia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007e679306094767fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 4:03=E2=80=AFPM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> Support generic drm-shmem memory shrinker and add new madvise IOCTL to
> the VirtIO-GPU driver. BO cache manager of Mesa driver will mark BOs as
> "don't need" using the new IOCTL to let shrinker purge the marked BOs on
> OOM, the shrinker will also evict unpurgeable shmem BOs from memory if
> guest supports SWAP file or partition.
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++-
>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 35 ++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 25 ++++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c    |  8 ++++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 40 ++++++++++++++++
>  include/uapi/drm/virtgpu_drm.h          | 14 ++++++
>  7 files changed, 195 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 421f524ae1de..33a78b24c272 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -278,7 +278,7 @@ struct virtio_gpu_fpriv {
>  };
>
>  /* virtgpu_ioctl.c */
> -#define DRM_VIRTIO_NUM_IOCTLS 12
> +#define DRM_VIRTIO_NUM_IOCTLS 13
>  extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
>  void virtio_gpu_create_context(struct drm_device *dev, struct drm_file
> *file);
>
> @@ -316,6 +316,8 @@ void virtio_gpu_array_put_free_delayed(struct
> virtio_gpu_device *vgdev,
>  void virtio_gpu_array_put_free_work(struct work_struct *work);
>  int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
>                              struct virtio_gpu_object_array *objs);
> +int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo);
> +int virtio_gpu_gem_madvise(struct virtio_gpu_object *obj, int madv);
>  int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);
>  void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);
>
> @@ -329,6 +331,8 @@ void virtio_gpu_cmd_create_resource(struct
> virtio_gpu_device *vgdev,
>                                     struct virtio_gpu_fence *fence);
>  void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
>                                    struct virtio_gpu_object *bo);
> +int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
> +                                   struct virtio_gpu_object *bo);
>  void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>                                         uint64_t offset,
>                                         uint32_t width, uint32_t height,
> @@ -349,6 +353,9 @@ void virtio_gpu_object_attach(struct virtio_gpu_devic=
e
> *vgdev,
>                               struct virtio_gpu_object *obj,
>                               struct virtio_gpu_mem_entry *ents,
>                               unsigned int nents);
> +void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
> +                             struct virtio_gpu_object *obj,
> +                             struct virtio_gpu_fence *fence);
>  void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
>                             struct virtio_gpu_output *output);
>  int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
> @@ -492,4 +499,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev=
,
>  int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>                                 struct drm_file *file);
>
> +/* virtgpu_gem_shrinker.c */
> +int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev);
> +void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c
> b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 97e67064c97e..748f7bbb0e6d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -147,10 +147,20 @@ void virtio_gpu_gem_object_close(struct
> drm_gem_object *obj,
>         struct virtio_gpu_device *vgdev =3D obj->dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
>         struct virtio_gpu_object_array *objs;
> +       struct virtio_gpu_object *bo;
>
>         if (!vgdev->has_virgl_3d)
>                 return;
>
> +       bo =3D gem_to_virtio_gpu_obj(obj);
> +
> +       /*
> +        * Purged BO was already detached and released, the resource ID
> +        * is invalid by now.
> +        */
> +       if (!virtio_gpu_gem_madvise(bo, VIRTGPU_MADV_WILLNEED))
> +               return;
> +
>         objs =3D virtio_gpu_array_alloc(1);
>         if (!objs)
>                 return;
> @@ -315,6 +325,31 @@ int virtio_gpu_array_prepare(struct virtio_gpu_devic=
e
> *vgdev,
>         return ret;
>  }
>
> +int virtio_gpu_gem_madvise(struct virtio_gpu_object *bo, int madv)
> +{
> +       if (virtio_gpu_is_shmem(bo))
> +               return drm_gem_shmem_object_madvise(&bo->base.base, madv)=
;
> +
> +       return 1;
> +}
> +
> +int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo)
> +{
> +       struct virtio_gpu_device *vgdev =3D bo->base.base.dev->dev_privat=
e;
> +       int err;
> +
> +       if (bo->created) {
> +               err =3D virtio_gpu_cmd_release_resource(vgdev, bo);
> +               if (err)
> +                       return err;
> +
> +               virtio_gpu_notify(vgdev);
> +               bo->created =3D false;
> +       }
> +
> +       return 0;
> +}
> +
>  int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
>  {
>         int err;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 070c29cea26a..44a99166efdc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -676,6 +676,28 @@ static int virtio_gpu_context_init_ioctl(struct
> drm_device *dev,
>         return ret;
>  }
>
> +static int virtio_gpu_madvise_ioctl(struct drm_device *dev,
> +                                   void *data,
> +                                   struct drm_file *file)
> +{
> +       struct drm_virtgpu_madvise *args =3D data;
> +       struct virtio_gpu_object *bo;
> +       struct drm_gem_object *obj;
> +
> +       if (args->madv > VIRTGPU_MADV_DONTNEED)
> +               return -EOPNOTSUPP;
> +
> +       obj =3D drm_gem_object_lookup(file, args->bo_handle);
> +       if (!obj)
> +               return -ENOENT;
> +
> +       bo =3D gem_to_virtio_gpu_obj(obj);
> +       args->retained =3D virtio_gpu_gem_madvise(bo, args->madv);
> +       drm_gem_object_put(obj);
> +
> +       return 0;
> +}
> +
>  struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] =3D {
>         DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
>                           DRM_RENDER_ALLOW),
> @@ -715,4 +737,7 @@ struct drm_ioctl_desc
> virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] =3D {
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT,
> virtio_gpu_context_init_ioctl,
>                           DRM_RENDER_ALLOW),
> +
> +       DRM_IOCTL_DEF_DRV(VIRTGPU_MADVISE, virtio_gpu_madvise_ioctl,
> +                         DRM_RENDER_ALLOW),
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c
> b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 5a3b5aaed1f3..43e237082cec 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -245,6 +245,12 @@ int virtio_gpu_init(struct virtio_device *vdev,
> struct drm_device *dev)
>                 goto err_scanouts;
>         }
>
> +       ret =3D drmm_gem_shmem_init(dev);
> +       if (ret) {
> +               DRM_ERROR("shmem init failed\n");
> +               goto err_modeset;
> +       }
> +
>         virtio_device_ready(vgdev->vdev);
>
>         if (num_capsets)
> @@ -259,6 +265,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struc=
t
> drm_device *dev)
>         }
>         return 0;
>
> +err_modeset:
> +       virtio_gpu_modeset_fini(vgdev);
>  err_scanouts:
>         virtio_gpu_free_vbufs(vgdev);
>  err_vbufs:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 000bb7955a57..8fa5f912ae51 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -98,6 +98,60 @@ static void virtio_gpu_free_object(struct
> drm_gem_object *obj)
>         virtio_gpu_cleanup_object(bo);
>  }
>
> +static int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo)
> +{
> +       struct virtio_gpu_device *vgdev =3D bo->base.base.dev->dev_privat=
e;
> +       struct virtio_gpu_fence *fence;
> +
> +       if (bo->detached)
> +               return 0;
> +
> +       fence =3D virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,=
 0);
> +       if (!fence)
> +               return -ENOMEM;
> +
> +       virtio_gpu_object_detach(vgdev, bo, fence);
> +       virtio_gpu_notify(vgdev);
> +
> +       dma_fence_wait(&fence->f, false);
> +       dma_fence_put(&fence->f);
> +
> +       bo->detached =3D true;
> +
> +       return 0;
> +}
> +
> +static int virtio_gpu_shmem_evict(struct drm_gem_object *obj)
> +{
> +       struct virtio_gpu_object *bo =3D gem_to_virtio_gpu_obj(obj);
> +       int err;
> +
> +       /* blob is not movable, it's impossible to detach it from host */
> +       if (bo->blob_mem)
> +               return -EBUSY;
> +
> +       /*
> +        * At first tell host to stop using guest's memory to ensure that
> +        * host won't touch the released guest's memory once it's gone.
> +        */
> +       err =3D virtio_gpu_detach_object_fenced(bo);
> +       if (err)
> +               return err;
> +
> +       if (drm_gem_shmem_is_purgeable(&bo->base)) {
> +               err =3D virtio_gpu_gem_host_mem_release(bo);
> +               if (err)
> +                       return err;
> +
> +               drm_gem_shmem_purge_locked(&bo->base);
> +       } else {
> +               bo->base.pages_mark_dirty_on_put =3D 1;
> +               drm_gem_shmem_evict_locked(&bo->base);
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs =3D {
>         .free =3D virtio_gpu_free_object,
>         .open =3D virtio_gpu_gem_object_open,
> @@ -111,6 +165,7 @@ static const struct drm_gem_object_funcs
> virtio_gpu_shmem_funcs =3D {
>         .vunmap =3D drm_gem_shmem_object_vunmap_locked,
>         .mmap =3D drm_gem_shmem_object_mmap,
>         .vm_ops =3D &drm_gem_shmem_vm_ops,
> +       .evict =3D virtio_gpu_shmem_evict,
>  };
>
>  bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
> @@ -187,6 +242,10 @@ int virtio_gpu_reattach_shmem_object_locked(struct
> virtio_gpu_object *bo)
>         if (!bo->detached)
>                 return 0;
>
> +       err =3D drm_gem_shmem_swapin_locked(&bo->base);
> +       if (err)
> +               return err;
> +
>         err =3D virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
>         if (err)
>                 return err;
> @@ -240,6 +299,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device
> *vgdev,
>                 goto err_put_pages;
>
>         bo->dumb =3D params->dumb;
> +       bo->blob_mem =3D params->blob_mem;
> +       bo->blob_flags =3D params->blob_flags;
>
>         if (bo->blob_mem =3D=3D VIRTGPU_BLOB_MEM_GUEST)
>                 bo->guest_blob =3D true;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c
> b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index b1a00c0c25a7..14ab470f413a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -545,6 +545,21 @@ void virtio_gpu_cmd_unref_resource(struct
> virtio_gpu_device *vgdev,
>                 virtio_gpu_cleanup_object(bo);
>  }
>
> +int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
> +                                   struct virtio_gpu_object *bo)
> +{
> +       struct virtio_gpu_resource_unref *cmd_p;
> +       struct virtio_gpu_vbuffer *vbuf;
> +
> +       cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> +       memset(cmd_p, 0, sizeof(*cmd_p));
> +
> +       cmd_p->hdr.type =3D cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
> +       cmd_p->resource_id =3D cpu_to_le32(bo->hw_res_handle);
> +
> +       return virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
> +}
> +
>  void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
>                                 uint32_t scanout_id, uint32_t resource_id=
,
>                                 uint32_t width, uint32_t height,
> @@ -645,6 +660,23 @@ virtio_gpu_cmd_resource_attach_backing(struct
> virtio_gpu_device *vgdev,
>         virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
>  }
>
> +static void
> +virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,
> +                                      u32 resource_id,
> +                                      struct virtio_gpu_fence *fence)
> +{
> +       struct virtio_gpu_resource_attach_backing *cmd_p;
> +       struct virtio_gpu_vbuffer *vbuf;
> +
> +       cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> +       memset(cmd_p, 0, sizeof(*cmd_p));
> +
> +       cmd_p->hdr.type =3D
> cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING);
> +       cmd_p->resource_id =3D cpu_to_le32(resource_id);
> +
> +       virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
> +}
> +
>  static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device
> *vgdev,
>                                                struct virtio_gpu_vbuffer
> *vbuf)
>  {
> @@ -1107,6 +1139,14 @@ void virtio_gpu_object_attach(struct
> virtio_gpu_device *vgdev,
>                                                ents, nents, NULL);
>  }
>
> +void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
> +                             struct virtio_gpu_object *obj,
> +                             struct virtio_gpu_fence *fence)
> +{
> +       virtio_gpu_cmd_resource_detach_backing(vgdev, obj->hw_res_handle,
> +                                              fence);
> +}
> +
>  void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
>                             struct virtio_gpu_output *output)
>  {
> diff --git a/include/uapi/drm/virtgpu_drm.h
> b/include/uapi/drm/virtgpu_drm.h
> index b1d0e56565bc..4caba71b2740 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -48,6 +48,7 @@ extern "C" {
>  #define DRM_VIRTGPU_GET_CAPS  0x09
>  #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
>  #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
> +#define DRM_VIRTGPU_MADVISE 0x0c
>
>  #define VIRTGPU_EXECBUF_FENCE_FD_IN    0x01
>  #define VIRTGPU_EXECBUF_FENCE_FD_OUT   0x02
> @@ -211,6 +212,15 @@ struct drm_virtgpu_context_init {
>         __u64 ctx_set_params;
>  };
>
> +#define VIRTGPU_MADV_WILLNEED 0
> +#define VIRTGPU_MADV_DONTNEED 1
> +struct drm_virtgpu_madvise {
> +       __u32 bo_handle;
> +       __u32 retained; /* out, non-zero if BO can be used */
> +       __u32 madv;
> +       __u32 pad;
> +};
> +
>

Link to open-source userspace?

Also, don't you need a VIRTGPU_PARAM_MADVISE_SUPPORTED or is the plan to
use a DRM version?

Overall, the series for a generic shrinker seems useful for a wide variety
of DRM drivers, such as Panfrost.

For virtio-gpu, it could be a tad VIRGIL specific: since other context
types (gfxstream gles, DRM, vk contexts) decrease memory consumption by
either not allocating shadow buffers for textures/buffers, or using blob
memory.

Maybe we need to design with blob in mind, since we expect virgl to be
deprecated.  On Android, it basically is with ANGLE and native contexts.
On Linux, Zink looks good too.  Even with memory issues fixed, virgl is
unattractive compared to those solutions.

Android specific idea: I wonder if we could tie GEM blob buffers usage to
the lmkd and kill based on that ... ?

https://source.android.com/docs/core/perf/lmkd

Is there GEM buffer accounting infrastructure already?

 /*
>   * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is
> in
>   * effect.  The event size is sizeof(drm_event), since there is no
> additional
> @@ -261,6 +271,10 @@ struct drm_virtgpu_context_init {
>         DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,           \
>                 struct drm_virtgpu_context_init)
>
> +#define DRM_IOCTL_VIRTGPU_MADVISE \
> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MADVISE, \
> +                struct drm_virtgpu_madvise)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.41.0
>
>

--0000000000007e679306094767fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 29, 2023 at 4:03=E2=80=AF=
PM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" tar=
get=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Support generic drm-shmem memor=
y shrinker and add new madvise IOCTL to<br>
the VirtIO-GPU driver. BO cache manager of Mesa driver will mark BOs as<br>
&quot;don&#39;t need&quot; using the new IOCTL to let shrinker purge the ma=
rked BOs on<br>
OOM, the shrinker will also evict unpurgeable shmem BOs from memory if<br>
guest supports SWAP file or partition.<br>
<br>
Acked-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"=
_blank">kraxel@redhat.com</a>&gt;<br>
Signed-off-by: Daniel Almeida &lt;<a href=3D"mailto:daniel.almeida@collabor=
a.com" target=3D"_blank">daniel.almeida@collabora.com</a>&gt;<br>
Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collab=
ora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0 | 13 +++++-<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_gem.c=C2=A0 =C2=A0 | 35 ++++++++++++++=
<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_ioctl.c=C2=A0 | 25 ++++++++++<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_kms.c=C2=A0 =C2=A0 |=C2=A0 8 ++++<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_object.c | 61 ++++++++++++++++++++++++=
+<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_vq.c=C2=A0 =C2=A0 =C2=A0| 40 +++++++++=
+++++++<br>
=C2=A0include/uapi/drm/virtgpu_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14=
 ++++++<br>
=C2=A07 files changed, 195 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/=
virtgpu_drv.h<br>
index 421f524ae1de..33a78b24c272 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
@@ -278,7 +278,7 @@ struct virtio_gpu_fpriv {<br>
=C2=A0};<br>
<br>
=C2=A0/* virtgpu_ioctl.c */<br>
-#define DRM_VIRTIO_NUM_IOCTLS 12<br>
+#define DRM_VIRTIO_NUM_IOCTLS 13<br>
=C2=A0extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS]=
;<br>
=C2=A0void virtio_gpu_create_context(struct drm_device *dev, struct drm_fil=
e *file);<br>
<br>
@@ -316,6 +316,8 @@ void virtio_gpu_array_put_free_delayed(struct virtio_gp=
u_device *vgdev,<br>
=C2=A0void virtio_gpu_array_put_free_work(struct work_struct *work);<br>
=C2=A0int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object_array *objs);<br>
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo);<br>
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *obj, int madv);<br>
=C2=A0int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);<br>
=C2=A0void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);<br>
<br>
@@ -329,6 +331,8 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_d=
evice *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_fenc=
e *fence);<br>
=C2=A0void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_objec=
t *bo);<br>
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_objec=
t *bo);<br>
=C2=A0void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgd=
ev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t=
 offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 width, uint32_t height,<br>
@@ -349,6 +353,9 @@ void virtio_gpu_object_attach(struct virtio_gpu_device =
*vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object *obj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_mem_entry *ents,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int nents);<br>
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *obj,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_fence *fence);<br>
=C2=A0void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_output *output);<br>
=C2=A0int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);=
<br>
@@ -492,4 +499,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,<=
br>
=C2=A0int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file *file);<br>
<br>
+/* virtgpu_gem_shrinker.c */<br>
+int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev);<br>
+void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev);<br>
+<br>
=C2=A0#endif<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/=
virtgpu_gem.c<br>
index 97e67064c97e..748f7bbb0e6d 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
@@ -147,10 +147,20 @@ void virtio_gpu_gem_object_close(struct drm_gem_objec=
t *obj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_device *vgdev =3D obj-&gt;dev=
-&gt;dev_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_fpriv *vfpriv =3D file-&gt;dr=
iver_priv;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object_array *objs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *bo;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vgdev-&gt;has_virgl_3d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo =3D gem_to_virtio_gpu_obj(obj);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Purged BO was already detached and released,=
 the resource ID<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is invalid by now.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!virtio_gpu_gem_madvise(bo, VIRTGPU_MADV_WI=
LLNEED))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 objs =3D virtio_gpu_array_alloc(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!objs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
@@ -315,6 +325,31 @@ int virtio_gpu_array_prepare(struct virtio_gpu_device =
*vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *bo, int madv)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (virtio_gpu_is_shmem(bo))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_gem_shme=
m_object_madvise(&amp;bo-&gt;base.base, madv);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+}<br>
+<br>
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_device *vgdev =3D bo-&gt;base=
.base.dev-&gt;dev_private;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;created) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D virtio_gpu_=
cmd_release_resource(vgdev, bo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_notify(v=
gdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;created =3D =
false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virti=
o/virtgpu_ioctl.c<br>
index 070c29cea26a..44a99166efdc 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
@@ -676,6 +676,28 @@ static int virtio_gpu_context_init_ioctl(struct drm_de=
vice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
+static int virtio_gpu_madvise_ioctl(struct drm_device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file)<=
br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_madvise *args =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *bo;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args-&gt;madv &gt; VIRTGPU_MADV_DONTNEED)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D drm_gem_object_lookup(file, args-&gt;bo=
_handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo =3D gem_to_virtio_gpu_obj(obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;retained =3D virtio_gpu_gem_madvise(bo=
, args-&gt;madv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_put(obj);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_i=
octl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DRM_RENDER_ALLOW),<br>
@@ -715,4 +737,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_=
IOCTLS] =3D {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_=
gpu_context_init_ioctl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DRM_RENDER_ALLOW),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(VIRTGPU_MADVISE, virtio_gpu_m=
advise_ioctl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0DRM_RENDER_ALLOW),<br>
=C2=A0};<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/=
virtgpu_kms.c<br>
index 5a3b5aaed1f3..43e237082cec 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c<br>
@@ -245,6 +245,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct=
 drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_scanouts;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drmm_gem_shmem_init(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;shm=
em init failed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_modeset;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_device_ready(vgdev-&gt;vdev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (num_capsets)<br>
@@ -259,6 +265,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct =
drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
+err_modeset:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_modeset_fini(vgdev);<br>
=C2=A0err_scanouts:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_free_vbufs(vgdev);<br>
=C2=A0err_vbufs:<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virt=
io/virtgpu_object.c<br>
index 000bb7955a57..8fa5f912ae51 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_object.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>
@@ -98,6 +98,60 @@ static void virtio_gpu_free_object(struct drm_gem_object=
 *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cleanup_object(bo);<br>
=C2=A0}<br>
<br>
+static int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo)<b=
r>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_device *vgdev =3D bo-&gt;base=
.base.dev-&gt;dev_private;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_fence *fence;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;detached)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D virtio_gpu_fence_alloc(vgdev, vgdev-&=
gt;fence_drv.context, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fence)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_object_detach(vgdev, bo, fence);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_notify(vgdev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_fence_wait(&amp;fence-&gt;f, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_fence_put(&amp;fence-&gt;f);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;detached =3D true;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int virtio_gpu_shmem_evict(struct drm_gem_object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *bo =3D gem_to_virtio_=
gpu_obj(obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* blob is not movable, it&#39;s impossible to =
detach it from host */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;blob_mem)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * At first tell host to stop using guest&#39;s=
 memory to ensure that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * host won&#39;t touch the released guest&#39;=
s memory once it&#39;s gone.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D virtio_gpu_detach_object_fenced(bo);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_shmem_is_purgeable(&amp;bo-&gt;base=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D virtio_gpu_=
gem_host_mem_release(bo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_shmem_purge=
_locked(&amp;bo-&gt;base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;base.pages_m=
ark_dirty_on_put =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_shmem_evict=
_locked(&amp;bo-&gt;base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs =3D {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .free =3D virtio_gpu_free_object,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .open =3D virtio_gpu_gem_object_open,<br>
@@ -111,6 +165,7 @@ static const struct drm_gem_object_funcs virtio_gpu_shm=
em_funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .vunmap =3D drm_gem_shmem_object_vunmap_locked,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mmap =3D drm_gem_shmem_object_mmap,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .vm_ops =3D &amp;drm_gem_shmem_vm_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.evict =3D virtio_gpu_shmem_evict,<br>
=C2=A0};<br>
<br>
=C2=A0bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)<br>
@@ -187,6 +242,10 @@ int virtio_gpu_reattach_shmem_object_locked(struct vir=
tio_gpu_object *bo)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!bo-&gt;detached)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_gem_shmem_swapin_locked(&amp;bo-&gt=
;base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D virtio_gpu_object_shmem_init(vgdev, bo,=
 &amp;ents, &amp;nents);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
@@ -240,6 +299,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *=
vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_put_pages;=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;dumb =3D params-&gt;dumb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;blob_mem =3D params-&gt;blob_mem;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;blob_flags =3D params-&gt;blob_flags;<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bo-&gt;blob_mem =3D=3D VIRTGPU_BLOB_MEM_GUE=
ST)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;guest_blob =
=3D true;<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/v=
irtgpu_vq.c<br>
index b1a00c0c25a7..14ab470f413a 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c<br>
@@ -545,6 +545,21 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_d=
evice *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cleanup_=
object(bo);<br>
=C2=A0}<br>
<br>
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_objec=
t *bo)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_resource_unref *cmd_p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_vbuffer *vbuf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &amp;vbuf=
, sizeof(*cmd_p));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(cmd_p, 0, sizeof(*cmd_p));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;hdr.type =3D cpu_to_le32(VIRTIO_GPU_C=
MD_RESOURCE_UNREF);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;resource_id =3D cpu_to_le32(bo-&gt;hw=
_res_handle);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return virtio_gpu_queue_ctrl_buffer(vgdev, vbuf=
);<br>
+}<br>
+<br>
=C2=A0void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t scanout_id, uint32_t resour=
ce_id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t width, uint32_t height,<br>
@@ -645,6 +660,23 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_g=
pu_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf=
, fence);<br>
=C2=A0}<br>
<br>
+static void<br>
+virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 resource_id=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_g=
pu_fence *fence)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_resource_attach_backing *cmd_=
p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_vbuffer *vbuf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &amp;vbuf=
, sizeof(*cmd_p));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(cmd_p, 0, sizeof(*cmd_p));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;hdr.type =3D cpu_to_le32(VIRTIO_GPU_C=
MD_RESOURCE_DETACH_BACKING);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_p-&gt;resource_id =3D cpu_to_le32(resource_=
id);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf=
, fence);<br>
+}<br>
+<br>
=C2=A0static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_devi=
ce *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0struct virtio_gpu_vbuffer *vbuf)<br>
=C2=A0{<br>
@@ -1107,6 +1139,14 @@ void virtio_gpu_object_attach(struct virtio_gpu_devi=
ce *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ents, nents, NULL);<br>
=C2=A0}<br>
<br>
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *obj,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_fence *fence)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_cmd_resource_detach_backing(vgdev, o=
bj-&gt;hw_res_handle,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fence);<br>
+}<br>
+<br>
=C2=A0void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_output *output)<br>
=C2=A0{<br>
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.=
h<br>
index b1d0e56565bc..4caba71b2740 100644<br>
--- a/include/uapi/drm/virtgpu_drm.h<br>
+++ b/include/uapi/drm/virtgpu_drm.h<br>
@@ -48,6 +48,7 @@ extern &quot;C&quot; {<br>
=C2=A0#define DRM_VIRTGPU_GET_CAPS=C2=A0 0x09<br>
=C2=A0#define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a<br>
=C2=A0#define DRM_VIRTGPU_CONTEXT_INIT 0x0b<br>
+#define DRM_VIRTGPU_MADVISE 0x0c<br>
<br>
=C2=A0#define VIRTGPU_EXECBUF_FENCE_FD_IN=C2=A0 =C2=A0 0x01<br>
=C2=A0#define VIRTGPU_EXECBUF_FENCE_FD_OUT=C2=A0 =C2=A00x02<br>
@@ -211,6 +212,15 @@ struct drm_virtgpu_context_init {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 ctx_set_params;<br>
=C2=A0};<br>
<br>
+#define VIRTGPU_MADV_WILLNEED 0<br>
+#define VIRTGPU_MADV_DONTNEED 1<br>
+struct drm_virtgpu_madvise {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 bo_handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 retained; /* out, non-zero if BO can be u=
sed */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 madv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 pad;<br>
+};<br>
+<br></blockquote><div><br></div><div>Link to open-source userspace?</div><=
div><br></div><div>Also, don&#39;t you need a=C2=A0<span style=3D"color:rgb=
(0,0,0);font-size:13.3333px">VIRTGPU_PARAM_MADVISE_SUPPORTED or is the plan=
 to use a DRM version?</span></div><div><span style=3D"color:rgb(0,0,0);fon=
t-size:13.3333px"><br></span></div><div><span style=3D"color:rgb(0,0,0);fon=
t-size:13.3333px">Overall, the series for a generic shrinker seems useful f=
or a wide variety of DRM drivers, such as Panfrost.=C2=A0=C2=A0</span></div=
><div><span style=3D"color:rgb(0,0,0);font-size:13.3333px"><br></span></div=
><div><span style=3D"color:rgb(0,0,0);font-size:13.3333px">For virtio-gpu, =
it could be a tad VIRGIL specific: since other context types (gfxstream gle=
s, DRM, vk contexts) decrease memory consumption by either not allocating s=
hadow buffers for textures/buffers, or using blob memory.</span></div><div>=
<span style=3D"color:rgb(0,0,0);font-size:13.3333px"><br></span></div><div>=
<span style=3D"color:rgb(0,0,0);font-size:13.3333px">Maybe we need to desig=
n with blob in mind, since we expect virgl to be deprecated.=C2=A0 On Andro=
id, it basically is with ANGLE and native contexts.=C2=A0 On Linux, Zink lo=
oks good too.=C2=A0 Even with memory issues fixed, virgl=C2=A0is unattracti=
ve compared to those solutions.=C2=A0=C2=A0</span></div><div><span style=3D=
"color:rgb(0,0,0);font-size:13.3333px"><br></span></div><div><font color=3D=
"#000000"><span style=3D"font-size:13.3333px">Android specific idea: I wond=
er if we could tie GEM blob buffers usage to the lmkd and kill based on tha=
t ... ?</span></font></div><div><br></div><div><a href=3D"https://source.an=
droid.com/docs/core/perf/lmkd" target=3D"_blank">https://source.android.com=
/docs/core/perf/lmkd</a><br></div><div><br></div><div>Is there GEM buffer a=
ccounting=C2=A0infrastructure already?</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">=C2=A0/*<br>
=C2=A0 * Event code that&#39;s given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_=
MASK is in<br>
=C2=A0 * effect.=C2=A0 The event size is sizeof(drm_event), since there is =
no additional<br>
@@ -261,6 +271,10 @@ struct drm_virtgpu_context_init {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT=
_INIT,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_virtgpu_=
context_init)<br>
<br>
+#define DRM_IOCTL_VIRTGPU_MADVISE \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MADVISE=
, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_virtgpu=
_madvise)<br>
+<br>
=C2=A0#if defined(__cplusplus)<br>
=C2=A0}<br>
=C2=A0#endif<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--0000000000007e679306094767fc--
