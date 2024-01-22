Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B218362CF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 13:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF1D10EE2B;
	Mon, 22 Jan 2024 12:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81510EE2B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705925390; x=1737461390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XihlgDP/PsLzlJrUR/OsyS9f6fwNTX1Kx7rcmDstMAY=;
 b=TXFGL7VkdEBDpQWTOecqcYe207UgBKRQxX9dkH+iH3PL63fZ26ep3Kn8
 IAa9tp4eJF4/5j+pZw46SP2DxGpX19Q1gt7SabKrt3YOZ0d9G7zRQabyw
 s0fqDMmIpMimJSpS3WLCqq1V6Wi/YnT2G/DfVfrp5/QQJBjOf8SYy+GwG
 n1M/Q5TiP67uGIUyfMn4Cv/hg3zyo6I1b/pjribeRiWmIMPBxwV/cBlR5
 9cwo3+XmeRaRevQ7VlOYBxxuYpG7cjBBC+9CgRPSuQrVSnBZpHe8fX856
 pcKjZ5yf3yUp/FioORPU+2T/RyCjeR9c60XyAEKrWIxXItkLTO/hMJurl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432353272"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="432353272"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904834020"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="904834020"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:48 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] accel/ivpu: Fix dev open/close races with unbind
Date: Mon, 22 Jan 2024 13:09:43 +0100
Message-ID: <20240122120945.1150728-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  - Add context_list_lock to synchronize user context addition/removal
  - Use drm_dev_enter() to prevent unbinding the device during ivpu_open()
    and vpu address allocation

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 110 +++++++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_drv.h |   3 +-
 drivers/accel/ivpu/ivpu_gem.c |  18 +++---
 drivers/accel/ivpu/ivpu_gem.h |   2 +-
 drivers/accel/ivpu/ivpu_job.c |  16 ++---
 drivers/accel/ivpu/ivpu_job.h |   2 +-
 6 files changed, 86 insertions(+), 65 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 546c0899bb9e..551f4b8fd3a9 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -6,6 +6,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_accel.h>
 #include <drm/drm_file.h>
@@ -66,22 +67,20 @@ struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv)
 	return file_priv;
 }
 
-struct ivpu_file_priv *ivpu_file_priv_get_by_ctx_id(struct ivpu_device *vdev, unsigned long id)
+static void file_priv_unbind(struct ivpu_device *vdev, struct ivpu_file_priv *file_priv)
 {
-	struct ivpu_file_priv *file_priv;
-
-	xa_lock_irq(&vdev->context_xa);
-	file_priv = xa_load(&vdev->context_xa, id);
-	/* file_priv may still be in context_xa during file_priv_release() */
-	if (file_priv && !kref_get_unless_zero(&file_priv->ref))
-		file_priv = NULL;
-	xa_unlock_irq(&vdev->context_xa);
-
-	if (file_priv)
-		ivpu_dbg(vdev, KREF, "file_priv get by id: ctx %u refcount %u\n",
-			 file_priv->ctx.id, kref_read(&file_priv->ref));
-
-	return file_priv;
+	mutex_lock(&file_priv->lock);
+	if (file_priv->bound) {
+		ivpu_dbg(vdev, FILE, "file_priv unbind: ctx %u\n", file_priv->ctx.id);
+
+		ivpu_cmdq_release_all_locked(file_priv);
+		ivpu_jsm_context_release(vdev, file_priv->ctx.id);
+		ivpu_bo_unbind_all_bos_from_context(vdev, &file_priv->ctx);
+		ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
+		file_priv->bound = false;
+		drm_WARN_ON(&vdev->drm, !xa_erase_irq(&vdev->context_xa, file_priv->ctx.id));
+	}
+	mutex_unlock(&file_priv->lock);
 }
 
 static void file_priv_release(struct kref *ref)
@@ -89,13 +88,15 @@ static void file_priv_release(struct kref *ref)
 	struct ivpu_file_priv *file_priv = container_of(ref, struct ivpu_file_priv, ref);
 	struct ivpu_device *vdev = file_priv->vdev;
 
-	ivpu_dbg(vdev, FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
+	ivpu_dbg(vdev, FILE, "file_priv release: ctx %u bound %d\n",
+		 file_priv->ctx.id, (bool)file_priv->bound);
+
+	pm_runtime_get_sync(vdev->drm.dev);
+	mutex_lock(&vdev->context_list_lock);
+	file_priv_unbind(vdev, file_priv);
+	mutex_unlock(&vdev->context_list_lock);
+	pm_runtime_put_autosuspend(vdev->drm.dev);
 
-	ivpu_cmdq_release_all(file_priv);
-	ivpu_jsm_context_release(vdev, file_priv->ctx.id);
-	ivpu_bo_remove_all_bos_from_context(vdev, &file_priv->ctx);
-	ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
-	drm_WARN_ON(&vdev->drm, xa_erase_irq(&vdev->context_xa, file_priv->ctx.id) != file_priv);
 	mutex_destroy(&file_priv->lock);
 	kfree(file_priv);
 }
@@ -232,49 +233,54 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 	struct ivpu_device *vdev = to_ivpu_device(dev);
 	struct ivpu_file_priv *file_priv;
 	u32 ctx_id;
-	void *old;
-	int ret;
+	int idx, ret;
 
-	ret = xa_alloc_irq(&vdev->context_xa, &ctx_id, NULL, vdev->context_xa_limit, GFP_KERNEL);
-	if (ret) {
-		ivpu_err(vdev, "Failed to allocate context id: %d\n", ret);
-		return ret;
-	}
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
 
 	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
 	if (!file_priv) {
+		ivpu_err(vdev, "Failed to allocate file_priv\n");
 		ret = -ENOMEM;
-		goto err_xa_erase;
+		goto err_dev_exit;
 	}
 
 	file_priv->vdev = vdev;
+	file_priv->bound = true;
 	kref_init(&file_priv->ref);
 	mutex_init(&file_priv->lock);
 
+	mutex_lock(&vdev->context_list_lock);
+
+	ret = xa_alloc_irq(&vdev->context_xa, &ctx_id, file_priv,
+			   vdev->context_xa_limit, GFP_KERNEL);
+	if (ret) {
+		ivpu_err(vdev, "Failed to allocate context id: %d\n", ret);
+		goto err_unlock;
+	}
+
 	ret = ivpu_mmu_user_context_init(vdev, &file_priv->ctx, ctx_id);
 	if (ret)
-		goto err_mutex_destroy;
+		goto err_xa_erase;
 
-	old = xa_store_irq(&vdev->context_xa, ctx_id, file_priv, GFP_KERNEL);
-	if (xa_is_err(old)) {
-		ret = xa_err(old);
-		ivpu_err(vdev, "Failed to store context %u: %d\n", ctx_id, ret);
-		goto err_ctx_fini;
-	}
+	mutex_unlock(&vdev->context_list_lock);
+	drm_dev_exit(idx);
+
+	file->driver_priv = file_priv;
 
 	ivpu_dbg(vdev, FILE, "file_priv create: ctx %u process %s pid %d\n",
 		 ctx_id, current->comm, task_pid_nr(current));
 
-	file->driver_priv = file_priv;
 	return 0;
 
-err_ctx_fini:
-	ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
-err_mutex_destroy:
-	mutex_destroy(&file_priv->lock);
-	kfree(file_priv);
 err_xa_erase:
 	xa_erase_irq(&vdev->context_xa, ctx_id);
+err_unlock:
+	mutex_unlock(&vdev->context_list_lock);
+	mutex_destroy(&file_priv->lock);
+	kfree(file_priv);
+err_dev_exit:
+	drm_dev_exit(idx);
 	return ret;
 }
 
@@ -531,6 +537,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
 	INIT_LIST_HEAD(&vdev->bo_list);
 
+	ret = drmm_mutex_init(&vdev->drm, &vdev->context_list_lock);
+	if (ret)
+		goto err_xa_destroy;
+
 	ret = drmm_mutex_init(&vdev->drm, &vdev->bo_list_lock);
 	if (ret)
 		goto err_xa_destroy;
@@ -602,14 +612,30 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	return ret;
 }
 
+static void ivpu_bo_unbind_all_user_contexts(struct ivpu_device *vdev)
+{
+	struct ivpu_file_priv *file_priv;
+	unsigned long ctx_id;
+
+	mutex_lock(&vdev->context_list_lock);
+
+	xa_for_each(&vdev->context_xa, ctx_id, file_priv)
+		file_priv_unbind(vdev, file_priv);
+
+	mutex_unlock(&vdev->context_list_lock);
+}
+
 static void ivpu_dev_fini(struct ivpu_device *vdev)
 {
 	ivpu_pm_disable(vdev);
 	ivpu_shutdown(vdev);
 	if (IVPU_WA(d3hot_after_power_off))
 		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
+
+	ivpu_jobs_abort_all(vdev);
 	ivpu_job_done_consumer_fini(vdev);
 	ivpu_pm_cancel_recovery(vdev);
+	ivpu_bo_unbind_all_user_contexts(vdev);
 
 	ivpu_ipc_fini(vdev);
 	ivpu_fw_fini(vdev);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 7a6bc1918780..069ace4adb2d 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -115,6 +115,7 @@ struct ivpu_device {
 
 	struct ivpu_mmu_context gctx;
 	struct ivpu_mmu_context rctx;
+	struct mutex context_list_lock; /* Protects user context addition/removal */
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
@@ -147,6 +148,7 @@ struct ivpu_file_priv {
 	struct ivpu_cmdq *cmdq[IVPU_NUM_ENGINES];
 	struct ivpu_mmu_context ctx;
 	bool has_mmu_faults;
+	bool bound;
 };
 
 extern int ivpu_dbg_mask;
@@ -162,7 +164,6 @@ extern bool ivpu_disable_mmu_cont_pages;
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
-struct ivpu_file_priv *ivpu_file_priv_get_by_ctx_id(struct ivpu_device *vdev, unsigned long id);
 void ivpu_file_priv_put(struct ivpu_file_priv **link);
 
 int ivpu_boot(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 16f3035b91c0..e9ddbe9f50eb 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -77,7 +77,10 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 		       const struct ivpu_addr_range *range)
 {
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
-	int ret;
+	int idx, ret;
+
+	if (!drm_dev_enter(&vdev->drm, &idx))
+		return -ENODEV;
 
 	mutex_lock(&bo->lock);
 
@@ -93,6 +96,8 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 
 	mutex_unlock(&bo->lock);
 
+	drm_dev_exit(idx);
+
 	return ret;
 }
 
@@ -128,14 +133,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 	dma_resv_unlock(bo->base.base.resv);
 }
 
-static void ivpu_bo_unbind(struct ivpu_bo *bo)
-{
-	mutex_lock(&bo->lock);
-	ivpu_bo_unbind_locked(bo);
-	mutex_unlock(&bo->lock);
-}
-
-void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
+void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
 {
 	struct ivpu_bo *bo;
 
@@ -239,7 +237,7 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
 
 	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
 
-	ivpu_bo_unbind(bo);
+	ivpu_bo_unbind_locked(bo);
 	mutex_destroy(&bo->lock);
 
 	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 5cb1dda3e58e..a8559211c70d 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -25,7 +25,7 @@ struct ivpu_bo {
 };
 
 int ivpu_bo_pin(struct ivpu_bo *bo);
-void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
+void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
 
 struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
 struct ivpu_bo *ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 flags);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 82e40bb4803c..4fed0c05e051 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -112,16 +112,14 @@ static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u16 engin
 	}
 }
 
-void ivpu_cmdq_release_all(struct ivpu_file_priv *file_priv)
+void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
 {
 	int i;
 
-	mutex_lock(&file_priv->lock);
+	lockdep_assert_held(&file_priv->lock);
 
 	for (i = 0; i < IVPU_NUM_ENGINES; i++)
 		ivpu_cmdq_release_locked(file_priv, i);
-
-	mutex_unlock(&file_priv->lock);
 }
 
 /*
@@ -161,15 +159,13 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev)
 	struct ivpu_file_priv *file_priv;
 	unsigned long ctx_id;
 
-	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
-		file_priv = ivpu_file_priv_get_by_ctx_id(vdev, ctx_id);
-		if (!file_priv)
-			continue;
+	mutex_lock(&vdev->context_list_lock);
 
+	xa_for_each(&vdev->context_xa, ctx_id, file_priv)
 		ivpu_cmdq_reset_all(file_priv);
 
-		ivpu_file_priv_put(&file_priv);
-	}
+	mutex_unlock(&vdev->context_list_lock);
+
 }
 
 static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index 45a2f2ec82e5..bd22cf8e39e7 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -56,7 +56,7 @@ struct ivpu_job {
 
 int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 
-void ivpu_cmdq_release_all(struct ivpu_file_priv *file_priv);
+void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv);
 void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev);
 
 void ivpu_job_done_consumer_init(struct ivpu_device *vdev);
-- 
2.43.0

