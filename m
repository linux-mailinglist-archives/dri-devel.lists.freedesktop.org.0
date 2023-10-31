Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE067DCDEA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE3410E4CC;
	Tue, 31 Oct 2023 13:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372F910E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698759213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gT4QJvPCbu+07bS43MMl8x5zE2eVakIOatztahK+PPw=;
 b=ZhcKphCf4jH009KjeZZCml3cc47YSOrbqg93d8FyPZykIuou/9tOLTCHorj57JJCtsjCkH
 jxkAMGdMhn35fkfow6yM1soIO189wahdd4XHN+Ix/OK+wU0MEhTdhD/SdqTY70fUsABWWW
 uaZnceyxJN+2kmB5nS8AjO5zHVdFQJY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-khJFBQBWP42oKQXnjj7FEw-1; Tue, 31 Oct 2023 09:33:29 -0400
X-MC-Unique: khJFBQBWP42oKQXnjj7FEw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ae57d8b502so391391766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 06:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759209; x=1699364009;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gT4QJvPCbu+07bS43MMl8x5zE2eVakIOatztahK+PPw=;
 b=mh0sGo3//R+OofI/Efuyh4zDoyT33Kz+vug1KIpzRNVt5TGQOJmSj+hgbETuUgBL7F
 Afaof1pb8MqLCllM2iI5yS923mD1X0ek+iMnhfwuvk/9Vp+Jnr1AkgzWWqQ9yYB5fgzH
 oAlah0DYBKr1+oSXCYoabP1IGryElYCrtG9S1EqpN8wPhNJOhiUOyetv1D5Hj4TE1KVi
 +t2wDTOtwL1Iq+CwFZm/wCdN7F+ODwti9kDR2GmKw5K4GQsK3zBPuWlQpRc+ihzhOiYC
 zG3RYXVRdk5sy4uxLDSsxh7yHmFMHZRxFqLJAD4hxX/RNOFrPs2B35N41h0kxoogRbdu
 Km5A==
X-Gm-Message-State: AOJu0YxJwuBkc+nppVzcR4x3kS45x7rC9AipmfXk/05oomjVlCFRoYnD
 C67o8Ovg3n/0DCIkMmdivMGuTVikhnBKcNR/IielNCdxKrxoAZSbaAciO1xO8eFvSvqq8HNO5BS
 tFw3l+OIiZcHPaxWc9TSyAenPBt6T
X-Received: by 2002:a17:907:1dce:b0:9d1:ce87:9eee with SMTP id
 og14-20020a1709071dce00b009d1ce879eeemr5120379ejc.25.1698759208675; 
 Tue, 31 Oct 2023 06:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVntxP6MyqixeuefGP7Qsd+chKVugCj9THXHj0XJBHIqaWihFrhn+OOo3+R05C1uuDn78ScQ==
X-Received: by 2002:a17:907:1dce:b0:9d1:ce87:9eee with SMTP id
 og14-20020a1709071dce00b009d1ce879eeemr5120364ejc.25.1698759208247; 
 Tue, 31 Oct 2023 06:33:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a170906831700b00991d54db2acsm975388ejx.44.2023.10.31.06.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 06:33:27 -0700 (PDT)
Message-ID: <c57c7217-bfb9-4770-b17e-587f3b8a038c@redhat.com>
Date: Tue, 31 Oct 2023 14:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
To: Luben Tuikov <ltuikov89@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231023032251.164775-1-luben.tuikov@amd.com>
 <8f53f7ef-7621-4f0b-bdef-d8d20bc497ff@redhat.com>
 <6f3e9b93-2be5-46b2-bbd9-d61d2603c14a@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <6f3e9b93-2be5-46b2-bbd9-d61d2603c14a@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Matthew Brost <matthew.brost@intel.com>, lima@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, nouveau@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/26/23 19:25, Luben Tuikov wrote:
> On 2023-10-26 12:39, Danilo Krummrich wrote:
>> On 10/23/23 05:22, Luben Tuikov wrote:
>>> The GPU scheduler has now a variable number of run-queues, which are set up at
>>> drm_sched_init() time. This way, each driver announces how many run-queues it
>>> requires (supports) per each GPU scheduler it creates. Note, that run-queues
>>> correspond to scheduler "priorities", thus if the number of run-queues is set
>>> to 1 at drm_sched_init(), then that scheduler supports a single run-queue,
>>> i.e. single "priority". If a driver further sets a single entity per
>>> run-queue, then this creates a 1-to-1 correspondence between a scheduler and
>>> a scheduled entity.
>>
>> Generally, I'm fine with this patch and how it replaces / generalizes the single
>> entity approach.
> 
> Great!
> 
>> However, I'm not quite sure how to properly use this. What is a driver supposed to
>> do, which previously took advantage of DRM_SCHED_POLICY_SINGLE_ENTITY?
>>
>> Is it supposed to call drm_sched_init() with num_rqs=1? If so, what's the correct way
> 
> Yes, you call drm_sched_init() with num_rqs set to 1.
> 
>> to initialize the drm_sched_entity then? Calling drm_sched_entity_init() with priority=0?
> 
> Yes, with priority set to 0.
> 
> One unfortunate fact I noticed when doing this patch is that the numerical values
> assigned to enum drm_sched_priority is that the names to values are upside down.
> Instead of min being 0, normal:1, high:2, kernel:3, it should've been kernel:0 (highest),
> high:1, normal:2, low:4, and so on.
> 
> The reason for this is absolutely clear: if you had a single priority, it would be
> 0, the kernel, one, highest one. This is similar to how lanes in a highway are counted:
> you always have lane 1. Similarly to nice(1) and kernel priorities...
> 
>> Any other priority consequently faults in drm_sched_job_arm().
> 
> drm_sched_job_arm() faults on !ENTITY, but the "priority" is just
> assigned to s_priority:
> 	job->s_priority = entity->priority;
> 
> 
>> While I might sound like a broken record (sorry for that), I really think everything
>> related to Matt's series needs documentation, as in:
> 
> Yes, I agree.

Great! Do you plan to send a subsequent patch adding some documentation for this one? I
think it'd be good to get all the above documented.

>   
>> - What is the typical application of the single entity / variable run queue design?
>>     How do drivers make use of it?
> 
> I believe most drivers in the future, would want to have a single sched_rq (i.e. single
> "priority", and then would tack a single entity to this, and then do prioritization
> internally in their firmware/hardware.
> 
>> - How to tear down a scheduler instance properly?
>> - Motivation and implications of the workqueue topology (default workqueue, external
>>     driver workqueue, free job work, run job work, etc.).
>>
>> But also the existing scheduler infrastructure requires more documentation.
>>
>> The scheduler barely has some documentation to describe its basic topology of
>> struct drm_gpu_scheduler, struct drm_sched_entity and struct drm_sched_job.
>> Plus a few hints regarding run queue priorities, which, with this patch, seem to be
>> (partially) out-dated or at least incomplete.
>>
>> I think Sima also mentioned that we really need to put some efforts here. [1]
> 
> Yes, that's true.
> 
> Regards,
> Luben
> 
>>
>> - Danilo
>>
>> [1] https://lore.kernel.org/all/20231017150958.838613-1-matthew.brost@intel.com/T/#m330335b44bdb7ae93ac6ebdedd65706df5a0f03d
>>
>>>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>> Cc: Qiang Yu <yuq825@gmail.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Emma Anholt <emma@anholt.net>
>>> Cc: etnaviv@lists.freedesktop.org
>>> Cc: lima@lists.freedesktop.org
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: freedreno@lists.freedesktop.org
>>> Cc: nouveau@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 +-
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  1 +
>>>    drivers/gpu/drm/lima/lima_sched.c          |  4 +-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c       |  5 +-
>>>    drivers/gpu/drm/nouveau/nouveau_sched.c    |  1 +
>>>    drivers/gpu/drm/panfrost/panfrost_job.c    |  1 +
>>>    drivers/gpu/drm/scheduler/sched_entity.c   | 18 +++++-
>>>    drivers/gpu/drm/scheduler/sched_main.c     | 74 ++++++++++++++++++----
>>>    drivers/gpu/drm/v3d/v3d_sched.c            |  5 ++
>>>    include/drm/gpu_scheduler.h                |  9 ++-
>>>    11 files changed, 98 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 2b8356699f235d..251995a90bbe69 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>    		}
>>>    
>>>    		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>> +				   DRM_SCHED_PRIORITY_COUNT,
>>>    				   ring->num_hw_submission, 0,
>>>    				   timeout, adev->reset_domain->wq,
>>>    				   ring->sched_score, ring->name,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 78476bc75b4e1d..1f357198533f3e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -325,8 +325,8 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>>>    	int i;
>>>    
>>>    	/* Signal all jobs not yet scheduled */
>>> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> -		struct drm_sched_rq *rq = &sched->sched_rq[i];
>>> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> +		struct drm_sched_rq *rq = sched->sched_rq[i];
>>>    		spin_lock(&rq->lock);
>>>    		list_for_each_entry(s_entity, &rq->entities, list) {
>>>    			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> index 345fec6cb1a4c1..9b79f218e21afc 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> @@ -135,6 +135,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>    	int ret;
>>>    
>>>    	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>> +			     DRM_SCHED_PRIORITY_COUNT,
>>>    			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>>    			     msecs_to_jiffies(500), NULL, NULL,
>>>    			     dev_name(gpu->dev), gpu->dev);
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>> index ffd91a5ee29901..295f0353a02e58 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -488,7 +488,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>>    
>>>    	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>>>    
>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>>> +	return drm_sched_init(&pipe->base, &lima_sched_ops,
>>> +			      DRM_SCHED_PRIORITY_COUNT,
>>> +			      1,
>>>    			      lima_job_hang_limit,
>>>    			      msecs_to_jiffies(timeout), NULL,
>>>    			      NULL, name, pipe->ldev->dev);
>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> index 40c0bc35a44cee..95257ab0185dc4 100644
>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> @@ -95,8 +95,9 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>    	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>>    
>>>    	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>> -			num_hw_submissions, 0, sched_timeout,
>>> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>> +			     DRM_SCHED_PRIORITY_COUNT,
>>> +			     num_hw_submissions, 0, sched_timeout,
>>> +			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>>    	if (ret) {
>>>    		goto fail;
>>>    	}
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> index 3b7ea522122605..7c376c4ccdcf9b 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> @@ -436,6 +436,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>>    		return -ENOMEM;
>>>    
>>>    	return drm_sched_init(sched, &nouveau_sched_ops,
>>> +			      DRM_SCHED_PRIORITY_COUNT,
>>>    			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>>>    			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>>>    }
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index a8b4827dc42586..95510d481fab3a 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -832,6 +832,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>>    
>>>    		ret = drm_sched_init(&js->queue[j].sched,
>>>    				     &panfrost_sched_ops,
>>> +				     DRM_SCHED_PRIORITY_COUNT,
>>>    				     nentries, 0,
>>>    				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>    				     pfdev->reset.wq,
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index a42763e1429dc1..409e4256f6e7d6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -75,8 +75,20 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>    	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>    	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>    
>>> -	if(num_sched_list)
>>> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
>>> +	if (!sched_list[0]->sched_rq) {
>>> +		/* Warn drivers not to do this and to fix their DRM
>>> +		 * calling order.
>>> +		 */
>>> +		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>> +	} else if (num_sched_list) {
>>> +		/* The "priority" of an entity cannot exceed the number
>>> +		 * of run-queues of a scheduler.
>>> +		 */
>>> +		if (entity->priority >= sched_list[0]->num_rqs)
>>> +			entity->priority = max_t(u32, sched_list[0]->num_rqs,
>>> +						 DRM_SCHED_PRIORITY_MIN);
>>> +		entity->rq = sched_list[0]->sched_rq[entity->priority];
>>> +	}
>>>    
>>>    	init_completion(&entity->entity_idle);
>>>    
>>> @@ -533,7 +545,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>    
>>>    	spin_lock(&entity->rq_lock);
>>>    	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>>> -	rq = sched ? &sched->sched_rq[entity->priority] : NULL;
>>> +	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>>>    	if (rq != entity->rq) {
>>>    		drm_sched_rq_remove_entity(entity->rq, entity);
>>>    		entity->rq = rq;
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 5a3a622fc672f3..99797a8c836ac7 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -632,8 +632,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>    		       struct drm_sched_entity *entity,
>>>    		       void *owner)
>>>    {
>>> -	if (!entity->rq)
>>> +	if (!entity->rq) {
>>> +		/* This will most likely be followed by missing frames
>>> +		 * or worse--a blank screen--leave a trail in the
>>> +		 * logs, so this can be debugged easier.
>>> +		 */
>>> +		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>>>    		return -ENOENT;
>>> +	}
>>>    
>>>    	job->entity = entity;
>>>    	job->s_fence = drm_sched_fence_alloc(entity, owner);
>>> @@ -671,7 +677,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>>    	sched = entity->rq->sched;
>>>    
>>>    	job->sched = sched;
>>> -	job->s_priority = entity->rq - sched->sched_rq;
>>> +	job->s_priority = entity->priority;
>>>    	job->id = atomic64_inc_return(&sched->job_id_count);
>>>    
>>>    	drm_sched_fence_init(job->s_fence, job->entity);
>>> @@ -888,10 +894,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>    		return NULL;
>>>    
>>>    	/* Kernel run queue has higher priority than normal run queue*/
>>> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>    		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>> +			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
>>> +			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
>>>    		if (entity)
>>>    			break;
>>>    	}
>>> @@ -1071,6 +1077,7 @@ static int drm_sched_main(void *param)
>>>     *
>>>     * @sched: scheduler instance
>>>     * @ops: backend operations for this scheduler
>>> + * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
>>>     * @hw_submission: number of hw submissions that can be in flight
>>>     * @hang_limit: number of times to allow a job to hang before dropping it
>>>     * @timeout: timeout value in jiffies for the scheduler
>>> @@ -1084,11 +1091,12 @@ static int drm_sched_main(void *param)
>>>     */
>>>    int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    		   const struct drm_sched_backend_ops *ops,
>>> -		   unsigned hw_submission, unsigned hang_limit,
>>> +		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
>>>    		   long timeout, struct workqueue_struct *timeout_wq,
>>>    		   atomic_t *score, const char *name, struct device *dev)
>>>    {
>>>    	int i, ret;
>>> +
>>>    	sched->ops = ops;
>>>    	sched->hw_submission_limit = hw_submission;
>>>    	sched->name = name;
>>> @@ -1097,8 +1105,36 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    	sched->hang_limit = hang_limit;
>>>    	sched->score = score ? score : &sched->_score;
>>>    	sched->dev = dev;
>>> -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>>> -		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>>> +
>>> +	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>>> +		/* This is a gross violation--tell drivers what the  problem is.
>>> +		 */
>>> +		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
>>> +			__func__);
>>> +		return -EINVAL;
>>> +	} else if (sched->sched_rq) {
>>> +		/* Not an error, but warn anyway so drivers can
>>> +		 * fine-tune their DRM calling order, and return all
>>> +		 * is good.
>>> +		 */
>>> +		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
>>> +		return 0;
>>> +	}
>>> +
>>> +	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
>>> +					GFP_KERNEL | __GFP_ZERO);
>>> +	if (!sched->sched_rq) {
>>> +		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
>>> +		return -ENOMEM;
>>> +	}
>>> +	sched->num_rqs = num_rqs;
>>> +	ret = -ENOMEM;
>>> +	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
>>> +		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>>> +		if (!sched->sched_rq[i])
>>> +			goto Out_unroll;
>>> +		drm_sched_rq_init(sched, sched->sched_rq[i]);
>>> +	}
>>>    
>>>    	init_waitqueue_head(&sched->wake_up_worker);
>>>    	init_waitqueue_head(&sched->job_scheduled);
>>> @@ -1115,11 +1151,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    		ret = PTR_ERR(sched->thread);
>>>    		sched->thread = NULL;
>>>    		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
>>> -		return ret;
>>> +		goto Out_unroll;
>>>    	}
>>>    
>>>    	sched->ready = true;
>>>    	return 0;
>>> +Out_unroll:
>>> +	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
>>> +		kfree(sched->sched_rq[i]);
>>> +	kfree(sched->sched_rq);
>>> +	sched->sched_rq = NULL;
>>> +	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
>>> +	return ret;
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_init);
>>>    
>>> @@ -1138,8 +1181,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    	if (sched->thread)
>>>    		kthread_stop(sched->thread);
>>>    
>>> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> -		struct drm_sched_rq *rq = &sched->sched_rq[i];
>>> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> +		struct drm_sched_rq *rq = sched->sched_rq[i];
>>>    
>>>    		spin_lock(&rq->lock);
>>>    		list_for_each_entry(s_entity, &rq->entities, list)
>>> @@ -1150,7 +1193,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    			 */
>>>    			s_entity->stopped = true;
>>>    		spin_unlock(&rq->lock);
>>> -
>>> +		kfree(sched->sched_rq[i]);
>>>    	}
>>>    
>>>    	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
>>> @@ -1160,6 +1203,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    	cancel_delayed_work_sync(&sched->work_tdr);
>>>    
>>>    	sched->ready = false;
>>> +	kfree(sched->sched_rq);
>>> +	sched->sched_rq = NULL;
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_fini);
>>>    
>>> @@ -1186,9 +1231,10 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>>>    	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>>>    		atomic_inc(&bad->karma);
>>>    
>>> -		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
>>> +		for (i = DRM_SCHED_PRIORITY_MIN;
>>> +		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
>>>    		     i++) {
>>> -			struct drm_sched_rq *rq = &sched->sched_rq[i];
>>> +			struct drm_sched_rq *rq = sched->sched_rq[i];
>>>    
>>>    			spin_lock(&rq->lock);
>>>    			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
>>> index 06238e6d7f5cda..038e1ae589c718 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>> @@ -389,6 +389,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>>>    
>>>    	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
>>>    			     &v3d_bin_sched_ops,
>>> +			     DRM_SCHED_PRIORITY_COUNT,
>>>    			     hw_jobs_limit, job_hang_limit,
>>>    			     msecs_to_jiffies(hang_limit_ms), NULL,
>>>    			     NULL, "v3d_bin", v3d->drm.dev);
>>> @@ -397,6 +398,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>>>    
>>>    	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>>>    			     &v3d_render_sched_ops,
>>> +			     DRM_SCHED_PRIORITY_COUNT,
>>>    			     hw_jobs_limit, job_hang_limit,
>>>    			     msecs_to_jiffies(hang_limit_ms), NULL,
>>>    			     NULL, "v3d_render", v3d->drm.dev);
>>> @@ -405,6 +407,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>>>    
>>>    	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>>>    			     &v3d_tfu_sched_ops,
>>> +			     DRM_SCHED_PRIORITY_COUNT,
>>>    			     hw_jobs_limit, job_hang_limit,
>>>    			     msecs_to_jiffies(hang_limit_ms), NULL,
>>>    			     NULL, "v3d_tfu", v3d->drm.dev);
>>> @@ -414,6 +417,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>>>    	if (v3d_has_csd(v3d)) {
>>>    		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
>>>    				     &v3d_csd_sched_ops,
>>> +				     DRM_SCHED_PRIORITY_COUNT,
>>>    				     hw_jobs_limit, job_hang_limit,
>>>    				     msecs_to_jiffies(hang_limit_ms), NULL,
>>>    				     NULL, "v3d_csd", v3d->drm.dev);
>>> @@ -422,6 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>>>    
>>>    		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>>>    				     &v3d_cache_clean_sched_ops,
>>> +				     DRM_SCHED_PRIORITY_COUNT,
>>>    				     hw_jobs_limit, job_hang_limit,
>>>    				     msecs_to_jiffies(hang_limit_ms), NULL,
>>>    				     NULL, "v3d_cache_clean", v3d->drm.dev);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index ac65f0626cfc91..d2fb81e34174dc 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -471,7 +471,9 @@ struct drm_sched_backend_ops {
>>>     * @hw_submission_limit: the max size of the hardware queue.
>>>     * @timeout: the time after which a job is removed from the scheduler.
>>>     * @name: name of the ring for which this scheduler is being used.
>>> - * @sched_rq: priority wise array of run queues.
>>> + * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
>>> + *           as there's usually one run-queue per priority, but could be less.
>>> + * @sched_rq: An allocated array of run-queues of size @num_rqs;
>>>     * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
>>>     *                  is ready to be scheduled.
>>>     * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>>> @@ -500,7 +502,8 @@ struct drm_gpu_scheduler {
>>>    	uint32_t			hw_submission_limit;
>>>    	long				timeout;
>>>    	const char			*name;
>>> -	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>>> +	u32                             num_rqs;
>>> +	struct drm_sched_rq             **sched_rq;
>>>    	wait_queue_head_t		wake_up_worker;
>>>    	wait_queue_head_t		job_scheduled;
>>>    	atomic_t			hw_rq_count;
>>> @@ -520,7 +523,7 @@ struct drm_gpu_scheduler {
>>>    
>>>    int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    		   const struct drm_sched_backend_ops *ops,
>>> -		   uint32_t hw_submission, unsigned hang_limit,
>>> +		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
>>>    		   long timeout, struct workqueue_struct *timeout_wq,
>>>    		   atomic_t *score, const char *name, struct device *dev);
>>>    
>>>
>>> base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
>>

