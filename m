Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347E93BE731
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 13:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40566E0D6;
	Wed,  7 Jul 2021 11:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106DE6E0D6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 11:33:01 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 w15-20020a056830144fb02904af2a0d96f3so1901766otp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GDa9UWrzxMuK1vePETwedREUXNhwKS9llwRHKNdLECw=;
 b=Zk3v8+rNfjVxcTKlBTQnZt1QJ0+IGCs0locpqPxCl13ZgLHtFIlwjH8eaYPMbqnJL+
 7tAvDFedKgA72N6YnTQVsFPqI0V3uLrroxMMxkv2fXuO7gt1Wj6rwGy+YM/an32e/GnP
 ZzgqU6K0RJETWsRYJP+7LeAl7SaGm+qZwMGxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GDa9UWrzxMuK1vePETwedREUXNhwKS9llwRHKNdLECw=;
 b=ErHZov5gKkx6K4KkV/Erc8dZW8OXFuFUrD8DVYTp+0u3XqZnPSUas3ve/KgB5sr6Qd
 KI/8APkiAtjQYmm1yjB/7ceBzC9acpfcMsNp9/R7VF3YeGF5r7TAxuN3AjisyP2tIh+6
 FnSdo0f8i+OuPOwp9mwy/8r1BMAELXJDCBo8zOCuhaU3rFSOHQ0IZa9jqfeJRW6OzDO9
 xUz3ty+b4eRcZhV1w/pJ9ZMkxxvkF8Ls2yP4y8aMTKUHoxzULjHi/85dgi9CkJ4q3yzX
 1H9a0f0m3DGFBC/JeDKHeh/Dlh7T92T3vkbL0M4q7gf1wssYLHpUDMRjfQcDMXKL7XzI
 MIgQ==
X-Gm-Message-State: AOAM5329NgjmjGGssD0mYbm9U8eQUS3dW9Bi3mXRgQnPipWoZni4nO7m
 MmwRJcTdGud3OEE+iO3v0wh+SPMC5tQ9uOxc1hLmMg==
X-Google-Smtp-Source: ABdhPJx2/rHXTOcJko88lp9u6f9POul25pVgptSceHmGhgSz4buuyzXiQmQDJlFGY3BCWL0xIaR1aBfCkmX4HWa0laU=
X-Received: by 2002:a05:6830:2366:: with SMTP id
 r6mr18985574oth.188.1625657580413; 
 Wed, 07 Jul 2021 04:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-9-daniel.vetter@ffwll.ch>
 <006dc4538e906b548eac0acfaf62211b83de4927.camel@pengutronix.de>
 <CAKMK7uEwszSpcdk2BSasOD-9gpnm=UhKR8-K40zQCCLSyk=Q_Q@mail.gmail.com>
In-Reply-To: <CAKMK7uEwszSpcdk2BSasOD-9gpnm=UhKR8-K40zQCCLSyk=Q_Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Jul 2021 13:32:49 +0200
Message-ID: <CAKMK7uFiJPzwH_MNi-c2YgD2LvX6MRMSJhjmiMm_yfmR70noLw@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] drm/etnaviv: Use scheduler dependency handling
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 7, 2021 at 1:26 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
> On Wed, Jul 7, 2021 at 11:08 AM Lucas Stach <l.stach@pengutronix.de> wrot=
e:
> > Am Freitag, dem 02.07.2021 um 23:38 +0200 schrieb Daniel Vetter:
> > > We need to pull the drm_sched_job_init much earlier, but that's very
> > > minor surgery.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > Cc: etnaviv@lists.freedesktop.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > ---
> > >  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  5 +-
> > >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 32 +++++-----
> > >  drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 61 +-----------------=
--
> > >  drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
> > >  4 files changed, 20 insertions(+), 81 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/=
etnaviv/etnaviv_gem.h
> > > index 98e60df882b6..63688e6e4580 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > > @@ -80,9 +80,6 @@ struct etnaviv_gem_submit_bo {
> > >       u64 va;
> > >       struct etnaviv_gem_object *obj;
> > >       struct etnaviv_vram_mapping *mapping;
> > > -     struct dma_fence *excl;
> > > -     unsigned int nr_shared;
> > > -     struct dma_fence **shared;
> > >  };
> > >
> > >  /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
> > > @@ -95,7 +92,7 @@ struct etnaviv_gem_submit {
> > >       struct etnaviv_file_private *ctx;
> > >       struct etnaviv_gpu *gpu;
> > >       struct etnaviv_iommu_context *mmu_context, *prev_mmu_context;
> > > -     struct dma_fence *out_fence, *in_fence;
> > > +     struct dma_fence *out_fence;
> > >       int out_fence_id;
> > >       struct list_head node; /* GPU active submit list */
> > >       struct etnaviv_cmdbuf cmdbuf;
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/g=
pu/drm/etnaviv/etnaviv_gem_submit.c
> > > index 4dd7d9d541c0..92478a50a580 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > @@ -188,16 +188,10 @@ static int submit_fence_sync(struct etnaviv_gem=
_submit *submit)
> > >               if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> > >                       continue;
> > >
> > > -             if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> > > -                     ret =3D dma_resv_get_fences(robj, &bo->excl,
> > > -                                               &bo->nr_shared,
> > > -                                               &bo->shared);
> > > -                     if (ret)
> > > -                             return ret;
> > > -             } else {
> > > -                     bo->excl =3D dma_resv_get_excl_unlocked(robj);
> > > -             }
> > > -
> > > +             ret =3D drm_sched_job_await_implicit(&submit->sched_job=
, &bo->obj->base,
> > > +                                                bo->flags & ETNA_SUB=
MIT_BO_WRITE);
> > > +             if (ret)
> > > +                     return ret;
> > >       }
> > >
> > >       return ret;
> > > @@ -403,8 +397,6 @@ static void submit_cleanup(struct kref *kref)
> > >
> > >       wake_up_all(&submit->gpu->fence_event);
> > >
> > > -     if (submit->in_fence)
> > > -             dma_fence_put(submit->in_fence);
> > >       if (submit->out_fence) {
> > >               /* first remove from IDR, so fence can not be found any=
more */
> > >               mutex_lock(&submit->gpu->fence_lock);
> > > @@ -537,6 +529,12 @@ int etnaviv_ioctl_gem_submit(struct drm_device *=
dev, void *data,
> > >       submit->exec_state =3D args->exec_state;
> > >       submit->flags =3D args->flags;
> > >
> > > +     ret =3D drm_sched_job_init(&submit->sched_job,
> > > +                              &ctx->sched_entity[args->pipe],
> > > +                              submit->ctx);
> > > +     if (ret)
> > > +             goto err_submit_objects;
> > > +
> >
> > With the init moved here you also need to move the
> > drm_sched_job_cleanup call from etnaviv_sched_free_job into
> > submit_cleanup to avoid the potential memory leak when we bail out
> > before pushing the job to the scheduler.
>
> Uh apologies for missing this again, the entire point of v2 was to fix
> this across all drivers. But somehow the fixup for etnaviv got lost.
> I'll do it now for v3.

To clarify, in case you meant I should put it into submit_cleanup():
That doesn't work, because for some of the paths we shouldn't call it
yet, so I think it's better to be explicit here (like I've done with
other drivers) - drm_sched_job_cleanup handles being called
before/after drm_sched_job_arm, but it doesn't cope well with being
called before drm_sched_job_init :-)
-Daniel

>
> Thanks, Daniel
>
> >
> > Regards,
> > Lucas
> >
> > >       ret =3D submit_lookup_objects(submit, file, bos, args->nr_bos);
> > >       if (ret)
> > >               goto err_submit_objects;
> > > @@ -549,11 +547,15 @@ int etnaviv_ioctl_gem_submit(struct drm_device =
*dev, void *data,
> > >       }
> > >
> > >       if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
> > > -             submit->in_fence =3D sync_file_get_fence(args->fence_fd=
);
> > > -             if (!submit->in_fence) {
> > > +             struct dma_fence *in_fence =3D sync_file_get_fence(args=
->fence_fd);
> > > +             if (!in_fence) {
> > >                       ret =3D -EINVAL;
> > >                       goto err_submit_objects;
> > >               }
> > > +
> > > +             ret =3D drm_sched_job_await_fence(&submit->sched_job, i=
n_fence);
> > > +             if (ret)
> > > +                     goto err_submit_objects;
> > >       }
> > >
> > >       ret =3D submit_pin_objects(submit);
> > > @@ -579,7 +581,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *d=
ev, void *data,
> > >       if (ret)
> > >               goto err_submit_objects;
> > >
> > > -     ret =3D etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], =
submit);
> > > +     ret =3D etnaviv_sched_push_job(submit);
> > >       if (ret)
> > >               goto err_submit_objects;
> > >
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_sched.c
> > > index 180bb633d5c5..c98d67320be3 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > @@ -17,58 +17,6 @@ module_param_named(job_hang_limit, etnaviv_job_han=
g_limit, int , 0444);
> > >  static int etnaviv_hw_jobs_limit =3D 4;
> > >  module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
> > >
> > > -static struct dma_fence *
> > > -etnaviv_sched_dependency(struct drm_sched_job *sched_job,
> > > -                      struct drm_sched_entity *entity)
> > > -{
> > > -     struct etnaviv_gem_submit *submit =3D to_etnaviv_submit(sched_j=
ob);
> > > -     struct dma_fence *fence;
> > > -     int i;
> > > -
> > > -     if (unlikely(submit->in_fence)) {
> > > -             fence =3D submit->in_fence;
> > > -             submit->in_fence =3D NULL;
> > > -
> > > -             if (!dma_fence_is_signaled(fence))
> > > -                     return fence;
> > > -
> > > -             dma_fence_put(fence);
> > > -     }
> > > -
> > > -     for (i =3D 0; i < submit->nr_bos; i++) {
> > > -             struct etnaviv_gem_submit_bo *bo =3D &submit->bos[i];
> > > -             int j;
> > > -
> > > -             if (bo->excl) {
> > > -                     fence =3D bo->excl;
> > > -                     bo->excl =3D NULL;
> > > -
> > > -                     if (!dma_fence_is_signaled(fence))
> > > -                             return fence;
> > > -
> > > -                     dma_fence_put(fence);
> > > -             }
> > > -
> > > -             for (j =3D 0; j < bo->nr_shared; j++) {
> > > -                     if (!bo->shared[j])
> > > -                             continue;
> > > -
> > > -                     fence =3D bo->shared[j];
> > > -                     bo->shared[j] =3D NULL;
> > > -
> > > -                     if (!dma_fence_is_signaled(fence))
> > > -                             return fence;
> > > -
> > > -                     dma_fence_put(fence);
> > > -             }
> > > -             kfree(bo->shared);
> > > -             bo->nr_shared =3D 0;
> > > -             bo->shared =3D NULL;
> > > -     }
> > > -
> > > -     return NULL;
> > > -}
> > > -
> > >  static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job =
*sched_job)
> > >  {
> > >       struct etnaviv_gem_submit *submit =3D to_etnaviv_submit(sched_j=
ob);
> > > @@ -140,14 +88,12 @@ static void etnaviv_sched_free_job(struct drm_sc=
hed_job *sched_job)
> > >  }
> > >
> > >  static const struct drm_sched_backend_ops etnaviv_sched_ops =3D {
> > > -     .dependency =3D etnaviv_sched_dependency,
> > >       .run_job =3D etnaviv_sched_run_job,
> > >       .timedout_job =3D etnaviv_sched_timedout_job,
> > >       .free_job =3D etnaviv_sched_free_job,
> > >  };
> > >
> > > -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> > > -                        struct etnaviv_gem_submit *submit)
> > > +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
> > >  {
> > >       int ret =3D 0;
> > >
> > > @@ -158,11 +104,6 @@ int etnaviv_sched_push_job(struct drm_sched_enti=
ty *sched_entity,
> > >        */
> > >       mutex_lock(&submit->gpu->fence_lock);
> > >
> > > -     ret =3D drm_sched_job_init(&submit->sched_job, sched_entity,
> > > -                              submit->ctx);
> > > -     if (ret)
> > > -             goto out_unlock;
> > > -
> > >       drm_sched_job_arm(&submit->sched_job);
> > >
> > >       submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence-=
>finished);
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.h b/drivers/gpu/dr=
m/etnaviv/etnaviv_sched.h
> > > index c0a6796e22c9..baebfa069afc 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> > > @@ -18,7 +18,6 @@ struct etnaviv_gem_submit *to_etnaviv_submit(struct=
 drm_sched_job *sched_job)
> > >
> > >  int etnaviv_sched_init(struct etnaviv_gpu *gpu);
> > >  void etnaviv_sched_fini(struct etnaviv_gpu *gpu);
> > > -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> > > -                        struct etnaviv_gem_submit *submit);
> > > +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit);
> > >
> > >  #endif /* __ETNAVIV_SCHED_H__ */
> >
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
