Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6F96B7AB6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC50910E554;
	Mon, 13 Mar 2023 14:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E5E10E045;
 Mon, 13 Mar 2023 14:45:17 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id bi17so9587277oib.3;
 Mon, 13 Mar 2023 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678718717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+CV2SifknfjhIyuWjTUWiSmqHONl4lWciVnfKStENI=;
 b=i2SilUaV3bWr54dJkta8nQzXHC3ldAO2CIGhbaD4W2v+7zFai9h4s8d7ydJi9vnydm
 Rmxl312JsKwfTHbOQLjbx4ktE/y8WN+0Ln9BrXobMgsxonH4DFHkVFZGtGLQwkktvLcn
 itJSuVzIf/F02deRU7nI6BeVfpriCFR4EcK582FgWJjppl9SIKcmwheYjcDbIg8zeJQJ
 EqcgvRMfQTswHXsnOv6HitRObCa9s28QUTIkupuGHf7aMdDZJ+yoECnuZ7K1ra/bLFsM
 w/LkdVBqGREcJJxbxVtzcDHoNH7OJXB6MFwr8ln2do2Ocvm9ns+3WsrN9mjLPqHcnqb5
 ykcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678718717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+CV2SifknfjhIyuWjTUWiSmqHONl4lWciVnfKStENI=;
 b=XOxj2CBLsy94DYIElGx++Sr143GXwJDNMhvAXpHXZUmq61Y/NduvFCHcDd9HxoPXrI
 JOHSDacfCwhsn44cYS3+MkdpDIcrpWJlOUMKylF6H+S9yQRroqo16m5zac6bHReF7piG
 DIWCuIVhjaapOGxYokIlnT0NRyR9/fYZHtSuM4bqhBTKR5VfTbuhpdcRsrlu7xUJyka2
 VBqpPUOPhReLwUazywfYQEEegX6omwYdcgSzDrfHQMnpHBIunQxCZ0UgjAZAUXQV7+ch
 OcLB+quF4Cns+5Os8F7MB2s3BvuoKNHfYQpoImV5YKzuJebgQ/SNRvk8IfDzmTCuFWUU
 XEkg==
X-Gm-Message-State: AO0yUKVLtkn5lYY0lfLxIRVzWdryUicJzmCvSlaTInZUiWp8jrrBKN5R
 UjgdH7T++CxUCYQyTK8g273fPRdvKn1/bApaB2I=
X-Google-Smtp-Source: AK7set8Ti1T85pfZ3x3mojTmAFJI+E2j4PltKQSmP4vh2+nZAmydeBWLtDIItpnDphn3KDx5PrbNv0r21XjWrzrB7RA=
X-Received: by 2002:a05:6808:220a:b0:383:db64:65 with SMTP id
 bd10-20020a056808220a00b00383db640065mr5424701oib.4.1678718716877; Mon, 13
 Mar 2023 07:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230311173513.1080397-1-robdclark@gmail.com>
 <20230311173513.1080397-3-robdclark@gmail.com>
 <b846101c-e6ef-2d3e-9db9-077003b72e57@amd.com>
In-Reply-To: <b846101c-e6ef-2d3e-9db9-077003b72e57@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 13 Mar 2023 07:45:05 -0700
Message-ID: <CAF6AEGvH==PPLpdxim4Pi=Q7RA8Ou4NYxvYBW=N8sh9amEqQVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Embed the hw_fence in msm_gem_submit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 12:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 11.03.23 um 18:35 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Avoid allocating memory in job_run() by embedding the fence in the
> > submit object.  Since msm gpu fences are always 1:1 with msm_gem_submit
> > we can just use the fence's refcnt to track the submit.  And since we
> > can get the fence ctx from the submit we can just drop the msm_fence
> > struct altogether.  This uses the new dma_fence_init_noref() to deal
> > with the fact that the fence's refcnt is initialized when the submit is
> > created, long before job_run().
>
> Well this is a very very bad idea, we made the same mistake with amdgpu
> as well.
>
> It's true that you should not have any memory allocation in your run_job
> callback, but you could also just allocate the hw fence during job
> creation and initializing it later on.
>
> I've suggested to embed the fence into the job for amdgpu because some
> people insisted of re-submitting jobs during timeout and GPU reset. This
> turned into a nightmare with tons of bug fixes on top of bug fixes on
> top of bug fixes because it messes up the job and fence lifetime as
> defined by the DRM scheduler and DMA-buf framework.
>
> Luben is currently working on cleaning all this up.

This actually shouldn't be a problem with msm, as the fence doesn't
change if there is a gpu reset.  We simply signal the fence for the
offending job, reset the GPU, and re-play the remaining in-flight jobs
(ie. things that already had their job_run() called) with the original
fences.  (We don't use gpu sched's reset/timeout handling.. when I
migrated to gpu sched I kept our existing hangcheck/recovery
mechanism.)

BR,
-R

> Regards,
> Christian.
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > Note that this applies on top of https://patchwork.freedesktop.org/seri=
es/93035/
> > out of convenience for myself, but I can re-work it to go before
> > depending on the order that things land.
> >
> >   drivers/gpu/drm/msm/msm_fence.c      | 45 +++++++++++----------------=
-
> >   drivers/gpu/drm/msm/msm_fence.h      |  2 +-
> >   drivers/gpu/drm/msm/msm_gem.h        | 10 +++----
> >   drivers/gpu/drm/msm/msm_gem_submit.c |  8 ++---
> >   drivers/gpu/drm/msm/msm_gpu.c        |  4 +--
> >   drivers/gpu/drm/msm/msm_ringbuffer.c |  4 +--
> >   6 files changed, 31 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_=
fence.c
> > index 51b461f32103..51f9f1f0cb66 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -103,14 +103,9 @@ void msm_update_fence(struct msm_fence_context *fc=
tx, uint32_t fence)
> >       spin_unlock_irqrestore(&fctx->spinlock, flags);
> >   }
> >
> > -struct msm_fence {
> > -     struct dma_fence base;
> > -     struct msm_fence_context *fctx;
> > -};
> > -
> > -static inline struct msm_fence *to_msm_fence(struct dma_fence *fence)
> > +static inline struct msm_gem_submit *fence_to_submit(struct dma_fence =
*fence)
> >   {
> > -     return container_of(fence, struct msm_fence, base);
> > +     return container_of(fence, struct msm_gem_submit, hw_fence);
> >   }
> >
> >   static const char *msm_fence_get_driver_name(struct dma_fence *fence)
> > @@ -120,20 +115,20 @@ static const char *msm_fence_get_driver_name(stru=
ct dma_fence *fence)
> >
> >   static const char *msm_fence_get_timeline_name(struct dma_fence *fenc=
e)
> >   {
> > -     struct msm_fence *f =3D to_msm_fence(fence);
> > -     return f->fctx->name;
> > +     struct msm_gem_submit *submit =3D fence_to_submit(fence);
> > +     return submit->ring->fctx->name;
> >   }
> >
> >   static bool msm_fence_signaled(struct dma_fence *fence)
> >   {
> > -     struct msm_fence *f =3D to_msm_fence(fence);
> > -     return msm_fence_completed(f->fctx, f->base.seqno);
> > +     struct msm_gem_submit *submit =3D fence_to_submit(fence);
> > +     return msm_fence_completed(submit->ring->fctx, fence->seqno);
> >   }
> >
> >   static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t d=
eadline)
> >   {
> > -     struct msm_fence *f =3D to_msm_fence(fence);
> > -     struct msm_fence_context *fctx =3D f->fctx;
> > +     struct msm_gem_submit *submit =3D fence_to_submit(fence);
> > +     struct msm_fence_context *fctx =3D submit->ring->fctx;
> >       unsigned long flags;
> >       ktime_t now;
> >
> > @@ -165,26 +160,22 @@ static void msm_fence_set_deadline(struct dma_fen=
ce *fence, ktime_t deadline)
> >       spin_unlock_irqrestore(&fctx->spinlock, flags);
> >   }
> >
> > +static void msm_fence_release(struct dma_fence *fence)
> > +{
> > +     __msm_gem_submit_destroy(fence_to_submit(fence));
> > +}
> > +
> >   static const struct dma_fence_ops msm_fence_ops =3D {
> >       .get_driver_name =3D msm_fence_get_driver_name,
> >       .get_timeline_name =3D msm_fence_get_timeline_name,
> >       .signaled =3D msm_fence_signaled,
> >       .set_deadline =3D msm_fence_set_deadline,
> > +     .release =3D msm_fence_release,
> >   };
> >
> > -struct dma_fence *
> > -msm_fence_alloc(struct msm_fence_context *fctx)
> > +void
> > +msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *f)
> >   {
> > -     struct msm_fence *f;
> > -
> > -     f =3D kzalloc(sizeof(*f), GFP_KERNEL);
> > -     if (!f)
> > -             return ERR_PTR(-ENOMEM);
> > -
> > -     f->fctx =3D fctx;
> > -
> > -     dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
> > -                    fctx->context, ++fctx->last_fence);
> > -
> > -     return &f->base;
> > +     dma_fence_init_noref(f, &msm_fence_ops, &fctx->spinlock,
> > +                          fctx->context, ++fctx->last_fence);
> >   }
> > diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_=
fence.h
> > index cdaebfb94f5c..8fca37e9773b 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.h
> > +++ b/drivers/gpu/drm/msm/msm_fence.h
> > @@ -81,7 +81,7 @@ void msm_fence_context_free(struct msm_fence_context =
*fctx);
> >   bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fen=
ce);
> >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)=
;
> >
> > -struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
> > +void msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *=
f);
> >
> >   static inline bool
> >   fence_before(uint32_t a, uint32_t b)
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index c4844cf3a585..e06afed99d5b 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -259,10 +259,10 @@ struct msm_gem_submit {
> >       struct ww_acquire_ctx ticket;
> >       uint32_t seqno;         /* Sequence number of the submit on the r=
ing */
> >
> > -     /* Hw fence, which is created when the scheduler executes the job=
, and
> > +     /* Hw fence, which is initialized when the scheduler executes the=
 job, and
> >        * is signaled when the hw finishes (via seqno write from cmdstre=
am)
> >        */
> > -     struct dma_fence *hw_fence;
> > +     struct dma_fence hw_fence;
> >
> >       /* Userspace visible fence, which is signaled by the scheduler af=
ter
> >        * the hw_fence is signaled.
> > @@ -309,16 +309,16 @@ static inline struct msm_gem_submit *to_msm_submi=
t(struct drm_sched_job *job)
> >       return container_of(job, struct msm_gem_submit, base);
> >   }
> >
> > -void __msm_gem_submit_destroy(struct kref *kref);
> > +void __msm_gem_submit_destroy(struct msm_gem_submit *submit);
> >
> >   static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
> >   {
> > -     kref_get(&submit->ref);
> > +     dma_fence_get(&submit->hw_fence);
> >   }
> >
> >   static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
> >   {
> > -     kref_put(&submit->ref, __msm_gem_submit_destroy);
> > +     dma_fence_put(&submit->hw_fence);
> >   }
> >
> >   void msm_submit_retire(struct msm_gem_submit *submit);
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index be4bf77103cd..522c8c82e827 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -47,7 +47,7 @@ static struct msm_gem_submit *submit_create(struct dr=
m_device *dev,
> >               return ERR_PTR(ret);
> >       }
> >
> > -     kref_init(&submit->ref);
> > +     kref_init(&submit->hw_fence.refcount);
> >       submit->dev =3D dev;
> >       submit->aspace =3D queue->ctx->aspace;
> >       submit->gpu =3D gpu;
> > @@ -65,10 +65,9 @@ static struct msm_gem_submit *submit_create(struct d=
rm_device *dev,
> >       return submit;
> >   }
> >
> > -void __msm_gem_submit_destroy(struct kref *kref)
> > +/* Called when the hw_fence is destroyed: */
> > +void __msm_gem_submit_destroy(struct msm_gem_submit *submit)
> >   {
> > -     struct msm_gem_submit *submit =3D
> > -                     container_of(kref, struct msm_gem_submit, ref);
> >       unsigned i;
> >
> >       if (submit->fence_id) {
> > @@ -78,7 +77,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
> >       }
> >
> >       dma_fence_put(submit->user_fence);
> > -     dma_fence_put(submit->hw_fence);
> >
> >       put_pid(submit->pid);
> >       msm_submitqueue_put(submit->queue);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 380249500325..a82d11dd5fcf 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -716,7 +716,7 @@ static void retire_submits(struct msm_gpu *gpu)
> >                        * been signalled, then later submits are not sig=
nalled
> >                        * either, so we are also done.
> >                        */
> > -                     if (submit && dma_fence_is_signaled(submit->hw_fe=
nce)) {
> > +                     if (submit && dma_fence_is_signaled(&submit->hw_f=
ence)) {
> >                               retire_submit(gpu, ring, submit);
> >                       } else {
> >                               break;
> > @@ -760,7 +760,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm=
_gem_submit *submit)
> >
> >       msm_gpu_hw_init(gpu);
> >
> > -     submit->seqno =3D submit->hw_fence->seqno;
> > +     submit->seqno =3D submit->hw_fence.seqno;
> >
> >       msm_rd_dump_submit(priv->rd, submit, NULL);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm=
/msm_ringbuffer.c
> > index 57a8e9564540..5c54befa2427 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -18,7 +18,7 @@ static struct dma_fence *msm_job_run(struct drm_sched=
_job *job)
> >       struct msm_gpu *gpu =3D submit->gpu;
> >       int i;
> >
> > -     submit->hw_fence =3D msm_fence_alloc(fctx);
> > +     msm_fence_init(fctx, &submit->hw_fence);
> >
> >       for (i =3D 0; i < submit->nr_bos; i++) {
> >               struct drm_gem_object *obj =3D &submit->bos[i].obj->base;
> > @@ -37,7 +37,7 @@ static struct dma_fence *msm_job_run(struct drm_sched=
_job *job)
> >
> >       mutex_unlock(&gpu->lock);
> >
> > -     return dma_fence_get(submit->hw_fence);
> > +     return dma_fence_get(&submit->hw_fence);
> >   }
> >
> >   static void msm_job_free(struct drm_sched_job *job)
>
