Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3929910A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 16:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592346EA21;
	Mon, 26 Oct 2020 15:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386B76E95B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 15:32:14 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C44D91F44CAD;
 Mon, 26 Oct 2020 15:32:12 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] drm/panfrost: Fix a race in the job timeout handling (again)
Date: Mon, 26 Oct 2020 16:32:06 +0100
Message-Id: <20201026153206.97037-1-boris.brezillon@collabora.com>
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

In our last attempt to fix races in the panfrost_job_timedout() path we
overlooked the case where a re-submitted job immediately triggers a
fault. This lead to a situation where we try to stop a scheduler that's
not resumed yet and lose the 'timedout' event without restarting the
timeout, thus blocking the whole queue.

Let's fix that by tracking timeouts occurring between the
drm_sched_resubmit_jobs() and drm_sched_start() calls.

Fixes: 1a11a88cfd9a ("drm/panfrost: Fix job timeout handling")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 42 ++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index d0469e944143..96c2c21a4205 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -26,6 +26,7 @@
 struct panfrost_queue_state {
 	struct drm_gpu_scheduler sched;
 	bool stopped;
+	bool timedout;
 	struct mutex lock;
 	u64 fence_context;
 	u64 emit_seqno;
@@ -383,11 +384,33 @@ static bool panfrost_scheduler_stop(struct panfrost_queue_state *queue,
 		queue->stopped = true;
 		stopped = true;
 	}
+	queue->timedout = true;
 	mutex_unlock(&queue->lock);
 
 	return stopped;
 }
 
+static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
+{
+	if (WARN_ON(!queue->stopped))
+		return;
+
+	mutex_lock(&queue->lock);
+	drm_sched_start(&queue->sched, true);
+
+	/*
+	 * We might have missed fault-timeouts (AKA immediate timeouts) while
+	 * the scheduler was stopped. Let's fake a new fault to trigger an
+	 * immediate reset.
+	 */
+	if (queue->timedout)
+		drm_sched_fault(&queue->sched);
+
+	queue->timedout = false;
+	queue->stopped = false;
+	mutex_unlock(&queue->lock);
+}
+
 static void panfrost_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
@@ -437,12 +460,6 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
 		 */
 		if (panfrost_scheduler_stop(&pfdev->js->queue[i], NULL))
 			cancel_delayed_work_sync(&sched->work_tdr);
-
-		/*
-		 * Now that we cancelled the pending timeouts, we can safely
-		 * reset the stopped state.
-		 */
-		pfdev->js->queue[i].stopped = false;
 	}
 
 	spin_lock_irqsave(&pfdev->js->job_lock, flags);
@@ -457,14 +474,23 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
 
 	panfrost_device_reset(pfdev);
 
-	for (i = 0; i < NUM_JOB_SLOTS; i++)
+	for (i = 0; i < NUM_JOB_SLOTS; i++) {
+		/*
+		 * The GPU is idle, and the scheduler is stopped, we can safely
+		 * reset the ->timedout state without taking any lock. We need
+		 * to do that before calling drm_sched_resubmit_jobs() though,
+		 * because the resubmission might trigger immediate faults
+		 * which we want to catch.
+		 */
+		pfdev->js->queue[i].timedout = false;
 		drm_sched_resubmit_jobs(&pfdev->js->queue[i].sched);
+	}
 
 	mutex_unlock(&pfdev->reset_lock);
 
 	/* restart scheduler after GPU is usable again */
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
-		drm_sched_start(&pfdev->js->queue[i].sched, true);
+		panfrost_scheduler_start(&pfdev->js->queue[i]);
 }
 
 static const struct drm_sched_backend_ops panfrost_sched_ops = {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
