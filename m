Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458633FECF4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 13:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7D6E503;
	Thu,  2 Sep 2021 11:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304CD6E500;
 Thu,  2 Sep 2021 11:28:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="219088342"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="219088342"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 04:28:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="542604268"
Received: from smirnov2-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.24])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 04:28:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/6] drm/i915 Implement LMEM backup and restore for suspend /
 resume
Date: Thu,  2 Sep 2021 13:28:21 +0200
Message-Id: <20210902112824.118524-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902112824.118524-1-thomas.hellstrom@linux.intel.com>
References: <20210902112824.118524-1-thomas.hellstrom@linux.intel.com>
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

Just evict unpinned objects to system. For pinned LMEM objects,
make a backup system object and blit the contents to that.

For now, for pinned objects, backup using gpu blits and restore using
memcpy except for occasional user-space objects which are restored
using gpu blits once the migration context is functional.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  46 +++++
 drivers/gpu/drm/i915/gem/i915_gem_pm.h        |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    | 195 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h    |  23 +++
 drivers/gpu/drm/i915/i915_drv.c               |   4 +-
 9 files changed, 289 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c36c8a4f0716..3379a0a6c91e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -155,6 +155,7 @@ gem-y += \
 	gem/i915_gem_throttle.o \
 	gem/i915_gem_tiling.o \
 	gem/i915_gem_ttm.o \
+	gem/i915_gem_ttm_pm.o \
 	gem/i915_gem_userptr.o \
 	gem/i915_gem_wait.o \
 	gem/i915_gemfs.o
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 2471f36aaff3..734cc8e16481 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -534,6 +534,7 @@ struct drm_i915_gem_object {
 	struct {
 		struct sg_table *cached_io_st;
 		struct i915_gem_object_page_iter get_io_page;
+		struct drm_i915_gem_object *backup;
 		bool created:1;
 	} ttm;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 8b9d7d14c4bd..e1be995d782b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -5,6 +5,7 @@
  */
 
 #include "gem/i915_gem_pm.h"
+#include "gem/i915_gem_ttm_pm.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_gt_requests.h"
@@ -39,6 +40,32 @@ void i915_gem_suspend(struct drm_i915_private *i915)
 	i915_gem_drain_freed_objects(i915);
 }
 
+int i915_gem_backup_suspend(struct drm_i915_private *i915)
+{
+	struct intel_memory_region *mr;
+	int ret = 0, id;
+
+	for_each_memory_region(mr, i915, id) {
+		if (mr->type == INTEL_MEMORY_LOCAL) {
+			ret = i915_ttm_backup_region(mr);
+			if (ret)
+				break;
+		}
+	}
+
+	if (!ret) {
+		i915_gem_suspend(i915);
+		return 0;
+	}
+
+	for_each_memory_region(mr, i915, id) {
+		if (mr->type == INTEL_MEMORY_LOCAL)
+			i915_ttm_recover_region(mr);
+	}
+
+	return ret;
+}
+
 void i915_gem_suspend_late(struct drm_i915_private *i915)
 {
 	struct drm_i915_gem_object *obj;
@@ -128,12 +155,31 @@ int i915_gem_freeze_late(struct drm_i915_private *i915)
 
 void i915_gem_resume(struct drm_i915_private *i915)
 {
+	int ret, id;
+	struct intel_memory_region *mr;
+
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
 
+	for_each_memory_region(mr, i915, id) {
+		if (mr->type == INTEL_MEMORY_LOCAL) {
+			ret = i915_ttm_restore_region(mr, true);
+			if (ret)
+				WARN_ON(ret);
+		}
+	}
+
 	/*
 	 * As we didn't flush the kernel context before suspend, we cannot
 	 * guarantee that the context image is complete. So let's just reset
 	 * it and start again.
 	 */
 	intel_gt_resume(&i915->gt);
+
+	for_each_memory_region(mr, i915, id) {
+		if (mr->type == INTEL_MEMORY_LOCAL) {
+			ret = i915_ttm_restore_region(mr, false);
+			if (ret)
+				WARN_ON(ret);
+		}
+	}
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.h b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
index c9a66630e92e..bedf1e95941a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
@@ -18,6 +18,7 @@ void i915_gem_idle_work_handler(struct work_struct *work);
 
 void i915_gem_suspend(struct drm_i915_private *i915);
 void i915_gem_suspend_late(struct drm_i915_private *i915);
+int i915_gem_backup_suspend(struct drm_i915_private *i915);
 
 int i915_gem_freeze(struct drm_i915_private *i915);
 int i915_gem_freeze_late(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index df2dcbad1eb9..a9d3592ca884 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -10,10 +10,11 @@
 #include "intel_memory_region.h"
 #include "intel_region_ttm.h"
 
+#include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_object.h"
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_ttm.h"
-#include "gem/i915_gem_mman.h"
+#include "gem/i915_gem_ttm_pm.h"
 
 #include "gt/intel_migrate.h"
 #include "gt/intel_engine_pm.h"
@@ -64,6 +65,20 @@ static struct ttm_placement i915_sys_placement = {
 	.busy_placement = &sys_placement_flags,
 };
 
+/**
+ * i915_ttm_sys_placement - Return the struct ttm_placement to be
+ * used for an object in system memory.
+ *
+ * Rather than making the struct extern, use this
+ * function.
+ *
+ * Return: A pointer to a static variable for sys placement.
+ */
+struct ttm_placement *i915_ttm_sys_placement(void)
+{
+	return &i915_sys_placement;
+}
+
 static int i915_ttm_err_to_gem(int err)
 {
 	/* Fastpath */
@@ -890,6 +905,7 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
+	i915_ttm_backup_free(obj);
 	i915_gem_object_release_memory_region(obj);
 	mutex_destroy(&obj->ttm.get_io_page.lock);
 	if (obj->ttm.created)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 34ac78d47b0d..8ec8c3511308 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -50,4 +50,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 			  struct drm_i915_gem_object *src,
 			  bool allow_accel, bool intr);
+
+/* Internal I915 TTM functions below. */
+struct ttm_placement *i915_ttm_sys_placement(void);
+
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
new file mode 100644
index 000000000000..333aa753a723
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <linux/list.h>
+#include <linux/scatterlist.h>
+
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_tt.h>
+
+#include "i915_drv.h"
+#include "intel_memory_region.h"
+#include "intel_region_ttm.h"
+
+#include "gem/i915_gem_region.h"
+#include "gem/i915_gem_ttm.h"
+#include "gem/i915_gem_ttm_pm.h"
+
+/**
+ * i915_ttm_backup_free - Free any backup attached to this object
+ * @obj: The object whose backup is to be freed.
+ */
+void i915_ttm_backup_free(struct drm_i915_gem_object *obj)
+{
+	if (obj->ttm.backup) {
+		i915_gem_object_put(obj->ttm.backup);
+		obj->ttm.backup = NULL;
+	}
+}
+
+static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
+			   struct drm_i915_gem_object *obj)
+{
+	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	struct ttm_buffer_object *backup_bo;
+	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915), bdev);
+	struct intel_memory_region *sys_region;
+	struct drm_i915_gem_object *backup;
+	struct ttm_operation_ctx ctx = {};
+	int err = 0;
+
+	if (i915_gem_object_evictable(obj))
+		return ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
+
+	sys_region = i915->mm.regions[INTEL_REGION_SMEM];
+	backup = i915_gem_object_create_region(sys_region,
+					       obj->base.size,
+					       0, 0);
+	if (IS_ERR(backup))
+		return PTR_ERR(backup);
+
+	err = i915_gem_object_lock(backup, apply->ww);
+	if (err)
+		goto out_no_lock;
+
+	backup_bo = i915_gem_to_ttm(backup);
+	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
+	if (err)
+		goto out_no_populate;
+
+	err = i915_gem_obj_copy_ttm(backup, obj, true, false);
+	GEM_WARN_ON(err);
+
+	obj->ttm.backup = backup;
+	return 0;
+
+out_no_populate:
+	i915_gem_ww_unlock_single(backup);
+out_no_lock:
+	i915_gem_object_put(backup);
+
+	return err;
+}
+
+static int i915_ttm_recover(struct i915_gem_apply_to_region *apply,
+			    struct drm_i915_gem_object *obj)
+{
+	i915_ttm_backup_free(obj);
+	return 0;
+}
+
+/**
+ * i915_ttm_recover_region - Free the backup of all objects of a region
+ * @mr: The memory region
+ *
+ * Checks all objects of a region if there is backup attached and if so
+ * frees that backup. Typically this is called to recover after a partially
+ * performed backup.
+ */
+void i915_ttm_recover_region(struct intel_memory_region *mr)
+{
+	static const struct i915_gem_apply_to_region_ops recover_ops = {
+		.process_obj = i915_ttm_recover,
+	};
+	struct i915_gem_apply_to_region apply = {.ops = &recover_ops};
+	int ret;
+
+	ret = i915_gem_process_region(mr, &apply);
+	GEM_WARN_ON(ret);
+}
+
+/**
+ * i915_ttm_backup_region - Back up all objects of a region to smem.
+ * @mr: The memory region
+ * Loops over all objects of a region and either evicts them if they are
+ * evictable or backs them up using a backup object if they are pinned.
+ *
+ * Return: Zero on success. Negative error code on error.
+ */
+int i915_ttm_backup_region(struct intel_memory_region *mr)
+{
+	static const struct i915_gem_apply_to_region_ops backup_ops = {
+		.process_obj = i915_ttm_backup,
+	};
+	struct i915_gem_apply_to_region apply = {.ops = &backup_ops};
+	int ret;
+
+	ret = i915_gem_process_region(mr, &apply);
+	if (ret)
+		i915_ttm_recover_region(mr);
+
+	return ret;
+}
+
+/**
+ * struct i915_gem_ttm_pm_apply - Apply-to-region subclass for restore
+ * @base: The i915_gem_apply_to_region we derive from.
+ * @early_restore: Whether this is an early restore using memcpy only.
+ */
+struct i915_gem_ttm_pm_apply {
+	struct i915_gem_apply_to_region base;
+	bool early_restore;
+};
+
+static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
+			    struct drm_i915_gem_object *obj)
+{
+	struct i915_gem_ttm_pm_apply *pm_apply =
+		container_of(apply, typeof(*pm_apply), base);
+	struct drm_i915_gem_object *backup = obj->ttm.backup;
+	struct ttm_buffer_object *backup_bo = i915_gem_to_ttm(backup);
+	struct ttm_operation_ctx ctx = {};
+	int err;
+
+	if (!obj->ttm.backup)
+		return 0;
+
+	if (pm_apply->early_restore && (obj->flags & I915_BO_ALLOC_USER))
+		return 0;
+
+	err = i915_gem_object_lock(backup, apply->ww);
+	if (err)
+		return err;
+
+	/* Content may have been swapped. */
+	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
+	if (!err) {
+		err = i915_gem_obj_copy_ttm(obj, backup, !pm_apply->early_restore,
+					    false);
+		GEM_WARN_ON(err);
+
+		obj->ttm.backup = NULL;
+		err = 0;
+	}
+
+	i915_gem_ww_unlock_single(backup);
+	i915_gem_object_put(backup);
+
+	return err;
+}
+
+/**
+ * i915_ttm_restore_region - Back up all objects of a region to smem.
+ * @mr: The memory region
+ * @early: Whether to use memcpy only for early restore.
+ *
+ * Loops over all objects of a region and either evicts them if they are
+ * evictable or backs them up using a backup object if they are pinned.
+ *
+ * Return: Zero on success. Negative error code on error.
+ */
+int i915_ttm_restore_region(struct intel_memory_region *mr,
+			    bool early)
+{
+	static const struct i915_gem_apply_to_region_ops restore_ops = {
+		.process_obj = i915_ttm_restore,
+	};
+	struct i915_gem_ttm_pm_apply pm_apply = {
+		.base = {.ops = &restore_ops},
+		.early_restore = early,
+	};
+
+	return i915_gem_process_region(mr, &pm_apply.base);
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
new file mode 100644
index 000000000000..db75aa3ed4eb
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _I915_GEM_TTM_PM_H_
+#define _I915_GEM_TTM_PM_H_
+
+#include <linux/types.h>
+
+struct intel_memory_region;
+struct drm_i915_gem_object;
+
+int i915_ttm_backup_region(struct intel_memory_region *mr);
+
+void i915_ttm_recover_region(struct intel_memory_region *mr);
+
+int i915_ttm_restore_region(struct intel_memory_region *mr, bool early);
+
+/* Internal I915 TTM functions below. */
+void i915_ttm_backup_free(struct drm_i915_gem_object *obj);
+
+#endif
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 59fb4c710c8c..d452989d7d5e 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1096,9 +1096,7 @@ static int i915_drm_prepare(struct drm_device *dev)
 	 * split out that work and pull it forward so that after point,
 	 * the GPU is not woken again.
 	 */
-	i915_gem_suspend(i915);
-
-	return 0;
+	return i915_gem_backup_suspend(i915);
 }
 
 static int i915_drm_suspend(struct drm_device *dev)
-- 
2.31.1

