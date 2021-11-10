Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E944C560
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 17:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E676ECAC;
	Wed, 10 Nov 2021 16:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1C56ECA9;
 Wed, 10 Nov 2021 16:50:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t30so5103132wra.10;
 Wed, 10 Nov 2021 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eR4jNFzMGlAgEWXem5yydSyKU3CgC5+uZrpi0np/BnQ=;
 b=ZYQUsMDqqIb3S5lvoSokg+PHpbVHP3e01n/9MbjlRUiyS4zKcZwHcA0eLG5qD6ryCa
 FVLFqSu6dd8q1IGyziMgbaPbzd92M0F2vx/NwLglYpSSDfHh2fn622kvhYwfCShAMPuz
 ePdlD2tkxP5pqIDC95YiN9VhtcOJ3DZ2vG5t0lCuqjV4U2U+wIk8/AczlFYpOv+jaT4v
 8Y4/Js2QUntPaBQtJyipYtDIuvw2T1mO3B9jDUissSaq6xFLu2Uwn4uYMPggVZm0/3Fe
 DLYocrbLBAT0aPvu+MxbIYzW+eP8/d4WHtJxxmaXxoTavg6VpaAHoz3cjMBAST9+vyNm
 9A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eR4jNFzMGlAgEWXem5yydSyKU3CgC5+uZrpi0np/BnQ=;
 b=S0/6dY+PkYSffHEb0+73IxgncFxfrumwzNpEHE7qU0o8whx9yYZL3q9jFwkXVMb/AO
 f5gCoc5BMDwsbEeG2P8T3immu0xMcwZ3/fUaNprgkP5NXiqDYMjnvfGePPdAqR99keIu
 qZ6Ti/ZkwLdnD65/7vkTVRS+B4S68YI7HCQummasI2jMD+29909lSaM8EYFCMJompEix
 hxK7pRNwocwuEhAIqxJUnw8nSQrNj4KJZIMQ7N6ocgduV+NoNXJDn6euQlzJzuSl2OvG
 G6OtqAujskEiriSqU3vTlbwSf0SijawRAH/v7VtkmJFfHlbXWiKOGgDECgwzU9p2qNqZ
 wR3A==
X-Gm-Message-State: AOAM533O6rdvQPxe4UefAjKOJZyKY5H0MyrC/aX96ivmg8zrbc4tKKUW
 m+FT/i5fzmRfdiuQ03OeNzDBlS8/7HtebpOsQjQ=
X-Google-Smtp-Source: ABdhPJwVuDS+zysjF5ok8TtxlNYkrrfY22PLS/0jF/6GPm4eWx86xHtk/lOCfL8BHHHpd+cCwwcxLN0nfz6rsacY3LM=
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr512528wry.398.1636563005724; 
 Wed, 10 Nov 2021 08:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-8-robdclark@gmail.com>
 <e9e50cad-2341-cb25-ef84-0d61a2cb7469@codeaurora.org>
In-Reply-To: <e9e50cad-2341-cb25-ef84-0d61a2cb7469@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Nov 2021 08:55:04 -0800
Message-ID: <CAF6AEGvTyy-MCv6wdkpPyohLwUg4U_2ACT0gsXRG2z6iOYQ+Tg@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] drm/msm: Track "seqno" fences by idr
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 7:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wro=
te:
>
> On 7/28/2021 6:36 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Previously the (non-fd) fence returned from submit ioctl was a raw
> > seqno, which is scoped to the ring.  But from UABI standpoint, the
> > ioctls related to seqno fences all specify a submitqueue.  We can
> > take advantage of that to replace the seqno fences with a cyclic idr
> > handle.
> >
> > This is in preperation for moving to drm scheduler, at which point
> > the submit ioctl will return after queuing the submit job to the
> > scheduler, but before the submit is written into the ring (and
> > therefore before a ring seqno has been assigned).  Which means we
> > need to replace the dma_fence that userspace may need to wait on
> > with a scheduler fence.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/msm/msm_drv.c         | 30 +++++++++++++++++--
> >   drivers/gpu/drm/msm/msm_fence.c       | 42 --------------------------=
-
> >   drivers/gpu/drm/msm/msm_fence.h       |  3 --
> >   drivers/gpu/drm/msm/msm_gem.h         |  1 +
> >   drivers/gpu/drm/msm/msm_gem_submit.c  | 23 ++++++++++++++-
> >   drivers/gpu/drm/msm/msm_gpu.h         |  5 ++++
> >   drivers/gpu/drm/msm/msm_submitqueue.c |  5 ++++
> >   7 files changed, 61 insertions(+), 48 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 9b8fa2ad0d84..1594ae39d54f 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -911,6 +911,7 @@ static int msm_ioctl_wait_fence(struct drm_device *=
dev, void *data,
> >       ktime_t timeout =3D to_ktime(args->timeout);
> >       struct msm_gpu_submitqueue *queue;
> >       struct msm_gpu *gpu =3D priv->gpu;
> > +     struct dma_fence *fence;
> >       int ret;
> >
> >       if (args->pad) {
> > @@ -925,10 +926,35 @@ static int msm_ioctl_wait_fence(struct drm_device=
 *dev, void *data,
> >       if (!queue)
> >               return -ENOENT;
> >
> > -     ret =3D msm_wait_fence(gpu->rb[queue->prio]->fctx, args->fence, &=
timeout,
> > -             true);
> > +     /*
> > +      * Map submitqueue scoped "seqno" (which is actually an idr key)
> > +      * back to underlying dma-fence
> > +      *
> > +      * The fence is removed from the fence_idr when the submit is
> > +      * retired, so if the fence is not found it means there is nothin=
g
> > +      * to wait for
> > +      */
> > +     ret =3D mutex_lock_interruptible(&queue->lock);
> > +     if (ret)
> > +             return ret;
> > +     fence =3D idr_find(&queue->fence_idr, args->fence);
> > +     if (fence)
> > +             fence =3D dma_fence_get_rcu(fence);
> > +     mutex_unlock(&queue->lock);
> > +
> > +     if (!fence)
> > +             return 0;
> >
> > +     ret =3D dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&t=
imeout));
> > +     if (ret =3D=3D 0) {
> > +             ret =3D -ETIMEDOUT;
> > +     } else if (ret !=3D -ERESTARTSYS) {
> > +             ret =3D 0;
> > +     }
> > +
> > +     dma_fence_put(fence);
> >       msm_submitqueue_put(queue);
> > +
> >       return ret;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_=
fence.c
> > index b92a9091a1e2..f2cece542c3f 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -24,7 +24,6 @@ msm_fence_context_alloc(struct drm_device *dev, volat=
ile uint32_t *fenceptr,
> >       strncpy(fctx->name, name, sizeof(fctx->name));
> >       fctx->context =3D dma_fence_context_alloc(1);
> >       fctx->fenceptr =3D fenceptr;
> > -     init_waitqueue_head(&fctx->event);
> >       spin_lock_init(&fctx->spinlock);
> >
> >       return fctx;
> > @@ -45,53 +44,12 @@ static inline bool fence_completed(struct msm_fence=
_context *fctx, uint32_t fenc
> >               (int32_t)(*fctx->fenceptr - fence) >=3D 0;
> >   }
> >
> > -/* legacy path for WAIT_FENCE ioctl: */
> > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > -             ktime_t *timeout, bool interruptible)
> > -{
> > -     int ret;
> > -
> > -     if (fence > fctx->last_fence) {
> > -             DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (=
of %u)\n",
> > -                             fctx->name, fence, fctx->last_fence);
> > -             return -EINVAL;
>
> Rob, we changed this pre-existing behaviour in this patch. Now, when
> userspace tries to wait on a future fence, we don't return an error.
>
> I just want to check if this was accidental or not?

Hmm, perhaps we should do this to restore the previous behavior:

-------------
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73e827641024..3dd6da56eae6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1000,8 +1000,12 @@ static int msm_ioctl_wait_fence(struct
drm_device *dev, void *data,
                fence =3D dma_fence_get_rcu(fence);
        mutex_unlock(&queue->lock);

-       if (!fence)
-               return 0;
+       if (!fence) {
+               struct msm_fence_context *fctx =3D gpu->rb[queue->ring_nr]-=
>fctx;
+               DRM_ERROR_RATELIMITED("%s: waiting on invalid fence:
%u (of %u)\n",
+                                     fctx->name, fence, fctx->last_fence);
+               return -EINVAL;
+       }

        ret =3D dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&tim=
eout));
        if (ret =3D=3D 0) {
-------------

BR,
-R

> -Akhil.
>
> > -     }
> > -
> > -     if (!timeout) {
> > -             /* no-wait: */
> > -             ret =3D fence_completed(fctx, fence) ? 0 : -EBUSY;
> > -     } else {
> > -             unsigned long remaining_jiffies =3D timeout_to_jiffies(ti=
meout);
> > -
> > -             if (interruptible)
> > -                     ret =3D wait_event_interruptible_timeout(fctx->ev=
ent,
> > -                             fence_completed(fctx, fence),
> > -                             remaining_jiffies);
> > -             else
> > -                     ret =3D wait_event_timeout(fctx->event,
> > -                             fence_completed(fctx, fence),
> > -                             remaining_jiffies);
> > -
> > -             if (ret =3D=3D 0) {
> > -                     DBG("timeout waiting for fence: %u (completed: %u=
)",
> > -                                     fence, fctx->completed_fence);
> > -                     ret =3D -ETIMEDOUT;
> > -             } else if (ret !=3D -ERESTARTSYS) {
> > -                     ret =3D 0;
> > -             }
> > -     }
> > -
> > -     return ret;
> > -}
> > -
> >   /* called from workqueue */
> >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
> >   {
> >       spin_lock(&fctx->spinlock);
> >       fctx->completed_fence =3D max(fence, fctx->completed_fence);
> >       spin_unlock(&fctx->spinlock);
> > -
> > -     wake_up_all(&fctx->event);
> >   }
> >
> >   struct msm_fence {
> > diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_=
fence.h
> > index 6ab97062ff1a..4783db528bcc 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.h
> > +++ b/drivers/gpu/drm/msm/msm_fence.h
> > @@ -49,7 +49,6 @@ struct msm_fence_context {
> >        */
> >       volatile uint32_t *fenceptr;
> >
> > -     wait_queue_head_t event;
> >       spinlock_t spinlock;
> >   };
> >
> > @@ -57,8 +56,6 @@ struct msm_fence_context * msm_fence_context_alloc(st=
ruct drm_device *dev,
> >               volatile uint32_t *fenceptr, const char *name);
> >   void msm_fence_context_free(struct msm_fence_context *fctx);
> >
> > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > -             ktime_t *timeout, bool interruptible);
> >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)=
;
> >
> >   struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index da3af702a6c8..e0579abda5b9 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -320,6 +320,7 @@ struct msm_gem_submit {
> >       struct ww_acquire_ctx ticket;
> >       uint32_t seqno;         /* Sequence number of the submit on the r=
ing */
> >       struct dma_fence *fence;
> > +     int fence_id;       /* key into queue->fence_idr */
> >       struct msm_gpu_submitqueue *queue;
> >       struct pid *pid;    /* submitting process */
> >       bool fault_dumped;  /* Limit devcoredump dumping to one per submi=
t */
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index 4f02fa3c78f9..f6f595aae2c5 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -68,7 +68,14 @@ void __msm_gem_submit_destroy(struct kref *kref)
> >                       container_of(kref, struct msm_gem_submit, ref);
> >       unsigned i;
> >
> > +     if (submit->fence_id) {
> > +             mutex_lock(&submit->queue->lock);
> > +             idr_remove(&submit->queue->fence_idr, submit->fence_id);
> > +             mutex_unlock(&submit->queue->lock);
> > +     }
> > +
> >       dma_fence_put(submit->fence);
> > +
> >       put_pid(submit->pid);
> >       msm_submitqueue_put(submit->queue);
> >
> > @@ -872,6 +879,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, v=
oid *data,
> >               goto out;
> >       }
> >
> > +     /*
> > +      * Allocate an id which can be used by WAIT_FENCE ioctl to map ba=
ck
> > +      * to the underlying fence.
> > +      */
> > +     mutex_lock(&queue->lock);
> > +     submit->fence_id =3D idr_alloc_cyclic(&queue->fence_idr,
> > +                     submit->fence, 0, INT_MAX, GFP_KERNEL);
> > +     mutex_unlock(&queue->lock);
> > +     if (submit->fence_id < 0) {
> > +             ret =3D submit->fence_id =3D 0;
> > +             submit->fence_id =3D 0;
> > +             goto out;
> > +     }
> > +
> >       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> >               struct sync_file *sync_file =3D sync_file_create(submit->=
fence);
> >               if (!sync_file) {
> > @@ -886,7 +907,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> >
> >       msm_gpu_submit(gpu, submit);
> >
> > -     args->fence =3D submit->fence->seqno;
> > +     args->fence =3D submit->fence_id;
> >
> >       msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
> >       msm_process_post_deps(post_deps, args->nr_out_syncobjs,
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gp=
u.h
> > index 96efcb31e502..579627252540 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -263,6 +263,9 @@ struct msm_gpu_perfcntr {
> >    *             which set of pgtables do submits jobs associated with =
the
> >    *             submitqueue use)
> >    * @node:      node in the context's list of submitqueues
> > + * @fence_idr: maps fence-id to dma_fence for userspace visible fence
> > + *             seqno, protected by submitqueue lock
> > + * @lock:      submitqueue lock
> >    * @ref:       reference count
> >    */
> >   struct msm_gpu_submitqueue {
> > @@ -272,6 +275,8 @@ struct msm_gpu_submitqueue {
> >       int faults;
> >       struct msm_file_private *ctx;
> >       struct list_head node;
> > +     struct idr fence_idr;
> > +     struct mutex lock;
> >       struct kref ref;
> >   };
> >
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/ms=
m/msm_submitqueue.c
> > index 9e9fec61d629..66f8d0fb38b0 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
> >       struct msm_gpu_submitqueue *queue =3D container_of(kref,
> >               struct msm_gpu_submitqueue, ref);
> >
> > +     idr_destroy(&queue->fence_idr);
> > +
> >       msm_file_private_put(queue->ctx);
> >
> >       kfree(queue);
> > @@ -89,6 +91,9 @@ int msm_submitqueue_create(struct drm_device *drm, st=
ruct msm_file_private *ctx,
> >       if (id)
> >               *id =3D queue->id;
> >
> > +     idr_init(&queue->fence_idr);
> > +     mutex_init(&queue->lock);
> > +
> >       list_add_tail(&queue->node, &ctx->submitqueues);
> >
> >       write_unlock(&ctx->queuelock);
> >
>
