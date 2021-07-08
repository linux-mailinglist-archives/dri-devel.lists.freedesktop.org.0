Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771833BF608
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CEC6E856;
	Thu,  8 Jul 2021 07:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7856E834
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 07:10:09 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w127so6664706oig.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OgPjaYB2F33qbcqvY9ajbueOzc5WJOCmOMHltqcWt8I=;
 b=FME1kmtdEU0ZFz9yNc7xlR1WmA2kN1rvhczQ3p7udkE2uO4kpZsUunmNgKpS/iR3cG
 mtP5DT0pJa5IMpJrGz9DP/cSnr9LDskvl6YCeGKSnxt9Yvvc9pYy4lLEP5GMtBxGR2rt
 rIq0cRxOW+Aazi9Dr5PaGfXlnUxdoXHzjNP5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OgPjaYB2F33qbcqvY9ajbueOzc5WJOCmOMHltqcWt8I=;
 b=mpYz/oItqNXBUfl7NDNnK+RLMrjAiG1FxCguL7XY3ws98Xc1NgxDxYHzC2E1QY9UB6
 UJ4AvEf7OXaQF5WgGiPs8Kj1xSr6OR5C9DxaErThF7rqectBD/Iwk7/U3ryfd0QR7oB7
 kadHkjj8Z239VDCXkNSKkF0kzwowAmUfjJwC9SwubRsmUaEEeMB1OeuvVcPN15E3EuXD
 8FyVZj4RIFq3aUdBXEXVj0fiZkVM25J4a+HpuVw87mTUdqmIUTaarCOWiH5zHEz4KT0s
 lnikPEncEyVx82LT3dhRlpl3eKi/7ikaFpZ/WAlwdrVKcTL4uh6wN4gTckxr3ClZDXJf
 bTpA==
X-Gm-Message-State: AOAM531xAiit6Ex9NZE37GpQaiBRn6hJoRob4k9zfFA4flGFwFyxx1k9
 a9ZsNgd9j9l7DqjN1aVqEtS6I8MfxMsx0S+Ska7E4A==
X-Google-Smtp-Source: ABdhPJz09rR509HMPOhzL0Tyb/maOEYtLcg/rQxVHXlTPMQKtiNz7TSXGjOk3ke3En8f2Miq8SwY7Net3H8EODgpshg=
X-Received: by 2002:aca:eb43:: with SMTP id j64mr2430747oih.101.1625728208894; 
 Thu, 08 Jul 2021 00:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-2-daniel.vetter@ffwll.ch>
 <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
 <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
 <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
 <7933a995-0c95-9339-5385-a24681f6df3a@amd.com>
 <CAKMK7uE3bd2whKVBA4uWmzKBp7fjcVKexVFc=TB+ZRxdYT7VNg@mail.gmail.com>
 <b4824514-4ffd-a5f0-9bbc-d89cdd4e7b50@amd.com>
In-Reply-To: <b4824514-4ffd-a5f0-9bbc-d89cdd4e7b50@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 8 Jul 2021 09:09:57 +0200
Message-ID: <CAKMK7uF7E4G9D_W+YRV_ZrJLtUFXqWZfN78VdrVC=byMux78LQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
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

On Thu, Jul 8, 2021 at 8:56 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 07.07.21 um 18:32 schrieb Daniel Vetter:
> > On Wed, Jul 7, 2021 at 2:58 PM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 07.07.21 um 14:13 schrieb Daniel Vetter:
> >>> On Wed, Jul 7, 2021 at 1:57 PM Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> >>>> Am 07.07.21 um 13:14 schrieb Daniel Vetter:
> >>>>> On Wed, Jul 7, 2021 at 11:30 AM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
> >>>>>>> This is a very confusingly named function, because not just does =
it
> >>>>>>> init an object, it arms it and provides a point of no return for
> >>>>>>> pushing a job into the scheduler. It would be nice if that's a bi=
t
> >>>>>>> clearer in the interface.
> >>>>>>>
> >>>>>>> But the real reason is that I want to push the dependency trackin=
g
> >>>>>>> helpers into the scheduler code, and that means drm_sched_job_ini=
t
> >>>>>>> must be called a lot earlier, without arming the job.
> >>>>>>>
> >>>>>>> v2:
> >>>>>>> - don't change .gitignore (Steven)
> >>>>>>> - don't forget v3d (Emma)
> >>>>>>>
> >>>>>>> v3: Emma noticed that I leak the memory allocated in
> >>>>>>> drm_sched_job_init if we bail out before the point of no return i=
n
> >>>>>>> subsequent driver patches. To be able to fix this change
> >>>>>>> drm_sched_job_cleanup() so it can handle being called both before=
 and
> >>>>>>> after drm_sched_job_arm().
> >>>>>> Thinking more about this, I'm not sure if this really works.
> >>>>>>
> >>>>>> See drm_sched_job_init() was also calling drm_sched_entity_select_=
rq()
> >>>>>> to update the entity->rq association.
> >>>>>>
> >>>>>> And that can only be done later on when we arm the fence as well.
> >>>>> Hm yeah, but that's a bug in the existing code I think: We already
> >>>>> fail to clean up if we fail to allocate the fences. So I think the
> >>>>> right thing to do here is to split the checks into job_init, and do
> >>>>> the actual arming/rq selection in job_arm? I'm not entirely sure
> >>>>> what's all going on there, the first check looks a bit like trying =
to
> >>>>> schedule before the entity is set up, which is a driver bug and sho=
uld
> >>>>> have a WARN_ON?
> >>>> No you misunderstood me, the problem is something else.
> >>>>
> >>>> You asked previously why the call to drm_sched_job_init() was so lat=
e in
> >>>> the CS.
> >>>>
> >>>> The reason for this was not alone the scheduler fence init, but also=
 the
> >>>> call to drm_sched_entity_select_rq().
> >>> Ah ok, I think I can fix that. Needs a prep patch to first make
> >>> drm_sched_entity_select infallible, then should be easy to do.
> >>>
> >>>>> The 2nd check around last_scheduled I have honeslty no idea what it=
's
> >>>>> even trying to do.
> >>>> You mean that here?
> >>>>
> >>>>            fence =3D READ_ONCE(entity->last_scheduled);
> >>>>            if (fence && !dma_fence_is_signaled(fence))
> >>>>                    return;
> >>>>
> >>>> This makes sure that load balancing is not moving the entity to a
> >>>> different scheduler while there are still jobs running from this ent=
ity
> >>>> on the hardware,
> >>> Yeah after a nap that idea crossed my mind too. But now I have lockin=
g
> >>> questions, afaiui the scheduler thread updates this, without taking
> >>> any locks - entity dequeuing is lockless. And here we read the fence
> >>> and then seem to yolo check whether it's signalled? What's preventing
> >>> a use-after-free here? There's no rcu or anything going on here at
> >>> all, and it's outside of the spinlock section, which starts a bit
> >>> further down.
> >> The last_scheduled fence of an entity can only change when there are
> >> jobs on the entities queued, and we have just ruled that out in the
> >> check before.
> > There aren't any barriers, so the cpu could easily run the two checks
> > the other way round. I'll ponder this and figure out where exactly we
> > need docs for the constraint and/or barriers to make this work as
> > intended. As-is I'm not seeing how it does ...
>
> spsc_queue_count() provides the necessary barrier with the atomic_read().

atomic_t is fully unordered, except when it's a read-modify-write
atomic op, then it's a full barrier. So yeah you need more here. But
also since you only need a read barrier on one side, and a write
barrier on the other, you don't actually need a cpu barriers on x86.
And READ_ONCE gives you the compiler barrier on one side at least, I
haven't found it on the writer side yet.

> But yes a comment would be really nice here. I had to think for a while
> why we don't need this as well.

I'm typing a patch, which after a night's sleep I realized has the
wrong barriers. And now I'm also typing some doc improvements for
drm_sched_entity and related functions.

>
> Christian.
>
> > -Daniel
> >
> >> Christian.
> >>
> >>
> >>> -Daniel
> >>>
> >>>> Regards
> >>>> Christian.
> >>>>
> >>>>> -Daniel
> >>>>>
> >>>>>> Christian.
> >>>>>>
> >>>>>>> Also improve the kerneldoc for this.
> >>>>>>>
> >>>>>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
> >>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
> >>>>>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> >>>>>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> >>>>>>> Cc: Qiang Yu <yuq825@gmail.com>
> >>>>>>> Cc: Rob Herring <robh@kernel.org>
> >>>>>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >>>>>>> Cc: Steven Price <steven.price@arm.com>
> >>>>>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> >>>>>>> Cc: David Airlie <airlied@linux.ie>
> >>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>>>>>> Cc: Kees Cook <keescook@chromium.org>
> >>>>>>> Cc: Adam Borowski <kilobyte@angband.pl>
> >>>>>>> Cc: Nick Terrell <terrelln@fb.com>
> >>>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>>>>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> >>>>>>> Cc: Sami Tolvanen <samitolvanen@google.com>
> >>>>>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> >>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>>>> Cc: Dave Airlie <airlied@redhat.com>
> >>>>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
> >>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> >>>>>>> Cc: Lee Jones <lee.jones@linaro.org>
> >>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
> >>>>>>> Cc: Chen Li <chenli@uniontech.com>
> >>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>>>>>> Cc: "Marek Ol=C5=A1=C3=A1k" <marek.olsak@amd.com>
> >>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
> >>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>>>>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
> >>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>>>> Cc: Tian Tao <tiantao6@hisilicon.com>
> >>>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> >>>>>>> Cc: etnaviv@lists.freedesktop.org
> >>>>>>> Cc: lima@lists.freedesktop.org
> >>>>>>> Cc: linux-media@vger.kernel.org
> >>>>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>>>> Cc: Emma Anholt <emma@anholt.net>
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
> >>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
> >>>>>>>      drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
> >>>>>>>      drivers/gpu/drm/lima/lima_sched.c        |  2 ++
> >>>>>>>      drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
> >>>>>>>      drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
> >>>>>>>      drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
> >>>>>>>      drivers/gpu/drm/scheduler/sched_main.c   | 46 ++++++++++++++=
+++++++---
> >>>>>>>      drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
> >>>>>>>      include/drm/gpu_scheduler.h              |  7 +++-
> >>>>>>>      10 files changed, 74 insertions(+), 14 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_cs.c
> >>>>>>> index c5386d13eb4a..a4ec092af9a7 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_c=
s_parser *p,
> >>>>>>>          if (r)
> >>>>>>>                  goto error_unlock;
> >>>>>>>
> >>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>> +
> >>>>>>>          /* No memory allocation is allowed while holding the not=
ifier lock.
> >>>>>>>           * The lock is held until amdgpu_cs_submit is finished a=
nd fence is
> >>>>>>>           * added to BOs.
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_job.c
> >>>>>>> index d33e6d97cc89..5ddb955d2315 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job,=
 struct drm_sched_entity *entity,
> >>>>>>>          if (r)
> >>>>>>>                  return r;
> >>>>>>>
> >>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>> +
> >>>>>>>          *f =3D dma_fence_get(&job->base.s_fence->finished);
> >>>>>>>          amdgpu_job_free_resources(job);
> >>>>>>>          drm_sched_entity_push_job(&job->base, entity);
> >>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gp=
u/drm/etnaviv/etnaviv_sched.c
> >>>>>>> index feb6da1b6ceb..05f412204118 100644
> >>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>>>>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_e=
ntity *sched_entity,
> >>>>>>>          if (ret)
> >>>>>>>                  goto out_unlock;
> >>>>>>>
> >>>>>>> +     drm_sched_job_arm(&submit->sched_job);
> >>>>>>> +
> >>>>>>>          submit->out_fence =3D dma_fence_get(&submit->sched_job.s=
_fence->finished);
> >>>>>>>          submit->out_fence_id =3D idr_alloc_cyclic(&submit->gpu->=
fence_idr,
> >>>>>>>                                                  submit->out_fenc=
e, 0,
> >>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/=
lima/lima_sched.c
> >>>>>>> index dba8329937a3..38f755580507 100644
> >>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
> >>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
> >>>>>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_ta=
sk *task,
> >>>>>>>                  return err;
> >>>>>>>          }
> >>>>>>>
> >>>>>>> +     drm_sched_job_arm(&task->base);
> >>>>>>> +
> >>>>>>>          task->num_bos =3D num_bos;
> >>>>>>>          task->vm =3D lima_vm_get(vm);
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gp=
u/drm/panfrost/panfrost_job.c
> >>>>>>> index 71a72fb50e6b..2992dc85325f 100644
> >>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> >>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> >>>>>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *jo=
b)
> >>>>>>>                  goto unlock;
> >>>>>>>          }
> >>>>>>>
> >>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>> +
> >>>>>>>          job->render_done_fence =3D dma_fence_get(&job->base.s_fe=
nce->finished);
> >>>>>>>
> >>>>>>>          ret =3D panfrost_acquire_object_fences(job->bos, job->bo=
_count,
> >>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/g=
pu/drm/scheduler/sched_entity.c
> >>>>>>> index 79554aa4dbb1..f7347c284886 100644
> >>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >>>>>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sc=
hed_entity *entity)
> >>>>>>>       * @sched_job: job to submit
> >>>>>>>       * @entity: scheduler entity
> >>>>>>>       *
> >>>>>>> - * Note: To guarantee that the order of insertion to queue match=
es
> >>>>>>> - * the job's fence sequence number this function should be
> >>>>>>> - * called with drm_sched_job_init under common lock.
> >>>>>>> + * Note: To guarantee that the order of insertion to queue match=
es the job's
> >>>>>>> + * fence sequence number this function should be called with drm=
_sched_job_arm()
> >>>>>>> + * under common lock.
> >>>>>>>       *
> >>>>>>>       * Returns 0 for success, negative error code otherwise.
> >>>>>>>       */
> >>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gp=
u/drm/scheduler/sched_fence.c
> >>>>>>> index 69de2c76731f..c451ee9a30d7 100644
> >>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> >>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> >>>>>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline=
_name(struct dma_fence *f)
> >>>>>>>       *
> >>>>>>>       * Free up the fence memory after the RCU grace period.
> >>>>>>>       */
> >>>>>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
> >>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu)
> >>>>>>>      {
> >>>>>>>          struct dma_fence *f =3D container_of(rcu, struct dma_fen=
ce, rcu);
> >>>>>>>          struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
> >>>>>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(=
struct dma_fence *f)
> >>>>>>>      }
> >>>>>>>      EXPORT_SYMBOL(to_drm_sched_fence);
> >>>>>>>
> >>>>>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_=
entity *entity,
> >>>>>>> -                                            void *owner)
> >>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_e=
ntity *entity,
> >>>>>>> +                                           void *owner)
> >>>>>>>      {
> >>>>>>>          struct drm_sched_fence *fence =3D NULL;
> >>>>>>> -     unsigned seq;
> >>>>>>>
> >>>>>>>          fence =3D kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL=
);
> >>>>>>>          if (fence =3D=3D NULL)
> >>>>>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_cre=
ate(struct drm_sched_entity *entity,
> >>>>>>>          fence->sched =3D entity->rq->sched;
> >>>>>>>          spin_lock_init(&fence->lock);
> >>>>>>>
> >>>>>>> +     return fence;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> >>>>>>> +                       struct drm_sched_entity *entity)
> >>>>>>> +{
> >>>>>>> +     unsigned seq;
> >>>>>>> +
> >>>>>>>          seq =3D atomic_inc_return(&entity->fence_seq);
> >>>>>>>          dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_s=
cheduled,
> >>>>>>>                         &fence->lock, entity->fence_context, seq)=
;
> >>>>>>>          dma_fence_init(&fence->finished, &drm_sched_fence_ops_fi=
nished,
> >>>>>>>                         &fence->lock, entity->fence_context + 1, =
seq);
> >>>>>>> -
> >>>>>>> -     return fence;
> >>>>>>>      }
> >>>>>>>
> >>>>>>>      module_init(drm_sched_fence_slab_init);
> >>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu=
/drm/scheduler/sched_main.c
> >>>>>>> index 33c414d55fab..5e84e1500c32 100644
> >>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>> @@ -48,9 +48,11 @@
> >>>>>>>      #include <linux/wait.h>
> >>>>>>>      #include <linux/sched.h>
> >>>>>>>      #include <linux/completion.h>
> >>>>>>> +#include <linux/dma-resv.h>
> >>>>>>>      #include <uapi/linux/sched/types.h>
> >>>>>>>
> >>>>>>>      #include <drm/drm_print.h>
> >>>>>>> +#include <drm/drm_gem.h>
> >>>>>>>      #include <drm/gpu_scheduler.h>
> >>>>>>>      #include <drm/spsc_queue.h>
> >>>>>>>
> >>>>>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> >>>>>>>
> >>>>>>>      /**
> >>>>>>>       * drm_sched_job_init - init a scheduler job
> >>>>>>> - *
> >>>>>>>       * @job: scheduler job to init
> >>>>>>>       * @entity: scheduler entity to use
> >>>>>>>       * @owner: job owner for debugging
> >>>>>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> >>>>>>>       * Refer to drm_sched_entity_push_job() documentation
> >>>>>>>       * for locking considerations.
> >>>>>>>       *
> >>>>>>> + * Drivers must make sure drm_sched_job_cleanup() if this functi=
on returns
> >>>>>>> + * successfully, even when @job is aborted before drm_sched_job_=
arm() is called.
> >>>>>>> + *
> >>>>>>>       * Returns 0 for success, negative error code otherwise.
> >>>>>>>       */
> >>>>>>>      int drm_sched_job_init(struct drm_sched_job *job,
> >>>>>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *=
job,
> >>>>>>>          job->sched =3D sched;
> >>>>>>>          job->entity =3D entity;
> >>>>>>>          job->s_priority =3D entity->rq - sched->sched_rq;
> >>>>>>> -     job->s_fence =3D drm_sched_fence_create(entity, owner);
> >>>>>>> +     job->s_fence =3D drm_sched_fence_alloc(entity, owner);
> >>>>>>>          if (!job->s_fence)
> >>>>>>>                  return -ENOMEM;
> >>>>>>>          job->id =3D atomic64_inc_return(&sched->job_id_count);
> >>>>>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job=
 *job,
> >>>>>>>      EXPORT_SYMBOL(drm_sched_job_init);
> >>>>>>>
> >>>>>>>      /**
> >>>>>>> - * drm_sched_job_cleanup - clean up scheduler job resources
> >>>>>>> + * drm_sched_job_arm - arm a scheduler job for execution
> >>>>>>> + * @job: scheduler job to arm
> >>>>>>> + *
> >>>>>>> + * This arms a scheduler job for execution. Specifically it init=
ializes the
> >>>>>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to=
 struct dma_resv
> >>>>>>> + * or other places that need to track the completion of this job=
.
> >>>>>>> + *
> >>>>>>> + * Refer to drm_sched_entity_push_job() documentation for lockin=
g
> >>>>>>> + * considerations.
> >>>>>>>       *
> >>>>>>> + * This can only be called if drm_sched_job_init() succeeded.
> >>>>>>> + */
> >>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job)
> >>>>>>> +{
> >>>>>>> +     drm_sched_fence_init(job->s_fence, job->entity);
> >>>>>>> +}
> >>>>>>> +EXPORT_SYMBOL(drm_sched_job_arm);
> >>>>>>> +
> >>>>>>> +/**
> >>>>>>> + * drm_sched_job_cleanup - clean up scheduler job resources
> >>>>>>>       * @job: scheduler job to clean up
> >>>>>>> + *
> >>>>>>> + * Cleans up the resources allocated with drm_sched_job_init().
> >>>>>>> + *
> >>>>>>> + * Drivers should call this from their error unwind code if @job=
 is aborted
> >>>>>>> + * before drm_sched_job_arm() is called.
> >>>>>>> + *
> >>>>>>> + * After that point of no return @job is committed to be execute=
d by the
> >>>>>>> + * scheduler, and this function should be called from the
> >>>>>>> + * &drm_sched_backend_ops.free_job callback.
> >>>>>>>       */
> >>>>>>>      void drm_sched_job_cleanup(struct drm_sched_job *job)
> >>>>>>>      {
> >>>>>>> -     dma_fence_put(&job->s_fence->finished);
> >>>>>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
> >>>>>>> +             /* drm_sched_job_arm() has been called */
> >>>>>>> +             dma_fence_put(&job->s_fence->finished);
> >>>>>>> +     } else {
> >>>>>>> +             /* aborted job before committing to run it */
> >>>>>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>>          job->s_fence =3D NULL;
> >>>>>>>      }
> >>>>>>>      EXPORT_SYMBOL(drm_sched_job_cleanup);
> >>>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/=
v3d_gem.c
> >>>>>>> index 4eb354226972..5c3a99027ecd 100644
> >>>>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> >>>>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> >>>>>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
> >>>>>>>          if (ret)
> >>>>>>>                  return ret;
> >>>>>>>
> >>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>> +
> >>>>>>>          job->done_fence =3D dma_fence_get(&job->base.s_fence->fi=
nished);
> >>>>>>>
> >>>>>>>          /* put by scheduler job completion */
> >>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_schedu=
ler.h
> >>>>>>> index 88ae7f331bb1..83afc3aa8e2f 100644
> >>>>>>> --- a/include/drm/gpu_scheduler.h
> >>>>>>> +++ b/include/drm/gpu_scheduler.h
> >>>>>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler =
*sched);
> >>>>>>>      int drm_sched_job_init(struct drm_sched_job *job,
> >>>>>>>                         struct drm_sched_entity *entity,
> >>>>>>>                         void *owner);
> >>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job);
> >>>>>>>      void drm_sched_entity_modify_sched(struct drm_sched_entity *=
entity,
> >>>>>>>                                      struct drm_gpu_scheduler **s=
ched_list,
> >>>>>>>                                         unsigned int num_sched_li=
st);
> >>>>>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct dr=
m_sched_entity *entity,
> >>>>>>>                                     enum drm_sched_priority prior=
ity);
> >>>>>>>      bool drm_sched_entity_is_ready(struct drm_sched_entity *enti=
ty);
> >>>>>>>
> >>>>>>> -struct drm_sched_fence *drm_sched_fence_create(
> >>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(
> >>>>>>>          struct drm_sched_entity *s_entity, void *owner);
> >>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> >>>>>>> +                       struct drm_sched_entity *entity);
> >>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu);
> >>>>>>> +
> >>>>>>>      void drm_sched_fence_scheduled(struct drm_sched_fence *fence=
);
> >>>>>>>      void drm_sched_fence_finished(struct drm_sched_fence *fence)=
;
> >>>>>>>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
