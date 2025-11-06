Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4622CC3BD9C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E1410E92A;
	Thu,  6 Nov 2025 14:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JtxfPkBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1970910E90E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762440428;
 bh=eTN+3HwMeGRyPofOI1YStnCDzQ8GJ7ygLxxs4phWz0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JtxfPkBkPTah9FOpGoN2G9H+TudfAHkdeMGXqV3fsdpdar4Zhoidx7QQeBr9K9beY
 IUWJNZnhwdEOWasc6NUqa5jIu6f+Qk+uqDZ0tm0lV6/rSQhHugCjEDoZZPiNrYioSp
 Z1QZhvsnYmMCm20VES1W1UP6qTXuQu6wrTVFtVysYOu4+t/akhU3ymAK180a/ig30J
 N5HhGhw2GR9ZSXneN/eslJpXuMQYYdLV2jb1Qsf0Q7PQYlc9v6plqwgxB2ZRRtKf+J
 CbeQmShaESheSpscCsUibx20YCBq27cpRpgYxW0kOSXuwTa1kgL+Iw4BL8kZSSxFGz
 bbBrqzRZ8R/Xw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6923C17E1465;
 Thu,  6 Nov 2025 15:47:08 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v1 7/8] drm/panthor: Make sure we resume the tick when new
 jobs are submitted
Date: Thu,  6 Nov 2025 15:46:55 +0100
Message-ID: <20251106144656.1012274-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106144656.1012274-1-boris.brezillon@collabora.com>
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

If the group is already assigned a slot but was idle before this job
submission, we need to make sure the priority rotation happens in the
future. Extract the existing logic living in group_schedule_locked()
and call this new sched_resume_tick() helper from the "group is
assigned a slot" path.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 43 +++++++++++++++++++------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 7b164228af7b..923816397751 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2541,14 +2541,33 @@ static void sync_upd_work(struct work_struct *work)
 		sched_queue_delayed_work(sched, tick, 0);
 }
 
+static void sched_resume_tick(struct panthor_device *ptdev)
+{
+	struct panthor_scheduler *sched = ptdev->scheduler;
+	u64 delay_jiffies, now;
+
+	drm_WARN_ON(&ptdev->base, sched->resched_target != U64_MAX);
+
+	/* Scheduler tick was off, recalculate the resched_target based on the
+	 * last tick event, and queue the scheduler work.
+	 */
+	now = get_jiffies_64();
+	sched->resched_target = sched->last_tick + sched->tick_period;
+	if (sched->used_csg_slot_count == sched->csg_slot_count &&
+	    time_before64(now, sched->resched_target))
+		delay_jiffies = min_t(unsigned long, sched->resched_target - now, ULONG_MAX);
+	else
+		delay_jiffies = 0;
+
+	sched_queue_delayed_work(sched, tick, delay_jiffies);
+}
+
 static void group_schedule_locked(struct panthor_group *group, u32 queue_mask)
 {
 	struct panthor_device *ptdev = group->ptdev;
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct list_head *queue = &sched->groups.runnable[group->priority];
-	u64 delay_jiffies = 0;
 	bool was_idle;
-	u64 now;
 
 	if (!group_can_run(group))
 		return;
@@ -2593,13 +2612,7 @@ static void group_schedule_locked(struct panthor_group *group, u32 queue_mask)
 	/* Scheduler tick was off, recalculate the resched_target based on the
 	 * last tick event, and queue the scheduler work.
 	 */
-	now = get_jiffies_64();
-	sched->resched_target = sched->last_tick + sched->tick_period;
-	if (sched->used_csg_slot_count == sched->csg_slot_count &&
-	    time_before64(now, sched->resched_target))
-		delay_jiffies = min_t(unsigned long, sched->resched_target - now, ULONG_MAX);
-
-	sched_queue_delayed_work(sched, tick, delay_jiffies);
+	sched_resume_tick(ptdev);
 }
 
 static void queue_stop(struct panthor_queue *queue,
@@ -3200,6 +3213,18 @@ queue_run_job(struct drm_sched_job *sched_job)
 
 		group_schedule_locked(group, BIT(job->queue_idx));
 	} else {
+		u32 queue_mask = BIT(job->queue_idx);
+		bool resume_tick = group_is_idle(group) &&
+				   (group->idle_queues & queue_mask) &&
+				   !(group->blocked_queues & queue_mask) &&
+				   sched->resched_target == U64_MAX;
+
+		/* We just added something to the queue, so it's no longer idle. */
+		group->idle_queues &= ~BIT(job->queue_idx);
+
+		if (resume_tick)
+			sched_resume_tick(ptdev);
+
 		gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
 		if (!sched->pm.has_ref &&
 		    !(group->blocked_queues & BIT(job->queue_idx))) {
-- 
2.51.1

