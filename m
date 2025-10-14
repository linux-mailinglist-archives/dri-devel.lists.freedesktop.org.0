Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C3BD9A15
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 15:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9933389F71;
	Tue, 14 Oct 2025 13:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ezxhOR3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DAF89F71;
 Tue, 14 Oct 2025 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaccVdiVj1nfpvxBKjigChMgGIAmrxr8ZxcqVA7DSOQ=; b=ezxhOR3PqXHaSj7tghTJ9V/W7x
 7IXzN62YICs+iUv7vzhG5akpIIRmAYPEq/vtmqPJaDB374b9acmEKvI8ooCYVu5pddp+vs5t9bwpI
 EmnCB/fyRYm1qoQLVzl4YaVfMBCk2jQ6mc2OVAp21KINXVAD2zfpq1mWdMPyPhrBNnMSSCITe0FN0
 bBv1YoarKVp5mAZtTokdwsz6nwPjxUWW2Nf6E+R/sOiYMhgFwlG8SpnEpGjsehv/zb8wHj6g76BRn
 1H12UyXeQtKkRzjamMqMGwf8LPISxyZXwJCRHWB0f+eUB8D3lzCMGj6c+pnHWbp0y59iYr7lVS2jw
 AHtvisiA==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v8etG-009PdF-3F; Tue, 14 Oct 2025 15:16:34 +0200
Message-ID: <58879b1e-dafa-41d7-97b1-9d821c354d61@igalia.com>
Date: Tue, 14 Oct 2025 14:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/28] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-14-tvrtko.ursulin@igalia.com>
 <44dfae80b8e504d6908cae79fab707f02b974834.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <44dfae80b8e504d6908cae79fab707f02b974834.camel@mailbox.org>
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


On 14/10/2025 12:16, Philipp Stanner wrote:
> On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
>> Since the new fair policy is at least as good as FIFO and we can afford to
> 
> s/fair/FAIR
> 
>> remove round-robin,
>>
> 
> Better state that RR has not been used as the default since forever as
> the justification.

Yeah, I reworded the whole first paragraph.

> 
>>   we can simplify the scheduler code by making the
>> scheduler to run queue relationship always 1:1 and remove some code.
>>
>> Also, now that the FIFO policy is gone the tree of entities is not a FIFO
>> tree any more so rename it to just the tree.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  23 ++-
>>   drivers/gpu/drm/scheduler/sched_entity.c   |  29 +---
>>   drivers/gpu/drm/scheduler/sched_internal.h |  12 +-
>>   drivers/gpu/drm/scheduler/sched_main.c     | 161 ++++++---------------
>>   drivers/gpu/drm/scheduler/sched_rq.c       |  67 +++------
>>   include/drm/gpu_scheduler.h                |  36 +----
>>   6 files changed, 82 insertions(+), 246 deletions(-)
> 
> Now that's nice!
> 
> 
> Just a few more comments below; I have a bit of a tight schedule this
> week.
> 
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index d020a890a0ea..bc07fd57310c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -434,25 +434,22 @@ drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
>>   
>>   void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>>   {
>> +	struct drm_sched_rq *rq = sched->rq;
>> +	struct drm_sched_entity *s_entity;
>>   	struct drm_sched_job *s_job;
>> -	struct drm_sched_entity *s_entity = NULL;
>> -	int i;
>>   
>>   	/* Signal all jobs not yet scheduled */
>> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> -		struct drm_sched_rq *rq = sched->sched_rq[i];
>> -		spin_lock(&rq->lock);
>> -		list_for_each_entry(s_entity, &rq->entities, list) {
>> -			while ((s_job = drm_sched_entity_queue_pop(s_entity))) {
>> -				struct drm_sched_fence *s_fence = s_job->s_fence;
>> +	spin_lock(&rq->lock);
>> +	list_for_each_entry(s_entity, &rq->entities, list) {
>> +		while ((s_job = drm_sched_entity_queue_pop(s_entity))) {
>> +			struct drm_sched_fence *s_fence = s_job->s_fence;
>>   
>> -				dma_fence_signal(&s_fence->scheduled);
>> -				dma_fence_set_error(&s_fence->finished, -EHWPOISON);
>> -				dma_fence_signal(&s_fence->finished);
>> -			}
>> +			dma_fence_signal(&s_fence->scheduled);
>> +			dma_fence_set_error(&s_fence->finished, -EHWPOISON);
> 
> Do we btw. know why the error was even poisoned here?

7c6e68c777f1 ("drm/amdgpu: Avoid HW GPU reset for RAS.")

Seems to be a way of RAS letting userspace know hardware error has been 
detected.

> 
>> +			dma_fence_signal(&s_fence->finished);
>>   		}
>> -		spin_unlock(&rq->lock);
>>   	}
>> +	spin_unlock(&rq->lock);
>>   
>>   	/* Signal all jobs already scheduled to HW */
>>   	list_for_each_entry(s_job, &sched->pending_list, list) {
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 1715e1caec40..2b03ca7c835a 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -109,8 +109,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>   	entity->guilty = guilty;
>>   	entity->num_sched_list = num_sched_list;
>>   	entity->priority = priority;
>> -	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_FAIR ?
>> -			      DRM_SCHED_PRIORITY_KERNEL : priority;
>>   	/*
>>   	 * It's perfectly valid to initialize an entity without having a valid
>>   	 * scheduler attached. It's just not valid to use the scheduler before it
>> @@ -120,30 +118,14 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>   	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>>   
>> -	if (num_sched_list && !sched_list[0]->sched_rq) {
>> +	if (num_sched_list && !sched_list[0]->rq) {
>>   		/* Since every entry covered by num_sched_list
>>   		 * should be non-NULL and therefore we warn drivers
>>   		 * not to do this and to fix their DRM calling order.
>>   		 */
>>   		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>   	} else if (num_sched_list) {
>> -		enum drm_sched_priority p = entity->priority;
>> -
>> -		/*
>> -		 * The "priority" of an entity cannot exceed the number of
>> -		 * run-queues of a scheduler. Protect against num_rqs being 0,
>> -		 * by converting to signed. Choose the lowest priority
>> -		 * available.
>> -		 */
>> -		if (p >= sched_list[0]->num_user_rqs) {
>> -			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
>> -				p, sched_list[0]->num_user_rqs);
>> -			p = max_t(s32,
>> -				 (s32)sched_list[0]->num_user_rqs - 1,
>> -				 (s32)DRM_SCHED_PRIORITY_KERNEL);
>> -			entity->priority = p;
>> -		}
>> -		entity->rq = sched_list[0]->sched_rq[entity->rq_priority];
>> +		entity->rq = sched_list[0]->rq;
>>   	}
>>   
>>   	init_completion(&entity->entity_idle);
>> @@ -576,7 +558,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>   
>>   	spin_lock(&entity->lock);
>>   	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>> -	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
>> +	rq = sched ? sched->rq : NULL;
>>   	if (rq != entity->rq) {
>>   		drm_sched_rq_remove_entity(entity->rq, entity);
>>   		entity->rq = rq;
>> @@ -600,7 +582,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   {
>>   	struct drm_sched_entity *entity = sched_job->entity;
>>   	bool first;
>> -	ktime_t submit_ts;
>>   
>>   	trace_drm_sched_job_queue(sched_job, entity);
>>   
>> @@ -617,16 +598,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   	/*
>>   	 * After the sched_job is pushed into the entity queue, it may be
>>   	 * completed and freed up at any time. We can no longer access it.
>> -	 * Make sure to set the submit_ts first, to avoid a race.
>>   	 */
>> -	sched_job->submit_ts = submit_ts = ktime_get();
>>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>   
>>   	/* first job wakes up scheduler */
>>   	if (first) {
>>   		struct drm_gpu_scheduler *sched;
>>   
>> -		sched = drm_sched_rq_add_entity(entity, submit_ts);
>> +		sched = drm_sched_rq_add_entity(entity);
>>   		if (sched)
>>   			drm_sched_wakeup(sched);
>>   	}
>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
>> index a120efc5d763..0a5b7bf2cb93 100644
>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>> @@ -32,13 +32,6 @@ struct drm_sched_entity_stats {
>>   	struct ewma_drm_sched_avgtime   avg_job_us;
>>   };
>>   
>> -/* Used to choose between FIFO and RR job-scheduling */
>> -extern int drm_sched_policy;
>> -
>> -#define DRM_SCHED_POLICY_RR   0
>> -#define DRM_SCHED_POLICY_FIFO 1
>> -#define DRM_SCHED_POLICY_FAIR 2
>> -
>>   bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>   			 struct drm_sched_entity *entity);
>>   void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>> @@ -46,10 +39,9 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>   void drm_sched_rq_init(struct drm_sched_rq *rq,
>>   		       struct drm_gpu_scheduler *sched);
>>   struct drm_sched_entity *
>> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> -			   struct drm_sched_rq *rq);
>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched);
>>   struct drm_gpu_scheduler *
>> -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
>> +drm_sched_rq_add_entity(struct drm_sched_entity *entity);
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   				struct drm_sched_entity *entity);
>>   void drm_sched_rq_pop_entity(struct drm_sched_entity *entity);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 858fc28e91e4..518ce87f844a 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -84,15 +84,6 @@
>>   #define CREATE_TRACE_POINTS
>>   #include "gpu_scheduler_trace.h"
>>   
>> -int drm_sched_policy = DRM_SCHED_POLICY_FAIR;
>> -
>> -/**
>> - * DOC: sched_policy (int)
>> - * Used to override default entities scheduling policy in a run queue.
>> - */
>> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");
>> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
>> -
>>   static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>>   {
>>   	u32 credits;
>> @@ -876,34 +867,6 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>>   	drm_sched_run_job_queue(sched);
>>   }
>>   
>> -/**
>> - * drm_sched_select_entity - Select next entity to process
>> - *
>> - * @sched: scheduler instance
>> - *
>> - * Return an entity to process or NULL if none are found.
>> - *
>> - * Note, that we break out of the for-loop when "entity" is non-null, which can
>> - * also be an error-pointer--this assures we don't process lower priority
>> - * run-queues. See comments in the respectively called functions.
>> - */
>> -static struct drm_sched_entity *
>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>> -{
>> -	struct drm_sched_entity *entity = NULL;
>> -	int i;
>> -
>> -	/* Start with the highest priority.
>> -	 */
>> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> -		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
>> -		if (entity)
>> -			break;
>> -	}
>> -
>> -	return IS_ERR(entity) ? NULL : entity;
>> -}
>> -
>>   /**
>>    * drm_sched_get_finished_job - fetch the next finished job to be destroyed
>>    *
>> @@ -1029,7 +992,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>   
>>   	/* Find entity with a ready job */
>>   	entity = drm_sched_select_entity(sched);
>> -	if (!entity)
>> +	if (IS_ERR_OR_NULL(entity))
> 
> What's that about?

drm_sched_select_entity has been replaced with renamed 
drm_sched_rq_select_entity and the former has this return value contract.

> 
>>   		return;	/* No more work */
>>   
>>   	sched_job = drm_sched_entity_pop_job(entity);
>> @@ -1100,8 +1063,6 @@ static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
>>    */
>>   int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_args *args)
>>   {
>> -	int i;
>> -
>>   	sched->ops = args->ops;
>>   	sched->credit_limit = args->credit_limit;
>>   	sched->name = args->name;
>> @@ -1111,13 +1072,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>   	sched->score = args->score ? args->score : &sched->_score;
>>   	sched->dev = args->dev;
>>   
>> -	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>> -		/* This is a gross violation--tell drivers what the  problem is.
>> -		 */
>> -		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
>> -			__func__);
>> -		return -EINVAL;
>> -	} else if (sched->sched_rq) {
>> +	if (sched->rq) {
>>   		/* Not an error, but warn anyway so drivers can
>>   		 * fine-tune their DRM calling order, and return all
>>   		 * is good.
>> @@ -1137,21 +1092,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>   		sched->own_submit_wq = true;
>>   	}
>>   
>> -	sched->num_user_rqs = args->num_rqs;
>> -	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_FAIR ?
>> -			 args->num_rqs : 1;
>> -	sched->sched_rq = kmalloc_array(sched->num_rqs,
>> -					sizeof(*sched->sched_rq),
>> -					GFP_KERNEL | __GFP_ZERO);
>> -	if (!sched->sched_rq)
>> +	sched->rq = kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
>> +	if (!sched->rq)
>>   		goto Out_check_own;
>>   
>> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> -		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>> -		if (!sched->sched_rq[i])
>> -			goto Out_unroll;
>> -		drm_sched_rq_init(sched->sched_rq[i], sched);
>> -	}
>> +	drm_sched_rq_init(sched->rq, sched);
>>   
>>   	init_waitqueue_head(&sched->job_scheduled);
>>   	INIT_LIST_HEAD(&sched->pending_list);
>> @@ -1167,12 +1112,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>   
>>   	sched->ready = true;
>>   	return 0;
>> -Out_unroll:
>> -	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
>> -		kfree(sched->sched_rq[i]);
>>   
>> -	kfree(sched->sched_rq);
>> -	sched->sched_rq = NULL;
>>   Out_check_own:
>>   	if (sched->own_submit_wq)
>>   		destroy_workqueue(sched->submit_wq);
>> @@ -1208,41 +1148,35 @@ static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
>>    */
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>   {
>> +
> 
> Surplus empty line.

Too many rebases and re-orders I guess. Fixed.

Regards,

Tvrtko

> 
> 
> P.
> 
>> +	struct drm_sched_rq *rq = sched->rq;
>>   	struct drm_sched_entity *s_entity;
>> -	int i;
>>   
>>   	drm_sched_wqueue_stop(sched);
>>   
>> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> -		struct drm_sched_rq *rq = sched->sched_rq[i];
>> -
>> -		spin_lock(&rq->lock);
>> -		list_for_each_entry(s_entity, &rq->entities, list)
>> -			/*
>> -			 * Prevents reinsertion and marks job_queue as idle,
>> -			 * it will be removed from the rq in drm_sched_entity_fini()
>> -			 * eventually
>> -			 *
>> -			 * FIXME:
>> -			 * This lacks the proper spin_lock(&s_entity->lock) and
>> -			 * is, therefore, a race condition. Most notably, it
>> -			 * can race with drm_sched_entity_push_job(). The lock
>> -			 * cannot be taken here, however, because this would
>> -			 * lead to lock inversion -> deadlock.
>> -			 *
>> -			 * The best solution probably is to enforce the life
>> -			 * time rule of all entities having to be torn down
>> -			 * before their scheduler. Then, however, locking could
>> -			 * be dropped alltogether from this function.
>> -			 *
>> -			 * For now, this remains a potential race in all
>> -			 * drivers that keep entities alive for longer than
>> -			 * the scheduler.
>> -			 */
>> -			s_entity->stopped = true;
>> -		spin_unlock(&rq->lock);
>> -		kfree(sched->sched_rq[i]);
>> -	}
>> +	spin_lock(&rq->lock);
>> +	list_for_each_entry(s_entity, &rq->entities, list)
>> +		/*
>> +		 * Prevents re-insertion and marks job_queue as idle,
>> +		 * it will be removed from the rq in drm_sched_entity_fini()
>> +		 * eventually.
>> +		 *
>> +		 * FIXME:
>> +		 * This lacks the proper spin_lock(&s_entity->lock) and is,
>> +		 * therefore, a race condition. Most notably, it can race with
>> +		 * drm_sched_entity_push_job(). The lock cannot be taken here,
>> +		 * however, because this would lead to lock inversion.
>> +		 *
>> +		 * The best solution probably is to enforce the life time rule
>> +		 * of all entities having to be torn down before their
>> +		 * scheduler. Then locking could be dropped altogether from this
>> +		 * function.
>> +		 *
>> +		 * For now, this remains a potential race in all drivers that
>> +		 * keep entities alive for longer than the scheduler.
>> +		 */
>> +		s_entity->stopped = true;
>> +	spin_unlock(&rq->lock);
>>   
>>   	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
>>   	wake_up_all(&sched->job_scheduled);
>> @@ -1257,8 +1191,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>   	if (sched->own_submit_wq)
>>   		destroy_workqueue(sched->submit_wq);
>>   	sched->ready = false;
>> -	kfree(sched->sched_rq);
>> -	sched->sched_rq = NULL;
>> +	kfree(sched->rq);
>> +	sched->rq = NULL;
>>   
>>   	if (!list_empty(&sched->pending_list))
>>   		dev_warn(sched->dev, "Tearing down scheduler while jobs are pending!\n");
>> @@ -1276,35 +1210,28 @@ EXPORT_SYMBOL(drm_sched_fini);
>>    */
>>   void drm_sched_increase_karma(struct drm_sched_job *bad)
>>   {
>> -	int i;
>> -	struct drm_sched_entity *tmp;
>> -	struct drm_sched_entity *entity;
>>   	struct drm_gpu_scheduler *sched = bad->sched;
>> +	struct drm_sched_entity *entity, *tmp;
>> +	struct drm_sched_rq *rq = sched->rq;
>>   
>>   	/* don't change @bad's karma if it's from KERNEL RQ,
>>   	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
>>   	 * corrupt but keep in mind that kernel jobs always considered good.
>>   	 */
>> -	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>> -		atomic_inc(&bad->karma);
>> +	if (bad->s_priority == DRM_SCHED_PRIORITY_KERNEL)
>> +		return;
>>   
>> -		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> -			struct drm_sched_rq *rq = sched->sched_rq[i];
>> +	atomic_inc(&bad->karma);
>>   
>> -			spin_lock(&rq->lock);
>> -			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
>> -				if (bad->s_fence->scheduled.context ==
>> -				    entity->fence_context) {
>> -					if (entity->guilty)
>> -						atomic_set(entity->guilty, 1);
>> -					break;
>> -				}
>> -			}
>> -			spin_unlock(&rq->lock);
>> -			if (&entity->list != &rq->entities)
>> -				break;
>> +	spin_lock(&rq->lock);
>> +	list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
>> +		if (bad->s_fence->scheduled.context == entity->fence_context) {
>> +			if (entity->guilty)
>> +				atomic_set(entity->guilty, 1);
>> +			break;
>>   		}
>>   	}
>> +	spin_unlock(&rq->lock);
>>   }
>>   EXPORT_SYMBOL(drm_sched_increase_karma);
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>> index 02742869e75b..f9c899a9629c 100644
>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>> @@ -34,7 +34,7 @@ static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
>>   	rq->head_prio = prio;
>>   }
>>   
>> -static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>> +static void drm_sched_rq_remove_tree_locked(struct drm_sched_entity *entity,
>>   					    struct drm_sched_rq *rq)
>>   {
>>   	lockdep_assert_held(&entity->lock);
>> @@ -47,7 +47,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>   	}
>>   }
>>   
>> -static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>> +static void drm_sched_rq_update_tree_locked(struct drm_sched_entity *entity,
>>   					    struct drm_sched_rq *rq,
>>   					    ktime_t ts)
>>   {
>> @@ -59,7 +59,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>   	lockdep_assert_held(&entity->lock);
>>   	lockdep_assert_held(&rq->lock);
>>   
>> -	drm_sched_rq_remove_fifo_locked(entity, rq);
>> +	drm_sched_rq_remove_tree_locked(entity, rq);
>>   
>>   	entity->oldest_job_waiting = ts;
>>   
>> @@ -211,17 +211,17 @@ static ktime_t drm_sched_entity_get_job_ts(struct drm_sched_entity *entity)
>>    * drm_sched_rq_add_entity - add an entity
>>    *
>>    * @entity: scheduler entity
>> - * @ts: submission timestamp
>>    *
>>    * Adds a scheduler entity to the run queue.
>>    *
>>    * Returns a DRM scheduler pre-selected to handle this entity.
>>    */
>>   struct drm_gpu_scheduler *
>> -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
>> +drm_sched_rq_add_entity(struct drm_sched_entity *entity)
>>   {
>>   	struct drm_gpu_scheduler *sched;
>>   	struct drm_sched_rq *rq;
>> +	ktime_t ts;
>>   
>>   	/* Add the entity to the run queue */
>>   	spin_lock(&entity->lock);
>> @@ -241,15 +241,9 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
>>   		list_add_tail(&entity->list, &rq->entities);
>>   	}
>>   
>> -	if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
>> -		ts = drm_sched_rq_get_min_vruntime(rq);
>> -		ts = drm_sched_entity_restore_vruntime(entity, ts,
>> -						       rq->head_prio);
>> -	} else if (drm_sched_policy == DRM_SCHED_POLICY_RR) {
>> -		ts = entity->rr_ts;
>> -	}
>> -
>> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +	ts = drm_sched_rq_get_min_vruntime(rq);
>> +	ts = drm_sched_entity_restore_vruntime(entity, ts, rq->head_prio);
>> +	drm_sched_rq_update_tree_locked(entity, rq, ts);
>>   
>>   	spin_unlock(&rq->lock);
>>   	spin_unlock(&entity->lock);
>> @@ -278,26 +272,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   	atomic_dec(rq->sched->score);
>>   	list_del_init(&entity->list);
>>   
>> -	drm_sched_rq_remove_fifo_locked(entity, rq);
>> +	drm_sched_rq_remove_tree_locked(entity, rq);
>>   
>>   	spin_unlock(&rq->lock);
>>   }
>>   
>> -static ktime_t
>> -drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
>> -{
>> -	ktime_t ts;
>> -
>> -	lockdep_assert_held(&entity->lock);
>> -	lockdep_assert_held(&rq->lock);
>> -
>> -	ts = ktime_add_ns(rq->rr_ts, 1);
>> -	entity->rr_ts = ts;
>> -	rq->rr_ts = ts;
>> -
>> -	return ts;
>> -}
>> -
>>   /**
>>    * drm_sched_rq_pop_entity - pops an entity
>>    *
>> @@ -321,33 +300,23 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>   	if (next_job) {
>>   		ktime_t ts;
>>   
>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR)
>> -			ts = drm_sched_entity_get_job_ts(entity);
>> -		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -			ts = next_job->submit_ts;
>> -		else
>> -			ts = drm_sched_rq_get_rr_ts(rq, entity);
>> -
>> -		drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +		ts = drm_sched_entity_get_job_ts(entity);
>> +		drm_sched_rq_update_tree_locked(entity, rq, ts);
>>   	} else {
>> -		drm_sched_rq_remove_fifo_locked(entity, rq);
>> +		ktime_t min_vruntime;
>>   
>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
>> -			ktime_t min_vruntime;
>> -
>> -			min_vruntime = drm_sched_rq_get_min_vruntime(rq);
>> -			drm_sched_entity_save_vruntime(entity, min_vruntime);
>> -		}
>> +		drm_sched_rq_remove_tree_locked(entity, rq);
>> +		min_vruntime = drm_sched_rq_get_min_vruntime(rq);
>> +		drm_sched_entity_save_vruntime(entity, min_vruntime);
>>   	}
>>   	spin_unlock(&rq->lock);
>>   	spin_unlock(&entity->lock);
>>   }
>>   
>>   /**
>> - * drm_sched_rq_select_entity - Select an entity which provides a job to run
>> + * drm_sched_select_entity - Select an entity which provides a job to run
>>    *
>>    * @sched: the gpu scheduler
>> - * @rq: scheduler run queue to check.
>>    *
>>    * Find oldest waiting ready entity.
>>    *
>> @@ -356,9 +325,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>    * its job; return NULL, if no ready entity was found.
>>    */
>>   struct drm_sched_entity *
>> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> -			   struct drm_sched_rq *rq)
>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   {
>> +	struct drm_sched_rq *rq = sched->rq;
>>   	struct rb_node *rb;
>>   
>>   	spin_lock(&rq->lock);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index a7e407e04ce0..d4dc4b8b770a 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -99,8 +99,7 @@ struct drm_sched_entity {
>>   	 * @lock:
>>   	 *
>>   	 * Lock protecting the run-queue (@rq) to which this entity belongs,
>> -	 * @priority, the list of schedulers (@sched_list, @num_sched_list) and
>> -	 * the @rr_ts field.
>> +	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
>>   	 */
>>   	spinlock_t			lock;
>>   
>> @@ -153,18 +152,6 @@ struct drm_sched_entity {
>>   	 */
>>   	enum drm_sched_priority         priority;
>>   
>> -	/**
>> -	 * @rq_priority: Run-queue priority
>> -	 */
>> -	enum drm_sched_priority         rq_priority;
>> -
>> -	/**
>> -	 * @rr_ts:
>> -	 *
>> -	 * Fake timestamp of the last popped job from the entity.
>> -	 */
>> -	ktime_t				rr_ts;
>> -
>>   	/**
>>   	 * @job_queue: the list of jobs of this entity.
>>   	 */
>> @@ -262,8 +249,7 @@ struct drm_sched_entity {
>>    * struct drm_sched_rq - queue of entities to be scheduled.
>>    *
>>    * @sched: the scheduler to which this rq belongs to.
>> - * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
>> - * @rr_ts: monotonically incrementing fake timestamp for RR mode
>> + * @lock: protects @entities, @rb_tree_root and @head_prio.
>>    * @entities: list of the entities to be scheduled.
>>    * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
>>    * @head_prio: priority of the top tree element
>> @@ -277,7 +263,6 @@ struct drm_sched_rq {
>>   
>>   	spinlock_t			lock;
>>   	/* Following members are protected by the @lock: */
>> -	ktime_t				rr_ts;
>>   	struct list_head		entities;
>>   	struct rb_root_cached		rb_tree_root;
>>   	enum drm_sched_priority		head_prio;
>> @@ -363,13 +348,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>>    * to schedule the job.
>>    */
>>   struct drm_sched_job {
>> -	/**
>> -	 * @submit_ts:
>> -	 *
>> -	 * When the job was pushed into the entity queue.
>> -	 */
>> -	ktime_t                         submit_ts;
>> -
>>   	/**
>>   	 * @sched:
>>   	 *
>> @@ -573,11 +551,7 @@ struct drm_sched_backend_ops {
>>    * @credit_count: the current credit count of this scheduler
>>    * @timeout: the time after which a job is removed from the scheduler.
>>    * @name: name of the ring for which this scheduler is being used.
>> - * @num_user_rqs: Number of run-queues. This is at most
>> - *                DRM_SCHED_PRIORITY_COUNT, as there's usually one run-queue per
>> - *                priority, but could be less.
>> - * @num_rqs: Equal to @num_user_rqs for FIFO and RR and 1 for the FAIR policy.
>> - * @sched_rq: An allocated array of run-queues of size @num_rqs;
>> + * @rq: Scheduler run queue
>>    * @job_scheduled: once drm_sched_entity_flush() is called the scheduler
>>    *                 waits on this wait queue until all the scheduled jobs are
>>    *                 finished.
>> @@ -609,9 +583,7 @@ struct drm_gpu_scheduler {
>>   	atomic_t			credit_count;
>>   	long				timeout;
>>   	const char			*name;
>> -	u32                             num_rqs;
>> -	u32                             num_user_rqs;
>> -	struct drm_sched_rq             **sched_rq;
>> +	struct drm_sched_rq             *rq;
>>   	wait_queue_head_t		job_scheduled;
>>   	atomic64_t			job_id_count;
>>   	struct workqueue_struct		*submit_wq;
> 

