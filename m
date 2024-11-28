Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45769DBD36
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 22:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0B10ED64;
	Thu, 28 Nov 2024 21:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Xix8IP+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D49B10ED64
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 21:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732828370; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BFnJMAc6dha0H9dsImbz6qne9m7Qg5SaVW3jKFnFAVzLHJkpdNUoD7rIatxnViW97YRSismPVcRJRDQjz+g7x4uNuAQcaQOhLQlN+4xkUINZV1Rd9OC8qDKfKPoPe4i6BcmqJbeT3qNZvtQ+9ufM65HjgsOh9LIrZYOzHocbakI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732828370;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jw4U8uvyXiSmp/rvi6C6lOrR52smOsg1WBdXfy53UV4=; 
 b=a1TZbcGyjB3fyqweTSNoZWJJhTsPyBeSdfJUf12uXm0yUyPcQazG2GC8quIjQyuzS6giTzvcUHDuriTNZQDn0tCzzHfKY6IRsqByL3T5Zhd0YMFymcEs/dGLdodYb9OF58mFGUgUrURWPLmIfwCi3UrDhTZH0kzixNw3DKhZDlM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732828370; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jw4U8uvyXiSmp/rvi6C6lOrR52smOsg1WBdXfy53UV4=;
 b=Xix8IP+nRwPf6CJ6+88X0SowZ2Gxzzfi71SXSgP2YOoaShvzMEUQP3gi95XrCWfi
 bcI5Xp6mV+H2RhnM2oTyBZYLBovJ9yyNzYHd+Jrk3doZck+YqeC5OdXmMB4EaaVv4Px
 2x8OXmlHZZUeQCY3fC+i4aeFDy8Fiz43GMP4O1m4=
Received: by mx.zohomail.com with SMTPS id 1732828370435211.2544619738951;
 Thu, 28 Nov 2024 13:12:50 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] drm/panfrost: Make re-enabling job interrupts at
 device reset optional
Date: Thu, 28 Nov 2024 21:06:21 +0000
Message-ID: <20241128211223.1805830-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Rather than remasking interrupts after a device reset in the main reset
path, allow selecting whether to do this with an additional bool parameter.

To this end, split reenabling job interrupts into two functions, one that
clears the interrupts and another one which unmasks them conditionally.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 11 +++++--
 drivers/gpu/drm/panfrost/panfrost_device.h |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    | 34 ++++++++++++----------
 drivers/gpu/drm/panfrost/panfrost_job.h    |  3 +-
 4 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 4fe29286bbe3..7e5d39699982 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -395,20 +395,25 @@ bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 	return false;
 }
 
-void panfrost_device_reset(struct panfrost_device *pfdev)
+void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_job_int)
 {
+	u32 irq_mask;
+
 	panfrost_gpu_soft_reset(pfdev);
 
 	panfrost_gpu_power_on(pfdev);
 	panfrost_mmu_reset(pfdev);
-	panfrost_job_enable_interrupts(pfdev);
+
+	irq_mask = panfrost_job_reset_interrupts(pfdev);
+	if (enable_job_int)
+		panfrost_enable_interrupts(pfdev, irq_mask);
 }
 
 static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
-	panfrost_device_reset(pfdev);
+	panfrost_device_reset(pfdev, true);
 	panfrost_devfreq_resume(pfdev);
 
 	return 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index d9aea2c2cbe5..fc83d5e104a3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -205,7 +205,7 @@ int panfrost_unstable_ioctl_check(void);
 
 int panfrost_device_init(struct panfrost_device *pfdev);
 void panfrost_device_fini(struct panfrost_device *pfdev);
-void panfrost_device_reset(struct panfrost_device *pfdev);
+void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_job_int);
 
 extern const struct dev_pm_ops panfrost_pm_ops;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index fba1a376f593..79d2ee3625b2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -27,6 +27,10 @@
 #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
 #define job_read(dev, reg) readl(dev->iomem + (reg))
 
+#define JOB_INT_ENABLE_MASK			\
+	(GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |	\
+	 GENMASK(NUM_JOB_SLOTS - 1, 0))
+
 struct panfrost_queue_state {
 	struct drm_gpu_scheduler sched;
 	u64 fence_context;
@@ -421,18 +425,23 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 	return fence;
 }
 
-void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
+u32 panfrost_job_reset_interrupts(struct panfrost_device *pfdev)
 {
 	int j;
 	u32 irq_mask = 0;
 
-	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
-
 	for (j = 0; j < NUM_JOB_SLOTS; j++) {
 		irq_mask |= MK_JS_MASK(j);
 	}
 
 	job_write(pfdev, JOB_INT_CLEAR, irq_mask);
+
+	return irq_mask;
+}
+
+void panfrost_enable_interrupts(struct panfrost_device *pfdev, u32 irq_mask)
+{
+	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
 	job_write(pfdev, JOB_INT_MASK, irq_mask);
 }
 
@@ -725,12 +734,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 	spin_unlock(&pfdev->js->job_lock);
 
 	/* Proceed with reset now. */
-	panfrost_device_reset(pfdev);
-
-	/* panfrost_device_reset() unmasks job interrupts, but we want to
-	 * keep them masked a bit longer.
-	 */
-	job_write(pfdev, JOB_INT_MASK, 0);
+	panfrost_device_reset(pfdev, false);
 
 	/* GPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&pfdev->reset.pending, 0);
@@ -752,9 +756,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 		drm_sched_start(&pfdev->js->queue[i].sched, 0);
 
 	/* Re-enable job interrupts now that everything has been restarted. */
-	job_write(pfdev, JOB_INT_MASK,
-		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-		  GENMASK(NUM_JOB_SLOTS - 1, 0));
+	panfrost_enable_interrupts(pfdev, JOB_INT_ENABLE_MASK);
 
 	dma_fence_end_signalling(cookie);
 }
@@ -827,9 +829,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
 
 	/* Enable interrupts only if we're not about to get suspended */
 	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
-		job_write(pfdev, JOB_INT_MASK,
-			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-			  GENMASK(NUM_JOB_SLOTS - 1, 0));
+		job_write(pfdev, JOB_INT_MASK, JOB_INT_ENABLE_MASK);
 
 	return IRQ_HANDLED;
 }
@@ -854,6 +854,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 {
 	struct panfrost_job_slot *js;
 	unsigned int nentries = 2;
+	u32 irq_mask;
 	int ret, j;
 
 	/* All GPUs have two entries per queue, but without jobchain
@@ -905,7 +906,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		}
 	}
 
-	panfrost_job_enable_interrupts(pfdev);
+	irq_mask = panfrost_job_reset_interrupts(pfdev);
+	panfrost_enable_interrupts(pfdev, irq_mask);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index ec581b97852b..c09d42ee5039 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -46,7 +46,8 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
 int panfrost_job_get_slot(struct panfrost_job *job);
 int panfrost_job_push(struct panfrost_job *job);
 void panfrost_job_put(struct panfrost_job *job);
-void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
+u32 panfrost_job_reset_interrupts(struct panfrost_device *pfdev);
+void panfrost_enable_interrupts(struct panfrost_device *pfdev, u32 irq_mask);
 void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
 int panfrost_job_is_idle(struct panfrost_device *pfdev);
 
-- 
2.47.0

