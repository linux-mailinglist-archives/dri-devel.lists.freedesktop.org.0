Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E862DC91827
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0CB10E802;
	Fri, 28 Nov 2025 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ixZ7V4o4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC0E10E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323334;
 bh=J0aIAbcWkTm2LE5tfsT2XFKYAd90a629HAuN33Z9NeE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ixZ7V4o4mozaMlv23pdbAP4oioTNthzsAs00Kq58k0UihJrk6dlwHpkq4tsTep7EM
 lQVqbXaFDwpZPxXe/1ZSSnXMA59/b9hjY+IuM3tSqIs6ESfSXx2vyxeTH0tigg/WVS
 O86UJGy0EVrM21z5IpOSaQkObSfrHE5D3qVu6IAocvzdzy/rzHlvEVBTtu3vkHEjTt
 ejBgTMdWJQ4VKR+3jFwTK/hOLule86xhVvpi6/GbRViuUHpAnyapwiK+xkJjLG+9CE
 9FE0YFHVNJ9WlqXSS7E9vXfl29w9opK1/5vafl6CRFIMxyIoe8CZkR2PFQ1fjqDkwh
 h8yFYmmxpEOwA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EBB617E1428;
 Fri, 28 Nov 2025 10:48:53 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 7/8] drm/panthor: Make sure we resume the tick when new
 jobs are submitted
Date: Fri, 28 Nov 2025 10:48:38 +0100
Message-ID: <20251128094839.3856402-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128094839.3856402-1-boris.brezillon@collabora.com>
References: <20251128094839.3856402-1-boris.brezillon@collabora.com>
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

v2:
- Add R-b

v3:
- Re-use queue_mask to clear the bit
- Collect R-b

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 43 +++++++++++++++++++------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 8846608dd127..7759a8a8565e 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2624,14 +2624,33 @@ static void sync_upd_work(struct work_struct *work)
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
@@ -2676,13 +2695,7 @@ static void group_schedule_locked(struct panthor_group *group, u32 queue_mask)
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
@@ -3314,6 +3327,18 @@ queue_run_job(struct drm_sched_job *sched_job)
 	if (group->csg_id < 0) {
 		group_schedule_locked(group, BIT(job->queue_idx));
 	} else {
+		u32 queue_mask = BIT(job->queue_idx);
+		bool resume_tick = group_is_idle(group) &&
+				   (group->idle_queues & queue_mask) &&
+				   !(group->blocked_queues & queue_mask) &&
+				   sched->resched_target == U64_MAX;
+
+		/* We just added something to the queue, so it's no longer idle. */
+		group->idle_queues &= ~queue_mask;
+
+		if (resume_tick)
+			sched_resume_tick(ptdev);
+
 		gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
 		if (!sched->pm.has_ref &&
 		    !(group->blocked_queues & BIT(job->queue_idx))) {
-- 
2.51.1

