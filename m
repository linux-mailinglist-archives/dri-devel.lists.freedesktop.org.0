Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F86A6D642
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 09:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34FB10E231;
	Mon, 24 Mar 2025 08:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YPyT9thJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B89D10E22F;
 Mon, 24 Mar 2025 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iKgYceNolSW3hXB/C9SsHi2dsfWrw6srb0BhcwNcXN0=; b=YPyT9thJgzC4YVR3r9Ymrcth3e
 TZIZpmKHxrQCmmtm2nR5qrP6kk31n3YxfzrCF2RfiSKpSjDyI8SilO6gkI/8lbmA5jArI6NvOBQBM
 Eb1LpALkiooyMCdiKK9j7JGlc0tVU5d4pIj/fdfkz5vbcZEAdz1pOmrUo13j+6RQB9xr2ZgvWhv+v
 EKbTSwvzaewjoO9QPqSteoo+Ee6o+brcamBw+XbkrrEQcbhHm/gyZ+pS+fwzlT5pjvLhEet2gpqRG
 v2C3Uva03hOQk+qXFve7sWuyQyjWjqRhjFYxtMPgBwEFDD4xqhNRAfUrrx789sTatXGLS9zPaR4mb
 da/8uIhg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twdHl-005cyw-Bw; Mon, 24 Mar 2025 09:35:53 +0100
Message-ID: <b04655ab-a165-48d2-8b3e-2557025c5101@igalia.com>
Date: Mon, 24 Mar 2025 08:35:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250321155852.15162-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250321155852.15162-1-christian.koenig@amd.com>
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


On 21/03/2025 15:58, Christian König wrote:
> Sometimes drivers need to be able to submit multiple jobs which depend on
> each other to different schedulers at the same time, but using
> drm_sched_job_add_dependency() can't fail any more after the first job is
> initialized.
> 
> This function preallocate memory for dependency slots so that no ENOMEM
> can come later while adding dependencies.
> 
> v2: rework implementation an documentation
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 44 ++++++++++++++++++++++++--
>   include/drm/gpu_scheduler.h            |  2 ++
>   2 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4d4219fbe49d..ee3701f346b2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -852,6 +852,39 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   }
>   EXPORT_SYMBOL(drm_sched_job_arm);
>   
> +/**
> + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding dependencies
> + * @job: scheduler job where dependencies will be added
> + * @num_deps: number of dependencies to preallocate slots for
> +  *
> + * Sometimes drivers need to be able to submit multiple jobs which depend on
> + * each other to different schedulers at the same time, but using
> + * drm_sched_job_add_dependency() can't fail any more after the first job is
> + * initialized.
> + *
> + * This function preallocate memory for dependency slots so that no ENOMEM can
> + * come later while adding dependencies.
> + *
> + * Return:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
> +					    unsigned int num_deps)
> +{
> +	u32 id = 0;
> +	int ret;
> +
> +	while (num_deps--) {
> +		ret = xa_alloc(&job->dependencies, &id, XA_ZERO_ENTRY,
> +			       xa_limit_32b, GFP_KERNEL);
> +		if (ret != 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
> +
>   /**
>    * drm_sched_job_add_dependency - adds the fence as a job dependency
>    * @job: scheduler job to add the dependencies to
> @@ -878,10 +911,15 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   	 * engines involved, rather than the number of BOs.
>   	 */
>   	xa_for_each(&job->dependencies, index, entry) {
> -		if (entry->context != fence->context)
> +		if (xa_is_zero(entry)) {

If xa_for_each shows them I think we also need to skip them in 
drm_sched_job_dependency() and drm_sched_job_cleanup(). Or remove the 
unused ones at arm time. Hm, we could also put a noisy fail if 
add_dependency allocates after a job is armed. (I can imagine a few unit 
tests for this once we merge them.)

Regards,

Tvrtko

> +			/*
> +			 * Reserved entries must not alloc memory, but let's
> +			 * use GFP_ATOMIC just to be on the defensive side.
> +			*/
> +			xa_store(&job->dependencies, index, fence, GFP_ATOMIC);
> +		} else if (entry->context != fence->context) {
>   			continue;
> -
> -		if (dma_fence_is_later(fence, entry)) {
> +		} else if (dma_fence_is_later(fence, entry)) {
>   			dma_fence_put(entry);
>   			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
>   		} else {
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

