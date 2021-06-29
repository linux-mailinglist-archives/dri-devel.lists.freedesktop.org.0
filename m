Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A176A3B6EDF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 09:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C7C6E822;
	Tue, 29 Jun 2021 07:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E921E6E7EF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 07:35:21 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 558E61F42EB9;
 Tue, 29 Jun 2021 08:35:20 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/16] drm/panfrost: Make sure job interrupts are masked
 before resetting
Date: Tue, 29 Jun 2021 09:35:04 +0200
Message-Id: <20210629073510.2764391-11-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629073510.2764391-1-boris.brezillon@collabora.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
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

v4:
* Add a comment explaining why we WARN_ON(!job) in the irq handler
* Keep taking the job_lock when evicting stalled jobs

v3:
* New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 27 ++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 98193a557a2d..4bd4d11377b7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -34,6 +34,7 @@ struct panfrost_queue_state {
 struct panfrost_job_slot {
 	struct panfrost_queue_state queue[NUM_JOB_SLOTS];
 	spinlock_t job_lock;
+	int irq;
 };
 
 static struct panfrost_job *
@@ -400,6 +401,15 @@ static void panfrost_reset(struct panfrost_device *pfdev,
 	if (bad)
 		drm_sched_increase_karma(bad);
 
+	/* Mask job interrupts and synchronize to make sure we won't be
+	 * interrupted during our reset.
+	 */
+	job_write(pfdev, JOB_INT_MASK, 0);
+	synchronize_irq(pfdev->js->irq);
+
+	/* Schedulers are stopped and interrupts are masked+flushed, we don't
+	 * need to protect the 'evict unfinished jobs' lock with the job_lock.
+	 */
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		if (pfdev->jobs[i]) {
@@ -502,7 +512,14 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 			struct panfrost_job *job;
 
 			job = pfdev->jobs[j];
-			/* Only NULL if job timeout occurred */
+			/* The only reason this job could be NULL is if the
+			 * job IRQ handler is called just after the
+			 * in-flight job eviction in the reset path, and
+			 * this shouldn't happen because the job IRQ has
+			 * been masked and synchronized when this eviction
+			 * happens.
+			 */
+			WARN_ON(!job);
 			if (job) {
 				pfdev->jobs[j] = NULL;
 
@@ -562,7 +579,7 @@ static void panfrost_reset_work(struct work_struct *work)
 int panfrost_job_init(struct panfrost_device *pfdev)
 {
 	struct panfrost_job_slot *js;
-	int ret, j, irq;
+	int ret, j;
 
 	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
 
@@ -572,11 +589,11 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 
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

