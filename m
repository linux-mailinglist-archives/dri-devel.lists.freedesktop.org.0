Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D63A03D50
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE5A10E3FE;
	Tue,  7 Jan 2025 11:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="HZKpoflJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934A210E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:09:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso111126645e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 03:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736248100; x=1736852900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lFaEFb5YDzkh9aMMsKHV54EY7V6oXZZT3zxejqu1kmI=;
 b=HZKpoflJ3TMUOZzrKEPcpmQlqBJfWsdHz6cJGOiaXwjPfg1Yc6MRBsnUzffiFRlrDM
 aNiZTw1+ksNEEu7Dt6wZCof+QV5rIE617AjhqRMiyGmec2icCNOMZ+IOuHVQs0h03aeT
 +8XV/WFXQIFQBBCnYfKUvF2o+5WWf+viCb5p2Elkx/mnGxzmrNcZf1FugQ86xPHMOfwx
 ZCGzXhRurTL7c6+QT3cgiVuRpICUhiLLRu6LTgFi9duOhC5JeZGXUfooqqAqyouPRJbD
 Xj+OtGB8PAlscWTBBQaT9ojVR7/3EUahA1LG5eQS7lRbhf4+UEWRZKFgh/6h5QL4UUJ+
 fsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736248100; x=1736852900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lFaEFb5YDzkh9aMMsKHV54EY7V6oXZZT3zxejqu1kmI=;
 b=UEW9h0dlORGvEBj5u7yk2bIGxpxefAMupx+Dpo3SHS0/QC4x+h8c9pMrRHKwARSQ+4
 GdTX34KphG/4HgJjIN/DKSdHWjWUfZCd8yURDAkYgpWTn+KbP+k0yl7ScCmKTtoA50jb
 YM4aeX8tikKu1Dub5sm50pmeEhRZLn+hECJaH5URgclutAmH2u9cx/xnAA/26yPoJzxx
 Tg/sHlBBpc16vVNcGu+5OfPgzb9c7EvEdozVDc7eAJr9fNveciYe3piFR0D4U4ofnMOB
 Dk83Z7NWIkUTVsvQ/CjGimuxtLTpnuV2Aol/YFbGxJHvOR3NTUnqpUK65IFmb5XGim5E
 xFrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeOS0t0lUCMIO5yuKiG+zkGPYZE+tEgyyjalPwcAiFWLtVEBCfbiDIGya1/tzIA/FU+RwBwv6FPu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6UK/zwyaGp+ZMS3/pS4dANhdCERvnP7oE12qwPwF9Tht25NGo
 JA7pYWDeDNBYEsPYtTwWmCoZjKbRTfyZUc9rljl87I83N9KdmOrFm6c50+wJM+Y=
X-Gm-Gg: ASbGnctbHt5hTyi08+d+m2PQvQHc9rRqivH6GFmXE2UWpqP/wz+gsaByVYPm/rggGkJ
 ZIgoIrHt5RdEHitDOO9uoIaLUfzoBHMQ0YSjZGn1XvRjn6235QTv5qDpDLJ8iF4ayufBGnXyBoO
 PetCOinPQqC26mMyrTglt4rOG08ua1QyjyW6uNcjZKSSMxoJvYYKlBfMxgR8mh/sTi9a1CDZYEs
 BofA7l+RDmzXmFjvm+S7irxZUoy4SPS2zQdEWetm+hFP9GGZ1UU0PBgFnMzTbXEVL2jjeds
X-Google-Smtp-Source: AGHT+IGW+IrpwtP4hzZXzeSFVsuT44MivIXhViL03iQYA7dp6QtySlF9wGltm9HZG/P96R8hm29lYA==
X-Received: by 2002:a05:600c:1c22:b0:434:a1e7:27b0 with SMTP id
 5b1f17b1804b1-4366864338fmr491775825e9.11.1736248100138; 
 Tue, 07 Jan 2025 03:08:20 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b11aecsm626745785e9.23.2025.01.07.03.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 03:08:19 -0800 (PST)
Message-ID: <77d7c726-c200-45e4-b127-845027073c71@ursulin.net>
Date: Tue, 7 Jan 2025 11:08:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/14] drm/sched: Queue all free credits in one worker
 invocation
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-11-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241230165259.95855-11-tursulin@igalia.com>
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


On 30/12/2024 16:52, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> There is no reason to queue just a single job if scheduler can take more
> and re-queue the worker to queue more. We can simply feed the hardware
> with as much as it can take in one go and hopefully win some latency.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 112 +++++++++++--------------
>   drivers/gpu/drm/scheduler/sched_rq.c   |  19 ++---
>   include/drm/gpu_scheduler.h            |   3 -
>   3 files changed, 58 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4ba9ed27a8a6..6f4ea8a2ca17 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -98,33 +98,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>   	return credits;
>   }
>   
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - * @entity: the scheduler entity
> - *
> - * Return true if we can push at least one more job from @entity, false
> - * otherwise.
> - */
> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -			 struct drm_sched_entity *entity)
> -{
> -	struct drm_sched_job *s_job;
> -
> -	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -	if (!s_job)
> -		return false;
> -
> -	/* If a job exceeds the credit limit, truncate it to the credit limit
> -	 * itself to guarantee forward progress.
> -	 */
> -	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
> -		     "Jobs may not exceed the credit limit, truncate.\n"))
> -		s_job->credits = sched->credit_limit;
> -
> -	return drm_sched_available_credits(sched) >= s_job->credits;
> -}
> -
>   /**
>    * drm_sched_run_job_queue - enqueue run-job work
>    * @sched: scheduler instance
> @@ -174,6 +147,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   
>   	atomic_sub(s_job->credits, &sched->credit_count);
>   	atomic_dec(sched->score);
> +	drm_sched_run_job_queue(sched);
>   
>   	trace_drm_sched_process_job(s_fence);
>   
> @@ -941,7 +915,6 @@ static void drm_sched_free_job_work(struct work_struct *w)
>   		sched->ops->free_job(job);
>   
>   	drm_sched_run_free_queue(sched);
> -	drm_sched_run_job_queue(sched);

Two hunks above are somewhat of a rebasing artifact since I've been 
re-ordering patches and cherry-picking from some different 
implementations for the public post. Nevertheless, there is likely 
something broken with this patch in terms of missing to re-queue the 
worker in some cases which I need to get to the bottom of. It's odd 
though.. I would have thought re-queue triggers of 1) first job 
submitted, 2) dependency resolved and 3) job completed should have been 
enough but I am obviously missing somthing subtle.

Regards,

Tvrtko

>   }
>   
>   /**
> @@ -953,54 +926,71 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   {
>   	struct drm_gpu_scheduler *sched =
>   		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	u32 job_credits, submitted_credits = 0;
>   	struct drm_sched_entity *entity;
> -	struct dma_fence *fence;
> -	struct drm_sched_fence *s_fence;
>   	struct drm_sched_job *sched_job;
> -	int r;
> +	struct dma_fence *fence;
>   
>   	if (READ_ONCE(sched->pause_submit))
>   		return;
>   
> -	/* Find entity with a ready job */
> -	entity = drm_sched_rq_select_entity(sched, sched->rq);
> -	if (IS_ERR_OR_NULL(entity))
> -		return;	/* No more work */
> +	for (;;) {
> +		/* Find entity with a ready job */
> +		entity = drm_sched_rq_select_entity(sched, sched->rq);
> +		if (!entity)
> +			break;	/* No more work */
>   
> -	sched_job = drm_sched_entity_pop_job(entity);
> -	if (!sched_job) {
> +		/*
> +		 * If a job exceeds the credit limit truncate it to guarantee
> +		 * forward progress.
> +		 */
> +		sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +		job_credits = sched_job->credits;
> +		if (drm_WARN_ONCE(sched, job_credits > sched->credit_limit,
> +				  "Jobs may not exceed the credit limit, truncating.\n"))
> +			job_credits = sched_job->credits = sched->credit_limit;
> +
> +		if (job_credits > drm_sched_available_credits(sched)) {
> +			complete_all(&entity->entity_idle);
> +			break;
> +		}
> +
> +		sched_job = drm_sched_entity_pop_job(entity);
>   		complete_all(&entity->entity_idle);
> -		drm_sched_run_job_queue(sched);
> -		return;
> -	}
> +		if (!sched_job) {
> +			/* Top entity is not yet runnable after all */
> +			continue;
> +		}
>   
> -	s_fence = sched_job->s_fence;
> +		drm_sched_job_begin(sched_job);
> +		trace_drm_run_job(sched_job, entity);
> +		submitted_credits += job_credits;
> +		atomic_add(job_credits, &sched->credit_count);
>   
> -	atomic_add(sched_job->credits, &sched->credit_count);
> -	drm_sched_job_begin(sched_job);
> +		fence = sched->ops->run_job(sched_job);
> +		drm_sched_fence_scheduled(sched_job->s_fence, fence);
>   
> -	trace_drm_run_job(sched_job, entity);
> -	fence = sched->ops->run_job(sched_job);
> -	complete_all(&entity->entity_idle);
> -	drm_sched_fence_scheduled(s_fence, fence);
> +		if (!IS_ERR_OR_NULL(fence)) {
> +			int r;
>   
> -	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> +			/* Drop for original kref_init of the fence */
> +			dma_fence_put(fence);
>   
> -		r = dma_fence_add_callback(fence, &sched_job->cb,
> -					   drm_sched_job_done_cb);
> -		if (r == -ENOENT)
> -			drm_sched_job_done(sched_job, fence->error);
> -		else if (r)
> -			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> -	} else {
> -		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -				   PTR_ERR(fence) : 0);
> +			r = dma_fence_add_callback(fence, &sched_job->cb,
> +						   drm_sched_job_done_cb);
> +			if (r == -ENOENT)
> +				drm_sched_job_done(sched_job, fence->error);
> +			else if (r)
> +				DRM_DEV_ERROR(sched->dev,
> +					      "fence add callback failed (%d)\n", r);
> +		} else {
> +			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +						      PTR_ERR(fence) : 0);
> +		}
>   	}
>   
> -	wake_up(&sched->job_scheduled);
> -	drm_sched_run_job_queue(sched);
> +	if (submitted_credits)
> +		wake_up(&sched->job_scheduled);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
> index 0b7a2b8b48db..1a454384ab25 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -156,9 +156,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>    *
>    * Find oldest waiting ready entity.
>    *
> - * Return an entity if one is found; return an error-pointer (!NULL) if an
> - * entity was ready, but the scheduler had insufficient credits to accommodate
> - * its job; return NULL, if no ready entity was found.
> + * Return an entity if one is found or NULL if no ready entity was found.
>    */
>   struct drm_sched_entity *
>   drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> @@ -170,16 +168,13 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>   	spin_lock(&rq->lock);
>   	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> -		if (drm_sched_entity_is_ready(entity)) {
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				entity = ERR_PTR(-ENOSPC);
> -				break;
> -			}
> -
> -			reinit_completion(&entity->entity_idle);
> -			break;
> +		if (!drm_sched_entity_is_ready(entity)) {
> +			entity = NULL;
> +			continue;
>   		}
> -		entity = NULL;
> +
> +		reinit_completion(&entity->entity_idle);
> +		break;
>   	}
>   	spin_unlock(&rq->lock);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 93f6fcfe3ba0..85f3a0d5a7be 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -544,9 +544,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   
> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -			 struct drm_sched_entity *entity);
> -
>   int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       u32 credits, void *owner);
