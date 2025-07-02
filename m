Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4859AF118F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 12:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02AE10E6C3;
	Wed,  2 Jul 2025 10:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Rcf7g8RV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B9610E6C3;
 Wed,  2 Jul 2025 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzngX37uvz6d6lF8YACHw9qO2X6AeXWw1SWs2AOP1WE=; b=Rcf7g8RVQfKIrVxyn7c63p17YJ
 IvqJHB0AmaNPPr6i7R9XE6SNPXBtFQ9jASR3sUp2vv3sBUYlLfgrqwJtQsl1XxtuS4BPKInKaazxT
 ZSY98oWk0IM9KkVBAqQLLymVJDGjuBuhpg5mw3BbLM88ODkM1YXObjbHCrYwqIFh2hTJwiy0aHC8Q
 kxWFmG0PM7XLEMkl7MparOA3/bgwB8Ra3mehn6Am+tngJvPgUUrRyjd3LEnZi6nMgvDaGDiJkbj9u
 tFNMHcgLo8e7eDnH3ASvt6AdKmPcORmAMqgVeNQsbAYEPUhyVeXawm/BlCce53jWRiOpN98dJ7hAA
 TOOvBE4Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWuYs-00BPA0-Es; Wed, 02 Jul 2025 12:19:30 +0200
Message-ID: <ed5f6666-5c73-494c-835c-7e407dfd737b@igalia.com>
Date: Wed, 2 Jul 2025 11:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
 callback
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250701132142.76899-3-phasta@kernel.org>
 <20250701132142.76899-4-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250701132142.76899-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 01/07/2025 14:21, Philipp Stanner wrote:
> Since its inception, the GPU scheduler can leak memory if the driver
> calls drm_sched_fini() while there are still jobs in flight.
> 
> The simplest way to solve this in a backwards compatible manner is by
> adding a new callback, drm_sched_backend_ops.cancel_job(), which
> instructs the driver to signal the hardware fence associated with the
> job. Afterwards, the scheduler can savely use the established free_job()
> callback for freeing the job.
> 
> Implement the new backend_ops callback cancel_job().
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Link: https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----------
>   include/drm/gpu_scheduler.h            | 18 ++++++++++++++
>   2 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c63543132f9d..1239954f5f7c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1353,6 +1353,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   }
>   EXPORT_SYMBOL(drm_sched_init);
>   
> +static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job, *tmp;
> +
> +	/* All other accessors are stopped. No locking necessary. */
> +	list_for_each_entry_safe_reverse(job, tmp, &sched->pending_list, list) {
> +		sched->ops->cancel_job(job);
> +		list_del(&job->list);

List_del is just for the warning in 3/6 I guess? You could in theory zap 
the whole list in one go and avoid the safe iterator. Not that it 
matters really so:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> +		sched->ops->free_job(job);
> +	}
> +}
> +
>   /**
>    * drm_sched_fini - Destroy a gpu scheduler
>    *
> @@ -1360,19 +1372,11 @@ EXPORT_SYMBOL(drm_sched_init);
>    *
>    * Tears down and cleans up the scheduler.
>    *
> - * This stops submission of new jobs to the hardware through
> - * drm_sched_backend_ops.run_job(). Consequently, drm_sched_backend_ops.free_job()
> - * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
> - * There is no solution for this currently. Thus, it is up to the driver to make
> - * sure that:
> - *
> - *  a) drm_sched_fini() is only called after for all submitted jobs
> - *     drm_sched_backend_ops.free_job() has been called or that
> - *  b) the jobs for which drm_sched_backend_ops.free_job() has not been called
> - *     after drm_sched_fini() ran are freed manually.
> - *
> - * FIXME: Take care of the above problem and prevent this function from leaking
> - * the jobs in drm_gpu_scheduler.pending_list under any circumstances.
> + * This stops submission of new jobs to the hardware through &struct
> + * drm_sched_backend_ops.run_job. If &struct drm_sched_backend_ops.cancel_job
> + * is implemented, all jobs will be canceled through it and afterwards cleaned
> + * up through &struct drm_sched_backend_ops.free_job. If cancel_job is not
> + * implemented, memory could leak.
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
> @@ -1402,6 +1406,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&sched->work_tdr);
>   
> +	/* Avoid memory leaks if supported by the driver. */
> +	if (sched->ops->cancel_job)
> +		drm_sched_cancel_remaining_jobs(sched);
> +
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
>   	sched->ready = false;
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e62a7214e052..190844370f48 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -512,6 +512,24 @@ struct drm_sched_backend_ops {
>            * and it's time to clean it up.
>   	 */
>   	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @cancel_job: Used by the scheduler to guarantee remaining jobs' fences
> +	 * get signaled in drm_sched_fini().
> +	 *
> +	 * Used by the scheduler to cancel all jobs that have not been executed
> +	 * with &struct drm_sched_backend_ops.run_job by the time
> +	 * drm_sched_fini() gets invoked.
> +	 *
> +	 * Drivers need to signal the passed job's hardware fence with an
> +	 * appropriate error code (e.g., -ECANCELED) in this callback. They
> +	 * must not free the job.
> +	 *
> +	 * The scheduler will only call this callback once it stopped calling
> +	 * all other callbacks forever, with the exception of &struct
> +	 * drm_sched_backend_ops.free_job.
> +	 */
> +	void (*cancel_job)(struct drm_sched_job *sched_job);
>   };
>   
>   /**

