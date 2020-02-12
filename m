Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9845215AFAA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 19:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511716E0EF;
	Wed, 12 Feb 2020 18:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E896E0EF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:23:53 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c16so3355538ioh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b+DAXXKCbPYVpdtSBetgHy/+8Iiz8QVNmv4wPJt2ZGw=;
 b=SRFpLSOMQ48Nug7miQDT1k7pJK/Aa90LOOQB2ztM7CAguyWY+EzctjYSAFx0Le53sG
 BiUDHnfZUffvNYTqz5xjc+aFtXbjjZDblFzz7uGaDCh0RZATIwv9lT9N/81eKyA8wh68
 cZ/FN1D/b5DaOQe4tmBNULiiHMeF38oFIa0tWjhuvs7tAE2HD5tFSBV8IWLxHUFmW15j
 mbUwyJmDxUBBkaVQZ1f4fCspBLMSoDuFRR5Sw2FiXe7B4EWbBdBk+yN71Gph6j2fKoSK
 09lugkN9z+cdw77HSX1UIiwdjjJtY/Dnt+tQWdmboJRwDa6ILI3wpofXMt9kn+ZCRIHv
 YPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b+DAXXKCbPYVpdtSBetgHy/+8Iiz8QVNmv4wPJt2ZGw=;
 b=LBoXYXAFg7JEyDf0aYCGH27P9DsQL042yW7ja7E8kE+sPADrkk6/FhM8QK3tKQMBG5
 l5pmyc3T1BJ6LLHTvupnk6PHInDCgflXw7MozJ2cmeWOTp58Gi4KsxbjUH74Zzxwzsiv
 YL3uMz7FCGi7QsFbnpb8BNJz/+UGCdsXw8sfZFvnYyT9msu8ozi08aer7pfLQkFJZ+Yk
 TSzRrTI1ggdXhEyouiQlZTh+8co/50S1myc+P8c/0eWNOfBUep4ria3fhvT02J5xOXlo
 RBtI1QHJSDQ0nFynyzVzzBiualLWjNElJZyqRkMND0AAjgrl0s5Q2xi1IlWKMzSy1dKc
 cVmw==
X-Gm-Message-State: APjAAAWPAX0eBqqDWKvoy/D/IV+ms8tUFuW+QpCjNu7h/csq+Dfks5I6
 7NT3cZmCqOIjbQZZscFYfKJlWVUgKQDcukDsmTE=
X-Google-Smtp-Source: APXvYqyBnkyCKeQLTszGJpzkGExR01eLe6I9CLu8wQSRkPa37wX2gXPvZ9TXRcE5t8TBdLaQFVp3zBrJfFOT2XMD91o=
X-Received: by 2002:a5e:df06:: with SMTP id f6mr19123552ioq.84.1581531832229; 
 Wed, 12 Feb 2020 10:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20200212111246.12563-1-kraxel@redhat.com>
In-Reply-To: <20200212111246.12563-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 12 Feb 2020 10:23:41 -0800
Message-ID: <CAPaKu7QWFxEgbsyqKK1LmHvtQUvaHAReScyq-J6rSLNEGpE5XA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: rework batching
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 3:13 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
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
Can you separate out the batching changes (create + attach-backing,
edid + display-info, etc.)?  This patch can mechanically append a
virtio_gpu_notify call to every virtio_gpu_cmd_* call site. A second
patch can make the batching changes.




>
> v2:
>  - rebase to latest drm-misc-next.
>  - use "if (!atomic_read())".
>  - add review & test tags.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Tested-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++---
>  drivers/gpu/drm/virtio/virtgpu_display.c |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  4 ++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c     |  3 +++
>  drivers/gpu/drm/virtio/virtgpu_object.c  |  1 +
>  drivers/gpu/drm/virtio/virtgpu_plane.c   |  5 ++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 30 ++++++++++--------------
>  7 files changed, 26 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index af9403e1cf78..2f6c4ccbfd14 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -179,8 +179,7 @@ struct virtio_gpu_device {
>         struct virtio_gpu_queue cursorq;
>         struct kmem_cache *vbufs;
>
> -       bool disable_notify;
> -       bool pending_notify;
> +       atomic_t pending_commands;
nit: this could be named ctrlq_pending_commands or be moved to virtio_gpu_queue.

>
>         struct ida      resource_ida;
>
> @@ -335,8 +334,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
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
> index af953db4a0c9..2b7e6ae65546 100644
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
> index 4009c2f97d08..7eabcf1ca424 100644
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
> @@ -205,6 +207,7 @@ int virtio_gpu_init(struct drm_device *dev)
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
> index cfe9c54f87a3..357fef8197dc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -329,7 +329,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>                                       int incnt)
>  {
>         struct virtqueue *vq = vgdev->ctrlq.vq;
> -       bool notify = false;
>         int ret, idx;
>
>         if (!drm_dev_enter(vgdev->ddev, &idx)) {
> @@ -368,16 +367,10 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>
>         trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
>
> -       notify = virtqueue_kick_prepare(vq);
> +       atomic_inc(&vgdev->pending_commands);
>
>         spin_unlock(&vgdev->ctrlq.qlock);
>
> -       if (notify) {
> -               if (vgdev->disable_notify)
> -                       vgdev->pending_notify = true;
> -               else
> -                       virtqueue_notify(vq);
> -       }
>         drm_dev_exit(idx);
>  }
>
> @@ -434,19 +427,20 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
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
> +       if (!atomic_read(&vgdev->pending_commands))
>                 return;
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
