Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4032159DAB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 00:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0796E44C;
	Tue, 11 Feb 2020 23:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82106E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 23:48:55 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b15so210787lfc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fmcRvU+GIRtcxEpoNR1/Jwt7N+LvErM8Hs/QOjADSN8=;
 b=N0KdKUa3ZUHtTuE3TmuW5cG2ZdqCT6NUrDDioygf1Jm1yPXF69UuS0aCIXat1K2MHY
 SAqGbCd7Ynv+rIt3hYxu5acX+wX9kiWZsZ4T1FvwdUL36xmNpoVPEKyWTdko3e18D4l9
 QlP9uq1JKal6EB8pl34ZHJyUMa/GIuZ6th82I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmcRvU+GIRtcxEpoNR1/Jwt7N+LvErM8Hs/QOjADSN8=;
 b=A9y0/JgNi3cXv0cVxseAct8fWO/BkFsnpD3HM/idxHZtTlm6PlDzQLENtrclIn/LGw
 XfYQfDNVTGgP+PNuY6Eal556Kz6phL38qJ8Kmf81ewf/NlbEM6O4NvWAGVMmDXSmErMz
 KGGLk2UjlAf6P6h5Ma4HpcKaWlLfG0VkCLdiEwA7NCHG4AZ13zC7+7Ufo+SrR5V6/cdc
 gGaTNY7dA40UCqIY5OwI1TlOr7DG8x/JA2D1ua4mEehrlYwSaTS2FP0CDBfzk82yF0XJ
 Wd+FOXZhmKmAicH8h0VBIGWZDSZ4kRQ3SZcH+mwz/BsYYtwt8AjC4AKc24ugWXPEDfaF
 rwww==
X-Gm-Message-State: APjAAAWNNp76dRXkJpXt97OoWKyIflgPow7NUrCQsAxlXzQqyUEW/POd
 lWZZSqgdVKEZiDMH4eiPbyopYUrCyX4=
X-Google-Smtp-Source: APXvYqxycsNLfa0wJ7pbOXzap6OA1OaG5VTmv90SsZfn2T6RqHiVVPXedduCyFoB6sLomfhO1y6dvw==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr4952775lfl.64.1581464933785;
 Tue, 11 Feb 2020 15:48:53 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id h5sm2931515lja.16.2020.02.11.15.48.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 15:48:53 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id r14so205563lfm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:48:53 -0800 (PST)
X-Received: by 2002:a19:7b0a:: with SMTP id w10mr5049991lfc.90.1581464932591; 
 Tue, 11 Feb 2020 15:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20200211125751.7697-1-kraxel@redhat.com>
In-Reply-To: <20200211125751.7697-1-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 11 Feb 2020 15:48:41 -0800
X-Gmail-Original-Message-ID: <CAAfnVBkuKY2OQwSPQWw-XOmSv37eYb14JFy1h9i-E1sEiBQmLA@mail.gmail.com>
Message-ID: <CAAfnVBkuKY2OQwSPQWw-XOmSv37eYb14JFy1h9i-E1sEiBQmLA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: rework batching
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 4:58 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Drop the virtio_gpu_{disable,enable}_notify().  Add a new
> virtio_gpu_notify() call instead, which must be called whenever
> the driver wants make sure the host is notified needed.
>
> Drop notification from command submission.  Add virtio_gpu_notify()
> calls everywhere instead.  This results in more batching because we now
> notify only once for a series of commands.  We already had that for page
> flips, now we also batch resource creation (create + attach-backing),
> display updates (edid + display-info) and device initialization.  With
> this in place it is also possible to make notification optional for
> userspace ioctls.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++---
>  drivers/gpu/drm/virtio/virtgpu_display.c |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  4 +++
>  drivers/gpu/drm/virtio/virtgpu_kms.c     |  3 +++
>  drivers/gpu/drm/virtio/virtgpu_object.c  |  1 +
>  drivers/gpu/drm/virtio/virtgpu_plane.c   |  5 ++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 31 +++++++++---------------
>  7 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 7fd8361e1c9e..28aeac8717e1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -179,8 +179,7 @@ struct virtio_gpu_device {
>         struct kmem_cache *vbufs;
>         bool vqs_ready;
>
> -       bool disable_notify;
> -       bool pending_notify;
> +       atomic_t pending_commands;
>
>         struct ida      resource_ida;
>
> @@ -334,8 +333,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
>  void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
>  void virtio_gpu_dequeue_fence_func(struct work_struct *work);
>
> -void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
> -void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
> +void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
>
>  /* virtio_gpu_display.c */
>  void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index 7b0f0643bb2d..e95fcfd8d20c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -90,6 +90,7 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
>         virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
>                                    crtc->mode.hdisplay,
>                                    crtc->mode.vdisplay, 0, 0);
> +       virtio_gpu_notify(vgdev);
>  }
>
>  static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
> @@ -108,6 +109,7 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>         struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
>
>         virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
> +       virtio_gpu_notify(vgdev);
>         output->enabled = false;
>  }
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 205ec4abae2b..75d818d707e6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -158,6 +158,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>
>         virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
>                               vfpriv->ctx_id, buflist, out_fence);
> +       virtio_gpu_notify(vgdev);
>         return 0;
>
>  out_memdup:
> @@ -314,6 +315,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
>                 (vgdev, vfpriv->ctx_id, offset, args->level,
>                  &args->box, objs, fence);
>         dma_fence_put(&fence->f);
> +       virtio_gpu_notify(vgdev);
>         return 0;
>
>  err_unlock:
> @@ -359,6 +361,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
>                          args->level, &args->box, objs, fence);
>                 dma_fence_put(&fence->f);
>         }
> +       virtio_gpu_notify(vgdev);
>         return 0;
>
>  err_unlock:
> @@ -445,6 +448,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
>         /* not in cache - need to talk to hw */
>         virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
>                                   &cache_ent);
> +       virtio_gpu_notify(vgdev);
>
>  copy_exit:
>         ret = wait_event_timeout(vgdev->resp_wq,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index c1086df49816..44e4c07d0162 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -44,6 +44,7 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
>                 if (vgdev->has_edid)
>                         virtio_gpu_cmd_get_edids(vgdev);
>                 virtio_gpu_cmd_get_display_info(vgdev);
> +               virtio_gpu_notify(vgdev);
>                 drm_helper_hpd_irq_event(vgdev->ddev);
>                 events_clear |= VIRTIO_GPU_EVENT_DISPLAY;
>         }
> @@ -92,6 +93,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
>         }
>         for (i = 0; i < num_capsets; i++) {
>                 virtio_gpu_cmd_get_capset_info(vgdev, i);
> +               virtio_gpu_notify(vgdev);
>                 ret = wait_event_timeout(vgdev->resp_wq,
>                                          vgdev->capsets[i].id > 0, 5 * HZ);
>                 if (ret == 0) {
> @@ -206,6 +208,7 @@ int virtio_gpu_init(struct drm_device *dev)
>         if (vgdev->has_edid)
>                 virtio_gpu_cmd_get_edids(vgdev);
>         virtio_gpu_cmd_get_display_info(vgdev);
> +       virtio_gpu_notify(vgdev);
>         wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
>                            5 * HZ);
>         return 0;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 8870ee23ff2b..65d6834d3c74 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -224,6 +224,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 return ret;
>         }
>
> +       virtio_gpu_notify(vgdev);
>         *bo_ptr = bo;
>         return 0;
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index ac42c84d2d7f..fd6487fb0855 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -154,8 +154,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>         if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
>                 return;
>
> -       virtio_gpu_disable_notify(vgdev);
> -
>         bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
>         if (bo->dumb)
>                 virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
> @@ -187,7 +185,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>                                       rect.x2 - rect.x1,
>                                       rect.y2 - rect.y1);
>
> -       virtio_gpu_enable_notify(vgdev);
> +       virtio_gpu_notify(vgdev);
>  }
>
>  static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
> @@ -265,6 +263,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>                          plane->state->crtc_w,
>                          plane->state->crtc_h,
>                          0, 0, objs, vgfb->fence);
> +               virtio_gpu_notify(vgdev);
>                 dma_fence_wait(&vgfb->fence->f, true);
>                 dma_fence_put(&vgfb->fence->f);
>                 vgfb->fence = NULL;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index a682c2fcbe9a..ccc89b7578a0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -329,7 +329,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>                                       int incnt)
>  {
>         struct virtqueue *vq = vgdev->ctrlq.vq;
> -       bool notify = false;
>         int ret;
>
>         if (vgdev->has_indirect)
> @@ -369,16 +368,9 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>
>         trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
>
> -       notify = virtqueue_kick_prepare(vq);
> +       atomic_inc(&vgdev->pending_commands);
>
>         spin_unlock(&vgdev->ctrlq.qlock);
> -
> -       if (notify) {
> -               if (vgdev->disable_notify)
> -                       vgdev->pending_notify = true;
> -               else
> -                       virtqueue_notify(vq);
> -       }
>  }
>
>  static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
> @@ -434,19 +426,20 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>         }
>  }
>
> -void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
> +void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
>  {
> -       vgdev->disable_notify = true;
> -}
> +       bool notify;
>
> -void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
> -{
> -       vgdev->disable_notify = false;
> -
> -       if (!vgdev->pending_notify)
> +       if (atomic_read(&vgdev->pending_commands) == 0)
>                 return;

nit: maybe !atomic_read(&vgdev->pending_commands)?

With or without, this patch is:

Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Tested-by: Gurchetan Singh <gurchetansingh@chromium.org>



> -       vgdev->pending_notify = false;
> -       virtqueue_notify(vgdev->ctrlq.vq);
> +
> +       spin_lock(&vgdev->ctrlq.qlock);
> +       atomic_set(&vgdev->pending_commands, 0);
> +       notify = virtqueue_kick_prepare(vgdev->ctrlq.vq);
> +       spin_unlock(&vgdev->ctrlq.qlock);
> +
> +       if (notify)
> +               virtqueue_notify(vgdev->ctrlq.vq);
>  }
>
>  static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
> --
> 2.18.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
