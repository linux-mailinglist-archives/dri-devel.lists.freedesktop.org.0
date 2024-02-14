Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C3854F0F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 17:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1E10E392;
	Wed, 14 Feb 2024 16:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C40CF10E392
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 16:48:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D49C1FB;
 Wed, 14 Feb 2024 08:49:35 -0800 (PST)
Received: from [10.57.64.191] (unknown [10.57.64.191])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F4E3F766;
 Wed, 14 Feb 2024 08:48:50 -0800 (PST)
Message-ID: <d24cd3c7-01d9-4020-8655-c3a24a24f016@arm.com>
Date: Wed, 14 Feb 2024 16:48:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] drm/panthor: Add the scheduler logical block
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-11-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240122163047.1954733-11-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 22/01/2024 16:30, Boris Brezillon wrote:
> This is the piece of software interacting with the FW scheduler, and
> taking care of some scheduling aspects when the FW comes short of slots
> scheduling slots. Indeed, the FW only expose a few slots, and the kernel
> has to give all submission contexts, a chance to execute their jobs.
> 
> The kernel-side scheduler is timeslice-based, with a round-robin queue
> per priority level.
> 
> Job submission is handled with a 1:1 drm_sched_entity:drm_gpu_scheduler,
> allowing us to delegate the dependency tracking to the core.
> 
> All the gory details should be documented inline.
> 
> v4:
> - Check drmm_mutex_init() return code
> - s/drm_gem_vmap_unlocked/drm_gem_vunmap_unlocked/ in
>   panthor_queue_put_syncwait_obj()
> - Drop unneeded WARN_ON() in cs_slot_sync_queue_state_locked()
> - Use atomic_xchg() instead of atomic_fetch_and(0)
> - Fix typos
> - Let panthor_kernel_bo_destroy() check for IS_ERR_OR_NULL() BOs
> - Defer TILER_OOM event handling to a separate workqueue to prevent
>   deadlocks when the heap chunk allocation is blocked on mem-reclaim.
>   This is just a temporary solution, until we add support for
>   non-blocking/failable allocations
> - Pass the scheduler workqueue to drm_sched instead of instantiating
>   a separate one (no longer needed now that heap chunk allocation
>   happens on a dedicated wq)
> - Set WQ_MEM_RECLAIM on the scheduler workqueue, so we can handle
>   job timeouts when the system is under mem pressure, and hopefully
>   free up some memory retained by these jobs
> 
> v3:
> - Rework the FW event handling logic to avoid races
> - Make sure MMU faults kill the group immediately
> - Use the panthor_kernel_bo abstraction for group/queue buffers
> - Make in_progress an atomic_t, so we can check it without the reset lock
>   held
> - Don't limit the number of groups per context to the FW scheduler
>   capacity. Fix the limit to 128 for now.
> - Add a panthor_job_vm() helper
> - Account for panthor_vm changes
> - Add our job fence as DMA_RESV_USAGE_WRITE to all external objects
>   (was previously DMA_RESV_USAGE_BOOKKEEP). I don't get why, given
>   we're supposed to be fully-explicit, but other drivers do that, so
>   there must be a good reason
> - Account for drm_sched changes
> - Provide a panthor_queue_put_syncwait_obj()
> - Unconditionally return groups to their idle list in
>   panthor_sched_suspend()
> - Condition of sched_queue_{,delayed_}work fixed to be only when a reset
>   isn't pending or in progress.
> - Several typos in comments fixed.
> 
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks good, a few minor NITs below, but otherwise.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 3500 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |   48 +
>  2 files changed, 3548 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> new file mode 100644
> index 000000000000..b57f4a5f5176
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -0,0 +1,3500 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2023 Collabora ltd. */
> +
> +#include <drm/panthor_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/gpu_scheduler.h>
> +
> +#include <linux/build_bug.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/firmware.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/iosys-map.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/dma-resv.h>
> +
> +#include "panthor_sched.h"
> +#include "panthor_devfreq.h"
> +#include "panthor_device.h"
> +#include "panthor_gem.h"
> +#include "panthor_heap.h"
> +#include "panthor_regs.h"
> +#include "panthor_gpu.h"
> +#include "panthor_fw.h"
> +#include "panthor_mmu.h"
> +
> +/**
> + * DOC: Scheduler
> + *
> + * Mali CSF hardware adopts a firmware-assisted scheduling model, where
> + * the firmware takes care of scheduling aspects, to some extend.

NIT: s/extend/extent/

> + *
> + * The scheduling happens at the scheduling group level, each group
> + * contains 1 to N queues (N is FW/hardware dependent, and exposed
> + * through the firmware interface). Each queue is assigned a command
> + * stream ring buffer, which serves as a way to get jobs submitted to
> + * the GPU, among other things.
> + *
> + * The firmware can schedule a maximum of M groups (M is FW/hardware
> + * dependent, and exposed through the firmware interface). Passed
> + * this maximum number of groups, the kernel must take care of
> + * rotating the groups passed to the firmware so every group gets
> + * a chance to have his queues scheduled for execution.
> + *
> + * The current implementation only supports with kernel-mode queues.
> + * In other terms, userspace doesn't have access to the ring-buffer.
> + * Instead, userspace passes indirect command stream buffers that are
> + * called from the queue ring-buffer by the kernel using a pre-defined
> + * sequence of command stream instructions to ensure the userspace driver
> + * always gets consistent results (cache maintenance,
> + * synchronization, ...).
> + *
> + * We rely on the drm_gpu_scheduler framework to deal with job
> + * dependencies and submission. As any other driver dealing with a
> + * FW-scheduler, we use the 1:1 entity:scheduler mode, such that each
> + * entity has its own job scheduler. When a job is ready to be executed
> + * (all its dependencies are met), it is pushed to the appropriate
> + * queue ring-buffer, and the group is scheduled for execution if it
> + * wasn't already active.
> + *
> + * Kernel-side group scheduling is timeslice-based. When we have less
> + * groups than there are slots, the periodic tick is disabled and we
> + * just let the FW schedule the active groups. When there are more
> + * groups than slots, we let each group a chance to execute stuff for
> + * a given amount of time, and then re-evaluate and pick new groups
> + * to schedule. The group selection algorithm is based on
> + * priority+round-robin.
> + *
> + * Even though user-mode queues is out of the scope right now, the
> + * current design takes them into account by avoiding any guess on the
> + * group/queue state that would be based on information we wouldn't have
> + * if userspace was in charge of the ring-buffer. That's also one of the
> + * reason we don't do 'cooperative' scheduling (encoding FW group slot
> + * reservation as dma_fence that would be returned from the
> + * drm_gpu_scheduler::prepare_job() hook, and treating group rotation as
> + * a queue of waiters, ordered by job submission order). This approach
> + * would work for kernel-mode queues, but would make user-mode queues a
> + * lot more complicated to retrofit.
> + */
> +

<snip>

> +
> +/**
> + * struct panthor_group - Scheduling group object
> + */
> +struct panthor_group {
> +	/** @refcount: Reference count */
> +	struct kref refcount;
> +
> +	/** @ptdev: Device. */
> +	struct panthor_device *ptdev;
> +
> +	/** @vm: VM bound to the group. */
> +	struct panthor_vm *vm;
> +
> +	/** @compute_core_mask: Mask of shader cores that can be used for compute jobs. */
> +	u64 compute_core_mask;
> +
> +	/** @fragment_core_mask: Mask of shader cores that can be used for fragment jobs. */
> +	u64 fragment_core_mask;
> +
> +	/** @tiler_core_mask: Mask of tiler cores that can be used for tiler jobs. */
> +	u64 tiler_core_mask;
> +
> +	/** @max_compute_cores: Maximum number of shader cores used for compute jobs. */
> +	u8 max_compute_cores;
> +
> +	/** @max_compute_cores: Maximum number of shader cores used for fragment jobs. */
> +	u8 max_fragment_cores;
> +
> +	/** @max_tiler_cores: Maximum number of tiler cores used for tiler jobs. */
> +	u8 max_tiler_cores;
> +
> +	/** @priority: Group priority (check panthor_csg_priority). */
> +	u8 priority;
> +
> +	/** @blocked_queues: Bitmask reflecting the blocked queues. */
> +	u32 blocked_queues;
> +
> +	/** @idle_queues: Bitmask reflecting the blocked queues. */

s/blocked/idle/

> +	u32 idle_queues;
> +
> +	/** @fatal_lock: Lock used to protect access to fatal fields. */
> +	spinlock_t fatal_lock;
> +
> +	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
> +	u32 fatal_queues;
> +
> +	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
> +	atomic_t tiler_oom;
> +
> +	/** @queue_count: Number of queues in this group. */
> +	u32 queue_count;
> +
> +	/** @queues: Queues owned by this group. */
> +	struct panthor_queue *queues[MAX_CS_PER_CSG];
> +
> +	/**
> +	 * @csg_id: ID of the FW group slot.
> +	 *
> +	 * -1 when the group is not scheduled/active.
> +	 */
> +	int csg_id;
> +
> +	/**
> +	 * @destroyed: True when the group has been destroyed.
> +	 *
> +	 * If a group is destroyed it becomes useless: no further jobs can be submitted
> +	 * to its queues. We simply wait for all references to be dropped so we can
> +	 * release the group object.
> +	 */
> +	bool destroyed;
> +
> +	/**
> +	 * @timedout: True when a timeout occurred on any of the queues owned by
> +	 * this group.
> +	 *
> +	 * Timeouts can be reported by drm_sched or by the FW. In any case, any
> +	 * timeout situation is unrecoverable, and the group becomes useless.
> +	 * We simply wait for all references to be dropped so we can release the
> +	 * group object.
> +	 */
> +	bool timedout;
> +
> +	/**
> +	 * @syncobjs: Pool of per-queue synchronization objects.
> +	 *
> +	 * One sync object per queue. The position of the sync object is
> +	 * determined by the queue index.
> +	 */
> +	struct panthor_kernel_bo *syncobjs;
> +
> +	/** @state: Group state. */
> +	enum panthor_group_state state;
> +
> +	/**
> +	 * @suspend_buf: Suspend buffer.
> +	 *
> +	 * Stores the state of the group and its queues when a group is suspended.
> +	 * Used at resume time to restore the group in its previous state.
> +	 *
> +	 * The size of the suspend buffer is exposed through the FW interface.
> +	 */
> +	struct panthor_kernel_bo *suspend_buf;
> +
> +	/**
> +	 * @protm_suspend_buf: Protection mode suspend buffer.
> +	 *
> +	 * Stores the state of the group and its queues when a group that's in
> +	 * protection mode is suspended.
> +	 *
> +	 * Used at resume time to restore the group in its previous state.
> +	 *
> +	 * The size of the protection mode suspend buffer is exposed through the
> +	 * FW interface.
> +	 */
> +	struct panthor_kernel_bo *protm_suspend_buf;
> +
> +	/** @sync_upd_work: Work used to check/signal job fences. */
> +	struct work_struct sync_upd_work;
> +
> +	/** @tiler_oom_work: Work used to process tiler OOM events happening on this group. */
> +	struct work_struct tiler_oom_work;
> +
> +	/** @term_work: Work used to finish the group termination procedure. */
> +	struct work_struct term_work;
> +
> +	/**
> +	 * @release_work: Work used to release group resources.
> +	 *
> +	 * We need to postpone the group release to avoid a deadlock when
> +	 * the last ref is released in the tick work.
> +	 */
> +	struct work_struct release_work;
> +
> +	/**
> +	 * @run_node: Node used to insert the group in the
> +	 * panthor_group::groups::{runnable,idle} and
> +	 * panthor_group::reset.stopped_groups lists.
> +	 */
> +	struct list_head run_node;
> +
> +	/**
> +	 * @wait_node: Node used to insert the group in the
> +	 * panthor_group::groups::waiting list.
> +	 */
> +	struct list_head wait_node;
> +};
> +
> +/**
> + * group_queue_work() - Queue a group work
> + * @group: Group to queue the work for.
> + * @wname: Work name.
> + *
> + * Grabs a ref and queue a work item to the scheduler workqueue. If
> + * the work was already queued, we release the reference we grabbed.
> + *
> + * Work callbacks must release the reference we grabbed here.
> + */
> +#define group_queue_work(group, wname) \
> +	do { \
> +		group_get(group); \
> +		if (!queue_work((group)->ptdev->scheduler->wq, &(group)->wname ## _work)) \
> +			group_put(group); \
> +	} while (0)
> +
> +/**
> + * sched_queue_work() - Queue a scheduler work.
> + * @sched: Scheduler object.
> + * @wname: Work name.
> + *
> + * Conditionally queues a scheduler work if no reset is pending/in-progress.
> + */
> +#define sched_queue_work(sched, wname) \
> +	do { \
> +		if (!atomic_read(&sched->reset.in_progress) && \
> +		    !panthor_device_reset_is_pending((sched)->ptdev)) \
> +			queue_work((sched)->wq, &(sched)->wname ## _work); \
> +	} while (0)
> +
> +/**
> + * sched_queue_delayed_work() - Queue a scheduler delayed work.
> + * @sched: Scheduler object.
> + * @wname: Work name.
> + * @delay: Work delay in jiffies.
> + *
> + * Conditionally queues a scheduler delayed work if no reset is
> + * pending/in-progress.
> + */
> +#define sched_queue_delayed_work(sched, wname, delay) \
> +	do { \
> +		if (!atomic_read(&sched->reset.in_progress) && \
> +		    !panthor_device_reset_is_pending((sched)->ptdev)) \
> +			mod_delayed_work((sched)->wq, &(sched)->wname ## _work, delay); \
> +	} while (0)
> +
> +/*
> + * We currently set the maximum of groups per file to an arbitrary low value.
> + * But this can be updated if we need more.
> + */
> +#define MAX_GROUPS_PER_POOL 128
> +
> +/**
> + * struct panthor_group_pool - Group pool
> + *
> + * Each file get assigned a group pool.
> + */
> +struct panthor_group_pool {
> +	/** @xa: Xarray used to manage group handles. */
> +	struct xarray xa;
> +};
> +
> +/**
> + * struct panthor_job - Used to manage GPU job
> + */
> +struct panthor_job {
> +	/** @base: Inherit from drm_sched_job. */
> +	struct drm_sched_job base;
> +
> +	/** @refcount: Reference count. */
> +	struct kref refcount;
> +
> +	/** @group: Group of the queue this job will be pushed to. */
> +	struct panthor_group *group;
> +
> +	/** @queue_idx: Index of the queue inside @group. */
> +	u32 queue_idx;
> +
> +	/** @call_info: Information about the userspace command stream call. */
> +	struct {
> +		/** @start: GPU address of the userspace command stream. */
> +		u64 start;
> +
> +		/** @size: Size of the userspace command stream. */
> +		u32 size;
> +
> +		/**
> +		 * @latest_flush: Flush ID at the time the userspace command
> +		 * stream was built.
> +		 *
> +		 * Needed for the flush reduction mechanism.
> +		 */
> +		u32 latest_flush;
> +	} call_info;
> +
> +	/** @ringbuf: Position of this job is in the ring buffer. */
> +	struct {
> +		/** @start: Start offset. */
> +		u64 start;
> +
> +		/** @end: End offset. */
> +		u64 end;
> +	} ringbuf;
> +
> +	/**
> +	 * @node: Used to insert the job in the panthor_queue::fence_ctx::in_flight_jobs
> +	 * list.
> +	 */
> +	struct list_head node;
> +
> +	/** @done_fence: Fence signaled when the job is finished or cancelled. */
> +	struct dma_fence *done_fence;
> +};
> +
> +static void
> +panthor_queue_put_syncwait_obj(struct panthor_queue *queue)
> +{
> +	if (queue->syncwait.kmap) {
> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(queue->syncwait.kmap);
> +
> +		drm_gem_vunmap_unlocked(queue->syncwait.obj, &map);
> +		queue->syncwait.kmap = NULL;
> +	}
> +
> +	drm_gem_object_put(queue->syncwait.obj);
> +	queue->syncwait.obj = NULL;
> +}
> +
> +static void *
> +panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue *queue)
> +{
> +	struct panthor_device *ptdev = group->ptdev;
> +	struct panthor_gem_object *bo;
> +	struct iosys_map map;
> +	int ret;
> +
> +	if (queue->syncwait.kmap)
> +		return queue->syncwait.kmap + queue->syncwait.offset;
> +
> +	bo = panthor_vm_get_bo_for_va(group->vm,
> +				      queue->syncwait.gpu_va,
> +				      &queue->syncwait.offset);
> +	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(bo)))
> +		goto err_put_syncwait_obj;
> +
> +	queue->syncwait.obj = &bo->base.base;
> +	ret = drm_gem_vmap_unlocked(queue->syncwait.obj, &map);
> +	if (drm_WARN_ON(&ptdev->base, ret))
> +		goto err_put_syncwait_obj;
> +
> +	queue->syncwait.kmap = map.vaddr;
> +	if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
> +		goto err_put_syncwait_obj;
> +
> +	return queue->syncwait.kmap + queue->syncwait.offset;
> +
> +err_put_syncwait_obj:
> +	panthor_queue_put_syncwait_obj(queue);
> +	return NULL;
> +}
> +
> +static void group_free_queue(struct panthor_group *group, struct panthor_queue *queue)
> +{
> +	if (IS_ERR_OR_NULL(queue))
> +		return;
> +
> +	if (queue->entity.fence_context)
> +		drm_sched_entity_destroy(&queue->entity);
> +
> +	if (queue->scheduler.ops)
> +		drm_sched_fini(&queue->scheduler);
> +
> +	panthor_queue_put_syncwait_obj(queue);
> +
> +	panthor_kernel_bo_destroy(group->vm, queue->ringbuf);
> +	panthor_kernel_bo_destroy(panthor_fw_vm(group->ptdev), queue->iface.mem);
> +
> +	kfree(queue);
> +}
> +
> +static void group_release_work(struct work_struct *work)
> +{
> +	struct panthor_group *group = container_of(work,
> +						   struct panthor_group,
> +						   release_work);
> +	struct panthor_device *ptdev = group->ptdev;
> +	u32 i;
> +
> +	for (i = 0; i < group->queue_count; i++)
> +		group_free_queue(group, group->queues[i]);
> +
> +	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->suspend_buf);
> +	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->protm_suspend_buf);
> +
> +	if (!IS_ERR_OR_NULL(group->syncobjs))

No need for this check - panthor_kernel_bo_destroy() does it.

> +		panthor_kernel_bo_destroy(group->vm, group->syncobjs);
> +
> +	panthor_vm_put(group->vm);
> +	kfree(group);
> +}

Thanks,

Steve

