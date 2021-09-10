Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643240720C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 21:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AB46EA8A;
	Fri, 10 Sep 2021 19:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073AA6EA8A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 19:33:33 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a25so6416263ejv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z3y+Ey9wUHbbZ9CYqV+WTt5oBNxGEdcjI9CJrrEI4tg=;
 b=MUKeg6HP7ZwDYLBJPvpMHkHOjHb44H/kJYoyHfcKSeaUp8Q9GkhCR3cEMAPfybGe5p
 BSjU/7bAdrOSpvEERVq2Ga8/zS8h/C5S87MBEHY4CCcw3snBqCHpkSl1kSOGj94uQsNE
 XBy7saiw1mFQTr6UXW8J8tL6mVxVBDjMeUkTU77CBQWYMAX1+bckXCfeFXlKZk1gbSlt
 2Y3vGmR+V/NOv3oF+FlfwHovbim2cmKUr9HMkFqlae7S/OXDmx1yZBqL7JcvL81k4RUK
 G9Fx+8rfIZp2ypt/Gmi1RhJ/bh9dG91uSyzQjTbC7ehCQdvj4p4/rQPbAdXhuiOhdf7Z
 BRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3y+Ey9wUHbbZ9CYqV+WTt5oBNxGEdcjI9CJrrEI4tg=;
 b=gtDSbFdvP2YwtaYR5DGkx1e5fPr05R2sykcjm1cFoNWafqUZEoO/Fk5rBugDHDvEM8
 A1fqBf2g7kt8hrXRFM4gkj/sf7sQhu3ISamdb4kFjGsbJJdicO/7wk8uQLBXLa5tRLO3
 7uRR3uIJwftFHY6hjQq0gVlC3/p5NlzruHbU3l3OZsCrNr/K864ddooT0+AoXHlqCktk
 Aivhn0s5qoTtWr6sHtNVxZk4Yd4NCPkcmhNd6EmSZAE737OaJXazo5HybJ2I2QSqRNqr
 LJhWRlN1Eb8jk3zzL4ZVkVY68ZccmT98OZ9+ChBj7kF7PXnTmrFw7pCWoD44Y6Pg3lg5
 OtMQ==
X-Gm-Message-State: AOAM531MoEpC8P4Ief/7V5HaNBqGPp4VUgt5S2mrAAGqzz+Ms5XL7mnY
 9cgNHnJuUlRDbv1x3VjDoXaLLacCNjHTEVw+3Gs=
X-Google-Smtp-Source: ABdhPJyqtc3hsDdxPjsNaURpFGnNNqkKSfqdJ/DqepBjT15EHb6gOlUBO7oVwmWOC8FB3mr0jEJuBbN7DuzHn5bYglY=
X-Received: by 2002:a17:907:1113:: with SMTP id
 qu19mr11183293ejb.524.1631302412418; 
 Fri, 10 Sep 2021 12:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-10-gurchetansingh@chromium.org>
In-Reply-To: <20210909013717.861-10-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 10 Sep 2021 12:33:21 -0700
Message-ID: <CAPaKu7RB0hHTW9_WoOvp1X1Wz8L65ptSsJXKcPu22Rm9NKjAFQ@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v1 09/12] drm/virtio: implement context init:
 allocate an array of fence contexts
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 8, 2021 at 6:37 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> We don't want fences from different 3D contexts (virgl, gfxstream,
> venus) to be on the same timeline.  With explicit context creation,
> we can specify the number of ring each context wants.
>
> Execbuffer can specify which ring to use.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Acked-by: Lingfeng Yang <lfy@google.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index a5142d60c2fa..cca9ab505deb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -56,6 +56,7 @@
>  #define STATE_ERR 2
>
>  #define MAX_CAPSET_ID 63
> +#define MAX_RINGS 64
>
>  struct virtio_gpu_object_params {
>         unsigned long size;
> @@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {
>         uint32_t ctx_id;
>         uint32_t context_init;
>         bool context_created;
> +       uint32_t num_rings;
> +       uint64_t base_fence_ctx;
>         struct mutex context_lock;
>  };
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index f51f3393a194..262f79210283 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -99,6 +99,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>         int in_fence_fd = exbuf->fence_fd;
>         int out_fence_fd = -1;
>         void *buf;
> +       uint64_t fence_ctx;
> +       uint32_t ring_idx;
> +
> +       fence_ctx = vgdev->fence_drv.context;
> +       ring_idx = 0;
>
>         if (vgdev->has_virgl_3d == false)
>                 return -ENOSYS;
> @@ -106,6 +111,17 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>         if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
>                 return -EINVAL;
>
> +       if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
> +               if (exbuf->ring_idx >= vfpriv->num_rings)
> +                       return -EINVAL;
> +
> +               if (!vfpriv->base_fence_ctx)
> +                       return -EINVAL;
> +
> +               fence_ctx = vfpriv->base_fence_ctx;
> +               ring_idx = exbuf->ring_idx;
> +       }
> +
>         exbuf->fence_fd = -1;
>
>         virtio_gpu_create_context(dev, file);
> @@ -173,7 +189,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>                         goto out_memdup;
>         }
>
> -       out_fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
> +       out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>         if(!out_fence) {
>                 ret = -ENOMEM;
>                 goto out_unresv;
> @@ -691,7 +707,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>                 return -EINVAL;
>
>         /* Number of unique parameters supported at this time. */
> -       if (num_params > 1)
> +       if (num_params > 2)
>                 return -EINVAL;
>
>         ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
> @@ -731,6 +747,20 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>
>                         vfpriv->context_init |= value;
>                         break;
> +               case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
> +                       if (vfpriv->base_fence_ctx) {
> +                               ret = -EINVAL;
> +                               goto out_unlock;
> +                       }
> +
> +                       if (value > MAX_RINGS) {
> +                               ret = -EINVAL;
> +                               goto out_unlock;
> +                       }
> +
> +                       vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
With multiple fence contexts, we should do something about implicit fencing.

The classic example is Mesa and X server.  When both use virgl and the
global fence context, no dma_fence_wait is fine.  But when Mesa uses
venus and the ring fence context, dma_fence_wait should be inserted.


> +                       vfpriv->num_rings = value;
> +                       break;
>                 default:
>                         ret = -EINVAL;
>                         goto out_unlock;
> --
> 2.33.0.153.gba50c8fa24-goog
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
