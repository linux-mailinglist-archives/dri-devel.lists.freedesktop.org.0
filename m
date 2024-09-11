Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704689751CF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 14:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7C210E4A7;
	Wed, 11 Sep 2024 12:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEfl5CNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41A610E4A7;
 Wed, 11 Sep 2024 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726057155; x=1757593155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kjrosKeWEQpZsRkweRwetNC1+JWg2SKHmVRj4K9a8fM=;
 b=EEfl5CNXZz5JjoOsm11GxI1YaGoyDzeM2cda74BWaLprjEfHYdhYE4Os
 XDYmKZ89rDhgLNzv5hWZCjAMHMJdgTwaXr1n8Z68Ost5IrwFBBIiTQYGM
 sJs9Rs69iUMm9BZi4sK+mwTEk1BEB3H5ppjwdOxjq7OKd0IKmM/xzQEcd
 LAz8uuhaj2FISKzojtFuO5ECj7ihzbuKvhOm//rvlc6mqzu7zatTtFWfG
 o3HJ1mN2UBZLVPUOqkmJgOYOGkyp78fpcPhnmVAoqPthhwkKpKMCs+9YN
 S4U9Ou+tgzoMFyGBCWZ7N5V6CvpsoGtFNCzGiAsS0qX8yU0Ib74Idgdfg Q==;
X-CSE-ConnectionGUID: nOGuespKQRCGMTRC9ZW7OQ==
X-CSE-MsgGUID: XFBsaCklQLK1zEeYokLpCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27773774"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="27773774"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:19:15 -0700
X-CSE-ConnectionGUID: 1KhpsVGKT4mK5l+NjRw9Dg==
X-CSE-MsgGUID: yw515abqQMy6bfh+wFKtGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72121274"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:19:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/2] drm/ttm: Move swapped objects off the manager's LRU
 list
Date: Wed, 11 Sep 2024 14:18:58 +0200
Message-ID: <20240911121859.85387-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
References: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Remove a bogus WARN_ON (Christian König)
- Update ttm_resource_[add|del] bulk move (Christian König)
- Fix TTM KUNIT tests (Intel CI)
v3:
- Check for non-NULL bo->resource in ttm_bo_populate().
v4:
- Don't move to LRU tail during swapout until the resource
  is properly swapped or there was a swapout failure.
  (Intel Ci)
- Add a newline after checkpatch check.
v5:
- Introduce ttm_resource_is_swapped() to avoid a corner-case where
  a newly created resource was considered swapped. (Intel CI)
v6:
- Move an assert.

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com> #v4
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |  4 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  6 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 59 ++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  6 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  4 +-
 drivers/gpu/drm/ttm/ttm_resource.c            | 28 +++++++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  3 +
 drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
 include/drm/ttm/ttm_bo.h                      |  2 +
 include/drm/ttm/ttm_device.h                  |  5 +-
 include/drm/ttm/ttm_tt.h                      |  5 ++
 15 files changed, 109 insertions(+), 27 deletions(-)

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
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index f0a7eb62116c..3139fd9128d8 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -308,11 +308,11 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	err = ttm_resource_alloc(bo, place, &res2);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	KUNIT_ASSERT_EQ(test,
-			list_is_last(&res2->lru.link, &priv->ttm_dev->pinned), 1);
+			list_is_last(&res2->lru.link, &priv->ttm_dev->unevictable), 1);
 
 	ttm_bo_unreserve(bo);
 	KUNIT_ASSERT_EQ(test,
-			list_is_last(&res1->lru.link, &priv->ttm_dev->pinned), 1);
+			list_is_last(&res1->lru.link, &priv->ttm_dev->unevictable), 1);
 
 	ttm_resource_free(bo, &res1);
 	ttm_resource_free(bo, &res2);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 22260e7aea58..a9f4b81921c3 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -164,18 +164,18 @@ static void ttm_resource_init_pinned(struct kunit *test)
 
 	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, res);
-	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
+	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->unevictable));
 
 	dma_resv_lock(bo->base.resv, NULL);
 	ttm_bo_pin(bo);
 	ttm_resource_init(bo, place, res);
-	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->unevictable));
 
 	ttm_bo_unpin(bo);
 	ttm_resource_fini(man, res);
 	dma_resv_unlock(bo->base.resv);
 
-	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
+	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->unevictable));
 }
 
 static void ttm_resource_fini_basic(struct kunit *test)
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 320592435252..875b024913a0 100644
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
@@ -1128,9 +1128,20 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	if (bo->bdev->funcs->swap_notify)
 		bo->bdev->funcs->swap_notify(bo);
 
-	if (ttm_tt_is_populated(bo->ttm))
+	if (ttm_tt_is_populated(bo->ttm)) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_del_bulk_move(bo->resource, bo);
+		spin_unlock(&bo->bdev->lru_lock);
+
 		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
 
+		spin_lock(&bo->bdev->lru_lock);
+		if (ret)
+			ttm_resource_add_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
 out:
 	/* Consider -ENOMEM and -ENOSPC non-fatal. */
 	if (ret == -ENOMEM || ret == -ENOSPC)
@@ -1180,3 +1191,47 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
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
+	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count &&
+	    bo->resource) {
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
index 6d764ba88aab..a87665eb28a6 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -30,6 +30,7 @@
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_util.h>
 
@@ -235,11 +236,26 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 	}
 }
 
+static bool ttm_resource_is_swapped(struct ttm_resource *res, struct ttm_buffer_object *bo)
+{
+	/*
+	 * Take care when creating a new resource for a bo, that it is not considered
+	 * swapped if it's not the current resource for the bo and is thus logically
+	 * associated with the ttm_tt. Think a VRAM resource created to move a
+	 * swapped-out bo to VRAM.
+	 */
+	if (bo->resource != res || !bo->ttm)
+		return false;
+
+	dma_resv_assert_held(bo->base.resv);
+	return ttm_tt_is_swapped(bo->ttm);
+}
+
 /* Add the resource to a bulk move if the BO is configured for it */
 void ttm_resource_add_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
-	if (bo->bulk_move && !bo->pin_count)
+	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
 		ttm_lru_bulk_move_add(bo->bulk_move, res);
 }
 
@@ -247,7 +263,7 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res,
 void ttm_resource_del_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
-	if (bo->bulk_move && !bo->pin_count)
+	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
 		ttm_lru_bulk_move_del(bo->bulk_move, res);
 }
 
@@ -259,8 +275,8 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 
 	lockdep_assert_held(&bo->bdev->lru_lock);
 
-	if (bo->pin_count) {
-		list_move_tail(&res->lru.link, &bdev->pinned);
+	if (bo->pin_count || ttm_resource_is_swapped(res, bo)) {
+		list_move_tail(&res->lru.link, &bdev->unevictable);
 
 	} else	if (bo->bulk_move) {
 		struct ttm_lru_bulk_move_pos *pos =
@@ -301,8 +317,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->pin_count)
-		list_add_tail(&res->lru.link, &bo->bdev->pinned);
+	if (bo->pin_count || ttm_resource_is_swapped(res, bo))
+		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
 	else
 		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
 	man->usage += res->size;
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 4b51b9023126..3baf215eca23 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -367,7 +367,10 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	}
 	return ret;
 }
+
+#if IS_ENABLED(CONFIG_DRM_TTM_KUNIT_TEST)
 EXPORT_SYMBOL(ttm_tt_populate);
+#endif
 
 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a4dadd5a424c..47b316f23138 100644
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

