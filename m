Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C923647C7F3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 21:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B966810FF42;
	Tue, 21 Dec 2021 20:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19AF112145;
 Tue, 21 Dec 2021 20:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640116871; x=1671652871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Whg8mrWPnI3NDPkk+N4bKV5ySpnjMKCbG542VaZndg=;
 b=AQ7vm7bHTYmkzlWriXmKqLT9TCvwJiRgnX3AWzZ3Kvm/jc7ytEWKcnCk
 D3zstmKwrJxz5eUlkGON1UY2egNW9D7ztEw9pXPcFMbtEPW13tUeAG3jp
 1MvZgUI3s7PI+cGDBwZn/dygEJ1YhExvA8eDnQ0GZn9SY4tUKDkridsKq
 +V3HFwU1YULk2sdXrCk0BbJiQhSrlOzQDPnnif/8h4JsqLzjacWjHw7Ms
 OYOdhdwmQ5TeBpd4mstTmj5EKroDnNBuPGcm2O2FdRBgf8Z8vPunTEWVw
 FrV6i7Vun928e4tShXEDoT0VWIiQ7u9nRN8ke1bKFrqksCYmshrJ0MojN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="221157941"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="221157941"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 12:01:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="616887434"
Received: from arajji-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.222])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 12:01:09 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/i915: remove questionable fence optimization
 during copy
Date: Tue, 21 Dec 2021 21:00:48 +0100
Message-Id: <20211221200050.436316-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221200050.436316-1-thomas.hellstrom@linux.intel.com>
References: <20211221200050.436316-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

First of all as discussed multiple times now kernel copies *must* always
wait for all fences in a BO before actually doing the copy. This is
mandatory.

Additional to that drop the handling when there can't be a shared slot
allocated on the source BO and just properly return an error code.
Otherwise this code path would only be tested under out of memory
conditions.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 43 +++++++-------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 62a6fd2d127d..5dbaccf3f201 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -195,19 +195,14 @@ static int i915_deps_add_dependency(struct i915_deps *deps,
 }
 
 static int i915_deps_add_resv(struct i915_deps *deps, struct dma_resv *resv,
-			      bool all, const bool no_excl,
 			      const struct ttm_operation_ctx *ctx)
 {
 	struct dma_resv_iter iter;
 	struct dma_fence *fence;
+	int ret;
 
 	dma_resv_assert_held(resv);
-	dma_resv_for_each_fence(&iter, resv, all, fence) {
-		int ret;
-
-		if (no_excl && dma_resv_iter_is_exclusive(&iter))
-			continue;
-
+	dma_resv_for_each_fence(&iter, resv, true, fence) {
 		ret = i915_deps_add_dependency(deps, fence, ctx);
 		if (ret)
 			return ret;
@@ -634,11 +629,7 @@ prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 
 	ret = i915_deps_add_dependency(deps, bo->moving, ctx);
 	if (!ret)
-		/*
-		 * TODO: Only await excl fence here, and shared fences before
-		 * signaling the migration fence.
-		 */
-		ret = i915_deps_add_resv(deps, bo->base.resv, true, false, ctx);
+		ret = i915_deps_add_resv(deps, bo->base.resv, ctx);
 
 	return ret;
 }
@@ -768,22 +759,21 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 	struct i915_refct_sgt *dst_rsgt;
 	struct dma_fence *copy_fence;
 	struct i915_deps deps;
-	int ret, shared_err;
+	int ret;
 
 	assert_object_held(dst);
 	assert_object_held(src);
 	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
 
-	/*
-	 * We plan to add a shared fence only for the source. If that
-	 * fails, we await all source fences before commencing
-	 * the copy instead of only the exclusive.
-	 */
-	shared_err = dma_resv_reserve_shared(src_bo->base.resv, 1);
-	ret = i915_deps_add_resv(&deps, dst_bo->base.resv, true, false, &ctx);
-	if (!ret)
-		ret = i915_deps_add_resv(&deps, src_bo->base.resv,
-					 !!shared_err, false, &ctx);
+	ret = dma_resv_reserve_shared(src_bo->base.resv, 1);
+	if (ret)
+		return ret;
+
+	ret = i915_deps_add_resv(&deps, dst_bo->base.resv, &ctx);
+	if (ret)
+		return ret;
+
+	ret = i915_deps_add_resv(&deps, src_bo->base.resv, &ctx);
 	if (ret)
 		return ret;
 
@@ -798,12 +788,7 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 		return PTR_ERR_OR_ZERO(copy_fence);
 
 	dma_resv_add_excl_fence(dst_bo->base.resv, copy_fence);
-
-	/* If we failed to reserve a shared slot, add an exclusive fence */
-	if (shared_err)
-		dma_resv_add_excl_fence(src_bo->base.resv, copy_fence);
-	else
-		dma_resv_add_shared_fence(src_bo->base.resv, copy_fence);
+	dma_resv_add_shared_fence(src_bo->base.resv, copy_fence);
 
 	dma_fence_put(copy_fence);
 
-- 
2.31.1

