Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E5891F12
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 15:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6A1112768;
	Fri, 29 Mar 2024 14:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avAX57ZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32110F5BB;
 Fri, 29 Mar 2024 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711724262; x=1743260262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uEpCuP/I8pabQJ5rQ9vQijO4ZLfcQiY3gyuHkV6zsHQ=;
 b=avAX57ZGphbNw0Z85Zb4HHlXg+9fDDbtblBh5v6ow1gCMiS3XFDyyRAa
 SXu7Z2wCp9upaxL3MW8gVtsaNr8uF5DFuJCXq/KfXvpa5AcT8DfukWL5B
 tBF81SmI7a/gG1rjzrh2SX2bRTYpP9MQr9Qzk2trThCkL0b/NJvTrqyqJ
 q39yRl7J0QZgLJ9i4tApLp4YCguWSvYaiskD1YjP7R2ArrDOcIvDwTZ4c
 R276sg6xR7HIralwGDWu5XPvBt0d3ibKijpLZibIQMN8Zy6+2tJZ9ap9m
 yqwHurmfrUmELJWYmBJbhDz9sPneNs6nzXC5XOzzEzKerkL7PIHcu24kf g==;
X-CSE-ConnectionGUID: J0UQSriSQcGNG3w183ImOA==
X-CSE-MsgGUID: Y+aCDl3gR+KCJWUY+F/mNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7023687"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7023687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="47962426"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.13])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 7/8] drm/xe, drm/ttm: Provide a generic LRU walker helper
Date: Fri, 29 Mar 2024 15:57:06 +0100
Message-ID: <20240329145707.3087-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
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

Export the needed functions from TTM and provide a generic LRU
walker in xe, in the spirit of drm_gem_lru_scan() but building
on the restartable TTM LRU functionality.

The LRU walker optionally supports locking objects as part of
a drm_exec locking transaction, and can thus be used for both
exhaustive eviction and shrinking. And, in fact, direct
shrinking in the case where we fail to populate system memory
objects and want to retry by shrinking purgeable or evictable
local objects, which a shrinker is not capable of doing.

The LRU walker helper can easily be moved to TTM when / if used
by other drivers.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c  |   3 +
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_ttm_helpers.c | 150 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h |  60 +++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 89f19fb6e2b3..4cad467983f8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -106,6 +106,7 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
 	ttm_resource_cursor_fini_locked(cursor);
 	spin_unlock(lru_lock);
 }
+EXPORT_SYMBOL(ttm_resource_cursor_fini);
 
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
@@ -635,6 +636,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 
 	return NULL;
 }
+EXPORT_SYMBOL(ttm_resource_manager_next);
 
 /**
  * ttm_resource_manager_first() - Start iterating over the resources
@@ -661,6 +663,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 
 	return ttm_resource_manager_next(cursor);
 }
+EXPORT_SYMBOL(ttm_resource_manager_first);
 
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
 					  struct iosys_map *dmap,
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 705c0eaf6e71..ecd7dde9cbbe 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -133,6 +133,7 @@ xe-y += xe_bb.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_trace.o \
+	xe_ttm_helpers.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_ttm_helpers.c b/drivers/gpu/drm/xe/xe_ttm_helpers.c
new file mode 100644
index 000000000000..7b08bfd912c8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/drm_exec.h>
+
+#include "xe_ttm_helpers.h"
+
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_device.h>
+
+static bool xe_ttm_lru_walk_trylock(struct xe_ttm_lru_walk *walk,
+				    struct ttm_buffer_object *bo,
+				    bool *needs_unlock)
+{
+	struct ttm_operation_ctx *ctx = walk->ctx;
+
+	*needs_unlock = false;
+
+	if (!walk->exec && dma_resv_trylock(bo->base.resv)) {
+		*needs_unlock = true;
+		return true;
+	}
+
+	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
+		dma_resv_assert_held(bo->base.resv);
+		return true;
+	}
+
+	return false;
+}
+
+static void xe_ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
+{
+	if (locked)
+		dma_resv_unlock(bo->base.resv);
+}
+
+/**
+ * xe_ttm_lru_walk_for_evict() - Perform a LRU list walk, with actions taken on
+ * valid items.
+ * @walk: describe the walks and actions taken
+ * @bdev: The TTM device.
+ * @man: The struct ttm_resource manager whose LRU lists we're walking.
+ * @mem_type: The memory type associated with @man.
+ * @target: The end condition for the walk.
+ *
+ * The LRU lists of @man are walk, and for each struct ttm_resource encountered,
+ * the corresponding ttm_buffer_object is locked and taken a reference on, and
+ * the LRU lock is dropped. the LRU lock may be dropped before locking and, in
+ * that case, it's verified that the item actually remains on the LRU list after
+ * the lock, and that the buffer object hasn't changed.
+ *
+ * With a locked object, the actions indicated by @walk->allow_bo() and
+ * @walk->process_bo are performed. (RFC: Combine these?), and after that, the
+ * bo is unlocked, the refcount dropped and the next struct ttm_resource is
+ * processed. Here we rely on TTM's restartable LRU list implementation.
+ *
+ * Typically @walk->process_bo() would return the number of pages evicted, and
+ * that when the total exceeds @target, or when the LRU list has been walked
+ * in full, iteration is terminated. It's also terminated on error.
+ *
+ * Buffer object dma_resv locking:
+ * This locking is performed using the combined interpretation of @walk->exec and
+ * @walk->ctx according to the following.
+ * 1) Sleeping locks: Sleeping locks are used exclusively if @walk->exec is true.
+ * The buffer object are not unlocked. That is the caller's responsibility.
+ * 2) Assuming bo is already locked: This assumption is made iff @walk->exec is false,
+ * @walk->ctx->allow_res_evict is true and bo->base.resv == @walk->ctx->resv.
+ * This is for cases where it is desired to evict bos sharing a reservation lock
+ * that is already held by the process. Thes bo locks are not unlocked during
+ * the walk.
+ * 3) Trylocking. Trylocking is done in all other cases. If trylocking fails, the
+ * iteration skips the current item and continues. Trylocks are always unlocked
+ * by the walk.
+ *
+ * Note that the way dma_resv individualization is done, locking needs to be done
+ * either with the LRU lock held (trylocking only) or with a reference on the
+ * object.
+ *
+ * Return: (Typically) The number of pages evicted or negative error code on error.
+ */
+long xe_ttm_lru_walk_for_evict(struct xe_ttm_lru_walk *walk, struct ttm_device *bdev,
+			       struct ttm_resource_manager *man, unsigned int mem_type,
+			       long target)
+{
+	struct drm_exec *exec = walk->exec;
+	struct ttm_resource_cursor cursor;
+	struct ttm_resource *res;
+	long sofar = 0;
+	long lret;
+	int ret;
+
+	spin_lock(&bdev->lru_lock);
+	ttm_resource_manager_for_each_res(man, &cursor, res) {
+		struct ttm_buffer_object *bo = res->bo;
+		bool bo_needs_unlock = false;
+		bool bo_locked = false;
+
+		if (!bo || bo->resource != res)
+			continue;
+
+		if (xe_ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+			bo_locked = true;
+		else if (!exec)
+			continue;
+
+		if (!ttm_bo_get_unless_zero(bo)) {
+			xe_ttm_lru_walk_unlock(bo, bo_needs_unlock);
+			continue;
+		}
+
+		spin_unlock(&bdev->lru_lock);
+
+		if (!bo_locked) {
+			ret = drm_exec_lock_obj(exec, &bo->base);
+			if (ret)
+				ttm_bo_put(bo);
+		}
+
+		lret = 0;
+
+		/*
+		 * Note that in between the release of the lru lock and the
+		 * drm_exec_lock_obj, the bo may have switched resource,
+		 * and also memory type. In that case we just skip it.
+		 */
+		if (bo->resource == res && res->mem_type == mem_type &&
+		    walk->ops->allow_bo(walk, bo, mem_type))
+			lret = walk->ops->process_bo(walk, bo);
+
+		xe_ttm_lru_walk_unlock(bo, bo_needs_unlock);
+		ttm_bo_put(bo);
+		if (lret < 0) {
+			sofar = lret;
+			goto out;
+		}
+
+		sofar += lret;
+		if (sofar >= target)
+			goto out;
+
+		spin_lock(&bdev->lru_lock);
+	}
+	spin_unlock(&bdev->lru_lock);
+out:
+	ttm_resource_cursor_fini(&cursor);
+	return sofar;
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_helpers.h b/drivers/gpu/drm/xe/xe_ttm_helpers.h
new file mode 100644
index 000000000000..a52887ce0241
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_TTM_HELPERS_H_
+#define _XE_TTM_HELPERS_H_
+
+#include <linux/types.h>
+
+struct drm_exec;
+struct ttm_device;
+struct ttm_buffer_object;
+struct ttm_operation_ctx;
+struct ttm_resource_manager;
+
+struct xe_ttm_lru_walk;
+
+/** struct xe_ttm_lru_walk_ops - Operations for a LRU walk. */
+struct xe_ttm_lru_walk_ops {
+	/**
+	 * allow_bo - Allow calling @process_bo for this bo.
+	 * @walk: struct xe_ttm_lru_walk describing the walk.
+	 * @bo: A locked and referenced buffer object.
+	 * @mem_type: The memory type of the LRU list.
+	 *
+	 * RFC: Combine these two functions?
+	 *
+	 * Return: true if @process_bo should be called, @false otherwise.
+	 */
+	bool (*allow_bo)(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+			 unsigned int mem_type);
+
+	/**
+	 * process_bo - Process this bo.
+	 * @walk: struct xe_ttm_lru_walk describing the walk.
+	 * @bo: A locked and referenced buffer object.
+	 *
+	 * Return: Negative error code on error, Number of processed pages on
+	 * success. 0 also indicates success.
+	 */
+	long (*process_bo)(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo);
+};
+
+/**
+ * struct xe_ttm_lru_walk - Structure describing a LRU walk.
+ * @ops: Pointer to the ops structure.
+ * @ctx: Pointer to the struct ttm_operation_ctx.
+ * @exec: The struct drm_exec context for the WW transaction if any.
+ */
+struct xe_ttm_lru_walk {
+	const struct xe_ttm_lru_walk_ops *ops;
+	struct ttm_operation_ctx *ctx;
+	struct drm_exec *exec;
+};
+
+long xe_ttm_lru_walk_for_evict(struct xe_ttm_lru_walk *walk, struct ttm_device *bdev,
+			       struct ttm_resource_manager *man, unsigned int mem_type,
+			       long target);
+#endif
-- 
2.44.0

