Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F299AAC2B5
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 13:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420A810E665;
	Tue,  6 May 2025 11:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nhNaH0bH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E5910E65E;
 Tue,  6 May 2025 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jWax/7UjKOTXSjxDDCNFk6s+HaIdKBbx9TwvhLVsDn4=; b=nhNaH0bHa0YFAC4xJCXjsmGA5n
 +h/G0Ng9RWI2g+wlQi5Ys3+r1gvqVugqAqSkBe2t5pm7cEqVFb5F4cgf6WTvFKu8bVbL4L4UYLDHU
 dOjnNTRHO+05QW34blajjQC515+0ahSlWIK6RvntxPLws9DMxmzsYhnDfA39icD23uyw/soy6zaQv
 wsYeyLEWoL/rTIFxmx5b+9j6DGXoZ8osmjQd/nM8taxGcn17DBlPpsEXgVSzBj/EXGqbCDfKwYG4c
 1i/HRebBMkm4ZNn3Oz/DfROO0VeRCx5Z9NjJvVYNObTJhFCaj1Dkk0aqBf1DAwOGq3YCvIq+dWQUT
 01rCGXrQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCGTO-004Anm-8a; Tue, 06 May 2025 13:32:03 +0200
Message-ID: <f48aa17a-3135-4480-b396-2e2077a7d2aa@igalia.com>
Date: Tue, 6 May 2025 12:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
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


On 03/05/2025 21:59, Maíra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't hung;
> instead, a job may still be running, and there may be no valid reason to
> reset the hardware. This can occur in two situations:
> 
>    1. The GPU exposes some mechanism that ensures the GPU is still making
>       progress. By checking this mechanism, we can safely skip the reset,
>       rearm the timeout, and allow the job to continue running until
>       completion. This is the case for v3d and Etnaviv.
>    2. TDR has fired before the IRQ that signals the fence. Consequently,
>       the job actually finishes, but it triggers a timeout before signaling
>       the completion fence.
> 
> These two scenarios are problematic because we remove the job from the
> `sched->pending_list` before calling `sched->ops->timedout_job()`. This
> means that when the job finally signals completion (e.g. in the IRQ
> handler), the scheduler won't call `sched->ops->free_job()`. As a result,
> the job and its resources won't be freed, leading to a memory leak.
> 
> To resolve this issue, we create a new `drm_gpu_sched_stat` that allows a
> driver to skip the reset. This new status will indicate that the job
> should be reinserted into the pending list, and the driver will still
> signal its completion.

Since this is de facto what drivers do today I agree it makes sense to 
formalise handling for it in the scheduler itself.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Some minor comments below.

> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
>   include/drm/gpu_scheduler.h            |  2 ++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309f881135dbc639a9b4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   			job->sched->ops->free_job(job);
>   			sched->free_guilty = false;
>   		}
> +
> +		/*
> +		 * If the driver indicated that the GPU is still running and wants to skip
> +		 * the reset, reinsert the job back into the pending list and realarm the

re-arm

> +		 * timeout.
> +		 */
> +		if (status == DRM_GPU_SCHED_STAT_RUNNING) {
> +			spin_lock(&sched->job_list_lock);
> +			list_add(&job->list, &sched->pending_list);
> +			spin_unlock(&sched->job_list_lock);
> +		}
>   	} else {
>   		spin_unlock(&sched->job_list_lock);
>   	}
> @@ -590,6 +601,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>    * This function is typically used for reset recovery (see the docu of
>    * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>    * scheduler teardown, i.e., before calling drm_sched_fini().
> + *
> + * As it's used for reset recovery, drm_sched_stop() shouldn't be called
> + * if the scheduler skipped the timeout (DRM_SCHED_STAT_RUNNING).

s/scheduler/driver/ ?

>    */
>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   {
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5fc16b927202a507d51 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -389,11 +389,13 @@ struct drm_sched_job {
>    * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>    * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
>    * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip the reset.

s/GPU/job/ ?

>    */
>   enum drm_gpu_sched_stat {
>   	DRM_GPU_SCHED_STAT_NONE,
>   	DRM_GPU_SCHED_STAT_NOMINAL,
>   	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_RUNNING,

I am wondering if we could make it more obvious what is the difference 
between "nominal" and "running" and from whose point of view should 
those statuses be considered.

So far we have "nominal" which means scheduler/hardware is working fine 
but the job may or may have not been cancelled. With "running" we kind 
of split it into two sub-statuses and it would be nice for that to be 
intuitively visible from the naming. But I struggle to suggest an 
elegant name while preserving nominal as is.

Thinking out loud here - perhaps that is pointing towards an alternative 
that instead of a new status, a new helper to re-insert the single job 
(like drm_sched_resubmit_job(sched, job)) would fit better? Although it 
would be more churn.

Regards,

Tvrtko

>   };
>   
>   /**
> 

