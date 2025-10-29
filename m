Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C45C19580
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FD710E750;
	Wed, 29 Oct 2025 09:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEEAv9Lp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B653D10E750
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761729480; x=1793265480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ubqdeMq70IogS/KJhceS66srDmkBxehU/dspUy/eDuA=;
 b=VEEAv9Lpf5TL9H4rC2iKhH7W6ZOPxz4tTbzhJKCtBqx7r3lyYCdwnNxZ
 VouKtHyFztPO4QamfEUtKoN/aiHNfE32cagkg1I+j8oLZiPjR/E6WuvLh
 z8hvhYmA86Z2NKoZUIGiHGVRsu20sGs71v4a+FFto1wJM5oq5+ySuqf6z
 Ewxb0y/or+VSYjYFgcXfEnTdFX16pJmVJPNL3tvQ+qoQ329H/ksHmXwZd
 eRCY5UnPh+ijsehaLethJlvN73m3w0wU/DTxQLVwJbanc5dgSYTkYD6a5
 7JBnT86BpPMsWiwjJYancDasG3VzfqOT6u5mqItWHW7Qb7blTq2Kmzw+l g==;
X-CSE-ConnectionGUID: v97lPoWES8OrwXhaC2fSAw==
X-CSE-MsgGUID: 40GiF2enT4KqyWkR/ZQB4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86473280"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="86473280"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 02:17:59 -0700
X-CSE-ConnectionGUID: 31eHSaFwQWiU/pC12L96ZQ==
X-CSE-MsgGUID: 9ew0N7XST9uEnNcaZyq+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="216262006"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 02:17:58 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH v2] accel/ivpu: Add support for userptr buffer objects
Date: Wed, 29 Oct 2025 10:17:52 +0100
Message-ID: <20251029091752.203198-1-karol.wachowski@linux.intel.com>
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

Introduce a new ioctl `drm_ivpu_bo_create_from_userptr` that allows
users to create GEM buffer objects from user pointers to memory regions.
The user pointer must be page-aligned and the memory region must remain
valid for the buffer object's lifetime.

Userptr buffers enable direct use of mmapped files (e.g. inference
weights) in NPU workloads without copying data to NPU buffer objects.
This reduces memory usage and provides better flexibility for NPU
applications.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
Changes in v2:
 - Remove unnecessary paragraph duplicating subject in commit message
 - Add paragraph explaining benefits of userptr buffers in commit
   message
 - Remove 4GB limiation for userptr size
---
 drivers/accel/ivpu/Makefile           |   1 +
 drivers/accel/ivpu/ivpu_drv.c         |   3 +
 drivers/accel/ivpu/ivpu_gem.c         |   2 +-
 drivers/accel/ivpu/ivpu_gem.h         |   7 +
 drivers/accel/ivpu/ivpu_gem_userptr.c | 202 ++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_mmu_context.c |   4 +-
 drivers/accel/ivpu/ivpu_mmu_context.h |   2 +-
 include/uapi/drm/ivpu_accel.h         |  52 +++++++
 8 files changed, 270 insertions(+), 3 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_gem_userptr.c

diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index 1029e0bab061..dbf76b8a5b4c 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -6,6 +6,7 @@ intel_vpu-y := \
 	ivpu_fw.o \
 	ivpu_fw_log.o \
 	ivpu_gem.o \
+	ivpu_gem_userptr.o \
 	ivpu_hw.o \
 	ivpu_hw_btrs.o \
 	ivpu_hw_ip.o \
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index c6fe7a408912..ca68730dee88 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -134,6 +134,8 @@ bool ivpu_is_capable(struct ivpu_device *vdev, u32 capability)
 		return true;
 	case DRM_IVPU_CAP_DMA_MEMORY_RANGE:
 		return true;
+	case DRM_IVPU_CAP_BO_CREATE_FROM_USERPTR:
+		return true;
 	case DRM_IVPU_CAP_MANAGE_CMDQ:
 		return vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW;
 	default:
@@ -313,6 +315,7 @@ static const struct drm_ioctl_desc ivpu_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(IVPU_CMDQ_CREATE, ivpu_cmdq_create_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(IVPU_CMDQ_DESTROY, ivpu_cmdq_destroy_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(IVPU_CMDQ_SUBMIT, ivpu_cmdq_submit_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(IVPU_BO_CREATE_FROM_USERPTR, ivpu_bo_create_from_userptr_ioctl, 0),
 };
 
 static int ivpu_wait_for_ready(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index e7277e02840a..9e58522840ae 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -96,7 +96,7 @@ int __must_check ivpu_bo_bind(struct ivpu_bo *bo)
 	if (!bo->mmu_mapped) {
 		drm_WARN_ON(&vdev->drm, !bo->ctx);
 		ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt,
-					       ivpu_bo_is_snooped(bo));
+					       ivpu_bo_is_snooped(bo), ivpu_bo_is_read_only(bo));
 		if (ret) {
 			ivpu_err(vdev, "Failed to map BO in MMU: %d\n", ret);
 			goto unlock;
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 54452eb8a41f..2dcd7eba9cb7 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -38,6 +38,8 @@ void ivpu_bo_free(struct ivpu_bo *bo);
 int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 int ivpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 int ivpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int ivpu_bo_create_from_userptr_ioctl(struct drm_device *dev, void *data,
+				      struct drm_file *file);
 
 void ivpu_bo_list(struct drm_device *dev, struct drm_printer *p);
 void ivpu_bo_list_print(struct drm_device *dev);
@@ -75,6 +77,11 @@ static inline bool ivpu_bo_is_snooped(struct ivpu_bo *bo)
 	return ivpu_bo_cache_mode(bo) == DRM_IVPU_BO_CACHED;
 }
 
+static inline bool ivpu_bo_is_read_only(struct ivpu_bo *bo)
+{
+	return bo->flags & DRM_IVPU_BO_READ_ONLY;
+}
+
 static inline void *ivpu_to_cpu_addr(struct ivpu_bo *bo, u32 vpu_addr)
 {
 	if (vpu_addr < bo->vpu_addr)
diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
new file mode 100644
index 000000000000..235c67959453
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020-2025 Intel Corporation
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/err.h>
+#include <linux/highmem.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/capability.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+
+#include "ivpu_drv.h"
+#include "ivpu_gem.h"
+
+static struct sg_table *
+ivpu_gem_userptr_dmabuf_map(struct dma_buf_attachment *attachment,
+			    enum dma_data_direction direction)
+{
+	struct sg_table *sgt = attachment->dmabuf->priv;
+	int ret;
+
+	ret = dma_map_sgtable(attachment->dev, sgt, direction, DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return sgt;
+}
+
+static void ivpu_gem_userptr_dmabuf_unmap(struct dma_buf_attachment *attachment,
+					  struct sg_table *sgt,
+					  enum dma_data_direction direction)
+{
+	dma_unmap_sgtable(attachment->dev, sgt, direction, DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void ivpu_gem_userptr_dmabuf_release(struct dma_buf *dma_buf)
+{
+	struct sg_table *sgt = dma_buf->priv;
+	struct sg_page_iter page_iter;
+	struct page *page;
+
+	for_each_sgtable_page(sgt, &page_iter, 0) {
+		page = sg_page_iter_page(&page_iter);
+		unpin_user_page(page);
+	}
+
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static const struct dma_buf_ops ivpu_gem_userptr_dmabuf_ops = {
+	.map_dma_buf = ivpu_gem_userptr_dmabuf_map,
+	.unmap_dma_buf = ivpu_gem_userptr_dmabuf_unmap,
+	.release = ivpu_gem_userptr_dmabuf_release,
+};
+
+static struct dma_buf *
+ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
+			   size_t size, uint32_t flags)
+{
+	struct dma_buf_export_info exp_info = {};
+	struct dma_buf *dma_buf;
+	struct sg_table *sgt;
+	struct page **pages;
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	unsigned int gup_flags = FOLL_LONGTERM;
+	int ret, i, pinned;
+
+	/* Add FOLL_WRITE only if the BO is not read-only */
+	if (!(flags & DRM_IVPU_BO_READ_ONLY))
+		gup_flags |= FOLL_WRITE;
+
+	pages = kvmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	pinned = pin_user_pages_fast((unsigned long)user_ptr, nr_pages, gup_flags, pages);
+	if (pinned < 0) {
+		ret = pinned;
+		ivpu_warn(vdev, "Failed to pin user pages: %d\n", ret);
+		goto free_pages_array;
+	}
+
+	if (pinned != nr_pages) {
+		ivpu_warn(vdev, "Pinned %d pages, expected %lu\n", pinned, nr_pages);
+		ret = -EFAULT;
+		goto unpin_pages;
+	}
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt) {
+		ret = -ENOMEM;
+		goto unpin_pages;
+	}
+
+	ret = sg_alloc_table_from_pages(sgt, pages, nr_pages, 0, size, GFP_KERNEL);
+	if (ret) {
+		ivpu_warn(vdev, "Failed to create sg table: %d\n", ret);
+		goto free_sgt;
+	}
+
+	exp_info.exp_name = "ivpu_userptr_dmabuf";
+	exp_info.owner = THIS_MODULE;
+	exp_info.ops = &ivpu_gem_userptr_dmabuf_ops;
+	exp_info.size = size;
+	exp_info.flags = O_RDWR | O_CLOEXEC;
+	exp_info.priv = sgt;
+
+	dma_buf = dma_buf_export(&exp_info);
+	if (IS_ERR(dma_buf)) {
+		ret = PTR_ERR(dma_buf);
+		ivpu_warn(vdev, "Failed to export userptr dma-buf: %d\n", ret);
+		goto free_sg_table;
+	}
+
+	kvfree(pages);
+	return dma_buf;
+
+free_sg_table:
+	sg_free_table(sgt);
+free_sgt:
+	kfree(sgt);
+unpin_pages:
+	for (i = 0; i < pinned; i++)
+		unpin_user_page(pages[i]);
+free_pages_array:
+	kvfree(pages);
+	return ERR_PTR(ret);
+}
+
+static struct ivpu_bo *
+ivpu_bo_create_from_userptr(struct ivpu_device *vdev, void __user *user_ptr,
+			    size_t size, uint32_t flags)
+{
+	struct dma_buf *dma_buf;
+	struct drm_gem_object *obj;
+	struct ivpu_bo *bo;
+
+	dma_buf = ivpu_create_userptr_dmabuf(vdev, user_ptr, size, flags);
+	if (IS_ERR(dma_buf))
+		return ERR_CAST(dma_buf);
+
+	obj = ivpu_gem_prime_import(&vdev->drm, dma_buf);
+	if (IS_ERR(obj)) {
+		dma_buf_put(dma_buf);
+		return ERR_CAST(obj);
+	}
+
+	dma_buf_put(dma_buf);
+
+	bo = to_ivpu_bo(obj);
+	bo->flags = flags;
+
+	return bo;
+}
+
+int ivpu_bo_create_from_userptr_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_ivpu_bo_create_from_userptr *args = data;
+	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct ivpu_device *vdev = to_ivpu_device(dev);
+	void __user *user_ptr = u64_to_user_ptr(args->user_ptr);
+	struct ivpu_bo *bo;
+	int ret;
+
+	if (args->flags & ~(DRM_IVPU_BO_HIGH_MEM | DRM_IVPU_BO_DMA_MEM | DRM_IVPU_BO_READ_ONLY))
+		return -EINVAL;
+
+	if (!args->user_ptr || !args->size)
+		return -EINVAL;
+
+	if (!PAGE_ALIGNED(args->user_ptr) || !PAGE_ALIGNED(args->size))
+		return -EINVAL;
+
+	if (!access_ok(user_ptr, args->size))
+		return -EFAULT;
+
+	bo = ivpu_bo_create_from_userptr(vdev, user_ptr, args->size, args->flags);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
+	if (ret) {
+		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
+			 bo, file_priv->ctx.id, args->size, args->flags);
+	} else {
+		ivpu_dbg(vdev, BO, "Created userptr BO: handle=%u vpu_addr=0x%llx size=%llu flags=0x%x\n",
+			 args->handle, bo->vpu_addr, args->size, bo->flags);
+		args->vpu_addr = bo->vpu_addr;
+	}
+
+	drm_gem_object_put(&bo->base.base);
+
+	return ret;
+}
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 4ffc783426be..d128e8961688 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -430,7 +430,7 @@ static void ivpu_mmu_context_unmap_pages(struct ivpu_mmu_context *ctx, u64 vpu_a
 
 int
 ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
-			 u64 vpu_addr, struct sg_table *sgt,  bool llc_coherent)
+			 u64 vpu_addr, struct sg_table *sgt, bool llc_coherent, bool read_only)
 {
 	size_t start_vpu_addr = vpu_addr;
 	struct scatterlist *sg;
@@ -450,6 +450,8 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	prot = IVPU_MMU_ENTRY_MAPPED;
 	if (llc_coherent)
 		prot |= IVPU_MMU_ENTRY_FLAG_LLC_COHERENT;
+	if (read_only)
+		prot |= IVPU_MMU_ENTRY_FLAG_RO;
 
 	mutex_lock(&ctx->lock);
 
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index f255310968cf..663a11a9db11 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -42,7 +42,7 @@ int ivpu_mmu_context_insert_node(struct ivpu_mmu_context *ctx, const struct ivpu
 void ivpu_mmu_context_remove_node(struct ivpu_mmu_context *ctx, struct drm_mm_node *node);
 
 int ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
-			     u64 vpu_addr, struct sg_table *sgt, bool llc_coherent);
+			     u64 vpu_addr, struct sg_table *sgt, bool llc_coherent, bool read_only);
 void ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 				u64 vpu_addr, struct sg_table *sgt);
 int ivpu_mmu_context_set_pages_ro(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index e470b0221e02..264505d54f93 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -25,6 +25,7 @@ extern "C" {
 #define DRM_IVPU_CMDQ_CREATE              0x0b
 #define DRM_IVPU_CMDQ_DESTROY             0x0c
 #define DRM_IVPU_CMDQ_SUBMIT              0x0d
+#define DRM_IVPU_BO_CREATE_FROM_USERPTR	  0x0e
 
 #define DRM_IOCTL_IVPU_GET_PARAM                                               \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_GET_PARAM, struct drm_ivpu_param)
@@ -69,6 +70,10 @@ extern "C" {
 #define DRM_IOCTL_IVPU_CMDQ_SUBMIT                                             \
 	DRM_IOW(DRM_COMMAND_BASE + DRM_IVPU_CMDQ_SUBMIT, struct drm_ivpu_cmdq_submit)
 
+#define DRM_IOCTL_IVPU_BO_CREATE_FROM_USERPTR                        \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_BO_CREATE_FROM_USERPTR, \
+		 struct drm_ivpu_bo_create_from_userptr)
+
 /**
  * DOC: contexts
  *
@@ -127,6 +132,13 @@ extern "C" {
  * command queue destroy and submit job on specific command queue.
  */
 #define DRM_IVPU_CAP_MANAGE_CMDQ       3
+/**
+ * DRM_IVPU_CAP_BO_CREATE_FROM_USERPTR
+ *
+ * Driver supports creating buffer objects from user space memory pointers.
+ * This allows creating GEM buffers from existing user memory regions.
+ */
+#define DRM_IVPU_CAP_BO_CREATE_FROM_USERPTR	4
 
 /**
  * struct drm_ivpu_param - Get/Set VPU parameters
@@ -194,6 +206,7 @@ struct drm_ivpu_param {
 #define DRM_IVPU_BO_HIGH_MEM   DRM_IVPU_BO_SHAVE_MEM
 #define DRM_IVPU_BO_MAPPABLE   0x00000002
 #define DRM_IVPU_BO_DMA_MEM    0x00000004
+#define DRM_IVPU_BO_READ_ONLY  0x00000008
 
 #define DRM_IVPU_BO_CACHED     0x00000000
 #define DRM_IVPU_BO_UNCACHED   0x00010000
@@ -204,6 +217,7 @@ struct drm_ivpu_param {
 	(DRM_IVPU_BO_HIGH_MEM | \
 	 DRM_IVPU_BO_MAPPABLE | \
 	 DRM_IVPU_BO_DMA_MEM | \
+	 DRM_IVPU_BO_READ_ONLY | \
 	 DRM_IVPU_BO_CACHE_MASK)
 
 /**
@@ -255,6 +269,44 @@ struct drm_ivpu_bo_create {
 	__u64 vpu_addr;
 };
 
+/**
+ * struct drm_ivpu_bo_create_from_userptr - Create dma-buf from user pointer
+ *
+ * Create a GEM buffer object from a user pointer to a memory region.
+ */
+struct drm_ivpu_bo_create_from_userptr {
+	/** @user_ptr: User pointer to memory region (must be page aligned) */
+	__u64 user_ptr;
+
+	/** @size: Size of the memory region in bytes (must be page aligned) */
+	__u64 size;
+
+	/**
+	 * @flags:
+	 *
+	 * Supported flags:
+	 *
+	 * %DRM_IVPU_BO_HIGH_MEM:
+	 *
+	 * Allocate VPU address from >4GB range.
+	 *
+	 * %DRM_IVPU_BO_DMA_MEM:
+	 *
+	 * Allocate from DMA memory range accessible by hardware DMA.
+	 *
+	 * %DRM_IVPU_BO_READ_ONLY:
+	 *
+	 * Allocate as a read-only buffer object.
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
 /**
  * struct drm_ivpu_bo_info - Query buffer object info
  */
-- 
2.43.0

