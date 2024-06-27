Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B93991AC0C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FAD10E6AA;
	Thu, 27 Jun 2024 15:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FB410E6AA;
 Thu, 27 Jun 2024 15:57:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org
Subject: [RFC PATCH 3/6] drm/ttm: Handle cgroup based eviction in TTM
Date: Thu, 27 Jun 2024 17:47:22 +0200
Message-ID: <20240627154754.74828-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
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

cgroup resource allocation has to be handled in TTM, so -EAGAIN from
cgroups can be converted into -ENOSPC, and the limitcg can be properly
evicted in ttm code.

When hitting a resource limit through -EAGAIN, the cgroup for which the
limit is hit is also returned. This allows eviction to delete only from
cgroups which are a subgroup of the current cgroup.

The returned CSS is used to determine if eviction is valuable for a
given resource, and allows TTM to only target specific resources to
lower memory usage.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 18 ++++-----
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 38 ++++++++++++++++---
 drivers/gpu/drm/ttm/ttm_resource.c            | 28 ++++++++++++--
 include/drm/ttm/ttm_bo.h                      |  3 +-
 include/drm/ttm/ttm_resource.h                | 16 +++++++-
 6 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 1f8a4f8adc92..e2adc336dda8 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -252,13 +252,13 @@ static void ttm_bo_unreserve_basic(struct kunit *test)
 	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 	bo->priority = bo_prio;
 
-	err = ttm_resource_alloc(bo, place, &res1);
+	err = ttm_resource_alloc(bo, place, &res1, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	bo->resource = res1;
 
 	/* Add a dummy resource to populate LRU */
-	ttm_resource_alloc(bo, place, &res2);
+	ttm_resource_alloc(bo, place, &res2, NULL);
 
 	dma_resv_lock(bo->base.resv, NULL);
 	ttm_bo_unreserve(bo);
@@ -294,12 +294,12 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	dma_resv_lock(bo->base.resv, NULL);
 	ttm_bo_pin(bo);
 
-	err = ttm_resource_alloc(bo, place, &res1);
+	err = ttm_resource_alloc(bo, place, &res1, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	bo->resource = res1;
 
 	/* Add a dummy resource to the pinned list */
-	err = ttm_resource_alloc(bo, place, &res2);
+	err = ttm_resource_alloc(bo, place, &res2, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	KUNIT_ASSERT_EQ(test,
 			list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
@@ -343,7 +343,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
 	dma_resv_unlock(bo1->base.resv);
 
-	err = ttm_resource_alloc(bo1, place, &res1);
+	err = ttm_resource_alloc(bo1, place, &res1, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	bo1->resource = res1;
 
@@ -351,7 +351,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	ttm_bo_set_bulk_move(bo2, &lru_bulk_move);
 	dma_resv_unlock(bo2->base.resv);
 
-	err = ttm_resource_alloc(bo2, place, &res2);
+	err = ttm_resource_alloc(bo2, place, &res2, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	bo2->resource = res2;
 
@@ -387,7 +387,7 @@ static void ttm_bo_put_basic(struct kunit *test)
 	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 	bo->type = ttm_bo_type_device;
 
-	err = ttm_resource_alloc(bo, place, &res);
+	err = ttm_resource_alloc(bo, place, &res, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	bo->resource = res;
 
@@ -504,7 +504,7 @@ static void ttm_bo_pin_unpin_resource(struct kunit *test)
 
 	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 
-	err = ttm_resource_alloc(bo, place, &res);
+	err = ttm_resource_alloc(bo, place, &res, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	bo->resource = res;
 
@@ -555,7 +555,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
 
 	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 
-	err = ttm_resource_alloc(bo, place, &res);
+	err = ttm_resource_alloc(bo, place, &res, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	bo->resource = res;
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 029e1f094bb0..c7d3d86ff98b 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -302,7 +302,7 @@ static void ttm_sys_man_free_basic(struct kunit *test)
 	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, res);
 
-	ttm_resource_alloc(bo, place, &res);
+	ttm_resource_alloc(bo, place, &res, NULL, NULL);
 
 	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
 	man->func->free(man, res);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6396dece0db1..6ca92b64f2fe 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -42,6 +42,7 @@
 #include <linux/file.h>
 #include <linux/module.h>
 #include <linux/atomic.h>
+#include <linux/cgroup_drm.h>
 #include <linux/dma-resv.h>
 
 #include "ttm_module.h"
@@ -594,18 +595,24 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ttm_resource_manager *man,
 			const struct ttm_place *place,
 			struct ttm_operation_ctx *ctx,
-			struct ww_acquire_ctx *ticket)
+			struct ww_acquire_ctx *ticket,
+			struct drmcgroup_pool_state *limitcss)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
 	struct ttm_resource_cursor cursor;
 	struct ttm_resource *res;
 	bool locked = false;
 	int ret;
+	bool try_low = false, hit_low = false;
 
 	spin_lock(&bdev->lru_lock);
+retry:
 	ttm_resource_manager_for_each_res(man, &cursor, res) {
 		bool busy;
 
+		if (!drmcs_evict_valuable(limitcss, man->cgdev, man->cgidx, res->css, try_low, &hit_low))
+			continue;
+
 		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
 						    &locked, &busy)) {
 			if (busy && !busy_bo && ticket !=
@@ -623,13 +630,25 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	}
 
 	if (!bo) {
+		if (!ticket && !try_low && hit_low)
+			goto hit_low;
+
 		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
 			busy_bo = NULL;
+
+		if (!busy_bo && !try_low && hit_low)
+			goto hit_low;
+
 		spin_unlock(&bdev->lru_lock);
 		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
 		if (busy_bo)
 			ttm_bo_put(busy_bo);
 		return ret;
+
+hit_low:
+		busy_bo = NULL;
+		try_low = true;
+		goto retry;
 	}
 
 	if (bo->deleted) {
@@ -769,14 +788,19 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 			continue;
 
 		do {
-			ret = ttm_resource_alloc(bo, place, res);
-			if (unlikely(ret && ret != -ENOSPC))
+			struct drmcgroup_pool_state *limitcss = NULL;
+
+			ret = ttm_resource_alloc(bo, place, res, force_space ? &limitcss : NULL);
+			if (unlikely(ret && ret != -ENOSPC && ret != -EAGAIN)) {
+				drmcs_pool_put(limitcss);
 				return ret;
+			}
 			if (likely(!ret) || !force_space)
 				break;
 
 			ret = ttm_mem_evict_first(bdev, man, place, ctx,
-						  ticket);
+						  ticket, limitcss);
+			drmcs_pool_put(limitcss);
 			if (unlikely(ret == -EBUSY))
 				break;
 			if (unlikely(ret))
@@ -1162,7 +1186,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 
 		memset(&hop, 0, sizeof(hop));
 		place.mem_type = TTM_PL_SYSTEM;
-		ret = ttm_resource_alloc(bo, &place, &evict_mem);
+		ret = ttm_resource_alloc(bo, &place, &evict_mem, NULL);
 		if (unlikely(ret))
 			goto out;
 
@@ -1201,7 +1225,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (locked)
 		dma_resv_unlock(bo->base.resv);
 	ttm_bo_put(bo);
-	return ret == -EBUSY ? -ENOSPC : ret;
+	if (ret == -EAGAIN || ret == -EBUSY)
+		return -ENOSPC;
+	return ret;
 }
 
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 4a66b851b67d..1a8312afe247 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -26,6 +26,7 @@
 #include <linux/io-mapping.h>
 #include <linux/iosys-map.h>
 #include <linux/scatterlist.h>
+#include <linux/cgroup_drm.h>
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
@@ -229,15 +230,31 @@ EXPORT_SYMBOL(ttm_resource_fini);
 
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
-		       struct ttm_resource **res_ptr)
+		       struct ttm_resource **res_ptr,
+		       struct drmcgroup_pool_state **limitcs)
 {
 	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, place->mem_type);
+	struct drmcgroup_pool_state *drmcs = NULL;
 	int ret;
 
+	if (man->cgdev) {
+		ret = drmcg_try_charge(&drmcs, limitcs,
+				       man->cgdev, man->cgidx,
+				       bo->base.size);
+		if (ret)
+			return ret;
+	}
+
 	ret = man->func->alloc(man, bo, place, res_ptr);
-	if (ret)
+	if (ret) {
+		if (drmcs)
+			drmcg_uncharge(drmcs, man->cgdev, man->cgidx,
+				       bo->base.size);
 		return ret;
+	}
+
+	(*res_ptr)->css = drmcs;
 
 	spin_lock(&bo->bdev->lru_lock);
 	ttm_resource_add_bulk_move(*res_ptr, bo);
@@ -249,6 +266,7 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 {
 	struct ttm_resource_manager *man;
+	struct drmcgroup_pool_state *css;
 
 	if (!*res)
 		return;
@@ -256,9 +274,13 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 	spin_lock(&bo->bdev->lru_lock);
 	ttm_resource_del_bulk_move(*res, bo);
 	spin_unlock(&bo->bdev->lru_lock);
+
+	css = (*res)->css;
 	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
 	man->func->free(man, *res);
 	*res = NULL;
+	if (man->cgdev)
+		drmcg_uncharge(css, man->cgdev, man->cgidx, bo->base.size);
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
@@ -401,7 +423,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 		while (!list_empty(&man->lru[i])) {
 			spin_unlock(&bdev->lru_lock);
 			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
-						  NULL);
+						  NULL, NULL);
 			if (ret)
 				return ret;
 			spin_lock(&bdev->lru_lock);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6ccf96c91f3a..709a30b6bfe6 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -386,7 +386,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ttm_resource_manager *man,
 			const struct ttm_place *place,
 			struct ttm_operation_ctx *ctx,
-			struct ww_acquire_ctx *ticket);
+			struct ww_acquire_ctx *ticket,
+			struct drmcgroup_pool_state *limitcg);
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69769355139f..0574ebb226cb 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -38,6 +38,7 @@
 #define TTM_MAX_BO_PRIORITY	4U
 #define TTM_NUM_MEM_TYPES 8
 
+struct drmcgroup_device;
 struct ttm_device;
 struct ttm_resource_manager;
 struct ttm_resource;
@@ -174,6 +175,15 @@ struct ttm_resource_manager {
 	 * bdev->lru_lock.
 	 */
 	uint64_t usage;
+
+	/**
+	 * @cgdev: drmcgroup_device used for memory accounting, if not NULL.
+	 */
+	struct drmcgroup_device *cgdev;
+	/**
+	 * @cgidx: Resource index used by this resource manager for cgroup accounting
+	 */
+	u32 cgidx;
 };
 
 /**
@@ -202,6 +212,7 @@ struct ttm_bus_placement {
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
  * @bo: weak reference to the BO, protected by ttm_device::lru_lock
+ * @css: cgroup state this resource is charged to
  *
  * Structure indicating the placement and space resources used by a
  * buffer object.
@@ -214,6 +225,8 @@ struct ttm_resource {
 	struct ttm_bus_placement bus;
 	struct ttm_buffer_object *bo;
 
+	struct drmcgroup_pool_state *css;
+
 	/**
 	 * @lru: Least recently used list, see &ttm_resource_manager.lru
 	 */
@@ -362,7 +375,8 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
-		       struct ttm_resource **res);
+		       struct ttm_resource **res,
+		       struct drmcgroup_pool_state **limitcs);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
 bool ttm_resource_intersects(struct ttm_device *bdev,
 			     struct ttm_resource *res,
-- 
2.45.2

