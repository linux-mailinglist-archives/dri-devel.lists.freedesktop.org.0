Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338437900EF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 18:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCCF10E80C;
	Fri,  1 Sep 2023 16:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECA510E80C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693586931; x=1725122931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9htJYgUVJKFQrvn7GU896UCIDPPgjj96ABPX8TS9gRE=;
 b=BbS6XeTzAzqb4VkA1vKT0pflVHkMr2o8CT5v3xEiPEn7OsLZ8K0xNgHv
 xEUb+PfBx7cFvc2U58Xv9BvdUFEGyOhn+P0frWbnVyRyCPUOSjQzZLRa/
 64IA2TEEWfSXqENQiPsMx13K0Oaw9NVwgWHGB2sz6+IuKVqh/p8U/CdGv
 JWXPp+Vapvqmz49Hlrr8Tz6M/tsiUi39zkI6q7lVrghJ+S2HWtZTiTXzl
 aV4A63VUrzswRiQBjDZllvPa/sJjCQj7MSWBKSQo4q9jMLr9ixrnQgl4Y
 dlPknLFJPvHuOaTsHovnf0npRmW2pTpC1jJwKTpz0Ob8toj1RdvpSmMJp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375164083"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="375164083"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769246399"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="769246399"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:48 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 1/4] accel/ivpu: Allocate vpu_addr in gem->open() callback
Date: Fri,  1 Sep 2023 18:48:39 +0200
Message-Id: <20230901164842.178654-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
References: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

gem->open() is called during handle creation for a gem object.
It is called during prime import and in BO_CREATE ioctl.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c         | 66 ++++++++++++---------------
 drivers/accel/ivpu/ivpu_gem.h         |  1 -
 drivers/accel/ivpu/ivpu_mmu_context.c |  2 +
 3 files changed, 32 insertions(+), 37 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index c91852f2edc8..d1077cf90b65 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -281,15 +281,6 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 	int ret;
 
-	if (!range) {
-		if (bo->flags & DRM_IVPU_BO_SHAVE_MEM)
-			range = &vdev->hw->ranges.shave;
-		else if (bo->flags & DRM_IVPU_BO_DMA_MEM)
-			range = &vdev->hw->ranges.dma;
-		else
-			range = &vdev->hw->ranges.user;
-	}
-
 	mutex_lock(&ctx->lock);
 	ret = ivpu_mmu_context_insert_node_locked(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
 	if (!ret) {
@@ -299,6 +290,9 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 	}
 	mutex_unlock(&ctx->lock);
 
+	if (ret)
+		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
+
 	return ret;
 }
 
@@ -337,9 +331,7 @@ void ivpu_bo_remove_all_bos_from_context(struct ivpu_mmu_context *ctx)
 }
 
 static struct ivpu_bo *
-ivpu_bo_alloc(struct ivpu_device *vdev, struct ivpu_mmu_context *mmu_context,
-	      u64 size, u32 flags, const struct ivpu_bo_ops *ops,
-	      const struct ivpu_addr_range *range, u64 user_ptr)
+ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, const struct ivpu_bo_ops *ops)
 {
 	struct ivpu_bo *bo;
 	int ret = 0;
@@ -364,7 +356,6 @@ ivpu_bo_alloc(struct ivpu_device *vdev, struct ivpu_mmu_context *mmu_context,
 	bo->base.funcs = &ivpu_gem_funcs;
 	bo->flags = flags;
 	bo->ops = ops;
-	bo->user_ptr = user_ptr;
 
 	if (ops->type == IVPU_BO_TYPE_SHMEM)
 		ret = drm_gem_object_init(&vdev->drm, &bo->base, size);
@@ -384,14 +375,6 @@ ivpu_bo_alloc(struct ivpu_device *vdev, struct ivpu_mmu_context *mmu_context,
 		}
 	}
 
-	if (mmu_context) {
-		ret = ivpu_bo_alloc_vpu_addr(bo, mmu_context, range);
-		if (ret) {
-			ivpu_err(vdev, "Failed to add BO to context: %d\n", ret);
-			goto err_release;
-		}
-	}
-
 	return bo;
 
 err_release:
@@ -401,6 +384,23 @@ ivpu_bo_alloc(struct ivpu_device *vdev, struct ivpu_mmu_context *mmu_context,
 	return ERR_PTR(ret);
 }
 
+static int ivpu_bo_open(struct drm_gem_object *obj, struct drm_file *file)
+{
+	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct ivpu_device *vdev = file_priv->vdev;
+	struct ivpu_bo *bo = to_ivpu_bo(obj);
+	struct ivpu_addr_range *range;
+
+	if (bo->flags & DRM_IVPU_BO_SHAVE_MEM)
+		range = &vdev->hw->ranges.shave;
+	else if (bo->flags & DRM_IVPU_BO_DMA_MEM)
+		range = &vdev->hw->ranges.dma;
+	else
+		range = &vdev->hw->ranges.user;
+
+	return ivpu_bo_alloc_vpu_addr(bo, &file_priv->ctx, range);
+}
+
 static void ivpu_bo_free(struct drm_gem_object *obj)
 {
 	struct ivpu_bo *bo = to_ivpu_bo(obj);
@@ -516,6 +516,7 @@ static const struct vm_operations_struct ivpu_vm_ops = {
 
 static const struct drm_gem_object_funcs ivpu_gem_funcs = {
 	.free = ivpu_bo_free,
+	.open = ivpu_bo_open,
 	.mmap = ivpu_bo_mmap,
 	.vm_ops = &ivpu_vm_ops,
 	.get_sg_table = ivpu_bo_get_sg_table,
@@ -537,7 +538,7 @@ ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (size == 0)
 		return -EINVAL;
 
-	bo = ivpu_bo_alloc(vdev, &file_priv->ctx, size, args->flags, &shmem_ops, NULL, 0);
+	bo = ivpu_bo_alloc(vdev, size, args->flags, &shmem_ops);
 	if (IS_ERR(bo)) {
 		ivpu_err(vdev, "Failed to create BO: %pe (ctx %u size %llu flags 0x%x)",
 			 bo, file_priv->ctx.id, args->size, args->flags);
@@ -578,13 +579,17 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 		range = &vdev->hw->ranges.global;
 	}
 
-	bo = ivpu_bo_alloc(vdev, &vdev->gctx, size, flags, &internal_ops, range, 0);
+	bo = ivpu_bo_alloc(vdev, size, flags, &internal_ops);
 	if (IS_ERR(bo)) {
 		ivpu_err(vdev, "Failed to create BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
 			 bo, vpu_addr, size, flags);
 		return NULL;
 	}
 
+	ret = ivpu_bo_alloc_vpu_addr(bo, &vdev->gctx, range);
+	if (ret)
+		goto err_put;
+
 	ret = ivpu_bo_pin(bo);
 	if (ret)
 		goto err_put;
@@ -631,7 +636,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_
 
 	get_dma_buf(buf);
 
-	bo = ivpu_bo_alloc(vdev, NULL, buf->size, DRM_IVPU_BO_MAPPABLE, &prime_ops, NULL, 0);
+	bo = ivpu_bo_alloc(vdev, buf->size, DRM_IVPU_BO_MAPPABLE, &prime_ops);
 	if (IS_ERR(bo)) {
 		ivpu_err(vdev, "Failed to import BO: %pe (size %lu)", bo, buf->size);
 		goto err_detach;
@@ -651,8 +656,6 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_
 
 int ivpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
-	struct ivpu_file_priv *file_priv = file->driver_priv;
-	struct ivpu_device *vdev = to_ivpu_device(dev);
 	struct drm_ivpu_bo_info *args = data;
 	struct drm_gem_object *obj;
 	struct ivpu_bo *bo;
@@ -665,21 +668,12 @@ int ivpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 	bo = to_ivpu_bo(obj);
 
 	mutex_lock(&bo->lock);
-
-	if (!bo->ctx) {
-		ret = ivpu_bo_alloc_vpu_addr(bo, &file_priv->ctx, NULL);
-		if (ret) {
-			ivpu_err(vdev, "Failed to allocate vpu_addr: %d\n", ret);
-			goto unlock;
-		}
-	}
-
 	args->flags = bo->flags;
 	args->mmap_offset = drm_vma_node_offset_addr(&obj->vma_node);
 	args->vpu_addr = bo->vpu_addr;
 	args->size = obj->size;
-unlock:
 	mutex_unlock(&bo->lock);
+
 	drm_gem_object_put(obj);
 	return ret;
 }
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index a0b4d4a32b3b..9bbbcd779265 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -29,7 +29,6 @@ struct ivpu_bo {
 	u64 vpu_addr;
 	u32 handle;
 	u32 flags;
-	uintptr_t user_ptr;
 	u32 job_status;
 };
 
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index e5336adc5e59..6bb87763346b 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -399,6 +399,8 @@ ivpu_mmu_context_insert_node_locked(struct ivpu_mmu_context *ctx,
 {
 	lockdep_assert_held(&ctx->lock);
 
+	WARN_ON(!range);
+
 	if (!ivpu_disable_mmu_cont_pages && size >= IVPU_MMU_CONT_PAGES_SIZE) {
 		if (!drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_CONT_PAGES_SIZE, 0,
 						 range->start, range->end, DRM_MM_INSERT_BEST))
-- 
2.25.1

