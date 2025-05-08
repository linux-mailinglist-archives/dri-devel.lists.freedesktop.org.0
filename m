Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B89AAFE2C
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 17:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF19610E930;
	Thu,  8 May 2025 15:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A42FF10E930;
 Thu,  8 May 2025 15:04:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91085106F;
 Thu,  8 May 2025 08:04:20 -0700 (PDT)
Received: from [10.57.21.179] (unknown [10.57.21.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB1B3F58B;
 Thu,  8 May 2025 08:04:27 -0700 (PDT)
Message-ID: <6e2fec36-8631-4ba6-8b66-d8b7c8cba5f6@arm.com>
Date: Thu, 8 May 2025 16:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/panfrost: Use DRM_GPU_SCHED_STAT_RUNNING to skip
 the reset
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-8-ed0d6701a3fe@igalia.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250503-sched-skip-reset-v1-8-ed0d6701a3fe@igalia.com>
Content-Type: text/plain; charset=UTF-8
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

On 03/05/2025 21:59, Maíra Canal wrote:
> Panfrost can skip the reset if TDR has fired before the IRQ handler.
> Currently, since Panfrost doesn't take any action on these scenarios, the
> job is being leaked, considering that `free_job()` won't be called.
> 
> To avoid such leaks, use the DRM_GPU_SCHED_STAT_RUNNING status to skip the
> reset and rearm the timer.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 5657106c2f7d0a0ca6162850767f58f3200cce13..2948d5c02115544a0e0babffd850f1506152849d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -751,11 +751,11 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  	int js = panfrost_job_get_slot(job);
>  
>  	/*
> -	 * If the GPU managed to complete this jobs fence, the timeout is
> -	 * spurious. Bail out.
> +	 * If the GPU managed to complete this jobs fence, TDR has fired before
> +	 * IRQ and the timeout is spurious. Bail out.
>  	 */
>  	if (dma_fence_is_signaled(job->done_fence))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RUNNING;
>  
>  	/*
>  	 * Panfrost IRQ handler may take a long time to process an interrupt
> @@ -770,7 +770,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  
>  	if (dma_fence_is_signaled(job->done_fence)) {
>  		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_RUNNING;
>  	}
>  
>  	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
> 

