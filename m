Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88B8903D9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA21124A6;
	Thu, 28 Mar 2024 15:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E2031124A6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:50:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D495D15DB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:50:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD0B83F694
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:50:06 -0700 (PDT)
Date: Thu, 28 Mar 2024 15:49:55 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH 1/2] drm/panthor: Enable fdinfo for cycle and time
 measurements
Message-ID: <ZgWRo1z8NvCEqP0r@e110455-lin.cambridge.arm.com>
References: <20240305211000.659103-1-adrian.larumbe@collabora.com>
 <20240305211000.659103-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305211000.659103-2-adrian.larumbe@collabora.com>
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

Hi Adrián,

Appologies for the delay in reviewing this.

On Tue, Mar 05, 2024 at 09:05:49PM +0000, Adrián Larumbe wrote:
> These values are sampled by the firmware right before jumping into the UM
> command stream and immediately after returning from it, and then kept inside a
> per-job accounting structure. That structure is held inside the group's syncobjs
> buffer object, at an offset that depends on the job's queue slot number and the
> queue's index within the group.

I think this commit message is misleadingly short compared to the size of the
changes. If I may, I would like to suggest that you split this commit into two
parts, one introducing the changes in the ringbuf and syncobjs structures and
the other exporting the statistics in the fdinfo.

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c |  10 +
>  drivers/gpu/drm/panthor/panthor_device.h  |  11 ++
>  drivers/gpu/drm/panthor/panthor_drv.c     |  31 ++++
>  drivers/gpu/drm/panthor/panthor_sched.c   | 217 +++++++++++++++++++---
>  4 files changed, 241 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 7ac4fa290f27..51a7b734edcd 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -91,6 +91,7 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
>  	spin_lock_irqsave(&pdevfreq->lock, irqflags);
>  
>  	panthor_devfreq_update_utilization(pdevfreq);
> +	ptdev->current_frequency = status->current_frequency;
>  
>  	status->total_time = ktime_to_ns(ktime_add(pdevfreq->busy_time,
>  						   pdevfreq->idle_time));
> @@ -130,6 +131,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	struct panthor_devfreq *pdevfreq;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
> +	unsigned long freq = ULONG_MAX;
>  	int ret;
>  
>  	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
> @@ -204,6 +206,14 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  
>  	dev_pm_opp_put(opp);
>  
> +	/* Find the fastest defined rate  */
> +	opp = dev_pm_opp_find_freq_floor(dev, &freq);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	ptdev->fast_rate = freq;
> +
> +	dev_pm_opp_put(opp);
> +
>  	/*
>  	 * Setup default thresholds for the simple_ondemand governor.
>  	 * The values are chosen based on experiments.
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 51c9d61b6796..10e970921ca3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -162,6 +162,14 @@ struct panthor_device {
>  		 */
>  		u32 *dummy_latest_flush;
>  	} pm;
> +
> +	unsigned long current_frequency;
> +	unsigned long fast_rate;
> +};
> +
> +struct panthor_gpu_usage {
> +	u64 time;
> +	u64 cycles;
>  };
>  
>  /**
> @@ -176,6 +184,9 @@ struct panthor_file {
>  
>  	/** @groups: Scheduling group pool attached to this file. */
>  	struct panthor_group_pool *groups;
> +
> +	/** @stats: cycle and timestamp measures for job execution. */
> +	struct panthor_gpu_usage stats;
>  };
>  
>  int panthor_device_init(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ff484506229f..fa06b9e2c6cd 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -3,6 +3,10 @@
>  /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
>  /* Copyright 2019 Collabora ltd. */
>  
> +#ifdef CONFIG_HAVE_ARM_ARCH_TIMER
> +#include <asm/arch_timer.h>
> +#endif
> +
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> @@ -28,6 +32,8 @@
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>  
> +#define NS_PER_SEC      1000000000ULL
> +
>  /**
>   * DOC: user <-> kernel object copy helpers.
>   */
> @@ -1336,6 +1342,29 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return ret;
>  }
>  
> +static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
> +				    struct panthor_file *pfile,
> +				    struct drm_printer *p)
> +{
> +#ifdef CONFIG_HAVE_ARM_ARCH_TIMER
> +	drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
> +		   DIV_ROUND_UP_ULL((pfile->stats.time * NS_PER_SEC),
> +				    arch_timer_get_cntfrq()));
> +#endif
> +	drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
> +	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
> +	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
> +}
> +
> +static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_device *dev = file->minor->dev;
> +	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
> +
> +	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
> +
> +}
> +
>  static const struct file_operations panthor_drm_driver_fops = {
>  	.open = drm_open,
>  	.release = drm_release,
> @@ -1345,6 +1374,7 @@ static const struct file_operations panthor_drm_driver_fops = {
>  	.read = drm_read,
>  	.llseek = noop_llseek,
>  	.mmap = panthor_mmap,
> +	.show_fdinfo = drm_show_fdinfo,
>  };
>  
>  #ifdef CONFIG_DEBUG_FS
> @@ -1363,6 +1393,7 @@ static const struct drm_driver panthor_drm_driver = {
>  			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
>  	.open = panthor_open,
>  	.postclose = panthor_postclose,
> +	.show_fdinfo = panthor_show_fdinfo,
>  	.ioctls = panthor_drm_driver_ioctls,
>  	.num_ioctls = ARRAY_SIZE(panthor_drm_driver_ioctls),
>  	.fops = &panthor_drm_driver_fops,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5f7803b6fc48..751d1453e7a1 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -93,6 +93,8 @@
>  #define MIN_CSGS				3
>  #define MAX_CSG_PRIO				0xf
>  
> +#define SLOTSIZE				(NUM_INSTRS_PER_SLOT * sizeof(u64))

Worth moving NUM_INSTRS_PER_SLOT here too?

> +
>  struct panthor_group;
>  
>  /**
> @@ -393,7 +395,13 @@ struct panthor_queue {
>  #define CSF_MAX_QUEUE_PRIO	GENMASK(3, 0)
>  
>  	/** @ringbuf: Command stream ring-buffer. */
> -	struct panthor_kernel_bo *ringbuf;
> +	struct {
> +		/** @ringbuf: Kernel BO that holds ring buffer. */
> +		struct panthor_kernel_bo *bo;
> +
> +		/** @nelem: Number of slots in the ring buffer. */
> +		unsigned int nelem;

I'm not convinced this nelem is needed. The only place it is used is to check that
job->ringbuf_idx is not too big, which is something we should do in queue_run_job()
function rather than in update_fdinfo_stats(). If we don't change ringbuf to a
structure the patch slims down by more than a dozen lines.

> +	} ringbuf;
>  
>  	/** @iface: Firmware interface. */
>  	struct {
> @@ -466,6 +474,9 @@ struct panthor_queue {
>  		 */
>  		struct list_head in_flight_jobs;
>  	} fence_ctx;
> +
> +	/** @time_offset: Offset of fdinfo stats structs in queue's syncobj. */
> +	unsigned long time_offset;
>  };
>  
>  /**
> @@ -580,7 +591,26 @@ struct panthor_group {
>  	 * One sync object per queue. The position of the sync object is
>  	 * determined by the queue index.
>  	 */
> -	struct panthor_kernel_bo *syncobjs;
> +
> +	struct {
> +		/** @bo: Kernel BO holding the sync objects. */
> +		struct panthor_kernel_bo *bo;
> +
> +		/** @times_offset: Beginning of time stats after objects of sync pool. */
> +		size_t times_offset;
> +	} syncobjs;
> +
> +	/** @fdinfo: Per-file total cycle and timestamp values reference. */
> +	struct {
> +		/** @data: Pointer to actual per-file sample data. */
> +		struct panthor_gpu_usage *data;
> +
> +		/**
> +		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
> +		 * and job post-completion processing function
> +		 */
> +		struct mutex lock;
> +	} fdinfo;
>  
>  	/** @state: Group state. */
>  	enum panthor_group_state state;
> @@ -639,6 +669,18 @@ struct panthor_group {
>  	struct list_head wait_node;
>  };
>  
> +struct panthor_job_times {
> +	struct {
> +		u64 before;
> +		u64 after;
> +	} cycles;
> +
> +	struct {
> +		u64 before;
> +		u64 after;
> +	} time;
> +};
> +
>  /**
>   * group_queue_work() - Queue a group work
>   * @group: Group to queue the work for.
> @@ -718,6 +760,9 @@ struct panthor_job {
>  	/** @queue_idx: Index of the queue inside @group. */
>  	u32 queue_idx;
>  
> +	/** @ringbuf_idx: Index of the queue inside @queue. */

Index of the ringbuffer inside @queue.

> +	u32 ringbuf_idx;
> +
>  	/** @call_info: Information about the userspace command stream call. */
>  	struct {
>  		/** @start: GPU address of the userspace command stream. */
> @@ -814,7 +859,7 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
>  
>  	panthor_queue_put_syncwait_obj(queue);
>  
> -	panthor_kernel_bo_destroy(group->vm, queue->ringbuf);
> +	panthor_kernel_bo_destroy(group->vm, queue->ringbuf.bo);
>  	panthor_kernel_bo_destroy(panthor_fw_vm(group->ptdev), queue->iface.mem);
>  
>  	kfree(queue);
> @@ -828,12 +873,14 @@ static void group_release_work(struct work_struct *work)
>  	struct panthor_device *ptdev = group->ptdev;
>  	u32 i;
>  
> +	mutex_destroy(&group->fdinfo.lock);
> +
>  	for (i = 0; i < group->queue_count; i++)
>  		group_free_queue(group, group->queues[i]);
>  
>  	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->suspend_buf);
>  	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->protm_suspend_buf);
> -	panthor_kernel_bo_destroy(group->vm, group->syncobjs);
> +	panthor_kernel_bo_destroy(group->vm, group->syncobjs.bo);
>  
>  	panthor_vm_put(group->vm);
>  	kfree(group);
> @@ -970,8 +1017,8 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
>  	queue->iface.input->extract = queue->iface.output->extract;
>  	drm_WARN_ON(&ptdev->base, queue->iface.input->insert < queue->iface.input->extract);
>  
> -	cs_iface->input->ringbuf_base = panthor_kernel_bo_gpuva(queue->ringbuf);
> -	cs_iface->input->ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
> +	cs_iface->input->ringbuf_base = panthor_kernel_bo_gpuva(queue->ringbuf.bo);
> +	cs_iface->input->ringbuf_size = panthor_kernel_bo_size(queue->ringbuf.bo);
>  	cs_iface->input->ringbuf_input = queue->iface.input_fw_va;
>  	cs_iface->input->ringbuf_output = queue->iface.output_fw_va;
>  	cs_iface->input->config = CS_CONFIG_PRIORITY(queue->priority) |
> @@ -1926,7 +1973,7 @@ tick_ctx_init(struct panthor_scheduler *sched,
>  	}
>  }
>  
> -#define NUM_INSTRS_PER_SLOT		16
> +#define NUM_INSTRS_PER_SLOT		32

I guess this macro has to be a value that is a power of 2, as it used to divide the ringbuffer size, right?

>  
>  static void
>  group_term_post_processing(struct panthor_group *group)
> @@ -1964,7 +2011,7 @@ group_term_post_processing(struct panthor_group *group)
>  		spin_unlock(&queue->fence_ctx.lock);
>  
>  		/* Manually update the syncobj seqno to unblock waiters. */
> -		syncobj = group->syncobjs->kmap + (i * sizeof(*syncobj));
> +		syncobj = group->syncobjs.bo->kmap + (i * sizeof(*syncobj));
>  		syncobj->status = ~0;
>  		syncobj->seqno = atomic64_read(&queue->fence_ctx.seqno);
>  		sched_queue_work(group->ptdev->scheduler, sync_upd);
> @@ -2715,6 +2762,30 @@ void panthor_sched_post_reset(struct panthor_device *ptdev)
>  	sched_queue_work(sched, sync_upd);
>  }
>  
> +static void update_fdinfo_stats(struct panthor_job *job)
> +{
> +	struct panthor_group *group = job->group;
> +	struct panthor_queue *queue = group->queues[job->queue_idx];
> +	struct panthor_device *ptdev = group->ptdev;
> +	struct panthor_gpu_usage *fdinfo;
> +	struct panthor_job_times *times;
> +
> +	if (drm_WARN_ON(&ptdev->base, job->ringbuf_idx >= queue->ringbuf.nelem))
> +		return;
> +
> +	times = (struct panthor_job_times *)
> +		((unsigned long)group->syncobjs.bo->kmap + queue->time_offset +
> +		 (job->ringbuf_idx * sizeof(struct panthor_job_times)));
> +
> +	mutex_lock(&group->fdinfo.lock);
> +	if ((group->fdinfo.data)) {
> +		fdinfo = group->fdinfo.data;
> +		fdinfo->cycles += times->cycles.after - times->cycles.before;
> +		fdinfo->time += times->time.after - times->time.before;
> +	}
> +	mutex_unlock(&group->fdinfo.lock);
> +}
> +
>  static void group_sync_upd_work(struct work_struct *work)
>  {
>  	struct panthor_group *group =
> @@ -2732,7 +2803,7 @@ static void group_sync_upd_work(struct work_struct *work)
>  		if (!queue)
>  			continue;
>  
> -		syncobj = group->syncobjs->kmap + (queue_idx * sizeof(*syncobj));
> +		syncobj = group->syncobjs.bo->kmap + (queue_idx * sizeof(*syncobj));
>  
>  		spin_lock(&queue->fence_ctx.lock);
>  		list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
> @@ -2750,6 +2821,7 @@ static void group_sync_upd_work(struct work_struct *work)
>  	dma_fence_end_signalling(cookie);
>  
>  	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
> +		update_fdinfo_stats(job);
>  		list_del_init(&job->node);
>  		panthor_job_put(&job->base);
>  	}
> @@ -2765,13 +2837,19 @@ queue_run_job(struct drm_sched_job *sched_job)
>  	struct panthor_queue *queue = group->queues[job->queue_idx];
>  	struct panthor_device *ptdev = group->ptdev;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> -	u32 ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
> +	u32 ringbuf_size = panthor_kernel_bo_size(queue->ringbuf.bo);
>  	u32 ringbuf_insert = queue->iface.input->insert & (ringbuf_size - 1);
> +	u32 ringbuf_index = ringbuf_insert / (SLOTSIZE);
>  	u64 addr_reg = ptdev->csif_info.cs_reg_count -
>  		       ptdev->csif_info.unpreserved_cs_reg_count;
>  	u64 val_reg = addr_reg + 2;
> -	u64 sync_addr = panthor_kernel_bo_gpuva(group->syncobjs) +
> -			job->queue_idx * sizeof(struct panthor_syncobj_64b);
> +	u64 cycle_reg = addr_reg;
> +	u64 time_reg = val_reg;
> +	u64 sync_addr = panthor_kernel_bo_gpuva(group->syncobjs.bo) +
> +		job->queue_idx * sizeof(struct panthor_syncobj_64b);
> +	u64 times_addr = panthor_kernel_bo_gpuva(group->syncobjs.bo) + queue->time_offset +
> +		(ringbuf_index * sizeof(struct panthor_job_times));
> +
>  	u32 waitall_mask = GENMASK(sched->sb_slot_count - 1, 0);
>  	struct dma_fence *done_fence;
>  	int ret;
> @@ -2783,6 +2861,18 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
>  		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
>  
> +		/* MOV48 rX:rX+1, cycles_offset */
> +		(1ull << 56) | (cycle_reg << 48) | (times_addr + offsetof(struct panthor_job_times, cycles.before)),
> +
> +		/* MOV48 rX:rX+1, time_offset */
> +		(1ull << 56) | (time_reg << 48) | (times_addr + offsetof(struct panthor_job_times, time.before)),
> +
> +		/* STORE_STATE cycles */
> +		(40ull << 56) |  (cycle_reg << 40) | (1ll << 32),
> +
> +		/* STORE_STATE timer */
> +		(40ull << 56) |  (time_reg << 40) | (0ll << 32),
> +
>  		/* MOV48 rX:rX+1, cs.start */
>  		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
>  
> @@ -2795,6 +2885,18 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		/* CALL rX:rX+1, rX+2 */
>  		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
>  
> +		/* MOV48 rX:rX+1, cycles_offset */
> +		(1ull << 56) | (cycle_reg << 48) | (times_addr + offsetof(struct panthor_job_times, cycles.after)),
> +
> +		/* MOV48 rX:rX+1, time_offset */
> +		(1ull << 56) | (time_reg << 48) | (times_addr + offsetof(struct panthor_job_times, time.after)),
> +
> +		/* STORE_STATE cycles */
> +		(40ull << 56) |  (cycle_reg << 40) | (1ll << 32),
> +
> +		/* STORE_STATE timer */
> +		(40ull << 56) |  (time_reg << 40) | (0ll << 32),
> +
>  		/* MOV48 rX:rX+1, sync_addr */
>  		(1ull << 56) | (addr_reg << 48) | sync_addr,
>  
> @@ -2839,7 +2941,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		       queue->fence_ctx.id,
>  		       atomic64_inc_return(&queue->fence_ctx.seqno));
>  
> -	memcpy(queue->ringbuf->kmap + ringbuf_insert,
> +	memcpy(queue->ringbuf.bo->kmap + ringbuf_insert,
>  	       call_instrs, sizeof(call_instrs));
>  
>  	panthor_job_get(&job->base);
> @@ -2849,6 +2951,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>  
>  	job->ringbuf.start = queue->iface.input->insert;
>  	job->ringbuf.end = job->ringbuf.start + sizeof(call_instrs);
> +	job->ringbuf_idx = ringbuf_index;
>  
>  	/* Make sure the ring buffer is updated before the INSERT
>  	 * register.
> @@ -2939,7 +3042,8 @@ static const struct drm_sched_backend_ops panthor_queue_sched_ops = {
>  
>  static struct panthor_queue *
>  group_create_queue(struct panthor_group *group,
> -		   const struct drm_panthor_queue_create *args)
> +		   const struct drm_panthor_queue_create *args,
> +		   unsigned int slots_so_far)
>  {
>  	struct drm_gpu_scheduler *drm_sched;
>  	struct panthor_queue *queue;
> @@ -2965,21 +3069,23 @@ group_create_queue(struct panthor_group *group,
>  
>  	queue->priority = args->priority;
>  
> -	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, group->vm,
> +	queue->ringbuf.bo = panthor_kernel_bo_create(group->ptdev, group->vm,
>  						  args->ringbuf_size,
>  						  DRM_PANTHOR_BO_NO_MMAP,
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>  						  PANTHOR_VM_KERNEL_AUTO_VA);
> -	if (IS_ERR(queue->ringbuf)) {
> -		ret = PTR_ERR(queue->ringbuf);
> +	if (IS_ERR(queue->ringbuf.bo)) {
> +		ret = PTR_ERR(queue->ringbuf.bo);
>  		goto err_free_queue;
>  	}
>  
> -	ret = panthor_kernel_bo_vmap(queue->ringbuf);
> +	ret = panthor_kernel_bo_vmap(queue->ringbuf.bo);
>  	if (ret)
>  		goto err_free_queue;
>  
> +	queue->ringbuf.nelem = (args->ringbuf_size / (SLOTSIZE));
> +
>  	queue->iface.mem = panthor_fw_alloc_queue_iface_mem(group->ptdev,
>  							    &queue->iface.input,
>  							    &queue->iface.output,
> @@ -2990,6 +3096,9 @@ group_create_queue(struct panthor_group *group,
>  		goto err_free_queue;
>  	}
>  
> +	queue->time_offset = group->syncobjs.times_offset +
> +		(slots_so_far * sizeof(struct panthor_job_times));
> +
>  	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>  			     group->ptdev->scheduler->wq, 1,
>  			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),

You can use the newly added SLOTSIZE here.

> @@ -3020,6 +3129,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, 0);
>  	struct panthor_group *group = NULL;
> +	unsigned int total_slots;
>  	u32 gid, i, suspend_size;
>  	int ret;
>  
> @@ -3086,33 +3196,77 @@ int panthor_group_create(struct panthor_file *pfile,
>  		goto err_put_group;
>  	}
>  
> -	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
> -						   group_args->queues.count *
> -						   sizeof(struct panthor_syncobj_64b),
> +	/*
> +	 * Need to add size for the fdinfo sample structs, as many as the sum
> +	 * of the number of job slots for every single queue ringbuffer.
> +	 */
> +
> +	for (i = 0, total_slots = 0; i < group_args->queues.count; i++)
> +		total_slots += (queue_args[i].ringbuf_size / (SLOTSIZE));

Minor nit: We should pre-compute here (group_args->queues.count * sizeof(struct panthor_syncobj_64b)) + \
total_slots * sizeof(struct panthor_job_times) and then use it later as argument to panthor_kernel_bo_create()
and memset().

> +
> +	/*
> +	 * Memory layout of group's syncobjs BO
> +	 * group->syncobjs.bo {
> +	 *	struct panthor_syncobj_64b sync1;
> +	 *	struct panthor_syncobj_64b sync2;
> +	 *		...
> +	 *		As many as group_args->queues.count
> +	 *		...
> +	 *	struct panthor_syncobj_64b syncn;
> +	 *	struct panthor_job_times queue_1slot_1
> +	 *	struct panthor_job_times queue_1slot_2
> +	 *		...
> +	 *		As many as queue[i].ringbuf_size / SLOTSIZE
> +	 *		...
> +	 *	struct panthor_job_times queue_1slot_p
> +	 *		...
> +	 *		As many as group_args->queues.count
> +	 *		...
> +	 *	struct panthor_job_times queue_nslot_1
> +	 *	struct panthor_job_times queue_nslot_2
> +	 *		...
> +	 *		As many as queue[n].ringbuf_size / SLOTSIZE
> +	 *	struct panthor_job_times queue_nslot_q

Minor nit: I find it more readable the form "queue1_slotP"... "queueN_slotQ".

> +	 *
> +	 *	Linearly, group->syncobjs.bo = {syncojb1,..,syncobjN,
> +	 *	{queue1 = {js1,..,jsp},..,queueN = {js1,..,jsq}}}
> +	 * }
> +	 *
> +	 */
> +
> +	group->syncobjs.bo = panthor_kernel_bo_create(ptdev, group->vm,
> +						   (group_args->queues.count *
> +						    sizeof(struct panthor_syncobj_64b))
> +						   + (total_slots * sizeof(struct panthor_job_times)),
>  						   DRM_PANTHOR_BO_NO_MMAP,
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>  						   PANTHOR_VM_KERNEL_AUTO_VA);
> -	if (IS_ERR(group->syncobjs)) {
> -		ret = PTR_ERR(group->syncobjs);
> +	if (IS_ERR(group->syncobjs.bo)) {
> +		ret = PTR_ERR(group->syncobjs.bo);
>  		goto err_put_group;
>  	}
>  
> -	ret = panthor_kernel_bo_vmap(group->syncobjs);
> +	ret = panthor_kernel_bo_vmap(group->syncobjs.bo);
>  	if (ret)
>  		goto err_put_group;
>  
> -	memset(group->syncobjs->kmap, 0,
> -	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
> +	memset(group->syncobjs.bo->kmap, 0,
> +	       (group_args->queues.count * sizeof(struct panthor_syncobj_64b)) +
> +	       (total_slots * sizeof(struct panthor_job_times)));
>  
> -	for (i = 0; i < group_args->queues.count; i++) {
> -		group->queues[i] = group_create_queue(group, &queue_args[i]);
> +	group->syncobjs.times_offset =
> +		group_args->queues.count * sizeof(struct panthor_syncobj_64b);
> +
> +	for (i = 0, total_slots = 0; i < group_args->queues.count; i++) {
> +		group->queues[i] = group_create_queue(group, &queue_args[i], total_slots);
>  		if (IS_ERR(group->queues[i])) {
>  			ret = PTR_ERR(group->queues[i]);
>  			group->queues[i] = NULL;
>  			goto err_put_group;
>  		}
>  
> +		total_slots += (queue_args[i].ringbuf_size / (SLOTSIZE));
>  		group->queue_count++;
>  	}
>  
> @@ -3133,6 +3287,9 @@ int panthor_group_create(struct panthor_file *pfile,
>  	}
>  	mutex_unlock(&sched->reset.lock);
>  
> +	group->fdinfo.data = &pfile->stats;
> +	mutex_init(&group->fdinfo.lock);
> +
>  	return gid;
>  
>  err_put_group:
> @@ -3172,6 +3329,10 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>  	mutex_unlock(&sched->lock);
>  	mutex_unlock(&sched->reset.lock);
>  
> +	mutex_lock(&group->fdinfo.lock);
> +	group->fdinfo.data = NULL;
> +	mutex_unlock(&group->fdinfo.lock);
> +
>  	group_put(group);
>  	return 0;
>  }
> -- 
> 2.43.0
>

I've tried to review the patch as best as I could, specially the math. AFAICT it all checks out,
would be good for others to have a look.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
