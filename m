Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02B3B4759
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816596EE0F;
	Fri, 25 Jun 2021 16:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228456EE0F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 16:22:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A015D1F44569;
 Fri, 25 Jun 2021 17:22:38 +0100 (BST)
Date: Fri, 25 Jun 2021 18:22:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 09/15] drm/panfrost: Simplify the reset serialization
 logic
Message-ID: <20210625182235.13061360@collabora.com>
In-Reply-To: <20210625133327.2598825-10-boris.brezillon@collabora.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-10-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Jun 2021 15:33:21 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:


> @@ -379,57 +370,73 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>  	job_write(pfdev, JOB_INT_MASK, irq_mask);
>  }
>  
> -static bool panfrost_scheduler_stop(struct panfrost_queue_state *queue,
> -				    struct drm_sched_job *bad)
> +static void panfrost_reset(struct panfrost_device *pfdev,
> +			   struct drm_sched_job *bad)
>  {
> -	enum panfrost_queue_status old_status;
> -	bool stopped = false;
> +	unsigned int i;
> +	bool cookie;
>  
> -	mutex_lock(&queue->lock);
> -	old_status = atomic_xchg(&queue->status,
> -				 PANFROST_QUEUE_STATUS_STOPPED);
> -	if (old_status == PANFROST_QUEUE_STATUS_STOPPED)
> -		goto out;
> +	if (WARN_ON(!atomic_read(&pfdev->reset.pending)))
> +		return;
> +
> +	/* Stop the schedulers.
> +	 *
> +	 * FIXME: We temporarily get out of the dma_fence_signalling section
> +	 * because the cleanup path generate lockdep splats when taking locks
> +	 * to release job resources. We should rework the code to follow this
> +	 * pattern:
> +	 *
> +	 *	try_lock
> +	 *	if (locked)
> +	 *		release
> +	 *	else
> +	 *		schedule_work_to_release_later
> +	 */
> +	for (i = 0; i < NUM_JOB_SLOTS; i++)
> +		drm_sched_stop(&pfdev->js->queue[i].sched, bad);
> +
> +	cookie = dma_fence_begin_signalling();
>  
> -	WARN_ON(old_status != PANFROST_QUEUE_STATUS_ACTIVE);
> -	drm_sched_stop(&queue->sched, bad);
>  	if (bad)
>  		drm_sched_increase_karma(bad);
>  
> -	stopped = true;
> +	spin_lock(&pfdev->js->job_lock);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		if (pfdev->jobs[i]) {
> +			pm_runtime_put_noidle(pfdev->dev);
> +			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> +			pfdev->jobs[i] = NULL;
> +		}
> +	}
> +	spin_unlock(&pfdev->js->job_lock);
>  
> -	/*
> -	 * Set the timeout to max so the timer doesn't get started
> -	 * when we return from the timeout handler (restored in
> -	 * panfrost_scheduler_start()).
> +	panfrost_device_reset(pfdev);
> +
> +	/* GPU has been reset, we can cancel timeout/fault work that may have
> +	 * been queued in the meantime and clear the reset pending bit.
>  	 */
> -	queue->sched.timeout = MAX_SCHEDULE_TIMEOUT;
> +	atomic_set(&pfdev->reset.pending, 0);
> +	cancel_work_sync(&pfdev->reset.work);

This is introducing a deadlock since panfrost_reset() might be called
from the reset handler, and cancel_work_sync() waits for the handler to
return. Unfortunately there's no cancel_work() variant, so I'll just
remove the

	WARN_ON(!atomic_read(&pfdev->reset.pending)

and return directly when the pending bit is cleared.

> +	for (i = 0; i < NUM_JOB_SLOTS; i++)
> +		cancel_delayed_work(&pfdev->js->queue[i].sched.work_tdr);
>  
> -out:
> -	mutex_unlock(&queue->lock);
>  
> -	return stopped;
> -}
> +	/* Now resubmit jobs that were previously queued but didn't have a
> +	 * chance to finish.
> +	 * FIXME: We temporarily get out of the DMA fence signalling section
> +	 * while resubmitting jobs because the job submission logic will
> +	 * allocate memory with the GFP_KERNEL flag which can trigger memory
> +	 * reclaim and exposes a lock ordering issue.
> +	 */
> +	dma_fence_end_signalling(cookie);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++)
> +		drm_sched_resubmit_jobs(&pfdev->js->queue[i].sched);
> +	cookie = dma_fence_begin_signalling();
>  
> -static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
> -{
> -	enum panfrost_queue_status old_status;
> +	for (i = 0; i < NUM_JOB_SLOTS; i++)
> +		drm_sched_start(&pfdev->js->queue[i].sched, true);
>  
> -	mutex_lock(&queue->lock);
> -	old_status = atomic_xchg(&queue->status,
> -				 PANFROST_QUEUE_STATUS_STARTING);
> -	WARN_ON(old_status != PANFROST_QUEUE_STATUS_STOPPED);
> -
> -	/* Restore the original timeout before starting the scheduler. */
> -	queue->sched.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
> -	drm_sched_resubmit_jobs(&queue->sched);
> -	drm_sched_start(&queue->sched, true);
> -	old_status = atomic_xchg(&queue->status,
> -				 PANFROST_QUEUE_STATUS_ACTIVE);
> -	if (old_status == PANFROST_QUEUE_STATUS_FAULT_PENDING)
> -		drm_sched_fault(&queue->sched);
> -
> -	mutex_unlock(&queue->lock);
> +	dma_fence_end_signalling(cookie);
>  }
>  
