Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D8ACCF99B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6401E10EF3B;
	Fri, 19 Dec 2025 11:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mddBUj1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B4F10EF3A;
 Fri, 19 Dec 2025 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144098; x=1797680098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xQ7u21HxQR4NpyFIOrtr5gzN788rRtnYtR1qnAD/HWI=;
 b=mddBUj1xNKSeS/h8kaDiO4SqkH8USlfXy3csy6KjREBlm5Ml2G10Fvrf
 mwRjiCA7HCT2f4bvDhtUFYi4l4CHQVfshInvdZOCvYr6p3LI449WERfj8
 s5TS2h8jW0vlDgsVvHbYupZUptsWcod7+05tDBWjccOgOL8fE3JMchMvF
 tfKfujccLw9a7iN7AEyJGA49dKJv58I7CzYmC8f9feN3f7fj+GGUAPF6Z
 xFF7EbXZKj25Cvo/1emJp3WTxh6vN6Y8alP0K6vO3okWSjcK6zqSV4amE
 Fc0G0q4P1DjU+o/LUEAdIwl0M0Ax5HwrJkQLgG3t58VNI75LRwfyBhun9 A==;
X-CSE-ConnectionGUID: RUnJcSp4TuqttNV4qy+zfw==
X-CSE-MsgGUID: 8RnlnIB7QviVGkMqHulX9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224575"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:58 -0800
X-CSE-ConnectionGUID: QlTBeU8VTgyDycqwgtBacQ==
X-CSE-MsgGUID: jqpByR/iQx26OKi3OYyVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005728"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:54 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 15/24] drm/xe/uapi: Extend the madvise functionality to
 support foreign pagemap placement for svm
Date: Fri, 19 Dec 2025 12:33:11 +0100
Message-ID: <20251219113320.183860-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use device file descriptors and regions to represent pagemaps on
foreign or local devices.

The underlying files are type-checked at madvise time, and
references are kept on the drm_pagemap as long as there is are
madvises pointing to it.

Extend the madvise preferred_location UAPI to support the region
instance to identify the foreign placement.

v2:
- Improve UAPI documentation. (Matt Brost)
- Sanitize preferred_mem_loc.region_instance madvise. (Matt Brost)
- Clarify madvise drm_pagemap vs xe_pagemap refcounting. (Matt Brost)
- Don't allow a foreign drm_pagemap madvise without a fast
  interconnect.
v3:
- Add a comment about reference-counting in xe_devmem_open() and
  remove the reference-count get-and-put. (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 14 +++++
 drivers/gpu/drm/xe/xe_device.h     |  2 +
 drivers/gpu/drm/xe/xe_svm.c        | 75 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h        |  7 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 86 ++++++++++++++++++++++++++----
 include/uapi/drm/xe_drm.h          | 18 +++++--
 6 files changed, 188 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8c12c12c27f6..951387d54295 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -378,6 +378,20 @@ static const struct file_operations xe_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
+/**
+ * xe_is_xe_file() - Is the file an xe device file?
+ * @file: The file.
+ *
+ * Checks whether the file is opened against
+ * an xe device.
+ *
+ * Return: %true if an xe file, %false if not.
+ */
+bool xe_is_xe_file(const struct file *file)
+{
+	return file->f_op == &xe_driver_fops;
+}
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6604b89330d5..3e72fa4609f8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -200,6 +200,8 @@ void xe_file_put(struct xe_file *xef);
 
 int xe_is_injection_active(void);
 
+bool xe_is_xe_file(const struct file *file);
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index df26203b25e2..0484044091cf 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1813,6 +1813,75 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
 	return 0;
 }
 
+static struct drm_pagemap *xe_devmem_open(struct xe_device *xe, u32 region_instance)
+{
+	u32 tile_id = region_instance - 1;
+	struct xe_pagemap *xpagemap;
+	struct xe_vram_region *vr;
+
+	if (tile_id >= xe->info.tile_count)
+		return ERR_PTR(-ENOENT);
+
+	if (!((BIT(tile_id) << 1) & xe->info.mem_region_mask))
+		return ERR_PTR(-ENOENT);
+
+	vr = xe_tile_to_vr(&xe->tiles[tile_id]);
+
+	/* Returns a reference-counted embedded struct drm_pagemap */
+	xpagemap = xe_pagemap_find_or_create(xe, vr->dpagemap_cache, vr);
+	if (IS_ERR(xpagemap))
+		return ERR_CAST(xpagemap);
+
+	return &xpagemap->dpagemap;
+}
+
+/**
+ * xe_drm_pagemap_from_fd() - Return a drm_pagemap pointer from a
+ * (file_descriptor, region_instance) pair.
+ * @fd: An fd opened against an xe device.
+ * @region_instance: The region instance representing the device memory
+ * on the opened xe device.
+ *
+ * Opens a struct drm_pagemap pointer on the
+ * indicated device and region_instance.
+ *
+ * Return: A reference-counted struct drm_pagemap pointer on success,
+ * negative error pointer on failure.
+ */
+struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
+{
+	struct drm_pagemap *dpagemap;
+	struct file *file;
+	struct drm_file *fpriv;
+	struct drm_device *drm;
+	int idx;
+
+	if (fd <= 0)
+		return ERR_PTR(-EINVAL);
+
+	file = fget(fd);
+	if (!file)
+		return ERR_PTR(-ENOENT);
+
+	if (!xe_is_xe_file(file)) {
+		dpagemap = ERR_PTR(-ENOENT);
+		goto out;
+	}
+
+	fpriv = file->private_data;
+	drm = fpriv->minor->dev;
+	if (!drm_dev_enter(drm, &idx)) {
+		dpagemap = ERR_PTR(-ENODEV);
+		goto out;
+	}
+
+	dpagemap = xe_devmem_open(to_xe_device(drm), region_instance);
+	drm_dev_exit(idx);
+out:
+	fput(file);
+	return dpagemap;
+}
+
 #else
 
 int xe_pagemap_shrinker_create(struct xe_device *xe)
@@ -1836,6 +1905,12 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 {
 	return NULL;
 }
+
+struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index a003f571c82a..ec7c6751cc86 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -187,6 +187,8 @@ int xe_pagemap_shrinker_create(struct xe_device *xe);
 
 int xe_pagemap_cache_create(struct xe_tile *tile);
 
+struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance);
+
 #else
 #include <linux/interval_tree.h>
 #include "xe_vm.h"
@@ -378,6 +380,11 @@ static inline int xe_pagemap_cache_create(struct xe_tile *tile)
 	return 0;
 }
 
+static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 #define xe_svm_range_has_dma_mapping(...) false
 #endif /* CONFIG_DRM_XE_GPUSVM */
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index d6f47c8e146d..add9a6ca2390 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -22,6 +22,19 @@ struct xe_vmas_in_madvise_range {
 	bool has_svm_userptr_vmas;
 };
 
+/**
+ * struct xe_madvise_details - Argument to madvise_funcs
+ * @dpagemap: Reference-counted pointer to a struct drm_pagemap.
+ *
+ * The madvise IOCTL handler may, in addition to the user-space
+ * args, have additional info to pass into the madvise_func that
+ * handles the madvise type. Use a struct_xe_madvise_details
+ * for that and extend the struct as necessary.
+ */
+struct xe_madvise_details {
+	struct drm_pagemap *dpagemap;
+};
+
 static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
 {
 	u64 addr = madvise_range->addr;
@@ -74,7 +87,8 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
 
 static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 				      struct xe_vma **vmas, int num_vmas,
-				      struct drm_xe_madvise *op)
+				      struct drm_xe_madvise *op,
+				      struct xe_madvise_details *details)
 {
 	int i;
 
@@ -96,14 +110,18 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 			 * is of no use and can be ignored.
 			 */
 			loc->migration_policy = op->preferred_mem_loc.migration_policy;
+			drm_pagemap_put(loc->dpagemap);
 			loc->dpagemap = NULL;
+			if (details->dpagemap)
+				loc->dpagemap = drm_pagemap_get(details->dpagemap);
 		}
 	}
 }
 
 static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
-			   struct drm_xe_madvise *op)
+			   struct drm_xe_madvise *op,
+			   struct xe_madvise_details *details)
 {
 	struct xe_bo *bo;
 	int i;
@@ -144,7 +162,8 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 			      struct xe_vma **vmas, int num_vmas,
-			      struct drm_xe_madvise *op)
+			      struct drm_xe_madvise *op,
+			      struct xe_madvise_details *details)
 {
 	int i;
 
@@ -162,7 +181,8 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
-			     struct drm_xe_madvise *op);
+			     struct drm_xe_madvise *op,
+			     struct xe_madvise_details *details);
 
 static const madvise_func madvise_funcs[] = {
 	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
@@ -246,11 +266,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
 			return false;
 
-		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
-				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
+		if (XE_IOCTL_DBG(xe, fd <= DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
+				 args->preferred_mem_loc.region_instance != 0))
 			return false;
 
-		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
+				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
 			return false;
 
 		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.reserved))
@@ -296,6 +317,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 	return true;
 }
 
+static int xe_madvise_details_init(struct xe_vm *vm, const struct drm_xe_madvise *args,
+				   struct xe_madvise_details *details)
+{
+	struct xe_device *xe = vm->xe;
+
+	memset(details, 0, sizeof(*details));
+
+	if (args->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
+		int fd = args->preferred_mem_loc.devmem_fd;
+		struct drm_pagemap *dpagemap;
+
+		if (fd <= 0)
+			return 0;
+
+		dpagemap = xe_drm_pagemap_from_fd(args->preferred_mem_loc.devmem_fd,
+						  args->preferred_mem_loc.region_instance);
+		if (XE_IOCTL_DBG(xe, IS_ERR(dpagemap)))
+			return PTR_ERR(dpagemap);
+
+		/* Don't allow a foreign placement without a fast interconnect! */
+		if (XE_IOCTL_DBG(xe, dpagemap->pagemap->owner != vm->svm.peer.owner)) {
+			drm_pagemap_put(dpagemap);
+			return -ENOLINK;
+		}
+		details->dpagemap = dpagemap;
+	}
+
+	return 0;
+}
+
+static void xe_madvise_details_fini(struct xe_madvise_details *details)
+{
+	drm_pagemap_put(details->dpagemap);
+}
+
 static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
 				   int num_vmas, u32 atomic_val)
 {
@@ -349,6 +405,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct drm_xe_madvise *args = data;
 	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
 							 .range =  args->range, };
+	struct xe_madvise_details details;
 	struct xe_vm *vm;
 	struct drm_exec exec;
 	int err, attr_type;
@@ -373,13 +430,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		goto unlock_vm;
 	}
 
-	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	err = xe_madvise_details_init(vm, args, &details);
 	if (err)
 		goto unlock_vm;
 
+	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	if (err)
+		goto madv_fini;
+
 	err = get_vmas(vm, &madvise_range);
 	if (err || !madvise_range.num_vmas)
-		goto unlock_vm;
+		goto madv_fini;
 
 	if (madvise_range.has_bo_vmas) {
 		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
@@ -387,7 +448,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 						    madvise_range.num_vmas,
 						    args->atomic.val)) {
 				err = -EINVAL;
-				goto unlock_vm;
+				goto madv_fini;
 			}
 		}
 
@@ -413,7 +474,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	}
 
 	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
-	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
+	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
+				 &details);
 
 	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
 
@@ -425,6 +487,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		drm_exec_fini(&exec);
 	kfree(madvise_range.vmas);
 	madvise_range.vmas = NULL;
+madv_fini:
+	xe_madvise_details_fini(&details);
 unlock_vm:
 	up_write(&vm->lock);
 put_vm:
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 726e481574fe..bb69f9b30c7d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2123,7 +2123,13 @@ struct drm_xe_madvise {
 		struct {
 #define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
 #define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
-			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+			/**
+			 * @preferred_mem_loc.devmem_fd:
+			 * Device file-descriptor of the device where the
+			 * preferred memory is located, or one of the
+			 * above special values. Please also see
+			 * @preferred_mem_loc.region_instance below.
+			 */
 			__u32 devmem_fd;
 
 #define DRM_XE_MIGRATE_ALL_PAGES		0
@@ -2131,8 +2137,14 @@ struct drm_xe_madvise {
 			/** @preferred_mem_loc.migration_policy: Page migration policy */
 			__u16 migration_policy;
 
-			/** @preferred_mem_loc.pad : MBZ */
-			__u16 pad;
+			/**
+			 * @preferred_mem_loc.region_instance : Region instance.
+			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
+			 * Otherwise should point to the desired device
+			 * VRAM instance of the device indicated by
+			 * @preferred_mem_loc.devmem_fd.
+			 */
+			__u16 region_instance;
 
 			/** @preferred_mem_loc.reserved : Reserved */
 			__u64 reserved;
-- 
2.51.1

