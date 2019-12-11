Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7E911BC74
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 20:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D306EAAE;
	Wed, 11 Dec 2019 19:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785166EAAE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:04:11 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id z12so20394328iln.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 11:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f1nlOc2n0b1t3obc3rKWIj5ixOjOEEj0+iZqrVipp9o=;
 b=D/1GyM9K41JOlRCD7lN5eU3vWpokEaPbOKAJ6/7sgnF2lgivSxP9Z7lmUx2lOjkZcu
 8jzg7Oh1qQ+jx1kIuLADi92d6wgC/Ho+yXkpv+EOzB02v3tA1EbfQSiP3ZC8yFJ1nXkc
 K6xhywDMCxsFgD/SftI9531KFjj999GO2h/5sdvutSW9i2eEXlrdUJHkZL7V65YPp6cL
 MypyIKnKw7hoh+0/isjG3MchY1pyX3aFaDRwhD720csf7KtAvEFeRmjs8lb6TDJoD19V
 PjuQdELCfa1r1/aD8M91Op+GfPLwqzlONrX3ZWrJmbL8+bAdX20m5V90dGsLIOSirdTi
 MJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f1nlOc2n0b1t3obc3rKWIj5ixOjOEEj0+iZqrVipp9o=;
 b=goK7sTlfx7nuA5P01NPG3CuYcNawcF4iDirMYe2hg5khh5k4HFSpSya6l2l0HxsYFV
 Sv4BdqytsW5TZJFwTJEYGC4haMPRG3lbLzjvbR4JUvgDeviLqnOlAXmAWHSSzAA5U3Ik
 PymkkNjweppjqiNOH4n0JtRV1oil4eYjOjbyx1HtUCl+KMOitX5m/E3QyksU1udeWd94
 PcRm3/XBdMC0y+COM9oFeomhh/P7bs3Rgw+cmVDRbA6m50a41GZ19L2LycJl/6CR4HV0
 Ef0/klvr6vk304oZEOmvqEPuvauYjvyRVXAbUpL4l1XhiUyWayQwitBLYKYtr4JEf75J
 Hvug==
X-Gm-Message-State: APjAAAUXztZbczBZR1o5uHl49/RHSt5lQ1Xa+ryhxGAoMEStPn/LeNKJ
 Kog2hwY965ymtOzt+D0VjewkuXT2sJykTyevRIJgrSAS
X-Google-Smtp-Source: APXvYqxPNqI/M/Od5Srqmugr+fhahB2I9e8NKlqPiAdGKQBh8UdtL9bsnU5VG3zxSSFDPjHZfJ8AxYuPb8Qe6AeW2VA=
X-Received: by 2002:a92:84ce:: with SMTP id y75mr4470966ilk.93.1576091050492; 
 Wed, 11 Dec 2019 11:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20191211084216.25405-1-kraxel@redhat.com>
 <20191211084216.25405-4-kraxel@redhat.com>
In-Reply-To: <20191211084216.25405-4-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 11 Dec 2019 11:03:59 -0800
Message-ID: <CAPaKu7Tv2tGOW+Ns9yRQ0t9-Bk43wtV5KEh72fZuvPaX7Dy_gQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] virtio-gpu: use damage info for display updates.
To: Gerd Hoffmann <kraxel@redhat.com>
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
 Gurchetan Singh <gurchetansingh@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 12:42 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 41 +++++++++++++++-----------
>  1 file changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 2e0d14e005db..1a0fbbb91ec7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -24,6 +24,7 @@
>   */
>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_plane_helper.h>
>
> @@ -103,22 +104,26 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>  }
>
>  static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
> -                                     struct virtio_gpu_object *bo,
> -                                     struct drm_plane_state *state)
> +                                     struct drm_plane_state *state,
> +                                     struct drm_rect *rect)
>  {
> +       struct virtio_gpu_object *bo =
> +               gem_to_virtio_gpu_obj(state->fb->obj[0]);
>         struct virtio_gpu_object_array *objs;
> +       uint32_t w = rect->x2 - rect->x1;
> +       uint32_t h = rect->y2 - rect->y1;
> +       uint32_t x = rect->x1 + (state->src_x >> 16);
> +       uint32_t y = rect->y1 + (state->src_y >> 16);
> +       uint32_t off = x * state->fb->format->cpp[0] +
> +               y * state->fb->pitches[0];
>
>         objs = virtio_gpu_array_alloc(1);
>         if (!objs)
>                 return;
>         virtio_gpu_array_add_obj(objs, &bo->base.base);
> -       virtio_gpu_cmd_transfer_to_host_2d
> -               (vgdev, 0,
> -                state->src_w >> 16,
> -                state->src_h >> 16,
> -                state->src_x >> 16,
> -                state->src_y >> 16,
> -                objs, NULL);
> +
> +       virtio_gpu_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
> +                                          objs, NULL);
>  }
>
>  static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
> @@ -127,8 +132,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>         struct drm_device *dev = plane->dev;
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_output *output = NULL;
> -       struct virtio_gpu_framebuffer *vgfb;
>         struct virtio_gpu_object *bo;
> +       struct drm_rect rect;
>
>         if (plane->state->crtc)
>                 output = drm_crtc_to_virtio_gpu_output(plane->state->crtc);
> @@ -146,12 +151,14 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>                 return;
>         }
>
> +       if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
> +               return;
> +
>         virtio_gpu_disable_notify(vgdev);
>
> -       vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
> -       bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> +       bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
>         if (bo->dumb)
> -               virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
> +               virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
>
>         if (plane->state->fb != old_state->fb) {
>                 DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
> @@ -171,10 +178,10 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>         }
>
>         virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
> -                                     plane->state->src_x >> 16,
> -                                     plane->state->src_y >> 16,
> -                                     plane->state->src_w >> 16,
> -                                     plane->state->src_h >> 16);
> +                                     (plane->state->src_x >> 16) + rect.x1,
> +                                     (plane->state->src_y >> 16) + rect.y1,
Digging into drm_atomic_helper_damage_merged, it seems rect uses
absolute values and is not relative to src_{x,y}.

> +                                     rect.x2 - rect.x1,
> +                                     rect.y2 - rect.y1);
>
>         virtio_gpu_enable_notify(vgdev);
>  }
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
