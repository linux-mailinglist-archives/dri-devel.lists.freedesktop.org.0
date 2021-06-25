Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514A33B46CD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 17:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695DF6EE03;
	Fri, 25 Jun 2021 15:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C317D6EE03
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 15:42:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 201C81042;
 Fri, 25 Jun 2021 08:42:23 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69AF3F694;
 Fri, 25 Jun 2021 08:42:21 -0700 (PDT)
Subject: Re: [PATCH v3 09/15] drm/panfrost: Simplify the reset serialization
 logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-10-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3379ff36-f389-762f-9c16-d3745e3979c7@arm.com>
Date: Fri, 25 Jun 2021 16:42:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625133327.2598825-10-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2021 14:33, Boris Brezillon wrote:
> Now that we can pass our own workqueue to drm_sched_init(), we can use

Except that part has somehow slipped through to patch 15:

> @@ -633,8 +849,9 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
>  				     &panfrost_sched_ops,
> -				     1, 0,
> -				     msecs_to_jiffies(JOB_TIMEOUT_MS), NULL,
> +				     nslots, 0,
> +				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> +				     pfdev->reset.wq,
>  				     NULL, "pan_js");
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);

Steve

> an ordered workqueue on for both the scheduler timeout tdr and our own
> reset work (which we use when the reset is not caused by a fault/timeout
> on a specific job, like when we have AS_ACTIVE bit stuck). This
> guarantees that the timeout handlers and reset handler can't run
> concurrently which drastically simplifies the locking.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |   6 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 185 ++++++++-------------
>  2 files changed, 71 insertions(+), 120 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 6024eaf34ba0..bfe32907ba6b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -108,6 +108,7 @@ struct panfrost_device {
>  	struct mutex sched_lock;
>  
>  	struct {
> +		struct workqueue_struct *wq;
>  		struct work_struct work;
>  		atomic_t pending;
>  	} reset;
> @@ -177,9 +178,8 @@ const char *panfrost_exception_name(u32 exception_code);
>  static inline void
>  panfrost_device_schedule_reset(struct panfrost_device *pfdev)
>  {
> -	/* Schedule a reset if there's no reset in progress. */
> -	if (!atomic_xchg(&pfdev->reset.pending, 1))
> -		schedule_work(&pfdev->reset.work);
> +	atomic_set(&pfdev->reset.pending, 1);
> +	queue_work(pfdev->reset.wq, &pfdev->reset.work);
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index e0c479e67304..88d34fd781e8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -25,17 +25,8 @@
>  #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
>  #define job_read(dev, reg) readl(dev->iomem + (reg))
>  
> -enum panfrost_queue_status {
> -	PANFROST_QUEUE_STATUS_ACTIVE,
> -	PANFROST_QUEUE_STATUS_STOPPED,
> -	PANFROST_QUEUE_STATUS_STARTING,
> -	PANFROST_QUEUE_STATUS_FAULT_PENDING,
> -};
> -
>  struct panfrost_queue_state {
>  	struct drm_gpu_scheduler sched;
> -	atomic_t status;
> -	struct mutex lock;
>  	u64 fence_context;
>  	u64 emit_seqno;
>  };
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
>  static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
> @@ -454,11 +461,8 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  		job_read(pfdev, JS_TAIL_LO(js)),
>  		sched_job);
>  
> -	/* Scheduler is already stopped, nothing to do. */
> -	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> -
> -	panfrost_device_schedule_reset(pfdev);
> +	atomic_set(&pfdev->reset.pending, 1);
> +	panfrost_reset(pfdev, sched_job);
>  
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> @@ -485,8 +489,6 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  		job_write(pfdev, JOB_INT_CLEAR, mask);
>  
>  		if (status & JOB_INT_MASK_ERR(j)) {
> -			enum panfrost_queue_status old_status;
> -
>  			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
>  
>  			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
> @@ -494,19 +496,7 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  				panfrost_exception_name(job_read(pfdev, JS_STATUS(j))),
>  				job_read(pfdev, JS_HEAD_LO(j)),
>  				job_read(pfdev, JS_TAIL_LO(j)));
> -
> -			/*
> -			 * When the queue is being restarted we don't report
> -			 * faults directly to avoid races between the timeout
> -			 * and reset handlers. panfrost_scheduler_start() will
> -			 * call drm_sched_fault() after the queue has been
> -			 * started if status == FAULT_PENDING.
> -			 */
> -			old_status = atomic_cmpxchg(&pfdev->js->queue[j].status,
> -						    PANFROST_QUEUE_STATUS_STARTING,
> -						    PANFROST_QUEUE_STATUS_FAULT_PENDING);
> -			if (old_status == PANFROST_QUEUE_STATUS_ACTIVE)
> -				drm_sched_fault(&pfdev->js->queue[j].sched);
> +			drm_sched_fault(&pfdev->js->queue[j].sched);
>  		}
>  
>  		if (status & JOB_INT_MASK_DONE(j)) {
> @@ -561,56 +551,13 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -static void panfrost_reset(struct work_struct *work)
> +static void panfrost_reset_work(struct work_struct *work)
>  {
>  	struct panfrost_device *pfdev = container_of(work,
>  						     struct panfrost_device,
>  						     reset.work);
> -	unsigned int i;
> -	bool cookie;
>  
> -	cookie = dma_fence_begin_signalling();
> -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		/*
> -		 * We want pending timeouts to be handled before we attempt
> -		 * to stop the scheduler. If we don't do that and the timeout
> -		 * handler is in flight, it might have removed the bad job
> -		 * from the list, and we'll lose this job if the reset handler
> -		 * enters the critical section in panfrost_scheduler_stop()
> -		 * before the timeout handler.
> -		 *
> -		 * Timeout is set to MAX_SCHEDULE_TIMEOUT - 1 because we need
> -		 * something big enough to make sure the timer will not expire
> -		 * before we manage to stop the scheduler, but we can't use
> -		 * MAX_SCHEDULE_TIMEOUT because drm_sched_get_cleanup_job()
> -		 * considers that as 'timer is not running' and will dequeue
> -		 * the job without making sure the timeout handler is not
> -		 * running.
> -		 */
> -		pfdev->js->queue[i].sched.timeout = MAX_SCHEDULE_TIMEOUT - 1;
> -		cancel_delayed_work_sync(&pfdev->js->queue[i].sched.work_tdr);
> -		panfrost_scheduler_stop(&pfdev->js->queue[i], NULL);
> -	}
> -
> -	/* All timers have been stopped, we can safely reset the pending state. */
> -	atomic_set(&pfdev->reset.pending, 0);
> -
> -	spin_lock(&pfdev->js->job_lock);
> -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		if (pfdev->jobs[i]) {
> -			pm_runtime_put_noidle(pfdev->dev);
> -			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> -			pfdev->jobs[i] = NULL;
> -		}
> -	}
> -	spin_unlock(&pfdev->js->job_lock);
> -
> -	panfrost_device_reset(pfdev);
> -
> -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		panfrost_scheduler_start(&pfdev->js->queue[i]);
> -
> -	dma_fence_end_signalling(cookie);
> +	panfrost_reset(pfdev, NULL);
>  }
>  
>  int panfrost_job_init(struct panfrost_device *pfdev)
> @@ -618,7 +565,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  	struct panfrost_job_slot *js;
>  	int ret, j, irq;
>  
> -	INIT_WORK(&pfdev->reset.work, panfrost_reset);
> +	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
>  
>  	pfdev->js = js = devm_kzalloc(pfdev->dev, sizeof(*js), GFP_KERNEL);
>  	if (!js)
> @@ -640,9 +587,11 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		return ret;
>  	}
>  
> -	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> -		mutex_init(&js->queue[j].lock);
> +	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", 0);
> +	if (!pfdev->reset.wq)
> +		return -ENOMEM;
>  
> +	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>  		js->queue[j].fence_context = dma_fence_context_alloc(1);
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
> @@ -664,6 +613,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  	for (j--; j >= 0; j--)
>  		drm_sched_fini(&js->queue[j].sched);
>  
> +	destroy_workqueue(pfdev->reset.wq);
>  	return ret;
>  }
>  
> @@ -676,9 +626,10 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
>  
>  	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>  		drm_sched_fini(&js->queue[j].sched);
> -		mutex_destroy(&js->queue[j].lock);
>  	}
>  
> +	cancel_work_sync(&pfdev->reset.work);
> +	destroy_workqueue(pfdev->reset.wq);
>  }
>  
>  int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
> 

