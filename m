Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36320AABEAF
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686C110E1FD;
	Tue,  6 May 2025 09:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVPNLVg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9133C10E1FD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746522788; x=1778058788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ay3rbd7TkREf90/4FALfCBruz+YUGH0GJCEYFUD5eLs=;
 b=lVPNLVg+XvtoO6VIf7v8d7pIwp5YL9d6AJNTNlzntFq4h5hhp4+jSDCw
 k5cTn9DX3WB10gOlTBnyjQ55r5XfDMCQuiZXSWkXt3VfoCHnGbPpDTvVl
 EBsLEyLWU/EfVfWcY0Ubj0za/Ts5yRK7wHd+b/dg8OUYcKx4rnlUKWM76
 Env1YH/oC7Vz7IvURCQnxFAsQjXOwrY/UwPXb25E7dE+tv/dA0REbktwI
 zcdeXDxqDEmbt09p1d9ubU1zbsdrYkLI3MnSgiReZat5z22kzGgfYFw9o
 sNTKeoh9Hf9db+5iK49ODvt2OW3LhvFB68GdKqkcL7wFZ7ShywxjabiGH Q==;
X-CSE-ConnectionGUID: dwv2jXf1RIOSfretGpIyBg==
X-CSE-MsgGUID: 3DCJbf/oT3C2kUMVJ7m7rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47888117"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="47888117"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 02:13:07 -0700
X-CSE-ConnectionGUID: /4Y/ppFGTSyOqQbN34QDaA==
X-CSE-MsgGUID: 437rn6f4Rg6SMAlTXJBm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136537825"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 02:13:05 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] accel/ivpu: Improve buffer object logging
Date: Tue,  6 May 2025 11:13:03 +0200
Message-ID: <20250506091303.262034-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

- Fix missing alloc log when drm_gem_handle_create() fails in
  drm_vma_node_allow() and open callback is not called
- Add ivpu_bo->ctx_id that enables to log the actual context
  id instead of using 0 as default
- Add couple WARNs and errors so we can catch more memory
  corruption issues

Fixes: 37dee2a2f433 ("accel/ivpu: Improve buffer object debug logs")
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 25 +++++++++++++++++--------
 drivers/accel/ivpu/ivpu_gem.h |  1 +
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index e0d242d9f3e50..a76cbf4761f8c 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -28,7 +28,7 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
 {
 	ivpu_dbg(vdev, BO,
 		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
-		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
+		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx_id,
 		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
 		 (bool)drm_gem_is_imported(&bo->base.base));
 }
@@ -94,8 +94,6 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
 	}
 
-	ivpu_dbg_bo(vdev, bo, "alloc");
-
 	mutex_unlock(&bo->lock);
 
 	drm_dev_exit(idx);
@@ -215,7 +213,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
+static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, u32 ctx_id)
 {
 	struct drm_gem_shmem_object *shmem;
 	struct ivpu_bo *bo;
@@ -233,6 +231,7 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
 		return ERR_CAST(shmem);
 
 	bo = to_ivpu_bo(&shmem->base);
+	bo->ctx_id = ctx_id;
 	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
 	bo->flags = flags;
 
@@ -240,6 +239,8 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
 	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
 	mutex_unlock(&vdev->bo_list_lock);
 
+	ivpu_dbg_bo(vdev, bo, "alloc");
+
 	return bo;
 }
 
@@ -278,8 +279,13 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	mutex_unlock(&vdev->bo_list_lock);
 
 	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
+	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
+	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
 
 	ivpu_bo_unbind_locked(bo);
+	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
+	drm_WARN_ON(&vdev->drm, bo->ctx);
+
 	mutex_destroy(&bo->lock);
 
 	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
@@ -314,7 +320,7 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (size == 0)
 		return -EINVAL;
 
-	bo = ivpu_bo_alloc(vdev, size, args->flags);
+	bo = ivpu_bo_alloc(vdev, size, args->flags, file_priv->ctx.id);
 	if (IS_ERR(bo)) {
 		ivpu_err(vdev, "Failed to allocate BO: %pe (ctx %u size %llu flags 0x%x)",
 			 bo, file_priv->ctx.id, args->size, args->flags);
@@ -322,7 +328,10 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	}
 
 	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
-	if (!ret)
+	if (ret)
+		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
+			 bo, file_priv->ctx.id, args->size, args->flags);
+	else
 		args->vpu_addr = bo->vpu_addr;
 
 	drm_gem_object_put(&bo->base.base);
@@ -345,7 +354,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(range->end));
 	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(size));
 
-	bo = ivpu_bo_alloc(vdev, size, flags);
+	bo = ivpu_bo_alloc(vdev, size, flags, IVPU_GLOBAL_CONTEXT_MMU_SSID);
 	if (IS_ERR(bo)) {
 		ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
 			 bo, range->start, size, flags);
@@ -452,7 +461,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
 	mutex_lock(&bo->lock);
 
 	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
-		   bo, bo->ctx ? bo->ctx->id : 0, bo->vpu_addr, bo->base.base.size,
+		   bo, bo->ctx_id, bo->vpu_addr, bo->base.base.size,
 		   bo->flags, kref_read(&bo->base.base.refcount));
 
 	if (bo->base.pages)
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index a222a9ec9d611..0c93118c85bd3 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -21,6 +21,7 @@ struct ivpu_bo {
 	u64 vpu_addr;
 	u32 flags;
 	u32 job_status; /* Valid only for command buffer */
+	u32 ctx_id;
 	bool mmu_mapped;
 };
 
-- 
2.45.1

