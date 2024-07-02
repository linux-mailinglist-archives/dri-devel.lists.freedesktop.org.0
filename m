Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE389237B3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B395610E572;
	Tue,  2 Jul 2024 08:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="zaIl/96K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E03810E590
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 08:42:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so3999992e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1719909750; x=1720514550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ai+riX0PBESc1r6GcAPXKRZkm5hUuFbi8mEDu0ieK4=;
 b=zaIl/96KGolRs7n4GBSsiocIL7H0Bg72cF1Eq9hJniuFmTxU7yEbZ7xrEx62rKBG5h
 MoW+HRJwzvxV4Vb7MGIewqArwGlLxaFDXAQc3HEPXAsUiWn5+A0SX6PQ/ezYt73fvpDS
 gpIW2oA1XwDlCBI0yDBnUP8JpJN161DBsge8fRszOQyr9KStwyP2gxVARrfWG1atk7Tr
 eAdyv7ta/AYKOJQmMsxaTTBhu/mq/pLxkHxKDh7jmiuyke4qLVlKAesQtsWsKonb9QFW
 h9+JAuu22XZIdVCbYmJbLM9p4Z9+qGl6gf5mqcqEBERiOkaFg2pdEPr2ihQX23cZfReD
 EJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719909750; x=1720514550;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ai+riX0PBESc1r6GcAPXKRZkm5hUuFbi8mEDu0ieK4=;
 b=ieIf1Mr/hnTmX0UZmsAPjkTfaa4ExcoEaW9VULW7tKkxvDMYukbmLv8c20Xvj4pALg
 bQKZOSKtzRKIBab20sJDf8fj8hBS7WKop2Nw7Bcwl03mFrfdv2wa2e8i9MUtJJjs9+Zx
 +2HCorosrAQUjDZPo8DktWO+9SJdGybcRN2hItQYH2GqIsaBl8UDOC7pFIklGsInGXSZ
 hZAmhY9YIaareZEGeEqDWvbL9GGbZ3WH49jMCXdj+lPLL8W99RX7aGkRDgaX8Unc8mRf
 yx5VIF/zxTUKxiq3RRAeXyVq97qIwbs/pQyN8BQY9NhmzhLDvhAzVkajLJVnUgqNUUDm
 G5yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBE/GVH6UTYJpJq0CGIoqGxLgqhmkpk1FEfSzabeHRfSV7o2QpKWgbJROu5zXnx+aHR/dwiDtB7I1QL9XcBwIDQJFmCLqmGR1GG1ZGS6pH
X-Gm-Message-State: AOJu0YzZWegiE6p2yHIp41DvYeLXcfttb55lcwklDtVU8SH3cVgeJVf6
 O9c0F/Cl8XVIBRjIP9wo+bYRzgTrJt8ySu+2r1aGxLpEku4qoBcDhi40rhl2+Hw=
X-Google-Smtp-Source: AGHT+IFbsKujg/8+yDydhEZuDkXroRGvwAGQxgZ8lekYvW0VQiL0USt7T8NPvoP3k3HWTX58Dv77Sg==
X-Received: by 2002:a05:6512:318c:b0:52c:9f24:a253 with SMTP id
 2adb3069b0e04-52e827528eemr6098332e87.64.1719909749910; 
 Tue, 02 Jul 2024 01:42:29 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3cff9sm186798525e9.3.2024.07.02.01.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 01:42:29 -0700 (PDT)
Message-ID: <cf3beee0-14a2-4ad8-8c3d-7ba8a09c6608@ursulin.net>
Date: Tue, 2 Jul 2024 09:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/scheduler: implement hardware time accounting
To: Lucas Stach <l.stach@pengutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
References: <20240701171447.3823888-1-l.stach@pengutronix.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240701171447.3823888-1-l.stach@pengutronix.de>
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


Hi,

I few questions below.

On 01/07/2024 18:14, Lucas Stach wrote:
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> 
> Multiple drivers came up with the requirement to measure how
> much runtime each entity accumulated on the HW.
> 
> A previous attempt of accounting this had to be reverted because
> HW submissions can have a lifetime exceeding that of the entity
> originally issuing them.
> 
> Amdgpu on the other hand solves this task by keeping track of
> all the submissions and calculating how much time they have used
> on demand.
> 
> Move this approach over into the scheduler to provide an easy to
> use interface for all drivers.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> v2:
> - rebase to v6.10-rc1
> - fix for non-power-of-two number of HW submission
> - add comment explaining the logic behind the fence tracking array
> - rename some function and fix documentation
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 82 +++++++++++++++++++++++-
>   drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++++
>   include/drm/gpu_scheduler.h              | 31 +++++++++
>   3 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..d678d0b9b29e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -62,7 +62,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  unsigned int num_sched_list,
>   			  atomic_t *guilty)
>   {
> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> +	unsigned int i, num_submissions = 0;
> +
> +	if (!entity || !sched_list)
>   		return -EINVAL;
>   
>   	memset(entity, 0, sizeof(struct drm_sched_entity));
> @@ -98,6 +100,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>   		}
>   		entity->rq = sched_list[0]->sched_rq[entity->priority];
> +
> +		for (i = 0; i < num_sched_list; ++i) {
> +			num_submissions = max(num_submissions,
> +					      sched_list[i]->credit_limit);
> +		}

Does this work (in concept and naming) for all drivers if introduction 
of credits broke the 1:1 between jobs and hw "ring" capacity?

How big is the array for different drivers?

>   	}
>   
>   	init_completion(&entity->entity_idle);
> @@ -110,11 +117,52 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   
>   	atomic_set(&entity->fence_seq, 0);
>   	entity->fence_context = dma_fence_context_alloc(2);
> +	spin_lock_init(&entity->accounting_lock);
> +
> +	if (!num_submissions)
> +		return 0;
> +
> +	entity->max_hw_submissions = num_submissions;
> +	entity->hw_submissions = kcalloc(num_submissions, sizeof(void *),
> +					 GFP_KERNEL);
> +	if (!entity->hw_submissions)
> +		return -ENOMEM;
>   
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_sched_entity_init);
>   
> +/**
> + * drm_sched_entity_time_spent - Accumulated HW runtime used by this entity
> + * @entity: scheduler entity to check
> + *
> + * Get the current accumulated HW runtime used by all submissions made through
> + * this entity.
> + */
> +ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity)
> +{
> +	ktime_t result;
> +	unsigned int i;
> +
> +	if (!entity->max_hw_submissions)
> +		return ns_to_ktime(0);
> +
> +	spin_lock(&entity->accounting_lock);
> +	result = entity->hw_time_used;
> +	for (i = 0; i < entity->max_hw_submissions; ++i) {
> +		struct drm_sched_fence *fence = entity->hw_submissions[i];
> +
> +		if (!fence)
> +			continue;
> +
> +		result = ktime_add(result, drm_sched_fence_get_runtime(fence));

Does this end up counting from when jobs have been submitted to the hw 
backend and may not be actually executing?

Say if a driver configures a backend N deep and is filled with N jobs, 
while in actuality they are executed sequentially one at a time, the 
time as reported here would over-account by some series such as 
(job[0].finish - job[0].submit) + ... + (job[N].finish - job[N].submit)?

Or in other words if one submits N jobs to a ring serving an 1-wide hw 
backend, will we see "N*100%" utilisation instead of "100%" if sampling 
while first job is still executing, the rest queued behind it?

Regards,

Tvrtko

> +	}
> +	spin_unlock(&entity->accounting_lock);
> +
> +	return result;
> +}
> +EXPORT_SYMBOL(drm_sched_entity_time_spent);
> +
>   /**
>    * drm_sched_entity_modify_sched - Modify sched of an entity
>    * @entity: scheduler entity to init
> @@ -326,6 +374,8 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
>    */
>   void drm_sched_entity_fini(struct drm_sched_entity *entity)
>   {
> +	unsigned int i;
> +
>   	/*
>   	 * If consumption of existing IBs wasn't completed. Forcefully remove
>   	 * them here. Also makes sure that the scheduler won't touch this entity
> @@ -341,6 +391,9 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
>   
>   	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>   	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> +	for (i = 0; i < entity->max_hw_submissions; ++i)
> +		dma_fence_put(&entity->hw_submissions[i]->scheduled);
> +	kfree(entity->hw_submissions);
>   }
>   EXPORT_SYMBOL(drm_sched_entity_fini);
>   
> @@ -522,6 +575,33 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   	 */
>   	sched_job->entity = NULL;
>   
> +	if (entity->max_hw_submissions) {
> +		struct drm_sched_fence *fence = sched_job->s_fence;
> +		unsigned int idx = fence->scheduled.seqno;
> +
> +		dma_fence_get(&fence->scheduled);
> +		idx %= entity->max_hw_submissions;
> +
> +		spin_lock(&entity->accounting_lock);
> +		/*
> +		 * The fence seqno is dense and monotonically increasing. By
> +		 * cycling through a array sized to match the maximum number of
> +		 * submissions queued in the HW we can be sure that once we need
> +		 * to reuse a slot the fence stored in this slot refers to a
> +		 * retired submission and we can safely sum up the accumulated
> +		 * runtime and dispose the fence.
> +		 */
> +		swap(fence, entity->hw_submissions[idx]);
> +		if (fence) {
> +			ktime_t runtime = drm_sched_fence_get_runtime(fence);
> +
> +			entity->hw_time_used = ktime_add(entity->hw_time_used,
> +							 runtime);
> +			dma_fence_put(&fence->scheduled);
> +		}
> +		spin_unlock(&entity->accounting_lock);
> +	}
> +
>   	return sched_job;
>   }
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 0f35f009b9d3..55981ada1829 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -82,6 +82,25 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
>   	dma_fence_signal(&fence->finished);
>   }
>   
> +/**
> + * drm_sched_fence_get_runtime - accumulated runtime on HW
> + * @fence: fence
> + *
> + * Calculate how much runtime this fence has accumulated on the HW.
> + */
> +ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence)
> +{
> +	/* When the fence is not scheduled, it can't have accumulated runtime */
> +	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->scheduled.flags))
> +		return ns_to_ktime(0);
> +
> +	/* When it is still running, calculate runtime until now */
> +	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->finished.flags))
> +		return ktime_sub(ktime_get(), fence->scheduled.timestamp);
> +
> +	return ktime_sub(fence->finished.timestamp, fence->scheduled.timestamp);
> +}
> +
>   static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>   {
>   	return "drm_sched";
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..52bcff324a92 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -238,6 +238,35 @@ struct drm_sched_entity {
>   	 */
>   	struct rb_node			rb_tree_node;
>   
> +	/**
> +	 * @accounting_lock:
> +	 *
> +	 * Protects the array of fences tracking the in-flight HW submissions
> +	 * and the accumulator counter.
> +	 */
> +	spinlock_t			accounting_lock;
> +
> +	/**
> +	 * @hw_time_used:
> +	 *
> +	 * How much HW runtime has been accumulated by retired submissions
> +	 * from this entity.
> +	 */
> +	ktime_t				hw_time_used;
> +
> +	/**
> +	 * @max_hw_submissions:
> +	 *
> +	 * Maximum number of submissions queued in the HW.
> +	 */
> +	unsigned int			max_hw_submissions;
> +
> +	/**
> +	 * @hw_submissions:
> +	 *
> +	 * Scheduler fences of the HW submissions in flight.
> +	 */
> +	struct drm_sched_fence		**hw_submissions;
>   };
>   
>   /**
> @@ -600,6 +629,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  struct drm_gpu_scheduler **sched_list,
>   			  unsigned int num_sched_list,
>   			  atomic_t *guilty);
> +ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity);
>   long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>   void drm_sched_entity_fini(struct drm_sched_entity *entity);
>   void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> @@ -620,6 +650,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence);
>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
>   			       struct dma_fence *parent);
>   void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
> +ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence);
>   
>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
> 
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
