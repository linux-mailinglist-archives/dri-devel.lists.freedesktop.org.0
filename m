Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571239A04D5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E2A10E6D9;
	Wed, 16 Oct 2024 08:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZHIgmsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0961E10E6D7;
 Wed, 16 Oct 2024 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729068990; x=1760604990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lo8ZUUgc4qr2ZP2XXiOkqTuxogQ6M3xC9JH/jCiNQTk=;
 b=ZZHIgmsv6Q5qnuIQ5kT/vK+tFtLFOIalW0C3nL+y+p0B1Uu/GbBbBW/m
 fpQEm44XgvTamE3CgM7hyNq2JpqbNE0Y0DcAC708hoOTw8AaXJ4qB05UF
 JalooOTEataxcMX7NtX4DFu1Rdnoqabj5MaLbs+up7qLvlANscopaoYrd
 Sq2SgQw5VQZInxvc/zHANRAL2FCaNSbWuKMjF9yQKeoYDCvaGen0Y8C7b
 /wgkAaf60ByiHNcrYLGgIZAvoqVQQ3mrzd5z+w8eOfJiRjp/A6r79tBC/
 RjV/36YXd61ND934shbRB/KZG+XJ/HG7iQU1JHgatB9tjM3JlH3uL0LBJ A==;
X-CSE-ConnectionGUID: 9mCJ7WG8ShKAYaAvxMBrCQ==
X-CSE-MsgGUID: JTatT8CHRK+zeuvXdh4NoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16122999"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="16122999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:30 -0700
X-CSE-ConnectionGUID: vUpuCZOOTuO9Od83OJv9Cw==
X-CSE-MsgGUID: 2mb5CV7SQVmKIDZDiJUiZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78184472"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v11 6/8] drm/ttm: Add helpers for shrinking
Date: Wed, 16 Oct 2024 10:55:57 +0200
Message-ID: <20241016085559.11840-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
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

Add a number of helpers for shrinking that access core TTM and
core MM functionality in a way that make them unsuitable for
driver open-coding.

v11:
- New patch (split off from previous) and additional helpers.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 23 +++++++
 drivers/gpu/drm/ttm/ttm_bo_util.c      | 95 +++++++++++++++++++++++++-
 include/drm/ttm/ttm_backup.h           | 20 +++---
 include/drm/ttm/ttm_bo.h               | 21 ++++++
 4 files changed, 149 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
index cfe4140cc59d..4046d56dcc8d 100644
--- a/drivers/gpu/drm/ttm/ttm_backup_shmem.c
+++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
@@ -5,6 +5,7 @@
 
 #include <drm/ttm/ttm_backup.h>
 #include <linux/page-flags.h>
+#include <linux/swap.h>
 
 /**
  * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
@@ -107,6 +108,28 @@ static const struct ttm_backup_ops ttm_backup_shmem_ops = {
 	.fini = ttm_backup_shmem_fini,
 };
 
+/**
+ * ttm_backup_shmem_bytes_avail() - Report the approximate number of bytes of backup space
+ * left for backup.
+ *
+ * This function is intended also for driver use to indicate whether a
+ * backup attempt is meaningful.
+ *
+ * Return: An approximate size of backup space available.
+ */
+u64 ttm_backup_shmem_bytes_avail(void)
+{
+	/*
+	 * The idea behind backing up to shmem is that shmem objects may
+	 * eventually be swapped out. So no point swapping out if there
+	 * is no or low swap-space available. But the accuracy of this
+	 * number also depends on shmem actually swapping out backed-up
+	 * shmem objects without too much buffering.
+	 */
+	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_shmem_bytes_avail);
+
 /**
  * ttm_backup_shmem_create() - Create a shmem-based struct backup.
  * @size: The maximum size (in bytes) to back up.
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0cac02a9764c..e6d88557f2c0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -28,7 +28,7 @@
 /*
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
-
+#include <linux/swap.h>
 #include <linux/vmalloc.h>
 
 #include <drm/ttm/ttm_bo.h>
@@ -1052,3 +1052,96 @@ struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs
 	return bo ? bo : ttm_bo_lru_cursor_next(curs);
 }
 EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
+
+/**
+ * ttm_bo_shrink() - Helper to shrink a ttm buffer object.
+ * @ctx: The struct ttm_operation_ctx used for the shrinking operation.
+ * @bo: The buffer object.
+ * @flags: Flags governing the shrinking behaviour.
+ *
+ * The function uses the ttm_tt_back_up functionality to back up or
+ * purge a struct ttm_tt. If the bo is not in system, it's first
+ * moved there.
+ *
+ * Return: The number of pages shrunken or purged, or
+ * negative error code on failure.
+ */
+long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		   const struct ttm_bo_shrink_flags flags)
+{
+	static const struct ttm_place sys_placement_flags = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = 0,
+	};
+	static struct ttm_placement sys_placement = {
+		.num_placement = 1,
+		.placement = &sys_placement_flags,
+	};
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		/* Consider -ENOMEM and -ENOSPC non-fatal. */
+		if (ret) {
+			if (ret == -ENOMEM || ret == -ENOSPC)
+				ret = -EBUSY;
+			return ret;
+		}
+	}
+
+	ttm_bo_unmap_virtual(bo);
+	lret = ttm_bo_wait_ctx(bo, ctx);
+	if (lret < 0)
+		return lret;
+
+	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
+			     {.purge = flags.purge,
+			      .writeback = flags.writeback});
+
+	if (lret < 0 && lret != -EINTR)
+		return -EBUSY;
+
+	return lret;
+}
+EXPORT_SYMBOL(ttm_bo_shrink);
+
+/**
+ * ttm_bo_shrink_suitable() - Whether a bo is suitable for shinking
+ * @ctx: The struct ttm_operation_ctx governing the shrinking.
+ * @bo: The candidate for shrinking.
+ *
+ * Check whether the object, given the information available to TTM,
+ * is suitable for shinking, This function can and should be used
+ * before attempting to shrink an object.
+ *
+ * Return: true if suitable. false if not.
+ */
+bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
+{
+	return bo->ttm && ttm_tt_is_populated(bo->ttm) && !bo->pin_count &&
+		(!ctx->no_wait_gpu ||
+		 dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP));
+}
+EXPORT_SYMBOL(ttm_bo_shrink_suitable);
+
+/**
+ * ttm_bo_shrink_avoid_wait() - Whether to avoid waiting for GPU
+ * during shrinking
+ *
+ * In some situations, like direct reclaim, waiting (in particular gpu waiting)
+ * should be avoided since it may stall a system that could otherwise make progress
+ * shrinking something else less time consuming.
+ *
+ * Return: true if gpu waiting should be avoided, false if not.
+ */
+bool ttm_bo_shrink_avoid_wait(void)
+{
+	return !current_is_kswapd();
+}
+EXPORT_SYMBOL(ttm_bo_shrink_avoid_wait);
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
index 5f8c7d3069ef..0d38dc1fd441 100644
--- a/include/drm/ttm/ttm_backup.h
+++ b/include/drm/ttm/ttm_backup.h
@@ -110,6 +110,15 @@ struct ttm_backup_ops {
 	 * After a call to @fini, it's illegal to use the @backup pointer.
 	 */
 	void (*fini)(struct ttm_backup *backup);
+
+	/**
+	 * bytes_avail: Report the approximate number of bytes of backup space
+	 * left for backup.
+	 * @backup: Pointer to the struct backup queried.
+	 *
+	 * Return: An approximate size of backup space available.
+	 */
+	u64 (*bytes_avail)(struct ttm_backup *backup);
 };
 
 /**
@@ -123,15 +132,8 @@ struct ttm_backup {
 	const struct ttm_backup_ops *ops;
 };
 
-/**
- * ttm_backup_shmem_create() - Create a shmem-based struct backup.
- * @size: The maximum size (in bytes) to back up.
- *
- * Create a backup utilizing shmem objects.
- *
- * Return: A pointer to a struct ttm_backup on success,
- * an error pointer on error.
- */
 struct ttm_backup *ttm_backup_shmem_create(loff_t size);
 
+u64 ttm_backup_shmem_bytes_avail(void);
+
 #endif
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 91ecbb64f6c8..24d8769bcb37 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -225,6 +225,27 @@ struct ttm_lru_walk {
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
+/**
+ * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
+ * @purge: Purge the content rather than backing it up.
+ * @writeback: Attempt to immediately write content to swap space.
+ * @allow_move: Allow moving to system before shrinking. This is typically
+ * not desired for zombie- or ghost objects (with zombie object meaning
+ * objects with a zero gem object refcount)
+ */
+struct ttm_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+	u32 allow_move : 1;
+};
+
+long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		   const struct ttm_bo_shrink_flags flags);
+
+bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx);
+
+bool ttm_bo_shrink_avoid_wait(void);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
-- 
2.46.0

