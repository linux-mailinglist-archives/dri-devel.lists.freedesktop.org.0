Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E943AF1206
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 12:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706E10E6CD;
	Wed,  2 Jul 2025 10:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XaarfLNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9F910E6D2;
 Wed,  2 Jul 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=58J84KOeZwp513DoLC02dV/RS+gAS7rDNH3KRjF52XE=; b=XaarfLNHQrVOZS1m9ERXOhR1RR
 6lWdRFiccjRW7oLl3l4xl6Vguy+YfHd/mPT70NlNEJuDM3LEaH8M4QduI3yAAs7WxNYAIxB1VqXOp
 8S0SSz0guRWG0EKdCpzaxceNj72w2q3muzwCBfmX7Ja9x8IcpKBIRtHcjnJMxnz8JKQQIwRB63JpS
 BvW2JuDIjkB/zcE5tBD3xMcVkFiH2Edo0T7antsBVgf5wQnRaO8MAbPiIJ/Ckm7nlB+vML97zCeV+
 5EYGUM4cW4Q48A9W/bZVWQBULbWAip0pYOZnwwCYxM115rcwrqCgGrAYPvQgoYO3Jv4to+Dpe4FcD
 TQR/5Ixw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWup0-00BPaw-3i; Wed, 02 Jul 2025 12:36:10 +0200
Message-ID: <f9b55d5b-0018-4850-a9b7-2f267467e957@igalia.com>
Date: Wed, 2 Jul 2025 11:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/sched/tests: Port to cancel_job()
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
 <20250701132142.76899-5-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250701132142.76899-5-phasta@kernel.org>
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
> The GPU Scheduler now supports a new callback, cancel_job(), which lets
> the scheduler cancel all jobs which might not yet be freed when
> drm_sched_fini() runs. Using this callback allows for significantly
> simplifying the mock scheduler teardown code.
> 
> Implement the cancel_job() callback and adjust the code where necessary.

Cross referencing against my version I think you missed this hunk:

--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -49,7 +49,6 @@ struct drm_mock_scheduler {

  	spinlock_t		lock;
  	struct list_head	job_list;
-	struct list_head	done_list;

  	struct {
  		u64		context;


I also had this:

@@ -97,7 +96,8 @@ struct drm_mock_sched_job {
  	struct completion	done;

  #define DRM_MOCK_SCHED_JOB_DONE		0x1
-#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
+#define DRM_MOCK_SCHED_JOB_CANCELED	0x2
+#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x4

And was setting it in the callback. And since we should add a test to 
explicitly cover the new callback, and just the callback, that could 
make it very easy to do it.

> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 66 +++++++------------
>   1 file changed, 23 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 49d067fecd67..2d3169d95200 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -63,7 +63,7 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
>   	lockdep_assert_held(&sched->lock);
>   
>   	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
> -	list_move_tail(&job->link, &sched->done_list);
> +	list_del(&job->link);
>   	dma_fence_signal_locked(&job->hw_fence);
>   	complete(&job->done);
>   }
> @@ -236,26 +236,39 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   
>   static void mock_sched_free_job(struct drm_sched_job *sched_job)
>   {
> -	struct drm_mock_scheduler *sched =
> -			drm_sched_to_mock_sched(sched_job->sched);
>   	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
> -	unsigned long flags;
>   
> -	/* Remove from the scheduler done list. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_del(&job->link);
> -	spin_unlock_irqrestore(&sched->lock, flags);
>   	dma_fence_put(&job->hw_fence);
> -
>   	drm_sched_job_cleanup(sched_job);
>   
>   	/* Mock job itself is freed by the kunit framework. */
>   }
>   
> +static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
> +{
> +	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(sched_job->sched);
> +	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
> +	unsigned long flags;
> +
> +	hrtimer_cancel(&job->timer);
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +		list_del(&job->link);
> +		dma_fence_set_error(&job->hw_fence, -ECANCELED);
> +		dma_fence_signal_locked(&job->hw_fence);
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	/* The GPU Scheduler will call drm_sched_backend_ops.free_job(), still.
> +	 * Mock job itself is freed by the kunit framework. */

/*
  * Multiline comment style to stay consistent, at least in this file.
  */

The rest looks good, but I need to revisit the timeout/free handling 
since it has been a while and you changed it recently.

Regards,

Tvrtko

> +}
> +
>   static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
>   	.run_job = mock_sched_run_job,
>   	.timedout_job = mock_sched_timedout_job,
> -	.free_job = mock_sched_free_job
> +	.free_job = mock_sched_free_job,
> +	.cancel_job = mock_sched_cancel_job,
>   };
>   
>   /**
> @@ -289,7 +302,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>   	sched->hw_timeline.context = dma_fence_context_alloc(1);
>   	atomic_set(&sched->hw_timeline.next_seqno, 0);
>   	INIT_LIST_HEAD(&sched->job_list);
> -	INIT_LIST_HEAD(&sched->done_list);
>   	spin_lock_init(&sched->lock);
>   
>   	return sched;
> @@ -304,38 +316,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>    */
>   void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
>   {
> -	struct drm_mock_sched_job *job, *next;
> -	unsigned long flags;
> -	LIST_HEAD(list);
> -
> -	drm_sched_wqueue_stop(&sched->base);
> -
> -	/* Force complete all unfinished jobs. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->job_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry(job, &list, link)
> -		hrtimer_cancel(&job->timer);
> -
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &list, link)
> -		drm_mock_sched_job_complete(job);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	/*
> -	 * Free completed jobs and jobs not yet processed by the DRM scheduler
> -	 * free worker.
> -	 */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry_safe(job, next, &list, link)
> -		mock_sched_free_job(&job->base);
> -
>   	drm_sched_fini(&sched->base);
>   }
>   

