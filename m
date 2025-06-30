Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C19AEDADE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1263810E40F;
	Mon, 30 Jun 2025 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q0KCCkkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B37D10E40E;
 Mon, 30 Jun 2025 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KTch8RGig26EdKTqZ+Ga+GYQ19PjBijkv/2Y6AchRSU=; b=q0KCCkkEvB5qp409GDnecogLWH
 42L+RGwe4AocX3/YUlZAjZ7ykK0aT0pzPOKJwl6IJCv5jPpuxI7Iwsz36l+iBa723b49VqO5HA8R/
 We7YlqlZLaXHiZNFcBiyJiGyYYY8wDwHwgZ1UoU8URGiQMGTP7tDjkPSV96rY00EoyFHovPCqIw9v
 pezxtu5TPWGI/xDxpcHZcbcVVMPPV7i4E3lpCVGzMafWejLwKihHBRux91jRJryLzExSyw6tpx00u
 uArUBNwTAN210qEjdt8NGReno5BSTLOd5Q+dWlt6Uxi9oo48SHuUJnBQ4F/gKe5lw0hSHufSxZmLU
 ZcrGjO9w==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWCdn-00AS3d-PV; Mon, 30 Jun 2025 13:25:40 +0200
Message-ID: <9c9afdec-491c-4ab7-b642-c9ea4660b117@igalia.com>
Date: Mon, 30 Jun 2025 08:25:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-2-8be5cca2725d@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250618-sched-skip-reset-v3-2-8be5cca2725d@igalia.com>
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

@Matthew, @Philipp, @Danilo, do you folks have some feedback about this
patch and also 1/8 and 7/8? I'd be glad to hear your thoughts and/or
gather some R-b's. Thanks!

Best Regards,
- Maíra

On 18/06/25 11:47, Maíra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't hung;
> instead, a job may still be running, and there may be no valid reason to
> reset the hardware. This can occur in two situations:
> 
>    1. The GPU exposes some mechanism that ensures the GPU is still making
>       progress. By checking this mechanism, the driver can safely skip the
>       reset, re-arm the timeout, and allow the job to continue running until
>       completion. This is the case for v3d, Etnaviv, and Xe.
>    2. Timeout has fired before the free-job worker. Consequently, the
>       scheduler calls `timedout_job()` for a job that isn't timed out.
> 
> These two scenarios are problematic because the job was removed from the
> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
> means that when the job finishes, it won't be freed by the scheduler
> though `sched->ops->free_job()` - leading to a memory leak.
> 
> To solve those problems, create a new `drm_gpu_sched_stat`, called
> DRM_GPU_SCHED_STAT_NO_HANG, that allows a driver to skip the reset. The
> new status will indicate that the job must be reinserted into the
> pending list, and the hardware / driver will still complete that job.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 43 ++++++++++++++++++++++++++++++++--
>   include/drm/gpu_scheduler.h            |  3 +++
>   2 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index fb6d9eddf5b378910b66d456f3610ff2ca7c0f41..5e1c07ca867cb14746cec9a7e53896fe17af6e58 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -380,11 +380,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>   {
>   	struct drm_sched_job *job;
>   
> -	spin_lock(&sched->job_list_lock);
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
>   	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>   		__drm_sched_run_free_queue(sched);
> +}
> +
> +static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	drm_sched_run_free_queue(sched);
>   	spin_unlock(&sched->job_list_lock);
>   }
>   
> @@ -537,6 +542,31 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>   	spin_unlock(&sched->job_list_lock);
>   }
>   
> +/**
> + * drm_sched_job_reinsert_on_false_timeout - Reinsert the job on a false timeout
> + * @sched: scheduler instance
> + * @job: job to be reinserted on the pending list
> + *
> + * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
> + * hung and the job is making progress, the scheduler must reinsert the job back
> + * into the pending list. Otherwise, the job and its resources won't be freed
> + * through the &drm_sched_backend_ops.free_job callback.
> + *
> + * Note that after reinserting the job, the scheduler enqueues the free-job
> + * work again if ready. Otherwise, a signaled job could be added to the pending
> + * list, but never freed.
> + *
> + * This function must be used in "false timeout" cases only.
> + */
> +static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
> +						    struct drm_sched_job *job)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	list_add(&job->list, &sched->pending_list);
> +	drm_sched_run_free_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
>   static void drm_sched_job_timedout(struct work_struct *work)
>   {
>   	struct drm_gpu_scheduler *sched;
> @@ -570,6 +600,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   			job->sched->ops->free_job(job);
>   			sched->free_guilty = false;
>   		}
> +
> +		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
> +			drm_sched_job_reinsert_on_false_timeout(sched, job);
>   	} else {
>   		spin_unlock(&sched->job_list_lock);
>   	}
> @@ -592,6 +625,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>    * This function is typically used for reset recovery (see the docu of
>    * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>    * scheduler teardown, i.e., before calling drm_sched_fini().
> + *
> + * As it's used for reset recovery, drm_sched_stop() shouldn't be called
> + * if the driver skipped the reset (DRM_GPU_SCHED_STAT_NO_HANG).
>    */
>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   {
> @@ -677,6 +713,9 @@ EXPORT_SYMBOL(drm_sched_stop);
>    * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>    * scheduler startup. The scheduler itself is fully operational after
>    * drm_sched_init() succeeded.
> + *
> + * As it's used for reset recovery, drm_sched_start() shouldn't be called
> + * if the driver skipped the reset (DRM_GPU_SCHED_STAT_NO_HANG).
>    */
>   void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>   {
> @@ -1198,7 +1237,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>   	if (job)
>   		sched->ops->free_job(job);
>   
> -	drm_sched_run_free_queue(sched);
> +	drm_sched_run_free_queue_unlocked(sched);
>   	drm_sched_run_job_queue(sched);
>   }
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..423bcc7d7584d3f85cc5a10982f3cf637a781825 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -393,11 +393,14 @@ struct drm_sched_job {
>    * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>    * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
>    * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's belief, the GPU
> + * did not hang and is operational.
>    */
>   enum drm_gpu_sched_stat {
>   	DRM_GPU_SCHED_STAT_NONE,
>   	DRM_GPU_SCHED_STAT_RESET,
>   	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_NO_HANG,
>   };
>   
>   /**
> 

