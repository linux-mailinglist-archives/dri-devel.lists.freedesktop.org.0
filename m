Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B313B59EF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8E16E25B;
	Mon, 28 Jun 2021 07:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E44D6E047
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 07:42:23 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 343391F4259A;
 Mon, 28 Jun 2021 08:42:21 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 12/14] drm/panfrost: Don't reset the GPU on job faults
 unless we really have to
Date: Mon, 28 Jun 2021 09:42:08 +0200
Message-Id: <20210628074210.2695399-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628074210.2695399-1-boris.brezillon@collabora.com>
References: <20210628074210.2695399-1-boris.brezillon@collabora.com>
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

If we can recover from a fault without a reset there's no reason to
issue one.

v3:
* Drop the mention of Valhall requiring a reset on JOB_BUS_FAULT
* Set the fence error to -EINVAL instead of having per-exception
  error codes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c |  9 +++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 16 ++++++++++++++--
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 736854542b05..f4e42009526d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -379,6 +379,15 @@ const char *panfrost_exception_name(u32 exception_code)
 	return panfrost_exception_infos[exception_code].name;
 }
 
+bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
+				    u32 exception_code)
+{
+	/* Right now, none of the GPU we support need a reset, but this
+	 * might change.
+	 */
+	return false;
+}
+
 void panfrost_device_reset(struct panfrost_device *pfdev)
 {
 	panfrost_gpu_soft_reset(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 2dc8c0d1d987..d91f71366214 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -244,6 +244,8 @@ enum drm_panfrost_exception_type {
 };
 
 const char *panfrost_exception_name(u32 exception_code);
+bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
+				    u32 exception_code);
 
 static inline void
 panfrost_device_schedule_reset(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 4bd4d11377b7..b0f4857ca084 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -498,14 +498,26 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 		job_write(pfdev, JOB_INT_CLEAR, mask);
 
 		if (status & JOB_INT_MASK_ERR(j)) {
+			u32 js_status = job_read(pfdev, JS_STATUS(j));
+
 			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
 
 			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
 				j,
-				panfrost_exception_name(job_read(pfdev, JS_STATUS(j))),
+				panfrost_exception_name(js_status),
 				job_read(pfdev, JS_HEAD_LO(j)),
 				job_read(pfdev, JS_TAIL_LO(j)));
-			drm_sched_fault(&pfdev->js->queue[j].sched);
+
+			/* If we need a reset, signal it to the timeout
+			 * handler, otherwise, update the fence error field and
+			 * signal the job fence.
+			 */
+			if (panfrost_exception_needs_reset(pfdev, js_status)) {
+				drm_sched_fault(&pfdev->js->queue[j].sched);
+			} else {
+				dma_fence_set_error(pfdev->jobs[j]->done_fence, -EINVAL);
+				status |= JOB_INT_MASK_DONE(j);
+			}
 		}
 
 		if (status & JOB_INT_MASK_DONE(j)) {
-- 
2.31.1

