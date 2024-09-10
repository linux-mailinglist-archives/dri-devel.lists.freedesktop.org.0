Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A6972EB5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E751E10E751;
	Tue, 10 Sep 2024 09:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a6VGZlD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EF610E751;
 Tue, 10 Sep 2024 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v7uzOHT47sivZgtJG9+bnYdEB9TmEaKlWTer4PlbkRE=; b=a6VGZlD7beuPnv9bJi6pNF+L/C
 f121Zd9jaU4rSzDBUeZxcWF/mqP6ELMfwU2Iw9QYmapMEfGSRioWxwxWSVQSukFD4/zRyAc2XbZex
 01Nci+HdNUujndBTWAyH7ZPNAp72i7mWYhCvewH5iCCCpq8GqADVsTiSyafIdLqiqJIsnUNHWtjyR
 sY7vrPzY0IfxUkdi/4ymQmnr08dqn196EID7MWcld6T4nkLAfUl2FI1e6WW3dwJBLks1VJN/GJvWu
 3AjuuOeg+CI+b37HZCdyZP+b5WaJNZpJI1yzPbRXG57aCWzTXZtbdMxA3uH7FrjQYovXibMPXC1TB
 xvF5INgg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1snxRh-00BzZZ-D5; Tue, 10 Sep 2024 11:46:01 +0200
Message-ID: <48b74e60-6e75-4929-aa30-503f4a4cd5e8@igalia.com>
Date: Tue, 10 Sep 2024 10:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-9-tursulin@igalia.com>
 <cd0dcdf4-a001-4fc3-9803-3e8b85cbc89f@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <cd0dcdf4-a001-4fc3-9803-3e8b85cbc89f@gmail.com>
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


On 10/09/2024 10:08, Christian König wrote:
> Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Having removed one re-lock cycle on the entity->lock in a patch titled
>> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
>> larger refactoring we can do the same optimisation on the rq->lock.
>> (Currently both drm_sched_rq_add_entity() and
>> drm_sched_rq_update_fifo_locked() take and release the same lock.)
> 
> I think that goes into the wrong direction.
> 
> Probably better to move this here into drm_sched_rq_add_entity():
> 
>            if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>               drm_sched_rq_update_fifo_locked(entity, submit_ts);
> 
> We can then also drop adding the entity to the rr list when FIFO is in use.

Unfortuntely there is a few other places which appear to rely on the 
list. Like drm_sched_fini, drm_sched_increase_karma and even 
amdgpu_job_stop_all_jobs_on_sched. Latter could perhaps be solved by 
adding an iterator helper to the scheduler, which would perhaps be a 
good move for component isolation. And first two could be handled by 
implementing a complete and mutually exclusive duality of how entities 
are walked depending on scheduling mode. Plus making the scheduling mode 
only be configurable at boot. It feels doable but significant work and 
in the meantime removing the double re-lock maybe acceptable?

Regards,

Tvrtko
>>
>> To achieve this we rename drm_sched_rq_add_entity() to
>> drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
>> held, and also add the same expectation to
>> drm_sched_rq_update_fifo_locked().
>>
>> For more stream-lining we also add the run-queue as an explicit parameter
>> to drm_sched_rq_remove_fifo_locked() to avoid both callers and callee
>> having to dereference entity->rq.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  7 ++--
>>   drivers/gpu/drm/scheduler/sched_main.c   | 41 +++++++++++++-----------
>>   include/drm/gpu_scheduler.h              |  7 ++--
>>   3 files changed, 31 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index b4c4f9923e0b..2102c726d275 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -614,11 +614,14 @@ void drm_sched_entity_push_job(struct 
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
>> index 937e7d1cfc49..1ccd2aed2d32 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -153,41 +153,44 @@ static __always_inline bool 
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
>>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, 
>> ktime_t ts)
>>   {
>> +    struct drm_sched_rq *rq;
>> +
>>       /*
>>        * Both locks need to be grabbed, one to protect from entity->rq 
>> change
>>        * for entity from within concurrent drm_sched_entity_select_rq 
>> and the
>>        * other to update the rb tree structure.
>>        */
>>       spin_lock(&entity->lock);
>> -    drm_sched_rq_update_fifo_locked(entity, ts);
>> +    rq = entity->rq;
>> +    spin_lock(&rq->lock);
>> +    drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +    spin_unlock(&rq->lock);
>>       spin_unlock(&entity->lock);
>>   }
>> @@ -210,25 +213,23 @@ static void drm_sched_rq_init(struct 
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
>> @@ -242,6 +243,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>                   struct drm_sched_entity *entity)
>>   {
>> +    lockdep_assert_held(&entity->lock);
>> +
>>       if (list_empty(&entity->list))
>>           return;
>> @@ -254,7 +257,7 @@ void drm_sched_rq_remove_entity(struct 
>> drm_sched_rq *rq,
>>           rq->current_entity = NULL;
>>       if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -        drm_sched_rq_remove_fifo_locked(entity);
>> +        drm_sched_rq_remove_fifo_locked(entity, rq);
>>       spin_unlock(&rq->lock);
>>   }
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 5a1e4c803b90..2ad33e2fe2d2 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -591,13 +591,14 @@ bool drm_sched_dependency_optimized(struct 
>> dma_fence* fence,
>>                       struct drm_sched_entity *entity);
>>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>> -                 struct drm_sched_entity *entity);
>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>> +                    struct drm_sched_entity *entity);
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>                   struct drm_sched_entity *entity);
>>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, 
>> ktime_t ts);
>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, 
>> ktime_t ts);
>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>> +                     struct drm_sched_rq *rq, ktime_t ts);
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>                 enum drm_sched_priority priority,
> 
