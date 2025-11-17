Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BFC6488D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF4510E0B6;
	Mon, 17 Nov 2025 14:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3219B10E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:02:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7339FEC;
 Mon, 17 Nov 2025 06:02:31 -0800 (PST)
Received: from [10.57.69.30] (unknown [10.57.69.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B0C63F740;
 Mon, 17 Nov 2025 06:02:37 -0800 (PST)
Message-ID: <e6fbbfa1-789f-46bf-9591-b19ff954b69a@arm.com>
Date: Mon, 17 Nov 2025 14:02:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/panthor: Recover from
 panthor_gpu_flush_caches() failures
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
 <20251113103953.1519935-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251113103953.1519935-4-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 13/11/2025 10:39, Boris Brezillon wrote:
> We have seen a few cases where the whole memory subsystem is blocked
> and flush operations never complete. When that happens, we want to:
> 
> - schedule a reset, so we can recover from this situation
> - in the reset path, we need to reset the pending_reqs so we can send
>   new commands after the reset
> - if more panthor_gpu_flush_caches() operations are queued after
>   the timeout, we skip them and return -EIO directly to avoid needless
>   waits (the memory block won't miraculously work again)

You've removed the WARN from this last case. Is this intentional? I
agree the recovery is better, but I don't think we expect this to happen
- so it's pointing to something else being broken.

> 
> v2:
> - New patch
> 
> Fixes: 5cd894e258c4 ("drm/panthor: Add the GPU logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index eda670229184..abd2fde04da9 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -283,38 +283,42 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
>  int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>  			     u32 l2, u32 lsc, u32 other)
>  {
> -	bool timedout = false;
>  	unsigned long flags;
> +	int ret = 0;
>  
>  	/* Serialize cache flush operations. */
>  	guard(mutex)(&ptdev->gpu->cache_flush_lock);
>  
>  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> -	if (!drm_WARN_ON(&ptdev->base,
> -			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
> +	if (!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
>  		ptdev->gpu->pending_reqs |= GPU_IRQ_CLEAN_CACHES_COMPLETED;
>  		gpu_write(ptdev, GPU_CMD, GPU_FLUSH_CACHES(l2, lsc, other));
> +	} else {
> +		ret = -EIO;
>  	}
>  	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
>  
> +	if (ret)
> +		return ret;
> +
>  	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
>  				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
>  				msecs_to_jiffies(100))) {
>  		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
>  		if ((ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
>  		    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_CLEAN_CACHES_COMPLETED))
> -			timedout = true;
> +			ret = -ETIMEDOUT;
>  		else
>  			ptdev->gpu->pending_reqs &= ~GPU_IRQ_CLEAN_CACHES_COMPLETED;
>  		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
>  	}
>  
> -	if (timedout) {
> +	if (ret) {
> +		panthor_device_schedule_reset(ptdev);
>  		drm_err(&ptdev->base, "Flush caches timeout");
> -		return -ETIMEDOUT;
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /**
> @@ -354,6 +358,7 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
>  		return -ETIMEDOUT;
>  	}
>  
> +	ptdev->gpu->pending_reqs = 0;
>  	return 0;
>  }
>  

