Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AC0A67479
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 14:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B65B10E048;
	Tue, 18 Mar 2025 13:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S05Ts4i2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AAF10E048;
 Tue, 18 Mar 2025 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CBpBlLdqbta5dGHx8zSfoA8a9KcWNsF2KUWZpINQ6Co=; b=S05Ts4i2VD4pRPKTNfRUbh4afF
 mBP/S3okfCsIKzEBKKKSvsAB1gDOhr14rSQBo4EA55jGFooiIDgab1oCWTOk4dLjz/7wMhmt46lml
 J0/MNuM8H7KXcc0zjysqPOMWEOiSJFp7+fOJRn83Pfc6PUbPh7FUSN4OqHDVUQK7BLIVtIYvcnddt
 tUcL92i7BSHfLZGXD6++vsKUe2s7N0DerrF9zhUQJSShTEyVLbz30Xc/uIGiHn/mx/SjHN+cHhAYJ
 IMNsJce9kxgeCKPrOBkv6+6R5t4mVaUYaXBI4uo45a5EipKE3K7VfguvexlYTJxgVwqFgZsp+Ns0M
 CPv+KLMg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tuWbw-002jan-9E; Tue, 18 Mar 2025 14:04:00 +0100
Message-ID: <c394b28e-0cb1-4e91-a6cb-e53f6f2b8cc0@igalia.com>
Date: Tue, 18 Mar 2025 13:03:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250318120313.19099-2-christian.koenig@amd.com>
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


On 18/03/2025 12:03, Christian König wrote:
> The problem is that drivers sometimes need to add dependencies without
> allocating any memory.
> 
> Add a function which preallocates slots by inserting signaled stub fences
> into the dependency array.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 41 ++++++++++++++++++++++++--
>   include/drm/gpu_scheduler.h            |  2 ++
>   2 files changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4d4219fbe49d..2085eea89513 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -852,6 +852,38 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   }
>   EXPORT_SYMBOL(drm_sched_job_arm);
>   
> +/**
> + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding dependencies
> + * @job: scheduler job where dependencies will be added
> + * @num_deps: number of dependencies to preallocate slots for
> + *
> + * Preallocate memory so that no ENOMEM can come later while adding
> + * dependencies.
> + *
> + * Return:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
> +					    unsigned int num_deps)
> +{
> +	struct dma_fence *fence;
> +	u32 id = 0;
> +	int ret;
> +
> +	while (num_deps--) {
> +		fence = dma_fence_get_stub();
> +		ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> +			       GFP_KERNEL);
> +		if (ret != 0) {
> +			dma_fence_put(fence);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
> +
>   /**
>    * drm_sched_job_add_dependency - adds the fence as a job dependency
>    * @job: scheduler job to add the dependencies to
> @@ -878,10 +910,12 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   	 * engines involved, rather than the number of BOs.
>   	 */
>   	xa_for_each(&job->dependencies, index, entry) {
> -		if (entry->context != fence->context)
> +		bool signaled = dma_fence_is_signaled(entry);

I so dislike dma_fence_is_signaled() due it leaking the fence signaling 
annotations to unsuspecting callers. I hope it doesn't mark someone's 
lock/mutex as the critical signalling path..

Regards,

Tvrtko

> +
> +		if (!signaled && entry->context != fence->context)
>   			continue;
>   
> -		if (dma_fence_is_later(fence, entry)) {
> +		if (signaled || dma_fence_is_later(fence, entry)) {
>   			dma_fence_put(entry);
>   			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
>   		} else {
> @@ -890,7 +924,8 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   		return 0;
>   	}
>   
> -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> +		       GFP_KERNEL);
>   	if (ret != 0)
>   		dma_fence_put(fence);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb..916e820b27ff 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		       u32 credits, void *owner);
>   void drm_sched_job_arm(struct drm_sched_job *job);
>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
> +					    unsigned int num_deps);
>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence);
>   int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,

