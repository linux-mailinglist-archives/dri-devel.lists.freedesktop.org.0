Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5FA6D659
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 09:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3695F10E24F;
	Mon, 24 Mar 2025 08:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="C4Xsi1aY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B3310E241;
 Mon, 24 Mar 2025 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S7URmGSlydRRr2eWwn4I5GzTwO2XmaOge2tvKsWWfr0=; b=C4Xsi1aYxsAAnxs+Toi3i1QIqp
 ppDPcvqXmD59D+Sz/b5zSSOltqjc4LP8XvVJxUVEHjMUzx3qEjoP8UKcW2I5NAHECFeTHcGpkXGne
 A6lABzj2YpcYq+CYEHjaWGy3uwpQjebWAYDvCmKbiaVLSa28wfdh9UYUdfMaxQk2hXhgfHgf7oe9M
 x6LnMnS6/Evhuu5fdt2nycNNKGoweV2c0t2ynGMH7FDO9XzjaXdbwGrMX1t1aAzx6kougyh85zC/i
 ZmUhAKGvVkDLW+VZv9cn7DCP4bND03+rKtWM1pH0Ty8myC6/Kxvx4jyknNycUkp6CJ13KkkB3VecY
 VEFxOKPA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twdJw-005d0g-Eu; Mon, 24 Mar 2025 09:38:08 +0100
Message-ID: <e0c74c37-2ee5-4cb1-853e-d69f3ab2aee6@igalia.com>
Date: Mon, 24 Mar 2025 08:38:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: fix gang submission error handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250321155852.15162-1-christian.koenig@amd.com>
 <20250321155852.15162-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250321155852.15162-2-christian.koenig@amd.com>
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
> For the unlikely case that we ran into an ENOMEM while fixing up the gang
> submission dependencies we can't clean up any more since the gang
> members are already armed.
> 
> Fix this by using pre-allocated dependency slots and re-ordering the
> code, also fix a double unref since the fence reference is also dropped
> on error.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 57 +++++++++++++++-----------
>   1 file changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 5cc5f59e3018..25e7f7d356d7 100644
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
> @@ -1329,6 +1314,30 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
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
> +		fence = dma_fence_get(&p->jobs[i]->base.s_fence->scheduled);
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

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

