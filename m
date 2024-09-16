Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806497A213
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 14:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4880F10E2C0;
	Mon, 16 Sep 2024 12:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UbjV+dJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41B410E2C0;
 Mon, 16 Sep 2024 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SIf0y1BBUxcdCFaTcnibez1onHwQKzfKJOH/DpTfU0w=; b=UbjV+dJsHEnKzg9e9aO2ny2Chl
 vrDQW7tdAXSKbwEockYZE7cSkRxfVMa4H3Jf/acf3gb4GewQiCXu+cL6CsdTfgp42HuD9VcESyC2O
 T4rE/5lIXG2nwHIvEMsysFuajUTvUn/WL7u4Yx/QVtu2Mr/Ecm2365iFI48vKSRFFfayh74OoN1ud
 muxIt05tYle6mXUGbWz+WvrVtnclYcYr5xDuylrvuD90R1AfLcCOk/bkvlZnmSZ+BswkOrHxqVmWs
 xuzQjwlXMv0JYCjY+oNjmvev3G9t0J2+jgDHzo7NfSBeSzPa98QictRx4Pun9196aJPHvzREgxInx
 toGBcWGw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sqAig-00ERBJ-4I; Mon, 16 Sep 2024 14:20:42 +0200
Message-ID: <0400f34b-c4f1-46ff-969d-350aec110e9d@igalia.com>
Date: Mon, 16 Sep 2024 13:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
 <20240913160559.49054-9-tursulin@igalia.com>
 <5d69f9cb-719f-45b6-ba94-071825230c77@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <5d69f9cb-719f-45b6-ba94-071825230c77@gmail.com>
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


On 16/09/2024 13:11, Christian König wrote:
> Am 13.09.24 um 18:05 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Having removed one re-lock cycle on the entity->lock in a patch titled
>> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
>> larger refactoring we can do the same optimisation on the rq->lock.
>> (Currently both drm_sched_rq_add_entity() and
>> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>>
>> To achieve this we rename drm_sched_rq_add_entity() to
>> drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
>> held, and also add the same expectation to
>> drm_sched_rq_update_fifo_locked().
>>
>> Finally, to align drm_sched_rq_update_fifo_locked(),
>> drm_sched_rq_add_entity_locked() and
>> drm_sched_rq_remove_fifo_locked() function signatures, we add rq as a
>> parameter to the latter.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  8 ++++--
>>   drivers/gpu/drm/scheduler/sched_main.c   | 34 +++++++++++-------------
>>   include/drm/gpu_scheduler.h              |  7 ++---
>>   3 files changed, 26 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index d982cebc6bee..c48f17faef41 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -517,6 +517,7 @@ struct drm_sched_job 
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>           if (next) {
>>               spin_lock(&entity->lock);
>>               drm_sched_rq_update_fifo_locked(entity,
>> +                            entity->rq,
>>                               next->submit_ts);
>>               spin_unlock(&entity->lock);
>>           }
>> @@ -618,11 +619,14 @@ void drm_sched_entity_push_job(struct 
>> drm_sched_job *sched_job)
>>           sched = rq->sched;
>>           atomic_inc(sched->score);
>> -        drm_sched_rq_add_entity(rq, entity);
>> +
>> +        spin_lock(&rq->lock);
>> +        drm_sched_rq_add_entity_locked(rq, entity);
>>           if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -            drm_sched_rq_update_fifo_locked(entity, submit_ts);
>> +            drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>> +        spin_unlock(&rq->lock);
>>           spin_unlock(&entity->lock);
>>           drm_sched_wakeup(sched, entity);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 18a952f73ecb..c0d3f6ac3ae3 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -153,17 +153,18 @@ static __always_inline bool 
>> drm_sched_entity_compare_before(struct rb_node *a,
>>       return ktime_before(ent_a->oldest_job_waiting, 
>> ent_b->oldest_job_waiting);
>>   }
>> -static inline void drm_sched_rq_remove_fifo_locked(struct 
>> drm_sched_entity *entity)
>> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity 
>> *entity,
>> +                        struct drm_sched_rq *rq)
>>   {
>> -    struct drm_sched_rq *rq = entity->rq;
>> -
>>       if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>           rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>           RB_CLEAR_NODE(&entity->rb_tree_node);
>>       }
>>   }
>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, 
>> ktime_t ts)
>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>> +                     struct drm_sched_rq *rq,
>> +                     ktime_t ts)
>>   {
>>       /*
>>        * Both locks need to be grabbed, one to protect from entity->rq 
>> change
>> @@ -171,17 +172,14 @@ void drm_sched_rq_update_fifo_locked(struct 
>> drm_sched_entity *entity, ktime_t ts
>>        * other to update the rb tree structure.
>>        */
>>       lockdep_assert_held(&entity->lock);
>> +    lockdep_assert_held(&rq->lock);
>> -    spin_lock(&entity->rq->lock);
>> -
>> -    drm_sched_rq_remove_fifo_locked(entity);
>> +    drm_sched_rq_remove_fifo_locked(entity, rq);
>>       entity->oldest_job_waiting = ts;
>> -    rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
>> +    rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>                 drm_sched_entity_compare_before);
>> -
>> -    spin_unlock(&entity->rq->lock);
>>   }
>>   /**
>> @@ -203,25 +201,23 @@ static void drm_sched_rq_init(struct 
>> drm_gpu_scheduler *sched,
>>   }
>>   /**
>> - * drm_sched_rq_add_entity - add an entity
>> + * drm_sched_rq_add_entity_locked - add an entity
>>    *
>>    * @rq: scheduler run queue
>>    * @entity: scheduler entity
>>    *
>>    * Adds a scheduler entity to the run queue.
>>    */
>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>> -                 struct drm_sched_entity *entity)
>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>> +                    struct drm_sched_entity *entity)
>>   {
>> +    lockdep_assert_held(&rq->lock);
>> +
>>       if (!list_empty(&entity->list))
>>           return;
>> -    spin_lock(&rq->lock);
>> -
>>       atomic_inc(rq->sched->score);
>>       list_add_tail(&entity->list, &rq->entities);
>> -
>> -    spin_unlock(&rq->lock);
>>   }
>>   /**
>> @@ -235,6 +231,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>                   struct drm_sched_entity *entity)
> 
> The naming of drm_sched_rq_add_entity_locked() and 
> drm_sched_rq_add_entity_locked() don't match up any more.
> 
> I suggest to either remove the _locked postfix or always add it.

Oh well spotted.. I confused it with remove_fifo_locked when I told to 
myself everything is aligned. Will fix.

> Apart from that I'm not completely happy with the change, but it looks 
> like it doesn't add any additional complexity.

Thanks, I agree! ;) Will have more passes once this series is done to 
find more things to polish.

Regards,

Tvrtko

>>   {
>> +    lockdep_assert_held(&entity->lock);
>> +
>>       if (list_empty(&entity->list))
>>           return;
>> @@ -247,7 +245,7 @@ void drm_sched_rq_remove_entity(struct 
>> drm_sched_rq *rq,
>>           rq->current_entity = NULL;
>>       if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -        drm_sched_rq_remove_fifo_locked(entity);
>> +        drm_sched_rq_remove_fifo_locked(entity, rq);
>>       spin_unlock(&rq->lock);
>>   }
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 80198e6cf537..30686961a379 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -591,12 +591,13 @@ bool drm_sched_dependency_optimized(struct 
>> dma_fence* fence,
>>                       struct drm_sched_entity *entity);
>>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>> -                 struct drm_sched_entity *entity);
>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>> +                    struct drm_sched_entity *entity);
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>                   struct drm_sched_entity *entity);
>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, 
>> ktime_t ts);
>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>> +                     struct drm_sched_rq *rq, ktime_t ts);
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>                 enum drm_sched_priority priority,
> 
