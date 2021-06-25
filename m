Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF18C3B448F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 15:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07DD6EDDC;
	Fri, 25 Jun 2021 13:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985266EDD3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 13:33:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0F0671F40486;
 Fri, 25 Jun 2021 14:33:39 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/15] drm/panfrost: Make sure job interrupts are masked
 before resetting
Date: Fri, 25 Jun 2021 15:33:22 +0200
Message-Id: <20210625133327.2598825-11-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625133327.2598825-1-boris.brezillon@collabora.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
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

This is not yet needed because we let active jobs be killed during by
the reset and we don't really bother making sure they can be restarted.
But once we start adding soft-stop support, controlling when we deal
with the remaining interrrupts and making sure those are handled before
the reset is issued gets tricky if we keep job interrupts active.

Let's prepare for that and mask+flush job IRQs before issuing a reset.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 88d34fd781e8..0566e2f7e84a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -34,6 +34,7 @@ struct panfrost_queue_state {
 struct panfrost_job_slot {
 	struct panfrost_queue_state queue[NUM_JOB_SLOTS];
 	spinlock_t job_lock;
+	int irq;
 };
 
 static struct panfrost_job *
@@ -400,7 +401,15 @@ static void panfrost_reset(struct panfrost_device *pfdev,
 	if (bad)
 		drm_sched_increase_karma(bad);
 
-	spin_lock(&pfdev->js->job_lock);
+	/* Mask job interrupts and synchronize to make sure we won't be
+	 * interrupted during our reset.
+	 */
+	job_write(pfdev, JOB_INT_MASK, 0);
+	synchronize_irq(pfdev->js->irq);
+
+	/* Schedulers are stopped and interrupts are masked+flushed, we don't
+	 * need to protect the 'evict unfinished jobs' lock with the job_lock.
+	 */
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		if (pfdev->jobs[i]) {
 			pm_runtime_put_noidle(pfdev->dev);
@@ -408,7 +417,6 @@ static void panfrost_reset(struct panfrost_device *pfdev,
 			pfdev->jobs[i] = NULL;
 		}
 	}
-	spin_unlock(&pfdev->js->job_lock);
 
 	panfrost_device_reset(pfdev);
 
@@ -504,6 +512,7 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 
 			job = pfdev->jobs[j];
 			/* Only NULL if job timeout occurred */
+			WARN_ON(!job);
 			if (job) {
 				pfdev->jobs[j] = NULL;
 
@@ -563,7 +572,7 @@ static void panfrost_reset_work(struct work_struct *work)
 int panfrost_job_init(struct panfrost_device *pfdev)
 {
 	struct panfrost_job_slot *js;
-	int ret, j, irq;
+	int ret, j;
 
 	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
 
@@ -573,11 +582,11 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&js->job_lock);
 
-	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
-	if (irq <= 0)
+	js->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
+	if (js->irq <= 0)
 		return -ENODEV;
 
-	ret = devm_request_threaded_irq(pfdev->dev, irq,
+	ret = devm_request_threaded_irq(pfdev->dev, js->irq,
 					panfrost_job_irq_handler,
 					panfrost_job_irq_handler_thread,
 					IRQF_SHARED, KBUILD_MODNAME "-job",
-- 
2.31.1

