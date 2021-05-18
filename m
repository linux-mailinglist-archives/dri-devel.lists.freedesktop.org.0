Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B63873FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9206EACA;
	Tue, 18 May 2021 08:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BDA6EACB;
 Tue, 18 May 2021 08:28:04 +0000 (UTC)
IronPort-SDR: AaVz2JTM6qtoj143COMw4bnX8GnGmOxMsnB6/dWoyaPPtdBXqlfSXsJecXAYV/PcwFuJGRijC6
 5960qaDEbJUw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197572762"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="197572762"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:28:03 -0700
IronPort-SDR: yeBkCkrM0OXl4PtVfz7Da+e7ZYGNMXKpUPIHGYctVW717CltpyXhIjdu7pQqoUKB2b1HEIOa3+
 S5rik7uSG7eQ==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="611892403"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/15] drm/i915: Use ttm mmap handling for ttm bo's.
Date: Tue, 18 May 2021 10:27:00 +0200
Message-Id: <20210518082701.997251-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Use the ttm handlers for servicing page faults, and vm_access.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  17 ++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h      |   2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 105 +++++++++++++++++-
 4 files changed, 118 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 65db290efd16..2bf89349dde9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -19,6 +19,7 @@
 #include "i915_gem_mman.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
+#include "i915_gem_ttm.h"
 #include "i915_vma.h"
 
 static inline bool
@@ -789,7 +790,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	return __assign_mmap_offset(file, args->handle, type, &args->offset);
 }
 
-static void vm_open(struct vm_area_struct *vma)
+void i915_gem_mmap_vm_open(struct vm_area_struct *vma)
 {
 	struct i915_mmap_offset *mmo = vma->vm_private_data;
 	struct drm_i915_gem_object *obj = mmo->obj;
@@ -798,7 +799,7 @@ static void vm_open(struct vm_area_struct *vma)
 	i915_gem_object_get(obj);
 }
 
-static void vm_close(struct vm_area_struct *vma)
+void i915_gem_mmap_vm_close(struct vm_area_struct *vma)
 {
 	struct i915_mmap_offset *mmo = vma->vm_private_data;
 	struct drm_i915_gem_object *obj = mmo->obj;
@@ -810,15 +811,15 @@ static void vm_close(struct vm_area_struct *vma)
 static const struct vm_operations_struct vm_ops_gtt = {
 	.fault = vm_fault_gtt,
 	.access = vm_access,
-	.open = vm_open,
-	.close = vm_close,
+	.open = i915_gem_mmap_vm_open,
+	.close = i915_gem_mmap_vm_close,
 };
 
 static const struct vm_operations_struct vm_ops_cpu = {
 	.fault = vm_fault_cpu,
 	.access = vm_access,
-	.open = vm_open,
-	.close = vm_close,
+	.open = i915_gem_mmap_vm_open,
+	.close = i915_gem_mmap_vm_close,
 };
 
 static int singleton_release(struct inode *inode, struct file *file)
@@ -953,6 +954,10 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	}
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
+	/* override ops per-object if desired */
+	if (obj->ops->mmap_ops)
+		vma->vm_ops = obj->ops->mmap_ops;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index efee9e0d2508..e5bd02a6db12 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -28,5 +28,7 @@ void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 
 void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
+void i915_gem_mmap_vm_open(struct vm_area_struct *vma);
+void i915_gem_mmap_vm_close(struct vm_area_struct *vma);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index b350765e1935..31d828e91cf4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -79,6 +79,7 @@ struct drm_i915_gem_object_ops {
 	void (*delayed_free)(struct drm_i915_gem_object *obj);
 	void (*release)(struct drm_i915_gem_object *obj);
 
+	const struct vm_operations_struct *mmap_ops;
 	const char *name; /* friendly name for debug, e.g. lockdep classes */
 };
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 790f5ec45c4d..fe9ac50b2470 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -14,6 +14,7 @@
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_ttm.h"
 #include "gem/i915_gem_ttm_bo_util.h"
+#include "gem/i915_gem_mman.h"
 
 #define I915_PL_LMEM0 TTM_PL_PRIV
 #define I915_PL_SYSTEM TTM_PL_SYSTEM
@@ -345,6 +346,44 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	return 0;
 }
 
+static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
+{
+	if (mem->mem_type < I915_PL_LMEM0)
+		return 0;
+
+	/* We may need to revisit this later, but this allows all caching to be used in mmap */
+	mem->bus.caching = ttm_cached;
+	mem->bus.is_iomem = true;
+
+	return 0;
+}
+
+static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
+					 unsigned long page_offset)
+{
+	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	struct sg_table *sgt = obj->ttm.cached_io_st;
+	struct scatterlist *sg;
+	unsigned int i;
+
+	GEM_WARN_ON(bo->ttm);
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		unsigned long sg_max = sg->length >> PAGE_SHIFT;
+
+		if (page_offset < sg_max) {
+			unsigned long base =
+				obj->mm.region->iomap.base - obj->mm.region->region.start;
+
+			return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + page_offset;
+		}
+
+		page_offset -= sg_max;
+	}
+	GEM_BUG_ON(1);
+	return 0;
+}
+
 struct ttm_device_funcs i915_ttm_bo_driver = {
 	.ttm_tt_create = i915_ttm_tt_create,
 	.ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
@@ -355,6 +394,8 @@ struct ttm_device_funcs i915_ttm_bo_driver = {
 	.verify_access = NULL,
 	.swap_notify = i915_ttm_swap_notify,
 	.delete_mem_notify = i915_ttm_delete_mem_notify,
+	.io_mem_reserve = i915_ttm_io_mem_reserve,
+	.io_mem_pfn = i915_ttm_io_mem_pfn,
 };
 
 static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
@@ -454,7 +495,68 @@ static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 	ttm_bo_put(i915_gem_to_ttm(obj));
 }
 
-static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
+static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
+{
+	struct vm_area_struct *area = vmf->vma;
+	struct i915_mmap_offset *mmo = area->vm_private_data;
+	struct drm_i915_gem_object *obj = mmo->obj;
+	vm_fault_t ret;
+
+	/* Sanity check that we allow writing into this object */
+	if (unlikely(i915_gem_object_is_readonly(obj) &&
+		     area->vm_flags & VM_WRITE))
+		return VM_FAULT_SIGBUS;
+
+	ret = ttm_bo_vm_reserve(i915_gem_to_ttm(obj), vmf);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_vm_fault_reserved(i915_gem_to_ttm(obj), vmf,
+				       drm_vma_node_start(&mmo->vma_node),
+				       vmf->vma->vm_page_prot,
+				       TTM_BO_VM_NUM_PREFAULT, 1);
+	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+		return ret;
+
+	dma_resv_unlock(obj->base.resv);
+
+	return ret;
+}
+
+static int
+vm_access_ttm(struct vm_area_struct *area, unsigned long addr,
+	  void *buf, int len, int write)
+{
+	struct i915_mmap_offset *mmo = area->vm_private_data;
+	struct drm_i915_gem_object *obj = mmo->obj;
+	int err = 0;
+
+	if (i915_gem_object_is_readonly(obj) && write)
+		return -EACCES;
+
+	addr -= area->vm_start;
+	if (addr >= obj->base.size)
+		return -EINVAL;
+
+	err = i915_gem_object_lock_interruptible(obj, NULL);
+	if (err)
+		return err;
+
+	len = ttm_bo_vm_access_reserved(i915_gem_to_ttm(obj), area,
+					addr, buf, len, write);
+	i915_gem_object_unlock(obj);
+
+	return len;
+}
+
+static const struct vm_operations_struct vm_ops_ttm = {
+	.fault = vm_fault_ttm,
+	.access = vm_access_ttm,
+	.open = i915_gem_mmap_vm_open,
+	.close = i915_gem_mmap_vm_close,
+};
+
+const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
 	.flags = I915_GEM_OBJECT_HAS_IOMEM,
 
@@ -463,6 +565,7 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.truncate = i915_ttm_purge,
 	.adjust_lru = i915_ttm_adjust_lru,
 	.delayed_free = i915_ttm_delayed_free,
+	.mmap_ops = &vm_ops_ttm,
 };
 
 void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
-- 
2.31.1

