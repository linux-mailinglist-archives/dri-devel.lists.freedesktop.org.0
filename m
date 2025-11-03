Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A31C2C89B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97B10E1FF;
	Mon,  3 Nov 2025 15:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fv+fyIp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1C10E1FF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762182122;
 bh=pG62EOJw/5WDLuVChnEetPb0f/Mm7NBzHVZLjOO0jAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fv+fyIp29V5XiGISL3Lkonw0KE5WlGM/0XtUWBrSlON1FQH0T+PKZYCpA1/G3zAZL
 D43WOvZ4Vor0ujvWy/UOlqNYNCMvnjgHAPbUaKZjOk+owfwb8ZlraZZ7lJHcny9NWx
 ihYVc2HyEBIacvJbsJ+WyNCTxTo0W+Q2J/gVscfy3mRmwtY6jJRLu/8AEWd/XeKDtH
 EkzmwYXH/GKaEkA5Q2AL146UyjyvgIHt++pOM/HwhT+wJ7z81DrVztu3jeF0xkz6fd
 nhrgvcuXRAzzyNOCZumLDxPcN7csdlt3tBQwd/KYZkofqQfSinsIUHdM2aSmDN73Zs
 x0uxhEgueQhzw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3401617E13BC;
 Mon,  3 Nov 2025 16:02:02 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, kernel@collabora.com
Subject: [PATCH v6 1/2] drm/panthor: Make the timeout per-queue instead of
 per-job
Date: Mon,  3 Nov 2025 16:01:53 +0100
Message-ID: <20251103150154.31056-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103150154.31056-1-boris.brezillon@collabora.com>
References: <20251103150154.31056-1-boris.brezillon@collabora.com>
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

From: Ashley Smith <ashley.smith@collabora.com>

The timeout logic provided by drm_sched leads to races when we try
to suspend it while the drm_sched workqueue queues more jobs. Let's
overhaul the timeout handling in panthor to have our own delayed work
that's resumed/suspended when a group is resumed/suspended. When an
actual timeout occurs, we call drm_sched_fault() to report it
through drm_sched, still. But otherwise, the drm_sched timeout is
disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
how we protect modifications on the timer.

One issue seems to be when we call drm_sched_suspend_timeout() from
both queue_run_job() and tick_work() which could lead to races due to
drm_sched_suspend_timeout() not having a lock. Another issue seems to
be in queue_run_job() if the group is not scheduled, we suspend the
timeout again which undoes what drm_sched_job_begin() did when calling
drm_sched_start_timeout(). So the timeout does not reset when a job
is finished.

v6:
- Fix a NULL deref in group_can_run(), and narrow the group variable
  scope to avoid such mistakes in the future
- Add an queue_timeout_is_suspended() helper to clarify things

v5:
- No changes

v4:
- No changes

v3:
- Split the changes in two commits

v2:
- Fix syntax error

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 285 +++++++++++++++++-------
 1 file changed, 206 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e74ca071159d..b440187798dd 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -364,17 +364,20 @@ struct panthor_queue {
 	/** @name: DRM scheduler name for this queue. */
 	char *name;
 
-	/**
-	 * @remaining_time: Time remaining before the job timeout expires.
-	 *
-	 * The job timeout is suspended when the queue is not scheduled by the
-	 * FW. Every time we suspend the timer, we need to save the remaining
-	 * time so we can restore it later on.
-	 */
-	unsigned long remaining_time;
+	/** @timeout: Queue timeout related fields. */
+	struct {
+		/** @timeout.work: Work executed when a queue timeout occurs. */
+		struct delayed_work work;
 
-	/** @timeout_suspended: True if the job timeout was suspended. */
-	bool timeout_suspended;
+		/**
+		 * @timeout.remaining: Time remaining before a queue timeout.
+		 *
+		 * When the timer is running, this value is set to MAX_SCHEDULE_TIMEOUT.
+		 * When the timer is suspended, it's set to the time remaining when the
+		 * timer was suspended.
+		 */
+		unsigned long remaining;
+	} timeout;
 
 	/**
 	 * @doorbell_id: Doorbell assigned to this queue.
@@ -899,6 +902,10 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	if (IS_ERR_OR_NULL(queue))
 		return;
 
+	/* This should have been disabled before that point. */
+	drm_WARN_ON(&group->ptdev->base,
+		    disable_delayed_work_sync(&queue->timeout.work));
+
 	if (queue->entity.fence_context)
 		drm_sched_entity_destroy(&queue->entity);
 
@@ -1046,6 +1053,115 @@ group_unbind_locked(struct panthor_group *group)
 	return 0;
 }
 
+static bool
+group_is_idle(struct panthor_group *group)
+{
+	struct panthor_device *ptdev = group->ptdev;
+	u32 inactive_queues;
+
+	if (group->csg_id >= 0)
+		return ptdev->scheduler->csg_slots[group->csg_id].idle;
+
+	inactive_queues = group->idle_queues | group->blocked_queues;
+	return hweight32(inactive_queues) == group->queue_count;
+}
+
+static void
+queue_reset_timeout_locked(struct panthor_queue *queue)
+{
+	lockdep_assert_held(&queue->fence_ctx.lock);
+
+	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT) {
+		mod_delayed_work(queue->scheduler.timeout_wq,
+				 &queue->timeout.work,
+				 msecs_to_jiffies(JOB_TIMEOUT_MS));
+	}
+}
+
+static bool
+group_can_run(struct panthor_group *group)
+{
+	return group->state != PANTHOR_CS_GROUP_TERMINATED &&
+	       group->state != PANTHOR_CS_GROUP_UNKNOWN_STATE &&
+	       !group->destroyed && group->fatal_queues == 0 &&
+	       !group->timedout;
+}
+
+static bool
+queue_timeout_is_suspended(struct panthor_queue *queue)
+{
+	/* When running, the remaining time is set to MAX_SCHEDULE_TIMEOUT. */
+	return queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT;
+}
+
+static void
+queue_suspend_timeout_locked(struct panthor_queue *queue)
+{
+	unsigned long qtimeout, now;
+	struct panthor_group *group;
+	struct panthor_job *job;
+	bool timer_was_active;
+
+	lockdep_assert_held(&queue->fence_ctx.lock);
+
+	/* Already suspended, nothing to do. */
+	if (queue_timeout_is_suspended(queue))
+		return;
+
+	job = list_first_entry_or_null(&queue->fence_ctx.in_flight_jobs,
+				       struct panthor_job, node);
+	group = job ? job->group : NULL;
+
+	/* If the queue is blocked and the group is idle, we want the timer to
+	 * keep running because the group can't be unblocked by other queues,
+	 * so it has to come from an external source, and we want to timebox
+	 * this external signalling.
+	 */
+	if (group && group_can_run(group) &&
+	    (group->blocked_queues & BIT(job->queue_idx)) &&
+	    group_is_idle(group))
+		return;
+
+	now = jiffies;
+	qtimeout = queue->timeout.work.timer.expires;
+
+	/* Cancel the timer. */
+	timer_was_active = cancel_delayed_work(&queue->timeout.work);
+	if (!timer_was_active || !job)
+		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
+	else if (time_after(qtimeout, now))
+		queue->timeout.remaining = qtimeout - now;
+	else
+		queue->timeout.remaining = 0;
+
+	if (WARN_ON_ONCE(queue->timeout.remaining > msecs_to_jiffies(JOB_TIMEOUT_MS)))
+		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
+}
+
+static void
+queue_suspend_timeout(struct panthor_queue *queue)
+{
+	spin_lock(&queue->fence_ctx.lock);
+	queue_suspend_timeout_locked(queue);
+	spin_unlock(&queue->fence_ctx.lock);
+}
+
+static void
+queue_resume_timeout(struct panthor_queue *queue)
+{
+	spin_lock(&queue->fence_ctx.lock);
+
+	if (queue_timeout_is_suspended(queue)) {
+		mod_delayed_work(queue->scheduler.timeout_wq,
+				 &queue->timeout.work,
+				 queue->timeout.remaining);
+
+		queue->timeout.remaining = MAX_SCHEDULE_TIMEOUT;
+	}
+
+	spin_unlock(&queue->fence_ctx.lock);
+}
+
 /**
  * cs_slot_prog_locked() - Program a queue slot
  * @ptdev: Device.
@@ -1084,10 +1200,8 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
 			       CS_IDLE_EMPTY |
 			       CS_STATE_MASK |
 			       CS_EXTRACT_EVENT);
-	if (queue->iface.input->insert != queue->iface.input->extract && queue->timeout_suspended) {
-		drm_sched_resume_timeout(&queue->scheduler, queue->remaining_time);
-		queue->timeout_suspended = false;
-	}
+	if (queue->iface.input->insert != queue->iface.input->extract)
+		queue_resume_timeout(queue);
 }
 
 /**
@@ -1114,14 +1228,7 @@ cs_slot_reset_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
 			       CS_STATE_STOP,
 			       CS_STATE_MASK);
 
-	/* If the queue is blocked, we want to keep the timeout running, so
-	 * we can detect unbounded waits and kill the group when that happens.
-	 */
-	if (!(group->blocked_queues & BIT(cs_id)) && !queue->timeout_suspended) {
-		queue->remaining_time = drm_sched_suspend_timeout(&queue->scheduler);
-		queue->timeout_suspended = true;
-		WARN_ON(queue->remaining_time > msecs_to_jiffies(JOB_TIMEOUT_MS));
-	}
+	queue_suspend_timeout(queue);
 
 	return 0;
 }
@@ -1916,28 +2023,6 @@ tick_ctx_is_full(const struct panthor_scheduler *sched,
 	return ctx->group_count == sched->csg_slot_count;
 }
 
-static bool
-group_is_idle(struct panthor_group *group)
-{
-	struct panthor_device *ptdev = group->ptdev;
-	u32 inactive_queues;
-
-	if (group->csg_id >= 0)
-		return ptdev->scheduler->csg_slots[group->csg_id].idle;
-
-	inactive_queues = group->idle_queues | group->blocked_queues;
-	return hweight32(inactive_queues) == group->queue_count;
-}
-
-static bool
-group_can_run(struct panthor_group *group)
-{
-	return group->state != PANTHOR_CS_GROUP_TERMINATED &&
-	       group->state != PANTHOR_CS_GROUP_UNKNOWN_STATE &&
-	       !group->destroyed && group->fatal_queues == 0 &&
-	       !group->timedout;
-}
-
 static void
 tick_ctx_pick_groups_from_list(const struct panthor_scheduler *sched,
 			       struct panthor_sched_tick_ctx *ctx,
@@ -2619,6 +2704,7 @@ static void group_schedule_locked(struct panthor_group *group, u32 queue_mask)
 static void queue_stop(struct panthor_queue *queue,
 		       struct panthor_job *bad_job)
 {
+	disable_delayed_work_sync(&queue->timeout.work);
 	drm_sched_stop(&queue->scheduler, bad_job ? &bad_job->base : NULL);
 }
 
@@ -2630,6 +2716,7 @@ static void queue_start(struct panthor_queue *queue)
 	list_for_each_entry(job, &queue->scheduler.pending_list, base.list)
 		job->base.s_fence->parent = dma_fence_get(job->done_fence);
 
+	enable_delayed_work(&queue->timeout.work);
 	drm_sched_start(&queue->scheduler, 0);
 }
 
@@ -2696,7 +2783,6 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 {
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
-	struct panthor_group *group;
 	u32 suspended_slots;
 	u32 i;
 
@@ -2786,8 +2872,8 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 
 	for (i = 0; i < sched->csg_slot_count; i++) {
 		struct panthor_csg_slot *csg_slot = &sched->csg_slots[i];
+		struct panthor_group *group = csg_slot->group;
 
-		group = csg_slot->group;
 		if (!group)
 			continue;
 
@@ -2916,35 +3002,47 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 	xa_unlock(&gpool->xa);
 }
 
-static void group_sync_upd_work(struct work_struct *work)
+static bool queue_check_job_completion(struct panthor_queue *queue)
 {
-	struct panthor_group *group =
-		container_of(work, struct panthor_group, sync_upd_work);
+	struct panthor_syncobj_64b *syncobj = NULL;
 	struct panthor_job *job, *job_tmp;
+	bool cookie, progress = false;
 	LIST_HEAD(done_jobs);
-	u32 queue_idx;
-	bool cookie;
 
 	cookie = dma_fence_begin_signalling();
-	for (queue_idx = 0; queue_idx < group->queue_count; queue_idx++) {
-		struct panthor_queue *queue = group->queues[queue_idx];
-		struct panthor_syncobj_64b *syncobj;
+	spin_lock(&queue->fence_ctx.lock);
+	list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
+		if (!syncobj) {
+			struct panthor_group *group = job->group;
 
-		if (!queue)
-			continue;
-
-		syncobj = group->syncobjs->kmap + (queue_idx * sizeof(*syncobj));
-
-		spin_lock(&queue->fence_ctx.lock);
-		list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
-			if (syncobj->seqno < job->done_fence->seqno)
-				break;
-
-			list_move_tail(&job->node, &done_jobs);
-			dma_fence_signal_locked(job->done_fence);
+			syncobj = group->syncobjs->kmap +
+				  (job->queue_idx * sizeof(*syncobj));
 		}
-		spin_unlock(&queue->fence_ctx.lock);
+
+		if (syncobj->seqno < job->done_fence->seqno)
+			break;
+
+		list_move_tail(&job->node, &done_jobs);
+		dma_fence_signal_locked(job->done_fence);
 	}
+
+	if (list_empty(&queue->fence_ctx.in_flight_jobs)) {
+		/* If we have no job left, we cancel the timer, and reset remaining
+		 * time to its default so it can be restarted next time
+		 * queue_resume_timeout() is called.
+		 */
+		queue_suspend_timeout_locked(queue);
+
+		/* If there's no job pending, we consider it progress to avoid a
+		 * spurious timeout if the timeout handler and the sync update
+		 * handler raced.
+		 */
+		progress = true;
+	} else if (!list_empty(&done_jobs)) {
+		queue_reset_timeout_locked(queue);
+		progress = true;
+	}
+	spin_unlock(&queue->fence_ctx.lock);
 	dma_fence_end_signalling(cookie);
 
 	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
@@ -2954,6 +3052,27 @@ static void group_sync_upd_work(struct work_struct *work)
 		panthor_job_put(&job->base);
 	}
 
+	return progress;
+}
+
+static void group_sync_upd_work(struct work_struct *work)
+{
+	struct panthor_group *group =
+		container_of(work, struct panthor_group, sync_upd_work);
+	u32 queue_idx;
+	bool cookie;
+
+	cookie = dma_fence_begin_signalling();
+	for (queue_idx = 0; queue_idx < group->queue_count; queue_idx++) {
+		struct panthor_queue *queue = group->queues[queue_idx];
+
+		if (!queue)
+			continue;
+
+		queue_check_job_completion(queue);
+	}
+	dma_fence_end_signalling(cookie);
+
 	group_put(group);
 }
 
@@ -3201,17 +3320,6 @@ queue_run_job(struct drm_sched_job *sched_job)
 	queue->iface.input->insert = job->ringbuf.end;
 
 	if (group->csg_id < 0) {
-		/* If the queue is blocked, we want to keep the timeout running, so we
-		 * can detect unbounded waits and kill the group when that happens.
-		 * Otherwise, we suspend the timeout so the time we spend waiting for
-		 * a CSG slot is not counted.
-		 */
-		if (!(group->blocked_queues & BIT(job->queue_idx)) &&
-		    !queue->timeout_suspended) {
-			queue->remaining_time = drm_sched_suspend_timeout(&queue->scheduler);
-			queue->timeout_suspended = true;
-		}
-
 		group_schedule_locked(group, BIT(job->queue_idx));
 	} else {
 		gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
@@ -3220,6 +3328,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 			pm_runtime_get(ptdev->base.dev);
 			sched->pm.has_ref = true;
 		}
+		queue_resume_timeout(queue);
 		panthor_devfreq_record_busy(sched->ptdev);
 	}
 
@@ -3270,6 +3379,11 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 
 	queue_start(queue);
 
+	/* We already flagged the queue as faulty, make sure we don't get
+	 * called again.
+	 */
+	queue->scheduler.timeout = MAX_SCHEDULE_TIMEOUT;
+
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 
@@ -3312,6 +3426,17 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
 	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
 }
 
+static void queue_timeout_work(struct work_struct *work)
+{
+	struct panthor_queue *queue = container_of(work, struct panthor_queue,
+						   timeout.work.work);
+	bool progress;
+
+	progress = queue_check_job_completion(queue);
+	if (!progress)
+		drm_sched_fault(&queue->scheduler);
+}
+
 static struct panthor_queue *
 group_create_queue(struct panthor_group *group,
 		   const struct drm_panthor_queue_create *args,
@@ -3328,7 +3453,7 @@ group_create_queue(struct panthor_group *group,
 		 * their profiling status.
 		 */
 		.credit_limit = args->ringbuf_size / sizeof(u64),
-		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
+		.timeout = MAX_SCHEDULE_TIMEOUT,
 		.timeout_wq = group->ptdev->reset.wq,
 		.dev = group->ptdev->base.dev,
 	};
@@ -3350,6 +3475,8 @@ group_create_queue(struct panthor_group *group,
 	if (!queue)
 		return ERR_PTR(-ENOMEM);
 
+	queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
+	INIT_DELAYED_WORK(&queue->timeout.work, queue_timeout_work);
 	queue->fence_ctx.id = dma_fence_context_alloc(1);
 	spin_lock_init(&queue->fence_ctx.lock);
 	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
-- 
2.51.1

