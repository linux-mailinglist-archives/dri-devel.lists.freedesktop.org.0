Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE24A0774E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558CD10EDD3;
	Thu,  9 Jan 2025 13:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ydj1HPDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E5410EDD3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u71RXpynK5gpSUai9zI3HnIQHRq06ZCeh8sDJV3FXmk=; b=Ydj1HPDuBsLw8AVaktxfA3808A
 3fx0O6jrRgc6ob87IRzFZMLQe7ehkurlYedHe/BcHlVqWu2t36rfNwjdxr+xWNDsU8s95J1PkUijX
 pvLX1naBWXy+Ls4oCAXYvpiewrK3kZFkmpoAbA43a4j0hdFutUVwIndrCiMPsaaKDAkssBYmfcCRi
 JXOLItvGBNz7GZ8wxYQ9lO7NZ3GSkZj76cx2q70XLAHIjBRrd3gPldkiHWYKT/DQM8jebRyQxn9DT
 5q674KFZLV0yv5NqcdKp8kMIRfz97Ul3obVOaz9l/BFYs1DwmH4vpwB01/rV4kYp+6qzBH18pz2OG
 b77YwNQg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVsZa-00DZNB-Rs; Thu, 09 Jan 2025 14:27:42 +0100
Message-ID: <218feab1-f8a8-43cc-a23c-01e31e59a2b2@igalia.com>
Date: Thu, 9 Jan 2025 13:27:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/18] drm/sched: Implement RR via FIFO
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-11-tvrtko.ursulin@igalia.com>
 <e2dea565-96a0-4d83-81db-0d38ba180292@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e2dea565-96a0-4d83-81db-0d38ba180292@amd.com>
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


On 09/01/2025 12:59, Christian König wrote:
> Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
>> Round-robin being the non-default policy and unclear how much it is used,
>> we can notice that it can be implemented using the FIFO data 
>> structures if
>> we only invent a fake submit timestamp which is monotonically increasing
>> inside drm_sched_rq instances.
>>
>> So instead of remembering which was the last entity the scheduler worker
>> picked, we can bump the picked one to the bottom of the tree, achieving
>> the same round-robin behaviour.
>>
>> Advantage is that we can consolidate to a single code path and remove a
>> bunch of code. Downside is round-robin mode now needs to lock on the job
>> pop path but that should not be visible.
> 
> Oh that's a really nice one. One comment at the end of the patch.

Thanks!

> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++------
>>   drivers/gpu/drm/scheduler/sched_main.c   | 84 ++----------------------
>>   include/drm/gpu_scheduler.h              |  5 +-
>>   3 files changed, 39 insertions(+), 100 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 8e910586979e..2b1bc4d00b57 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -473,9 +473,20 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>>       return NULL;
>>   }
>> +static ktime_t
>> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
>> +{
>> +    lockdep_assert_held(&rq->lock);
>> +
>> +    rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
>> +
>> +    return rq->rr_deadline;
>> +}
>> +
>>   struct drm_sched_job *drm_sched_entity_pop_job(struct 
>> drm_sched_entity *entity)
>>   {
>> -    struct drm_sched_job *sched_job;
>> +    struct drm_sched_job *sched_job, *next_job;
>> +    struct drm_sched_rq *rq;
>>       sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>       if (!sched_job)
>> @@ -510,23 +521,24 @@ struct drm_sched_job 
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>        * Update the entity's location in the min heap according to
>>        * the timestamp of the next job, if any.
>>        */
>> -    if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>> -        struct drm_sched_job *next;
>> -        struct drm_sched_rq *rq;
>> +    spin_lock(&entity->lock);
>> +    rq = entity->rq;
>> +    spin_lock(&rq->lock);
>> +    next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> +    if (next_job) {
>> +        ktime_t ts;
>> -        spin_lock(&entity->lock);
>> -        rq = entity->rq;
>> -        spin_lock(&rq->lock);
>> -        next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> -        if (next) {
>> -            drm_sched_rq_update_fifo_locked(entity, rq,
>> -                            next->submit_ts);
>> -        } else {
>> -            drm_sched_rq_remove_fifo_locked(entity, rq);
>> -        }
>> -        spin_unlock(&rq->lock);
>> -        spin_unlock(&entity->lock);
>> +        if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +            ts = next_job->submit_ts;
>> +        else
>> +            ts = drm_sched_rq_get_rr_deadline(rq);
>> +
>> +        drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +    } else {
>> +        drm_sched_rq_remove_fifo_locked(entity, rq);
>>       }
>> +    spin_unlock(&rq->lock);
>> +    spin_unlock(&entity->lock);
>>       /* Jobs and entities might have different lifecycles. Since we're
>>        * removing the job from the entities queue, set the jobs entity 
>> pointer
>> @@ -624,9 +636,9 @@ void drm_sched_entity_push_job(struct 
>> drm_sched_job *sched_job)
>>           spin_lock(&rq->lock);
>>           drm_sched_rq_add_entity(rq, entity);
>> -
>> -        if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -            drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>> +        if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>> +            submit_ts = drm_sched_rq_get_rr_deadline(rq);
>> +        drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>>           spin_unlock(&rq->lock);
>>           spin_unlock(&entity->lock);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index bcfc2abe349a..31cab7bb5428 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -189,7 +189,6 @@ static void drm_sched_rq_init(struct 
>> drm_gpu_scheduler *sched,
>>       spin_lock_init(&rq->lock);
>>       INIT_LIST_HEAD(&rq->entities);
>>       rq->rb_tree_root = RB_ROOT_CACHED;
>> -    rq->current_entity = NULL;
>>       rq->sched = sched;
>>   }
>> @@ -235,82 +234,13 @@ void drm_sched_rq_remove_entity(struct 
>> drm_sched_rq *rq,
>>       atomic_dec(rq->sched->score);
>>       list_del_init(&entity->list);
>> -    if (rq->current_entity == entity)
>> -        rq->current_entity = NULL;
>> -
>> -    if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -        drm_sched_rq_remove_fifo_locked(entity, rq);
>> +    drm_sched_rq_remove_fifo_locked(entity, rq);
>>       spin_unlock(&rq->lock);
>>   }
>>   /**
>> - * drm_sched_rq_select_entity_rr - Select an entity which could 
>> provide a job to run
>> - *
>> - * @sched: the gpu scheduler
>> - * @rq: scheduler run queue to check.
>> - *
>> - * Try to find the next ready entity.
>> - *
>> - * Return an entity if one is found; return an error-pointer (!NULL) 
>> if an
>> - * entity was ready, but the scheduler had insufficient credits to 
>> accommodate
>> - * its job; return NULL, if no ready entity was found.
>> - */
>> -static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>> -                  struct drm_sched_rq *rq)
>> -{
>> -    struct drm_sched_entity *entity;
>> -
>> -    spin_lock(&rq->lock);
>> -
>> -    entity = rq->current_entity;
>> -    if (entity) {
>> -        list_for_each_entry_continue(entity, &rq->entities, list) {
>> -            if (drm_sched_entity_is_ready(entity)) {
>> -                /* If we can't queue yet, preserve the current
>> -                 * entity in terms of fairness.
>> -                 */
>> -                if (!drm_sched_can_queue(sched, entity)) {
>> -                    spin_unlock(&rq->lock);
>> -                    return ERR_PTR(-ENOSPC);
>> -                }
>> -
>> -                rq->current_entity = entity;
>> -                reinit_completion(&entity->entity_idle);
>> -                spin_unlock(&rq->lock);
>> -                return entity;
>> -            }
>> -        }
>> -    }
>> -
>> -    list_for_each_entry(entity, &rq->entities, list) {
>> -        if (drm_sched_entity_is_ready(entity)) {
>> -            /* If we can't queue yet, preserve the current entity in
>> -             * terms of fairness.
>> -             */
>> -            if (!drm_sched_can_queue(sched, entity)) {
>> -                spin_unlock(&rq->lock);
>> -                return ERR_PTR(-ENOSPC);
>> -            }
>> -
>> -            rq->current_entity = entity;
>> -            reinit_completion(&entity->entity_idle);
>> -            spin_unlock(&rq->lock);
>> -            return entity;
>> -        }
>> -
>> -        if (entity == rq->current_entity)
>> -            break;
>> -    }
>> -
>> -    spin_unlock(&rq->lock);
>> -
>> -    return NULL;
>> -}
>> -
>> -/**
>> - * drm_sched_rq_select_entity_fifo - Select an entity which provides 
>> a job to run
>> + * drm_sched_rq_select_entity - Select an entity which provides a job 
>> to run
>>    *
>>    * @sched: the gpu scheduler
>>    * @rq: scheduler run queue to check.
>> @@ -322,8 +252,8 @@ drm_sched_rq_select_entity_rr(struct 
>> drm_gpu_scheduler *sched,
>>    * its job; return NULL, if no ready entity was found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>> -                struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> +               struct drm_sched_rq *rq)
>>   {
>>       struct drm_sched_entity *entity = NULL;
>>       struct rb_node *rb;
>> @@ -1055,15 +985,13 @@ void drm_sched_wakeup(struct drm_gpu_scheduler 
>> *sched)
>>   static struct drm_sched_entity *
>>   drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   {
>> -    struct drm_sched_entity *entity;
>> +    struct drm_sched_entity *entity = NULL;
>>       int i;
>>       /* Start with the highest priority.
>>        */
>>       for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> -        entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>> -            drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
>> -            drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
>> +        entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
>>           if (entity)
>>               break;
>>       }
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 005db1e35fad..a0164de08f5b 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -245,8 +245,7 @@ struct drm_sched_entity {
>>    * struct drm_sched_rq - queue of entities to be scheduled.
>>    *
>>    * @sched: the scheduler to which this rq belongs to.
>> - * @lock: protects @entities, @rb_tree_root and @current_entity.
>> - * @current_entity: the entity which is to be scheduled.
>> + * @lock: protects @entities, @rb_tree_root and @rr_deadline.
>>    * @entities: list of the entities to be scheduled.
>>    * @rb_tree_root: root of time based priority queue of entities for 
>> FIFO scheduling
>>    *
>> @@ -259,7 +258,7 @@ struct drm_sched_rq {
>>       spinlock_t            lock;
>>       /* Following members are protected by the @lock: */
>> -    struct drm_sched_entity        *current_entity;
>> +    ktime_t                rr_deadline;
>>       struct list_head        entities;
> 
> If I'm not completely mistaken you can now also nuke this entities list 
> if you haven't already removed all users.

I had a version which did that too. But then I dropped it in favour of 
only keeping entities with queued jobs in the tree. (Before both the 
list and the tree contained entities which submitted at least one job in 
the past.)

I kind of like keeping the tree trimmed (would it lower the rb tree 
re-balancing costs?) in which case the full list is needed for that 
karma processing business.

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>>       struct rb_root_cached        rb_tree_root;
>>   };
> 
