Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA288CA8BE
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C502210E36B;
	Tue, 21 May 2024 07:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEofoNed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D93A10E40E;
 Tue, 21 May 2024 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716275854; x=1747811854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yih0PdYe5evtTObGVw5HYYMNH39V4bdftEQIWVIAfR0=;
 b=OEofoNedkJ6/7ACD9H7cOobewa7I6I/8dOvB3QZ572klb/bccqdmYgdG
 IweE4bsQ/J6FD10BJJk0GOv+SzZRsQi5ytcdWxThHIhQ4s7WbdWABApQJ
 hNs/mKwaXeIE+sdrTzUS90Lzwyvp9X/RnmPt7PXTXdIX38umhjZjOFJgS
 z98nDABVnYATVYjNjHQORZvfJCDXZIfLjlsGSfFzXtlF38eyeg4akN+df
 fdxZzCYNahEclaK/l6jVmHFSewSobEyxRSgzZS9O49E/UGjAwu+88WLNE
 M3sgM7aaHHmPq1ILXB1YsdmPL50TlZmzDGsI6w/rmu/VC0ZN4+jrBP1wB A==;
X-CSE-ConnectionGUID: BT36mD4aSb2K6d4BVkUlOg==
X-CSE-MsgGUID: xx/AMk2KTRmpbVLSWahvNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15393496"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15393496"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:32 -0700
X-CSE-ConnectionGUID: fRayHqjpSlWDuy757CV3aQ==
X-CSE-MsgGUID: 4FH8CzdiSA2sh7x416hn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37336802"
Received: from unknown (HELO fedora..) ([10.245.246.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 17/21] drm/ttm: Support drm_exec locking for eviction
 and swapping
Date: Tue, 21 May 2024 09:16:35 +0200
Message-ID: <20240521071639.77614-18-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
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

Snapshot the drm_exec state before validation, and perform locking
for eviction and swapping using the passed in drm_exec pointer
if any. Otherwise fall back to trylock / ticketlock.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 44 ++++++++++++++++++++++-------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 47 +++++++++++++++++++++++++------
 include/drm/ttm/ttm_bo.h          |  5 ++++
 3 files changed, 77 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 316afe19a325..8706502edcb1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,8 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_exec.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -560,10 +562,16 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	};
 	long lret;
 
-	evict_walk.walk.trylock_only = true;
-	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
-	if (lret || !ticket)
-		goto out;
+	/*
+	 * If ww_mutex slowpath debugging, skip the drm_exec trylock step
+	 * to properly exercise the ww transaction backoff from eviction.
+	 */
+	if (!ctx->exec || !IS_ENABLED(CONFIG_DEBUG_WW_MUTEX_SLOWPATH)) {
+		evict_walk.walk.trylock_only = true;
+		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
+		if (lret || !(ticket || ctx->exec))
+			goto out;
+	}
 
 	/* If ticket-locking, repeat while making progress. */
 	evict_walk.walk.trylock_only = false;
@@ -776,6 +784,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
 {
+	struct drm_exec_snapshot snap;
 	struct ttm_resource *res;
 	struct ttm_place hop;
 	bool force_space;
@@ -789,17 +798,24 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	if (!placement->num_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
+	if (ctx->exec)
+		drm_exec_snapshot(ctx->exec, &snap);
+
 	force_space = false;
 	do {
 		/* Check whether we need to move buffer. */
 		if (bo->resource &&
 		    ttm_resource_compatible(bo->resource, placement,
-					    force_space))
-			return 0;
+					    force_space)) {
+			ret = 0;
+			goto out;
+		}
 
 		/* Moving of pinned BOs is forbidden */
-		if (bo->pin_count)
-			return -EINVAL;
+		if (bo->pin_count) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/*
 		 * Determine where to move the buffer.
@@ -816,7 +832,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		if (ret == -ENOSPC)
 			continue;
 		if (ret)
-			return ret;
+			goto out;
 
 bounce:
 		ret = ttm_bo_handle_move_mem(bo, res, false, ctx, &hop);
@@ -828,11 +844,14 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		}
 		if (ret) {
 			ttm_resource_free(bo, &res);
-			return ret;
+			goto out;
 		}
 
 	} while (ret && force_space);
 
+	if (ctx->exec)
+		drm_exec_restore(ctx->exec, &snap);
+
 	/* For backward compatibility with userspace */
 	if (ret == -ENOSPC)
 		return -ENOMEM;
@@ -846,6 +865,11 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 			return ret;
 	}
 	return 0;
+out:
+	if (ctx->exec)
+		drm_exec_restore(ctx->exec, &snap);
+
+	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_validate);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index f6460024077d..0849a1472e3d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -31,6 +31,8 @@
 
 #include <linux/vmalloc.h>
 
+#include <drm/drm_exec.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -814,6 +816,25 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 	return ret;
 }
 
+static int ttm_lru_walk_execlock(struct ttm_lru_walk *walk,
+				 struct ttm_buffer_object *bo)
+{
+	struct ttm_operation_ctx *ctx = walk->ctx;
+	struct drm_gem_object *obj = &bo->base;
+	struct drm_exec *exec = ctx->exec;
+	int ret;
+
+	if (walk->trylock_only)
+		ret = drm_exec_trylock_obj(exec, obj);
+	else
+		ret = drm_exec_lock_obj(exec, obj);
+
+	if (ret == -EALREADY && bo->base.resv == ctx->resv && ctx->allow_res_evict)
+		return 0;
+
+	return ret;
+}
+
 static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
 {
 	if (locked)
@@ -854,6 +875,7 @@ static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
 long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			    struct ttm_resource_manager *man, long target)
 {
+	struct drm_exec *exec = walk->ctx->exec;
 	struct ttm_resource_cursor cursor;
 	struct ttm_resource *res;
 	long sofar = 0;
@@ -869,11 +891,14 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		if (!bo || bo->resource != res)
 			continue;
 
-		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
-			bo_locked = true;
-		else if ((!walk->ticket) || walk->ctx->no_wait_gpu ||
-			 walk->trylock_only)
-			continue;
+		if (!exec) {
+			if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+				bo_locked = true;
+
+			else if (!walk->ticket || walk->ctx->no_wait_gpu ||
+				 walk->trylock_only)
+				continue;
+		}
 
 		if (!ttm_bo_get_unless_zero(bo)) {
 			ttm_lru_walk_unlock(bo, bo_needs_unlock);
@@ -884,12 +909,16 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		spin_unlock(&bdev->lru_lock);
 
 		lret = 0;
-		if (!bo_locked && walk->ticket)
-			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+		if (!bo_locked) {
+			if (exec)
+				lret = ttm_lru_walk_execlock(walk, bo);
+			else
+				lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+		}
 
 		/*
 		 * Note that in between the release of the lru lock and the
-		 * ticketlock, the bo may have switched resource,
+		 * drm_exec_lock_obj / ticketlock, the bo may have switched resource,
 		 * and also memory type, since the resource may have been
 		 * freed and allocated again with a different memory type.
 		 * In that case, just skip it.
@@ -899,7 +928,7 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 		ttm_lru_walk_unlock(bo, bo_needs_unlock);
 		ttm_bo_put(bo);
-		if (lret == -EBUSY)
+		if (lret == -EBUSY || lret == -EALREADY)
 			lret = 0;
 		sofar = (lret < 0) ? lret : sofar + lret;
 		if (sofar < 0 || sofar >= target)
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index deaedfb060ed..1c9f4880abb9 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -164,6 +164,8 @@ struct ttm_bo_kmap_obj {
 	struct ttm_buffer_object *bo;
 };
 
+struct drm_exec;
+
 /**
  * struct ttm_operation_ctx
  *
@@ -175,6 +177,8 @@ struct ttm_bo_kmap_obj {
  * @force_alloc: Don't check the memory account during suspend or CPU page
  * faults. Should only be used by TTM internally.
  * @resv: Reservation object to allow reserved evictions with.
+ * @exec: If part of a drm_exec transaction, pointer to the struct drm_exec.
+ * Null otherwise.
  * @bytes_moved: Statistics on how many bytes have been moved.
  *
  * Context for TTM operations like changing buffer placement or general memory
@@ -187,6 +191,7 @@ struct ttm_operation_ctx {
 	bool allow_res_evict;
 	bool force_alloc;
 	struct dma_resv *resv;
+	struct drm_exec *exec;
 	uint64_t bytes_moved;
 };
 
-- 
2.44.0

