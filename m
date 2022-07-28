Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B1583FE8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C75A90B89;
	Thu, 28 Jul 2022 13:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751101130DA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014255; x=1690550255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NRxaLN5QlvQTXntfL3U6R5AVnWcXikhXyCU+QMb8WpM=;
 b=WBLnsEDLm9sAniHvJLw8ZJzmj1+7DpurQIDyM0YPprIHSuzPKb626+Mg
 w3WR8rLXHMQ2kOlSyQoLkoGzwdVIGKo7dyPAgPh2USJdHqqWu5o8oges4
 j+2vJSAd1/q/q7xIM/Srh6XcfHbPlGd4mCkJSyZ1PWaciWj4tB8O5Zr4Q
 ttejYf2Mq20AO3KtsuXZlnDpGlULkwtAuJ7u7DT/zdiH+4uGVgQ4/hvjX
 sl+n8+A20boLWMxt5zMYNJyIz+KkeyKJ65eaL66PF72sQr9++r2B1POYe
 OjfocuMznH25527kMnD04sqSMjJ3fxoblsZ65fvS5Ts5/i0eiBjM4I9Cy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520372"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520372"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722663"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:33 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 3/7] drm/vpu: Add GEM buffer object management
Date: Thu, 28 Jul 2022 15:17:05 +0200
Message-Id: <20220728131709.1087188-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds four types of GEM-based BOs for the VPU:
  - shmem
  - userptr
  - internal
  - prime

All types are implemented as struct vpu_bo, based on
struct drm_gem_object. VPU address is allocated when buffer is created
except for imported prime buffers that allocate it in BO_INFO IOCTL due
to missing file_priv arg in gem_prime_import callback.
Internal buffers are pinned on creation, the rest of buffers types
can be pinned on demand (in SUBMIT IOCTL).
Buffer VPU address, allocated pages and mappings are relased when the
buffer is destroyed.
Eviction mechism is planned for future versions.

Add three new IOCTLs: BO_CREATE, BO_INFO, BO_USERPTR

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/vpu/Makefile  |   1 +
 drivers/gpu/drm/vpu/vpu_drv.c |   9 +
 drivers/gpu/drm/vpu/vpu_gem.c | 833 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_gem.h | 113 +++++
 include/uapi/drm/vpu_drm.h    | 114 +++++
 5 files changed, 1070 insertions(+)
 create mode 100644 drivers/gpu/drm/vpu/vpu_gem.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_gem.h

diff --git a/drivers/gpu/drm/vpu/Makefile b/drivers/gpu/drm/vpu/Makefile
index b789e3a6ed22..b2f7a6c240f7 100644
--- a/drivers/gpu/drm/vpu/Makefile
+++ b/drivers/gpu/drm/vpu/Makefile
@@ -3,6 +3,7 @@
 
 intel_vpu-y := \
 	vpu_drv.o \
+	vpu_gem.o \
 	vpu_hw_mtl.o \
 	vpu_mmu.o \
 	vpu_mmu_context.o
diff --git a/drivers/gpu/drm/vpu/vpu_drv.c b/drivers/gpu/drm/vpu/vpu_drv.c
index 75ec1fe9c3e2..0e820aeecdcc 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.c
+++ b/drivers/gpu/drm/vpu/vpu_drv.c
@@ -11,8 +11,10 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_prime.h>
 
 #include "vpu_drv.h"
+#include "vpu_gem.h"
 #include "vpu_hw.h"
 #include "vpu_mmu.h"
 #include "vpu_mmu_context.h"
@@ -187,6 +189,9 @@ static void vpu_postclose(struct drm_device *dev, struct drm_file *file)
 static const struct drm_ioctl_desc vpu_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(VPU_GET_PARAM, vpu_get_param_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(VPU_SET_PARAM, vpu_set_param_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VPU_BO_CREATE, vpu_bo_create_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VPU_BO_INFO, vpu_bo_info_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VPU_BO_USERPTR, vpu_bo_userptr_ioctl, DRM_RENDER_ALLOW),
 };
 
 DEFINE_DRM_GEM_FOPS(vpu_fops);
@@ -210,6 +215,10 @@ static const struct drm_driver driver = {
 
 	.open = vpu_open,
 	.postclose = vpu_postclose,
+	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+	.gem_prime_import = vpu_gem_prime_import,
+	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.ioctls = vpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(vpu_drm_ioctls),
diff --git a/drivers/gpu/drm/vpu/vpu_gem.c b/drivers/gpu/drm/vpu/vpu_gem.c
new file mode 100644
index 000000000000..12f82ab941bd
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_gem.c
@@ -0,0 +1,833 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/highmem.h>
+#include <linux/module.h>
+#include <linux/set_memory.h>
+#include <linux/xarray.h>
+
+#include <drm/drm_cache.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/drm_utils.h>
+
+#include "vpu_drv.h"
+#include "vpu_gem.h"
+#include "vpu_hw.h"
+#include "vpu_mmu.h"
+#include "vpu_mmu_context.h"
+
+MODULE_IMPORT_NS(DMA_BUF);
+
+static const struct drm_gem_object_funcs vpu_gem_funcs;
+
+static int __must_check prime_alloc_pages_locked(struct vpu_bo *bo)
+{
+	/* Pages are managed by the underlying dma-buf */
+	return 0;
+}
+
+static void prime_free_pages_locked(struct vpu_bo *bo)
+{
+	/* Pages are managed by the underlying dma-buf */
+}
+
+static int prime_map_pages_locked(struct vpu_bo *bo)
+{
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+	struct sg_table *sgt;
+
+	WARN_ON(!bo->base.import_attach);
+
+	sgt = dma_buf_map_attachment(bo->base.import_attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		vpu_err(vdev, "Failed to map attachment: %ld\n", PTR_ERR(sgt));
+		return PTR_ERR(sgt);
+	}
+
+	bo->sgt = sgt;
+	return 0;
+}
+
+static void prime_unmap_pages_locked(struct vpu_bo *bo)
+{
+	WARN_ON(!bo->base.import_attach);
+
+	dma_buf_unmap_attachment(bo->base.import_attach, bo->sgt, DMA_BIDIRECTIONAL);
+	bo->sgt = NULL;
+}
+
+static const struct vpu_bo_ops prime_ops = {
+	.type = VPU_BO_TYPE_PRIME,
+	.name = "prime",
+	.alloc_pages = prime_alloc_pages_locked,
+	.free_pages = prime_free_pages_locked,
+	.map_pages = prime_map_pages_locked,
+	.unmap_pages = prime_unmap_pages_locked,
+};
+
+static int __must_check shmem_alloc_pages_locked(struct vpu_bo *bo)
+{
+	int npages = bo->base.size >> PAGE_SHIFT;
+	struct page **pages;
+
+	pages = drm_gem_get_pages(&bo->base);
+	if (IS_ERR(pages))
+		return PTR_ERR(pages);
+
+	if (!vpu_bo_is_cached(bo))
+		set_pages_array_uc(pages, npages);
+
+	bo->pages = pages;
+	return 0;
+}
+
+static void shmem_free_pages_locked(struct vpu_bo *bo)
+{
+	if (!vpu_bo_is_cached(bo))
+		set_pages_array_wb(bo->pages, bo->base.size >> PAGE_SHIFT);
+
+	drm_gem_put_pages(&bo->base, bo->pages, true, false);
+	bo->pages = NULL;
+}
+
+static int vpu_bo_map_pages_locked(struct vpu_bo *bo)
+{
+	int npages = bo->base.size >> PAGE_SHIFT;
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+	struct sg_table *sgt;
+	int ret;
+
+	sgt = drm_prime_pages_to_sg(&vdev->drm, bo->pages, npages);
+	if (IS_ERR(sgt)) {
+		vpu_err(vdev, "Failed to allocate sgtable\n");
+		return PTR_ERR(sgt);
+	}
+
+	ret = dma_map_sgtable(vdev->drm.dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret) {
+		vpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
+		goto err_free_sgt;
+	}
+
+	bo->sgt = sgt;
+	return 0;
+
+err_free_sgt:
+	kfree(sgt);
+	return ret;
+}
+
+static void vpu_bo_unmap_pages_locked(struct vpu_bo *bo)
+{
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+
+	dma_unmap_sgtable(vdev->drm.dev, bo->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(bo->sgt);
+	kfree(bo->sgt);
+	bo->sgt = NULL;
+}
+
+static const struct vpu_bo_ops shmem_ops = {
+	.type = VPU_BO_TYPE_SHMEM,
+	.name = "shmem",
+	.alloc_pages = shmem_alloc_pages_locked,
+	.free_pages = shmem_free_pages_locked,
+	.map_pages = vpu_bo_map_pages_locked,
+	.unmap_pages = vpu_bo_unmap_pages_locked,
+};
+
+static int __must_check userptr_alloc_pages_locked(struct vpu_bo *bo)
+{
+	unsigned int npages = bo->base.size >> PAGE_SHIFT;
+	struct page **pages;
+	int ret;
+
+	pages = kvmalloc_array(npages, sizeof(*bo->pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	ret = pin_user_pages(bo->user_ptr & PAGE_MASK, npages,
+			     FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM, pages, NULL);
+	if (ret != npages) {
+		if (ret > 0)
+			goto err_unpin_pages;
+		goto err_free_pages;
+	}
+
+	bo->pages = pages;
+	return 0;
+
+err_unpin_pages:
+	unpin_user_pages(pages, ret);
+err_free_pages:
+	kvfree(pages);
+	return ret;
+}
+
+static void userptr_free_pages_locked(struct vpu_bo *bo)
+{
+	unpin_user_pages(bo->pages, bo->base.size >> PAGE_SHIFT);
+	kvfree(bo->pages);
+	bo->pages = NULL;
+}
+
+static const struct vpu_bo_ops userptr_ops = {
+	.type = VPU_BO_TYPE_USERPTR,
+	.name = "userptr",
+	.alloc_pages = userptr_alloc_pages_locked,
+	.free_pages = userptr_free_pages_locked,
+	.map_pages = vpu_bo_map_pages_locked,
+	.unmap_pages = vpu_bo_unmap_pages_locked,
+};
+
+static int __must_check internal_alloc_pages_locked(struct vpu_bo *bo)
+{
+	unsigned int i, npages = bo->base.size >> PAGE_SHIFT;
+	struct page **pages;
+	int ret;
+
+	pages = kvmalloc_array(npages, sizeof(*bo->pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		pages[i] = alloc_page(GFP_KERNEL | __GFP_HIGHMEM | __GFP_ZERO);
+		if (!pages[i]) {
+			ret = -ENOMEM;
+			goto err_free_pages;
+		}
+		cond_resched();
+	}
+
+	bo->pages = pages;
+	return 0;
+
+err_free_pages:
+	while (i--)
+		put_page(pages[i]);
+	kvfree(pages);
+	return ret;
+}
+
+static void internal_free_pages_locked(struct vpu_bo *bo)
+{
+	unsigned int i, npages = bo->base.size >> PAGE_SHIFT;
+
+	for (i = 0; i < npages; i++)
+		put_page(bo->pages[i]);
+
+	kvfree(bo->pages);
+	bo->pages = NULL;
+}
+
+static const struct vpu_bo_ops internal_ops = {
+	.type = VPU_BO_TYPE_INTERNAL,
+	.name = "internal",
+	.alloc_pages = internal_alloc_pages_locked,
+	.free_pages = internal_free_pages_locked,
+	.map_pages = vpu_bo_map_pages_locked,
+	.unmap_pages = vpu_bo_unmap_pages_locked,
+};
+
+static int __must_check vpu_bo_alloc_and_map_pages_locked(struct vpu_bo *bo)
+{
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+	int ret;
+
+	lockdep_assert_held(&bo->lock);
+	WARN_ON(bo->sgt);
+
+	ret = bo->ops->alloc_pages(bo);
+	if (ret) {
+		vpu_err(vdev, "Failed to allocate pages for BO: %d", ret);
+		return ret;
+	}
+
+	ret = bo->ops->map_pages(bo);
+	if (ret) {
+		vpu_err(vdev, "Failed to map pages for BO: %d", ret);
+		goto err_free_pages;
+	}
+	return ret;
+
+err_free_pages:
+	bo->ops->free_pages(bo);
+	return ret;
+}
+
+static void vpu_bo_unmap_and_free_pages(struct vpu_bo *bo)
+{
+	mutex_lock(&bo->lock);
+
+	WARN_ON(!bo->sgt);
+	bo->ops->unmap_pages(bo);
+	WARN_ON(bo->sgt);
+	bo->ops->free_pages(bo);
+	WARN_ON(bo->pages);
+
+	mutex_unlock(&bo->lock);
+}
+
+/**
+ * vpu_bo_pin() - pin the backing physical pages and map them to VPU.
+ *
+ * This function pins physical memory pages, then maps the physical pages
+ * to IOMMU address space and finally updates the VPU MMU page tables
+ * to allow the VPU to translate VPU address to IOMMU address.
+ */
+int __must_check vpu_bo_pin(struct vpu_bo *bo)
+{
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+	int ret = 0;
+
+	mutex_lock(&bo->lock);
+
+	if (!bo->vpu_addr) {
+		vpu_err(vdev, "vpu_addr not set for BO ctx_id: %d handle: %d\n",
+			bo->ctx->id, bo->handle);
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (!bo->sgt) {
+		ret = vpu_bo_alloc_and_map_pages_locked(bo);
+		if (ret)
+			goto unlock;
+	}
+
+	if (!bo->mmu_mapped) {
+		ret = vpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, bo->sgt,
+					      vpu_bo_is_cached(bo));
+		if (ret) {
+			vpu_err(vdev, "Failed to map BO in MMU: %d\n", ret);
+			goto unlock;
+		}
+		bo->mmu_mapped = true;
+	}
+
+unlock:
+	mutex_unlock(&bo->lock);
+
+	return ret;
+}
+
+static int
+vpu_bo_alloc_vpu_addr(struct vpu_bo *bo, struct vpu_mmu_context *ctx,
+		      const struct vpu_addr_range *range)
+{
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+	int ret;
+
+	if (!range) {
+		if (bo->flags & DRM_VPU_BO_HIGH_MEM)
+			range = &vdev->hw->ranges.user_high;
+		else
+			range = &vdev->hw->ranges.user_low;
+	}
+
+	mutex_lock(&ctx->lock);
+	ret = vpu_mmu_context_insert_node_locked(ctx, range, bo->base.size, &bo->mm_node);
+	if (!ret) {
+		bo->ctx = ctx;
+		bo->vpu_addr = bo->mm_node.start;
+		list_add_tail(&bo->ctx_node, &ctx->bo_list);
+	}
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
+
+static void vpu_bo_free_vpu_addr(struct vpu_bo *bo)
+{
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+	struct vpu_mmu_context *ctx = bo->ctx;
+
+	vpu_dbg(BO, "remove from ctx: ctx %d vpu_addr 0x%llx allocated %d mmu_mapped %d\n",
+		ctx->id, bo->vpu_addr, (bool)bo->sgt, bo->mmu_mapped);
+
+	mutex_lock(&bo->lock);
+
+	if (bo->mmu_mapped) {
+		WARN_ON(!bo->sgt);
+		vpu_mmu_context_unmap_sgt(vdev, ctx, bo->vpu_addr, bo->sgt);
+		bo->mmu_mapped = false;
+	}
+
+	mutex_lock(&ctx->lock);
+	list_del(&bo->ctx_node);
+	bo->vpu_addr = 0;
+	bo->ctx = NULL;
+	vpu_mmu_context_remove_node_locked(ctx, &bo->mm_node);
+	mutex_unlock(&ctx->lock);
+
+	mutex_unlock(&bo->lock);
+}
+
+void vpu_bo_remove_all_bos_from_context(struct vpu_mmu_context *ctx)
+{
+	struct vpu_bo *bo, *tmp;
+
+	list_for_each_entry_safe(bo, tmp, &ctx->bo_list, ctx_node)
+		vpu_bo_free_vpu_addr(bo);
+}
+
+static struct vpu_bo *
+vpu_bo_alloc(struct vpu_device *vdev, struct vpu_mmu_context *mmu_context,
+	     u64 unaligned_size, u32 flags, const struct vpu_bo_ops *ops,
+	     const struct vpu_addr_range *range, u64 user_ptr)
+{
+	u64 size = PAGE_ALIGN(unaligned_size);
+	struct vpu_bo *bo;
+	int ret = 0;
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&bo->lock);
+	bo->base.funcs = &vpu_gem_funcs;
+	bo->flags = flags;
+	bo->ops = ops;
+	bo->user_ptr = user_ptr;
+
+	if (ops->type == VPU_BO_TYPE_SHMEM)
+		ret = drm_gem_object_init(&vdev->drm, &bo->base, size);
+	else
+		drm_gem_private_object_init(&vdev->drm, &bo->base, size);
+
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize drm object\n");
+		goto err_free;
+	}
+
+	if (flags & DRM_VPU_BO_MAPPABLE) {
+		ret = drm_gem_create_mmap_offset(&bo->base);
+		if (ret) {
+			vpu_err(vdev, "Failed to allocate mmap offset\n");
+			goto err_release;
+		}
+	}
+
+	if (mmu_context) {
+		ret = vpu_bo_alloc_vpu_addr(bo, mmu_context, range);
+		if (ret) {
+			vpu_err(vdev, "Failed to add BO to context: %d\n", ret);
+			goto err_release;
+		}
+	}
+
+	return bo;
+
+err_release:
+	drm_gem_object_release(&bo->base);
+err_free:
+	kfree(bo);
+	return ERR_PTR(ret);
+}
+
+static void vpu_bo_free(struct drm_gem_object *obj)
+{
+	struct vpu_bo *bo = to_vpu_bo(obj);
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+
+	if (bo->ctx)
+		vpu_dbg(BO, "free: ctx %d vpu_addr 0x%llx allocated %d mmu_mapped %d\n",
+			bo->ctx->id, bo->vpu_addr, (bool)bo->sgt, bo->mmu_mapped);
+	else
+		vpu_dbg(BO, "free: ctx (released) allocated %d mmu_mapped %d\n",
+			(bool)bo->sgt, bo->mmu_mapped);
+
+	WARN_ON(!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
+
+	vunmap(bo->kvaddr);
+
+	if (bo->ctx)
+		vpu_bo_free_vpu_addr(bo);
+
+	if (bo->sgt)
+		vpu_bo_unmap_and_free_pages(bo);
+
+	if (bo->base.import_attach)
+		drm_prime_gem_destroy(&bo->base, bo->sgt);
+
+	drm_gem_object_release(&bo->base);
+
+	mutex_destroy(&bo->lock);
+	kfree(bo);
+}
+
+static int vpu_bo_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct vpu_bo *bo = to_vpu_bo(obj);
+	struct vpu_device *vdev = vpu_bo_to_vdev(bo);
+	pgprot_t vm_page_prot;
+
+	vpu_dbg(BO, "mmap: ctx %u handle %u vpu_addr 0x%llx size %zu type %s",
+		bo->ctx->id, bo->handle, bo->vpu_addr, bo->base.size, bo->ops->name);
+
+	if (obj->import_attach) {
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		drm_gem_object_put(obj);
+		vma->vm_private_data = NULL;
+		return dma_buf_mmap(obj->dma_buf, vma, 0);
+	}
+
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND;
+
+	if (!vpu_bo_is_cached(bo)) {
+		vm_page_prot = vm_get_page_prot(vma->vm_flags);
+		vma->vm_page_prot = pgprot_noncached(vm_page_prot);
+	}
+
+	return 0;
+}
+
+static struct sg_table *vpu_bo_get_sg_table(struct drm_gem_object *obj)
+{
+	struct vpu_bo *bo = to_vpu_bo(obj);
+	loff_t npages = obj->size >> PAGE_SHIFT;
+	int ret = 0;
+
+	mutex_lock(&bo->lock);
+
+	if (!bo->sgt)
+		ret = vpu_bo_alloc_and_map_pages_locked(bo);
+
+	mutex_unlock(&bo->lock);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return drm_prime_pages_to_sg(obj->dev, bo->pages, npages);
+}
+
+static vm_fault_t vpu_vm_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct vpu_bo *bo = to_vpu_bo(obj);
+	loff_t npages = obj->size >> PAGE_SHIFT;
+	pgoff_t page_offset;
+	struct page *page;
+	vm_fault_t ret;
+	int err;
+
+	mutex_lock(&bo->lock);
+
+	if (!bo->sgt) {
+		err = vpu_bo_alloc_and_map_pages_locked(bo);
+		if (err) {
+			ret = vmf_error(err);
+			goto unlock;
+		}
+	}
+
+	/* We don't use vmf->pgoff since that has the fake offset */
+	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+	if (page_offset >= npages) {
+		ret = VM_FAULT_SIGBUS;
+	} else {
+		page = bo->pages[page_offset];
+		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
+	}
+
+unlock:
+	mutex_unlock(&bo->lock);
+
+	return ret;
+}
+
+static const struct vm_operations_struct vpu_vm_ops = {
+	.fault = vpu_vm_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs vpu_gem_funcs = {
+	.free = vpu_bo_free,
+	.mmap = vpu_bo_mmap,
+	.vm_ops = &vpu_vm_ops,
+	.get_sg_table = vpu_bo_get_sg_table,
+};
+
+int
+vpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct vpu_file_priv *file_priv = file->driver_priv;
+	struct vpu_device *vdev = file_priv->vdev;
+	struct drm_vpu_bo_create *args = data;
+	struct vpu_bo *bo;
+	int ret;
+
+	if (args->flags & ~DRM_VPU_BO_FLAGS)
+		return -EINVAL;
+
+	if (args->size == 0)
+		return -EINVAL;
+
+	ret = vpu_mmu_user_context_init(file_priv);
+	if (ret)
+		return ret;
+
+	bo = vpu_bo_alloc(vdev, &file_priv->ctx, args->size, args->flags,
+			  &shmem_ops, NULL, 0);
+	if (IS_ERR(bo)) {
+		vpu_err(vdev, "Failed to create BO: %pe (ctx %u size %llu flags 0x%x)",
+			bo, file_priv->ctx.id, args->size, args->flags);
+		return PTR_ERR(bo);
+	}
+
+	ret = drm_gem_handle_create(file, &bo->base, &bo->handle);
+	if (!ret) {
+		args->vpu_addr = bo->vpu_addr;
+		args->handle = bo->handle;
+	}
+
+	drm_gem_object_put(&bo->base);
+
+	vpu_dbg(BO, "alloc shmem: ctx %u vpu_addr 0x%llx size %zu flags 0x%x\n",
+		file_priv->ctx.id, bo->vpu_addr, bo->base.size, bo->flags);
+
+	return ret;
+}
+
+int
+vpu_bo_userptr_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct vpu_file_priv *file_priv = file->driver_priv;
+	struct vpu_device *vdev = file_priv->vdev;
+	struct drm_vpu_bo_userptr *args = data;
+	struct vpu_bo *bo;
+	int ret;
+
+	if (args->user_ptr == 0 || !PAGE_ALIGNED(args->user_ptr))
+		return -EINVAL;
+
+	if (args->user_size == 0 || !PAGE_ALIGNED(args->user_size))
+		return -EINVAL;
+
+	if (args->flags & ~DRM_VPU_BO_HIGH_MEM)
+		return -EINVAL;
+
+	if (!access_ok((const void __user *)args->user_ptr, args->user_size))
+		return -EFAULT;
+
+	ret = vpu_mmu_user_context_init(file_priv);
+	if (ret)
+		return ret;
+
+	bo = vpu_bo_alloc(vdev, &file_priv->ctx, args->user_size, args->flags,
+			  &userptr_ops, NULL, args->user_ptr);
+	if (IS_ERR(bo)) {
+		vpu_err(vdev, "Failed to create BO: %pe (ctx %u size %llu flags 0x%x)",
+			bo, file_priv->ctx.id, args->user_size, args->flags);
+		return PTR_ERR(bo);
+	}
+
+	if (!bo)
+		return -ENOMEM;
+
+	ret = drm_gem_handle_create(file, &bo->base, &bo->handle);
+	if (!ret) {
+		args->vpu_addr = bo->vpu_addr;
+		args->handle = bo->handle;
+	}
+
+	drm_gem_object_put(&bo->base);
+
+	vpu_dbg(BO, "alloc userptr: ctx %u vpu_addr 0x%llx size %zu flags 0x%x\n",
+		file_priv->ctx.id, bo->vpu_addr, bo->base.size, args->flags);
+
+	return ret;
+}
+
+struct vpu_bo *
+vpu_bo_alloc_internal(struct vpu_device *vdev, u64 vpu_addr, u64 size, bool cached)
+{
+	const struct vpu_addr_range *range;
+	struct vpu_addr_range fixed_range;
+	pgprot_t prot = PAGE_KERNEL;
+	struct vpu_bo *bo;
+	int flags = cached ? 0 : DRM_VPU_BO_UNCACHED;
+	int ret;
+
+	WARN_ON(!PAGE_ALIGNED(vpu_addr));
+	WARN_ON(!PAGE_ALIGNED(size));
+
+	if (vpu_addr) {
+		fixed_range.start = vpu_addr;
+		fixed_range.end = vpu_addr + size;
+		range = &fixed_range;
+	} else {
+		range = &vdev->hw->ranges.global_low;
+	}
+
+	bo = vpu_bo_alloc(vdev, &vdev->gctx, size, flags, &internal_ops, range, 0);
+	if (IS_ERR(bo)) {
+		vpu_err(vdev, "Failed to create BO: %pe (vpu_addr 0x%llx size %llu cached %d)",
+			bo, vpu_addr, size, cached);
+		return NULL;
+	}
+
+	ret = vpu_bo_pin(bo);
+	if (ret)
+		goto err_put;
+
+	if (!vpu_bo_is_cached(bo)) {
+		prot = pgprot_noncached(prot);
+		drm_clflush_pages(bo->pages, bo->base.size >> PAGE_SHIFT);
+	}
+
+	bo->kvaddr = vmap(bo->pages, bo->base.size >> PAGE_SHIFT, VM_MAP, prot);
+	if (!bo->kvaddr) {
+		vpu_err(vdev, "Failed to map BO into kernel virtual memory\n");
+		goto err_put;
+	}
+
+	vpu_dbg(BO, "alloc internal: ctx 0 vpu_addr 0x%llx size %zu cached %d\n",
+		bo->vpu_addr, bo->base.size, cached);
+
+	return bo;
+
+err_put:
+	drm_gem_object_put(&bo->base);
+	return NULL;
+}
+
+void vpu_bo_free_internal(struct vpu_bo *bo)
+{
+	drm_gem_object_put(&bo->base);
+}
+
+int vpu_bo_vremap_internal(struct vpu_device *vdev, struct vpu_bo *bo, bool cached)
+{
+	pgprot_t prot = cached ? PAGE_KERNEL : pgprot_noncached(PAGE_KERNEL);
+
+	vunmap(bo->kvaddr);
+
+	bo->kvaddr = vmap(bo->pages, bo->base.size >> PAGE_SHIFT, VM_MAP, prot);
+	if (!bo->kvaddr) {
+		vpu_err(vdev, "Failed to remap BO into kernel virtual memory\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+struct drm_gem_object *vpu_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
+{
+	struct vpu_device *vdev = to_vpu_dev(dev);
+	struct dma_buf_attachment *attach;
+	struct vpu_bo *bo;
+
+	attach = dma_buf_attach(buf, dev->dev);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(buf);
+
+	bo = vpu_bo_alloc(vdev, NULL, buf->size, DRM_VPU_BO_MAPPABLE, &prime_ops, NULL, 0);
+	if (IS_ERR(bo)) {
+		vpu_err(vdev, "Failed to import BO: %pe (size %lu)", bo, buf->size);
+		goto err_detach;
+	}
+
+	bo->base.import_attach = attach;
+	bo->base.resv = buf->resv;
+
+	return &bo->base;
+
+err_detach:
+	dma_buf_detach(buf, attach);
+	dma_buf_put(buf);
+	return ERR_CAST(bo);
+}
+
+int vpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct vpu_file_priv *file_priv = file->driver_priv;
+	struct vpu_device *vdev = to_vpu_dev(dev);
+	struct drm_vpu_bo_info *args = data;
+	struct drm_gem_object *obj;
+	struct vpu_bo *bo;
+	int ret;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	ret = vpu_mmu_user_context_init(file_priv);
+	if (ret)
+		goto obj_put;
+
+	bo = to_vpu_bo(obj);
+
+	mutex_lock(&bo->lock);
+
+	if (!bo->ctx) {
+		ret = vpu_bo_alloc_vpu_addr(bo, &file_priv->ctx, NULL);
+		if (ret) {
+			vpu_err(vdev, "Failed to allocate vpu_addr: %d\n", ret);
+			goto unlock;
+		}
+	}
+
+	args->flags = bo->flags;
+	args->mmap_offset = drm_vma_node_offset_addr(&obj->vma_node);
+	args->vpu_addr = bo->vpu_addr;
+	args->size = obj->size;
+unlock:
+	mutex_unlock(&bo->lock);
+obj_put:
+	drm_gem_object_put(obj);
+	return ret;
+}
+
+static void vpu_bo_print_info(struct vpu_bo *bo, struct drm_printer *p)
+{
+	unsigned long dma_refcount = 0;
+
+	if (bo->base.dma_buf && bo->base.dma_buf->file)
+		dma_refcount = atomic_long_read(&bo->base.dma_buf->file->f_count);
+
+	drm_printf(p, "%5u %6d %16llx %10lu %10u %12lu %14s\n",
+		   bo->ctx->id, bo->handle, bo->vpu_addr, bo->base.size,
+		   kref_read(&bo->base.refcount), dma_refcount, bo->ops->name);
+}
+
+void vpu_bo_list(struct drm_device *dev, struct drm_printer *p)
+{
+	struct vpu_device *vdev = to_vpu_dev(dev);
+	struct vpu_file_priv *file_priv;
+	unsigned long ctx_id;
+	struct vpu_bo *bo;
+
+	drm_printf(p, "%5s %6s %16s %10s %10s %12s %14s\n",
+		   "ctx", "handle", "vpu_addr", "size", "refcount", "dma_refcount", "type");
+
+	list_for_each_entry(bo, &vdev->gctx.bo_list, ctx_node) {
+		mutex_lock(&vdev->gctx.lock);
+		vpu_bo_print_info(bo, p);
+		mutex_unlock(&vdev->gctx.lock);
+	}
+
+	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
+		if (!file_priv)
+			continue;
+
+		mutex_lock(&file_priv->ctx.lock);
+		list_for_each_entry(bo, &file_priv->ctx.bo_list, ctx_node)
+			vpu_bo_print_info(bo, p);
+		mutex_unlock(&file_priv->ctx.lock);
+	}
+}
+
+void vpu_bo_list_print(struct drm_device *dev)
+{
+	struct drm_printer p = drm_info_printer(dev->dev);
+
+	vpu_bo_list(dev, &p);
+}
diff --git a/drivers/gpu/drm/vpu/vpu_gem.h b/drivers/gpu/drm/vpu/vpu_gem.h
new file mode 100644
index 000000000000..5afe761bc0f3
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_gem.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+#ifndef __VPU_GEM_H__
+#define __VPU_GEM_H__
+
+#include <drm/drm_gem.h>
+#include <drm/drm_mm.h>
+
+struct dma_buf;
+struct vpu_bo_ops;
+struct vpu_file_priv;
+
+struct vpu_bo {
+	struct drm_gem_object base;
+	const struct vpu_bo_ops *ops;
+
+	struct vpu_mmu_context *ctx;
+	struct list_head ctx_node;
+	struct drm_mm_node mm_node;
+
+	struct mutex lock; /* Protects: pages, sgt, mmu_mapped */
+	struct sg_table *sgt;
+	struct page **pages;
+	bool mmu_mapped;
+
+	void *kvaddr;
+	u64 vpu_addr;
+	u32 handle;
+	u32 flags;
+	uintptr_t user_ptr;
+};
+
+enum vpu_bo_type {
+	VPU_BO_TYPE_SHMEM = 1,
+	VPU_BO_TYPE_USERPTR,
+	VPU_BO_TYPE_INTERNAL,
+	VPU_BO_TYPE_PRIME,
+};
+
+struct vpu_bo_ops {
+	enum vpu_bo_type type;
+	const char *name;
+	int (*alloc_pages)(struct vpu_bo *bo);
+	void (*free_pages)(struct vpu_bo *bo);
+	int (*map_pages)(struct vpu_bo *bo);
+	void (*unmap_pages)(struct vpu_bo *bo);
+};
+
+int vpu_bo_pin(struct vpu_bo *bo);
+void vpu_bo_remove_all_bos_from_context(struct vpu_mmu_context *ctx);
+void vpu_bo_list(struct drm_device *dev, struct drm_printer *p);
+void vpu_bo_list_print(struct drm_device *dev);
+
+struct vpu_bo *
+vpu_bo_alloc_internal(struct vpu_device *vdev, u64 vpu_addr, u64 size, bool cached);
+void vpu_bo_free_internal(struct vpu_bo *bo);
+int vpu_bo_vremap_internal(struct vpu_device *vdev, struct vpu_bo *bo, bool cached);
+struct drm_gem_object *vpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
+void vpu_bo_unmap_sgt_and_remove_from_context(struct vpu_bo *bo);
+
+int vpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int vpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int vpu_bo_userptr_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int vpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
+static inline struct vpu_bo *to_vpu_bo(struct drm_gem_object *obj)
+{
+	return container_of(obj, struct vpu_bo, base);
+}
+
+static inline struct page *vpu_bo_get_page(struct vpu_bo *bo, u64 offset)
+{
+	if (offset > bo->base.size || !bo->pages)
+		return NULL;
+
+	return bo->pages[offset / PAGE_SIZE];
+}
+
+static inline bool vpu_bo_is_cached(struct vpu_bo *bo)
+{
+	return !(bo->flags & DRM_VPU_BO_UNCACHED);
+}
+
+static inline struct vpu_device *vpu_bo_to_vdev(struct vpu_bo *bo)
+{
+	return bo->base.dev->dev_private;
+}
+
+static inline void *vpu_to_cpu_addr(struct vpu_bo *bo, u32 vpu_addr)
+{
+	if (vpu_addr < bo->vpu_addr)
+		return NULL;
+
+	if (vpu_addr >= (bo->vpu_addr + bo->base.size))
+		return NULL;
+
+	return bo->kvaddr + (vpu_addr - bo->vpu_addr);
+}
+
+static inline u32 cpu_to_vpu_addr(struct vpu_bo *bo, void *cpu_addr)
+{
+	if (cpu_addr < bo->kvaddr)
+		return 0;
+
+	if (cpu_addr >= (bo->kvaddr + bo->base.size))
+		return 0;
+
+	return bo->vpu_addr + (cpu_addr - bo->kvaddr);
+}
+
+#endif /* __VPU_GEM_H__ */
diff --git a/include/uapi/drm/vpu_drm.h b/include/uapi/drm/vpu_drm.h
index 8e3b852d78a1..8793ed06bfa9 100644
--- a/include/uapi/drm/vpu_drm.h
+++ b/include/uapi/drm/vpu_drm.h
@@ -17,6 +17,9 @@ extern "C" {
 
 #define DRM_VPU_GET_PARAM		 0x00
 #define DRM_VPU_SET_PARAM		 0x01
+#define DRM_VPU_BO_CREATE		 0x02
+#define DRM_VPU_BO_INFO			 0x03
+#define DRM_VPU_BO_USERPTR		 0x04
 
 #define DRM_IOCTL_VPU_GET_PARAM                                                                    \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VPU_GET_PARAM, struct drm_vpu_param)
@@ -24,6 +27,15 @@ extern "C" {
 #define DRM_IOCTL_VPU_SET_PARAM                                                                    \
 	DRM_IOW(DRM_COMMAND_BASE + DRM_VPU_SET_PARAM, struct drm_vpu_param)
 
+#define DRM_IOCTL_VPU_BO_CREATE                                                                    \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VPU_BO_CREATE, struct drm_vpu_bo_create)
+
+#define DRM_IOCTL_VPU_BO_INFO                                                                      \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VPU_BO_INFO, struct drm_vpu_bo_info)
+
+#define DRM_IOCTL_VPU_BO_USERPTR                                                                   \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VPU_BO_USERPTR, struct drm_vpu_bo_userptr)
+
 /**
  * DOC: contexts
  *
@@ -92,6 +104,108 @@ struct drm_vpu_param {
 	__u64 value;
 };
 
+#define DRM_VPU_BO_HIGH_MEM 0x00000001
+#define DRM_VPU_BO_MAPPABLE 0x00000002
+#define DRM_VPU_BO_UNCACHED 0x00010000
+
+#define DRM_VPU_BO_FLAGS \
+	(DRM_VPU_BO_HIGH_MEM | \
+	 DRM_VPU_BO_MAPPABLE | \
+	 DRM_VPU_BO_UNCACHED)
+
+/**
+ * struct drm_vpu_bo_create - Create BO backed by SHMEM
+ *
+ * Create GEM buffer object allocated in SHMEM memory.
+ */
+struct drm_vpu_bo_create {
+	/** @size: The size in bytes of the allocated memory */
+	__u64 size;
+
+	/**
+	 * @flags:
+	 *
+	 * Supported flags:
+	 *
+	 * %DRM_VPU_BO_HIGH_MEM:
+	 *
+	 * Allocate VPU address from >4GB range.
+	 * Buffer object with vpu address >4GB can be always accessed by the
+	 * VPU DMA engine, but some HW generation may not be able to access
+	 * this memory from then firmware running on the VPU management processor.
+	 * Suitable for input, output and some scratch buffers.
+	 *
+	 * %DRM_VPU_BO_MAPPABLE:
+	 *
+	 * Buffer object can be mapped using mmap().
+	 *
+	 * %DRM_VPU_BO_UNCACHED:
+	 *
+	 * Allocated BO will not be cached on host side and it will be snooped
+	 * on the VPU side.
+	 */
+	__u32 flags;
+
+	/** @handle: Returned GEM object handle */
+	__u32 handle;
+
+	/** @vpu_addr: Returned VPU virtual address */
+	__u64 vpu_addr;
+};
+
+/**
+ * struct drm_vpu_bo_info - Query buffer object info
+ */
+struct drm_vpu_bo_info {
+	/** @handle: Handle of the queried BO */
+	__u32 handle;
+
+	/** @flags: Returned flags used to create the BO */
+	__u32 flags;
+
+	/** @vpu_addr: Returned VPU virtual address */
+	__u64 vpu_addr;
+
+	/**
+	 * @mmap_offset:
+	 *
+	 * Returned offset to be used in mmap(). 0 in case the BO is not mappable.
+	 */
+	__u64 mmap_offset;
+
+	/** @size: Returned GEM object size, aligned to PAGE_SIZE */
+	__u64 size;
+};
+
+/**
+ * struct drm_vpu_bo_userptr - Create BO from user memory
+ *
+ * Create GEM buffer object from user allocated memory. The provided @user_ptr
+ * has to be page aligned. BOs created using this ioctl are always cacheable.
+ */
+struct drm_vpu_bo_userptr {
+	/** @user_ptr: User allocated pointer aligned to PAGE_SIZE */
+	__u64 user_ptr;
+
+	/** @user_size: The size in bytes of the allocated memory */
+	__u64 user_size;
+
+	/**
+	 * @flags:
+	 *
+	 * Supported flags:
+	 *
+	 * %DRM_VPU_BO_HIGH_MEM: see &drm_vpu_bo_create->flags
+	 */
+	__u32 flags;
+
+	/** @handle: Returned GEM object handle */
+	__u32 handle;
+
+	/** @vpu_addr: Returned VPU virtual address */
+	__u64 vpu_addr;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

