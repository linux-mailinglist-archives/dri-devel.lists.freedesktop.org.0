Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF03B7D66
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 08:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FD56E933;
	Wed, 30 Jun 2021 06:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9794A6E92F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 06:28:06 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D4A761F431AF;
 Wed, 30 Jun 2021 07:28:04 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 08/16] drm/panfrost: Use a threaded IRQ for job interrupts
Date: Wed, 30 Jun 2021 08:27:43 +0200
Message-Id: <20210630062751.2832545-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210630062751.2832545-1-boris.brezillon@collabora.com>
References: <20210630062751.2832545-1-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should avoid switching to interrupt context when the GPU is under
heavy use.

v3:
* Don't take the job_lock in panfrost_job_handle_irq()

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 53 ++++++++++++++++++-------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 12285a285765..6149e4c7133f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -459,19 +459,12 @@ static const struct drm_sched_backend_ops panfrost_sched_ops = {
 	.free_job = panfrost_job_free
 };
 
-static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
+static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 {
-	struct panfrost_device *pfdev = data;
-	u32 status = job_read(pfdev, JOB_INT_STAT);
 	int j;
 
 	dev_dbg(pfdev->dev, "jobslot irq status=%x\n", status);
 
-	if (!status)
-		return IRQ_NONE;
-
-	pm_runtime_mark_last_busy(pfdev->dev);
-
 	for (j = 0; status; j++) {
 		u32 mask = MK_JS_MASK(j);
 
@@ -508,7 +501,6 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 		if (status & JOB_INT_MASK_DONE(j)) {
 			struct panfrost_job *job;
 
-			spin_lock(&pfdev->js->job_lock);
 			job = pfdev->jobs[j];
 			/* Only NULL if job timeout occurred */
 			if (job) {
@@ -520,21 +512,49 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 				dma_fence_signal_locked(job->done_fence);
 				pm_runtime_put_autosuspend(pfdev->dev);
 			}
-			spin_unlock(&pfdev->js->job_lock);
 		}
 
 		status &= ~mask;
 	}
+}
 
+static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
+{
+	struct panfrost_device *pfdev = data;
+	u32 status = job_read(pfdev, JOB_INT_RAWSTAT);
+
+	while (status) {
+		pm_runtime_mark_last_busy(pfdev->dev);
+
+		spin_lock(&pfdev->js->job_lock);
+		panfrost_job_handle_irq(pfdev, status);
+		spin_unlock(&pfdev->js->job_lock);
+		status = job_read(pfdev, JOB_INT_RAWSTAT);
+	}
+
+	job_write(pfdev, JOB_INT_MASK,
+		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
+		  GENMASK(NUM_JOB_SLOTS - 1, 0));
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
+{
+	struct panfrost_device *pfdev = data;
+	u32 status = job_read(pfdev, JOB_INT_STAT);
+
+	if (!status)
+		return IRQ_NONE;
+
+	job_write(pfdev, JOB_INT_MASK, 0);
+	return IRQ_WAKE_THREAD;
+}
+
 static void panfrost_reset(struct work_struct *work)
 {
 	struct panfrost_device *pfdev = container_of(work,
 						     struct panfrost_device,
 						     reset.work);
-	unsigned long flags;
 	unsigned int i;
 	bool cookie;
 
@@ -564,7 +584,7 @@ static void panfrost_reset(struct work_struct *work)
 	/* All timers have been stopped, we can safely reset the pending state. */
 	atomic_set(&pfdev->reset.pending, 0);
 
-	spin_lock_irqsave(&pfdev->js->job_lock, flags);
+	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		if (pfdev->jobs[i]) {
 			pm_runtime_put_noidle(pfdev->dev);
@@ -572,7 +592,7 @@ static void panfrost_reset(struct work_struct *work)
 			pfdev->jobs[i] = NULL;
 		}
 	}
-	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
+	spin_unlock(&pfdev->js->job_lock);
 
 	panfrost_device_reset(pfdev);
 
@@ -599,8 +619,11 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	if (irq <= 0)
 		return -ENODEV;
 
-	ret = devm_request_irq(pfdev->dev, irq, panfrost_job_irq_handler,
-			       IRQF_SHARED, KBUILD_MODNAME "-job", pfdev);
+	ret = devm_request_threaded_irq(pfdev->dev, irq,
+					panfrost_job_irq_handler,
+					panfrost_job_irq_handler_thread,
+					IRQF_SHARED, KBUILD_MODNAME "-job",
+					pfdev);
 	if (ret) {
 		dev_err(pfdev->dev, "failed to request job irq");
 		return ret;
-- 
2.31.1

