Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D3ABBBF8
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 13:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594F110E32F;
	Mon, 19 May 2025 11:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="WDarQUzK";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="kCK9k2zH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9229910E2F7;
 Mon, 19 May 2025 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1747652566;
 bh=eUiaDaeqJm7Zeyup7esQuXL
 t76Rrb7u6ry9OzV0J7EA=; b=WDarQUzK/y5oA/tw5qQ1hst2w7ChDMqbfylh2EPO7yWMH+uCpY
 MlkeWDPWwkX6EUQuB05RwdPuNiqDevtbYTrfJ43knDV2jpjHqTZ1v+f4hlVjIo1c/Pj+cvIITR3
 7cJgIpE1RpxDypuieo9L2td8fPj7gTXGcZoIrj+BsFBdrW1YazAp1FopCE5dmsqP+mrddPTuy1/
 4FGUpGCpy4u+k1HmqUc1vWVDFRmKR8a8hUHUAFrcWucME8dk5dsd2RXpflNP/zJrhnqeYwFp8S7
 BJDKdWzKeofZ++JQnRSNnbcuVif1WwQaDuHG/NQ17ymcG+IEt+pT036ofOb5zzw131Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1747652566; bh=eUiaDaeqJm7Zeyup7esQuXL
 t76Rrb7u6ry9OzV0J7EA=; b=kCK9k2zHIlwd/krwt4l6rieHU0MhHvVjTwdmxCR4p09qB4PTlW
 zDNHX8JJ8xGJPZ5mMZOu4xJB6we113+0PkCA==;
Message-ID: <882eeee1-cc36-4287-8437-b39c6c84562e@damsy.net>
Date: Mon, 19 May 2025 13:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/10] drm/sched: store the drm client_id in
 drm_sched_fence
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul
 <lyude@redhat.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-3-pierre-eric.pelloux-prayer@amd.com>
 <d747fef82a50466b2a2f9568f737bd80f5128b77.camel@mailbox.org>
 <2d206814-968d-47df-b670-cbd8db68c5c6@damsy.net>
Content-Language: en-US
In-Reply-To: <2d206814-968d-47df-b670-cbd8db68c5c6@damsy.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 15/05/2025 à 08:53, Pierre-Eric Pelloux-Prayer a écrit :
> Hi,
> 
> Le 14/05/2025 à 14:44, Philipp Stanner a écrit :
>> On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
>>> This will be used in a later commit to trace the drm client_id in
>>> some of the gpu_scheduler trace events.
>>>
>>> This requires changing all the users of drm_sched_job_init to
>>> add an extra parameter.
>>>
>>> The newly added drm_client_id field in the drm_sched_fence is a bit
>>> of a duplicate of the owner one. One suggestion I received was to
>>> merge those 2 fields - this can't be done right now as amdgpu uses
>>> some special values (AMDGPU_FENCE_OWNER_*) that can't really be
>>> translated into a client id. Christian is working on getting rid of
>>> those; when it's done we should be able to squash owner/drm_client_id
>>> together.
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer
>>> <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/accel/amdxdna/aie2_ctx.c                 |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c       |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c          |  8 +++++---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h          |  3 ++-
>>>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c     |  2 +-
>>>   drivers/gpu/drm/imagination/pvr_job.c            |  2 +-
>>>   drivers/gpu/drm/imagination/pvr_queue.c          |  5 +++--
>>>   drivers/gpu/drm/imagination/paac             |  8 +++++---
>>>   drivers/gpu/drm/nouveau/nouveau_sched.c          |  3 ++-
>>>   drivers/gpu/drm/panfrost/panfrost_drv.c          |  2 +-
>>>   drivers/gpu/drm/panthor/panthor_drv.c            |  3 ++-
>>>   drivers/gpu/drm/panthor/panthor_mmu.c            |  2 +-
>>>   drivers/gpu/drm/panthor/panthor_sched.c          |  5 +++--
>>>   drivers/gpu/drm/panthor/panthor_sched.h          |  3 ++-
>>>   drivers/gpu/drm/scheduler/sched_fence.c          |  4 ++
>>>   drivers/gpu/drm/scheduler/sched_internal.h       |  2 +-
>>>   drivers/gpu/drm/scheduler/sched_main.c           |  6 ++++--
>>>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  2 +-
>>>   drivers/gpu/drm/v3d/v3d_submit.c                 |  2 +-
>>>   drivers/gpu/drm/xe/xe_sched_job.c                |  3 ++-
>>>   include/drm/gpu_scheduler.h                      | 10 +++++++++-
>>>   26 files changed, 62 insertions(+), 34 deletions(-)
>>
>> I think last time I asked about what your merge plan for this is, since
>> it touches so many drivers. Should I take that?
> 
> Based on:
> 
> https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html
> 
> "drm-misc is for drm core (non-driver) patches, subsystem-wide refactorings,
> and small trivial patches all over (including drivers)."
> 
> I assume it should go through drm-misc.

I've addressed your comments and pushed an updated branch to 
https://gitlab.freedesktop.org/pepp/linux/-/commits/improve_gpu_scheduler_trace_v10

Any chance to get this merged soon?

Thanks,
Pierre-Eric



> 
> 
>>
>> Besides one comment below, scheduler bits look fine.
>>
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c
>>> b/drivers/accel/amdxdna/aie2_ctx.c
>>> index e04549f64d69..3e38a5f637ea 100644
>>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>>> @@ -848,7 +848,8 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx,
>>> struct amdxdna_sched_job *job,
>>>           goto up_sem;
>>>       }
>>> -    ret = drm_sched_job_init(&job->base, &hwctx->priv->entity,
>>> 1, hwctx);
>>> +    ret = drm_sched_job_init(&job->base, &hwctx->priv->entity,
>>> 1, hwctx,
>>> +                 hwctx->client->filp->client_id);
>>>       if (ret) {
>>>           XDNA_ERR(xdna, "DRM job init failed, ret %d", ret);
>>>           goto free_chain;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>> index 4cec3a873995..1a77ba7036c9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>> @@ -639,7 +639,7 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device
>>> *adev,
>>>           goto err;
>>>       }
>>> -    ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job);
>>> +    ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job, 0);
>>>       if (ret)
>>>           goto err;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 82df06a72ee0..5a231b997d65 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -293,7 +293,8 @@ static int amdgpu_cs_pass1(struct
>>> amdgpu_cs_parser *p,
>>>       for (i = 0; i < p->gang_size; ++i) {
>>>           ret = amdgpu_job_alloc(p->adev, vm, p->entities[i],
>>> vm,
>>> -                       num_ibs[i], &p->jobs[i]);
>>> +                       num_ibs[i], &p->jobs[i],
>>> +                       p->filp->client_id);
>>>           if (ret)
>>>               goto free_all_kdata;
>>>           p->jobs[i]->enforce_isolation = p->adev-
>>>> enforce_isolation[fpriv->xcp_id];
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index acb21fc8b3ce..75262ce8db27 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -204,7 +204,8 @@ static enum drm_gpu_sched_stat
>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>   int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
>>> *vm,
>>>                struct drm_sched_entity *entity, void *owner,
>>> -             unsigned int num_ibs, struct amdgpu_job **job)
>>> +             unsigned int num_ibs, struct amdgpu_job **job,
>>> +             u64 drm_client_id)
>>>   {
>>>       if (num_ibs == 0)
>>>           return -EINVAL;
>>> @@ -222,7 +223,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev,
>>> struct amdgpu_vm *vm,
>>>       if (!entity)
>>>           return 0;
>>> -    return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>>> +    return drm_sched_job_init(&(*job)->base, entity, 1, owner,
>>> +                  drm_client_id);
>>>   }
>>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>> @@ -232,7 +234,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device
>>> *adev,
>>>   {
>>>       int r;
>>> -    r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
>>> +    r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
>>>       if (r)
>>>           return r;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> index ce6b9ba967ff..5a8bc6342222 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> @@ -90,7 +90,8 @@ static inline struct amdgpu_ring
>>> *amdgpu_job_ring(struct amdgpu_job *job)
>>>   int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
>>> *vm,
>>>                struct drm_sched_entity *entity, void *owner,
>>> -             unsigned int num_ibs, struct amdgpu_job **job);
>>> +             unsigned int num_ibs, struct amdgpu_job **job,
>>> +             u64 drm_client_id);
>>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>>                    struct drm_sched_entity *entity, void
>>> *owner,
>>>                    size_t size, enum amdgpu_ib_pool_type
>>> pool_type,
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> index 3c0a5c3e0e3d..76c742328edb 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> @@ -534,7 +534,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device
>>> *dev, void *data,
>>>       ret = drm_sched_job_init(&submit->sched_job,
>>>                    &ctx->sched_entity[args->pipe],
>>> -                 1, submit->ctx);
>>> +                 1, submit->ctx, file->client_id);
>>>       if (ret)
>>>           goto err_submit_put;
>>> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
>>> b/drivers/gpu/drm/imagination/pvr_job.c
>>> index 59b334d094fa..7564b0f21b42 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_job.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_job.c
>>> @@ -446,7 +446,7 @@ create_job(struct pvr_device *pvr_dev,
>>>       if (err)
>>>           goto err_put_job;
>>> -    err = pvr_queue_job_init(job);
>>> +    err = pvr_queue_job_init(job, pvr_file->file->client_id);
>>>       if (err)
>>>           goto err_put_job;
>>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
>>> b/drivers/gpu/drm/imagination/pvr_queue.c
>>> index 5e9bc0992824..5a41ee79fed6 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_queue.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
>>> @@ -1073,6 +1073,7 @@ static int pvr_queue_cleanup_fw_context(struct
>>> pvr_queue *queue)
>>>   /**
>>>    * pvr_queue_job_init() - Initialize queue related fields in a
>>> pvr_job object.
>>>    * @job: The job to initialize.
>>> + * @drm_client_id: drm_file.client_id submitting the job
>>>    *
>>>    * Bind the job to a queue and allocate memory to guarantee
>>> pvr_queue_job_arm()
>>>    * and pvr_queue_job_push() can't fail. We also make sure the
>>> context type is
>>> @@ -1082,7 +1083,7 @@ static int pvr_queue_cleanup_fw_context(struct
>>> pvr_queue *queue)
>>>    *  * 0 on success, or
>>>    *  * An error code if something failed.
>>>    */
>>> -int pvr_queue_job_init(struct pvr_job *job)
>>> +int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id)
>>>   {
>>>       /* Fragment jobs need at least one native fence wait on the
>>> geometry job fence. */
>>>       u32 min_native_dep_count = job->type ==
>>> DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
>>> @@ -1099,7 +1100,7 @@ int pvr_queue_job_init(struct pvr_job *job)
>>>       if (!pvr_cccb_cmdseq_can_fit(&queue->cccb,
>>> job_cmds_size(job, min_native_dep_count)))
>>>           return -E2BIG;
>>> -    err = drm_sched_job_init(&job->base, &queue->entity, 1,
>>> THIS_MODULE);
>>> +    err = drm_sched_job_init(&job->base, &queue->entity, 1,
>>> THIS_MODULE, drm_client_id);
>>>       if (err)
>>>           return err;
>>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.h
>>> b/drivers/gpu/drm/imagination/pvr_queue.h
>>> index 93fe9ac9f58c..fc1986d73fc8 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_queue.h
>>> +++ b/drivers/gpu/drm/imagination/pvr_queue.h
>>> @@ -143,7 +143,7 @@ struct pvr_queue {
>>>   bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
>>> -int pvr_queue_job_init(struct pvr_job *job);
>>> +int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id);
>>>   void pvr_queue_job_cleanup(struct pvr_job *job);
>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c
>>> b/drivers/gpu/drm/lima/lima_gem.c
>>> index 5deec673c11e..9722b847a539 100644
>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>> @@ -341,7 +341,7 @@ int lima_gem_submit(struct drm_file *file, struct
>>> lima_submit *submit)
>>>       err = lima_sched_task_init(
>>>           submit->task, submit->ctx->context + submit->pipe,
>>> -        bos, submit->nr_bos, vm);
>>> +        bos, submit->nr_bos, vm, file->client_id);
>>>       if (err)
>>>           goto err_out1;
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c
>>> b/drivers/gpu/drm/lima/lima_sched.c
>>> index 7934098e651b..954f4325b859 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -113,7 +113,8 @@ static inline struct lima_sched_pipe
>>> *to_lima_pipe(struct drm_gpu_scheduler *sch
>>>   int lima_sched_task_init(struct lima_sched_task *task,
>>>                struct lima_sched_context *context,
>>>                struct lima_bo **bos, int num_bos,
>>> -             struct lima_vm *vm)
>>> +             struct lima_vm *vm,
>>> +             u64 drm_client_id)
>>>   {
>>>       int err, i;
>>> @@ -124,7 +125,8 @@ int lima_sched_task_init(struct lima_sched_task
>>> *task,
>>>       for (i = 0; i < num_bos; i++)
>>>           drm_gem_object_get(&bos[i]->base.base);
>>> -    err = drm_sched_job_init(&task->base, &context->base, 1,
>>> vm);
>>> +    err = drm_sched_job_init(&task->base, &context->base, 1, vm,
>>> +                 drm_client_id);
>>>       if (err) {
>>>           kfree(task->bos);
>>>           return err;
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.h
>>> b/drivers/gpu/drm/lima/lima_sched.h
>>> index 85b23ba901d5..1a08faf8a529 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.h
>>> +++ b/drivers/gpu/drm/lima/lima_sched.h
>>> @@ -88,7 +88,8 @@ struct lima_sched_pipe {
>>>   int lima_sched_task_init(struct lima_sched_task *task,
>>>                struct lima_sched_context *context,
>>>                struct lima_bo **bos, int num_bos,
>>> -             struct lima_vm *vm);
>>> +             struct lima_vm *vm,
>>> +             u64 drm_client_id);
>>>   void lima_sched_task_fini(struct lima_sched_task *task);
>>>   int lima_sched_context_init(struct lima_sched_pipe *pipe,
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> index 3e9aa2cc38ef..d9be0fe3d674 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> @@ -30,7 +30,7 @@
>>>   static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>           struct msm_gpu *gpu,
>>>           struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
>>> -        uint32_t nr_cmds)
>>> +        uint32_t nr_cmds, u64 drm_client_id)
>>>   {
>>>       static atomic_t ident = ATOMIC_INIT(0);
>>>       struct msm_gem_submit *submit;
>>> @@ -54,7 +54,8 @@ static struct msm_gem_submit *submit_create(struct
>>> drm_device *dev,
>>>           return ERR_PTR(ret);
>>>       }
>>> -    ret = drm_sched_job_init(&submit->base, queue->entity, 1,
>>> queue);
>>> +    ret = drm_sched_job_init(&submit->base, queue->entity, 1,
>>> queue,
>>> +                 drm_client_id);
>>>       if (ret) {
>>>           kfree(submit->hw_fence);
>>>           kfree(submit);
>>> @@ -693,7 +694,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev,
>>> void *data,
>>>           }
>>>       }
>>> -    submit = submit_create(dev, gpu, queue, args->nr_bos, args-
>>>> nr_cmds);
>>> +    submit = submit_create(dev, gpu, queue, args->nr_bos, args-
>>>> nr_cmds,
>>> +                   file->client_id);
>>>       if (IS_ERR(submit)) {
>>>           ret = PTR_ERR(submit);
>>>           goto out_post_unlock;
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> index d326e55d2d24..460a5fb02412 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> @@ -87,7 +87,8 @@ nouveau_job_init(struct nouveau_job *job,
>>>       }
>>>       ret = drm_sched_job_init(&job->base, &sched->entity,
>>> -                 args->credits, NULL);
>>> +                 args->credits, NULL,
>>> +                 job->file_priv->client_id);
>>>       if (ret)
>>>           goto err_free_chains;
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> index b87f83e94eda..d5c2c6530ed8 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> @@ -312,7 +312,7 @@ static int panfrost_ioctl_submit(struct
>>> drm_device *dev, void *data,
>>>       ret = drm_sched_job_init(&job->base,
>>>                    &file_priv->sched_entity[slot],
>>> -                 1, NULL);
>>> +                 1, NULL, file->client_id);
>>>       if (ret)
>>>           goto out_put_job;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c
>>> b/drivers/gpu/drm/panthor/panthor_drv.c
>>> index 06fe46e32073..bd8e1900c919 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>> @@ -989,7 +989,8 @@ static int panthor_ioctl_group_submit(struct
>>> drm_device *ddev, void *data,
>>>           const struct drm_panthor_queue_submit *qsubmit =
>>> &jobs_args[i];
>>>           struct drm_sched_job *job;
>>> -        job = panthor_job_create(pfile, args->group_handle,
>>> qsubmit);
>>> +        job = panthor_job_create(pfile, args->group_handle,
>>> qsubmit,
>>> +                     file->client_id);
>>>           if (IS_ERR(job)) {
>>>               ret = PTR_ERR(job);
>>>               goto out_cleanup_submit_ctx;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index 12a02e28f50f..e0c79bd2d173 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -2516,7 +2516,7 @@ panthor_vm_bind_job_create(struct drm_file
>>> *file,
>>>       kref_init(&job->refcount);
>>>       job->vm = panthor_vm_get(vm);
>>> -    ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm);
>>> +    ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm,
>>> file->client_id);
>>>       if (ret)
>>>           goto err_put_job;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
>>> b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index 446ec780eb4a..2af860c9068a 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -3729,7 +3729,8 @@ struct panthor_vm *panthor_job_vm(struct
>>> drm_sched_job *sched_job)
>>>   struct drm_sched_job *
>>>   panthor_job_create(struct panthor_file *pfile,
>>>              u16 group_handle,
>>> -           const struct drm_panthor_queue_submit *qsubmit)
>>> +           const struct drm_panthor_queue_submit *qsubmit,
>>> +           u64 drm_client_id)
>>>   {
>>>       struct panthor_group_pool *gpool = pfile->groups;
>>>       struct panthor_job *job;
>>> @@ -3801,7 +3802,7 @@ panthor_job_create(struct panthor_file *pfile,
>>>       ret = drm_sched_job_init(&job->base,
>>>                    &job->group->queues[job-
>>>> queue_idx]->entity,
>>> -                 credits, job->group);
>>> +                 credits, job->group,
>>> drm_client_id);
>>>       if (ret)
>>>           goto err_put_job;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h
>>> b/drivers/gpu/drm/panthor/panthor_sched.h
>>> index e650a445cf50..742b0b4ff3a3 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
>>> @@ -29,7 +29,8 @@ int panthor_group_get_state(struct panthor_file
>>> *pfile,
>>>   struct drm_sched_job *
>>>   panthor_job_create(struct panthor_file *pfile,
>>>              u16 group_handle,
>>> -           const struct drm_panthor_queue_submit *qsubmit);
>>> +           const struct drm_panthor_queue_submit *qsubmit,
>>> +           u64 drm_client_id);
>>>   struct drm_sched_job *panthor_job_get(struct drm_sched_job *job);
>>>   struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job);
>>>   void panthor_job_put(struct drm_sched_job *job);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
>>> b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index e971528504a5..d208d384d38d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -206,7 +206,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct
>>> dma_fence *f)
>>>   EXPORT_SYMBOL(to_drm_sched_fence);
>>>   struct drm_sched_fence *drm_sched_fence_alloc(struct
>>> drm_sched_entity *entity,
>>> -                          void *owner)
>>> +                          void *owner,
>>> +                          u64 drm_client_id)
>>>   {
>>>       struct drm_sched_fence *fence = NULL;
>>> @@ -215,6 +216,7 @@ struct drm_sched_fence
>>> *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>           return NULL;
>>>       fence->owner = owner;
>>> +    fence->drm_client_id = drm_client_id;
>>>       spin_lock_init(&fence->lock);
>>>       return fence;
>>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
>>> b/drivers/gpu/drm/scheduler/sched_internal.h
>>> index 599cf6e1bb74..7ea5a6736f98 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>>> @@ -24,7 +24,7 @@ void drm_sched_entity_select_rq(struct
>>> drm_sched_entity *entity);
>>>   struct drm_sched_job *drm_sched_entity_pop_job(struct
>>> drm_sched_entity *entity);
>>>   struct drm_sched_fence *drm_sched_fence_alloc(struct
>>> drm_sched_entity *s_entity,
>>> -                          void *owner);
>>> +                          void *owner, u64
>>> drm_client_id);
>>>   void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>                 struct drm_sched_entity *entity);
>>>   void drm_sched_fence_free(struct drm_sched_fence *fence);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 829579c41c6b..60611618f3ab 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -764,6 +764,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>    * @credits: the number of credits this job contributes to the
>>> schedulers
>>>    * credit limit
>>>    * @owner: job owner for debugging
>>> + * @drm_client_id: drm_file.client_id of the owner
>>
>> For the docu generation to link that properly it must be written as
>>
>> &struct drm_file.client_id
> 
> Noted.
> 
>>
>> Besides, if this were an optional parameter, one should document it.
>> I'm not sure if it is, I haven't used these client_id's before.
> 
> Passing an invalid client_id would only cause the trace events to print the invalid client_id.
> 
> Thanks,
> Pierre-Eric
> 
> 
>>
>> P.
>>
>>>    *
>>>    * Refer to drm_sched_entity_push_job() documentation
>>>    * for locking considerations.
>>> @@ -784,7 +785,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>    */
>>>   int drm_sched_job_init(struct drm_sched_job *job,
>>>                  struct drm_sched_entity *entity,
>>> -               u32 credits, void *owner)
>>> +               u32 credits, void *owner,
>>> +               uint64_t drm_client_id)
>>>   {
>>>       if (!entity->rq) {
>>>           /* This will most likely be followed by missing
>>> frames
>>> @@ -810,7 +812,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>       job->entity = entity;
>>>       job->credits = credits;
>>> -    job->s_fence = drm_sched_fence_alloc(entity, owner);
>>> +    job->s_fence = drm_sched_fence_alloc(entity, owner,
>>> drm_client_id);
>>>       if (!job->s_fence)
>>>           return -ENOMEM;
>>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> index f999c8859cf7..09ffbdb32d76 100644
>>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>> @@ -35,7 +35,7 @@ drm_mock_sched_entity_new(struct kunit *test,
>>>       ret = drm_sched_entity_init(&entity->base,
>>>                       priority,
>>>                       &drm_sched, 1,
>>> -                    NULL);
>>> +                    NULL, 1);
>>>       KUNIT_ASSERT_EQ(test, ret, 0);
>>>       entity->test = test;
>>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
>>> b/drivers/gpu/drm/v3d/v3d_submit.c
>>> index 4ff5de46fb22..5171ffe9012d 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>>> @@ -169,7 +169,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file
>>> *file_priv,
>>>       job->file = file_priv;
>>>       ret = drm_sched_job_init(&job->base, &v3d_priv-
>>>> sched_entity[queue],
>>> -                 1, v3d_priv);
>>> +                 1, v3d_priv, file_priv->client_id);
>>>       if (ret)
>>>           return ret;
>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
>>> b/drivers/gpu/drm/xe/xe_sched_job.c
>>> index 1905ca590965..f4679cb9a56b 100644
>>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>> @@ -113,7 +113,8 @@ struct xe_sched_job *xe_sched_job_create(struct
>>> xe_exec_queue *q,
>>>       kref_init(&job->refcount);
>>>       xe_exec_queue_get(job->q);
>>> -    err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
>>> +    err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
>>> +                 q->xef->drm->client_id);
>>>       if (err)
>>>           goto err_free;
>>> diff --git a/include/drm/gpu_scheduler.h
>>> b/include/drm/gpu_scheduler.h
>>> index 1a7e377d4cbb..6fe3b4c0cffb 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -305,6 +305,13 @@ struct drm_sched_fence {
>>>            * @owner: job owner for debugging
>>>            */
>>>       void                *owner;
>>> +
>>> +    /**
>>> +     * @drm_client_id:
>>> +     *
>>> +     * The client_id of the drm_file which owns the job.
>>> +     */
>>> +    uint64_t            drm_client_id;
>>>   };
>>>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>>> @@ -629,7 +636,8 @@ drm_sched_pick_best(struct drm_gpu_scheduler
>>> **sched_list,
>>>   int drm_sched_job_init(struct drm_sched_job *job,
>>>                  struct drm_sched_entity *entity,
>>> -               u32 credits, void *owner);
>>> +               u32 credits, void *owner,
>>> +               u64 drm_client_id);
>>>   void drm_sched_job_arm(struct drm_sched_job *job);
>>>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>>>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
