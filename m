Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961C7A31B5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 19:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E7010E183;
	Sat, 16 Sep 2023 17:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1477E10E182
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694886781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qRg3jmf9F8fzqozp4rjaonBrxKv62UcihHxNQvsDe0=;
 b=Tf6w9GbeYdBlNGCGiX7jVPlgIxGPPELyf/YYDRiLB9rdVAFlqUVqNxhuPRZLcW+2noZ7qk
 nEIbyRc40Zv0toF36T61UdHsC5LDjqb6mO7p8+Vu6W7a2BUMU0shtJVMocJeFLvBPjeno/
 1L/p3S1blfQ81AMrK/JK1HQHvk1hkuo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Pd-acJ3_MiGpRn4SR706Mg-1; Sat, 16 Sep 2023 13:52:59 -0400
X-MC-Unique: Pd-acJ3_MiGpRn4SR706Mg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-529fa33ac99so2301648a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 10:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694886778; x=1695491578;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7qRg3jmf9F8fzqozp4rjaonBrxKv62UcihHxNQvsDe0=;
 b=RTxA9Dytm6oKjBehnbvQJg6Jasstoxc5JtOGO9H5ZNWcAQmWvTYbJQnJyeePJzDfOE
 Al1rQlETanrChRMvvHhtXcXOVg4gZUgnHCdrtgXlIc3nELXkmaz+Z+MCmD3bhNQU81Ez
 x6d8q4jF22lMhcw4hIVdt9q+VqRzouBq1JwSj4PCrn8Yh2e4lTLobK6tICPllujIGOab
 VurRozy18Tu33TJdn57mXOTAk7AhweBcoWh5W1oltaB6QgYxi5SbNttBH1C6SFYJG1Vv
 kYyKgTZ2mKBL8DFh4yfMwhVL9DYf3yD4ipwWVEtoDimpM9/IYR2tpqVuG+Tal65/LM/u
 zmog==
X-Gm-Message-State: AOJu0YyeOVepK/adcVYdKfipIYMmu/GvWYhvuKd9TwIMcs8vG99576j8
 pHQMu329Nic8/qBBOq8hjNiScg4amso8ZAwdox0UcwM9cw3Zu1Ty0U6xj5L/tzxm2gsxGlSB1Nk
 ApfHj6n8Mp3AEi9ETZ8MsctW1Uhya
X-Received: by 2002:a05:6402:2744:b0:530:e9bf:1ea3 with SMTP id
 z4-20020a056402274400b00530e9bf1ea3mr306779edd.7.1694886778296; 
 Sat, 16 Sep 2023 10:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8qjoXJcPpC6W2Rs95+hNvycTdExcIKxgous2hgILl3CMPtmeoFDh4yKJSnufn3ODbanbaGg==
X-Received: by 2002:a05:6402:2744:b0:530:e9bf:1ea3 with SMTP id
 z4-20020a056402274400b00530e9bf1ea3mr306755edd.7.1694886777916; 
 Sat, 16 Sep 2023 10:52:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 d25-20020aa7d5d9000000b005288f0e547esm3711343eds.55.2023.09.16.10.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 10:52:57 -0700 (PDT)
Message-ID: <be7fe6bd-0744-b33e-71b0-2c66eaa39382@redhat.com>
Date: Sat, 16 Sep 2023 19:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete
 in scheduler kill
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
 <2b5c148c-51e6-c9f4-b950-fe16db5bad17@amd.com>
 <ZQB57X3TI2m2cECE@DUT025-TGLU.fm.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZQB57X3TI2m2cECE@DUT025-TGLU.fm.intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/12/23 16:47, Matthew Brost wrote:
> On Tue, Sep 12, 2023 at 11:57:30AM +0200, Christian König wrote:
>> Am 12.09.23 um 04:16 schrieb Matthew Brost:
>>> Wait for pending jobs to be complete before signaling queued jobs. This
>>> ensures dma-fence signaling order correct and also ensures the entity is
>>> not running on the hardware after drm_sched_entity_flush or
>>> drm_sched_entity_fini returns.
>>
>> Entities are *not* supposed to outlive the submissions they carry and we
>> absolutely *can't* wait for submissions to finish while killing the entity.
>>
>> In other words it is perfectly expected that entities doesn't exists any
>> more while the submissions they carried are still running on the hardware.
>>
>> I somehow better need to document how this working and especially why it is
>> working like that.
>>
>> This approach came up like four or five times now and we already applied and
>> reverted patches doing this.
>>
>> For now let's take a look at the source code of drm_sched_entity_kill():
>>
>>         /* The entity is guaranteed to not be used by the scheduler */
>>          prev = rcu_dereference_check(entity->last_scheduled, true);
>>          dma_fence_get(prev);
>>
>>          while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue))))
>> {
>>                  struct drm_sched_fence *s_fence = job->s_fence;
>>
>>                  dma_fence_get(&s_fence->finished);
>>                  if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
>> drm_sched_entity_kill_jobs_cb))
>>                          drm_sched_entity_kill_jobs_cb(NULL,
>> &job->finish_cb);
>>
>>                  prev = &s_fence->finished;
>>          }
>>          dma_fence_put(prev);
>>
>> This ensures the dma-fence signaling order by delegating signaling of the
>> scheduler fences into callbacks.
>>
> 
> Thanks for the explaination, this code makes more sense now. Agree this
> patch is not correct.
> 
> This patch really is an RFC for something Nouveau needs, I can delete
> this patch in the next rev and let Nouveau run with a slightly different
> version if needed.

Maybe there was a misunderstanding, I do not see any need for this in Nouveau.

Instead, what I think we need is a way to wait for the pending_list being empty
(meaning all jobs on the pending_list are freed) before we call drm_sched_fini().

Currently, if we call drm_sched_fini() there might still be pending jobs on the
pending_list (unless the driver implements something driver specific).
drm_sched_fini() stops the scheduler work though, hence pending jobs will never be
freed up leaking their memory.

This might also be true for existing drivers, but since they call drm_sched_fini()
from their driver remove callback, this race is extremely unlikely. However, it
definitely is an issue for drivers using the single entitiy policy calling
drm_sched_fini() from a context where it is much more likely pending jobs still
exist.

> 
> Matt
> 
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>>>    drivers/gpu/drm/scheduler/sched_entity.c    |  7 ++-
>>>    drivers/gpu/drm/scheduler/sched_main.c      | 50 ++++++++++++++++++---
>>>    include/drm/gpu_scheduler.h                 | 18 ++++++++
>>>    4 files changed, 70 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> index fb5dad687168..7835c0da65c5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> @@ -1873,7 +1873,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
>>>    	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>    		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
>>>    			/* remove job from ring_mirror_list */
>>> -			list_del_init(&s_job->list);
>>> +			drm_sched_remove_pending_job(s_job);
>>>    			sched->ops->free_job(s_job);
>>>    			continue;
>>>    		}
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 1dec97caaba3..37557fbb96d0 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -104,9 +104,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>    	}
>>>    	init_completion(&entity->entity_idle);
>>> +	init_completion(&entity->jobs_done);
>>> -	/* We start in an idle state. */
>>> +	/* We start in an idle and jobs done state. */
>>>    	complete_all(&entity->entity_idle);
>>> +	complete_all(&entity->jobs_done);
>>>    	spin_lock_init(&entity->rq_lock);
>>>    	spsc_queue_init(&entity->job_queue);
>>> @@ -256,6 +258,9 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>    	/* Make sure this entity is not used by the scheduler at the moment */
>>>    	wait_for_completion(&entity->entity_idle);
>>> +	/* Make sure all pending jobs are done */
>>> +	wait_for_completion(&entity->jobs_done);
>>> +
>>>    	/* The entity is guaranteed to not be used by the scheduler */
>>>    	prev = rcu_dereference_check(entity->last_scheduled, true);
>>>    	dma_fence_get(prev);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 689fb6686e01..ed6f5680793a 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -510,12 +510,52 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_resume_timeout);
>>> +/**
>>> + * drm_sched_add_pending_job - Add pending job to scheduler
>>> + *
>>> + * @job: scheduler job to add
>>> + * @tail: add to tail of pending list
>>> + */
>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
>>> +{
>>> +	struct drm_gpu_scheduler *sched = job->sched;
>>> +	struct drm_sched_entity *entity = job->entity;
>>> +
>>> +	lockdep_assert_held(&sched->job_list_lock);
>>> +
>>> +	if (tail)
>>> +		list_add_tail(&job->list, &sched->pending_list);
>>> +	else
>>> +		list_add(&job->list, &sched->pending_list);
>>> +	if (!entity->pending_job_count++)
>>> +		reinit_completion(&entity->jobs_done);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_add_pending_job);
>>> +
>>> +/**
>>> + * drm_sched_remove_pending_job - Remove pending job from` scheduler
>>> + *
>>> + * @job: scheduler job to remove
>>> + */
>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job)
>>> +{
>>> +	struct drm_gpu_scheduler *sched = job->sched;
>>> +	struct drm_sched_entity *entity = job->entity;
>>> +
>>> +	lockdep_assert_held(&sched->job_list_lock);
>>> +
>>> +	list_del_init(&job->list);
>>> +	if (!--entity->pending_job_count)
>>> +		complete_all(&entity->jobs_done);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_remove_pending_job);
>>> +
>>>    static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>>    {
>>>    	struct drm_gpu_scheduler *sched = s_job->sched;
>>>    	spin_lock(&sched->job_list_lock);
>>> -	list_add_tail(&s_job->list, &sched->pending_list);
>>> +	drm_sched_add_pending_job(s_job, true);
>>>    	spin_unlock(&sched->job_list_lock);
>>>    }
>>> @@ -538,7 +578,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>    		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>    		 * is parked at which point it's safe.
>>>    		 */
>>> -		list_del_init(&job->list);
>>> +		drm_sched_remove_pending_job(job);
>>>    		spin_unlock(&sched->job_list_lock);
>>>    		status = job->sched->ops->timedout_job(job);
>>> @@ -589,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>    		 * Add at the head of the queue to reflect it was the earliest
>>>    		 * job extracted.
>>>    		 */
>>> -		list_add(&bad->list, &sched->pending_list);
>>> +		drm_sched_add_pending_job(bad, false);
>>>    	/*
>>>    	 * Iterate the job list from later to  earlier one and either deactive
>>> @@ -611,7 +651,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>    			 * Locking here is for concurrent resume timeout
>>>    			 */
>>>    			spin_lock(&sched->job_list_lock);
>>> -			list_del_init(&s_job->list);
>>> +			drm_sched_remove_pending_job(s_job);
>>>    			spin_unlock(&sched->job_list_lock);
>>>    			/*
>>> @@ -1066,7 +1106,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>>    	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>    		/* remove job from pending_list */
>>> -		list_del_init(&job->list);
>>> +		drm_sched_remove_pending_job(job);
>>>    		/* cancel this job's TO timer */
>>>    		cancel_delayed_work(&sched->work_tdr);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index b7b818cd81b6..7c628f36fe78 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -233,6 +233,21 @@ struct drm_sched_entity {
>>>    	 */
>>>    	struct completion		entity_idle;
>>> +	/**
>>> +	 * @pending_job_count:
>>> +	 *
>>> +	 * Number of pending jobs.
>>> +	 */
>>> +	unsigned int                    pending_job_count;
>>> +
>>> +	/**
>>> +	 * @jobs_done:
>>> +	 *
>>> +	 * Signals when entity has no pending jobs, used to sequence entity
>>> +	 * cleanup in drm_sched_entity_fini().
>>> +	 */
>>> +	struct completion		jobs_done;
>>> +
>>>    	/**
>>>    	 * @oldest_job_waiting:
>>>    	 *
>>> @@ -656,4 +671,7 @@ struct drm_gpu_scheduler *
>>>    drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>    		     unsigned int num_sched_list);
>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail);
>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job);
>>> +
>>>    #endif
>>

