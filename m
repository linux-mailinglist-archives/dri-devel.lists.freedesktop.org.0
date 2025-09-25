Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6EBA013E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F1010E959;
	Thu, 25 Sep 2025 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWTia1rL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7740B10E958
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758811971; x=1790347971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EvIlYEX6E7nnjqJwh60ywOw+YQQtUtxVIhkirURPRgI=;
 b=WWTia1rLAtQFDn4hy6Bi9rTNXFvCdbdQvSQ+oC7oD6zEM6YE65qAPXel
 t+R1Y/eaySTxa722QqQR0hGXpdzUp/kJxu8wfaI0Imk4rIjl8aMe5fXe/
 g+F1wX4LBOPRFkHPC0VcrzqmVhnUUaIWCAgkQ/Ysjr8pykWVBbCPJb+ZI
 9AjumsUO/LWnLWAfP6y1Y9sSjcfiORlJ9VEWMZIfEo4g+3IcrbgypMHgz
 iEk2SQQvZQLSlHTV6EGr2xgsIfjaJcQpqQ+IYHNuaajN8APAp2xgwbWwz
 MlSDcRNlFKEzTU8dAaPt/Yxq1f9wm7Gre45ETxL5XFOr7P5idnszjS888 A==;
X-CSE-ConnectionGUID: QVPHB6ZjT6+K8GT3DJB7FQ==
X-CSE-MsgGUID: 9PHCUT65TgqZiKKHv2UM9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71816207"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="71816207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:52:50 -0700
X-CSE-ConnectionGUID: g7/XxzQqRF6NTkcxzsWjQw==
X-CSE-MsgGUID: Io3TWYjOR/e8lwO2okwu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176926417"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:52:48 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Rework bind/unbind of imported buffers
Date: Thu, 25 Sep 2025 16:50:59 +0200
Message-ID: <20250925145059.1446243-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Ensure that imported buffers are properly mapped and unmapped in
the same way as regular buffers to properly handle buffers during
device's bind and unbind operations to prevent resource leaks and
inconsistent buffer states.

Imported buffers are now dma_mapped before submission and
dma_unmapped in ivpu_bo_unbind(), guaranteeing they are unmapped
when the device is unbound.

Add also imported buffers to vdev->bo_list for consistent unmapping
on device unbind. The bo->ctx_id is set in open() so imported
buffers have a valid context ID.

Debug logs have been updated to match the new code structure.
The function ivpu_bo_pin() has been renamed to ivpu_bo_bind()
to better reflect its purpose, and unbind tests have been refactored
for improved coverage and clarity.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 90 ++++++++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_gem.h |  2 +-
 drivers/accel/ivpu/ivpu_job.c |  2 +-
 3 files changed, 60 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index cceb07232e12..0cb48aff396c 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -28,8 +28,8 @@ static const struct drm_gem_object_funcs ivpu_gem_funcs;
 static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, const char *action)
 {
 	ivpu_dbg(vdev, BO,
-		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
-		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx_id,
+		 "%6s: bo %8p size %9zu ctx %d vpu_addr %9llx pages %d sgt %d mmu_mapped %d wc %d imported %d\n",
+		 action, bo, ivpu_bo_size(bo), bo->ctx_id, bo->vpu_addr,
 		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
 		 (bool)drm_gem_is_imported(&bo->base.base));
 }
@@ -44,22 +44,46 @@ static inline void ivpu_bo_unlock(struct ivpu_bo *bo)
 	dma_resv_unlock(bo->base.base.resv);
 }
 
+static struct sg_table *ivpu_bo_map_attachment(struct ivpu_device *vdev, struct ivpu_bo *bo)
+{
+	struct sg_table *sgt = bo->base.sgt;
+
+	drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach);
+
+	ivpu_bo_lock(bo);
+
+	if (!sgt) {
+		sgt = dma_buf_map_attachment(bo->base.base.import_attach, DMA_BIDIRECTIONAL);
+		if (IS_ERR(sgt))
+			ivpu_err(vdev, "Failed to map BO in IOMMU: %ld\n", PTR_ERR(sgt));
+		else
+			bo->base.sgt = sgt;
+	}
+
+	ivpu_bo_unlock(bo);
+
+	return sgt;
+}
+
 /*
- * ivpu_bo_pin() - pin the backing physical pages and map them to VPU.
+ * ivpu_bo_bind() - pin the backing physical pages and map them to VPU.
  *
  * This function pins physical memory pages, then maps the physical pages
  * to IOMMU address space and finally updates the VPU MMU page tables
  * to allow the VPU to translate VPU address to IOMMU address.
  */
-int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
+int __must_check ivpu_bo_bind(struct ivpu_bo *bo)
 {
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 	struct sg_table *sgt;
 	int ret = 0;
 
-	ivpu_dbg_bo(vdev, bo, "pin");
+	ivpu_dbg_bo(vdev, bo, "bind");
 
-	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+	if (bo->base.base.import_attach)
+		sgt = ivpu_bo_map_attachment(vdev, bo);
+	else
+		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
@@ -100,7 +124,9 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 	ret = ivpu_mmu_context_insert_node(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
 	if (!ret) {
 		bo->ctx = ctx;
+		bo->ctx_id = ctx->id;
 		bo->vpu_addr = bo->mm_node.start;
+		ivpu_dbg_bo(vdev, bo, "vaddr");
 	} else {
 		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
 	}
@@ -116,7 +142,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 {
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 
-	lockdep_assert(dma_resv_held(bo->base.base.resv) || !kref_read(&bo->base.base.refcount));
+	dma_resv_assert_held(bo->base.base.resv);
 
 	if (bo->mmu_mapped) {
 		drm_WARN_ON(&vdev->drm, !bo->ctx);
@@ -135,9 +161,14 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 		return;
 
 	if (bo->base.sgt) {
-		dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
-		sg_free_table(bo->base.sgt);
-		kfree(bo->base.sgt);
+		if (bo->base.base.import_attach) {
+			dma_buf_unmap_attachment(bo->base.base.import_attach,
+						 bo->base.sgt, DMA_BIDIRECTIONAL);
+		} else {
+			dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
+			sg_free_table(bo->base.sgt);
+			kfree(bo->base.sgt);
+		}
 		bo->base.sgt = NULL;
 	}
 }
@@ -163,6 +194,7 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
 
 struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size)
 {
+	struct ivpu_device *vdev = to_ivpu_device(dev);
 	struct ivpu_bo *bo;
 
 	if (size == 0 || !PAGE_ALIGNED(size))
@@ -177,6 +209,11 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
 
 	INIT_LIST_HEAD(&bo->bo_list_node);
 
+	mutex_lock(&vdev->bo_list_lock);
+	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
+	mutex_unlock(&vdev->bo_list_lock);
+
+	ivpu_dbg(vdev, BO, " alloc: bo %8p size %9zu\n", bo, size);
 	return &bo->base.base;
 }
 
@@ -185,7 +222,6 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 {
 	struct device *attach_dev = dev->dev;
 	struct dma_buf_attachment *attach;
-	struct sg_table *sgt;
 	struct drm_gem_object *obj;
 	int ret;
 
@@ -195,16 +231,10 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 
 	get_dma_buf(dma_buf);
 
-	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
-	if (IS_ERR(sgt)) {
-		ret = PTR_ERR(sgt);
-		goto fail_detach;
-	}
-
-	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, NULL);
 	if (IS_ERR(obj)) {
 		ret = PTR_ERR(obj);
-		goto fail_unmap;
+		goto fail_detach;
 	}
 
 	obj->import_attach = attach;
@@ -212,8 +242,6 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 
 	return obj;
 
-fail_unmap:
-	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
 	dma_buf_put(dma_buf);
@@ -221,7 +249,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, u32 ctx_id)
+static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
 {
 	struct drm_gem_shmem_object *shmem;
 	struct ivpu_bo *bo;
@@ -239,16 +267,9 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
 		return ERR_CAST(shmem);
 
 	bo = to_ivpu_bo(&shmem->base);
-	bo->ctx_id = ctx_id;
 	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
 	bo->flags = flags;
 
-	mutex_lock(&vdev->bo_list_lock);
-	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
-	mutex_unlock(&vdev->bo_list_lock);
-
-	ivpu_dbg_bo(vdev, bo, "alloc");
-
 	return bo;
 }
 
@@ -282,6 +303,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 
 	ivpu_dbg_bo(vdev, bo, "free");
 
+	drm_WARN_ON(&vdev->drm, list_empty(&bo->bo_list_node));
+
 	mutex_lock(&vdev->bo_list_lock);
 	list_del(&bo->bo_list_node);
 	mutex_unlock(&vdev->bo_list_lock);
@@ -291,7 +314,10 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
 	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
 
+	ivpu_bo_lock(bo);
 	ivpu_bo_unbind_locked(bo);
+	ivpu_bo_unlock(bo);
+
 	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
 	drm_WARN_ON(&vdev->drm, bo->ctx);
 
@@ -327,7 +353,7 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (size == 0)
 		return -EINVAL;
 
-	bo = ivpu_bo_alloc(vdev, size, args->flags, file_priv->ctx.id);
+	bo = ivpu_bo_alloc(vdev, size, args->flags);
 	if (IS_ERR(bo)) {
 		ivpu_err(vdev, "Failed to allocate BO: %pe (ctx %u size %llu flags 0x%x)",
 			 bo, file_priv->ctx.id, args->size, args->flags);
@@ -361,7 +387,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(range->end));
 	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(size));
 
-	bo = ivpu_bo_alloc(vdev, size, flags, IVPU_GLOBAL_CONTEXT_MMU_SSID);
+	bo = ivpu_bo_alloc(vdev, size, flags);
 	if (IS_ERR(bo)) {
 		ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
 			 bo, range->start, size, flags);
@@ -372,7 +398,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	if (ret)
 		goto err_put;
 
-	ret = ivpu_bo_pin(bo);
+	ret = ivpu_bo_bind(bo);
 	if (ret)
 		goto err_put;
 
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 3a208f3bf0a6..54452eb8a41f 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -24,7 +24,7 @@ struct ivpu_bo {
 	bool mmu_mapped;
 };
 
-int ivpu_bo_pin(struct ivpu_bo *bo);
+int ivpu_bo_bind(struct ivpu_bo *bo);
 void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
 
 struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 044268d0fc87..17273c68f84c 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -751,7 +751,7 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 
 		job->bos[i] = to_ivpu_bo(obj);
 
-		ret = ivpu_bo_pin(job->bos[i]);
+		ret = ivpu_bo_bind(job->bos[i]);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0

