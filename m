Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DB3B38B2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 23:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73A86E044;
	Thu, 24 Jun 2021 21:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C586E044
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 21:30:33 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so7138300oth.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IZJo9RCSR2BN5ZV8cd0oYhrij9jdxz75Aaz9p+81dF0=;
 b=c03Uih7Ybh23Iz4nuoW+/n6xpHKHVcHR7e+hU+mvoDBudpMASvy/Z0Mz2Giq8Nyrxd
 nSTBhMUDUFm6KyJHPyp9Cv4Mezpjm/Dj1XfprO9BfYoyeZuWICo5057YJG7Mu2EiCJQj
 Fv2T9aSFgEFwm+336lyKjtRWVSgTv6vjE+Qjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IZJo9RCSR2BN5ZV8cd0oYhrij9jdxz75Aaz9p+81dF0=;
 b=FG1wdMjvXxLKHR6YQQKNvPlLBykiqm6Wbo4qVqbsn+UTilXriWiuuibI+jtGeOPSdI
 TrndzJJfI95RPrHir/5cdMzuf9tBglncabBNBy5tvjdRe7mmm3uXBqGiExsg7XQV3+jv
 7gVQXw60Wc5e2Dus/5abTIuy83VdBA3nGLqJj4Nr2rxZk+FfBqfUiI1V8Fd191G0M5Jn
 MjS0qenVk5liqmOk4trDHMFKURGFKXJA7joRl7fceNz3Wyh5Jceq/r904XQYKzJPyTfF
 n02tvk5i2on64i7eNM8h4tf+/9t9Q435tUY6/rE5g7F4Njxj6eDAEu3M+VBbVDZgChAb
 M/ew==
X-Gm-Message-State: AOAM530RavFad2kMVxk1ogxZ4K+42UshkkWv+bh5CGMh4iRJG0srQp1v
 3l3oCXGy0JVFnn/LJDZMOgdhSop1VtjXNW/olJZ9FA==
X-Google-Smtp-Source: ABdhPJyXBdRffqjJkzHkCj4U0WNFAfuywh4ATQg0b8MC/PUKxuVlwfA1MuX4bfA0DL7RUQYdVaNNdbtywaXC862fmh8=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr6568727otb.281.1624570233021; 
 Thu, 24 Jun 2021 14:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
 <20210624204535.614168-1-daniel.vetter@ffwll.ch>
 <CADaigPWe17ddknbNWOVcGLZGkX3u1JfpzkAxySTduwgPUa5okQ@mail.gmail.com>
In-Reply-To: <CADaigPWe17ddknbNWOVcGLZGkX3u1JfpzkAxySTduwgPUa5okQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 24 Jun 2021 23:30:21 +0200
Message-ID: <CAKMK7uGLcvty86d4uGGAUcGdrbSKf4jDj7uMKdQC_ZuGesDXjg@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Split drm_sched_job_init
To: Emma Anholt <emma@anholt.net>
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
 Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Nick Terrell <terrelln@fb.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 11:00 PM Emma Anholt <emma@anholt.net> wrote:
>
> On Thu, Jun 24, 2021 at 1:45 PM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> >
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
> > Acked-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
> > Cc: Jack Zhang <Jack.Zhang1@amd.com>
> > Cc: etnaviv@lists.freedesktop.org
> > Cc: lima@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: Emma Anholt <emma@anholt.net>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
> >  drivers/gpu/drm/lima/lima_sched.c        |  2 ++
> >  drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
> >  drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
> >  drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
> >  drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
> >  drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
> >  include/drm/gpu_scheduler.h              |  6 +++++-
> >  10 files changed, 52 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index c5386d13eb4a..a4ec092af9a7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pars=
er *p,
> >         if (r)
> >                 goto error_unlock;
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         /* No memory allocation is allowed while holding the notifier l=
ock.
> >          * The lock is held until amdgpu_cs_submit is finished and fenc=
e is
> >          * added to BOs.
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> > index d33e6d97cc89..5ddb955d2315 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struc=
t drm_sched_entity *entity,
> >         if (r)
> >                 return r;
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         *f =3D dma_fence_get(&job->base.s_fence->finished);
> >         amdgpu_job_free_resources(job);
> >         drm_sched_entity_push_job(&job->base, entity);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/=
etnaviv/etnaviv_sched.c
> > index 19826e504efc..af1671f01c7f 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity =
*sched_entity,
> >         if (ret)
> >                 goto out_unlock;
> >
> > +       drm_sched_job_arm(&submit->sched_job);
> > +
> >         submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence-=
>finished);
> >         submit->out_fence_id =3D idr_alloc_cyclic(&submit->gpu->fence_i=
dr,
> >                                                 submit->out_fence, 0,
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index ecf3267334ff..bd1af1fd8c0f 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *ta=
sk,
> >                 return err;
> >         }
> >
> > +       drm_sched_job_arm(&task->base);
> > +
> >         task->num_bos =3D num_bos;
> >         task->vm =3D lima_vm_get(vm);
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/=
panfrost/panfrost_job.c
> > index beb62c8fc851..1e950534b9b0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
> >                 goto unlock;
> >         }
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         job->render_done_fence =3D dma_fence_get(&job->base.s_fence->fi=
nished);
> >
> >         ret =3D panfrost_acquire_object_fences(job->bos, job->bo_count,
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 79554aa4dbb1..f7347c284886 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_en=
tity *entity)
> >   * @sched_job: job to submit
> >   * @entity: scheduler entity
> >   *
> > - * Note: To guarantee that the order of insertion to queue matches
> > - * the job's fence sequence number this function should be
> > - * called with drm_sched_job_init under common lock.
> > + * Note: To guarantee that the order of insertion to queue matches the=
 job's
> > + * fence sequence number this function should be called with drm_sched=
_job_arm()
> > + * under common lock.
> >   *
> >   * Returns 0 for success, negative error code otherwise.
> >   */
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index 69de2c76731f..0ba810c198bd 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct=
 dma_fence *f)
> >  }
> >  EXPORT_SYMBOL(to_drm_sched_fence);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity=
 *entity,
> > -                                              void *owner)
> > +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity =
*entity,
> > +                                             void *owner)
> >  {
> >         struct drm_sched_fence *fence =3D NULL;
> > -       unsigned seq;
> >
> >         fence =3D kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
> >         if (fence =3D=3D NULL)
> > @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(st=
ruct drm_sched_entity *entity,
> >         fence->sched =3D entity->rq->sched;
> >         spin_lock_init(&fence->lock);
> >
> > +       return fence;
> > +}
>
> If there's an error path between fence_alloc (job_init()) and
> fence_create() (job_arm()) time, how does the s_fence get freed?
> Before, I was committed to calling drm_sched_entity_push_job() which
> lead to the job being processed and freed, but now I think we need
> some other non-pushed-job free path.

Yeah I need to fix that in each driver when I move the
drm_sched_job_init around. From a quick look I just need to move the
drm_sched_job_cleanup() call around slightly in each case, but it's a
bit too late to do that without screwing it up for sure. I'll look
into that tomorrow.
-Daniel

>
> > +EXPORT_SYMBOL(drm_sched_job_arm);
> > +
> >  /**
> >   * drm_sched_job_cleanup - clean up scheduler job resources
> >   *
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_ge=
m.c
> > index 4eb354226972..5c3a99027ecd 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
> >         if (ret)
> >                 return ret;
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         job->done_fence =3D dma_fence_get(&job->base.s_fence->finished)=
;
> >
> >         /* put by scheduler job completion */
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index d18af49fd009..80438d126c9d 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
);
> >  int drm_sched_job_init(struct drm_sched_job *job,
> >                        struct drm_sched_entity *entity,
> >                        void *owner);
> > +void drm_sched_job_arm(struct drm_sched_job *job);
> >  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >                                     struct drm_gpu_scheduler **sched_li=
st,
> >                                     unsigned int num_sched_list);
> > @@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sche=
d_entity *entity,
> >                                    enum drm_sched_priority priority);
> >  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(
> > +struct drm_sched_fence *drm_sched_fence_alloc(
> >         struct drm_sched_entity *s_entity, void *owner);
> > +void drm_sched_fence_init(struct drm_sched_fence *fence,
> > +                         struct drm_sched_entity *entity);
> > +
> >  void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
> >  void drm_sched_fence_finished(struct drm_sched_fence *fence);
> >
> > --
> > 2.32.0.rc2
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
