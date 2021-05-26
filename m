Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF84D391646
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D709F6ECA9;
	Wed, 26 May 2021 11:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258106EC9B;
 Wed, 26 May 2021 11:33:34 +0000 (UTC)
IronPort-SDR: OhiS7Cjifk3M7GZc5si5+l5EPHiJmOjNV6a22ZvoDseSRi3gqk9kB2ozYXqN92G5Y9T1nGwbW9
 VaXaKSsxWVOw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="223627312"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223627312"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:33 -0700
IronPort-SDR: INIuZPLrLCvJ+EidnzV6lBklVC6QVkAhos9VeuqOZFfuJnhCfNEX3SHRkvKmJ3RQSuGDjv1u8J
 PYDsTcp4RcGg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="633457933"
Received: from pegilssx-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:31 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/15] drm/ttm,
 drm/amdgpu: Allow the driver some control over swapping
Date: Wed, 26 May 2021 13:32:54 +0200
Message-Id: <20210526113259.1661914-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are calling the eviction_valuable driver callback at eviction time to
determine whether we actually can evict a buffer object.
The upcoming i915 TTM backend needs the same functionality for swapout,
and that might actually be beneficial to other drivers as well.

Add an eviction_valuable call also in the swapout path. Try to keep the
current behaviour for all drivers by returning true if the buffer object
is already in the TTM_PL_SYSTEM placement. We change behaviour for the
case where a buffer object is in a TT backed placement when swapped out,
in which case the drivers normal eviction_valuable path is run.

Finally make sure we don't try to swapout a bo that was recently purged
and therefore unpopulated.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
v3:
- Don't export ttm_tt_unpopulate
- Fix confusion reading the locked pointer instead of the value
  pointed to in ttm_bo_evict_swapout_allowable (Reported by
  Maarten Lankhorst)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 +++
 drivers/gpu/drm/ttm/ttm_bo.c            | 43 ++++++++++++++++---------
 drivers/gpu/drm/ttm/ttm_tt.c            |  3 ++
 3 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3bc3aebfef7c..45d194bffc3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1348,6 +1348,10 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	struct dma_fence *f;
 	int i;
 
+	/* Swapout? */
+	if (bo->mem.mem_type == TTM_PL_SYSTEM)
+		return true;
+
 	if (bo->type == ttm_bo_type_kernel &&
 	    !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
 		return false;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index be0406466460..1b2d062266ed 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -536,6 +536,10 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
+	dma_resv_assert_held(bo->base.resv);
+	if (bo->mem.mem_type == TTM_PL_SYSTEM)
+		return true;
+
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
@@ -558,7 +562,9 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);
  * b. Otherwise, trylock it.
  */
 static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
-			struct ttm_operation_ctx *ctx, bool *locked, bool *busy)
+					   struct ttm_operation_ctx *ctx,
+					   const struct ttm_place *place,
+					   bool *locked, bool *busy)
 {
 	bool ret = false;
 
@@ -576,6 +582,14 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 			*busy = !ret;
 	}
 
+	if (ret && place && !bo->bdev->funcs->eviction_valuable(bo, place)) {
+		ret = false;
+		if (*locked) {
+			dma_resv_unlock(bo->base.resv);
+			*locked = false;
+		}
+	}
+
 	return ret;
 }
 
@@ -630,20 +644,14 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		list_for_each_entry(bo, &man->lru[i], lru) {
 			bool busy;
 
-			if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
-							    &busy)) {
+			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
+							    &locked, &busy)) {
 				if (busy && !busy_bo && ticket !=
 				    dma_resv_locking_ctx(bo->base.resv))
 					busy_bo = bo;
 				continue;
 			}
 
-			if (place && !bdev->funcs->eviction_valuable(bo,
-								      place)) {
-				if (locked)
-					dma_resv_unlock(bo->base.resv);
-				continue;
-			}
 			if (!ttm_bo_get_unless_zero(bo)) {
 				if (locked)
 					dma_resv_unlock(bo->base.resv);
@@ -1140,10 +1148,18 @@ EXPORT_SYMBOL(ttm_bo_wait);
 int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		   gfp_t gfp_flags)
 {
+	struct ttm_place place = {};
 	bool locked;
 	int ret;
 
-	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
+	/*
+	 * While the bo may already reside in SYSTEM placement, set
+	 * SYSTEM as new placement to cover also the move further below.
+	 * The driver may use the fact that we're moving from SYSTEM
+	 * as an indication that we're about to swap out.
+	 */
+	place.mem_type = TTM_PL_SYSTEM;
+	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
 		return -EBUSY;
 
 	if (!ttm_bo_get_unless_zero(bo)) {
@@ -1168,12 +1184,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (bo->mem.mem_type != TTM_PL_SYSTEM) {
 		struct ttm_operation_ctx ctx = { false, false };
 		struct ttm_resource evict_mem;
-		struct ttm_place place, hop;
-
-		memset(&place, 0, sizeof(place));
-		memset(&hop, 0, sizeof(hop));
-
-		place.mem_type = TTM_PL_SYSTEM;
+		struct ttm_place hop = {};
 
 		ret = ttm_resource_alloc(bo, &place, &evict_mem);
 		if (unlikely(ret))
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 913b330a234b..d9793cbb6d13 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -263,6 +263,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 	struct page *to_page;
 	int i, ret;
 
+	if (!ttm_tt_is_populated(ttm))
+		return 0;
+
 	swap_storage = shmem_file_setup("ttm swap", size, 0);
 	if (IS_ERR(swap_storage)) {
 		pr_err("Failed allocating swap storage\n");
-- 
2.31.1

