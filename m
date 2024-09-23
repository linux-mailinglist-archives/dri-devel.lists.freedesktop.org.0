Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4A97ED3A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546B710E405;
	Mon, 23 Sep 2024 14:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XNgCAatQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDD710E40B;
 Mon, 23 Sep 2024 14:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=63Hltl8D69AX977AXIjuweINg51YNNLoc83jPbYGVSI=; b=XNgCAatQO3F108V0ud3RUEcDjK
 U5ooUZeCecaXqTTQFFTEGpLimA7eZ+bd1xBgktYiayBmYC8cRh/ChHNdtMMNYAcjwcpiKKaWsT+pD
 Rz/uucXt8z5vaunEE1FzpQ5+/611RE485OmjnsOfZ7aHYUB2fdrL2/m3kyTEoHeh61N/Urig9FSTd
 JQ01wo+dzv3o5k42vCWLNuw6BNBRKZDeUzdi7Qw1vG0GOAJr3lS1Q9OtMXB90BA9VuF8mpIDXl7Xr
 B+tQubj9c+QtZwNavc4xYf2NzZwAwrSVNvIcaSD+YFlgVzZtgLrl/q3+ZVL/nO8SFZmd5yHU9ieZ3
 tnmxljYg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sskAD-00HZNo-Eb; Mon, 23 Sep 2024 16:35:45 +0200
Message-ID: <1650ecb9-ac8a-4199-8693-77c73a95bbbd@igalia.com>
Date: Mon, 23 Sep 2024 15:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Further optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240913160559.49054-9-tursulin@igalia.com>
 <20240916173007.118-1-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240916173007.118-1-tursulin@igalia.com>
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


Ping Christian and Philipp - reasonably happy with v2? I think it's the 
only unreviewed patch from the series.

Regards,

Tvrtko

On 16/09/2024 18:30, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Having removed one re-lock cycle on the entity->lock in a patch titled
> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
> larger refactoring we can do the same optimisation on the rq->lock.
> (Currently both drm_sched_rq_add_entity() and
> drm_sched_rq_update_fifo_locked() take and release the same lock.)
> 
> To achieve this we make drm_sched_rq_update_fifo_locked() and
> drm_sched_rq_add_entity() expect the rq->lock to be held.
> 
> We also align drm_sched_rq_update_fifo_locked(),
> drm_sched_rq_add_entity() and
> drm_sched_rq_remove_fifo_locked() function signatures, by adding rq as a
> parameter to the latter.
> 
> v2:
>   * Fix after rebase of the series.
>   * Avoid naming incosistency between drm_sched_rq_add/remove. (Christian)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 29 ++++++++++++------------
>   include/drm/gpu_scheduler.h              |  3 ++-
>   3 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index d982cebc6bee..8ace1f1ea66b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -515,9 +515,14 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   
>   		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>   		if (next) {
> +			struct drm_sched_rq *rq;
> +
>   			spin_lock(&entity->lock);
> -			drm_sched_rq_update_fifo_locked(entity,
> +			rq = entity->rq;
> +			spin_lock(&rq->lock);
> +			drm_sched_rq_update_fifo_locked(entity, rq,
>   							next->submit_ts);
> +			spin_unlock(&rq->lock);
>   			spin_unlock(&entity->lock);
>   		}
>   	}
> @@ -618,11 +623,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   		sched = rq->sched;
>   
>   		atomic_inc(sched->score);
> +
> +		spin_lock(&rq->lock);
>   		drm_sched_rq_add_entity(rq, entity);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo_locked(entity, submit_ts);
> +			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>   
> +		spin_unlock(&rq->lock);
>   		spin_unlock(&entity->lock);
>   
>   		drm_sched_wakeup(sched, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 18a952f73ecb..5c83fb92bb89 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -153,17 +153,18 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>   	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
>   }
>   
> -static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
> +					    struct drm_sched_rq *rq)
>   {
> -	struct drm_sched_rq *rq = entity->rq;
> -
>   	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>   		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>   		RB_CLEAR_NODE(&entity->rb_tree_node);
>   	}
>   }
>   
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +				     struct drm_sched_rq *rq,
> +				     ktime_t ts)
>   {
>   	/*
>   	 * Both locks need to be grabbed, one to protect from entity->rq change
> @@ -171,17 +172,14 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts
>   	 * other to update the rb tree structure.
>   	 */
>   	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
>   
> -	spin_lock(&entity->rq->lock);
> -
> -	drm_sched_rq_remove_fifo_locked(entity);
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>   
>   	entity->oldest_job_waiting = ts;
>   
> -	rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>   		      drm_sched_entity_compare_before);
> -
> -	spin_unlock(&entity->rq->lock);
>   }
>   
>   /**
> @@ -213,15 +211,14 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   			     struct drm_sched_entity *entity)
>   {
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
>   	if (!list_empty(&entity->list))
>   		return;
>   
> -	spin_lock(&rq->lock);
> -
>   	atomic_inc(rq->sched->score);
>   	list_add_tail(&entity->list, &rq->entities);
> -
> -	spin_unlock(&rq->lock);
>   }
>   
>   /**
> @@ -235,6 +232,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity)
>   {
> +	lockdep_assert_held(&entity->lock);
> +
>   	if (list_empty(&entity->list))
>   		return;
>   
> @@ -247,7 +246,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   		rq->current_entity = NULL;
>   
>   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -		drm_sched_rq_remove_fifo_locked(entity);
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>   
>   	spin_unlock(&rq->lock);
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 80198e6cf537..b21806d5a8eb 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity);
>   
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +				     struct drm_sched_rq *rq, ktime_t ts);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,
