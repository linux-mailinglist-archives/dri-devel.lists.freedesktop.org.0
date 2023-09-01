Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D089E7900F0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 18:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4169310E813;
	Fri,  1 Sep 2023 16:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E215210E813
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693586934; x=1725122934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iVA4msOUf/kVW/LrSNTN67Sd2fAV9UGpK4vKln5hXfE=;
 b=Fzaj3j3bNIDD3CJY9ZOQM3PEiyuyMtk1HJJDfqll7YeYSW6Ro/pgAvta
 a350AhySNkBDJcBJCE0/IMN8YS8ReX6UyPmCrGGnXrztreqMF1og8blmu
 8TeThHduXkvP9qDJHB5idVO92hPhsAPYs1M/71Z+hKDGy6bL4Bag58RWw
 Na2EDpfA7+pPDZRNYikiLpHSwixaXCGLoCDjGj2r+tjB3PUsukINV9xme
 T5vwxUXOW0T8a5IKqP4IbxmgxQ1QCuciXCu6hG2OH839Cv2hxk/9VjWMa
 0lBl8vbZxtkX76ctaREPIU9vJrTDwFsgofhzojg9ym0JLBJHZQnbUJzvL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375164099"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="375164099"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769246426"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="769246426"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:52 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/4] accel/ivpu: Fix locking in
 ivpu_bo_remove_all_bos_from_context()
Date: Fri,  1 Sep 2023 18:48:40 +0200
Message-Id: <20230901164842.178654-3-stanislaw.gruszka@linux.intel.com>
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

ivpu_bo_remove_all_bos_from_context() could race with ivpu_bo_free()
when prime buffer was closed after vpu device was closed.

Move the bo_list from context to vdev and use a dedicated lock to
sync it. This list is not modified when BO is added/removed from
a context.

Also rename ivpu_bo_free_vpu_addr() to ivpu_bo_unbind() because this
function does more then just free vpu_addr.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c         |   7 +-
 drivers/accel/ivpu/ivpu_drv.h         |   3 +
 drivers/accel/ivpu/ivpu_gem.c         | 131 +++++++++++++-------------
 drivers/accel/ivpu/ivpu_gem.h         |   6 +-
 drivers/accel/ivpu/ivpu_mmu.c         |   5 +-
 drivers/accel/ivpu/ivpu_mmu_context.c |  36 ++++---
 drivers/accel/ivpu/ivpu_mmu_context.h |  11 +--
 7 files changed, 109 insertions(+), 90 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index fa0680ba9340..c4d4c803d3a3 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -93,8 +93,8 @@ static void file_priv_release(struct kref *ref)
 	ivpu_dbg(vdev, FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
 
 	ivpu_cmdq_release_all(file_priv);
-	ivpu_bo_remove_all_bos_from_context(&file_priv->ctx);
 	ivpu_jsm_context_release(vdev, file_priv->ctx.id);
+	ivpu_bo_remove_all_bos_from_context(vdev, &file_priv->ctx);
 	ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
 	drm_WARN_ON(&vdev->drm, xa_erase_irq(&vdev->context_xa, file_priv->ctx.id) != file_priv);
 	mutex_destroy(&file_priv->lock);
@@ -516,6 +516,11 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
 	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
+	INIT_LIST_HEAD(&vdev->bo_list);
+
+	ret = drmm_mutex_init(&vdev->drm, &vdev->bo_list_lock);
+	if (ret)
+		goto err_xa_destroy;
 
 	ret = ivpu_pci_init(vdev);
 	if (ret)
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 12a63f8a73e8..ac238b7633f4 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -114,6 +114,9 @@ struct ivpu_device {
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
+	struct mutex bo_list_lock; /* Protects bo_list */
+	struct list_head bo_list;
+
 	struct xarray submitted_jobs_xa;
 	struct task_struct *job_done_thread;
 
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index d1077cf90b65..915c53d7bb97 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -26,6 +26,17 @@ static const struct drm_gem_object_funcs ivpu_gem_funcs;
 
 static struct lock_class_key prime_bo_lock_class_key;
 
+static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, const char *action)
+{
+	if (bo->ctx)
+		ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u ctx %d vpu_addr 0x%llx mmu_mapped %d\n",
+			 action, bo->base.size, (bool)bo->pages, (bool)bo->sgt, bo->handle,
+			 bo->ctx->id, bo->vpu_addr, bo->mmu_mapped);
+	else
+		ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u (not added to context)\n",
+			 action, bo->base.size, (bool)bo->pages, (bool)bo->sgt, bo->handle);
+}
+
 static int __must_check prime_alloc_pages_locked(struct ivpu_bo *bo)
 {
 	/* Pages are managed by the underlying dma-buf */
@@ -245,9 +256,8 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
 
 	mutex_lock(&bo->lock);
 
-	if (!bo->vpu_addr) {
-		ivpu_err(vdev, "vpu_addr not set for BO ctx_id: %d handle: %d\n",
-			 bo->ctx->id, bo->handle);
+	if (!bo->ctx) {
+		ivpu_err(vdev, "vpu_addr not allocated for BO %d\n", bo->handle);
 		ret = -EINVAL;
 		goto unlock;
 	}
@@ -281,53 +291,68 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 	int ret;
 
-	mutex_lock(&ctx->lock);
-	ret = ivpu_mmu_context_insert_node_locked(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
+	mutex_lock(&bo->lock);
+
+	ret = ivpu_mmu_context_insert_node(ctx, range, bo->base.size, &bo->mm_node);
 	if (!ret) {
 		bo->ctx = ctx;
 		bo->vpu_addr = bo->mm_node.start;
-		list_add_tail(&bo->ctx_node, &ctx->bo_list);
+	} else {
+		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
 	}
-	mutex_unlock(&ctx->lock);
+	ivpu_dbg_bo(vdev, bo, "alloc");
 
-	if (ret)
-		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
+	mutex_unlock(&bo->lock);
 
 	return ret;
 }
 
-static void ivpu_bo_free_vpu_addr(struct ivpu_bo *bo)
+static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 {
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
-	struct ivpu_mmu_context *ctx = bo->ctx;
 
-	ivpu_dbg(vdev, BO, "remove from ctx: ctx %d vpu_addr 0x%llx allocated %d mmu_mapped %d\n",
-		 ctx->id, bo->vpu_addr, (bool)bo->sgt, bo->mmu_mapped);
+	lockdep_assert_held(&bo->lock);
 
-	mutex_lock(&bo->lock);
+	ivpu_dbg_bo(vdev, bo, "unbind");
 
+	/* TODO: dma_unmap */
 	if (bo->mmu_mapped) {
+		drm_WARN_ON(&vdev->drm, !bo->ctx);
+		drm_WARN_ON(&vdev->drm, !bo->vpu_addr);
 		drm_WARN_ON(&vdev->drm, !bo->sgt);
-		ivpu_mmu_context_unmap_sgt(vdev, ctx, bo->vpu_addr, bo->sgt);
+		ivpu_mmu_context_unmap_sgt(vdev, bo->ctx, bo->vpu_addr, bo->sgt);
 		bo->mmu_mapped = false;
 	}
 
-	mutex_lock(&ctx->lock);
-	list_del(&bo->ctx_node);
-	bo->vpu_addr = 0;
-	bo->ctx = NULL;
-	ivpu_mmu_context_remove_node_locked(ctx, &bo->mm_node);
-	mutex_unlock(&ctx->lock);
+	if (bo->ctx) {
+		ivpu_mmu_context_remove_node(bo->ctx, &bo->mm_node);
+		bo->vpu_addr = 0;
+		bo->ctx = NULL;
+	}
+}
 
+static void ivpu_bo_unbind(struct ivpu_bo *bo)
+{
+	mutex_lock(&bo->lock);
+	ivpu_bo_unbind_locked(bo);
 	mutex_unlock(&bo->lock);
 }
 
-void ivpu_bo_remove_all_bos_from_context(struct ivpu_mmu_context *ctx)
+void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
 {
-	struct ivpu_bo *bo, *tmp;
+	struct ivpu_bo *bo;
+
+	if (drm_WARN_ON(&vdev->drm, !ctx))
+		return;
 
-	list_for_each_entry_safe(bo, tmp, &ctx->bo_list, ctx_node)
-		ivpu_bo_free_vpu_addr(bo);
+	mutex_lock(&vdev->bo_list_lock);
+	list_for_each_entry(bo, &vdev->bo_list, bo_list_node) {
+		mutex_lock(&bo->lock);
+		if (bo->ctx == ctx)
+			ivpu_bo_unbind_locked(bo);
+		mutex_unlock(&bo->lock);
+	}
+	mutex_unlock(&vdev->bo_list_lock);
 }
 
 static struct ivpu_bo *
@@ -375,6 +400,10 @@ ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, const struct ivpu_b
 		}
 	}
 
+	mutex_lock(&vdev->bo_list_lock);
+	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
+	mutex_unlock(&vdev->bo_list_lock);
+
 	return bo;
 
 err_release:
@@ -406,19 +435,16 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
 	struct ivpu_bo *bo = to_ivpu_bo(obj);
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 
-	if (bo->ctx)
-		ivpu_dbg(vdev, BO, "free: ctx %d vpu_addr 0x%llx allocated %d mmu_mapped %d\n",
-			 bo->ctx->id, bo->vpu_addr, (bool)bo->sgt, bo->mmu_mapped);
-	else
-		ivpu_dbg(vdev, BO, "free: ctx (released) allocated %d mmu_mapped %d\n",
-			 (bool)bo->sgt, bo->mmu_mapped);
+	mutex_lock(&vdev->bo_list_lock);
+	list_del(&bo->bo_list_node);
+	mutex_unlock(&vdev->bo_list_lock);
 
 	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
 
-	vunmap(bo->kvaddr);
+	ivpu_dbg_bo(vdev, bo, "free");
 
-	if (bo->ctx)
-		ivpu_bo_free_vpu_addr(bo);
+	ivpu_bo_unbind(bo);
+	vunmap(bo->kvaddr);
 
 	if (bo->sgt)
 		ivpu_bo_unmap_and_free_pages(bo);
@@ -435,10 +461,6 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
 static int ivpu_bo_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
 	struct ivpu_bo *bo = to_ivpu_bo(obj);
-	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
-
-	ivpu_dbg(vdev, BO, "mmap: ctx %u handle %u vpu_addr 0x%llx size %zu type %s",
-		 bo->ctx->id, bo->handle, bo->vpu_addr, ivpu_bo_size(bo), bo->ops->name);
 
 	if (obj->import_attach) {
 		/* Drop the reference drm_gem_mmap_obj() acquired.*/
@@ -553,9 +575,6 @@ ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	drm_gem_object_put(&bo->base);
 
-	ivpu_dbg(vdev, BO, "alloc shmem: ctx %u vpu_addr 0x%llx size %zu flags 0x%x\n",
-		 file_priv->ctx.id, bo->vpu_addr, ivpu_bo_size(bo), bo->flags);
-
 	return ret;
 }
 
@@ -609,9 +628,6 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 		goto err_put;
 	}
 
-	ivpu_dbg(vdev, BO, "alloc internal: ctx 0 vpu_addr 0x%llx size %zu flags 0x%x\n",
-		 bo->vpu_addr, ivpu_bo_size(bo), flags);
-
 	return bo;
 
 err_put:
@@ -708,41 +724,30 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
 {
 	unsigned long dma_refcount = 0;
 
+	mutex_lock(&bo->lock);
+
 	if (bo->base.dma_buf && bo->base.dma_buf->file)
 		dma_refcount = atomic_long_read(&bo->base.dma_buf->file->f_count);
 
 	drm_printf(p, "%5u %6d %16llx %10lu %10u %12lu %14s\n",
-		   bo->ctx->id, bo->handle, bo->vpu_addr, ivpu_bo_size(bo),
+		   bo->ctx ? bo->ctx->id : -1, bo->handle, bo->vpu_addr, bo->base.size,
 		   kref_read(&bo->base.refcount), dma_refcount, bo->ops->name);
+
+	mutex_unlock(&bo->lock);
 }
 
 void ivpu_bo_list(struct drm_device *dev, struct drm_printer *p)
 {
 	struct ivpu_device *vdev = to_ivpu_device(dev);
-	struct ivpu_file_priv *file_priv;
-	unsigned long ctx_id;
 	struct ivpu_bo *bo;
 
 	drm_printf(p, "%5s %6s %16s %10s %10s %12s %14s\n",
 		   "ctx", "handle", "vpu_addr", "size", "refcount", "dma_refcount", "type");
 
-	mutex_lock(&vdev->gctx.lock);
-	list_for_each_entry(bo, &vdev->gctx.bo_list, ctx_node)
+	mutex_lock(&vdev->bo_list_lock);
+	list_for_each_entry(bo, &vdev->bo_list, bo_list_node)
 		ivpu_bo_print_info(bo, p);
-	mutex_unlock(&vdev->gctx.lock);
-
-	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
-		file_priv = ivpu_file_priv_get_by_ctx_id(vdev, ctx_id);
-		if (!file_priv)
-			continue;
-
-		mutex_lock(&file_priv->ctx.lock);
-		list_for_each_entry(bo, &file_priv->ctx.bo_list, ctx_node)
-			ivpu_bo_print_info(bo, p);
-		mutex_unlock(&file_priv->ctx.lock);
-
-		ivpu_file_priv_put(&file_priv);
-	}
+	mutex_unlock(&vdev->bo_list_lock);
 }
 
 void ivpu_bo_list_print(struct drm_device *dev)
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 9bbbcd779265..214d8fd14310 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -17,10 +17,10 @@ struct ivpu_bo {
 	const struct ivpu_bo_ops *ops;
 
 	struct ivpu_mmu_context *ctx;
-	struct list_head ctx_node;
+	struct list_head bo_list_node;
 	struct drm_mm_node mm_node;
 
-	struct mutex lock; /* Protects: pages, sgt, mmu_mapped */
+	struct mutex lock; /* Protects: pages, sgt, ctx, mmu_mapped, vpu_addr */
 	struct sg_table *sgt;
 	struct page **pages;
 	bool mmu_mapped;
@@ -48,7 +48,7 @@ struct ivpu_bo_ops {
 };
 
 int ivpu_bo_pin(struct ivpu_bo *bo);
-void ivpu_bo_remove_all_bos_from_context(struct ivpu_mmu_context *ctx);
+void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
 void ivpu_bo_list(struct drm_device *dev, struct drm_printer *p);
 void ivpu_bo_list_print(struct drm_device *dev);
 
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 473e1fc686a7..f0d81a93adab 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -741,9 +741,12 @@ int ivpu_mmu_init(struct ivpu_device *vdev)
 
 	ivpu_dbg(vdev, MMU, "Init..\n");
 
-	drmm_mutex_init(&vdev->drm, &mmu->lock);
 	ivpu_mmu_config_check(vdev);
 
+	ret = drmm_mutex_init(&vdev->drm, &mmu->lock);
+	if (ret)
+		return ret;
+
 	ret = ivpu_mmu_structs_alloc(vdev);
 	if (ret)
 		return ret;
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 6bb87763346b..066041140910 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -326,6 +326,9 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	u64 prot;
 	u64 i;
 
+	if (drm_WARN_ON(&vdev->drm, !ctx))
+		return -EINVAL;
+
 	if (!IS_ALIGNED(vpu_addr, IVPU_MMU_PAGE_SIZE))
 		return -EINVAL;
 	/*
@@ -372,8 +375,8 @@ ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
 	int ret;
 	u64 i;
 
-	if (!IS_ALIGNED(vpu_addr, IVPU_MMU_PAGE_SIZE))
-		ivpu_warn(vdev, "Unaligned vpu_addr: 0x%llx\n", vpu_addr);
+	if (drm_WARN_ON(&vdev->drm, !ctx))
+		return;
 
 	mutex_lock(&ctx->lock);
 
@@ -393,30 +396,34 @@ ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
 }
 
 int
-ivpu_mmu_context_insert_node_locked(struct ivpu_mmu_context *ctx,
-				    const struct ivpu_addr_range *range,
-				    u64 size, struct drm_mm_node *node)
+ivpu_mmu_context_insert_node(struct ivpu_mmu_context *ctx, const struct ivpu_addr_range *range,
+			     u64 size, struct drm_mm_node *node)
 {
-	lockdep_assert_held(&ctx->lock);
+	int ret;
 
 	WARN_ON(!range);
 
+	mutex_lock(&ctx->lock);
 	if (!ivpu_disable_mmu_cont_pages && size >= IVPU_MMU_CONT_PAGES_SIZE) {
-		if (!drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_CONT_PAGES_SIZE, 0,
-						 range->start, range->end, DRM_MM_INSERT_BEST))
-			return 0;
+		ret = drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_CONT_PAGES_SIZE, 0,
+						  range->start, range->end, DRM_MM_INSERT_BEST);
+		if (!ret)
+			goto unlock;
 	}
 
-	return drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_PAGE_SIZE, 0,
-					   range->start, range->end, DRM_MM_INSERT_BEST);
+	ret = drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_PAGE_SIZE, 0,
+					  range->start, range->end, DRM_MM_INSERT_BEST);
+unlock:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 void
-ivpu_mmu_context_remove_node_locked(struct ivpu_mmu_context *ctx, struct drm_mm_node *node)
+ivpu_mmu_context_remove_node(struct ivpu_mmu_context *ctx, struct drm_mm_node *node)
 {
-	lockdep_assert_held(&ctx->lock);
-
+	mutex_lock(&ctx->lock);
 	drm_mm_remove_node(node);
+	mutex_unlock(&ctx->lock);
 }
 
 static int
@@ -426,7 +433,6 @@ ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u3
 	int ret;
 
 	mutex_init(&ctx->lock);
-	INIT_LIST_HEAD(&ctx->bo_list);
 
 	ret = ivpu_mmu_pgtable_init(vdev, &ctx->pgtable);
 	if (ret) {
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index f15d8c630d8a..535db3a1fc74 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -23,10 +23,9 @@ struct ivpu_mmu_pgtable {
 };
 
 struct ivpu_mmu_context {
-	struct mutex lock; /* protects: mm, pgtable, bo_list */
+	struct mutex lock; /* Protects: mm, pgtable */
 	struct drm_mm mm;
 	struct ivpu_mmu_pgtable pgtable;
-	struct list_head bo_list;
 	u32 id;
 };
 
@@ -39,11 +38,9 @@ int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context
 void ivpu_mmu_user_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
 void ivpu_mmu_user_context_mark_invalid(struct ivpu_device *vdev, u32 ssid);
 
-int ivpu_mmu_context_insert_node_locked(struct ivpu_mmu_context *ctx,
-					const struct ivpu_addr_range *range,
-					u64 size, struct drm_mm_node *node);
-void ivpu_mmu_context_remove_node_locked(struct ivpu_mmu_context *ctx,
-					 struct drm_mm_node *node);
+int ivpu_mmu_context_insert_node(struct ivpu_mmu_context *ctx, const struct ivpu_addr_range *range,
+				 u64 size, struct drm_mm_node *node);
+void ivpu_mmu_context_remove_node(struct ivpu_mmu_context *ctx, struct drm_mm_node *node);
 
 int ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			     u64 vpu_addr, struct sg_table *sgt, bool llc_coherent);
-- 
2.25.1

