Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134F3B7D6D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 08:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91D6E93B;
	Wed, 30 Jun 2021 06:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25A36E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 06:28:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 46CBE1F42510;
 Wed, 30 Jun 2021 07:28:08 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 14/16] drm/panfrost: Kill in-flight jobs on FD close
Date: Wed, 30 Jun 2021 08:27:49 +0200
Message-Id: <20210630062751.2832545-15-boris.brezillon@collabora.com>
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

If the process who submitted these jobs decided to close the FD before
the jobs are done it probably means it doesn't care about the result.

v5:
* Add a panfrost_exception_is_fault() helper and the
  DRM_PANFROST_EXCEPTION_MAX_NON_FAULT value

v4:
* Don't disable/restore irqs when taking the job_lock (not needed since
  this lock is never taken from an interrupt context)

v3:
* Set fence error to ECANCELED when a TERMINATED exception is received

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  7 ++++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 42 ++++++++++++++++++----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 68e93b7e5b61..193cd87f643c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -184,6 +184,7 @@ enum drm_panfrost_exception_type {
 	DRM_PANFROST_EXCEPTION_KABOOM = 0x05,
 	DRM_PANFROST_EXCEPTION_EUREKA = 0x06,
 	DRM_PANFROST_EXCEPTION_ACTIVE = 0x08,
+	DRM_PANFROST_EXCEPTION_MAX_NON_FAULT = 0x3f,
 	DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT = 0x40,
 	DRM_PANFROST_EXCEPTION_JOB_POWER_FAULT = 0x41,
 	DRM_PANFROST_EXCEPTION_JOB_READ_FAULT = 0x42,
@@ -244,6 +245,12 @@ enum drm_panfrost_exception_type {
 	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_3 = 0xef,
 };
 
+static inline bool
+panfrost_exception_is_fault(u32 exception_code)
+{
+	return exception_code > DRM_PANFROST_EXCEPTION_MAX_NON_FAULT;
+}
+
 const char *panfrost_exception_name(u32 exception_code);
 bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 				    u32 exception_code);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index cf5f9e8b2a27..8a0db9571bfd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -483,14 +483,21 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 
 		if (status & JOB_INT_MASK_ERR(j)) {
 			u32 js_status = job_read(pfdev, JS_STATUS(j));
+			const char *exception_name = panfrost_exception_name(js_status);
 
 			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
 
-			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
-				j,
-				panfrost_exception_name(js_status),
-				job_read(pfdev, JS_HEAD_LO(j)),
-				job_read(pfdev, JS_TAIL_LO(j)));
+			if (!panfrost_exception_is_fault(js_status)) {
+				dev_dbg(pfdev->dev, "js interrupt, js=%d, status=%s, head=0x%x, tail=0x%x",
+					j, exception_name,
+					job_read(pfdev, JS_HEAD_LO(j)),
+					job_read(pfdev, JS_TAIL_LO(j)));
+			} else {
+				dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
+					j, exception_name,
+					job_read(pfdev, JS_HEAD_LO(j)),
+					job_read(pfdev, JS_TAIL_LO(j)));
+			}
 
 			/* If we need a reset, signal it to the timeout
 			 * handler, otherwise, update the fence error field and
@@ -499,7 +506,16 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 			if (panfrost_exception_needs_reset(pfdev, js_status)) {
 				drm_sched_fault(&pfdev->js->queue[j].sched);
 			} else {
-				dma_fence_set_error(pfdev->jobs[j]->done_fence, -EINVAL);
+				int error = 0;
+
+				if (js_status == DRM_PANFROST_EXCEPTION_TERMINATED)
+					error = -ECANCELED;
+				else if (panfrost_exception_is_fault(js_status))
+					error = -EINVAL;
+
+				if (error)
+					dma_fence_set_error(pfdev->jobs[j]->done_fence, error);
+
 				status |= JOB_INT_MASK_DONE(j);
 			}
 		}
@@ -665,10 +681,24 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
 
 void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
 {
+	struct panfrost_device *pfdev = panfrost_priv->pfdev;
 	int i;
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
 		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
+
+	/* Kill in-flight jobs */
+	spin_lock(&pfdev->js->job_lock);
+	for (i = 0; i < NUM_JOB_SLOTS; i++) {
+		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
+		struct panfrost_job *job = pfdev->jobs[i];
+
+		if (!job || job->base.entity != entity)
+			continue;
+
+		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
+	}
+	spin_unlock(&pfdev->js->job_lock);
 }
 
 int panfrost_job_is_idle(struct panfrost_device *pfdev)
-- 
2.31.1

