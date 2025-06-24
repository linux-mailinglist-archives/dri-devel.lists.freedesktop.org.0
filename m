Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C76AE6708
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4F10E5B5;
	Tue, 24 Jun 2025 13:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC5F610E5B4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:50:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E123113E;
 Tue, 24 Jun 2025 06:50:21 -0700 (PDT)
Received: from [10.57.29.71] (unknown [10.57.29.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99E523F58B;
 Tue, 24 Jun 2025 06:50:32 -0700 (PDT)
Message-ID: <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
Date: Tue, 24 Jun 2025 14:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
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

On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
[...]
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f826c5002a6c0ecbf9aed4 100644
> --- a/drivers/accel/rocket/rocket_device.h
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -13,6 +13,8 @@
>   struct rocket_device {
>   	struct drm_device ddev;
>   
> +	struct mutex sched_lock;
> +
>   	struct mutex iommu_lock;

Just realised I missed this in the last patch, but iommu_lock appears to 
be completely unnecessary now.

>   	struct rocket_core *cores;
[...]
> +static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
> +{
> +	struct rocket_task *task;
> +	bool task_pp_en = 1;
> +	bool task_count = 1;
> +
> +	/* GO ! */
> +
> +	/* Don't queue the job if a reset is in progress */
> +	if (atomic_read(&core->reset.pending))
> +		return;
> +
> +	task = &job->tasks[job->next_task_idx];
> +	job->next_task_idx++;
> +
> +	rocket_pc_writel(core, BASE_ADDRESS, 0x1);
> +
> +	rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);
> +	rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);

Those really look like bitfield operations rather than actual arithmetic 
to me.

> +
> +	rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);

I don't see how regcmd is created (I guess that's in userspace?), but 
given that it's explicitly u64 all the way through - and especially 
since you claim to support 40-bit DMA addresses - it definitely seems 
suspicious that the upper 32 bits never seem to be consumed anywhere :/

> +	rocket_pc_writel(core, REGISTER_AMOUNTS, (task->regcmd_count + 1) / 2 - 1);
> +
> +	rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_MASK_DPU_1);
> +	rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_CLEAR_DPU_1);
> +
> +	rocket_pc_writel(core, TASK_CON, ((0x6 | task_pp_en) << 12) | task_count);
> +
> +	rocket_pc_writel(core, TASK_DMA_BASE_ADDR, 0x0);
> +
> +	rocket_pc_writel(core, OPERATION_ENABLE, 0x1);
> +
> +	dev_dbg(core->dev, "Submitted regcmd at 0x%llx to core %d", task->regcmd, core->index);
> +}
[...]
> +static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
> +{
> +	struct rocket_job *job = to_rocket_job(sched_job);
> +	struct rocket_device *rdev = job->rdev;
> +	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
> +	struct dma_fence *fence = NULL;
> +	int ret;
> +
> +	if (unlikely(job->base.s_fence->finished.error))
> +		return NULL;
> +
> +	/*
> +	 * Nothing to execute: can happen if the job has finished while
> +	 * we were resetting the GPU.

GPU? (Similarly in various other comments/prints)

> +	 */
> +	if (job->next_task_idx == job->task_count)
> +		return NULL;
> +
> +	fence = rocket_fence_create(core);
> +	if (IS_ERR(fence))
> +		return fence;
> +
> +	if (job->done_fence)
> +		dma_fence_put(job->done_fence);
> +	job->done_fence = dma_fence_get(fence);
> +
> +	ret = pm_runtime_get_sync(core->dev);
> +	if (ret < 0)
> +		return fence;
> +
> +	ret = iommu_attach_group(job->domain, iommu_group_get(core->dev));

I don't see iommu_group_put() anywhere, so you're leaking refcounts all 
over.

> +	if (ret < 0)
> +		return fence;
> +
> +	scoped_guard(spinlock, &core->job_lock) {
> +		core->in_flight_job = job;
> +		rocket_job_hw_submit(core, job);
> +	}
> +
> +	return fence;
> +}
[...]
> +static void rocket_job_handle_irq(struct rocket_core *core)
> +{
> +	u32 status, raw_status;
> +
> +	pm_runtime_mark_last_busy(core->dev);
> +
> +	status = rocket_pc_readl(core, INTERRUPT_STATUS);
> +	raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
> +
> +	rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
> +	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);

What was the point of reading the status registers if we're just going 
to blindly clear every possible condition anyway?

> +	scoped_guard(spinlock, &core->job_lock)
> +		if (core->in_flight_job)
> +			rocket_job_handle_done(core, core->in_flight_job);

But then is it really OK to just start the next task regardless of 
whether the current task was reporting successful completion or an error?

> +}
> +
> +static void
> +rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
> +{
> +	bool cookie;
> +
> +	if (!atomic_read(&core->reset.pending))
> +		return;
> +
> +	/*
> +	 * Stop the scheduler.
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
> +	drm_sched_stop(&core->sched, bad);
> +
> +	cookie = dma_fence_begin_signalling();
> +
> +	if (bad)
> +		drm_sched_increase_karma(bad);
> +
> +	/*
> +	 * Mask job interrupts and synchronize to make sure we won't be
> +	 * interrupted during our reset.
> +	 */
> +	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
> +	synchronize_irq(core->irq);

...except it's a shared IRQ, so it can still merrily fire at any time.

> +
> +	/* Handle the remaining interrupts before we reset. */
> +	rocket_job_handle_irq(core);
> +
> +	/*
> +	 * Remaining interrupts have been handled, but we might still have
> +	 * stuck jobs. Let's make sure the PM counters stay balanced by
> +	 * manually calling pm_runtime_put_noidle() and
> +	 * rocket_devfreq_record_idle() for each stuck job.
> +	 * Let's also make sure the cycle counting register's refcnt is
> +	 * kept balanced to prevent it from running forever

Comments that don't match the code are more confusing than helpful :/

> +	 */
> +	scoped_guard(spinlock, &core->job_lock) {
> +		if (core->in_flight_job)
> +			pm_runtime_put_noidle(core->dev);
> +
> +		core->in_flight_job = NULL;
> +	}
> +
> +	/* Proceed with reset now. */
> +	pm_runtime_force_suspend(core->dev);
> +	pm_runtime_force_resume(core->dev);

Can you guarantee that actually resets the hardware if something else is 
holding the power domain open or RPM is disabled? I'm not familiar with 
the details of drm_sched, but if there are other jobs queued behind the 
stuck one would it even pass the rocket_job_is_idle() check for suspend 
to succeed anyway?

Not to mention that you have an actual reset control in the DT binding, 
which isn't even optional... :/

> +	/* GPU has been reset, we can clear the reset pending bit. */
> +	atomic_set(&core->reset.pending, 0);
> +
> +	/*
> +	 * Now resubmit jobs that were previously queued but didn't have a
> +	 * chance to finish.
> +	 * FIXME: We temporarily get out of the DMA fence signalling section
> +	 * while resubmitting jobs because the job submission logic will
> +	 * allocate memory with the GFP_KERNEL flag which can trigger memory
> +	 * reclaim and exposes a lock ordering issue.
> +	 */
> +	dma_fence_end_signalling(cookie);
> +	drm_sched_resubmit_jobs(&core->sched);

Since I happened to look, this says it's deprecated?

> +	cookie = dma_fence_begin_signalling();
> +
> +	/* Restart the scheduler */
> +	drm_sched_start(&core->sched, 0);
> +
> +	dma_fence_end_signalling(cookie);
> +}
> +
> +static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_job)
> +{
> +	struct rocket_job *job = to_rocket_job(sched_job);
> +	struct rocket_device *rdev = job->rdev;
> +	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
> +
> +	/*
> +	 * If the GPU managed to complete this jobs fence, the timeout is
> +	 * spurious. Bail out.
> +	 */
> +	if (dma_fence_is_signaled(job->done_fence))
> +		return DRM_GPU_SCHED_STAT_NOMINAL;

Do we really need the same return condition twice? What if the IRQ fires 
immediately after we've made this check, and is handled without delay 
such that sychronize_irq() effectively still does nothing? Either way 
we've taken longer than the timeout value to observe the job completing 
successfully, and either that's significant and worth warning about or 
it's not - I don't see any point in trying to (inaccurately) nitpick 
*why* it might have happened.

> +	/*
> +	 * Rocket IRQ handler may take a long time to process an interrupt
> +	 * if there is another IRQ handler hogging the processing.
> +	 * For example, the HDMI encoder driver might be stuck in the IRQ
> +	 * handler for a significant time in a case of bad cable connection.

What have HDMI cables got to do with anything here? Yes, in general IRQ 
latency can be high, since CPUs can have IRQs masked and/or be taking 
higher-priority interrupts for any number of reasons. I don't see how an 
oddly-specific example (of apparently poor driver design, to boot) is 
useful.

> +	 * In order to catch such cases and not report spurious rocket
> +	 * job timeouts, synchronize the IRQ handler and re-check the fence
> +	 * status.
> +	 */
> +	synchronize_irq(core->irq);
> +
> +	if (dma_fence_is_signaled(job->done_fence)) {
> +		dev_warn(core->dev, "unexpectedly high interrupt latency\n");
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> +	}
> +
> +	dev_err(core->dev, "gpu sched timeout");
> +
> +	atomic_set(&core->reset.pending, 1);
> +	rocket_reset(core, sched_job);
> +	iommu_detach_group(NULL, iommu_group_get(core->dev));
> +
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> +}
> +
> +static void rocket_reset_work(struct work_struct *work)
> +{
> +	struct rocket_core *core;
> +
> +	core = container_of(work, struct rocket_core, reset.work);
> +	rocket_reset(core, NULL);
> +}
> +
> +static const struct drm_sched_backend_ops rocket_sched_ops = {
> +	.run_job = rocket_job_run,
> +	.timedout_job = rocket_job_timedout,
> +	.free_job = rocket_job_free
> +};
> +
> +static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
> +{
> +	struct rocket_core *core = data;
> +
> +	rocket_job_handle_irq(core);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rocket_job_irq_handler(int irq, void *data)
> +{
> +	struct rocket_core *core = data;
> +	u32 raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);

Given that this can be a shared IRQ as above, it would be a good idea to 
take care to avoid register accesses while suspended. Especially if 
you're trying to utilise suspend to reset a failing job that may well be 
throwing IOMMU faults.

> +
> +	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
> +	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
> +
> +	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
> +	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
> +		return IRQ_NONE;
> +
> +	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +int rocket_job_init(struct rocket_core *core)
> +{
> +	struct drm_sched_init_args args = {
> +		.ops = &rocket_sched_ops,
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = 1,

Ah, does this mean that all the stuff about queued jobs was in fact all 
nonsense anyway?

> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.name = dev_name(core->dev),
> +		.dev = core->dev,
> +	};
> +	int ret;
> +
> +	INIT_WORK(&core->reset.work, rocket_reset_work);
> +	spin_lock_init(&core->job_lock);
> +
> +	core->irq = platform_get_irq(to_platform_device(core->dev), 0);
> +	if (core->irq < 0)
> +		return core->irq;
> +
> +	ret = devm_request_threaded_irq(core->dev, core->irq,
> +					rocket_job_irq_handler,
> +					rocket_job_irq_handler_thread,
> +					IRQF_SHARED, KBUILD_MODNAME "-job",

Is it really a "job" interrupt though? The binding and the register 
definitions suggest it's just a general status interrupt for the core. 
Furthermore since we expect to have multiple cores, being able to more 
easily identify and attribute per-core IRQ activity seems more useful 
for debugging than copy-pasting from something really rather different 
which also expects to be the only one of its kind on the system.

Thanks,
Robin.

> +					core);
> +	if (ret) {
> +		dev_err(core->dev, "failed to request job irq");
> +		return ret;
> +	}
