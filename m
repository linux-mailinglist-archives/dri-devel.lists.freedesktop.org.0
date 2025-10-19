Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B002BEE7B8
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8240D10E211;
	Sun, 19 Oct 2025 14:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jpaP5jgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C3410E210
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760885602; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TFkyn8fkVmaZ12Rypc57wzhH0lWeyTNHyKYPFljYghzQ7QNJBc84cRl0vleUn9UA+GpF5VWUi4lSwpjN4dcWbcgBqlFtQUWU/z8WTlEGo5X8bxL8f6HZhSHFrzry5yNsoOTGwEhTG7a1KLE5RfKlaxzpX3D1aqxrCjb97ibDqrw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760885602;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PVhvKwUnJ2AgUeH2hJPEyVk3NmMQu9bxmT+hc1ATx6o=; 
 b=cVBgtxCqyD08BivVAmsR7lKGmw4C2L8E3gw4lvGa/1dwQgjCV4NcXVZStp7CtSEk/iRWmmoKJHyVl7JRwL31QZeF2Tnhxg6dv02Q2KGlQQKgehycIh8RTa+g0skoWhyWs/CtgcqqpXaBbJ1A7IJnqqgNwCUpfmULOH22x+b/+KU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760885602; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PVhvKwUnJ2AgUeH2hJPEyVk3NmMQu9bxmT+hc1ATx6o=;
 b=jpaP5jgM3kXveq7c+EnCeMZEhLZwCUhohUSBj5ADyOwwe6N/aiBmc6JkwglfQQYl
 ny8YxIp0iAJnQ+4v16m2CQ/dtRj85tD17LWxXlLKnfRmzk+bTlAYeQynYHde38sUtG+
 MVxR/8t1muCh9qvt6nnGe0uc3Q/uSBq+FcpcuPEY=
Received: by mx.zohomail.com with SMTPS id 1760885600645673.1325287663534;
 Sun, 19 Oct 2025 07:53:20 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v7 11/12] drm/panfrost: Rename panfrost_job functions to
 reflect real role
Date: Sun, 19 Oct 2025 15:52:16 +0100
Message-ID: <20251019145225.3621989-12-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
References: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
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

panfrost_job_* prefixed functions in panfrost_job.c deal with both
panfrost_job objects and also the more general JM (Job Manager) side of
the device itself. This is confusing.

Reprefix functions that program the JM to panfrosot_jm_* instead.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 14 +++----
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  4 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    | 48 +++++++++++-----------
 drivers/gpu/drm/panfrost/panfrost_job.h    | 16 ++++----
 4 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index f1d811a6de6c..c61b97af120c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -259,7 +259,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err)
 		goto out_gpu;
 
-	err = panfrost_job_init(pfdev);
+	err = panfrost_jm_init(pfdev);
 	if (err)
 		goto out_mmu;
 
@@ -269,7 +269,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	return 0;
 out_job:
-	panfrost_job_fini(pfdev);
+	panfrost_jm_fini(pfdev);
 out_mmu:
 	panfrost_mmu_fini(pfdev);
 out_gpu:
@@ -290,7 +290,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
 	panfrost_perfcnt_fini(pfdev);
-	panfrost_job_fini(pfdev);
+	panfrost_jm_fini(pfdev);
 	panfrost_mmu_fini(pfdev);
 	panfrost_gpu_fini(pfdev);
 	panfrost_devfreq_fini(pfdev);
@@ -407,9 +407,9 @@ void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_job_int)
 	panfrost_gpu_power_on(pfdev);
 	panfrost_mmu_reset(pfdev);
 
-	panfrost_job_reset_interrupts(pfdev);
+	panfrost_jm_reset_interrupts(pfdev);
 	if (enable_job_int)
-		panfrost_job_enable_interrupts(pfdev);
+		panfrost_jm_enable_interrupts(pfdev);
 }
 
 static int panfrost_device_runtime_resume(struct device *dev)
@@ -451,11 +451,11 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
-	if (!panfrost_job_is_idle(pfdev))
+	if (!panfrost_jm_is_idle(pfdev))
 		return -EBUSY;
 
 	panfrost_devfreq_suspend(pfdev);
-	panfrost_job_suspend_irq(pfdev);
+	panfrost_jm_suspend_irq(pfdev);
 	panfrost_mmu_suspend_irq(pfdev);
 	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 200c04d2fc55..1c3c574cd64a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -606,7 +606,7 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
 		goto err_free;
 	}
 
-	ret = panfrost_job_open(file);
+	ret = panfrost_jm_open(file);
 	if (ret)
 		goto err_job;
 
@@ -625,7 +625,7 @@ panfrost_postclose(struct drm_device *dev, struct drm_file *file)
 	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
 
 	panfrost_perfcnt_close(file);
-	panfrost_job_close(file);
+	panfrost_jm_close(file);
 
 	panfrost_mmu_ctx_put(panfrost_priv->mmu);
 	kfree(panfrost_priv);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 39e919420aaf..11894a6b9fcc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -430,18 +430,18 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 	return fence;
 }
 
-void panfrost_job_reset_interrupts(struct panfrost_device *pfdev)
+void panfrost_jm_reset_interrupts(struct panfrost_device *pfdev)
 {
 	job_write(pfdev, JOB_INT_CLEAR, ALL_JS_INT_MASK);
 }
 
-void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
+void panfrost_jm_enable_interrupts(struct panfrost_device *pfdev)
 {
 	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
 	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
 }
 
-void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
+void panfrost_jm_suspend_irq(struct panfrost_device *pfdev)
 {
 	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
 
@@ -503,8 +503,8 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 	}
 }
 
-static void panfrost_job_handle_done(struct panfrost_device *pfdev,
-				     struct panfrost_job *job)
+static void panfrost_jm_handle_done(struct panfrost_device *pfdev,
+				    struct panfrost_job *job)
 {
 	/* Set ->jc to 0 to avoid re-submitting an already finished job (can
 	 * happen when we receive the DONE interrupt while doing a GPU reset).
@@ -517,7 +517,7 @@ static void panfrost_job_handle_done(struct panfrost_device *pfdev,
 	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
-static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
+static void panfrost_jm_handle_irq(struct panfrost_device *pfdev, u32 status)
 {
 	struct panfrost_job *done[NUM_JOB_SLOTS][2] = {};
 	struct panfrost_job *failed[NUM_JOB_SLOTS] = {};
@@ -592,7 +592,7 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 		}
 
 		for (i = 0; i < ARRAY_SIZE(done[0]) && done[j][i]; i++)
-			panfrost_job_handle_done(pfdev, done[j][i]);
+			panfrost_jm_handle_done(pfdev, done[j][i]);
 	}
 
 	/* And finally we requeue jobs that were waiting in the second slot
@@ -610,7 +610,7 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 			struct panfrost_job *canceled = panfrost_dequeue_job(pfdev, j);
 
 			dma_fence_set_error(canceled->done_fence, -ECANCELED);
-			panfrost_job_handle_done(pfdev, canceled);
+			panfrost_jm_handle_done(pfdev, canceled);
 		} else if (!atomic_read(&pfdev->reset.pending)) {
 			/* Requeue the job we removed if no reset is pending */
 			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_START);
@@ -618,7 +618,7 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
 	}
 }
 
-static void panfrost_job_handle_irqs(struct panfrost_device *pfdev)
+static void panfrost_jm_handle_irqs(struct panfrost_device *pfdev)
 {
 	u32 status = job_read(pfdev, JOB_INT_RAWSTAT);
 
@@ -626,7 +626,7 @@ static void panfrost_job_handle_irqs(struct panfrost_device *pfdev)
 		pm_runtime_mark_last_busy(pfdev->base.dev);
 
 		spin_lock(&pfdev->js->job_lock);
-		panfrost_job_handle_irq(pfdev, status);
+		panfrost_jm_handle_irq(pfdev, status);
 		spin_unlock(&pfdev->js->job_lock);
 		status = job_read(pfdev, JOB_INT_RAWSTAT);
 	}
@@ -707,7 +707,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 		dev_err(pfdev->base.dev, "Soft-stop failed\n");
 
 	/* Handle the remaining interrupts before we reset. */
-	panfrost_job_handle_irqs(pfdev);
+	panfrost_jm_handle_irqs(pfdev);
 
 	/* Remaining interrupts have been handled, but we might still have
 	 * stuck jobs. Let's make sure the PM counters stay balanced by
@@ -752,7 +752,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 		drm_sched_start(&pfdev->js->queue[i].sched, 0);
 
 	/* Re-enable job interrupts now that everything has been restarted. */
-	panfrost_job_enable_interrupts(pfdev);
+	panfrost_jm_enable_interrupts(pfdev);
 
 	dma_fence_end_signalling(cookie);
 }
@@ -817,11 +817,11 @@ static const struct drm_sched_backend_ops panfrost_sched_ops = {
 	.free_job = panfrost_job_free
 };
 
-static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
+static irqreturn_t panfrost_jm_irq_handler_thread(int irq, void *data)
 {
 	struct panfrost_device *pfdev = data;
 
-	panfrost_job_handle_irqs(pfdev);
+	panfrost_jm_handle_irqs(pfdev);
 
 	/* Enable interrupts only if we're not about to get suspended */
 	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
@@ -830,7 +830,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
+static irqreturn_t panfrost_jm_irq_handler(int irq, void *data)
 {
 	struct panfrost_device *pfdev = data;
 	u32 status;
@@ -846,7 +846,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 	return IRQ_WAKE_THREAD;
 }
 
-int panfrost_job_init(struct panfrost_device *pfdev)
+int panfrost_jm_init(struct panfrost_device *pfdev)
 {
 	struct drm_sched_init_args args = {
 		.ops = &panfrost_sched_ops,
@@ -880,8 +880,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		return js->irq;
 
 	ret = devm_request_threaded_irq(pfdev->base.dev, js->irq,
-					panfrost_job_irq_handler,
-					panfrost_job_irq_handler_thread,
+					panfrost_jm_irq_handler,
+					panfrost_jm_irq_handler_thread,
 					IRQF_SHARED, KBUILD_MODNAME "-job",
 					pfdev);
 	if (ret) {
@@ -905,8 +905,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		}
 	}
 
-	panfrost_job_reset_interrupts(pfdev);
-	panfrost_job_enable_interrupts(pfdev);
+	panfrost_jm_reset_interrupts(pfdev);
+	panfrost_jm_enable_interrupts(pfdev);
 
 	return 0;
 
@@ -918,7 +918,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	return ret;
 }
 
-void panfrost_job_fini(struct panfrost_device *pfdev)
+void panfrost_jm_fini(struct panfrost_device *pfdev)
 {
 	struct panfrost_job_slot *js = pfdev->js;
 	int j;
@@ -933,7 +933,7 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
 	destroy_workqueue(pfdev->reset.wq);
 }
 
-int panfrost_job_open(struct drm_file *file)
+int panfrost_jm_open(struct drm_file *file)
 {
 	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
 	int ret;
@@ -955,7 +955,7 @@ int panfrost_job_open(struct drm_file *file)
 	return 0;
 }
 
-void panfrost_job_close(struct drm_file *file)
+void panfrost_jm_close(struct drm_file *file)
 {
 	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
 	struct panfrost_jm_ctx *jm_ctx;
@@ -967,7 +967,7 @@ void panfrost_job_close(struct drm_file *file)
 	xa_destroy(&panfrost_priv->jm_ctxs);
 }
 
-int panfrost_job_is_idle(struct panfrost_device *pfdev)
+int panfrost_jm_is_idle(struct panfrost_device *pfdev)
 {
 	struct panfrost_job_slot *js = pfdev->js;
 	int i;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index f6d9960740ae..c3f57e41a571 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -62,16 +62,16 @@ void panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_ctx);
 struct panfrost_jm_ctx *panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_ctx);
 struct panfrost_jm_ctx *panfrost_jm_ctx_from_handle(struct drm_file *file, u32 handle);
 
-int panfrost_job_init(struct panfrost_device *pfdev);
-void panfrost_job_fini(struct panfrost_device *pfdev);
-int panfrost_job_open(struct drm_file *file);
-void panfrost_job_close(struct drm_file *file);
+int panfrost_jm_init(struct panfrost_device *pfdev);
+void panfrost_jm_fini(struct panfrost_device *pfdev);
+int panfrost_jm_open(struct drm_file *file);
+void panfrost_jm_close(struct drm_file *file);
+void panfrost_jm_reset_interrupts(struct panfrost_device *pfdev);
+void panfrost_jm_enable_interrupts(struct panfrost_device *pfdev);
+void panfrost_jm_suspend_irq(struct panfrost_device *pfdev);
+int panfrost_jm_is_idle(struct panfrost_device *pfdev);
 int panfrost_job_get_slot(struct panfrost_job *job);
 int panfrost_job_push(struct panfrost_job *job);
 void panfrost_job_put(struct panfrost_job *job);
-void panfrost_job_reset_interrupts(struct panfrost_device *pfdev);
-void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
-void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
-int panfrost_job_is_idle(struct panfrost_device *pfdev);
 
 #endif
-- 
2.51.0

