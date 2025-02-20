Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D020FA3DB8B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0046B10E95D;
	Thu, 20 Feb 2025 13:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="opj+ESPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D6710E95D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 13:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kOqBlnaxp/e8tP1Wyg8ye2+J2fQPL0Hv5eVWSf6ezbQ=; b=opj+ESPEvOlNdfcVwmMPRmqsA7
 JaO696vGFSoUxj6QddrGB8fj8zW7h5LwDm79XLQeNc1JGbFE6IPXYC+EVEK+tQQ8+DmgdhsQhOQzx
 Ur9arKBGMWvsULLBkltSCjmC0co1VoNwfLD20UrNW38lZOXVTHVDEVuAc3ULLNBVyERQ0vnLGPlDq
 PKhuokC7ogcDuKLsu1IxjrD+l/tl7wjd3CZMPMVP27jdwVl1FNOCnCx0+bFhVHXJAKhjB+GUIo/Is
 YBr5gEJ3OfLSDUnHQ2DRdE9jFtwvIeljeeAd7Y/p7toOiiBK6qX9OKvp/LtsGbUbEUotU4mZvD6Vp
 s2zOtlAA==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tl6pC-00FNAe-JI; Thu, 20 Feb 2025 14:42:52 +0100
Message-ID: <6ec16915-d7ae-4b1f-b156-80892d98e119@igalia.com>
Date: Thu, 20 Feb 2025 10:42:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/sched: Update timedout_job()'s documentation
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250220112813.87992-2-phasta@kernel.org>
 <20250220112813.87992-5-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250220112813.87992-5-phasta@kernel.org>
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

Hi Philipp,

On 20/02/25 08:28, Philipp Stanner wrote:
> drm_sched_backend_ops.timedout_job()'s documentation is outdated. It
> mentions the deprecated function drm_sched_resubmit_job(). Furthermore,
> it does not point out the important distinction between hardware and
> firmware schedulers.
> 
> Since firmware schedulers tyipically only use one entity per scheduler,
> timeout handling is significantly more simple because the entity the
> faulted job came from can just be killed without affecting innocent
> processes.
> 
> Update the documentation with that distinction and other details.
> 
> Reformat the docstring to work to a unified style with the other
> handles.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   include/drm/gpu_scheduler.h | 83 +++++++++++++++++++++++--------------
>   1 file changed, 52 insertions(+), 31 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 29e5bda91806..18cdeacf8651 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -393,8 +393,15 @@ static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>   	return s_job && atomic_inc_return(&s_job->karma) > threshold;
>   }
>   
> +/**
> + * enum drm_gpu_sched_stat - the scheduler's status
> + *
> + * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> + * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> + * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> + */
>   enum drm_gpu_sched_stat {
> -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> +	DRM_GPU_SCHED_STAT_NONE,
>   	DRM_GPU_SCHED_STAT_NOMINAL,
>   	DRM_GPU_SCHED_STAT_ENODEV,
>   };
> @@ -430,6 +437,11 @@ struct drm_sched_backend_ops {
>   	 *
>   	 * TODO: Document which fence rules above.
>   	 *
> +	 * This method is called in a workqueue context - either from the
> +	 * submit_wq the driver passed through &drm_sched_init(), or, if the
> +	 * driver passed NULL, a separate, ordered workqueue the scheduler
> +	 * allocated.
> +	 *

The commit message mentions "Update timedout_job()'s documentation". As
this hunk is related to `run_job()`, maybe it would be a better fit to
patch 2/3.

>   	 * @sched_job: the job to run
>   	 *
>   	 * Note that the scheduler expects to 'inherit' its own reference to
> @@ -449,43 +461,52 @@ struct drm_sched_backend_ops {
>   	 * @timedout_job: Called when a job has taken too long to execute,
>   	 * to trigger GPU recovery.
>   	 *
> -	 * This method is called in a workqueue context.
> +	 * @sched_job: The job that has timed out
>   	 *
> -	 * Drivers typically issue a reset to recover from GPU hangs, and this
> -	 * procedure usually follows the following workflow:
> +	 * Drivers typically issue a reset to recover from GPU hangs.
> +	 * This procedure looks very different depending on whether a firmware
> +	 * or a hardware scheduler is being used.
>   	 *
> -	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
> -	 *    scheduler thread and cancel the timeout work, guaranteeing that
> -	 *    nothing is queued while we reset the hardware queue
> -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> -	 * 3. Issue a GPU reset (driver-specific)
> -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> -	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
> -	 *    jobs can be queued, and the scheduler thread is unblocked
> +	 * For a FIRMWARE SCHEDULER, each ring has one scheduler, and each
> +	 * scheduler has one entity. Hence, the steps taken typically look as
> +	 * follows:
> +	 *
> +	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
> +	 *    scheduler workqueues and cancel the timeout work, guaranteeing
> +	 *    that nothing is queued while the ring is being removed.
> +	 * 2. Remove the ring. The firmware will make sure that the
> +	 *    corresponding parts of the hardware are resetted, and that other
> +	 *    rings are not impacted.
> +	 * 3. Kill the entity and the associated scheduler.
> +	 *
> +	 *
> +	 * For a HARDWARE SCHEDULER, a scheduler instance schedules jobs from
> +	 * one or more entities to one ring. This implies that all entities
> +	 * associated with the affected scheduler cannot be torn down, because
> +	 * this would effectively also affect innocent userspace processes which
> +	 * did not submit faulty jobs (for example).
> +	 *
> +	 * Consequently, the procedure to recover with a hardware scheduler
> +	 * should look like this:
> +	 *
> +	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
> +	 * 2. Kill the entity the faulty job stems from.
> +	 * 3. Issue a GPU reset on all faulty rings (driver-specific).
> +	 * 4. Re-submit jobs on all schedulers impacted by re-submitting them to
> +	 *    the entities which are still alive.

I believe that a mention to `drm_sched_resubmit_jobs()` still worth it,
even mentioning that it is a deprecated option and it shouldn't be used
in new code. It is deprecated indeed, but we still have five users.

Best Regards,
- Maíra

> +	 * 5. Restart all schedulers that were stopped in step #1 using
> +	 *    drm_sched_start().
>   	 *
>   	 * Note that some GPUs have distinct hardware queues but need to reset
>   	 * the GPU globally, which requires extra synchronization between the
> -	 * timeout handler of the different &drm_gpu_scheduler. One way to
> -	 * achieve this synchronization is to create an ordered workqueue
> -	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
> -	 * queue to drm_sched_init(), to guarantee that timeout handlers are
> -	 * executed sequentially. The above workflow needs to be slightly
> -	 * adjusted in that case:
> +	 * timeout handlers of different schedulers. One way to achieve this
> +	 * synchronization is to create an ordered workqueue (using
> +	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
> +	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
> +	 * that timeout handlers are executed sequentially.
>   	 *
> -	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
> -	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
> -	 *    the reset (optional)
> -	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
> -	 * 4. Re-submit jobs on all schedulers impacted by the reset using
> -	 *    drm_sched_resubmit_jobs()
> -	 * 5. Restart all schedulers that were stopped in step #1 using
> -	 *    drm_sched_start()
> +	 * Return: The scheduler's status, defined by &drm_gpu_sched_stat
>   	 *
> -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> -	 * and the underlying driver has started or completed recovery.
> -	 *
> -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> -	 * available, i.e. has been unplugged.
>   	 */
>   	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>   

