Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D03B7156
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB9C6E861;
	Tue, 29 Jun 2021 11:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3DE6E861
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 11:32:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A76C51F424CD;
 Tue, 29 Jun 2021 12:32:18 +0100 (BST)
Date: Tue, 29 Jun 2021 13:32:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 09/16] drm/panfrost: Simplify the reset serialization
 logic
Message-ID: <20210629133214.7a068bf2@collabora.com>
In-Reply-To: <20210629073510.2764391-10-boris.brezillon@collabora.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-10-boris.brezillon@collabora.com>
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

On Tue, 29 Jun 2021 09:35:03 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> @@ -379,57 +370,72 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
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
> +	if (!atomic_read(&pfdev->reset.pending))
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
> +	for (i = 0; i < NUM_JOB_SLOTS; i++)
> +		cancel_delayed_work(&pfdev->js->queue[i].sched.work_tdr);
>  

Those cancel_delayed_work() calls are useless, drm_sched_stop()
canceled those works already. I'll get rid of them in v6.
