Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275E2800BD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 16:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33896E177;
	Thu,  1 Oct 2020 14:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5B06E177
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 14:01:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 211C529D5DD;
 Thu,  1 Oct 2020 15:01:52 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] panfrost: Fix job timeout handling
Date: Thu,  1 Oct 2020 16:01:43 +0200
Message-Id: <20201001140143.1058669-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If more than two or more jobs end up timeout-ing concurrently, only one
of them (the one attached to the scheduler acquiring the lock) is fully
handled. The other one remains in a dangling state where it's no longer
part of the scheduling queue, but still blocks something in scheduler
thus leading to repetitive timeouts when new jobs are queued.

Let's make sure all bad jobs are properly handled by the thread acquiring
the lock.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 30e7b7196dab..e87edca51d84 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -25,7 +25,7 @@
 
 struct panfrost_queue_state {
 	struct drm_gpu_scheduler sched;
-
+	struct drm_sched_job *bad;
 	u64 fence_context;
 	u64 emit_seqno;
 };
@@ -392,19 +392,29 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
 		job_read(pfdev, JS_TAIL_LO(js)),
 		sched_job);
 
+	/*
+	 * Collect the bad job here so it can be processed by the thread
+	 * acquiring the reset lock.
+	 */
+	pfdev->js->queue[js].bad = sched_job;
+
 	if (!mutex_trylock(&pfdev->reset_lock))
 		return;
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
 
-		drm_sched_stop(sched, sched_job);
 		if (js != i)
 			/* Ensure any timeouts on other slots have finished */
 			cancel_delayed_work_sync(&sched->work_tdr);
-	}
 
-	drm_sched_increase_karma(sched_job);
+		drm_sched_stop(sched, pfdev->js->queue[i].bad);
+
+		if (pfdev->js->queue[i].bad)
+			drm_sched_increase_karma(pfdev->js->queue[i].bad);
+
+		pfdev->js->queue[i].bad = NULL;
+	}
 
 	spin_lock_irqsave(&pfdev->js->job_lock, flags);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
