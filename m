Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BB8543DC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A2F10E498;
	Wed, 14 Feb 2024 08:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKlHVabR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A1A10E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898399; x=1739434399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=45PXmx9dOY1ZYAUNJw5Z87tPzv5CTxqc8jIqLI8TQpY=;
 b=GKlHVabRKicCKUdun+6CklU0R8Gw+TzvFo8DnR7ZDss5X78VmA6Drllb
 5iHx0EgYPuKQ8buBxMstDyRcRqhmwKW8R29YfcjITQ1Y1cXmjfPjXYstm
 AVKkE3+w4DfethgvHoYoRdXYEDanGOeSwQh64CKWiqQCYz3afFlzvAPFu
 Jmlx/vej57URHRFiG2347JKwSN8PLHnKLYHkfSk/wuOWkknRzS6oXS28H
 AKqgKhF5PxQYEa7n8FvY3soce1akAeZR926r9iZHahscmnL/hucBpzAKq
 w1QWOVUVSy3U+YNaL0zI+hBe8QkjrXI/uV9Gxb8CTRdofigkR1oQO+Ndz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651672"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407434"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:17 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>
Subject: [PATCH 7/8] accel/ivpu: Refactor BO creation functions
Date: Wed, 14 Feb 2024 09:13:04 +0100
Message-ID: <20240214081305.290108-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Rename BO allocate/create functions, so the code is more consistent.
There are now two matching buffer creation functions:
  - ivpu_bo_create_ioctl() - create a BO from user space
  - ivpu_bo_create() - create a BO from kernel space

ivpu_bo_alloc() is now only used to allocate struct ivpu_bo which better
matches its name.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c  | 39 ++++++++++---------
 drivers/accel/ivpu/ivpu_gem.c | 70 ++++++++++++++++++-----------------
 drivers/accel/ivpu/ivpu_gem.h |  6 ++-
 drivers/accel/ivpu/ivpu_ipc.c | 12 +++---
 drivers/accel/ivpu/ivpu_job.c |  4 +-
 5 files changed, 71 insertions(+), 60 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 304c95d0f25d..21c4082ea68c 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -249,6 +249,7 @@ static int ivpu_fw_update_global_range(struct ivpu_device *vdev)
 static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
+	struct ivpu_addr_range fw_range;
 	int log_verb_size;
 	int ret;
 
@@ -256,16 +257,19 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	if (ret)
 		return ret;
 
-	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size, DRM_IVPU_BO_WC);
+	fw_range.start = fw->runtime_addr;
+	fw_range.end = fw->runtime_addr + fw->runtime_size;
+	fw->mem = ivpu_bo_create(vdev, &vdev->gctx, &fw_range, fw->runtime_size,
+				 DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
 	if (!fw->mem) {
-		ivpu_err(vdev, "Failed to allocate firmware runtime memory\n");
+		ivpu_err(vdev, "Failed to create firmware runtime memory buffer\n");
 		return -ENOMEM;
 	}
 
-	fw->mem_log_crit = ivpu_bo_alloc_internal(vdev, 0, IVPU_FW_CRITICAL_BUFFER_SIZE,
-						  DRM_IVPU_BO_CACHED);
+	fw->mem_log_crit = ivpu_bo_create_global(vdev, IVPU_FW_CRITICAL_BUFFER_SIZE,
+						 DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
 	if (!fw->mem_log_crit) {
-		ivpu_err(vdev, "Failed to allocate critical log buffer\n");
+		ivpu_err(vdev, "Failed to create critical log buffer\n");
 		ret = -ENOMEM;
 		goto err_free_fw_mem;
 	}
@@ -275,18 +279,19 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	else
 		log_verb_size = IVPU_FW_VERBOSE_BUFFER_SMALL_SIZE;
 
-	fw->mem_log_verb = ivpu_bo_alloc_internal(vdev, 0, log_verb_size, DRM_IVPU_BO_CACHED);
+	fw->mem_log_verb = ivpu_bo_create_global(vdev, log_verb_size,
+						 DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
 	if (!fw->mem_log_verb) {
-		ivpu_err(vdev, "Failed to allocate verbose log buffer\n");
+		ivpu_err(vdev, "Failed to create verbose log buffer\n");
 		ret = -ENOMEM;
 		goto err_free_log_crit;
 	}
 
 	if (fw->shave_nn_size) {
-		fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.shave.start,
-							  fw->shave_nn_size, DRM_IVPU_BO_WC);
+		fw->mem_shave_nn = ivpu_bo_create(vdev, &vdev->gctx, &vdev->hw->ranges.shave,
+						  fw->shave_nn_size, DRM_IVPU_BO_WC);
 		if (!fw->mem_shave_nn) {
-			ivpu_err(vdev, "Failed to allocate shavenn buffer\n");
+			ivpu_err(vdev, "Failed to create shavenn buffer\n");
 			ret = -ENOMEM;
 			goto err_free_log_verb;
 		}
@@ -295,11 +300,11 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	return 0;
 
 err_free_log_verb:
-	ivpu_bo_free_internal(fw->mem_log_verb);
+	ivpu_bo_free(fw->mem_log_verb);
 err_free_log_crit:
-	ivpu_bo_free_internal(fw->mem_log_crit);
+	ivpu_bo_free(fw->mem_log_crit);
 err_free_fw_mem:
-	ivpu_bo_free_internal(fw->mem);
+	ivpu_bo_free(fw->mem);
 	return ret;
 }
 
@@ -308,13 +313,13 @@ static void ivpu_fw_mem_fini(struct ivpu_device *vdev)
 	struct ivpu_fw_info *fw = vdev->fw;
 
 	if (fw->mem_shave_nn) {
-		ivpu_bo_free_internal(fw->mem_shave_nn);
+		ivpu_bo_free(fw->mem_shave_nn);
 		fw->mem_shave_nn = NULL;
 	}
 
-	ivpu_bo_free_internal(fw->mem_log_verb);
-	ivpu_bo_free_internal(fw->mem_log_crit);
-	ivpu_bo_free_internal(fw->mem);
+	ivpu_bo_free(fw->mem_log_verb);
+	ivpu_bo_free(fw->mem_log_crit);
+	ivpu_bo_free(fw->mem);
 
 	fw->mem_log_verb = NULL;
 	fw->mem_log_crit = NULL;
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index e9ddbe9f50eb..1b409dbd332d 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -172,8 +172,7 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
 	return &bo->base.base;
 }
 
-static struct ivpu_bo *
-ivpu_bo_create(struct ivpu_device *vdev, u64 size, u32 flags)
+static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
 {
 	struct drm_gem_shmem_object *shmem;
 	struct ivpu_bo *bo;
@@ -201,7 +200,7 @@ ivpu_bo_create(struct ivpu_device *vdev, u64 size, u32 flags)
 	return bo;
 }
 
-static int ivpu_bo_open(struct drm_gem_object *obj, struct drm_file *file)
+static int ivpu_gem_bo_open(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct ivpu_file_priv *file_priv = file->driver_priv;
 	struct ivpu_device *vdev = file_priv->vdev;
@@ -224,7 +223,7 @@ static int ivpu_bo_open(struct drm_gem_object *obj, struct drm_file *file)
 	return ivpu_bo_alloc_vpu_addr(bo, &file_priv->ctx, range);
 }
 
-static void ivpu_bo_free(struct drm_gem_object *obj)
+static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 {
 	struct ivpu_device *vdev = to_ivpu_device(obj->dev);
 	struct ivpu_bo *bo = to_ivpu_bo(obj);
@@ -245,8 +244,8 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
 }
 
 static const struct drm_gem_object_funcs ivpu_gem_funcs = {
-	.free = ivpu_bo_free,
-	.open = ivpu_bo_open,
+	.free = ivpu_gem_bo_free,
+	.open = ivpu_gem_bo_open,
 	.print_info = drm_gem_shmem_object_print_info,
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
@@ -272,9 +271,9 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (size == 0)
 		return -EINVAL;
 
-	bo = ivpu_bo_create(vdev, size, args->flags);
+	bo = ivpu_bo_alloc(vdev, size, args->flags);
 	if (IS_ERR(bo)) {
-		ivpu_err(vdev, "Failed to create BO: %pe (ctx %u size %llu flags 0x%x)",
+		ivpu_err(vdev, "Failed to allocate BO: %pe (ctx %u size %llu flags 0x%x)",
 			 bo, file_priv->ctx.id, args->size, args->flags);
 		return PTR_ERR(bo);
 	}
@@ -289,33 +288,28 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 }
 
 struct ivpu_bo *
-ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 flags)
+ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+	       struct ivpu_addr_range *range, u64 size, u32 flags)
 {
-	const struct ivpu_addr_range *range;
-	struct ivpu_addr_range fixed_range;
 	struct iosys_map map;
 	struct ivpu_bo *bo;
 	int ret;
 
-	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(vpu_addr));
-	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(size));
+	if (drm_WARN_ON(&vdev->drm, !range))
+		return NULL;
 
-	if (vpu_addr) {
-		fixed_range.start = vpu_addr;
-		fixed_range.end = vpu_addr + size;
-		range = &fixed_range;
-	} else {
-		range = &vdev->hw->ranges.global;
-	}
+	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(range->start));
+	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(range->end));
+	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(size));
 
-	bo = ivpu_bo_create(vdev, size, flags);
+	bo = ivpu_bo_alloc(vdev, size, flags);
 	if (IS_ERR(bo)) {
-		ivpu_err(vdev, "Failed to create BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
-			 bo, vpu_addr, size, flags);
+		ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
+			 bo, range->start, size, flags);
 		return NULL;
 	}
 
-	ret = ivpu_bo_alloc_vpu_addr(bo, &vdev->gctx, range);
+	ret = ivpu_bo_alloc_vpu_addr(bo, ctx, range);
 	if (ret)
 		goto err_put;
 
@@ -323,11 +317,14 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 	if (ret)
 		goto err_put;
 
-	dma_resv_lock(bo->base.base.resv, NULL);
-	ret = drm_gem_shmem_vmap(&bo->base, &map);
-	dma_resv_unlock(bo->base.base.resv);
-	if (ret)
-		goto err_put;
+	if (flags & DRM_IVPU_BO_MAPPABLE) {
+		dma_resv_lock(bo->base.base.resv, NULL);
+		ret = drm_gem_shmem_vmap(&bo->base, &map);
+		dma_resv_unlock(bo->base.base.resv);
+
+		if (ret)
+			goto err_put;
+	}
 
 	return bo;
 
@@ -336,13 +333,20 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 	return NULL;
 }
 
-void ivpu_bo_free_internal(struct ivpu_bo *bo)
+struct ivpu_bo *ivpu_bo_create_global(struct ivpu_device *vdev, u64 size, u32 flags)
+{
+	return ivpu_bo_create(vdev, &vdev->gctx, &vdev->hw->ranges.global, size, flags);
+}
+
+void ivpu_bo_free(struct ivpu_bo *bo)
 {
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->base.vaddr);
 
-	dma_resv_lock(bo->base.base.resv, NULL);
-	drm_gem_shmem_vunmap(&bo->base, &map);
-	dma_resv_unlock(bo->base.base.resv);
+	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
+		dma_resv_lock(bo->base.base.resv, NULL);
+		drm_gem_shmem_vunmap(&bo->base, &map);
+		dma_resv_unlock(bo->base.base.resv);
+	}
 
 	drm_gem_object_put(&bo->base.base);
 }
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index a8559211c70d..fb7117c13eec 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -28,8 +28,10 @@ int ivpu_bo_pin(struct ivpu_bo *bo);
 void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
 
 struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
-struct ivpu_bo *ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 flags);
-void ivpu_bo_free_internal(struct ivpu_bo *bo);
+struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+			       struct ivpu_addr_range *range, u64 size, u32 flags);
+struct ivpu_bo *ivpu_bo_create_global(struct ivpu_device *vdev, u64 size, u32 flags);
+void ivpu_bo_free(struct ivpu_bo *bo);
 
 int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 int ivpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index fa66c39b57ec..04ac4b9840fb 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -58,8 +58,8 @@ static void ivpu_ipc_mem_fini(struct ivpu_device *vdev)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 
-	ivpu_bo_free_internal(ipc->mem_rx);
-	ivpu_bo_free_internal(ipc->mem_tx);
+	ivpu_bo_free(ipc->mem_rx);
+	ivpu_bo_free(ipc->mem_tx);
 }
 
 static int
@@ -471,13 +471,13 @@ int ivpu_ipc_init(struct ivpu_device *vdev)
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 	int ret;
 
-	ipc->mem_tx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
+	ipc->mem_tx = ivpu_bo_create_global(vdev, SZ_16K, DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
 	if (!ipc->mem_tx) {
 		ivpu_err(vdev, "Failed to allocate mem_tx\n");
 		return -ENOMEM;
 	}
 
-	ipc->mem_rx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
+	ipc->mem_rx = ivpu_bo_create_global(vdev, SZ_16K, DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
 	if (!ipc->mem_rx) {
 		ivpu_err(vdev, "Failed to allocate mem_rx\n");
 		ret = -ENOMEM;
@@ -506,9 +506,9 @@ int ivpu_ipc_init(struct ivpu_device *vdev)
 	return 0;
 
 err_free_rx:
-	ivpu_bo_free_internal(ipc->mem_rx);
+	ivpu_bo_free(ipc->mem_rx);
 err_free_tx:
-	ivpu_bo_free_internal(ipc->mem_tx);
+	ivpu_bo_free(ipc->mem_tx);
 	return ret;
 }
 
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index d01a1a5a272d..a9f2fe1bddea 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -46,7 +46,7 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 e
 		goto err_free_cmdq;
 	}
 
-	cmdq->mem = ivpu_bo_alloc_internal(vdev, 0, SZ_4K, DRM_IVPU_BO_WC);
+	cmdq->mem = ivpu_bo_create_global(vdev, SZ_4K, DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
 	if (!cmdq->mem)
 		goto err_erase_xa;
 
@@ -74,7 +74,7 @@ static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *c
 	if (!cmdq)
 		return;
 
-	ivpu_bo_free_internal(cmdq->mem);
+	ivpu_bo_free(cmdq->mem);
 	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
 	kfree(cmdq);
 }
-- 
2.43.0

