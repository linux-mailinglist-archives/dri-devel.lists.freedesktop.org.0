Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 348D744DB13
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 18:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E9B6E0D5;
	Thu, 11 Nov 2021 17:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7772E6E0D5;
 Thu, 11 Nov 2021 17:25:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso2564474wmr.4; 
 Thu, 11 Nov 2021 09:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zgBKXggqPVetU68KGBm4584kojRj0gkhJsc4ekHLtyY=;
 b=mSBO6jKvUDUrDujMOOsE9+haj1UlgrHhJjBMLp+MUUODGjC0fETAzOH2omwVOTMM4c
 M0AvPQ59w185Qvd6y44tcaOHtbzl3TdnObRC/1j8BAKewAbPIJpX7T5O/F0I2hbD0UTV
 NzKVONgAzE5ckF/sAsXUliYy9lTXPqQMcnpSGesk+O58aakGbkRFKV5H+Yoxi5rEzO29
 wfXt02m1sy6ANbsLtnGwZFfRxKQ2tWA67JnQdKNSV5IkqXjQ5RsOFaOka/j6jJzVo3Ea
 8jRZMxIE0z2uOVfoCMg4tLoCXaL8LstYPp77OR4MmbKC147Zf2GcpKk7LwqL8aFMbMGR
 6OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zgBKXggqPVetU68KGBm4584kojRj0gkhJsc4ekHLtyY=;
 b=MSLaq/MYAwLMS2UAMq2BqXNM5S0vCADqXYSrmuN4F2oGGmOl4OHGY6Njzmhvd2EOId
 K5833jdT9Y7nHDXBAuhw6UQLuC5AL0ErUsKCmm5IUwPwnV/nPo7Aoc3yzekzeJbtpmnw
 yDQ8JhbyscCwZo7fuNkWBEEInPM5Dp97bB9kyiAiKqWzkccF0zoW0i4H6Q2uQgrc9Mdd
 KuLKcWS8D/kkhIuCjP7I96Yt8MVP5AaWDK84BzBopAtm15FbLOOTWqzAEysniKWfhJxM
 MZJJX0JU+nUQWyBPx3gLsi+PJEfg7sJJA4+mJ510Y3RvPtKlqeKGBKetoXGrPaU+GCIN
 gzog==
X-Gm-Message-State: AOAM531Xev8nV2OSSE2uN4dDCaE5Cf2DahbZzXDFXmmwFWAA5HhLhU4V
 nSMMbyO0v50wJkwTBKmAfkT7m/M9X3AmajbmDrMN7t2C
X-Google-Smtp-Source: ABdhPJy5WFdLyHrsPjo1iNYVbiP4ZiianEc/xZ5/y9q1/GLbYdL1vltvRakXuSPeGRQRAuR4T50SmoPrDwWNXwHlEOQ=
X-Received: by 2002:a05:600c:4f4b:: with SMTP id
 m11mr9661150wmq.151.1636651503677; 
 Thu, 11 Nov 2021 09:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-8-robdclark@gmail.com>
 <e9e50cad-2341-cb25-ef84-0d61a2cb7469@codeaurora.org>
 <CAF6AEGvTyy-MCv6wdkpPyohLwUg4U_2ACT0gsXRG2z6iOYQ+Tg@mail.gmail.com>
 <7bc57359-0cf1-d657-f23e-e89404da6e91@codeaurora.org>
In-Reply-To: <7bc57359-0cf1-d657-f23e-e89404da6e91@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Nov 2021 09:30:02 -0800
Message-ID: <CAF6AEGsy1WZHOnuOgviFxW8y7yzmfGE4pWYzoAFXfxbS09m5pg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 07/13] drm/msm: Track "seqno" fences by idr
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 7:54 AM Akhil P Oommen <akhilpo@codeaurora.org> wro=
te:
>
> On 11/10/2021 10:25 PM, Rob Clark wrote:
> > On Wed, Nov 10, 2021 at 7:28 AM Akhil P Oommen <akhilpo@codeaurora.org>=
 wrote:
> >>
> >> On 7/28/2021 6:36 AM, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Previously the (non-fd) fence returned from submit ioctl was a raw
> >>> seqno, which is scoped to the ring.  But from UABI standpoint, the
> >>> ioctls related to seqno fences all specify a submitqueue.  We can
> >>> take advantage of that to replace the seqno fences with a cyclic idr
> >>> handle.
> >>>
> >>> This is in preperation for moving to drm scheduler, at which point
> >>> the submit ioctl will return after queuing the submit job to the
> >>> scheduler, but before the submit is written into the ring (and
> >>> therefore before a ring seqno has been assigned).  Which means we
> >>> need to replace the dma_fence that userspace may need to wait on
> >>> with a scheduler fence.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/msm/msm_drv.c         | 30 +++++++++++++++++--
> >>>    drivers/gpu/drm/msm/msm_fence.c       | 42 -----------------------=
----
> >>>    drivers/gpu/drm/msm/msm_fence.h       |  3 --
> >>>    drivers/gpu/drm/msm/msm_gem.h         |  1 +
> >>>    drivers/gpu/drm/msm/msm_gem_submit.c  | 23 ++++++++++++++-
> >>>    drivers/gpu/drm/msm/msm_gpu.h         |  5 ++++
> >>>    drivers/gpu/drm/msm/msm_submitqueue.c |  5 ++++
> >>>    7 files changed, 61 insertions(+), 48 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_=
drv.c
> >>> index 9b8fa2ad0d84..1594ae39d54f 100644
> >>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>> @@ -911,6 +911,7 @@ static int msm_ioctl_wait_fence(struct drm_device=
 *dev, void *data,
> >>>        ktime_t timeout =3D to_ktime(args->timeout);
> >>>        struct msm_gpu_submitqueue *queue;
> >>>        struct msm_gpu *gpu =3D priv->gpu;
> >>> +     struct dma_fence *fence;
> >>>        int ret;
> >>>
> >>>        if (args->pad) {
> >>> @@ -925,10 +926,35 @@ static int msm_ioctl_wait_fence(struct drm_devi=
ce *dev, void *data,
> >>>        if (!queue)
> >>>                return -ENOENT;
> >>>
> >>> -     ret =3D msm_wait_fence(gpu->rb[queue->prio]->fctx, args->fence,=
 &timeout,
> >>> -             true);
> >>> +     /*
> >>> +      * Map submitqueue scoped "seqno" (which is actually an idr key=
)
> >>> +      * back to underlying dma-fence
> >>> +      *
> >>> +      * The fence is removed from the fence_idr when the submit is
> >>> +      * retired, so if the fence is not found it means there is noth=
ing
> >>> +      * to wait for
> >>> +      */
> >>> +     ret =3D mutex_lock_interruptible(&queue->lock);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +     fence =3D idr_find(&queue->fence_idr, args->fence);
> >>> +     if (fence)
> >>> +             fence =3D dma_fence_get_rcu(fence);
> >>> +     mutex_unlock(&queue->lock);
> >>> +
> >>> +     if (!fence)
> >>> +             return 0;
> >>>
> >>> +     ret =3D dma_fence_wait_timeout(fence, true, timeout_to_jiffies(=
&timeout));
> >>> +     if (ret =3D=3D 0) {
> >>> +             ret =3D -ETIMEDOUT;
> >>> +     } else if (ret !=3D -ERESTARTSYS) {
> >>> +             ret =3D 0;
> >>> +     }
> >>> +
> >>> +     dma_fence_put(fence);
> >>>        msm_submitqueue_put(queue);
> >>> +
> >>>        return ret;
> >>>    }
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/ms=
m_fence.c
> >>> index b92a9091a1e2..f2cece542c3f 100644
> >>> --- a/drivers/gpu/drm/msm/msm_fence.c
> >>> +++ b/drivers/gpu/drm/msm/msm_fence.c
> >>> @@ -24,7 +24,6 @@ msm_fence_context_alloc(struct drm_device *dev, vol=
atile uint32_t *fenceptr,
> >>>        strncpy(fctx->name, name, sizeof(fctx->name));
> >>>        fctx->context =3D dma_fence_context_alloc(1);
> >>>        fctx->fenceptr =3D fenceptr;
> >>> -     init_waitqueue_head(&fctx->event);
> >>>        spin_lock_init(&fctx->spinlock);
> >>>
> >>>        return fctx;
> >>> @@ -45,53 +44,12 @@ static inline bool fence_completed(struct msm_fen=
ce_context *fctx, uint32_t fenc
> >>>                (int32_t)(*fctx->fenceptr - fence) >=3D 0;
> >>>    }
> >>>
> >>> -/* legacy path for WAIT_FENCE ioctl: */
> >>> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> >>> -             ktime_t *timeout, bool interruptible)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     if (fence > fctx->last_fence) {
> >>> -             DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u=
 (of %u)\n",
> >>> -                             fctx->name, fence, fctx->last_fence);
> >>> -             return -EINVAL;
> >>
> >> Rob, we changed this pre-existing behaviour in this patch. Now, when
> >> userspace tries to wait on a future fence, we don't return an error.
> >>
> >> I just want to check if this was accidental or not?
> >
> > Hmm, perhaps we should do this to restore the previous behavior:
> >
> > -------------
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 73e827641024..3dd6da56eae6 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1000,8 +1000,12 @@ static int msm_ioctl_wait_fence(struct
> > drm_device *dev, void *data,
> >                  fence =3D dma_fence_get_rcu(fence);
> >          mutex_unlock(&queue->lock);
> >
> > -       if (!fence)
> > -               return 0;
> > +       if (!fence) {
> > +               struct msm_fence_context *fctx =3D gpu->rb[queue->ring_=
nr]->fctx;
> > +               DRM_ERROR_RATELIMITED("%s: waiting on invalid fence:
> > %u (of %u)\n",
> > +                                     fctx->name, fence, fctx->last_fen=
ce);
> > +               return -EINVAL;
> > +       }
>
> With this, when userspace tries to wait on a fence which is already
> retired, it gets -EINVAL instead of success. Will this break userspace?

Oh, right, we definitely don't want that.. I guess that was the reason
for the original logic.

I have a different idea.. will send a patch in a bit.

BR,
-R

> -Akhil.
>
> >
> >          ret =3D dma_fence_wait_timeout(fence, true, timeout_to_jiffies=
(&timeout));
> >          if (ret =3D=3D 0) {
> > -------------
> >
> > BR,
> > -R
> >
> >> -Akhil.
> >>
> >>> -     }
> >>> -
> >>> -     if (!timeout) {
> >>> -             /* no-wait: */
> >>> -             ret =3D fence_completed(fctx, fence) ? 0 : -EBUSY;
> >>> -     } else {
> >>> -             unsigned long remaining_jiffies =3D timeout_to_jiffies(=
timeout);
> >>> -
> >>> -             if (interruptible)
> >>> -                     ret =3D wait_event_interruptible_timeout(fctx->=
event,
> >>> -                             fence_completed(fctx, fence),
> >>> -                             remaining_jiffies);
> >>> -             else
> >>> -                     ret =3D wait_event_timeout(fctx->event,
> >>> -                             fence_completed(fctx, fence),
> >>> -                             remaining_jiffies);
> >>> -
> >>> -             if (ret =3D=3D 0) {
> >>> -                     DBG("timeout waiting for fence: %u (completed: =
%u)",
> >>> -                                     fence, fctx->completed_fence);
> >>> -                     ret =3D -ETIMEDOUT;
> >>> -             } else if (ret !=3D -ERESTARTSYS) {
> >>> -                     ret =3D 0;
> >>> -             }
> >>> -     }
> >>> -
> >>> -     return ret;
> >>> -}
> >>> -
> >>>    /* called from workqueue */
> >>>    void msm_update_fence(struct msm_fence_context *fctx, uint32_t fen=
ce)
> >>>    {
> >>>        spin_lock(&fctx->spinlock);
> >>>        fctx->completed_fence =3D max(fence, fctx->completed_fence);
> >>>        spin_unlock(&fctx->spinlock);
> >>> -
> >>> -     wake_up_all(&fctx->event);
> >>>    }
> >>>
> >>>    struct msm_fence {
> >>> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/ms=
m_fence.h
> >>> index 6ab97062ff1a..4783db528bcc 100644
> >>> --- a/drivers/gpu/drm/msm/msm_fence.h
> >>> +++ b/drivers/gpu/drm/msm/msm_fence.h
> >>> @@ -49,7 +49,6 @@ struct msm_fence_context {
> >>>         */
> >>>        volatile uint32_t *fenceptr;
> >>>
> >>> -     wait_queue_head_t event;
> >>>        spinlock_t spinlock;
> >>>    };
> >>>
> >>> @@ -57,8 +56,6 @@ struct msm_fence_context * msm_fence_context_alloc(=
struct drm_device *dev,
> >>>                volatile uint32_t *fenceptr, const char *name);
> >>>    void msm_fence_context_free(struct msm_fence_context *fctx);
> >>>
> >>> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> >>> -             ktime_t *timeout, bool interruptible);
> >>>    void msm_update_fence(struct msm_fence_context *fctx, uint32_t fen=
ce);
> >>>
> >>>    struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx)=
;
> >>> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_=
gem.h
> >>> index da3af702a6c8..e0579abda5b9 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gem.h
> >>> +++ b/drivers/gpu/drm/msm/msm_gem.h
> >>> @@ -320,6 +320,7 @@ struct msm_gem_submit {
> >>>        struct ww_acquire_ctx ticket;
> >>>        uint32_t seqno;         /* Sequence number of the submit on th=
e ring */
> >>>        struct dma_fence *fence;
> >>> +     int fence_id;       /* key into queue->fence_idr */
> >>>        struct msm_gpu_submitqueue *queue;
> >>>        struct pid *pid;    /* submitting process */
> >>>        bool fault_dumped;  /* Limit devcoredump dumping to one per su=
bmit */
> >>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/m=
sm/msm_gem_submit.c
> >>> index 4f02fa3c78f9..f6f595aae2c5 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> >>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> >>> @@ -68,7 +68,14 @@ void __msm_gem_submit_destroy(struct kref *kref)
> >>>                        container_of(kref, struct msm_gem_submit, ref)=
;
> >>>        unsigned i;
> >>>
> >>> +     if (submit->fence_id) {
> >>> +             mutex_lock(&submit->queue->lock);
> >>> +             idr_remove(&submit->queue->fence_idr, submit->fence_id)=
;
> >>> +             mutex_unlock(&submit->queue->lock);
> >>> +     }
> >>> +
> >>>        dma_fence_put(submit->fence);
> >>> +
> >>>        put_pid(submit->pid);
> >>>        msm_submitqueue_put(submit->queue);
> >>>
> >>> @@ -872,6 +879,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev,=
 void *data,
> >>>                goto out;
> >>>        }
> >>>
> >>> +     /*
> >>> +      * Allocate an id which can be used by WAIT_FENCE ioctl to map =
back
> >>> +      * to the underlying fence.
> >>> +      */
> >>> +     mutex_lock(&queue->lock);
> >>> +     submit->fence_id =3D idr_alloc_cyclic(&queue->fence_idr,
> >>> +                     submit->fence, 0, INT_MAX, GFP_KERNEL);
> >>> +     mutex_unlock(&queue->lock);
> >>> +     if (submit->fence_id < 0) {
> >>> +             ret =3D submit->fence_id =3D 0;
> >>> +             submit->fence_id =3D 0;
> >>> +             goto out;
> >>> +     }
> >>> +
> >>>        if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> >>>                struct sync_file *sync_file =3D sync_file_create(submi=
t->fence);
> >>>                if (!sync_file) {
> >>> @@ -886,7 +907,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, =
void *data,
> >>>
> >>>        msm_gpu_submit(gpu, submit);
> >>>
> >>> -     args->fence =3D submit->fence->seqno;
> >>> +     args->fence =3D submit->fence_id;
> >>>
> >>>        msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
> >>>        msm_process_post_deps(post_deps, args->nr_out_syncobjs,
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_=
gpu.h
> >>> index 96efcb31e502..579627252540 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>> @@ -263,6 +263,9 @@ struct msm_gpu_perfcntr {
> >>>     *             which set of pgtables do submits jobs associated wi=
th the
> >>>     *             submitqueue use)
> >>>     * @node:      node in the context's list of submitqueues
> >>> + * @fence_idr: maps fence-id to dma_fence for userspace visible fenc=
e
> >>> + *             seqno, protected by submitqueue lock
> >>> + * @lock:      submitqueue lock
> >>>     * @ref:       reference count
> >>>     */
> >>>    struct msm_gpu_submitqueue {
> >>> @@ -272,6 +275,8 @@ struct msm_gpu_submitqueue {
> >>>        int faults;
> >>>        struct msm_file_private *ctx;
> >>>        struct list_head node;
> >>> +     struct idr fence_idr;
> >>> +     struct mutex lock;
> >>>        struct kref ref;
> >>>    };
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/=
msm/msm_submitqueue.c
> >>> index 9e9fec61d629..66f8d0fb38b0 100644
> >>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> >>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> >>> @@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
> >>>        struct msm_gpu_submitqueue *queue =3D container_of(kref,
> >>>                struct msm_gpu_submitqueue, ref);
> >>>
> >>> +     idr_destroy(&queue->fence_idr);
> >>> +
> >>>        msm_file_private_put(queue->ctx);
> >>>
> >>>        kfree(queue);
> >>> @@ -89,6 +91,9 @@ int msm_submitqueue_create(struct drm_device *drm, =
struct msm_file_private *ctx,
> >>>        if (id)
> >>>                *id =3D queue->id;
> >>>
> >>> +     idr_init(&queue->fence_idr);
> >>> +     mutex_init(&queue->lock);
> >>> +
> >>>        list_add_tail(&queue->node, &ctx->submitqueues);
> >>>
> >>>        write_unlock(&ctx->queuelock);
> >>>
> >>
>
