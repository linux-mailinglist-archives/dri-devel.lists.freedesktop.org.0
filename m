Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E68FDBB4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 02:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F5110E6D2;
	Thu,  6 Jun 2024 00:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EkW4n5+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3C610E502
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 00:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717635278;
 bh=9gSQQvmnIwG7AFptIo8tpe0xAEizV1lvr2ol4vi8sHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EkW4n5+kpXP1RPTwYmMwBBwdQqu5wPeh71S/JqEfhZJ4eKpu7ASTXjsIIel3zBWGv
 ZbIGlDdYi7BS4d3L2o6uWEmqQ63VYXtD7bQ2vVeRzyUtl8QXktil0FwaQ2AFE+k/ET
 7heWQm5VkpAzQGN7ZOlB/nyuu2sljgw0WWk714/B7f7bU6i4F7UGgbREi/88wWItxm
 HV3eU6xN90rq8eJ2cy0eFAXl9pGV+9+vVIDCPtODAE3WxcbW8yo3Mrf1zl2qtxt2pT
 mbJFGMMheu3W8eOc8GKulgHxwhCJUNHCoZQ3sGGnFuItc8fzcXBat10pyJ8Z18ZK3x
 2iSW2LyybbAEA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5FF1637821CD;
 Thu,  6 Jun 2024 00:54:37 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] drm/panthor: support job accounting
Date: Thu,  6 Jun 2024 01:49:57 +0100
Message-ID: <20240606005416.1172431-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
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

A previous commit brought in a sysfs knob to control the driver's profiling
status. This changeset flags jobs as being profiled according to the
driver's global profiling status, and picks one of two call instruction
arrays to insert into the ring buffer. One of them includes FW logic to
sample the timestamp and cycle counter registers and write them into the
job's syncobj, and the other does not.

A profiled job's call sequence takes up two ring buffer slots, and this is
reflected when initialising the DRM scheduler for each queue, with a
profiled job contributing twice as many credits.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 95 ++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index bbd20db40e7b..4fb6fc5c2314 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -93,7 +93,7 @@
 #define MIN_CSGS				3
 #define MAX_CSG_PRIO				0xf
 
-#define NUM_INSTRS_PER_SLOT			32
+#define NUM_INSTRS_PER_SLOT			16
 #define SLOTSIZE				(NUM_INSTRS_PER_SLOT * sizeof(u64))
 
 struct panthor_group;
@@ -807,6 +807,9 @@ struct panthor_job {
 
 	/** @done_fence: Fence signaled when the job is finished or cancelled. */
 	struct dma_fence *done_fence;
+
+	/** @is_profiled: Whether timestamp and cycle numbers were gathered for this job */
+	bool is_profiled;
 };
 
 static void
@@ -2865,7 +2868,8 @@ static void group_sync_upd_work(struct work_struct *work)
 	dma_fence_end_signalling(cookie);
 
 	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
-		update_fdinfo_stats(job);
+		if (job->is_profiled)
+			update_fdinfo_stats(job);
 		list_del_init(&job->node);
 		panthor_job_put(&job->base);
 	}
@@ -2884,6 +2888,8 @@ queue_run_job(struct drm_sched_job *sched_job)
 	u32 ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
 	u32 ringbuf_insert = queue->iface.input->insert & (ringbuf_size - 1);
 	u32 ringbuf_index = ringbuf_insert / (SLOTSIZE);
+	bool ringbuf_wraparound =
+		job->is_profiled && ((ringbuf_size/SLOTSIZE) == ringbuf_index + 1);
 	u64 addr_reg = ptdev->csif_info.cs_reg_count -
 		       ptdev->csif_info.unpreserved_cs_reg_count;
 	u64 val_reg = addr_reg + 2;
@@ -2893,12 +2899,51 @@ queue_run_job(struct drm_sched_job *sched_job)
 		job->queue_idx * sizeof(struct panthor_syncobj_64b);
 	u64 times_addr = panthor_kernel_bo_gpuva(group->syncobjs.bo) + queue->time_offset +
 		(ringbuf_index * sizeof(struct panthor_job_times));
+	size_t call_insrt_size;
+	u64 *call_instrs;
 
 	u32 waitall_mask = GENMASK(sched->sb_slot_count - 1, 0);
 	struct dma_fence *done_fence;
 	int ret;
 
-	u64 call_instrs[NUM_INSTRS_PER_SLOT] = {
+	u64 call_instrs_simple[NUM_INSTRS_PER_SLOT] = {
+		/* MOV32 rX+2, cs.latest_flush */
+		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
+
+		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
+		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
+
+		/* MOV48 rX:rX+1, cs.start */
+		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
+
+		/* MOV32 rX+2, cs.size */
+		(2ull << 56) | (val_reg << 48) | job->call_info.size,
+
+		/* WAIT(0) => waits for FLUSH_CACHE2 instruction */
+		(3ull << 56) | (1 << 16),
+
+		/* CALL rX:rX+1, rX+2 */
+		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
+
+		/* MOV48 rX:rX+1, sync_addr */
+		(1ull << 56) | (addr_reg << 48) | sync_addr,
+
+		/* MOV48 rX+2, #1 */
+		(1ull << 56) | (val_reg << 48) | 1,
+
+		/* WAIT(all) */
+		(3ull << 56) | (waitall_mask << 16),
+
+		/* SYNC_ADD64.system_scope.propage_err.nowait rX:rX+1, rX+2*/
+		(51ull << 56) | (0ull << 48) | (addr_reg << 40) | (val_reg << 32) | (0 << 16) | 1,
+
+		/* ERROR_BARRIER, so we can recover from faults at job
+		 * boundaries.
+		 */
+		(47ull << 56),
+	};
+
+	u64 call_instrs_profile[NUM_INSTRS_PER_SLOT*2] = {
 		/* MOV32 rX+2, cs.latest_flush */
 		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
 
@@ -2960,9 +3005,18 @@ queue_run_job(struct drm_sched_job *sched_job)
 	};
 
 	/* Need to be cacheline aligned to please the prefetcher. */
-	static_assert(sizeof(call_instrs) % 64 == 0,
+	static_assert(sizeof(call_instrs_simple) % 64 == 0 && sizeof(call_instrs_profile) % 64 == 0,
 		      "call_instrs is not aligned on a cacheline");
 
+	if (job->is_profiled) {
+		call_instrs = call_instrs_profile;
+		call_insrt_size = sizeof(call_instrs_profile);
+
+	} else {
+		call_instrs = call_instrs_simple;
+		call_insrt_size = sizeof(call_instrs_simple);
+	}
+
 	/* Stream size is zero, nothing to do => return a NULL fence and let
 	 * drm_sched signal the parent.
 	 */
@@ -2985,8 +3039,23 @@ queue_run_job(struct drm_sched_job *sched_job)
 		       queue->fence_ctx.id,
 		       atomic64_inc_return(&queue->fence_ctx.seqno));
 
-	memcpy(queue->ringbuf->kmap + ringbuf_insert,
-	       call_instrs, sizeof(call_instrs));
+	/*
+	 * Need to handle the wrap-around case when copying profiled instructions
+	 * from an odd-indexed slot. The reason this can happen is user space is
+	 * able to control the profiling status of the driver through a sysfs
+	 * knob, so this might lead to a timestamp and cycles-profiling call
+	 * instruction stream beginning at an odd-number slot. The GPU should
+	 * be able to gracefully handle this.
+	 */
+	if (!ringbuf_wraparound) {
+		memcpy(queue->ringbuf->kmap + ringbuf_insert,
+		       call_instrs, call_insrt_size);
+	} else {
+		memcpy(queue->ringbuf->kmap + ringbuf_insert,
+		       call_instrs, call_insrt_size/2);
+		memcpy(queue->ringbuf->kmap, call_instrs +
+		       NUM_INSTRS_PER_SLOT, call_insrt_size/2);
+	}
 
 	panthor_job_get(&job->base);
 	spin_lock(&queue->fence_ctx.lock);
@@ -2994,7 +3063,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 	spin_unlock(&queue->fence_ctx.lock);
 
 	job->ringbuf.start = queue->iface.input->insert;
-	job->ringbuf.end = job->ringbuf.start + sizeof(call_instrs);
+	job->ringbuf.end = job->ringbuf.start + call_insrt_size;
 	job->ringbuf_idx = ringbuf_index;
 
 	/* Make sure the ring buffer is updated before the INSERT
@@ -3141,9 +3210,14 @@ group_create_queue(struct panthor_group *group,
 	queue->time_offset = group->syncobjs.job_times_offset +
 		(slots_so_far * sizeof(struct panthor_job_times));
 
+	/*
+	 * Credit limit argument tells us the total number of instructions
+	 * across all CS slots in the ringbuffer, with some jobs requiring
+	 * twice as many as others, depending on their profiling status.
+	 */
 	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
 			     group->ptdev->scheduler->wq, 1,
-			     args->ringbuf_size / SLOTSIZE,
+			     args->ringbuf_size / sizeof(u64),
 			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
 			     group->ptdev->reset.wq,
 			     NULL, "panthor-queue", group->ptdev->base.dev);
@@ -3538,9 +3612,12 @@ panthor_job_create(struct panthor_file *pfile,
 		goto err_put_job;
 	}
 
+	job->is_profiled = pfile->ptdev->profile_mode;
+
 	ret = drm_sched_job_init(&job->base,
 				 &job->group->queues[job->queue_idx]->entity,
-				 1, job->group);
+				 job->is_profiled ? NUM_INSTRS_PER_SLOT * 2 :
+				 NUM_INSTRS_PER_SLOT, job->group);
 	if (ret)
 		goto err_put_job;
 
-- 
2.45.1

