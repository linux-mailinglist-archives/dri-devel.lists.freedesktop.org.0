Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E526A6745F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696410E31D;
	Tue, 18 Mar 2025 12:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gvhYiP8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7555410E31D;
 Tue, 18 Mar 2025 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJBv//AenJLf+JjPWebclSaFm6WdDsxe+/yWwYJ2xVw=; b=gvhYiP8jCxdeDMNp4aexQLmCVF
 1N7KnL+qe4GOOjz0uVdghTPMqvX9ANLVFohL0iZha7Hf5H3P2tbODWmyhBcJgSuXufrRyFOUULuy4
 QJK5IhT+xVyCuPU6nrDsB3HipFvd1FfInRi1J//SLkpZJHMa1NaIgOQfU7/BunWcK9RVcKy6Oa6rM
 9h2r1raH6o4Bo/T+s68k7bU4EoqIh61vTW8JyQYtav3JtNsoHIb53hmIb6FlZv1SJt+TBCTwKutqH
 wgzRZBo0EKOi10kYtQgk80CY6m5QcWdTu+a+BF3loxY/PXXuY+ngjcYJgHPSzxHAl9W2siSrMct68
 bvpbhl5Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tuWTY-002jMF-Op; Tue, 18 Mar 2025 13:55:20 +0100
Message-ID: <a096bf20-4f31-418f-b14a-15c91944c33c@igalia.com>
Date: Tue, 18 Mar 2025 12:55:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: fix gang submission error handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250318120313.19099-3-christian.koenig@amd.com>
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
> For the unlikely case that we ran into an ENOMEM while fixing up the gang
> submission dependencies we can't clean up any more since the gang
> members are already armed.
> 
> Fix this by using pre-allocated dependency slots and re-ordering the
> code.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 58 +++++++++++++++-----------
>   1 file changed, 34 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 5cc5f59e3018..770005c8e41f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1285,36 +1285,21 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	uint64_t seq;
>   	int r;
>   
> -	for (i = 0; i < p->gang_size; ++i)
> -		drm_sched_job_arm(&p->jobs[i]->base);
> -
> -	for (i = 0; i < p->gang_size; ++i) {
> -		struct dma_fence *fence;
> -
> -		if (p->jobs[i] == leader)
> -			continue;
> -
> -		fence = &p->jobs[i]->base.s_fence->scheduled;
> -		dma_fence_get(fence);
> -		r = drm_sched_job_add_dependency(&leader->base, fence);
> -		if (r) {
> -			dma_fence_put(fence);

Ouch, was this broken too - one put too many since 
drm_sched_job_add_dependency consumes the reference in the failing case? 
If it looks like that to you too, see if you think it is worth to split 
into two patches, or as minimum mention in the commit message.

Otherwise LGTM.

Regards,

Tvrtko

> -			return r;
> -		}
> -	}
> -
> -	if (p->gang_size > 1) {
> -		for (i = 0; i < p->gang_size; ++i)
> -			amdgpu_job_set_gang_leader(p->jobs[i], leader);
> -	}
> +	/* Preallocate the memory for the gang dependencies */
> +	r = drm_sched_job_prealloc_dependency_slots(&leader->base,
> +						    p->gang_size - 1);
> +	if (r)
> +		return r;
>   
> -	/* No memory allocation is allowed while holding the notifier lock.
> +	/*
> +	 * No memory allocation is allowed while holding the notifier lock.
>   	 * The lock is held until amdgpu_cs_submit is finished and fence is
>   	 * added to BOs.
>   	 */
>   	mutex_lock(&p->adev->notifier_lock);
>   
> -	/* If userptr are invalidated after amdgpu_cs_parser_bos(), return
> +	/*
> +	 * If userptr are invalidated after amdgpu_cs_parser_bos(), return
>   	 * -EAGAIN, drmIoctl in libdrm will restart the amdgpu_cs_ioctl.
>   	 */
>   	r = 0;
> @@ -1329,6 +1314,31 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   		return r;
>   	}
>   
> +	for (i = 0; i < p->gang_size; ++i)
> +		drm_sched_job_arm(&p->jobs[i]->base);
> +
> +	for (i = 0; i < p->gang_size; ++i) {
> +		struct dma_fence *fence;
> +
> +		if (p->jobs[i] == leader)
> +			continue;
> +
> +		fence = &p->jobs[i]->base.s_fence->scheduled;
> +		dma_fence_get(fence);
> +		r = drm_sched_job_add_dependency(&leader->base, fence);
> +		/*
> +		 * We can't abort here with an error any more, but we should
> +		 * also never run into an error since the slots for the
> +		 * dependency fences are preallocated.
> +		 */
> +		WARN_ON(r);
> +	}
> +
> +	if (p->gang_size > 1) {
> +		for (i = 0; i < p->gang_size; ++i)
> +			amdgpu_job_set_gang_leader(p->jobs[i], leader);
> +	}
> +
>   	p->fence = dma_fence_get(&leader->base.s_fence->finished);
>   	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
>   

