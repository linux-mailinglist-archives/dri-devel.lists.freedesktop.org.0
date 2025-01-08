Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C9A05F93
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584F10EBD9;
	Wed,  8 Jan 2025 15:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YgZDamQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B4C10EBD9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2rAsstV4jwm4IqV4u82QmbJyab1XowrG8rT6bP+36/M=; b=YgZDamQ04MXEYceFZXrzFJIkun
 jjgyfF7ClYWj51NaHRAQNk67mXQ0BAzRKR00zSMtAw4kBUB9h+E9JgoM08HXIXtpcgBjo7jhCZVlL
 hRiVxEHZ1ixywVnXWp8z3n89h5781Cw2OmffrxxvOQM8SXT+7N/qDlu3MNIpEHrbiKdEiS1d23kZi
 NzT5tgE3K8RiQVYnR6KZwR4/OtXynlFd04s9qfHehyhciO8c76zjv+4UugBycB3J+V3DUEd2wW6Kz
 arKQm3JBpUZwGvV08ecg1E2/OTds0QfS2fxBbTI1Is/wJge2uezbKwmn7CIUA6I70rkNbe38R5KDL
 MfeQxAqA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVXbb-00DAsq-D5; Wed, 08 Jan 2025 16:04:23 +0100
Message-ID: <7d399da4-da0a-40bc-b9f0-908e4be74dba@igalia.com>
Date: Wed, 8 Jan 2025 15:04:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/14] drm/sched: Implement RR via FIFO
To: Danilo Krummrich <dakr@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-4-tursulin@igalia.com> <Z35IbF2QPZ3NAirM@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z35IbF2QPZ3NAirM@pollux>
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


On 08/01/2025 09:42, Danilo Krummrich wrote:
> On Mon, Dec 30, 2024 at 04:52:48PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Round-robin being the non-default policy and unclear how much it is used,
> 
> I don't know either, but would be nice if we could instead remove it.
> 
>> we can notice that it can be implemented using the FIFO data structures if
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
> I guess you did you test both scheduler strategies with this change?

Insofar it doesn't crash and burn, yes.

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 53 ++++++++-----
>>   drivers/gpu/drm/scheduler/sched_main.c   | 99 +++---------------------
>>   include/drm/gpu_scheduler.h              |  5 +-
>>   3 files changed, 48 insertions(+), 109 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 8e910586979e..cb5f596b48b7 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -473,9 +473,20 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>>   	return NULL;
>>   }
>>   
>> +static ktime_t
>> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
>> +{
>> +	lockdep_assert_held(&rq->lock);
>> +
>> +	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
>> +
>> +	return rq->rr_deadline;
>> +}
>> +
>>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   {
>> -	struct drm_sched_job *sched_job;
>> +	struct drm_sched_job *sched_job, *next_job;
>> +	struct drm_sched_rq *rq;
>>   
>>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>   	if (!sched_job)
>> @@ -510,24 +521,28 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   	 * Update the entity's location in the min heap according to
>>   	 * the timestamp of the next job, if any.
>>   	 */
>> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>> -		struct drm_sched_job *next;
>> -		struct drm_sched_rq *rq;
>> +	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>   
>> -		spin_lock(&entity->lock);
>> -		rq = entity->rq;
>> -		spin_lock(&rq->lock);
>> -		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> -		if (next) {
>> -			drm_sched_rq_update_fifo_locked(entity, rq,
>> -							next->submit_ts);
>> -		} else {
>> -			drm_sched_rq_remove_fifo_locked(entity, rq);
>> -		}
>> -		spin_unlock(&rq->lock);
>> -		spin_unlock(&entity->lock);
>> +	spin_lock(&entity->lock);
>> +	rq = entity->rq;
>> +	spin_lock(&rq->lock);
>> +
>> +	if (next_job) {
>> +		ktime_t ts;
>> +
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +			ts = next_job->submit_ts;
>> +		else
>> +			ts = drm_sched_rq_get_rr_deadline(rq);
>> +
>> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +	} else {
>> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>>   	}
>>   
>> +	spin_unlock(&rq->lock);
>> +	spin_unlock(&entity->lock);
>> +
>>   	/* Jobs and entities might have different lifecycles. Since we're
>>   	 * removing the job from the entities queue, set the jobs entity pointer
>>   	 * to NULL to prevent any future access of the entity through this job.
>> @@ -624,9 +639,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   
>>   		spin_lock(&rq->lock);
>>   		drm_sched_rq_add_entity(rq, entity);
>> -
>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>> +			submit_ts = drm_sched_rq_get_rr_deadline(rq);
>> +		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>>   
>>   		spin_unlock(&rq->lock);
>>   		spin_unlock(&entity->lock);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 9beb4c611988..eb22b1b7de36 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -189,7 +189,6 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>   	spin_lock_init(&rq->lock);
>>   	INIT_LIST_HEAD(&rq->entities);
>>   	rq->rb_tree_root = RB_ROOT_CACHED;
>> -	rq->current_entity = NULL;
>>   	rq->sched = sched;
>>   }
>>   
>> @@ -235,82 +234,13 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   	atomic_dec(rq->sched->score);
>>   	list_del_init(&entity->list);
>>   
>> -	if (rq->current_entity == entity)
>> -		rq->current_entity = NULL;
>> -
>> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -		drm_sched_rq_remove_fifo_locked(entity, rq);
>> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>>   
>>   	spin_unlock(&rq->lock);
>>   }
>>   
>>   /**
>> - * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>> - *
>> - * @sched: the gpu scheduler
>> - * @rq: scheduler run queue to check.
>> - *
>> - * Try to find the next ready entity.
>> - *
>> - * Return an entity if one is found; return an error-pointer (!NULL) if an
>> - * entity was ready, but the scheduler had insufficient credits to accommodate
>> - * its job; return NULL, if no ready entity was found.
>> - */
>> -static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>> -			      struct drm_sched_rq *rq)
>> -{
>> -	struct drm_sched_entity *entity;
>> -
>> -	spin_lock(&rq->lock);
>> -
>> -	entity = rq->current_entity;
>> -	if (entity) {
>> -		list_for_each_entry_continue(entity, &rq->entities, list) {
>> -			if (drm_sched_entity_is_ready(entity)) {
>> -				/* If we can't queue yet, preserve the current
>> -				 * entity in terms of fairness.
>> -				 */
>> -				if (!drm_sched_can_queue(sched, entity)) {
>> -					spin_unlock(&rq->lock);
>> -					return ERR_PTR(-ENOSPC);
>> -				}
>> -
>> -				rq->current_entity = entity;
>> -				reinit_completion(&entity->entity_idle);
>> -				spin_unlock(&rq->lock);
>> -				return entity;
>> -			}
>> -		}
>> -	}
>> -
>> -	list_for_each_entry(entity, &rq->entities, list) {
>> -		if (drm_sched_entity_is_ready(entity)) {
>> -			/* If we can't queue yet, preserve the current entity in
>> -			 * terms of fairness.
>> -			 */
>> -			if (!drm_sched_can_queue(sched, entity)) {
>> -				spin_unlock(&rq->lock);
>> -				return ERR_PTR(-ENOSPC);
>> -			}
>> -
>> -			rq->current_entity = entity;
>> -			reinit_completion(&entity->entity_idle);
>> -			spin_unlock(&rq->lock);
>> -			return entity;
>> -		}
>> -
>> -		if (entity == rq->current_entity)
>> -			break;
>> -	}
>> -
>> -	spin_unlock(&rq->lock);
>> -
>> -	return NULL;
>> -}
>> -
>> -/**
>> - * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>> + * drm_sched_rq_select_entity - Select an entity which provides a job to run
>>    *
>>    * @sched: the gpu scheduler
>>    * @rq: scheduler run queue to check.
>> @@ -322,32 +252,29 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>>    * its job; return NULL, if no ready entity was found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>> -				struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> +			   struct drm_sched_rq *rq)
>>   {
>> +	struct drm_sched_entity *entity = NULL;
>>   	struct rb_node *rb;
>>   
>>   	spin_lock(&rq->lock);
>>   	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>> -		struct drm_sched_entity *entity;
>> -
>>   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>   		if (drm_sched_entity_is_ready(entity)) {
>> -			/* If we can't queue yet, preserve the current entity in
>> -			 * terms of fairness.
>> -			 */
>>   			if (!drm_sched_can_queue(sched, entity)) {
>> -				spin_unlock(&rq->lock);
>> -				return ERR_PTR(-ENOSPC);
>> +				entity = ERR_PTR(-ENOSPC);
>> +				break;
>>   			}
>>   
>>   			reinit_completion(&entity->entity_idle);
>>   			break;
>>   		}
>> +		entity = NULL;
>>   	}
>>   	spin_unlock(&rq->lock);
>>   
>> -	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>> +	return entity;
>>   }
> 
> The whole diff of drm_sched_rq_select_entity_fifo() (except for the name) has
> nothing to do with the patch, does it?
> 
> If you want refactor things, please do it in a separate patch.

Well spotted thanks. There was some re-ordering and cherry-picking 
patches from some development branches and some mistakes crept in.

Regards,

Tvrtko

>>   
>>   /**
>> @@ -1045,20 +972,18 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>>   static struct drm_sched_entity *
>>   drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   {
>> -	struct drm_sched_entity *entity;
>> +	struct drm_sched_entity *entity = NULL;
>>   	int i;
>>   
>>   	/* Start with the highest priority.
>>   	 */
>>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>> -			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
>> -			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
>> +		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
>>   		if (entity)
>>   			break;
>>   	}
>>   
>> -	return IS_ERR(entity) ? NULL : entity;
>> +	return IS_ERR(entity) ? NULL : entity;;
>>   }
>>   
>>   /**
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 978ca621cc13..db65600732b9 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -245,8 +245,7 @@ struct drm_sched_entity {
>>    * struct drm_sched_rq - queue of entities to be scheduled.
>>    *
>>    * @sched: the scheduler to which this rq belongs to.
>> - * @lock: protects @entities, @rb_tree_root and @current_entity.
>> - * @current_entity: the entity which is to be scheduled.
>> + * @lock: protects @entities, @rb_tree_root and @rr_deadline.
>>    * @entities: list of the entities to be scheduled.
>>    * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
>>    *
>> @@ -259,7 +258,7 @@ struct drm_sched_rq {
>>   
>>   	spinlock_t			lock;
>>   	/* Following members are protected by the @lock: */
>> -	struct drm_sched_entity		*current_entity;
>> +	ktime_t				rr_deadline;
>>   	struct list_head		entities;
>>   	struct rb_root_cached		rb_tree_root;
>>   };
>> -- 
>> 2.47.1
>>
> 
