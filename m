Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE929921F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 17:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB6E6EA35;
	Mon, 26 Oct 2020 16:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB9196EA35
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 16:16:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1DF61042;
 Mon, 26 Oct 2020 09:16:51 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2E943F719;
 Mon, 26 Oct 2020 09:16:50 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Fix a race in the job timeout handling
 (again)
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20201026153206.97037-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <67cf9263-a400-6ffe-0e30-9e8bce0d3a87@arm.com>
Date: Mon, 26 Oct 2020 16:16:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026153206.97037-1-boris.brezillon@collabora.com>
Content-Language: en-GB
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2020 15:32, Boris Brezillon wrote:
> In our last attempt to fix races in the panfrost_job_timedout() path we
> overlooked the case where a re-submitted job immediately triggers a
> fault. This lead to a situation where we try to stop a scheduler that's
> not resumed yet and lose the 'timedout' event without restarting the
> timeout, thus blocking the whole queue.
> 
> Let's fix that by tracking timeouts occurring between the
> drm_sched_resubmit_jobs() and drm_sched_start() calls.
> 
> Fixes: 1a11a88cfd9a ("drm/panfrost: Fix job timeout handling")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_job.c | 42 ++++++++++++++++++++-----
>   1 file changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index d0469e944143..96c2c21a4205 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -26,6 +26,7 @@
>   struct panfrost_queue_state {
>   	struct drm_gpu_scheduler sched;
>   	bool stopped;
> +	bool timedout;
>   	struct mutex lock;
>   	u64 fence_context;
>   	u64 emit_seqno;
> @@ -383,11 +384,33 @@ static bool panfrost_scheduler_stop(struct panfrost_queue_state *queue,
>   		queue->stopped = true;
>   		stopped = true;
>   	}
> +	queue->timedout = true;
>   	mutex_unlock(&queue->lock);
>   
>   	return stopped;
>   }
>   
> +static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
> +{
> +	if (WARN_ON(!queue->stopped))

I *think* this can be hit, see below.

> +		return;
> +
> +	mutex_lock(&queue->lock);
> +	drm_sched_start(&queue->sched, true);
> +
> +	/*
> +	 * We might have missed fault-timeouts (AKA immediate timeouts) while
> +	 * the scheduler was stopped. Let's fake a new fault to trigger an
> +	 * immediate reset.
> +	 */
> +	if (queue->timedout)
> +		drm_sched_fault(&queue->sched);
> +
> +	queue->timedout = false;
> +	queue->stopped = false;
> +	mutex_unlock(&queue->lock);
> +}
> +
>   static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>   {
>   	struct panfrost_job *job = to_panfrost_job(sched_job);
> @@ -437,12 +460,6 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>   		 */
>   		if (panfrost_scheduler_stop(&pfdev->js->queue[i], NULL))
>   			cancel_delayed_work_sync(&sched->work_tdr);
> -
> -		/*
> -		 * Now that we cancelled the pending timeouts, we can safely
> -		 * reset the stopped state.
> -		 */
> -		pfdev->js->queue[i].stopped = false;
>   	}
>   
>   	spin_lock_irqsave(&pfdev->js->job_lock, flags);
> @@ -457,14 +474,23 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>   
>   	panfrost_device_reset(pfdev);
>   
> -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		/*
> +		 * The GPU is idle, and the scheduler is stopped, we can safely
> +		 * reset the ->timedout state without taking any lock. We need
> +		 * to do that before calling drm_sched_resubmit_jobs() though,
> +		 * because the resubmission might trigger immediate faults
> +		 * which we want to catch.
> +		 */
> +		pfdev->js->queue[i].timedout = false;
>   		drm_sched_resubmit_jobs(&pfdev->js->queue[i].sched);
> +	}
>   
>   	mutex_unlock(&pfdev->reset_lock);

In here we've resubmitted the jobs and are no longer holding the mutex. 
So AFAICT if one of those jobs fails we may re-enter 
panfrost_job_timedout() and stop (no-op) the scheduler. The first thread 
could then proceed to start the scheduler (possibly during the GPU reset 
handled by the second thread which could be interesting in itself), 
followed by the second thread attempting to start the scheduler which 
then hits the WARN_ON().

Of course the above requires somewhat crazy scheduling, but I can't see 
anything preventing it from happening. Am I missing something?

Steve

>   
>   	/* restart scheduler after GPU is usable again */
>   	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_start(&pfdev->js->queue[i].sched, true);
> +		panfrost_scheduler_start(&pfdev->js->queue[i]);
>   }
>   
>   static const struct drm_sched_backend_ops panfrost_sched_ops = {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
