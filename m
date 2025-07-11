Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D013EB02443
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FA210E3C0;
	Fri, 11 Jul 2025 19:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ObraHUMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E203110E3BD;
 Fri, 11 Jul 2025 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjO5jjvC3hP6G/uzyJC+ugsJD8Wne4n4ZF27eWw30vU=; b=ObraHUMIIi5b0c8NS9cNE0PyDC
 E1OLtdyC7hub8QIC2jzryExm4A2i4+56xA8MeDdgkCWJdjAr64XI/FBr0PIk5drollPPXOOaTEi/Y
 B+pv63SLWHxkrH7UftY2CVQeF2FHVjENzxbNCD6RKWnO27yoksVvofwfVxbuOsM7ilJ7R24FzINHD
 aQctwjL5ccwW5TmobpR27UlD1aZVVj+m0v7Tjo9Ef48fRZaefv877zPVEPC5o87K9FBwbQFLawa68
 wce2RDkmdI4wDFj3hjxD46f9rMW+7QkmwVhIF9xmW/EuGQJf+dGPw0iRNW3HV6wXRgt78up9kY8pO
 YLGHR7ug==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uaJ6u-00FUdM-Pv; Fri, 11 Jul 2025 21:08:41 +0200
Message-ID: <d59b7550-5833-4377-9d94-33161f375604@igalia.com>
Date: Fri, 11 Jul 2025 16:08:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Avoid double re-lock on the job free path
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250711150949.48667-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250711150949.48667-1-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

On 11/07/25 12:09, Tvrtko Ursulin wrote:
> Currently the job free work item will lock sched->job_list_lock first time
> to see if there are any jobs, free a single job, and then lock again to
> decide whether to re-queue itself if there are more finished jobs.
> 
> Since drm_sched_get_finished_job() already looks at the second job in the
> queue we can simply add the signaled check and have it return the presence
> of more jobs to be freed to the caller. That way the work item does not
> have to lock the list again and repeat the signaled check.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> v2:
>   * Improve commit text and kerneldoc. (Philipp)
>   * Rename run free work helper. (Philipp)

Maybe, would it be possible not to rename it? Otherwise, I won't be able
to use the function name `drm_sched_run_free_queue()` in the
DRM_GPU_SCHED_STAT_NO_HANG series.

Not a big deal, but it would ease reintroducing
`drm_sched_run_free_queue()` if the series lands after this patch.

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 48 +++++++++++---------------
>   1 file changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 33d02b79674d..e183b305a51b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -349,29 +349,13 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   }
>   
>   /**
> - * __drm_sched_run_free_queue - enqueue free-job work
> - * @sched: scheduler instance
> - */
> -static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> -{
> -	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_free_job);
> -}
> -
> -/**
> - * drm_sched_run_free_queue - enqueue free-job work if ready
> + * drm_sched_run_free_queue - enqueue free-job work
>    * @sched: scheduler instance
>    */
>   static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>   {
> -	struct drm_sched_job *job;
> -
> -	spin_lock(&sched->job_list_lock);
> -	job = list_first_entry_or_null(&sched->pending_list,
> -				       struct drm_sched_job, list);
> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> -		__drm_sched_run_free_queue(sched);
> -	spin_unlock(&sched->job_list_lock);
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_free_job);
>   }
>   
>   /**
> @@ -393,7 +377,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence, result);
>   	dma_fence_put(&s_fence->finished);
> -	__drm_sched_run_free_queue(sched);
> +	drm_sched_run_free_queue(sched);
>   }
>   
>   /**
> @@ -1094,12 +1078,16 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>    * drm_sched_get_finished_job - fetch the next finished job to be destroyed
>    *
>    * @sched: scheduler instance
> + * @have_more: are there more finished jobs on the list
> + *
> + * Informs the caller through @have_more whether there are more finished jobs
> + * besides the returned one.
>    *
>    * Returns the next finished job from the pending list (if there is one)
>    * ready for it to be destroyed.
>    */
>   static struct drm_sched_job *
> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
>   {
>   	struct drm_sched_job *job, *next;
>   
> @@ -1107,22 +1095,25 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>   
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
> -
>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
>   
>   		/* cancel this job's TO timer */
>   		cancel_delayed_work(&sched->work_tdr);
> -		/* make the scheduled timestamp more accurate */
> +
> +		*have_more = false;
>   		next = list_first_entry_or_null(&sched->pending_list,
>   						typeof(*next), list);
> -
>   		if (next) {
> +			/* make the scheduled timestamp more accurate */
>   			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   				     &next->s_fence->scheduled.flags))
>   				next->s_fence->scheduled.timestamp =
>   					dma_fence_timestamp(&job->s_fence->finished);
> +
> +			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
> +
>   			/* start TO timer for next job */
>   			drm_sched_start_timeout(sched);
>   		}
> @@ -1181,12 +1172,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
>   	struct drm_gpu_scheduler *sched =
>   		container_of(w, struct drm_gpu_scheduler, work_free_job);
>   	struct drm_sched_job *job;
> +	bool have_more;
>   
> -	job = drm_sched_get_finished_job(sched);
> -	if (job)
> +	job = drm_sched_get_finished_job(sched, &have_more);
> +	if (job) {
>   		sched->ops->free_job(job);
> +		if (have_more)
> +			drm_sched_run_free_queue(sched);
> +	}
>   
> -	drm_sched_run_free_queue(sched);
>   	drm_sched_run_job_queue(sched);
>   }
>   

