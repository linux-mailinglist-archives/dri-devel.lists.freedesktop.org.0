Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883C2FB24A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 08:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDB86E82C;
	Tue, 19 Jan 2021 07:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912126E82C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 07:03:56 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id q25so20178724oij.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 23:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EJfr3/AKEq2QADngtAYKe4AoRRhjmaDaH7m9gP7iKZk=;
 b=QTuZQk1jhavaArScLuX825QGN1+4u8iMeAhAGEf2hdFQElT6hBH3OAqp4GWM414T3x
 OhPOEAy1Kz4ZpI9WwoduNX7BOyU8O0lkt1T0VPwCR4IHdm7ulmCEgVs3HjF7Kuo9bVPU
 5zKNsh/v5pHUSHc8+qbV8FUIcMLMob2pq56xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EJfr3/AKEq2QADngtAYKe4AoRRhjmaDaH7m9gP7iKZk=;
 b=bV8y1WSNPdPqrzTb1McyF/9mOBZwHvPPg1wkFF/9X6JVEwXdGzjjQQdUYN60j3AdNp
 0b0N5NnBCP+jv5582932vDAekq7xKuBzcbW0j3BDWuIcEhAOVNFwVg7uFhdinh4ybhW/
 2S6RZ+/ePF/V89/eVxH2KmqAlj4NX+1nU4SikbPRKXkuxXM0gRAPRJHr3aJ2r45/1QN7
 oJOy6K49UOFLe2ouPnfyhP+pW0e0wT2C07IGw7QiRqitXTtdaH7PVHAU3HOGAPTCdIWR
 OVifN7wMfDAg/zblr/JkOop88HpFRbDDVgscNcuQrM9nxB431IeztKwWXhirH6Gpq2vX
 ZvUQ==
X-Gm-Message-State: AOAM530cV/1Rp7C7npIzWeTxep9lXW9zWjqQsIKglYYpGaYs7DKTJSMC
 rV3Rs5iT2MnXqoj0U8n84K0XwkRHJSm1fXffnWiV3A==
X-Google-Smtp-Source: ABdhPJwzWPH2WmifDkmYPSJv8qrdqWCijQwai9Z73gYetT9ZosaVToylZDsq4xxrQohrbu5edGpgeFpegU9SJ40pzxU=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr1708049oie.128.1611039835927; 
 Mon, 18 Jan 2021 23:03:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKB3++adfpdBHFEyGZ3v2V6zyW+ayg86CLDRKx1ty+OytjYFNw@mail.gmail.com>
 <20210118234057.270930-1-zzyiwei@android.com>
In-Reply-To: <20210118234057.270930-1-zzyiwei@android.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 08:03:44 +0100
Message-ID: <CAKMK7uE+7S5q8bU0ibyepb8yQL3QYNjZE+Jwf13+bVfAmoSuhw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Track total GPU memory for virtio driver
To: Yiwei Zhang <zzyiwei@android.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 12:41 AM Yiwei Zhang <zzyiwei@android.com> wrote:
>
> On the success of virtio_gpu_object_create, add size of newly allocated
> bo to the tracled total_mem. In drm_gem_object_funcs.free, after the gem
> bo lost its last refcount, subtract the bo size from the tracked
> total_mem if the original underlying memory allocation is successful.
>
> Signed-off-by: Yiwei Zhang <zzyiwei@android.com>

Isn't this something that ideally we'd for everyone? Also tracepoint
for showing the total feels like tracepoint abuse, usually we show
totals somewhere in debugfs or similar, and tracepoint just for what's
happening (i.e. which object got deleted/created).

What is this for exactly?
-Daniel

> ---
>  drivers/gpu/drm/virtio/Kconfig          |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 ++++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 19 +++++++++++++++++++
>  3 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
> index b925b8b1da16..e103b7e883b1 100644
> --- a/drivers/gpu/drm/virtio/Kconfig
> +++ b/drivers/gpu/drm/virtio/Kconfig
> @@ -5,6 +5,7 @@ config DRM_VIRTIO_GPU
>         select DRM_KMS_HELPER
>         select DRM_GEM_SHMEM_HELPER
>         select VIRTIO_DMA_SHARED_BUFFER
> +       select TRACE_GPU_MEM
>         help
>            This is the virtual GPU driver for virtio.  It can be used with
>            QEMU based VMMs (like KVM or Xen).
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 6a232553c99b..7c60e7486bc4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -249,6 +249,10 @@ struct virtio_gpu_device {
>         spinlock_t resource_export_lock;
>         /* protects map state and host_visible_mm */
>         spinlock_t host_visible_lock;
> +
> +#ifdef CONFIG_TRACE_GPU_MEM
> +       atomic64_t total_mem;
> +#endif
>  };
>
>  struct virtio_gpu_fpriv {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index d69a5b6da553..1e16226cebbe 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -25,12 +25,29 @@
>
>  #include <linux/dma-mapping.h>
>  #include <linux/moduleparam.h>
> +#ifdef CONFIG_TRACE_GPU_MEM
> +#include <trace/events/gpu_mem.h>
> +#endif
>
>  #include "virtgpu_drv.h"
>
>  static int virtio_gpu_virglrenderer_workaround = 1;
>  module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
>
> +#ifdef CONFIG_TRACE_GPU_MEM
> +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
> +                                             s64 delta)
> +{
> +       u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
> +
> +       trace_gpu_mem_total(0, 0, total_mem);
> +}
> +#else
> +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *, s64)
> +{
> +}
> +#endif
> +
>  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
>  {
>         if (virtio_gpu_virglrenderer_workaround) {
> @@ -104,6 +121,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
>         struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
>
>         if (bo->created) {
> +               virtio_gpu_trace_total_mem(vgdev, -(obj->size));
>                 virtio_gpu_cmd_unref_resource(vgdev, bo);
>                 virtio_gpu_notify(vgdev);
>                 /* completion handler calls virtio_gpu_cleanup_object() */
> @@ -265,6 +283,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
>         }
>
> +       virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
>         *bo_ptr = bo;
>         return 0;
>
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
