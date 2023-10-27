Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9967D9C74
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAB610E9DB;
	Fri, 27 Oct 2023 15:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31210E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698418906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2FgfILiCZ44ons/HnG8a5QUFFY1ZKRRFMXKlfTCPYCI=;
 b=TP4TZ4ozAJIa41mcBkuNsp3Fo/mUgc9Wl+Cy7UCIwChNqPbtM+VOVY7iAk91BwAqGEnWt/
 Huh7LfLfW4dLRUQFWSQwSv7J/UHigF7Eyx72UizlMa10OOD5Hy9ayzlZsN3rsTOLYUdVmf
 ruEWNkJdpoO01XFxQDxMB/hBxOVKnQw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-aZ2RWsjpN8ackiuIIJm_Hg-1; Fri, 27 Oct 2023 11:01:43 -0400
X-MC-Unique: aZ2RWsjpN8ackiuIIJm_Hg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9c6a4a60033so148620966b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 08:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698418902; x=1699023702;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2FgfILiCZ44ons/HnG8a5QUFFY1ZKRRFMXKlfTCPYCI=;
 b=Cr/+uurczMFbHfwyG08H6VVYs3Q61dSSAnAk1HJu7AYIGBzAi9fNFzKkz1Y0Jzr4PP
 37oNleR2YUkvW9NtOSnQdDJPVswNr20pxyFRbsFVXL2LKLjUHUFzd0++NGk5ftrbBGbQ
 kXS/E1dHxDDt8JLwaRvpSB73dM9mNut9iGBO9i+ZBQrzcHqwliW09SkWqi5/80ZuELvc
 f3PjpesL4MFoI6TT9x6ngLrdPZCz9wbOhX1WImNZP3z6TW1DGX6ZFBkOf0ajX6M0t/W/
 /t81jVGJhIJOQltww8G1V8tkUx0Bdch7Q+rrDjTEUd1bEzbem5/aLJQ9Kc6FVTu7pnl2
 roFw==
X-Gm-Message-State: AOJu0Yx8Af93tb9NPSgnh+iG78KhCLDA2TzakaQv1nhFnEMWuqDKR1QH
 laLB7fE88THi9pseNhE3SYIUlD4mn6PwGdsnIAtE8LLTpdVnYWGB0/ELKqfru562cLybBvUwGSE
 goT9sHdM8CiTusAhffUOCKh7xjJEb
X-Received: by 2002:a17:907:3eaa:b0:9c1:9b3a:4cd1 with SMTP id
 hs42-20020a1709073eaa00b009c19b3a4cd1mr2986730ejc.3.1698418901755; 
 Fri, 27 Oct 2023 08:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECAwsrF+LS0ZmZZ9EEwKIfRhXE0Cj2v4MlYxzUcHsQ3qdEUWVBOkgwUTWfwQYFV9q6iAN37Q==
X-Received: by 2002:a17:907:3eaa:b0:9c1:9b3a:4cd1 with SMTP id
 hs42-20020a1709073eaa00b009c19b3a4cd1mr2986679ejc.3.1698418901132; 
 Fri, 27 Oct 2023 08:01:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a170906358700b0099297782aa9sm1290556ejb.49.2023.10.27.08.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 08:01:40 -0700 (PDT)
Message-ID: <ffba4221-0c07-4308-bfbe-35a6502f29cc@redhat.com>
Date: Fri, 27 Oct 2023 17:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
To: Luben Tuikov <ltuikov89@gmail.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net, luben.tuikov@amd.com
References: <20231026161431.5934-1-dakr@redhat.com>
 <c95c4dbf-3d97-477a-9074-a4e6a4394189@gmail.com>
 <3d7beeb5-1f10-4837-9c14-6a0f40d83b3c@redhat.com>
 <03c79c17-93ad-45cf-acd3-50a0d575f3c4@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <03c79c17-93ad-45cf-acd3-50a0d575f3c4@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/23 16:59, Luben Tuikov wrote:
> Hi Danilo,
> 
> On 2023-10-27 10:45, Danilo Krummrich wrote:
>> Hi Luben,
>>
>> On 10/26/23 23:13, Luben Tuikov wrote:
>>> On 2023-10-26 12:13, Danilo Krummrich wrote:
>>>> Currently, job flow control is implemented simply by limiting the number
>>>> of jobs in flight. Therefore, a scheduler is initialized with a credit
>>>> limit that corresponds to the number of jobs which can be sent to the
>>>> hardware.
>>>>
>>>> This implies that for each job, drivers need to account for the maximum
>>>> job size possible in order to not overflow the ring buffer.
>>>>
>>>> However, there are drivers, such as Nouveau, where the job size has a
>>>> rather large range. For such drivers it can easily happen that job
>>>> submissions not even filling the ring by 1% can block subsequent
>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>
>>>> In order to overcome this issue, allow for tracking the actual job size
>>>> instead of the number of jobs. Therefore, add a field to track a job's
>>>> credit count, which represents the number of credits a job contributes
>>>> to the scheduler's credit limit.
>>>>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>> Changes in V2:
>>>> ==============
>>>>     - fixed up influence on scheduling fairness due to consideration of a job's
>>>>       size
>>>>       - If we reach a ready entity in drm_sched_select_entity() but can't actually
>>>>         queue a job from it due to size limitations, just give up and go to sleep
>>>>         until woken up due to a pending job finishing, rather than continue to try
>>>>         other entities.
>>>>     - added a callback to dynamically update a job's credits (Boris)
>>>>     - renamed 'units' to 'credits'
>>>>     - fixed commit message and comments as requested by Luben
>>>>
>>>> Changes in V3:
>>>> ==============
>>>>     - rebased onto V7 of the "DRM scheduler changes for Xe" series by Matt
>>>>     - move up drm_sched_can_queue() instead of adding a forward declaration
>>>>       (Boris)
>>>>     - add a drm_sched_available_credits() helper (Boris)
>>>>     - adjust control flow in drm_sched_rq_select_entity_fifo() to Luben's proposal
>>>>     - re-phrase a few comments and fix a typo (Luben)
>>>>     - change naming of all structures credit fields and function parameters to the
>>>>       following scheme
>>>>       - drm_sched_job::credits
>>>>       - drm_gpu_scheduler::credit_limit
>>>>       - drm_gpu_scheduler::credit_count
>>>>       - drm_sched_init(..., u32 credit_limit, ...)
>>>>       - drm_sched_job_init(..., u32 credits, ...)
>>>>     - add proper documentation for the scheduler's job-flow control mechanism
>>>>
>>>> This patch is based on V7 of the "DRM scheduler changes for Xe" series. [1]
>>>> provides a branch based on drm-misc-next, with the named series and this patch
>>>> on top of it.
>>>>
>>>> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/sched-credits/
>>>> ---
>>>>    Documentation/gpu/drm-mm.rst                  |   6 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>>>>    drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>>>>    drivers/gpu/drm/lima/lima_sched.c             |   2 +-
>>>>    drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
>>>>    drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
>>>>    drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>>>>    .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
>>>>    drivers/gpu/drm/scheduler/sched_entity.c      |   4 +-
>>>>    drivers/gpu/drm/scheduler/sched_main.c        | 142 ++++++++++++++----
>>>>    drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
>>>>    include/drm/gpu_scheduler.h                   |  33 +++-
>>>>    12 files changed, 152 insertions(+), 49 deletions(-)
>>>>
>>>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>>>> index 602010cb6894..acc5901ac840 100644
>>>> --- a/Documentation/gpu/drm-mm.rst
>>>> +++ b/Documentation/gpu/drm-mm.rst
>>>> @@ -552,6 +552,12 @@ Overview
>>>>    .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>>>       :doc: Overview
>>>>    
>>>> +Flow Control
>>>> +------------
>>>> +
>>>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>>> +   :doc: Flow Control
>>>> +
>>>>    Scheduler Function References
>>>>    -----------------------------
>>>>    
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> index 1f357198533f..62bb7fc7448a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> @@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>>    	if (!entity)
>>>>    		return 0;
>>>>    
>>>> -	return drm_sched_job_init(&(*job)->base, entity, owner);
>>>> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>>>>    }
>>>>    
>>>>    int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>>> index 2416c526f9b0..3d0f8d182506 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>>> @@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>>    
>>>>    	ret = drm_sched_job_init(&submit->sched_job,
>>>>    				 &ctx->sched_entity[args->pipe],
>>>> -				 submit->ctx);
>>>> +				 1, submit->ctx);
>>>>    	if (ret)
>>>>    		goto err_submit_put;
>>>>    
>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>> index 23a6276f1332..cdcb37ff62c3 100644
>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>> @@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>>    	for (i = 0; i < num_bos; i++)
>>>>    		drm_gem_object_get(&bos[i]->base.base);
>>>>    
>>>> -	err = drm_sched_job_init(&task->base, &context->base, vm);
>>>> +	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
>>>>    	if (err) {
>>>>    		kfree(task->bos);
>>>>    		return err;
>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>> index 99744de6c05a..c002cabe7b9c 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>> @@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>>    		return ERR_PTR(ret);
>>>>    	}
>>>>    
>>>> -	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
>>>> +	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
>>>>    	if (ret) {
>>>>    		kfree(submit->hw_fence);
>>>>    		kfree(submit);
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>> index 7e64b5ef90fb..1b2cc3f2e1c7 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>> @@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
>>>>    
>>>>    	}
>>>>    
>>>> -	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
>>>> +	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
>>>>    	if (ret)
>>>>    		goto err_free_chains;
>>>>    
>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>> index b834777b409b..54d1c19bea84 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>> @@ -274,7 +274,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>>>    
>>>>    	ret = drm_sched_job_init(&job->base,
>>>>    				 &file_priv->sched_entity[slot],
>>>> -				 NULL);
>>>> +				 1, NULL);
>>>>    	if (ret)
>>>>    		goto out_put_job;
>>>>    
>>>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>>> index 3143ecaaff86..f8ed093b7356 100644
>>>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>>> @@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>>>    			   __assign_str(name, sched_job->sched->name);
>>>>    			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>>>>    			   __entry->hw_job_count = atomic_read(
>>>> -				   &sched_job->sched->hw_rq_count);
>>>> +				   &sched_job->sched->credit_count);
>>>>    			   ),
>>>>    	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>>>>    		      __entry->entity, __entry->id,
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 409e4256f6e7..b79e0672b94f 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>>>    		container_of(cb, struct drm_sched_entity, cb);
>>>>    
>>>>    	drm_sched_entity_clear_dep(f, cb);
>>>> -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>>> +	drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>    		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>    			drm_sched_rq_update_fifo(entity, submit_ts);
>>>>    
>>>> -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>>> +		drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>>>>    	}
>>>>    }
>>>>    EXPORT_SYMBOL(drm_sched_entity_push_job);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 246213963928..3cc3dc0091fc 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -48,6 +48,30 @@
>>>>     * through the jobs entity pointer.
>>>>     */
>>>>    
>>>> +/**
>>>> + * DOC: Flow Control
>>>> + *
>>>> + * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
>>>> + * in which the jobs fetched from scheduler entities are executed.
>>>> + *
>>>> + * In this context the &drm_gpu_scheduler keeps track of a driver specified
>>>> + * credit limit representing the capacity of this scheduler and a credit count;
>>>> + * every &drm_sched_job carries a driver specified number of credits.
>>>> + *
>>>> + * Once a job is executed (but not yet finished), the job's credits contribute
>>>> + * to the scheduler's credit count until the job is finished. If by executing
>>>> + * one more job the scheduler's credit count would exceed the scheduler's
>>>> + * credit limit, the job won't be executed. Instead, the scheduler will wait
>>>> + * until the credit count has decreased enough to not overflow its credit limit.
>>>> + * This implies waiting for previously executed jobs.
>>>> + *
>>>> + * Optionally, drivers can register a callback (update_job_credits) provided by
>>>
>>> "can" --> "may".
>>>
>>>> + * struct drm_sched_backend_ops to update the job's credits dynamically. The
>>>> + * scheduler will execute this callback every time the scheduler considers a job
>>>
>>> No future tense, "will execute" --> "executes", because when this patch lands,
>>> it all becomes present reality. See below for a reworded paragraph.
>>>
>>>> + * for execution and subsequently checks whether the job fits the scheduler's
>>>> + * credit limit.
>>>
>>> This here is a good explanation of what update_job_credits() does, but the one
>>> where this callback is defined in the scheduler ops is not very clear (see further down
>>> into the patch).
>>>
>>> I think we shouldn't use the word "update" as we don't really have any "update" code,
>>> a la,
>>> 	if old value != new value, then
>>> 		old value = new value # update it
>>> in the code using this new sched op.
>>>
>>> Perhaps it should be a "get_job_credits()" as this is how this function is used
>>> in drm_sched_can_queue().
>>>
>>> Perhaps this adds some clarity:
>>>
>>> * Optionally, drivers may register a sched ops callback, get_job_credits(), which
>>> * returns the number of credits the job passed as an argument would take when
>>> * submitted to driver/hardware. The scheduler executes this callback every time it
>>> * considers a job for execution in order to check if the job's credits fit
>>> * into the scheduler's credit limit.
>>>
>>> (FWIW, it may be doing some "update" into the driver/firmware/hardware, but DRM
>>> has no visibility or care for that, since DRM is using it simply as "tell me
>>> the number or credits this job would take.")
>>>
>>>> + */
>>>> +
>>>>    #include <linux/wait.h>
>>>>    #include <linux/sched.h>
>>>>    #include <linux/completion.h>
>>>> @@ -75,6 +99,46 @@ int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>>>    MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>>>    module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>>    
>>>> +static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>>>> +{
>>>> +	u32 credits;
>>>> +
>>>> +	WARN_ON(check_sub_overflow(sched->credit_limit,
>>>> +				   atomic_read(&sched->credit_count),
>>>> +				   &credits));
>>>> +
>>>> +	return credits;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_sched_can_queue -- Can we queue more to the hardware?
>>>> + * @sched: scheduler instance
>>>> + * @entity: the scheduler entity
>>>> + *
>>>> + * Return true if we can push at least one more job from @entity, false
>>>> + * otherwise.
>>>> + */
>>>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>>> +				struct drm_sched_entity *entity)
>>>> +{
>>>> +	struct drm_sched_job *s_job;
>>>> +
>>>> +	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>>> +	if (!s_job)
>>>> +		return false;
>>>
>>> We don't have this gating logic at the moment, and I don't think
>>> we need it.
>>>
>>> At the current state of the code, we don't care if there's jobs
>>> in the incoming queue or not.
>>>
>>> The only thing we should check here for is the credit availability
>>> for _this job_, as you do in the code below.
>>>
>>>> +
>>>> +	if (sched->ops->update_job_credits) {
>>>> +		u32 credits = sched->ops->update_job_credits(s_job);
>>>> +
>>>> +		if (credits)
>>>> +			s_job->credits = credits;
>>>> +	}
>>>> +
>>>> +	WARN_ON(s_job->credits > sched->credit_limit);
>>>> +
>>>> +	return drm_sched_available_credits(sched) >= s_job->credits;
>>>> +}
>>>> +
>>>>    static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>>>    							    const struct rb_node *b)
>>>>    {
>>>> @@ -186,12 +250,14 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    /**
>>>>     * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>     *
>>>> + * @sched: the gpu scheduler
>>>>     * @rq: scheduler run queue to check.
>>>>     *
>>>>     * Try to find a ready entity, returns NULL if none found.
>>>>     */
>>>>    static struct drm_sched_entity *
>>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>>>> +			      struct drm_sched_rq *rq)
>>>>    {
>>>>    	struct drm_sched_entity *entity;
>>>>    
>>>> @@ -201,6 +267,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>    	if (entity) {
>>>>    		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>>    			if (drm_sched_entity_is_ready(entity)) {
>>>> +				/* If we can't queue yet, preserve the current
>>>> +				 * entity in terms of fairness.
>>>> +				 */
>>>> +				if (!drm_sched_can_queue(sched, entity))
>>>> +					goto out;
>>>> +
>>>>    				rq->current_entity = entity;
>>>>    				reinit_completion(&entity->entity_idle);
>>>>    				spin_unlock(&rq->lock);
>>>> @@ -210,8 +282,13 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>    	}
>>>>    
>>>>    	list_for_each_entry(entity, &rq->entities, list) {
>>>> -
>>>>    		if (drm_sched_entity_is_ready(entity)) {
>>>> +			/* If we can't queue yet, preserve the current entity in
>>>> +			 * terms of fairness.
>>>> +			 */
>>>> +			if (!drm_sched_can_queue(sched, entity))
>>>> +				goto out;
>>>> +
>>>>    			rq->current_entity = entity;
>>>>    			reinit_completion(&entity->entity_idle);
>>>>    			spin_unlock(&rq->lock);
>>>> @@ -222,20 +299,22 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>    			break;
>>>>    	}
>>>>    
>>>> +out:
>>>>    	spin_unlock(&rq->lock);
>>>> -
>>>>    	return NULL;
>>>>    }
>>>>    
>>>>    /**
>>>>     * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>>     *
>>>> + * @sched: the gpu scheduler
>>>>     * @rq: scheduler run queue to check.
>>>>     *
>>>>     * Find oldest waiting ready entity, returns NULL if none found.
>>>>     */
>>>>    static struct drm_sched_entity *
>>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>>>> +				struct drm_sched_rq *rq)
>>>>    {
>>>>    	struct rb_node *rb;
>>>>    
>>>> @@ -245,6 +324,15 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>    
>>>>    		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>>    		if (drm_sched_entity_is_ready(entity)) {
>>>> +			/* If we can't queue yet, don't pick another entity
>>>> +			 * which's job might fit and wait until we got space for
>>>
>>> 			 * whose job might not fit and wait until we get space for
>>> Three fixes:                 ^              ^                         ^
>>>
>>>> +			 * this one in terms of fairness.
>>>
>>>                            * this one in terms of credit availability.
>>>
>>> It's not the "fairness", it's the number of credits we check for in drm_sched_can_queue() below.
>>>
>>>> +			 */
>>>> +			if (!drm_sched_can_queue(sched, entity)) {
>>>> +				rb = NULL;
>>>> +				break;
>>>> +			}
>>>> +
>>>
>>> That's good.
>>>
>>>>    			rq->current_entity = entity;
>>>>    			reinit_completion(&entity->entity_idle);
>>>>    			break;
>>>> @@ -266,18 +354,6 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>>    		queue_work(sched->submit_wq, &sched->work_run_job);
>>>>    }
>>>>    
>>>> -/**
>>>> - * drm_sched_can_queue -- Can we queue more to the hardware?
>>>> - * @sched: scheduler instance
>>>> - *
>>>> - * Return true if we can push more jobs to the hw, otherwise false.
>>>> - */
>>>> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>> -{
>>>> -	return atomic_read(&sched->hw_rq_count) <
>>>> -		sched->hw_submission_limit;
>>>> -}
>>>> -
>>>>    /**
>>>>     * drm_sched_select_entity - Select next entity to process
>>>>     *
>>>> @@ -291,14 +367,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>    	struct drm_sched_entity *entity;
>>>>    	int i;
>>>>    
>>>> -	if (!drm_sched_can_queue(sched))
>>>> -		return NULL;
>>>> -
>>>>    	/* Kernel run queue has higher priority than normal run queue*/
>>>>    	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>    		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>>>> -			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
>>>> -			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
>>>> +			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
>>>> +			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
>>>>    		if (entity)
>>>>    			break;
>>>>    	}
>>>> @@ -353,7 +426,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>>    	struct drm_sched_fence *s_fence = s_job->s_fence;
>>>>    	struct drm_gpu_scheduler *sched = s_fence->sched;
>>>>    
>>>> -	atomic_dec(&sched->hw_rq_count);
>>>> +	atomic_sub(s_job->credits, &sched->credit_count);
>>>>    	atomic_dec(sched->score);
>>>>    
>>>>    	trace_drm_sched_process_job(s_fence);
>>>> @@ -576,7 +649,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>    					      &s_job->cb)) {
>>>>    			dma_fence_put(s_job->s_fence->parent);
>>>>    			s_job->s_fence->parent = NULL;
>>>> -			atomic_dec(&sched->hw_rq_count);
>>>> +			atomic_sub(s_job->credits, &sched->credit_count);
>>>>    		} else {
>>>>    			/*
>>>>    			 * remove job from pending_list.
>>>> @@ -637,7 +710,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>>>    	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>>    		struct dma_fence *fence = s_job->s_fence->parent;
>>>>    
>>>> -		atomic_inc(&sched->hw_rq_count);
>>>> +		atomic_add(s_job->credits, &sched->credit_count);
>>>>    
>>>>    		if (!full_recovery)
>>>>    			continue;
>>>> @@ -718,6 +791,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>>     * drm_sched_job_init - init a scheduler job
>>>>     * @job: scheduler job to init
>>>>     * @entity: scheduler entity to use
>>>> + * @credits: the number of credits this job contributes to the schedulers
>>>> + * credit limit
>>>>     * @owner: job owner for debugging
>>>>     *
>>>>     * Refer to drm_sched_entity_push_job() documentation
>>>> @@ -735,7 +810,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>>     */
>>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>>>    		       struct drm_sched_entity *entity,
>>>> -		       void *owner)
>>>> +		       u32 credits, void *owner)
>>>>    {
>>>>    	if (!entity->rq) {
>>>>    		/* This will most likely be followed by missing frames
>>>> @@ -752,6 +827,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>    		return -ENOMEM;
>>>>    
>>>>    	INIT_LIST_HEAD(&job->list);
>>>> +	job->credits = credits ? credits : 1;
>>>>    
>>>>    	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
>>>>    
>>>> @@ -961,12 +1037,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>>    /**
>>>>     * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>>>>     * @sched: scheduler instance
>>>> + * @entity: the scheduler entity
>>>>     *
>>>>     * Wake up the scheduler if we can queue jobs.
>>>>     */
>>>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
>>>> +				   struct drm_sched_entity *entity)
>>>>    {
>>>> -	if (drm_sched_can_queue(sched))
>>>> +	if (drm_sched_can_queue(sched, entity))
>>>>    		drm_sched_run_job_queue(sched);
>>>>    }
>>>>    
>>>> @@ -1104,7 +1182,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>>    
>>>>    	s_fence = sched_job->s_fence;
>>>>    
>>>> -	atomic_inc(&sched->hw_rq_count);
>>>> +	atomic_add(sched_job->credits, &sched->credit_count);
>>>>    	drm_sched_job_begin(sched_job);
>>>>    
>>>>    	trace_drm_run_job(sched_job, entity);
>>>> @@ -1139,7 +1217,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>>     * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
>>>>     *	       allocated and used
>>>>     * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
>>>> - * @hw_submission: number of hw submissions that can be in flight
>>>> + * @credit_limit: the number of credits this scheduler can hold from all jobs
>>>>     * @hang_limit: number of times to allow a job to hang before dropping it
>>>>     * @timeout: timeout value in jiffies for the scheduler
>>>>     * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
>>>> @@ -1153,14 +1231,14 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>>    int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>    		   const struct drm_sched_backend_ops *ops,
>>>>    		   struct workqueue_struct *submit_wq,
>>>> -		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,
>>>> +		   u32 num_rqs, u32 credit_limit, unsigned hang_limit,
>>>>    		   long timeout, struct workqueue_struct *timeout_wq,
>>>>    		   atomic_t *score, const char *name, struct device *dev)
>>>>    {
>>>>    	int i, ret;
>>>>    
>>>>    	sched->ops = ops;
>>>> -	sched->hw_submission_limit = hw_submission;
>>>> +	sched->credit_limit = credit_limit;
>>>>    	sched->name = name;
>>>>    	if (submit_wq) {
>>>>    		sched->submit_wq = submit_wq;
>>>> @@ -1211,7 +1289,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>    	init_waitqueue_head(&sched->job_scheduled);
>>>>    	INIT_LIST_HEAD(&sched->pending_list);
>>>>    	spin_lock_init(&sched->job_list_lock);
>>>> -	atomic_set(&sched->hw_rq_count, 0);
>>>> +	atomic_set(&sched->credit_count, 0);
>>>>    	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>>    	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>>>    	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>> index 2e94ce788c71..8479e5302f7b 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>> @@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>>>>    	job->free = free;
>>>>    
>>>>    	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
>>>> -				 v3d_priv);
>>>> +				 1, v3d_priv);
>>>>    	if (ret)
>>>>    		goto fail;
>>>>    
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index e5a6166eb152..a911b3f5917e 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -321,6 +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>>>>     * @sched: the scheduler instance on which this job is scheduled.
>>>>     * @s_fence: contains the fences for the scheduling of job.
>>>>     * @finish_cb: the callback for the finished fence.
>>>> + * @credits: the number of credits this job contributes to the scheduler
>>>>     * @work: Helper to reschdeule job kill to different context.
>>>>     * @id: a unique id assigned to each job scheduled on the scheduler.
>>>>     * @karma: increment on every hang caused by this job. If this exceeds the hang
>>>> @@ -340,6 +341,8 @@ struct drm_sched_job {
>>>>    	struct drm_gpu_scheduler	*sched;
>>>>    	struct drm_sched_fence		*s_fence;
>>>>    
>>>> +	u32				credits;
>>>> +
>>>>    	/*
>>>>    	 * work is used only after finish_cb has been used and will not be
>>>>    	 * accessed anymore.
>>>> @@ -463,13 +466,29 @@ struct drm_sched_backend_ops {
>>>>             * and it's time to clean it up.
>>>>    	 */
>>>>    	void (*free_job)(struct drm_sched_job *sched_job);
>>>> +
>>>> +	/**
>>>> +	 * @update_job_credits: Called once the scheduler is considering this
>>>> +	 * job for execution.
>>>> +	 *
>>>
>>> This whole paragraph isn't very clear of what update_job_credits does.
>>> Perhaps a simple and straightforward name would be more clear:
>>> 	get_job_credits: Returns the number of credits this job would
>>> 		take.
>>
>> I still very much prefer 'update' over 'get' for the following reasons.
>>
>> 1. 'Update' describes very well what the driver should do when receiving this
>>      callback. It should update the number of credits the job requires at the time
>>      it receives the callback.
>>
>> 2. 'get', as well as 'put', is typically used in a different context in the kernel
>>      and hence this might create confusion.
> 
> That's fine--agreed.
> 
> Perhaps add a comment to say, "Update from the value set by drm_sched_job_init()",
> to make the "update" instantly visualized by the reader of the code.

Sounds good.

> 
>>
>>>
>>>> +	 * Drivers may use this to update the job's submission credits, which is
>>>> +	 * useful to e.g. deduct the number of native fences which have been
>>>> +	 * signaled meanwhile.
>>>> +	 *
>>>> +	 * The callback must either return the new number of submission credits
>>>> +	 * for the given job, or zero if no update is required.
>>>
>>> The word "update" is confusing here and it implies that DRM should keep track
>>> of the previous value this function had returned.
>>>
>>> Perhaps we can just say:
>>> 	* This callback returns the number of credits this job would take if pushed
>>> 	* to the driver/hardware. It returns 0, if this job would take no credits.
>>
>> For this version of the patch this would be wrong, 0 really means that we keep
>> job->credits as it is. However, I'd probably change this in V4 as requested by Boris,
>> such that we accept 0 credits, but WARN() on it. Unless, we consider it to be valid
>> use-case to have jobs that are not flow-controlled at all.
> 
> I agree with your reasoning. Yeah, not sure what the _meaning_ of update_job_credits()
> returning 0 is (from a previous non-zero value).
> 
> Perhaps, just leave it up to the driver--they should know what they're doing and
> just warn, but take the 0, and run with it. If drivers become clever with the 0,
> we can remove the WARN down the road.

Yeah, sounds reasonable. Let's do that.

- Danilo

> 
> So, yeah, looks good! Thanks.
> 
>>
>> All other comments look good, gonna address them in a V4.
> 
> Great!
> 

