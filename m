Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00F99EC3D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 15:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C6D10E2CD;
	Tue, 15 Oct 2024 13:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YqAOHcpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456B210E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6R5OAWENthSxynw5iixzyu/53uuwEtHXURRYlDWbWmk=; b=YqAOHcpMAx6ZDqJ6z5TY1FcdNp
 Idupu0B0jXFshhkL26XE0Ibi9JtBzRTGXu9eyv6pScunJ89EdBB9butVN1YcWOU6AxEOzWYWW6UGN
 UQaMKdIwPPabnasrlx0oolX9hzZMBd0QP13sjwV9SiXRRBnXMLCg/8o8s4Oq3lhIpoziLzdxFwVZw
 KahPSCP+2pkYQqJpf3WXHVBosjhyEi4Dap61igye7g2MWBVqZ7LbFDlUYDO1t8TOgqsexYEYHqtr5
 XZn48dmP6980i0270SjkXUc6RolGvozqC2jj4MBm60oBDKVWROVipi8KGy2GX0YuAvn5USfSUbOch
 fn/iVKww==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t0hPQ-00ADve-MF; Tue, 15 Oct 2024 15:16:20 +0200
Message-ID: <db2904b2-25f8-4c30-ae4b-d1c69cccc655@igalia.com>
Date: Tue, 15 Oct 2024 14:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/sched: Re-group and rename the entity run-queue
 lock
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-5-tursulin@igalia.com>
 <38ec8fa17b8e1ee2f6d409ed0a472f0fcc006fd6.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <38ec8fa17b8e1ee2f6d409ed0a472f0fcc006fd6.camel@redhat.com>
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


On 15/10/2024 12:56, Philipp Stanner wrote:
> On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Christian suggested to rename the lock and improve the documentation
> 
> Let's move it to Annotators:
> Suggested-by: Christian König <christian.koenig@amd.com>

Ack.

> (Otherwise some time in the future a Christian Kaiser might start
> working on the scheduler on steal the praise ^^)
> 
>> of
>> what it protects.
> 
> So without Christian's name here I'd phrase it as:
> "When writing to a drm_sched_entity's run-queue, writers are protected
> through the lock drm_sched_entity.rq_lock. This naming, however,
> frequently collides with the separate internal lock of struct
> drm_sched_rq, resulting in uses like this:
> 
> 	spin_lock(&entity->rq_lock);
> 	spin_lock(&entity->rq->lock);
> 
> Rename drm_sched_entity.rq_lock to improve readability. While at it,
> re-order that struct's members to make it more obvious what the lock
> protects.

Will copy&paste - thanks for typing it out.

>> And to also re-order the structure members so all
>> protected by the lock are together in a block.
> 
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 28 ++++++++++++----------
>> --
>>   drivers/gpu/drm/scheduler/sched_main.c   |  2 +-
>>   include/drm/gpu_scheduler.h              | 15 +++++++------
>>   3 files changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index b72cba292839..c013c2b49aa5 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -105,7 +105,7 @@ int drm_sched_entity_init(struct drm_sched_entity
>> *entity,
>>   	/* We start in an idle state. */
>>   	complete_all(&entity->entity_idle);
>>   
>> -	spin_lock_init(&entity->rq_lock);
>> +	spin_lock_init(&entity->lock);
>>   	spsc_queue_init(&entity->job_queue);
>>   
>>   	atomic_set(&entity->fence_seq, 0);
>> @@ -133,10 +133,10 @@ void drm_sched_entity_modify_sched(struct
>> drm_sched_entity *entity,
>>   {
>>   	WARN_ON(!num_sched_list || !sched_list);
>>   
>> -	spin_lock(&entity->rq_lock);
>> +	spin_lock(&entity->lock);
>>   	entity->sched_list = sched_list;
>>   	entity->num_sched_list = num_sched_list;
>> -	spin_unlock(&entity->rq_lock);
>> +	spin_unlock(&entity->lock);
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>   
>> @@ -244,10 +244,10 @@ static void drm_sched_entity_kill(struct
>> drm_sched_entity *entity)
>>   	if (!entity->rq)
>>   		return;
>>   
>> -	spin_lock(&entity->rq_lock);
>> +	spin_lock(&entity->lock);
>>   	entity->stopped = true;
>>   	drm_sched_rq_remove_entity(entity->rq, entity);
>> -	spin_unlock(&entity->rq_lock);
>> +	spin_unlock(&entity->lock);
>>   
>>   	/* Make sure this entity is not used by the scheduler at the
>> moment */
>>   	wait_for_completion(&entity->entity_idle);
>> @@ -396,9 +396,9 @@ static void drm_sched_entity_wakeup(struct
>> dma_fence *f,
>>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>   				   enum drm_sched_priority priority)
>>   {
>> -	spin_lock(&entity->rq_lock);
>> +	spin_lock(&entity->lock);
>>   	entity->priority = priority;
>> -	spin_unlock(&entity->rq_lock);
>> +	spin_unlock(&entity->lock);
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_set_priority);
>>   
>> @@ -515,10 +515,10 @@ struct drm_sched_job
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   
>>   		next = to_drm_sched_job(spsc_queue_peek(&entity-
>>> job_queue));
>>   		if (next) {
>> -			spin_lock(&entity->rq_lock);
>> +			spin_lock(&entity->lock);
>>   			drm_sched_rq_update_fifo_locked(entity,
>>   							next-
>>> submit_ts);
>> -			spin_unlock(&entity->rq_lock);
>> +			spin_unlock(&entity->lock);
>>   		}
>>   	}
>>   
>> @@ -559,14 +559,14 @@ void drm_sched_entity_select_rq(struct
>> drm_sched_entity *entity)
>>   	if (fence && !dma_fence_is_signaled(fence))
>>   		return;
>>   
>> -	spin_lock(&entity->rq_lock);
>> +	spin_lock(&entity->lock);
>>   	sched = drm_sched_pick_best(entity->sched_list, entity-
>>> num_sched_list);
>>   	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>>   	if (rq != entity->rq) {
>>   		drm_sched_rq_remove_entity(entity->rq, entity);
>>   		entity->rq = rq;
>>   	}
>> -	spin_unlock(&entity->rq_lock);
>> +	spin_unlock(&entity->lock);
>>   
>>   	if (entity->num_sched_list == 1)
>>   		entity->sched_list = NULL;
>> @@ -605,9 +605,9 @@ void drm_sched_entity_push_job(struct
>> drm_sched_job *sched_job)
>>   		struct drm_sched_rq *rq;
>>   
>>   		/* Add the entity to the run queue */
>> -		spin_lock(&entity->rq_lock);
>> +		spin_lock(&entity->lock);
>>   		if (entity->stopped) {
>> -			spin_unlock(&entity->rq_lock);
>> +			spin_unlock(&entity->lock);
>>   
>>   			DRM_ERROR("Trying to push to a killed
>> entity\n");
>>   			return;
>> @@ -621,7 +621,7 @@ void drm_sched_entity_push_job(struct
>> drm_sched_job *sched_job)
>>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>   			drm_sched_rq_update_fifo_locked(entity,
>> submit_ts);
>>   
>> -		spin_unlock(&entity->rq_lock);
>> +		spin_unlock(&entity->lock);
>>   
>>   		drm_sched_wakeup(sched);
>>   	}
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 07ee386b8e4b..2670bf9f34b2 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -176,7 +176,7 @@ void drm_sched_rq_update_fifo_locked(struct
>> drm_sched_entity *entity, ktime_t ts
>>   	 * for entity from within concurrent
>> drm_sched_entity_select_rq and the
>>   	 * other to update the rb tree structure.
>>   	 */
>> -	lockdep_assert_held(&entity->rq_lock);
>> +	lockdep_assert_held(&entity->lock);
>>   
>>   	spin_lock(&entity->rq->lock);
>>   
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index b6d095074c19..683fff8939e4 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -96,6 +96,14 @@ struct drm_sched_entity {
>>   	 */
>>   	struct list_head		list;
>>   
> 
> Uh, btw, while reviewing, I just saw that we still have that FIXME
> further up:
> 
> 	/**
> 	 * @rq:
> 	 *
> 	 * Runqueue on which this entity is currently scheduled.
> 	 *
> 	 * FIXME: Locking is very unclear for this. Writers are protected by
> 	 * @rq_lock, but readers are generally lockless and seem to just race
> 	 * with not even a READ_ONCE.
> 	 */
> 	struct drm_sched_rq		*rq;
> 
> At the very least, rq_lock should be renamed here, too. AFAICS the

Good catch!

> series doesn't solve the FIXME, so we keep it, agreed?

Yep.

Regards,

Tvrtko

>> +	/**
>> +	 * @lock:
>> +	 *
>> +	 * Lock protecting the run-queue (@rq) to which this entity
>> belongs,
>> +	 * @priority and the list of schedulers (@sched_list,
>> @num_sched_list).
>> +	 */
>> +	spinlock_t			lock;
>> +
>>   	/**
>>   	 * @rq:
>>   	 *
>> @@ -140,13 +148,6 @@ struct drm_sched_entity {
>>   	 */
> 
> I think this comment here above also uses the term "rq_lock". While
> you're fixing it, maybe also do a quick grep for "rq_lock" in case I
> overlooked it somewhere else. I stopped drinking coffee today, so...
> 
> 
> Thx,
> P.
> 
>>   	enum drm_sched_priority         priority;
>>   
>> -	/**
>> -	 * @rq_lock:
>> -	 *
>> -	 * Lock to modify the runqueue to which this entity belongs.
>> -	 */
>> -	spinlock_t			rq_lock;
>> -
>>   	/**
>>   	 * @job_queue: the list of jobs of this entity.
>>   	 */
> 
