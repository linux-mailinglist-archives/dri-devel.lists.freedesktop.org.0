Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD5458A85
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 09:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB94B89F0A;
	Mon, 22 Nov 2021 08:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F29289DBC;
 Mon, 22 Nov 2021 08:23:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="221627499"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="221627499"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:23:22 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="606331979"
Received: from marlonpr-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:23:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 6/6] drm/i915/ttm: Update i915_gem_obj_copy_ttm() to be
 asynchronous
Date: Mon, 22 Nov 2021 09:22:52 +0100
Message-Id: <20211122082252.223689-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122082252.223689-1-thomas.hellstrom@linux.intel.com>
References: <20211122082252.223689-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the copy function i915_gem_obj_copy_ttm() to be asynchronous for
future users and update the only current user to sync the objects
as needed after this function.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 40 ++++++++++++++------
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  2 +
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 43423d3976c3..80df9f592407 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -826,33 +826,49 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 		.interruptible = intr,
 	};
 	struct i915_refct_sgt *dst_rsgt;
-	struct dma_fence *copy_fence;
-	int ret;
+	struct dma_fence *copy_fence, *dep_fence;
+	struct i915_deps deps;
+	int ret, shared_err;
 
 	assert_object_held(dst);
 	assert_object_held(src);
+	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
 
 	/*
-	 * Sync for now. This will change with async moves.
+	 * We plan to add a shared fence only for the source. If that
+	 * fails, we await all source fences before commencing
+	 * the copy instead of only the exclusive.
 	 */
-	ret = ttm_bo_wait_ctx(dst_bo, &ctx);
+	shared_err = dma_resv_reserve_shared(src_bo->base.resv, 1);
+	ret = i915_deps_add_resv(&deps, dst_bo->base.resv, true, false, &ctx);
 	if (!ret)
-		ret = ttm_bo_wait_ctx(src_bo, &ctx);
+		ret = i915_deps_add_resv(&deps, src_bo->base.resv,
+					 !!shared_err, false, &ctx);
 	if (ret)
 		return ret;
 
+	dep_fence = i915_deps_to_fence(&deps, &ctx);
+	if (IS_ERR(dep_fence))
+		return PTR_ERR(dep_fence);
+
 	dst_rsgt = i915_ttm_resource_get_st(dst, dst_bo->resource);
 	copy_fence = __i915_ttm_move(src_bo, false, dst_bo->resource,
-				     dst_bo->ttm, dst_rsgt, allow_accel, NULL);
+				     dst_bo->ttm, dst_rsgt, allow_accel,
+				     dep_fence);
 
 	i915_refct_sgt_put(dst_rsgt);
-	if (IS_ERR(copy_fence))
-		return PTR_ERR(copy_fence);
+	if (IS_ERR_OR_NULL(copy_fence))
+		return PTR_ERR_OR_ZERO(copy_fence);
 
-	if (copy_fence) {
-		dma_fence_wait(copy_fence, false);
-		dma_fence_put(copy_fence);
-	}
+	dma_resv_add_excl_fence(dst_bo->base.resv, copy_fence);
+
+	/* If we failed to reserve a shared slot, add an exclusive fence */
+	if (shared_err)
+		dma_resv_add_excl_fence(src_bo->base.resv, copy_fence);
+	else
+		dma_resv_add_shared_fence(src_bo->base.resv, copy_fence);
+
+	dma_fence_put(copy_fence);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 60d10ab55d1e..9aad84059d56 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -80,6 +80,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 
 	err = i915_gem_obj_copy_ttm(backup, obj, pm_apply->allow_gpu, false);
 	GEM_WARN_ON(err);
+	ttm_bo_wait_ctx(backup_bo, &ctx);
 
 	obj->ttm.backup = backup;
 	return 0;
@@ -170,6 +171,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
 					    false);
 		GEM_WARN_ON(err);
+		ttm_bo_wait_ctx(backup_bo, &ctx);
 
 		obj->ttm.backup = NULL;
 		err = 0;
-- 
2.31.1

