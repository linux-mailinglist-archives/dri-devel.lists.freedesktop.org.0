Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE380D19D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 17:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D85510E4AA;
	Mon, 11 Dec 2023 16:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35A1E10E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 16:27:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E95DC1007;
 Mon, 11 Dec 2023 08:28:24 -0800 (PST)
Received: from [10.57.74.45] (unknown [10.57.74.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCE523F738;
 Mon, 11 Dec 2023 08:27:35 -0800 (PST)
Message-ID: <d100db02-fc65-452e-8081-ff6794284e70@arm.com>
Date: Mon, 11 Dec 2023 16:27:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] drm/panthor: Add the scheduler logical block
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-11-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231204173313.2098733-11-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 17:33, Boris Brezillon wrote:
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
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Two minor comments below, but either way:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 3410 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |   48 +
>  2 files changed, 3458 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> new file mode 100644
> index 000000000000..08e5662f4879
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -0,0 +1,3410 @@
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
> +#define JOB_TIMEOUT_MS				5000
> +
> +#define MIN_CS_PER_CSG				8
> +
> +#define MIN_CSGS				3
> +#define MAX_CSG_PRIO				0xf
> +
> +struct panthor_group;
> +
> +/**
> + * struct panthor_csg_slot - Command stream group slot
> + *
> + * This represents a FW slot for a scheduling group.
> + */
> +struct panthor_csg_slot {
> +	/** @group: Scheduling group bound to this slot. */
> +	struct panthor_group *group;
> +
> +	/** @priority: Group priority. */
> +	u8 priority;
> +
> +	/**
> +	 * @idle: True if the group bound to this slot is idle.
> +	 *
> +	 * A group is idle when it has nothing waiting for execution on
> +	 * all its queues, or when queues are blocked waiting for something
> +	 * to happen (synchronization object).
> +	 */
> +	bool idle;
> +};
> +
> +/**
> + * enum panthor_csg_priority - Group priority
> + */
> +enum panthor_csg_priority {
> +	/** @PANTHOR_CSG_PRIORITY_LOW: Low priority group. */
> +	PANTHOR_CSG_PRIORITY_LOW = 0,
> +
> +	/** @PANTHOR_CSG_PRIORITY_MEDIUM: Medium priority group. */
> +	PANTHOR_CSG_PRIORITY_MEDIUM,
> +
> +	/** @PANTHOR_CSG_PRIORITY_HIGH: High priority group. */
> +	PANTHOR_CSG_PRIORITY_HIGH,
> +
> +	/**
> +	 * @PANTHOR_CSG_PRIORITY_RT: Real-time priority group.
> +	 *
> +	 * Real-time priority allows one to preempt scheduling of other
> +	 * non-real-time groups. When such a group becomes executable,
> +	 * it will evict the group with the lowest non-rt priority if
> +	 * there's no free group slot available.
> +	 *
> +	 * Currently not exposed to userspace.
> +	 */
> +	PANTHOR_CSG_PRIORITY_RT,
> +
> +	/** @PANTHOR_CSG_PRIORITY_COUNT: Number of priority levels. */
> +	PANTHOR_CSG_PRIORITY_COUNT,
> +};
> +
> +/**
> + * struct panthor_scheduler - Object used to manage the scheduler
> + */
> +struct panthor_scheduler {
> +	/** @ptdev: Device. */
> +	struct panthor_device *ptdev;
> +
> +	/**
> +	 * @wq: Workqueue used by our internal scheduler logic.
> +	 *
> +	 * Used for the scheduler tick, group update or other kind of FW
> +	 * event processing that can't be handled in the threaded interrupt
> +	 * path.
> +	 */
> +	struct workqueue_struct *wq;
> +
> +	/**
> +	 * @drm_sched_wq: Workqueue passed to the drm_gpu_scheduler.
> +	 *
> +	 * The driver doesn't use this queue, it's left entirely to the
> +	 * drm_sched for job dequeuing/cleanup.
> +	 */
> +	struct workqueue_struct *drm_sched_wq;
> +
> +	/** @tick_work: Work executed on a scheduling tick. */
> +	struct delayed_work tick_work;
> +
> +	/**
> +	 * @sync_upd_work: Work used to process synchronization object updates.
> +	 *
> +	 * We use this work to unblock queues/groups that were waiting on a
> +	 * synchronization object.
> +	 */
> +	struct work_struct sync_upd_work;
> +
> +	/**
> +	 * @fw_events_work: Work used to process FW events outside the interrupt path.
> +	 *
> +	 * Even if the interrupt is threaded, we need any event processing
> +	 * that require taking the panthor_scheduler::lock to be processed
> +	 * outside the interrupt path so we don't block the tick logic when
> +	 * it calls panthor_fw_{csg,wait}_wait_acks(). Since most of the
> +	 * even processing require taking this lock, we just delegate all

           ^^^^^^^^^^^^^^^^^^^^^^^
           event processing requires

> +	 * FW event processing to the scheduler workqueue.
> +	 */
> +	struct work_struct fw_events_work;
> +
> +	/**
> +	 * @fw_events: Bitmask encoding pending FW events.
> +	 */
> +	atomic_t fw_events;
> +
> +	/**
> +	 * @resched_target: When the next tick should occur.
> +	 *
> +	 * Expressed in jiffies.
> +	 */
> +	u64 resched_target;
> +
> +	/**
> +	 * @last_tick: When the last tick occurred.
> +	 *
> +	 * Expressed in jiffies.
> +	 */
> +	u64 last_tick;
> +
> +	/** @tick_period: Tick period in jiffies. */
> +	u64 tick_period;
> +
> +	/**
> +	 * @lock: Lock protecting access to all the scheduler fields.
> +	 *
> +	 * Should be taken in the tick work, the irq handler, and anywhere the @groups
> +	 * fields are touched.
> +	 */
> +	struct mutex lock;
> +
> +	/** @groups: Various lists used to classify groups. */
> +	struct {
> +		/**
> +		 * @runnable: Runnable group lists.
> +		 *
> +		 * When a group has queues that want to execute something,
> +		 * its panthor_group::run_node should be inserted here.
> +		 *
> +		 * One list per-priority.
> +		 */
> +		struct list_head runnable[PANTHOR_CSG_PRIORITY_COUNT];
> +
> +		/**
> +		 * @idle: Idle group lists.
> +		 *
> +		 * When all queues of a group are idle (either because they
> +		 * have nothing to execute, or because they are blocked), the
> +		 * panthor_group::run_node field should be inserted here.
> +		 *
> +		 * One list per-priority.
> +		 */
> +		struct list_head idle[PANTHOR_CSG_PRIORITY_COUNT];
> +
> +		/**
> +		 * @waiting: List of groups whose queues are blocked on a
> +		 * synchronization object.
> +		 *
> +		 * Insert panthor_group::wait_node here when a group is waiting
> +		 * for synchronization objects to be signaled.
> +		 *
> +		 * This list is evaluated in the @sync_upd_work work.
> +		 */
> +		struct list_head waiting;
> +	} groups;
> +
> +	/**
> +	 * @csg_slots: FW command stream group slots.
> +	 */
> +	struct panthor_csg_slot csg_slots[MAX_CSGS];
> +
> +	/** @csg_slot_count: Number of command stream group slots exposed by the FW. */
> +	u32 csg_slot_count;
> +
> +	/** @cs_slot_count: Number of command stream slot per group slot exposed by the FW. */
> +	u32 cs_slot_count;
> +
> +	/** @as_slot_count: Number of address space slots supported by the MMU. */
> +	u32 as_slot_count;
> +
> +	/** @used_csg_slot_count: Number of command stream group slot currently used. */
> +	u32 used_csg_slot_count;
> +
> +	/** @sb_slot_count: Number of scoreboard slots. */
> +	u32 sb_slot_count;
> +
> +	/**
> +	 * @might_have_idle_groups: True if an active group might have become idle.
> +	 *
> +	 * This will force a tick, so other runnable groups can be scheduled if one
> +	 * or more active groups became idle.
> +	 */
> +	bool might_have_idle_groups;
> +
> +	/** @pm: Power management related fields. */
> +	struct {
> +		/** @has_ref: True if the scheduler owns a runtime PM reference. */
> +		bool has_ref;
> +	} pm;
> +
> +	/** @reset: Reset related fields. */
> +	struct {
> +		/** @lock: Lock protecting the other reset fields. */
> +		struct mutex lock;
> +
> +		/**
> +		 * @in_progress: True if a reset is in progress.
> +		 *
> +		 * Set to true in panthor_sched_pre_reset() and back to false in
> +		 * panthor_sched_post_reset().
> +		 */
> +		atomic_t in_progress;
> +
> +		/**
> +		 * @stopped_groups: List containing all groups that were stopped
> +		 * before a reset.
> +		 *
> +		 * Insert panthor_group::run_node in the pre_reset path.
> +		 */
> +		struct list_head stopped_groups;
> +	} reset;
> +};

<snip>

> +
> +static void process_fw_events_work(struct work_struct *work)
> +{
> +	struct panthor_scheduler *sched = container_of(work, struct panthor_scheduler,
> +						      fw_events_work);
> +	u32 events = atomic_fetch_and(0, &sched->fw_events);

I think atomic_xchg() would be clearer here.

> +	struct panthor_device *ptdev = sched->ptdev;
> +
> +	mutex_lock(&sched->lock);
> +
> +	if (events & JOB_INT_GLOBAL_IF) {
> +		sched_process_global_irq_locked(ptdev);
> +		events &= ~JOB_INT_GLOBAL_IF;
> +	}
> +
> +	while (events) {
> +		u32 csg_id = ffs(events) - 1;
> +		sched_process_csg_irq_locked(ptdev, csg_id);
> +		events &= ~BIT(csg_id);
> +	}
> +
> +	mutex_unlock(&sched->lock);
> +}

<snip>
Thanks,

Steve
