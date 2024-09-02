Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B441968B31
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 17:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA21910E335;
	Mon,  2 Sep 2024 15:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOza8khD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CA510E330;
 Mon,  2 Sep 2024 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725291749; x=1756827749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m73WaIf41zyzi6kJU/C/uL31lp8I4DOQIE8YK2gi/QU=;
 b=BOza8khDFGFUVJCb5Shl6RkNMK1UTkHi5qN9/f+anXljrQUDC9SbrFdl
 75HpgNTxxsCpHYtTM3HIFEn4qIvTJ0tQi9uboAAvuanYkRwQfox5bcyil
 DXj61sVGctzyv0TmyU1vKYNKrSKjlpfolGnsDAJGOJjW9UFfzziPPr9Pm
 BY7I2hfoJb28WqXwz7loYJpRpLebeF5lHde1kpxYKLdH89PV6MaOrG/Cs
 P0mP5taDasj7h1khHTrv8EXrValIBmOfMT+ErPJ/Tr9rSSJa3kvnZ0qvJ
 EDTO4y6ABW26XJhQyEABevf5DibGFt4rcvQu+DTft5eT3/lnUL1IlMWAl Q==;
X-CSE-ConnectionGUID: 2kw7HnrOQheZykXXpA5IlQ==
X-CSE-MsgGUID: ud6XVCnlSxm9LXaMyIDexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41352841"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41352841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:42:29 -0700
X-CSE-ConnectionGUID: evZW7SXGQwWsBcEYRPjy9g==
X-CSE-MsgGUID: d3XNX/nLQHu2gW9PjxKbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65370616"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.77])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:42:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: Move swapped objects off the manager's LRU list
Date: Mon,  2 Sep 2024 17:41:58 +0200
Message-ID: <20240902154159.78871-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
References: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
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

Resources of swapped objects remains on the TTM_PL_SYSTEM manager's
LRU list, which is bad for the LRU walk efficiency.

Rename the device-wide "pinned" list to "unevictable" and move
also resources of swapped-out objects to that list.

An alternative would be to create an "UNEVICTABLE" priority to
be able to keep the pinned- and swapped objects on their
respective manager's LRU without affecting the LRU walk efficiency.

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                 | 55 +++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c            |  6 +--
 drivers/gpu/drm/ttm/ttm_bo_vm.c              |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c             |  4 +-
 drivers/gpu/drm/ttm/ttm_resource.c           |  9 ++--
 drivers/gpu/drm/ttm/ttm_tt.c                 |  1 -
 drivers/gpu/drm/xe/xe_bo.c                   |  4 +-
 include/drm/ttm/ttm_bo.h                     |  2 +
 include/drm/ttm/ttm_device.h                 |  5 +-
 include/drm/ttm/ttm_tt.h                     |  5 ++
 13 files changed, 81 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5c72462d1f57..7de284766f82 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 	}
 
 	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
-		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+		ret = ttm_bo_populate(bo, &ctx);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 03b00a03a634..041dab543b78 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 
 	/* Populate ttm with pages if needed. Typically system memory. */
 	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
-		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
+		ret = ttm_bo_populate(bo, ctx);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index ad649523d5e0..61596cecce4d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -90,7 +90,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 		goto out_no_lock;
 
 	backup_bo = i915_gem_to_ttm(backup);
-	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
+	err = ttm_bo_populate(backup_bo, &ctx);
 	if (err)
 		goto out_no_populate;
 
@@ -189,7 +189,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 	if (!backup_bo->resource)
 		err = ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
 	if (!err)
-		err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
+		err = ttm_bo_populate(backup_bo, &ctx);
 	if (!err) {
 		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
 					    false);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 320592435252..d244566a7e48 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -139,7 +139,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			goto out_err;
 
 		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+			ret = ttm_bo_populate(bo, ctx);
 			if (ret)
 				goto out_err;
 		}
@@ -1131,6 +1131,13 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	if (ttm_tt_is_populated(bo->ttm))
 		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
 
+	if (ttm_tt_is_swapped(bo->ttm)) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_del_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
 out:
 	/* Consider -ENOMEM and -ENOSPC non-fatal. */
 	if (ret == -ENOMEM || ret == -ENOSPC)
@@ -1180,3 +1187,49 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
+
+/**
+ * ttm_bo_populate() - Ensure that a buffer object has backing pages
+ * @bo: The buffer object
+ * @ctx: The ttm_operation_ctx governing the operation.
+ *
+ * For buffer objects in a memory type whose manager uses
+ * struct ttm_tt for backing pages, ensure those backing pages
+ * are present and with valid content. The bo's resource is also
+ * placed on the correct LRU list if it was previously swapped
+ * out.
+ *
+ * Return: 0 if successful, negative error code on failure.
+ * Note: May return -EINTR or -ERESTARTSYS if @ctx::interruptible
+ * is set to true.
+ */
+int ttm_bo_populate(struct ttm_buffer_object *bo,
+		    struct ttm_operation_ctx *ctx)
+{
+	struct ttm_tt *tt = bo->ttm;
+	bool swapped;
+	int ret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (!tt)
+		return 0;
+
+	swapped = ttm_tt_is_swapped(tt);
+	ret = ttm_tt_populate(bo->bdev, tt, ctx);
+	if (ret)
+		return ret;
+
+	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count) {
+		if (WARN_ON_ONCE(bo->pin_count))
+			return 0;
+
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_add_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_populate);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3c07f4712d5c..d939925efa81 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	src_man = ttm_manager_type(bdev, src_mem->mem_type);
 	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
 		    dst_man->use_tt)) {
-		ret = ttm_tt_populate(bdev, ttm, ctx);
+		ret = ttm_bo_populate(bo, ctx);
 		if (ret)
 			return ret;
 	}
@@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 
 	BUG_ON(!ttm);
 
-	ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
+	ret = ttm_bo_populate(bo, &ctx);
 	if (ret)
 		return ret;
 
@@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		pgprot_t prot;
 		void *vaddr;
 
-		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
+		ret = ttm_bo_populate(bo, &ctx);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 4212b8c91dd4..2c699ed1963a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -224,7 +224,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		};
 
 		ttm = bo->ttm;
-		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
+		err = ttm_bo_populate(bo, &ctx);
 		if (err) {
 			if (err == -EINTR || err == -ERESTARTSYS ||
 			    err == -EAGAIN)
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7cc4954c1bc..02e797fd1891 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
-	INIT_LIST_HEAD(&bdev->pinned);
+	INIT_LIST_HEAD(&bdev->unevictable);
 	bdev->dev_mapping = mapping;
 	mutex_lock(&ttm_global_mutex);
 	list_add_tail(&bdev->device_list, &glob->device_list);
@@ -283,7 +283,7 @@ void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
 	struct ttm_resource_manager *man;
 	unsigned int i, j;
 
-	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
+	ttm_device_clear_lru_dma_mappings(bdev, &bdev->unevictable);
 
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 6d764ba88aab..9d54c0e3e43d 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -30,6 +30,7 @@
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_util.h>
 
@@ -259,8 +260,8 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 
 	lockdep_assert_held(&bo->bdev->lru_lock);
 
-	if (bo->pin_count) {
-		list_move_tail(&res->lru.link, &bdev->pinned);
+	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo->ttm))) {
+		list_move_tail(&res->lru.link, &bdev->unevictable);
 
 	} else	if (bo->bulk_move) {
 		struct ttm_lru_bulk_move_pos *pos =
@@ -301,8 +302,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->pin_count)
-		list_add_tail(&res->lru.link, &bo->bdev->pinned);
+	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo->ttm)))
+		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
 	else
 		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
 	man->usage += res->size;
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 4b51b9023126..d1325cf37b18 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -367,7 +367,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	}
 	return ret;
 }
-EXPORT_SYMBOL(ttm_tt_populate);
 
 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9df5a16662cf..d7d0add20b77 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -903,7 +903,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		}
 	}
 
-	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	ret = ttm_bo_populate(&bo->ttm, &ctx);
 	if (ret)
 		goto err_res_free;
 
@@ -956,7 +956,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	if (ret)
 		return ret;
 
-	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	ret = ttm_bo_populate(&bo->ttm, &ctx);
 	if (ret)
 		goto err_res_free;
 
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 7b56d1ca36d7..5804408815be 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -462,5 +462,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
 pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
+int ttm_bo_populate(struct ttm_buffer_object *bo,
+		    struct ttm_operation_ctx *ctx);
 
 #endif
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..438358f72716 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -252,9 +252,10 @@ struct ttm_device {
 	spinlock_t lru_lock;
 
 	/**
-	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
+	 * @unevictable Buffer objects which are pinned or swapped and as such
+	 * not on an LRU list.
 	 */
-	struct list_head pinned;
+	struct list_head unevictable;
 
 	/**
 	 * @dev_mapping: A pointer to the struct address_space for invalidating
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 2b9d856ff388..991edafdb2dd 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -129,6 +129,11 @@ static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
 	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
 }
 
+static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
+{
+	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
+}
+
 /**
  * ttm_tt_create
  *
-- 
2.46.0

