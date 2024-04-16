Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B08A67C8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 12:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329210E80E;
	Tue, 16 Apr 2024 10:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeBDskPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6D510F7D8;
 Tue, 16 Apr 2024 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713262129; x=1744798129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dKjZVdOmSfxWPrh3L4N2dgakcYz0d0djWd+bBj9z5Mo=;
 b=eeBDskPnVelv2hE6aGQMYIGm/daV4jnc4TQn0ODyRE1B6uR1u0soVFQf
 qeDh0npyVPbSmnf30yZNvxM8QPCLGA9wWrqiFg8KT7KEYFRYusIrRtEpJ
 Lo17//UJ15Dvonlqvl8UKJvoJabJD6WimiqksVsH3nwHzjRX5Br/RJViw
 w1LjFKT3SKJQhKycW9V3MIw2Oo87ZygIvvvNLew08b7VpScWOo8gWIShs
 yhwFU/raNIONgwdKJ8jad9CW0DPtLC6ApH7bjgrNDKkixV8IHtAtF3Efi
 zBkOnfzDMVnKrV6XU2kmDYdjHKtLlKNKGpzcwHG6nxG86BkiyolyMfIil w==;
X-CSE-ConnectionGUID: yi/AlFMPTkOmRocUPwdlpg==
X-CSE-MsgGUID: jL9uwEzIS4+uiv6Vqxu/+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20112389"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="20112389"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:49 -0700
X-CSE-ConnectionGUID: 0F/MDirmTke45Q+nmUCB0g==
X-CSE-MsgGUID: IZ4ZmSC5RHeQVWJ6tGTs9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22620375"
Received: from fcgoea-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 8/9] drm/xe, drm/ttm: Provide a generic LRU walker helper
Date: Tue, 16 Apr 2024 12:07:29 +0200
Message-ID: <20240416100730.6666-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c  |   3 +
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_ttm_helpers.c | 149 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h |  47 +++++++++
 4 files changed, 200 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2b93727c78e5..cf5d4f3fa5ad 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -106,6 +106,7 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
 	ttm_resource_cursor_fini_locked(cursor);
 	spin_unlock(lru_lock);
 }
+EXPORT_SYMBOL(ttm_resource_cursor_fini);
 
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
@@ -626,6 +627,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 
 	return ttm_resource_manager_next(cursor);
 }
+EXPORT_SYMBOL(ttm_resource_manager_first);
 
 /**
  * ttm_resource_manager_next() - Continue iterating over the resource manager
@@ -663,6 +665,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 
 	return NULL;
 }
+EXPORT_SYMBOL(ttm_resource_manager_next);
 
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
 					  struct iosys_map *dmap,
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c46d145606f6..50613f0fe635 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -135,6 +135,7 @@ xe-y += xe_bb.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_trace.o \
+	xe_ttm_helpers.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_ttm_helpers.c b/drivers/gpu/drm/xe/xe_ttm_helpers.c
new file mode 100644
index 000000000000..92c951dee30d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.c
@@ -0,0 +1,149 @@
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
+		if (bo->resource == res && res->mem_type == mem_type)
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
index 000000000000..080eecb65a80
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.h
@@ -0,0 +1,47 @@
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

