Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A082DA70
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F28510E2E7;
	Mon, 15 Jan 2024 13:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EA310E2E0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705326295; x=1736862295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xbbs7DsOnnEL0zFCpY6U/nP+U6pMKS6ox0wy3/C724g=;
 b=E/73XJDhdngLeOgoaFV8uWmK5hohDZMTu/mbAPTdap9err8yCh2jJi0P
 gGg3X3m2ptUkM0PrsoP4bszOufHMEcy38liRXlyyLQKF0JHVdmNDor3YG
 D2baZ/sui/4rpgfQ/it8k/Ae5p3EviJNuxGgRkT+h0yf66RzF05g53n91
 Yy9E8iLezKieIvBbG2sAeWOtivCNMRmaG//i8JZ8TTI7Z/aSzIn2OuDhi
 LuAry68cYb1GSlHAoszLEge4mV1rKPyExz895XnDNSS0pzvMIuwXyc+6P
 Ei/HE37s5ruIcTlHHu/kj/pHWkGq/cHlKUDJO8W78VKcX6BNpos1c6o/2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403378776"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="403378776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="25472230"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:49 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/9] accel/ivpu: Improve buffer object debug logs
Date: Mon, 15 Jan 2024 14:44:33 +0100
Message-ID: <20240115134434.493839-9-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
References: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
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

Make debug logs more readable and consistent:
  - don't print handle as it is not always available for all buffers
  - use hashed ivpu_bo ptr as main buffer identifier
  - remove unused fields from ivpu_bo_print_info()

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 63 ++++++++++++-----------------------
 drivers/accel/ivpu/ivpu_gem.h |  1 -
 2 files changed, 22 insertions(+), 42 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 95e731e13941..16f3035b91c0 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -24,14 +24,11 @@ static const struct drm_gem_object_funcs ivpu_gem_funcs;
 
 static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, const char *action)
 {
-	if (bo->ctx)
-		ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u ctx %d vpu_addr 0x%llx mmu_mapped %d\n",
-			 action, ivpu_bo_size(bo), (bool)bo->base.pages, (bool)bo->base.sgt,
-			 bo->handle, bo->ctx->id, bo->vpu_addr, bo->mmu_mapped);
-	else
-		ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u (not added to context)\n",
-			 action, ivpu_bo_size(bo), (bool)bo->base.pages, (bool)bo->base.sgt,
-			 bo->handle);
+	ivpu_dbg(vdev, BO,
+		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
+		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
+		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
+		 (bool)bo->base.base.import_attach);
 }
 
 /*
@@ -49,12 +46,7 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
 	mutex_lock(&bo->lock);
 
 	ivpu_dbg_bo(vdev, bo, "pin");
-
-	if (!bo->ctx) {
-		ivpu_err(vdev, "vpu_addr not allocated for BO %d\n", bo->handle);
-		ret = -EINVAL;
-		goto unlock;
-	}
+	drm_WARN_ON(&vdev->drm, !bo->ctx);
 
 	if (!bo->mmu_mapped) {
 		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
@@ -108,9 +100,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 {
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 
-	lockdep_assert_held(&bo->lock);
-
-	ivpu_dbg_bo(vdev, bo, "unbind");
+	lockdep_assert(lockdep_is_held(&bo->lock) || !kref_read(&bo->base.base.refcount));
 
 	if (bo->mmu_mapped) {
 		drm_WARN_ON(&vdev->drm, !bo->ctx);
@@ -122,7 +112,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 
 	if (bo->ctx) {
 		ivpu_mmu_context_remove_node(bo->ctx, &bo->mm_node);
-		bo->vpu_addr = 0;
 		bo->ctx = NULL;
 	}
 
@@ -156,8 +145,10 @@ void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
 	mutex_lock(&vdev->bo_list_lock);
 	list_for_each_entry(bo, &vdev->bo_list, bo_list_node) {
 		mutex_lock(&bo->lock);
-		if (bo->ctx == ctx)
+		if (bo->ctx == ctx) {
+			ivpu_dbg_bo(vdev, bo, "unbind");
 			ivpu_bo_unbind_locked(bo);
+		}
 		mutex_unlock(&bo->lock);
 	}
 	mutex_unlock(&vdev->bo_list_lock);
@@ -209,9 +200,6 @@ ivpu_bo_create(struct ivpu_device *vdev, u64 size, u32 flags)
 	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
 	mutex_unlock(&vdev->bo_list_lock);
 
-	ivpu_dbg(vdev, BO, "create: vpu_addr 0x%llx size %zu flags 0x%x\n",
-		 bo->vpu_addr, bo->base.base.size, flags);
-
 	return bo;
 }
 
@@ -243,14 +231,14 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
 	struct ivpu_device *vdev = to_ivpu_device(obj->dev);
 	struct ivpu_bo *bo = to_ivpu_bo(obj);
 
+	ivpu_dbg_bo(vdev, bo, "free");
+
 	mutex_lock(&vdev->bo_list_lock);
 	list_del(&bo->bo_list_node);
 	mutex_unlock(&vdev->bo_list_lock);
 
 	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
 
-	ivpu_dbg_bo(vdev, bo, "free");
-
 	ivpu_bo_unbind(bo);
 	mutex_destroy(&bo->lock);
 
@@ -293,11 +281,9 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 		return PTR_ERR(bo);
 	}
 
-	ret = drm_gem_handle_create(file, &bo->base.base, &bo->handle);
-	if (!ret) {
+	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
+	if (!ret)
 		args->vpu_addr = bo->vpu_addr;
-		args->handle = bo->handle;
-	}
 
 	drm_gem_object_put(&bo->base.base);
 
@@ -415,19 +401,11 @@ int ivpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 
 static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
 {
-	unsigned long dma_refcount = 0;
-
 	mutex_lock(&bo->lock);
 
-	if (bo->base.base.dma_buf && bo->base.base.dma_buf->file)
-		dma_refcount = atomic_long_read(&bo->base.base.dma_buf->file->f_count);
-
-	drm_printf(p, "%-3u %-6d 0x%-12llx %-10lu 0x%-8x %-4u %-8lu",
-		   bo->ctx->id, bo->handle, bo->vpu_addr, bo->base.base.size,
-		   bo->flags, kref_read(&bo->base.base.refcount), dma_refcount);
-
-	if (bo->base.base.import_attach)
-		drm_printf(p, " imported");
+	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
+		   bo, bo->ctx->id, bo->vpu_addr, bo->base.base.size,
+		   bo->flags, kref_read(&bo->base.base.refcount));
 
 	if (bo->base.pages)
 		drm_printf(p, " has_pages");
@@ -435,6 +413,9 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
 	if (bo->mmu_mapped)
 		drm_printf(p, " mmu_mapped");
 
+	if (bo->base.base.import_attach)
+		drm_printf(p, " imported");
+
 	drm_printf(p, "\n");
 
 	mutex_unlock(&bo->lock);
@@ -445,8 +426,8 @@ void ivpu_bo_list(struct drm_device *dev, struct drm_printer *p)
 	struct ivpu_device *vdev = to_ivpu_device(dev);
 	struct ivpu_bo *bo;
 
-	drm_printf(p, "%-3s %-6s %-14s %-10s %-10s %-4s %-8s %s\n",
-		   "ctx", "handle", "vpu_addr", "size", "flags", "refs", "dma_refs", "attribs");
+	drm_printf(p, "%-9s %-3s %-14s %-10s %-10s %-4s %s\n",
+		   "bo", "ctx", "vpu_addr", "size", "flags", "refs", "attribs");
 
 	mutex_lock(&vdev->bo_list_lock);
 	list_for_each_entry(bo, &vdev->bo_list, bo_list_node)
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index d75cad0d3c74..5cb1dda3e58e 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -19,7 +19,6 @@ struct ivpu_bo {
 
 	struct mutex lock; /* Protects: ctx, mmu_mapped, vpu_addr */
 	u64 vpu_addr;
-	u32 handle;
 	u32 flags;
 	u32 job_status; /* Valid only for command buffer */
 	bool mmu_mapped;
-- 
2.43.0

