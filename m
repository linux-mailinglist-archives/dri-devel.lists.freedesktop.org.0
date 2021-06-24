Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972363B3595
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865186EC73;
	Thu, 24 Jun 2021 18:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1186EC78
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:23:05 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id a14so1471946oie.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RwIVGjjaUpG48TTbNl1JYFHiFuoLB+vPhlziHr2KDBw=;
 b=VWbqpibHz7xLO15pNufOT8tGwrYLhaUGldEXpTYddizlZYmWhN/sXvCcRi/pXOWPSY
 l6hzzUx4E2kw2IogODRb/LlP7iwPD1UGZwILVwRrO1ffF58zhyC5hc2qRTgZdgoVhqoM
 /bpC4dgPkZrt10i0wRFXvBZ1H+CnqQcxrn34I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RwIVGjjaUpG48TTbNl1JYFHiFuoLB+vPhlziHr2KDBw=;
 b=QwUTpKk4n1xtSd1dbuByRNFB80A7ndsQlc+Vfl/CXhgVum1+e+5bCKZMxtuVMdGRM6
 N9q/pFdJOTa6Y94qx99pWRq9FqN9WUIwrzBlw90IY05eyR8y7VLgd/T5py+F80aB5jwG
 2QfrLlSWlHQTS3nDIyoTjIKM144s71clT43YUwgNuj1lh+Q3i6bVDr4MkjCVVb0d+qKD
 hj0/41PZcCHqKzKY8grPML+M5a76Qo/M52jhHbcQu1e6QrFKbeUKAhxoil5RSTbHxSp1
 NmUUFZQSml1q7w3RGWkbh4OmFm6LxEHaJpn6ncg14PuQdUDI2bNrUqwZ8EIBBQxCnsx1
 e3/w==
X-Gm-Message-State: AOAM530x6DoJKNEN+remhUcYPL+ebKTCgMUR6gzxzs7MyFstbhT2ZbDI
 uK4WVmAMjyIj/EOloODAAVRWh4RYkddyB7zsy/3yKA==
X-Google-Smtp-Source: ABdhPJwntBnp/qrlrdQHEUWdyJO8FZXESjSx9Bd5LSn0dxSskIjdjHPrDz6oKTzrkU69ETrayMz75weWd2GeM/DOwxA=
X-Received: by 2002:a54:4889:: with SMTP id r9mr8161939oic.101.1624558985035; 
 Thu, 24 Jun 2021 11:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-2-daniel.vetter@ffwll.ch>
 <834f5d78-9052-8e7a-fd34-c5b4f37857cf@amd.com>
 <CAKMK7uEyiD7fD6DUD-4dJyXZEYaZiE3bdGyz6cLzsf7cjaRD4g@mail.gmail.com>
 <fdf12f4a-e719-0993-1b05-0de7b4a150a6@amd.com>
In-Reply-To: <fdf12f4a-e719-0993-1b05-0de7b4a150a6@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 24 Jun 2021 20:22:54 +0200
Message-ID: <CAKMK7uF1Djf5+L2=N=g97oVfGd=FvNtkd1AsX0cHj5BLaR07Fw@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/sched: Split drm_sched_job_init
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 7:39 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 24.06.21 um 19:37 schrieb Daniel Vetter:
> > On Thu, Jun 24, 2021 at 7:30 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
> >>> This is a very confusingly named function, because not just does it
> >>> init an object, it arms it and provides a point of no return for
> >>> pushing a job into the scheduler. It would be nice if that's a bit
> >>> clearer in the interface.
> >> We originally had that in the push_job interface, but moved that to in=
it
> >> for some reason I don't remember.
> >>
> >>> But the real reason is that I want to push the dependency tracking
> >>> helpers into the scheduler code, and that means drm_sched_job_init
> >>> must be called a lot earlier, without arming the job.
> >> I'm really questioning myself if I like that naming.
> >>
> >> What about using drm_sched_job_add_dependency instead?
> > You're suggesting a
> > s/drm_sched_job_init/drm_sched_job_add_dependency/, or just replied to
> > the wrong patch?
>
> Replied to the wrong patch accidentally. I was talking about the "await"
> terminology.

Can you pls reply there so we don't have too much of a confusion in
the discussion?
Thanks, Daniel


> Christian.
>
> > -Daniel
> >
> >> Christian.
> >>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> Cc: Lucas Stach <l.stach@pengutronix.de>
> >>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> >>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> >>> Cc: Qiang Yu <yuq825@gmail.com>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >>> Cc: Steven Price <steven.price@arm.com>
> >>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> >>> Cc: David Airlie <airlied@linux.ie>
> >>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>> Cc: Kees Cook <keescook@chromium.org>
> >>> Cc: Adam Borowski <kilobyte@angband.pl>
> >>> Cc: Nick Terrell <terrelln@fb.com>
> >>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> >>> Cc: Sami Tolvanen <samitolvanen@google.com>
> >>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: Dave Airlie <airlied@redhat.com>
> >>> Cc: Nirmoy Das <nirmoy.das@amd.com>
> >>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> >>> Cc: Lee Jones <lee.jones@linaro.org>
> >>> Cc: Kevin Wang <kevin1.wang@amd.com>
> >>> Cc: Chen Li <chenli@uniontech.com>
> >>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>> Cc: "Marek Ol=C5=A1=C3=A1k" <marek.olsak@amd.com>
> >>> Cc: Dennis Li <Dennis.Li@amd.com>
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> Cc: Sonny Jiang <sonny.jiang@amd.com>
> >>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>> Cc: Tian Tao <tiantao6@hisilicon.com>
> >>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> >>> Cc: etnaviv@lists.freedesktop.org
> >>> Cc: lima@lists.freedesktop.org
> >>> Cc: linux-media@vger.kernel.org
> >>> Cc: linaro-mm-sig@lists.linaro.org
> >>> ---
> >>>    .gitignore                               |  1 +
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
> >>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
> >>>    drivers/gpu/drm/lima/lima_sched.c        |  2 ++
> >>>    drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
> >>>    drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
> >>>    drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
> >>>    drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++=
++-
> >>>    include/drm/gpu_scheduler.h              |  6 +++++-
> >>>    10 files changed, 51 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/.gitignore b/.gitignore
> >>> index 7afd412dadd2..52433a930299 100644
> >>> --- a/.gitignore
> >>> +++ b/.gitignore
> >>> @@ -66,6 +66,7 @@ modules.order
> >>>    /modules.builtin
> >>>    /modules.builtin.modinfo
> >>>    /modules.nsdeps
> >>> +*.builtin
> >>>
> >>>    #
> >>>    # RPM spec file (make rpm-pkg)
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_cs.c
> >>> index c5386d13eb4a..a4ec092af9a7 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pa=
rser *p,
> >>>        if (r)
> >>>                goto error_unlock;
> >>>
> >>> +     drm_sched_job_arm(&job->base);
> >>> +
> >>>        /* No memory allocation is allowed while holding the notifier =
lock.
> >>>         * The lock is held until amdgpu_cs_submit is finished and fen=
ce is
> >>>         * added to BOs.
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_job.c
> >>> index d33e6d97cc89..5ddb955d2315 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, str=
uct drm_sched_entity *entity,
> >>>        if (r)
> >>>                return r;
> >>>
> >>> +     drm_sched_job_arm(&job->base);
> >>> +
> >>>        *f =3D dma_fence_get(&job->base.s_fence->finished);
> >>>        amdgpu_job_free_resources(job);
> >>>        drm_sched_entity_push_job(&job->base, entity);
> >>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_sched.c
> >>> index 19826e504efc..af1671f01c7f 100644
> >>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entit=
y *sched_entity,
> >>>        if (ret)
> >>>                goto out_unlock;
> >>>
> >>> +     drm_sched_job_arm(&submit->sched_job);
> >>> +
> >>>        submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence=
->finished);
> >>>        submit->out_fence_id =3D idr_alloc_cyclic(&submit->gpu->fence_=
idr,
> >>>                                                submit->out_fence, 0,
> >>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima=
/lima_sched.c
> >>> index ecf3267334ff..bd1af1fd8c0f 100644
> >>> --- a/drivers/gpu/drm/lima/lima_sched.c
> >>> +++ b/drivers/gpu/drm/lima/lima_sched.c
> >>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *=
task,
> >>>                return err;
> >>>        }
> >>>
> >>> +     drm_sched_job_arm(&task->base);
> >>> +
> >>>        task->num_bos =3D num_bos;
> >>>        task->vm =3D lima_vm_get(vm);
> >>>
> >>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/dr=
m/panfrost/panfrost_job.c
> >>> index beb62c8fc851..1e950534b9b0 100644
> >>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> >>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> >>> @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
> >>>                goto unlock;
> >>>        }
> >>>
> >>> +     drm_sched_job_arm(&job->base);
> >>> +
> >>>        job->render_done_fence =3D dma_fence_get(&job->base.s_fence->f=
inished);
> >>>
> >>>        ret =3D panfrost_acquire_object_fences(job->bos, job->bo_count=
,
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> >>> index 79554aa4dbb1..f7347c284886 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> >>>     * @sched_job: job to submit
> >>>     * @entity: scheduler entity
> >>>     *
> >>> - * Note: To guarantee that the order of insertion to queue matches
> >>> - * the job's fence sequence number this function should be
> >>> - * called with drm_sched_job_init under common lock.
> >>> + * Note: To guarantee that the order of insertion to queue matches t=
he job's
> >>> + * fence sequence number this function should be called with drm_sch=
ed_job_arm()
> >>> + * under common lock.
> >>>     *
> >>>     * Returns 0 for success, negative error code otherwise.
> >>>     */
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/dr=
m/scheduler/sched_fence.c
> >>> index 69de2c76731f..0ba810c198bd 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> >>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(stru=
ct dma_fence *f)
> >>>    }
> >>>    EXPORT_SYMBOL(to_drm_sched_fence);
> >>>
> >>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_enti=
ty *entity,
> >>> -                                            void *owner)
> >>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entit=
y *entity,
> >>> +                                           void *owner)
> >>>    {
> >>>        struct drm_sched_fence *fence =3D NULL;
> >>> -     unsigned seq;
> >>>
> >>>        fence =3D kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
> >>>        if (fence =3D=3D NULL)
> >>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(=
struct drm_sched_entity *entity,
> >>>        fence->sched =3D entity->rq->sched;
> >>>        spin_lock_init(&fence->lock);
> >>>
> >>> +     return fence;
> >>> +}
> >>> +
> >>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> >>> +                       struct drm_sched_entity *entity)
> >>> +{
> >>> +     unsigned seq;
> >>> +
> >>>        seq =3D atomic_inc_return(&entity->fence_seq);
> >>>        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_schedul=
ed,
> >>>                       &fence->lock, entity->fence_context, seq);
> >>>        dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished=
,
> >>>                       &fence->lock, entity->fence_context + 1, seq);
> >>> -
> >>> -     return fence;
> >>>    }
> >>>
> >>>    module_init(drm_sched_fence_slab_init);
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> >>> index 61420a9c1021..70eefed17e06 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -48,9 +48,11 @@
> >>>    #include <linux/wait.h>
> >>>    #include <linux/sched.h>
> >>>    #include <linux/completion.h>
> >>> +#include <linux/dma-resv.h>
> >>>    #include <uapi/linux/sched/types.h>
> >>>
> >>>    #include <drm/drm_print.h>
> >>> +#include <drm/drm_gem.h>
> >>>    #include <drm/gpu_scheduler.h>
> >>>    #include <drm/spsc_queue.h>
> >>>
> >>> @@ -594,7 +596,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >>>        job->sched =3D sched;
> >>>        job->entity =3D entity;
> >>>        job->s_priority =3D entity->rq - sched->sched_rq;
> >>> -     job->s_fence =3D drm_sched_fence_create(entity, owner);
> >>> +     job->s_fence =3D drm_sched_fence_alloc(entity, owner);
> >>>        if (!job->s_fence)
> >>>                return -ENOMEM;
> >>>        job->id =3D atomic64_inc_return(&sched->job_id_count);
> >>> @@ -605,6 +607,25 @@ int drm_sched_job_init(struct drm_sched_job *job=
,
> >>>    }
> >>>    EXPORT_SYMBOL(drm_sched_job_init);
> >>>
> >>> +/**
> >>> + * drm_sched_job_arm - arm a scheduler job for execution
> >>> + * @job: scheduler job to arm
> >>> + *
> >>> + * This arms a scheduler job for execution. Specifically it initiali=
zes the
> >>> + * &drm_sched_job.s_fence of @job, so that it can be attached to str=
uct dma_resv
> >>> + * or other places that need to track the completion of this job.
> >>> + *
> >>> + * Refer to drm_sched_entity_push_job() documentation for locking
> >>> + * considerations.
> >>> + *
> >>> + * This can only be called if drm_sched_job_init() succeeded.
> >>> + */
> >>> +void drm_sched_job_arm(struct drm_sched_job *job)
> >>> +{
> >>> +     drm_sched_fence_init(job->s_fence, job->entity);
> >>> +}
> >>> +EXPORT_SYMBOL(drm_sched_job_arm);
> >>> +
> >>>    /**
> >>>     * drm_sched_job_cleanup - clean up scheduler job resources
> >>>     *
> >>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> >>> index d18af49fd009..80438d126c9d 100644
> >>> --- a/include/drm/gpu_scheduler.h
> >>> +++ b/include/drm/gpu_scheduler.h
> >>> @@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sch=
ed);
> >>>    int drm_sched_job_init(struct drm_sched_job *job,
> >>>                       struct drm_sched_entity *entity,
> >>>                       void *owner);
> >>> +void drm_sched_job_arm(struct drm_sched_job *job);
> >>>    void drm_sched_entity_modify_sched(struct drm_sched_entity *entity=
,
> >>>                                    struct drm_gpu_scheduler **sched_l=
ist,
> >>>                                       unsigned int num_sched_list);
> >>> @@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sc=
hed_entity *entity,
> >>>                                   enum drm_sched_priority priority);
> >>>    bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >>>
> >>> -struct drm_sched_fence *drm_sched_fence_create(
> >>> +struct drm_sched_fence *drm_sched_fence_alloc(
> >>>        struct drm_sched_entity *s_entity, void *owner);
> >>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> >>> +                       struct drm_sched_entity *entity);
> >>> +
> >>>    void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
> >>>    void drm_sched_fence_finished(struct drm_sched_fence *fence);
> >>>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
