Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8863B2B4C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B49C6EB3C;
	Thu, 24 Jun 2021 09:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85E066EB3C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:23:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA09D1042;
 Thu, 24 Jun 2021 02:23:53 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B97263F718;
 Thu, 24 Jun 2021 02:23:52 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm/panfrost: Queue jobs on the hardware
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621140226.1685529-1-boris.brezillon@collabora.com>
 <20210621140226.1685529-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <c797d32a-1d0f-3d67-d7cd-fc9f9522d741@arm.com>
Date: Thu, 24 Jun 2021 10:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621140226.1685529-3-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

I tested it out and I see a performance improvement with Mesa which is
nice! However a few concerns noted below.

On 21/06/2021 15:02, Boris Brezillon wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The hardware has a set of '_NEXT' registers that can hold a second job
> while the first is executing. Make use of these registers to enqueue a
> second job per slot.
> 
> v2:
> * Make sure non-faulty jobs get properly paused/resumed on GPU reset
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 311 ++++++++++++++++-----
>  2 files changed, 242 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 95e6044008d2..a87917b9e714 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -101,7 +101,7 @@ struct panfrost_device {
>  
>  	struct panfrost_job_slot *js;
>  
> -	struct panfrost_job *jobs[NUM_JOB_SLOTS];
> +	struct panfrost_job *jobs[NUM_JOB_SLOTS][2];
>  	struct list_head scheduled_jobs;
>  
>  	struct panfrost_perfcnt *perfcnt;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 1b5c636794a1..888eceed227f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -4,6 +4,7 @@
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/dma-resv.h>
> @@ -41,6 +42,7 @@ struct panfrost_queue_state {
>  };
>  
>  struct panfrost_job_slot {
> +	int irq;
>  	struct panfrost_queue_state queue[NUM_JOB_SLOTS];
>  	spinlock_t job_lock;
>  };
> @@ -148,9 +150,43 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
>  	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), affinity >> 32);
>  }
>  
> +static struct panfrost_job *
> +panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
> +{
> +	struct panfrost_job *job = pfdev->jobs[slot][0];
> +
> +	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
> +	pfdev->jobs[slot][1] = NULL;
> +
> +	return job;
> +}
> +
> +static unsigned int
> +panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
> +		     struct panfrost_job *job)
> +{
> +	if (!pfdev->jobs[slot][0]) {
> +		pfdev->jobs[slot][0] = job;
> +		return 0;
> +	}
> +
> +	WARN_ON(pfdev->jobs[slot][1]);
> +	pfdev->jobs[slot][1] = job;
> +	return 1;
> +}
> +
> +static u32
> +panfrost_get_job_chain_flag(const struct panfrost_job *job)
> +{
> +	struct panfrost_fence *f = to_panfrost_fence(job->done_fence);
> +
> +	return (f->seqno & 1) ? JS_CONFIG_JOB_CHAIN_FLAG : 0;
> +}
> +
>  static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
> +	unsigned int subslot;
>  	u32 cfg;
>  	u64 jc_head = job->jc;
>  	int ret;
> @@ -176,7 +212,8 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	 * start */
>  	cfg |= JS_CONFIG_THREAD_PRI(8) |
>  		JS_CONFIG_START_FLUSH_CLEAN_INVALIDATE |
> -		JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE;
> +		JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE |
> +		panfrost_get_job_chain_flag(job);
>  
>  	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION))
>  		cfg |= JS_CONFIG_ENABLE_FLUSH_REDUCTION;
> @@ -190,10 +227,17 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  		job_write(pfdev, JS_FLUSH_ID_NEXT(js), job->flush_id);
>  
>  	/* GO ! */
> -	dev_dbg(pfdev->dev, "JS: Submitting atom %p to js[%d] with head=0x%llx",
> -				job, js, jc_head);
>  
> -	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
> +	spin_lock(&pfdev->js->job_lock);
> +	subslot = panfrost_enqueue_job(pfdev, js, job);
> +	/* Don't queue the job if a reset is in progress */
> +	if (!atomic_read(&pfdev->reset.pending)) {
> +		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
> +		dev_dbg(pfdev->dev,
> +			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
> +			job, js, subslot, jc_head, cfg & 0xf);
> +	}
> +	spin_unlock(&pfdev->js->job_lock);
>  }
>  
>  static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
> @@ -351,7 +395,11 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
>  	if (unlikely(job->base.s_fence->finished.error))
>  		return NULL;
>  
> -	pfdev->jobs[slot] = job;
> +	/* Nothing to execute: can happen if the job has finished while
> +	 * we were resetting the GPU.
> +	 */
> +	if (!job->jc)
> +		return NULL;
>  
>  	fence = panfrost_fence_create(pfdev, slot);
>  	if (IS_ERR(fence))
> @@ -475,25 +523,67 @@ static const struct drm_sched_backend_ops panfrost_sched_ops = {
>  
>  static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  {
> -	int j;
> +	struct panfrost_job *done[NUM_JOB_SLOTS][2] = {};
> +	struct panfrost_job *failed[NUM_JOB_SLOTS] = {};
> +	u32 js_state, js_events = 0;
> +	unsigned int i, j;
>  
> -	dev_dbg(pfdev->dev, "jobslot irq status=%x\n", status);
> +	while (status) {
> +		for (j = 0; j < NUM_JOB_SLOTS; j++) {
> +			if (status & JOB_INT_MASK_DONE(j)) {
> +				if (done[j][0]) {
> +					done[j][1] = panfrost_dequeue_job(pfdev, j);
> +					WARN_ON(!done[j][1]);
> +				} else {
> +					done[j][0] = panfrost_dequeue_job(pfdev, j);
> +					WARN_ON(!done[j][0]);

NIT: I'd be tempted to move this WARN_ON into panfrost_dequeue_job() as
it's relevant for any call to the function.

> +				}
> +			}
>  
> -	for (j = 0; status; j++) {
> -		u32 mask = MK_JS_MASK(j);
> +			if (status & JOB_INT_MASK_ERR(j)) {
> +				/* Cancel the next submission. Will be submitted
> +				 * after we're done handling this failure if
> +				 * there's no reset pending.
> +				 */
> +				job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
> +				failed[j] = panfrost_dequeue_job(pfdev, j);
> +			}
> +		}
>  
> -		if (!(status & mask))
> +		/* JS_STATE is sampled when JOB_INT_CLEAR is written.
> +		 * For each BIT(slot) or BIT(slot + 16) bit written to
> +		 * JOB_INT_CLEAR, the corresponding bits in JS_STATE
> +		 * (BIT(slot) and BIT(slot + 16)) are updated, but this
> +		 * is racy. If we only have one job done at the time we
> +		 * read JOB_INT_RAWSTAT but the second job fails before we
> +		 * clear the status, we end up with a status containing
> +		 * only the DONE bit and consider both jobs as DONE since
> +		 * JS_STATE reports both NEXT and CURRENT as inactive.
> +		 * To prevent that, let's repeat this clear+read steps
> +		 * until status is 0.
> +		 */
> +		job_write(pfdev, JOB_INT_CLEAR, status);
> +		js_state = job_read(pfdev, JOB_INT_JS_STATE);

This seems a bit dodgy. The spec says that JOB_INT_JS_STATE[1] is
updated only for the job slots which have bits set in the JOB_INT_CLEAR.
So there's potentially two problems:

 * The spec makes no gaurentee about the values of the bits for other
slots. But we're not masking off those bits.

 * If we loop (e.g. because the other slot finishes while handling the
first interrupt) then we may lose the state for the first slot.

I'm not sure what the actual hardware returns in the bits which are
unrelated to the previous JOB_INT_CLEAR - kbase is careful only to
consider the bits relating to the slot it's currently dealing with.

[1] Actually JOB_IRQ_JS_STATE - I sometimes think we should rename to
match the spec, I keep searching the docs for the wrong name ;)

> +		js_events |= status;
> +		status = job_read(pfdev, JOB_INT_RAWSTAT);
> +	}
> +
> +	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> +		if (!(js_events & MK_JS_MASK(j)))
>  			continue;
>  
> -		job_write(pfdev, JOB_INT_CLEAR, mask);
> -
> -		if (status & JOB_INT_MASK_ERR(j)) {
> -			enum panfrost_queue_status old_status;
> +		if (failed[j]) {
>  			u32 js_status = job_read(pfdev, JS_STATUS(j));
>  			int error = panfrost_exception_to_error(js_status);
>  			const char *exception_name = panfrost_exception_name(js_status);
>  
> -			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
> +			if (js_status == DRM_PANFROST_EXCEPTION_STOPPED) {
> +				/* Update the job head so we can resume */
> +				failed[j]->jc = job_read(pfdev, JS_TAIL_LO(j)) |
> +						((u64)job_read(pfdev, JS_TAIL_HI(j)) << 32);
> +			} else {
> +				failed[j]->jc = 0;
> +			}
>  
>  			if (!error) {
>  				dev_dbg(pfdev->dev, "js interrupt, js=%d, status=%s, head=0x%x, tail=0x%x",
> @@ -505,51 +595,68 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  					j, exception_name,
>  					job_read(pfdev, JS_HEAD_LO(j)),
>  					job_read(pfdev, JS_TAIL_LO(j)));
> +				dma_fence_set_error(failed[j]->done_fence, error);
>  			}
>  
> -			/* If we need a reset, signal it to the reset handler,
> -			 * otherwise, update the fence error field and signal
> -			 * the job fence.
> +			panfrost_mmu_as_put(pfdev, failed[j]->file_priv->mmu);
> +			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> +
> +			dma_fence_signal_locked(failed[j]->done_fence);
> +			pm_runtime_put_autosuspend(pfdev->dev);
> +
> +			if (panfrost_exception_needs_reset(pfdev, js_status))
> +				panfrost_device_schedule_reset(pfdev);
> +		} else if (pfdev->jobs[j][0] && !(js_state & MK_JS_MASK(j))) {
> +			/* When the current job doesn't fail, the JM dequeues
> +			 * the next job without waiting for an ACK, this means
> +			 * we can have 2 jobs dequeued and only catch the
> +			 * interrupt when the second one is done. If both slots
> +			 * are inactive, but one job remains in pfdev->jobs[j],
> +			 * consider it done. Of course that doesn't apply if a
> +			 * failure happened since we cancelled execution of the
> +			 * job in _NEXT (see above).
>  			 */
> -			if (panfrost_exception_needs_reset(pfdev, js_status)) {
> -				/*
> -				 * When the queue is being restarted we don't report
> -				 * faults directly to avoid races between the timeout
> -				 * and reset handlers. panfrost_scheduler_start() will
> -				 * call drm_sched_fault() after the queue has been
> -				 * started if status == FAULT_PENDING.
> -				 */
> -				old_status = atomic_cmpxchg(&pfdev->js->queue[j].status,
> -							    PANFROST_QUEUE_STATUS_STARTING,
> -							    PANFROST_QUEUE_STATUS_FAULT_PENDING);
> -				if (old_status == PANFROST_QUEUE_STATUS_ACTIVE)
> -					drm_sched_fault(&pfdev->js->queue[j].sched);
> -			} else {
> -				dma_fence_set_error(pfdev->jobs[j]->done_fence,
> -						    panfrost_exception_to_error(js_status));
> -				status |= JOB_INT_MASK_DONE(j);
> -			}
> +			if (WARN_ON(!done[j][0]))
> +				done[j][0] = panfrost_dequeue_job(pfdev, j);
> +			else
> +				done[j][1] = panfrost_dequeue_job(pfdev, j);
>  		}
>  
> -		if (status & JOB_INT_MASK_DONE(j)) {
> -			struct panfrost_job *job;
> +		for (i = 0; i < ARRAY_SIZE(done[0]) && done[j][i]; i++) {
> +			/* Set ->jc to 0 to avoid re-submitting an already
> +			 * finished job (can happen when we receive the DONE
> +			 * interrupt while doing a GPU reset).
> +			 */
> +			done[j][i]->jc = 0;
> +			panfrost_mmu_as_put(pfdev, done[j][i]->file_priv->mmu);
> +			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
>  
> -			spin_lock(&pfdev->js->job_lock);
> -			job = pfdev->jobs[j];
> -			/* Only NULL if job timeout occurred */
> -			if (job) {
> -				pfdev->jobs[j] = NULL;
> -
> -				panfrost_mmu_as_put(pfdev, job->file_priv->mmu);
> -				panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> -
> -				dma_fence_signal_locked(job->done_fence);
> -				pm_runtime_put_autosuspend(pfdev->dev);
> -			}
> -			spin_unlock(&pfdev->js->job_lock);
> +			dma_fence_signal_locked(done[j][i]->done_fence);
> +			pm_runtime_put_autosuspend(pfdev->dev);
>  		}
> +	}
>  
> -		status &= ~mask;
> +	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> +		if (!(js_events & MK_JS_MASK(j)))
> +			continue;
> +
> +		if (!failed[j] || !pfdev->jobs[j][0])
> +			continue;
> +
> +		if (pfdev->jobs[j][0]->jc == 0) {
> +			/* The job was cancelled, signal the fence now */
> +			struct panfrost_job *canceled = panfrost_dequeue_job(pfdev, j);
> +
> +			panfrost_mmu_as_put(pfdev, canceled->file_priv->mmu);
> +			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> +
> +			dma_fence_set_error(canceled->done_fence, -ECANCELED);
> +			dma_fence_signal_locked(canceled->done_fence);
> +			pm_runtime_put_autosuspend(pfdev->dev);
> +		} else if (!atomic_read(&pfdev->reset.pending)) {
> +			/* Resume the job we stopped if no reset is pending */
> +			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_START);

If I'm following correctly this is resubmitting a soft-stopped job. But
I haven't seen where the new JC pointer is written.

Steve

> +		}
>  	}
>  }
>  
> @@ -583,12 +690,36 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> +static u32 panfrost_active_slots(struct panfrost_device *pfdev,
> +				 u32 *js_state_mask, u32 js_state)
> +{
> +	u32 rawstat;
> +
> +	if (!(js_state & *js_state_mask))
> +		return 0;
> +
> +	rawstat = job_read(pfdev, JOB_INT_RAWSTAT);
> +	if (rawstat) {
> +		unsigned int i;
> +
> +		for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +			if (rawstat & MK_JS_MASK(i))
> +				*js_state_mask &= ~MK_JS_MASK(i);
> +		}
> +	}
> +
> +	return js_state & *js_state_mask;
> +}
> +
>  static void panfrost_reset(struct work_struct *work)
>  {
>  	struct panfrost_device *pfdev = container_of(work,
>  						     struct panfrost_device,
>  						     reset.work);
> +	u32 js_state, js_state_mask = 0xffffffff;
>  	unsigned int i;
> +	bool cookie;
> +	int ret;
>  
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>  		/*
> @@ -612,21 +743,43 @@ static void panfrost_reset(struct work_struct *work)
>  		panfrost_scheduler_stop(&pfdev->js->queue[i], NULL);
>  	}
>  
> -	/* All timers have been stopped, we can safely reset the pending state. */
> -	atomic_set(&pfdev->reset.pending, 0);
> +	/* Mask job interrupts and make sure all interrupt handlers have
> +	 * returned. We'll call the job interrupt handler manually, after
> +	 * issuing soft-stops.
> +	 */
> +	job_write(pfdev, JOB_INT_MASK, 0);
> +	synchronize_irq(pfdev->js->irq);
>  
> -	spin_lock(&pfdev->js->job_lock);
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		if (pfdev->jobs[i]) {
> -			pm_runtime_put_noidle(pfdev->dev);
> -			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> -			pfdev->jobs[i] = NULL;
> -		}
> +		/* Cancel the next job and soft-stop the running job. */
> +		job_write(pfdev, JS_COMMAND_NEXT(i), JS_COMMAND_NOP);
> +		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_SOFT_STOP);
>  	}
> -	spin_unlock(&pfdev->js->job_lock);
>  
> +	/* Wait at most 10ms for soft-stops to complete */
> +	job_write(pfdev, JOB_INT_MASK, 0);
> +	ret = readl_poll_timeout(pfdev->iomem + JOB_INT_JS_STATE, js_state,
> +				 !panfrost_active_slots(pfdev, &js_state_mask, js_state),
> +				 10, 10000);
> +
> +	if (ret)
> +		dev_err(pfdev->dev, "Soft-stop failed (active_mask=%x)\n", js_state);
> +
> +	/* Handle the remaining interrupts before we reset. */
> +	cookie = dma_fence_begin_signalling();
> +	panfrost_job_irq_handler_thread(pfdev->js->irq, pfdev);
> +	dma_fence_end_signalling(cookie);
> +
> +	/* Proceed with reset now. */
>  	panfrost_device_reset(pfdev);
>  
> +	/* Reset is done, we can clear the pending flag. */
> +	atomic_set(&pfdev->reset.pending, 0);
> +
> +	/* Now resubmit jobs that were previously queued but didn't have a
> +	 * chance to finish.
> +	 */
> +	memset(pfdev->jobs, 0, sizeof(pfdev->jobs));
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
>  		panfrost_scheduler_start(&pfdev->js->queue[i]);
>  }
> @@ -634,7 +787,7 @@ static void panfrost_reset(struct work_struct *work)
>  int panfrost_job_init(struct panfrost_device *pfdev)
>  {
>  	struct panfrost_job_slot *js;
> -	int ret, j, irq;
> +	int ret, j;
>  
>  	INIT_WORK(&pfdev->reset.work, panfrost_reset);
>  
> @@ -644,11 +797,11 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  
>  	spin_lock_init(&js->job_lock);
>  
> -	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
> -	if (irq <= 0)
> +	js->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
> +	if (js->irq <= 0)
>  		return -ENODEV;
>  
> -	ret = devm_request_threaded_irq(pfdev->dev, irq,
> +	ret = devm_request_threaded_irq(pfdev->dev, js->irq,
>  					panfrost_job_irq_handler,
>  					panfrost_job_irq_handler_thread,
>  					IRQF_SHARED, KBUILD_MODNAME "-job",
> @@ -665,7 +818,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
>  				     &panfrost_sched_ops,
> -				     1, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> +				     2, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     NULL, "pan_js");
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> @@ -728,12 +881,30 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>  	spin_lock(&pfdev->js->job_lock);
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>  		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> -		struct panfrost_job *job = pfdev->jobs[i];
> +		int j;
>  
> -		if (!job || job->base.entity != entity)
> -			continue;
> +		for (j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
> +			struct panfrost_job *job = pfdev->jobs[i][j];
> +			u32 cmd;
>  
> -		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
> +			if (!job || job->base.entity != entity)
> +				continue;
> +
> +			if (j == 1) {
> +				/* Try to cancel the job before it starts */
> +				job_write(pfdev, JS_COMMAND_NEXT(i), JS_COMMAND_NOP);
> +				/* Reset the job head so it doesn't get restarted if
> +				 * the job in the first slot failed.
> +				 */
> +				job->jc = 0;
> +			}
> +
> +			cmd = panfrost_get_job_chain_flag(job) ?
> +			      JS_COMMAND_HARD_STOP_1 :
> +			      JS_COMMAND_HARD_STOP_0;
> +
> +			job_write(pfdev, JS_COMMAND(i), cmd);
> +		}
>  	}
>  	spin_unlock(&pfdev->js->job_lock);
>  }
> 

