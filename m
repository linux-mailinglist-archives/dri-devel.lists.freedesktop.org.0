Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44A53E166A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 16:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7326EA6C;
	Thu,  5 Aug 2021 14:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9A96EA6C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 14:07:31 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 x15-20020a05683000cfb02904d1f8b9db81so5199405oto.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BbLkO1Cf1mtt4+kr4Cem0U9KUUL5irArsHbvFyOqB7Y=;
 b=O4i6J1LxCCPzjdfx1KfnkBdRXPiYkRZzGJCL2dzyB0N37NdH4G8SDf2Ong3T/lN9k/
 Dx0Cgh9GiuSBlhhPBqIV/EiPKuQyRxNp2f8Chh73+lA9GTEgTk4JhlSiY+91C4ZLpOGk
 80m75PHRR8w5Lrujo9xzw3xz+Zr+fgKNOPQ9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BbLkO1Cf1mtt4+kr4Cem0U9KUUL5irArsHbvFyOqB7Y=;
 b=GSrarYHeEAtr20fdSao7Gnz70lJS21LcUapnT6avQnpqqoAqpD/npkcn1PvsPpZiyX
 ZnpFKyxAAHbzDMU8Ts6o7LjA6WaiWL1RBDu3th2xkPQZmWBIclwnyw1xz2C2N5HbAT6G
 SxnMx8+0Dtmy1ykETbGBt9JzlulcpUZNd1DvLIyQ7n2vq/YYkj6o6PIot/6K205qTj2J
 slQDC/BjYOfR6KJFaHIti684HU3vmNYe0p0HWudUGYh+T23cv3haneYa2CGaJVt+xFnB
 PSLP//KP+5QE6Q9NfMnSsozF6pItgt2P/81Y2R+0BEdP9BfkL9toUKYTwAYul6OE1YNY
 0MNQ==
X-Gm-Message-State: AOAM530CfUD+xEpAqiAMofJwDaNLAsmnaFtU5aA9sMpnAQWLHuWLm3HZ
 U2Ef3QYN8RL5TXOFlRvWHuOEDWdCfxsaXsdnkxgfUA==
X-Google-Smtp-Source: ABdhPJwKrjfnJkOfsd9UrO2MKzG4Axmf2mE4A9J/+Cc10OXDg1a2zxv6/t4jqgQMHm/d3Z2IbPS24txfKDk/YQw1hKw=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr3864129otu.303.1628172450264; 
 Thu, 05 Aug 2021 07:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-2-daniel.vetter@ffwll.ch>
 <7f7f839f-4944-32a5-2554-51131e7765a0@amd.com>
In-Reply-To: <7f7f839f-4944-32a5-2554-51131e7765a0@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Aug 2021 16:07:18 +0200
Message-ID: <CAKMK7uGEjO16mFcUWbzXHybvSBWcye9eJgVsX7A6QjSHQeM0yw@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/sched: Split drm_sched_job_init
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Emma Anholt <emma@anholt.net>, 
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu <yuq825@gmail.com>, 
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Kees Cook <keescook@chromium.org>, Adam Borowski <kilobyte@angband.pl>, 
 Nick Terrell <terrelln@fb.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Paul Menzel <pmenzel@molgen.mpg.de>, Sami Tolvanen <samitolvanen@google.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Dave Airlie <airlied@redhat.com>, Nirmoy Das <nirmoy.das@amd.com>, 
 Deepak R Varma <mh12gx2825@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
 Kevin Wang <kevin1.wang@amd.com>, Chen Li <chenli@uniontech.com>, 
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
 Dennis Li <Dennis.Li@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sonny Jiang <sonny.jiang@amd.com>, Tian Tao <tiantao6@hisilicon.com>, 
 The etnaviv authors <etnaviv@lists.freedesktop.org>, lima@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 5, 2021 at 3:44 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> Am 05.08.21 um 12:46 schrieb Daniel Vetter:
> > This is a very confusingly named function, because not just does it
> > init an object, it arms it and provides a point of no return for
> > pushing a job into the scheduler. It would be nice if that's a bit
> > clearer in the interface.
> >
> > But the real reason is that I want to push the dependency tracking
> > helpers into the scheduler code, and that means drm_sched_job_init
> > must be called a lot earlier, without arming the job.
> >
> > v2:
> > - don't change .gitignore (Steven)
> > - don't forget v3d (Emma)
> >
> > v3: Emma noticed that I leak the memory allocated in
> > drm_sched_job_init if we bail out before the point of no return in
> > subsequent driver patches. To be able to fix this change
> > drm_sched_job_cleanup() so it can handle being called both before and
> > after drm_sched_job_arm().
> >
> > Also improve the kerneldoc for this.
> >
> > v4:
> > - Fix the drm_sched_job_cleanup logic, I inverted the booleans, as
> >    usual (Melissa)
> >
> > - Christian pointed out that drm_sched_entity_select_rq() also needs
> >    to be moved into drm_sched_job_arm, which made me realize that the
> >    job->id definitely needs to be moved too.
> >
> >    Shuffle things to fit between job_init and job_arm.
> >
> > v5:
> > Reshuffle the split between init/arm once more, amdgpu abuses
> > drm_sched.ready to signal gpu reset failures. Also document this
> > somewhat. (Christian)
> >
> > v6:
> > Rebase on top of the msm drm/sched support. Note that the
> > drm_sched_job_init() call is completely misplaced, and hence also the
> > split-out drm_sched_entity_push_job(). I've put in a FIXME which the ne=
xt
> > patch will address.
> >
> > Acked-by: Melissa Wen <mwen@igalia.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Acked-by: Emma Anholt <emma@anholt.net>
> > Acked-by: Steven Price <steven.price@arm.com> (v2)
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v5)
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
> At least the amdgpu parts look ok of hand, but I can't judge the rest I
> think.

The thing that really scares me here and that I got wrong a few times
is the cleanup for drm_sched_job at the various points. Can you give
those parts in drm/scheduler/ a full review pls, just to make sure? I
can note that in the tag ofc, just like a bit more confidence here
that it's not busted :-)

> So only Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks, Daniel

>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: Qiang Yu <yuq825@gmail.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Adam Borowski <kilobyte@angband.pl>
> > Cc: Nick Terrell <terrelln@fb.com>
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> > Cc: Sami Tolvanen <samitolvanen@google.com>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Nirmoy Das <nirmoy.das@amd.com>
> > Cc: Deepak R Varma <mh12gx2825@gmail.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Kevin Wang <kevin1.wang@amd.com>
> > Cc: Chen Li <chenli@uniontech.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: "Marek Ol=C5=A1=C3=A1k" <marek.olsak@amd.com>
> > Cc: Dennis Li <Dennis.Li@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Sonny Jiang <sonny.jiang@amd.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Tian Tao <tiantao6@hisilicon.com>
> > Cc: etnaviv@lists.freedesktop.org
> > Cc: lima@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: Emma Anholt <emma@anholt.net>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +
> >   drivers/gpu/drm/lima/lima_sched.c        |  2 +
> >   drivers/gpu/drm/msm/msm_gem_submit.c     |  3 ++
> >   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +
> >   drivers/gpu/drm/scheduler/sched_entity.c |  6 +--
> >   drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++---
> >   drivers/gpu/drm/scheduler/sched_main.c   | 69 ++++++++++++++++++++---=
-
> >   drivers/gpu/drm/v3d/v3d_gem.c            |  2 +
> >   include/drm/gpu_scheduler.h              |  7 ++-
> >   11 files changed, 94 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index 139cd3bf1ad6..32e80bc6af22 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pars=
er *p,
> >       if (r)
> >               goto error_unlock;
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       /* No memory allocation is allowed while holding the notifier loc=
k.
> >        * The lock is held until amdgpu_cs_submit is finished and fence =
is
> >        * added to BOs.
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> > index d33e6d97cc89..5ddb955d2315 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struc=
t drm_sched_entity *entity,
> >       if (r)
> >               return r;
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       *f =3D dma_fence_get(&job->base.s_fence->finished);
> >       amdgpu_job_free_resources(job);
> >       drm_sched_entity_push_job(&job->base, entity);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/=
etnaviv/etnaviv_sched.c
> > index feb6da1b6ceb..05f412204118 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity =
*sched_entity,
> >       if (ret)
> >               goto out_unlock;
> >
> > +     drm_sched_job_arm(&submit->sched_job);
> > +
> >       submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence->f=
inished);
> >       submit->out_fence_id =3D idr_alloc_cyclic(&submit->gpu->fence_idr=
,
> >                                               submit->out_fence, 0,
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index dba8329937a3..38f755580507 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *ta=
sk,
> >               return err;
> >       }
> >
> > +     drm_sched_job_arm(&task->base);
> > +
> >       task->num_bos =3D num_bos;
> >       task->vm =3D lima_vm_get(vm);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index fdc5367aecaa..6d6c44f0e1f3 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -52,6 +52,9 @@ static struct msm_gem_submit *submit_create(struct dr=
m_device *dev,
> >               return ERR_PTR(ret);
> >       }
> >
> > +     /* FIXME: this is way too early */
> > +     drm_sched_job_arm(&job->base);
> > +
> >       xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> >
> >       kref_init(&submit->ref);
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/=
panfrost/panfrost_job.c
> > index 71a72fb50e6b..2992dc85325f 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
> >               goto unlock;
> >       }
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       job->render_done_fence =3D dma_fence_get(&job->base.s_fence->fini=
shed);
> >
> >       ret =3D panfrost_acquire_object_fences(job->bos, job->bo_count,
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 79554aa4dbb1..f7347c284886 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_en=
tity *entity)
> >    * @sched_job: job to submit
> >    * @entity: scheduler entity
> >    *
> > - * Note: To guarantee that the order of insertion to queue matches
> > - * the job's fence sequence number this function should be
> > - * called with drm_sched_job_init under common lock.
> > + * Note: To guarantee that the order of insertion to queue matches the=
 job's
> > + * fence sequence number this function should be called with drm_sched=
_job_arm()
> > + * under common lock.
> >    *
> >    * Returns 0 for success, negative error code otherwise.
> >    */
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index 69de2c76731f..bcea035cf4c6 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(=
struct dma_fence *f)
> >    *
> >    * Free up the fence memory after the RCU grace period.
> >    */
> > -static void drm_sched_fence_free(struct rcu_head *rcu)
> > +void drm_sched_fence_free(struct rcu_head *rcu)
> >   {
> >       struct dma_fence *f =3D container_of(rcu, struct dma_fence, rcu);
> >       struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
> > @@ -152,27 +152,32 @@ struct drm_sched_fence *to_drm_sched_fence(struct=
 dma_fence *f)
> >   }
> >   EXPORT_SYMBOL(to_drm_sched_fence);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity=
 *entity,
> > -                                            void *owner)
> > +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity =
*entity,
> > +                                           void *owner)
> >   {
> >       struct drm_sched_fence *fence =3D NULL;
> > -     unsigned seq;
> >
> >       fence =3D kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
> >       if (fence =3D=3D NULL)
> >               return NULL;
> >
> >       fence->owner =3D owner;
> > -     fence->sched =3D entity->rq->sched;
> >       spin_lock_init(&fence->lock);
> >
> > +     return fence;
> > +}
> > +
> > +void drm_sched_fence_init(struct drm_sched_fence *fence,
> > +                       struct drm_sched_entity *entity)
> > +{
> > +     unsigned seq;
> > +
> > +     fence->sched =3D entity->rq->sched;
> >       seq =3D atomic_inc_return(&entity->fence_seq);
> >       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >                      &fence->lock, entity->fence_context, seq);
> >       dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
> >                      &fence->lock, entity->fence_context + 1, seq);
> > -
> > -     return fence;
> >   }
> >
> >   module_init(drm_sched_fence_slab_init);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 33c414d55fab..454cb6164bdc 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -48,9 +48,11 @@
> >   #include <linux/wait.h>
> >   #include <linux/sched.h>
> >   #include <linux/completion.h>
> > +#include <linux/dma-resv.h>
> >   #include <uapi/linux/sched/types.h>
> >
> >   #include <drm/drm_print.h>
> > +#include <drm/drm_gem.h>
> >   #include <drm/gpu_scheduler.h>
> >   #include <drm/spsc_queue.h>
> >
> > @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> >
> >   /**
> >    * drm_sched_job_init - init a scheduler job
> > - *
> >    * @job: scheduler job to init
> >    * @entity: scheduler entity to use
> >    * @owner: job owner for debugging
> > @@ -577,27 +578,28 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> >    * Refer to drm_sched_entity_push_job() documentation
> >    * for locking considerations.
> >    *
> > + * Drivers must make sure drm_sched_job_cleanup() if this function ret=
urns
> > + * successfully, even when @job is aborted before drm_sched_job_arm() =
is called.
> > + *
> > + * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
> > + * has died, which can mean that there's no valid runqueue for a @enti=
ty.
> > + * This function returns -ENOENT in this case (which probably should b=
e -EIO as
> > + * a more meanigful return value).
> > + *
> >    * Returns 0 for success, negative error code otherwise.
> >    */
> >   int drm_sched_job_init(struct drm_sched_job *job,
> >                      struct drm_sched_entity *entity,
> >                      void *owner)
> >   {
> > -     struct drm_gpu_scheduler *sched;
> > -
> >       drm_sched_entity_select_rq(entity);
> >       if (!entity->rq)
> >               return -ENOENT;
> >
> > -     sched =3D entity->rq->sched;
> > -
> > -     job->sched =3D sched;
> >       job->entity =3D entity;
> > -     job->s_priority =3D entity->rq - sched->sched_rq;
> > -     job->s_fence =3D drm_sched_fence_create(entity, owner);
> > +     job->s_fence =3D drm_sched_fence_alloc(entity, owner);
> >       if (!job->s_fence)
> >               return -ENOMEM;
> > -     job->id =3D atomic64_inc_return(&sched->job_id_count);
> >
> >       INIT_LIST_HEAD(&job->list);
> >
> > @@ -606,13 +608,58 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >   EXPORT_SYMBOL(drm_sched_job_init);
> >
> >   /**
> > - * drm_sched_job_cleanup - clean up scheduler job resources
> > + * drm_sched_job_arm - arm a scheduler job for execution
> > + * @job: scheduler job to arm
> > + *
> > + * This arms a scheduler job for execution. Specifically it initialize=
s the
> > + * &drm_sched_job.s_fence of @job, so that it can be attached to struc=
t dma_resv
> > + * or other places that need to track the completion of this job.
> > + *
> > + * Refer to drm_sched_entity_push_job() documentation for locking
> > + * considerations.
> >    *
> > + * This can only be called if drm_sched_job_init() succeeded.
> > + */
> > +void drm_sched_job_arm(struct drm_sched_job *job)
> > +{
> > +     struct drm_gpu_scheduler *sched;
> > +     struct drm_sched_entity *entity =3D job->entity;
> > +
> > +     BUG_ON(!entity);
> > +
> > +     sched =3D entity->rq->sched;
> > +
> > +     job->sched =3D sched;
> > +     job->s_priority =3D entity->rq - sched->sched_rq;
> > +     job->id =3D atomic64_inc_return(&sched->job_id_count);
> > +
> > +     drm_sched_fence_init(job->s_fence, job->entity);
> > +}
> > +EXPORT_SYMBOL(drm_sched_job_arm);
> > +
> > +/**
> > + * drm_sched_job_cleanup - clean up scheduler job resources
> >    * @job: scheduler job to clean up
> > + *
> > + * Cleans up the resources allocated with drm_sched_job_init().
> > + *
> > + * Drivers should call this from their error unwind code if @job is ab=
orted
> > + * before drm_sched_job_arm() is called.
> > + *
> > + * After that point of no return @job is committed to be executed by t=
he
> > + * scheduler, and this function should be called from the
> > + * &drm_sched_backend_ops.free_job callback.
> >    */
> >   void drm_sched_job_cleanup(struct drm_sched_job *job)
> >   {
> > -     dma_fence_put(&job->s_fence->finished);
> > +     if (kref_read(&job->s_fence->finished.refcount)) {
> > +             /* drm_sched_job_arm() has been called */
> > +             dma_fence_put(&job->s_fence->finished);
> > +     } else {
> > +             /* aborted job before committing to run it */
> > +             drm_sched_fence_free(&job->s_fence->finished.rcu);
> > +     }
> > +
> >       job->s_fence =3D NULL;
> >   }
> >   EXPORT_SYMBOL(drm_sched_job_cleanup);
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_ge=
m.c
> > index 5689da118197..2e808097b4d1 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -480,6 +480,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
> >       if (ret)
> >               return ret;
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       job->done_fence =3D dma_fence_get(&job->base.s_fence->finished);
> >
> >       /* put by scheduler job completion */
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 88ae7f331bb1..83afc3aa8e2f 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
);
> >   int drm_sched_job_init(struct drm_sched_job *job,
> >                      struct drm_sched_entity *entity,
> >                      void *owner);
> > +void drm_sched_job_arm(struct drm_sched_job *job);
> >   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >                                   struct drm_gpu_scheduler **sched_list=
,
> >                                      unsigned int num_sched_list);
> > @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sche=
d_entity *entity,
> >                                  enum drm_sched_priority priority);
> >   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(
> > +struct drm_sched_fence *drm_sched_fence_alloc(
> >       struct drm_sched_entity *s_entity, void *owner);
> > +void drm_sched_fence_init(struct drm_sched_fence *fence,
> > +                       struct drm_sched_entity *entity);
> > +void drm_sched_fence_free(struct rcu_head *rcu);
> > +
> >   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
> >   void drm_sched_fence_finished(struct drm_sched_fence *fence);
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
