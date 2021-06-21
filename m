Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF113AEA39
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9C76E153;
	Mon, 21 Jun 2021 13:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B45C6E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:39:34 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CEE2B1F422B7;
 Mon, 21 Jun 2021 14:39:28 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 09/12] drm/panfrost: Don't reset the GPU on job faults
 unless we really have to
Date: Mon, 21 Jun 2021 15:39:04 +0200
Message-Id: <20210621133907.1683899-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621133907.1683899-1-boris.brezillon@collabora.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we can recover from a fault without a reset there's no reason to
issue one.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c |  9 ++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 35 ++++++++++++++--------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 2de011cee258..ac76e8646e97 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -383,6 +383,15 @@ int panfrost_exception_to_error(u32 exception_code)
 	return panfrost_exception_infos[exception_code].error;
 }
 
+bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
+				    u32 exception_code)
+{
+	/* Right now, none of the GPU we support need a reset, but this
+	 * might change (e.g. Valhall GPUs require a when a BUS_FAULT occurs).
+	 */
+	return false;
+}
+
 void panfrost_device_reset(struct panfrost_device *pfdev)
 {
 	panfrost_gpu_soft_reset(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 498c7b5dccd0..95e6044008d2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -175,6 +175,8 @@ int panfrost_device_suspend(struct device *dev);
 
 const char *panfrost_exception_name(u32 exception_code);
 int panfrost_exception_to_error(u32 exception_code);
+bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
+				    u32 exception_code);
 
 static inline void
 panfrost_device_schedule_reset(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index be5d3e4a1d0a..aedc604d331c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -493,27 +493,38 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 
 		if (status & JOB_INT_MASK_ERR(j)) {
 			enum panfrost_queue_status old_status;
+			u32 js_status = job_read(pfdev, JS_STATUS(j));
 
 			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
 
 			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
 				j,
-				panfrost_exception_name(job_read(pfdev, JS_STATUS(j))),
+				panfrost_exception_name(js_status),
 				job_read(pfdev, JS_HEAD_LO(j)),
 				job_read(pfdev, JS_TAIL_LO(j)));
 
-			/*
-			 * When the queue is being restarted we don't report
-			 * faults directly to avoid races between the timeout
-			 * and reset handlers. panfrost_scheduler_start() will
-			 * call drm_sched_fault() after the queue has been
-			 * started if status == FAULT_PENDING.
+			/* If we need a reset, signal it to the reset handler,
+			 * otherwise, update the fence error field and signal
+			 * the job fence.
 			 */
-			old_status = atomic_cmpxchg(&pfdev->js->queue[j].status,
-						    PANFROST_QUEUE_STATUS_STARTING,
-						    PANFROST_QUEUE_STATUS_FAULT_PENDING);
-			if (old_status == PANFROST_QUEUE_STATUS_ACTIVE)
-				drm_sched_fault(&pfdev->js->queue[j].sched);
+			if (panfrost_exception_needs_reset(pfdev, js_status)) {
+				/*
+				 * When the queue is being restarted we don't report
+				 * faults directly to avoid races between the timeout
+				 * and reset handlers. panfrost_scheduler_start() will
+				 * call drm_sched_fault() after the queue has been
+				 * started if status == FAULT_PENDING.
+				 */
+				old_status = atomic_cmpxchg(&pfdev->js->queue[j].status,
+							    PANFROST_QUEUE_STATUS_STARTING,
+							    PANFROST_QUEUE_STATUS_FAULT_PENDING);
+				if (old_status == PANFROST_QUEUE_STATUS_ACTIVE)
+					drm_sched_fault(&pfdev->js->queue[j].sched);
+			} else {
+				dma_fence_set_error(pfdev->jobs[j]->done_fence,
+						    panfrost_exception_to_error(js_status));
+				status |= JOB_INT_MASK_DONE(j);
+			}
 		}
 
 		if (status & JOB_INT_MASK_DONE(j)) {
-- 
2.31.1

