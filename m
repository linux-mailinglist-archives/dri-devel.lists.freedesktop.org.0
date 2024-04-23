Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F78AF8EC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 23:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB8113701;
	Tue, 23 Apr 2024 21:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="rgslNrJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB79113701
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 21:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713908009;
 bh=mWCWZPkiQ74y75aEMQEG+USFsGOqHtojFGGklG8kQDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgslNrJUbVND/KgrG+pRcW058kB28XbMKdB7SUk9mrF+LiYgzDvGYK/tD/EGgmf7y
 2oa8poa6ZExk5XeUPzSOLZmLRv69ROW91umdOkLzTeSUl7xPiixqR9lQAqWYlfBNOB
 ZgOiZBMqMfQ6qmJKgMBMqwrUC53kmfQhV/8B92vo84zxys6mII+CkKVqryqLCfYpCg
 HBkiUPu7OGyhxw/QmUyz7a6R3KgtdAMownseVwXJtvAlL7p3EMM24W4N2S0t0GHpBo
 Xng+3fFtrs/hG3Q8HWKqOgZPBsxy+wAeGbgAyVWHuekJDepw5AvPafNC50ty4AamBv
 PT8AXdhcm+hMA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 83322378212F;
 Tue, 23 Apr 2024 21:33:28 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, Adrian Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/panthor: introduce job cycle and timestamp
 accounting
Date: Tue, 23 Apr 2024 22:32:34 +0100
Message-ID: <20240423213240.91412-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423213240.91412-1-adrian.larumbe@collabora.com>
References: <20240423213240.91412-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Enable calculations of job submission times in clock cycles and wall
time. This is done by expanding the boilerplate command stream when running
a job to include instructions that compute said times right before an after
a user CS.

Those numbers are stored in the queue's group's sync objects BO, right
after them. Because the queues in a group might have a different number of
slots, one must keep track of the overall slot tally when reckoning the
offset of a queue's time sample structs, one for each slot.

NUM_INSTRS_PER_SLOT had to be increased to 32 because of adding new FW
instructions for storing and subtracting the cycle counter and timestamp
register, and it must always remain a power of two.

This commit is done in preparation for enabling DRM fdinfo support in the
Panthor driver, which depends on the numbers calculated herein.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 158 ++++++++++++++++++++----
 1 file changed, 134 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b3a51a6de523..320dfa0388ba 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -93,6 +93,9 @@
 #define MIN_CSGS				3
 #define MAX_CSG_PRIO				0xf
 
+#define NUM_INSTRS_PER_SLOT			32
+#define SLOTSIZE				(NUM_INSTRS_PER_SLOT * sizeof(u64))
+
 struct panthor_group;
 
 /**
@@ -466,6 +469,9 @@ struct panthor_queue {
 		 */
 		struct list_head in_flight_jobs;
 	} fence_ctx;
+
+	/** @time_offset: Offset of panthor_job_times structs in group's syncobj bo. */
+	unsigned long time_offset;
 };
 
 /**
@@ -580,7 +586,17 @@ struct panthor_group {
 	 * One sync object per queue. The position of the sync object is
 	 * determined by the queue index.
 	 */
-	struct panthor_kernel_bo *syncobjs;
+
+	struct {
+		/** @bo: Kernel BO holding the sync objects. */
+		struct panthor_kernel_bo *bo;
+
+		/**
+		 * @times_offset: Beginning of panthor_job_times struct samples after
+		 * the group's array of sync objects.
+		 */
+		size_t times_offset;
+	} syncobjs;
 
 	/** @state: Group state. */
 	enum panthor_group_state state;
@@ -639,6 +655,18 @@ struct panthor_group {
 	struct list_head wait_node;
 };
 
+struct panthor_job_times {
+	struct {
+		u64 before;
+		u64 after;
+	} cycles;
+
+	struct {
+		u64 before;
+		u64 after;
+	} time;
+};
+
 /**
  * group_queue_work() - Queue a group work
  * @group: Group to queue the work for.
@@ -718,6 +746,9 @@ struct panthor_job {
 	/** @queue_idx: Index of the queue inside @group. */
 	u32 queue_idx;
 
+	/** @ringbuf_idx: Index of the ringbuffer inside @queue. */
+	u32 ringbuf_idx;
+
 	/** @call_info: Information about the userspace command stream call. */
 	struct {
 		/** @start: GPU address of the userspace command stream. */
@@ -833,7 +864,7 @@ static void group_release_work(struct work_struct *work)
 
 	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->suspend_buf);
 	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->protm_suspend_buf);
-	panthor_kernel_bo_destroy(group->vm, group->syncobjs);
+	panthor_kernel_bo_destroy(group->vm, group->syncobjs.bo);
 
 	panthor_vm_put(group->vm);
 	kfree(group);
@@ -1924,8 +1955,6 @@ tick_ctx_init(struct panthor_scheduler *sched,
 	}
 }
 
-#define NUM_INSTRS_PER_SLOT		16
-
 static void
 group_term_post_processing(struct panthor_group *group)
 {
@@ -1962,7 +1991,7 @@ group_term_post_processing(struct panthor_group *group)
 		spin_unlock(&queue->fence_ctx.lock);
 
 		/* Manually update the syncobj seqno to unblock waiters. */
-		syncobj = group->syncobjs->kmap + (i * sizeof(*syncobj));
+		syncobj = group->syncobjs.bo->kmap + (i * sizeof(*syncobj));
 		syncobj->status = ~0;
 		syncobj->seqno = atomic64_read(&queue->fence_ctx.seqno);
 		sched_queue_work(group->ptdev->scheduler, sync_upd);
@@ -2729,7 +2758,7 @@ static void group_sync_upd_work(struct work_struct *work)
 		if (!queue)
 			continue;
 
-		syncobj = group->syncobjs->kmap + (queue_idx * sizeof(*syncobj));
+		syncobj = group->syncobjs.bo->kmap + (queue_idx * sizeof(*syncobj));
 
 		spin_lock(&queue->fence_ctx.lock);
 		list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
@@ -2764,15 +2793,23 @@ queue_run_job(struct drm_sched_job *sched_job)
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	u32 ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
 	u32 ringbuf_insert = queue->iface.input->insert & (ringbuf_size - 1);
+	u32 ringbuf_index = ringbuf_insert / (SLOTSIZE);
 	u64 addr_reg = ptdev->csif_info.cs_reg_count -
 		       ptdev->csif_info.unpreserved_cs_reg_count;
 	u64 val_reg = addr_reg + 2;
-	u64 sync_addr = panthor_kernel_bo_gpuva(group->syncobjs) +
-			job->queue_idx * sizeof(struct panthor_syncobj_64b);
+	u64 cycle_reg = addr_reg;
+	u64 time_reg = val_reg;
+	u64 sync_addr = panthor_kernel_bo_gpuva(group->syncobjs.bo) +
+		job->queue_idx * sizeof(struct panthor_syncobj_64b);
+	u64 times_addr = panthor_kernel_bo_gpuva(group->syncobjs.bo) + queue->time_offset +
+		(ringbuf_index * sizeof(struct panthor_job_times));
+
 	u32 waitall_mask = GENMASK(sched->sb_slot_count - 1, 0);
 	struct dma_fence *done_fence;
 	int ret;
 
+	drm_WARN_ON(&ptdev->base, ringbuf_insert >= ringbuf_size);
+
 	u64 call_instrs[NUM_INSTRS_PER_SLOT] = {
 		/* MOV32 rX+2, cs.latest_flush */
 		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
@@ -2780,6 +2817,18 @@ queue_run_job(struct drm_sched_job *sched_job)
 		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
 		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
 
+		/* MOV48 rX:rX+1, cycles_offset */
+		(1ull << 56) | (cycle_reg << 48) | (times_addr + offsetof(struct panthor_job_times, cycles.before)),
+
+		/* MOV48 rX:rX+1, time_offset */
+		(1ull << 56) | (time_reg << 48) | (times_addr + offsetof(struct panthor_job_times, time.before)),
+
+		/* STORE_STATE cycles */
+		(40ull << 56) |  (cycle_reg << 40) | (1ll << 32),
+
+		/* STORE_STATE timer */
+		(40ull << 56) |  (time_reg << 40) | (0ll << 32),
+
 		/* MOV48 rX:rX+1, cs.start */
 		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
 
@@ -2792,6 +2841,18 @@ queue_run_job(struct drm_sched_job *sched_job)
 		/* CALL rX:rX+1, rX+2 */
 		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
 
+		/* MOV48 rX:rX+1, cycles_offset */
+		(1ull << 56) | (cycle_reg << 48) | (times_addr + offsetof(struct panthor_job_times, cycles.after)),
+
+		/* MOV48 rX:rX+1, time_offset */
+		(1ull << 56) | (time_reg << 48) | (times_addr + offsetof(struct panthor_job_times, time.after)),
+
+		/* STORE_STATE cycles */
+		(40ull << 56) |  (cycle_reg << 40) | (1ll << 32),
+
+		/* STORE_STATE timer */
+		(40ull << 56) |  (time_reg << 40) | (0ll << 32),
+
 		/* MOV48 rX:rX+1, sync_addr */
 		(1ull << 56) | (addr_reg << 48) | sync_addr,
 
@@ -2846,6 +2907,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 
 	job->ringbuf.start = queue->iface.input->insert;
 	job->ringbuf.end = job->ringbuf.start + sizeof(call_instrs);
+	job->ringbuf_idx = ringbuf_index;
 
 	/* Make sure the ring buffer is updated before the INSERT
 	 * register.
@@ -2936,7 +2998,8 @@ static const struct drm_sched_backend_ops panthor_queue_sched_ops = {
 
 static struct panthor_queue *
 group_create_queue(struct panthor_group *group,
-		   const struct drm_panthor_queue_create *args)
+		   const struct drm_panthor_queue_create *args,
+		   unsigned int slots_so_far)
 {
 	struct drm_gpu_scheduler *drm_sched;
 	struct panthor_queue *queue;
@@ -2987,9 +3050,12 @@ group_create_queue(struct panthor_group *group,
 		goto err_free_queue;
 	}
 
+	queue->time_offset = group->syncobjs.times_offset +
+		(slots_so_far * sizeof(struct panthor_job_times));
+
 	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
 			     group->ptdev->scheduler->wq, 1,
-			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
+			     args->ringbuf_size / SLOTSIZE,
 			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
 			     group->ptdev->reset.wq,
 			     NULL, "panthor-queue", group->ptdev->base.dev);
@@ -3017,7 +3083,9 @@ int panthor_group_create(struct panthor_file *pfile,
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, 0);
 	struct panthor_group *group = NULL;
+	unsigned int total_slots;
 	u32 gid, i, suspend_size;
+	size_t syncobj_bo_size;
 	int ret;
 
 	if (group_args->pad)
@@ -3083,33 +3151,75 @@ int panthor_group_create(struct panthor_file *pfile,
 		goto err_put_group;
 	}
 
-	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
-						   group_args->queues.count *
-						   sizeof(struct panthor_syncobj_64b),
-						   DRM_PANTHOR_BO_NO_MMAP,
-						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
-						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						   PANTHOR_VM_KERNEL_AUTO_VA);
-	if (IS_ERR(group->syncobjs)) {
-		ret = PTR_ERR(group->syncobjs);
+	/*
+	 * Need to add size for the panthor_job_times structs, as many as the sum
+	 * of the number of job slots for every single queue ringbuffer.
+	 */
+	for (i = 0, total_slots = 0; i < group_args->queues.count; i++)
+		total_slots += (queue_args[i].ringbuf_size / (SLOTSIZE));
+
+	syncobj_bo_size = (group_args->queues.count * sizeof(struct panthor_syncobj_64b))
+		+ (total_slots * sizeof(struct panthor_job_times));
+
+	/*
+	 * Memory layout of group's syncobjs BO
+	 * group->syncobjs.bo {
+	 *	struct panthor_syncobj_64b sync1;
+	 *	struct panthor_syncobj_64b sync2;
+	 *		...
+	 *		As many as group_args->queues.count
+	 *		...
+	 *	struct panthor_syncobj_64b syncn;
+	 *	struct panthor_job_times queue1_slot1
+	 *	struct panthor_job_times queue1_slot2
+	 *		...
+	 *		As many as queue[i].ringbuf_size / SLOTSIZE
+	 *		...
+	 *	struct panthor_job_times queue1_slotP
+	 *		...
+	 *		As many as group_args->queues.count
+	 *		...
+	 *	struct panthor_job_times queueN_slot1
+	 *	struct panthor_job_times queueN_slot2
+	 *		...
+	 *		As many as queue[n].ringbuf_size / SLOTSIZE
+	 *	struct panthor_job_times queueN_slotQ
+	 *
+	 *	Linearly, group->syncobjs.bo = {syncojb1,..,syncobjN,
+	 *	{queue1 = {js1,..,jsP},..,queueN = {js1,..,jsQ}}}
+	 * }
+	 *
+	 */
+
+	group->syncobjs.bo = panthor_kernel_bo_create(ptdev, group->vm,
+						      syncobj_bo_size,
+						      DRM_PANTHOR_BO_NO_MMAP,
+						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
+						      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
+						      PANTHOR_VM_KERNEL_AUTO_VA);
+	if (IS_ERR(group->syncobjs.bo)) {
+		ret = PTR_ERR(group->syncobjs.bo);
 		goto err_put_group;
 	}
 
-	ret = panthor_kernel_bo_vmap(group->syncobjs);
+	ret = panthor_kernel_bo_vmap(group->syncobjs.bo);
 	if (ret)
 		goto err_put_group;
 
-	memset(group->syncobjs->kmap, 0,
-	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
+	memset(group->syncobjs.bo->kmap, 0, syncobj_bo_size);
+
+	group->syncobjs.times_offset =
+		group_args->queues.count * sizeof(struct panthor_syncobj_64b);
 
-	for (i = 0; i < group_args->queues.count; i++) {
-		group->queues[i] = group_create_queue(group, &queue_args[i]);
+	for (i = 0, total_slots = 0; i < group_args->queues.count; i++) {
+		group->queues[i] = group_create_queue(group, &queue_args[i], total_slots);
 		if (IS_ERR(group->queues[i])) {
 			ret = PTR_ERR(group->queues[i]);
 			group->queues[i] = NULL;
 			goto err_put_group;
 		}
 
+		total_slots += (queue_args[i].ringbuf_size / (SLOTSIZE));
 		group->queue_count++;
 	}
 
-- 
2.44.0

