Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5657DEBCC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D19C10E815;
	Thu,  2 Nov 2023 04:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A388E10E801;
 Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899072; x=1730435072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nh/H1JzDMpGQr1G+PCKAigkrHf6LP1Kp/ev0gnoHg6E=;
 b=nxzxZmdpb3aK0TbzXTriTjW3Tzwa3w9Jhq14w0zYvufwMtwyzk6PC0pj
 VSKPZG3wJ00PHgs+fC0HyLwILF9Zs6beCmhQ30iyHxan2Yd3Vv9MUZH40
 NLdKOVQmjxsXRQ8geMRgaf1lWoOAfqKluTA4DHrhBh72+nDbtYjKxdvHu
 J0FxmUASjbo8/isvCUKmh6ntXVI5LAU8m4BpyFa5+kYsFpo3yFRxtW7gt
 BjaGecEEoEgXb20X2dC7Nr3YL8vZvEM1wLxGnl3BUAQQPnY3UDL2JE6Wv
 6RvMQHJB89QaLKxB4Dn5boUsVQ6OLliGemAx5Ke++ZscrDBEPqPsU2bIV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930933"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930933"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762641"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762641"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 10/11] drm/ttm: Implement ttm memory evict functions
Date: Thu,  2 Nov 2023 00:33:05 -0400
Message-Id: <20231102043306.2931989-11-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement ttm_mem_evict_valuable, ttm_mem_evict_entity and
ttm_mem_evict_busy_entity. Those are callback functions from
drm lru manager. Register those functions during drm lru entity
initialization. Those 3 functions are splitted from original
ttm_mem_evict_first function.

Reimplemented ttm_mem_evict_first function using drm_lru_evict_first
function. For now, drm_lru_evict_first just calls back to above 3
functions which are splitted from ttm_mem_evict_first function, so
there is no function change. In the future, when SVM code is added,
drm_lru_evict_first function can also calls into SVM resource eviction
functions, thus TTM and SVM can mutually evict resources from each
other.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 192 ++++++++++++++++++++++++++++-------
 include/drm/ttm/ttm_bo.h     |   2 +
 2 files changed, 158 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 4a5ffa920665..9ec7a246e2ad 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -587,50 +587,148 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
 	return r == -EDEADLK ? -EBUSY : r;
 }
 
-int ttm_mem_evict_first(struct ttm_device *bdev,
-			struct ttm_resource_manager *man,
-			const struct ttm_place *place,
-			struct ttm_operation_ctx *ctx,
-			struct ww_acquire_ctx *ticket)
+struct ttm_mem_evict_ctx {
+	const struct ttm_place *place;
+	struct ttm_operation_ctx *ctx;
+	struct ww_acquire_ctx *ticket;
+};
+
+/**
+ * ttm_mem_evict_allowable
+ *
+ * @lru_entity: The struct ttm_resource::lru_entity when this resource is
+ * added to drm lru list.
+ * @place: The preferred ttm placement where we want to evict memory for
+ * more memory space. If the current ttm_resource doesn't match the preferred
+ * placement, then there is no need to evict the current resource.
+ * @ctx: ttm operation context
+ * @ticket: dma reservation's context used to lock resource
+ * @busy: used to return whether the current resource is busy (i.e., locked
+ * by other clients)
+ * @locked: used to return whether this resource is locked during this check,
+ * i.e., successfully trylocked bo's dma reservation object
+ *
+ * Check whether we are allowed to evict a memory resource. Return true if we
+ * are allowed to evict resource; otherwise false.
+ *
+ * When this function returns true, a resource reference counter (bo's reference)
+ * is hold. This reference counter need to be released after evict operation later
+ * on.
+ *
+ * This function should be called with lru_lock hold.
+ */
+bool ttm_mem_evict_allowable(struct drm_lru_entity *lru_entity,
+			const struct drm_lru_evict_ctx *lru_evict_ctx,
+			bool *busy, bool *locked)
 {
-	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
-	struct drm_lru_cursor cursor;
 	struct ttm_resource *res;
-	struct drm_lru_entity *entity;
-	bool locked = false;
-	int ret;
+	struct ttm_buffer_object *bo = NULL;
+	struct ttm_device *bdev;
+	const struct ttm_place *place;
+	struct ttm_operation_ctx *ctx;
+	struct ww_acquire_ctx *ticket;
+	struct ttm_mem_evict_ctx *evict_ctx;
 
-	spin_lock(bdev->lru_lock);
-	drm_lru_for_each_entity(man->lru_mgr, &cursor, entity) {
-		bool busy;
+	evict_ctx = (struct ttm_mem_evict_ctx *)lru_evict_ctx;
+	place = evict_ctx->place;
+	ctx = evict_ctx->ctx;
+	ticket = evict_ctx->ticket;
 
-		res = container_of(entity, struct ttm_resource, lru_entity);
-		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
-						    &locked, &busy)) {
-			if (busy && !busy_bo && ticket !=
-			    dma_resv_locking_ctx(res->bo->base.resv))
-				busy_bo = res->bo;
-			continue;
-		}
+	res = container_of(lru_entity, struct ttm_resource, lru_entity);
+	bo = res->bo;
+	bdev = bo->bdev;
 
-		if (ttm_bo_get_unless_zero(res->bo)) {
-			bo = res->bo;
-			break;
-		}
-		if (locked)
-			dma_resv_unlock(res->bo->base.resv);
-	}
+	if (!ttm_bo_evict_swapout_allowable(bo, ctx, place, locked, busy)) {
+		if (busy && ticket != dma_resv_locking_ctx(bo->base.resv))
+			*busy = true;
 
-	if (!bo) {
-		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
-			busy_bo = NULL;
-		spin_unlock(bdev->lru_lock);
-		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
-		if (busy_bo)
-			ttm_bo_put(busy_bo);
-		return ret;
+		return false;
 	}
 
+	if (ttm_bo_get_unless_zero(bo))
+		return true;
+
+	if (locked)
+		dma_resv_unlock(bo->base.resv);
+
+	return false;
+}
+
+/**
+ * ttm_mem_evict_busy_entity
+ *
+ * @lru_entity: The struct ttm_resource::lru_entity when this resource is
+ * added to drm lru list.
+ * @ctx: ttm operation context
+ * @ticket: dma reservation's context used to lock resource
+ *
+ * Evict a busy memory resource.
+ * This function should be called with lru_lock hold.
+ */
+int ttm_mem_evict_busy_entity(struct drm_lru_entity *lru_entity,
+			const struct drm_lru_evict_ctx *lru_evict_ctx)
+{
+	struct ttm_resource *res;
+	struct ttm_buffer_object *bo = NULL;
+	struct ttm_device *bdev;
+	int ret;
+	struct ttm_operation_ctx *ctx;
+	struct ww_acquire_ctx *ticket;
+	struct ttm_mem_evict_ctx *evict_ctx;
+
+	evict_ctx = (struct ttm_mem_evict_ctx *)lru_evict_ctx;
+	ctx = evict_ctx->ctx;
+	ticket = evict_ctx->ticket;
+
+	res = container_of(lru_entity, struct ttm_resource, lru_entity);
+	bo = res->bo;
+	bdev = bo->bdev;
+
+	if (bo && !ttm_bo_get_unless_zero(bo))
+		bo = NULL;
+	spin_unlock(bdev->lru_lock);
+	ret = ttm_mem_evict_wait_busy(bo, ctx, ticket);
+	/* FIXME: this is code copied originally from ttm_mem_evict_first.
+	 * 1) Shouldn't we ttm_bo_evict this bo also? Otherwise how can we
+	 * make any memory space?
+	 * 2) We also need to check whether this busy entity is in the same
+	 * ttm_place as specified in lru_evict_ctx::place; if not, there is
+	 * no help to wait this busy entity.
+     */
+	if (bo)
+		ttm_bo_put(bo);
+
+	return ret;
+}
+
+/**
+ * @lru_entity: The struct ttm_resource::lru_entity when this resource is
+ * added to drm lru list.
+ * @ctx: ttm operation context
+ * @locked: whether this resource is dma-reserved (if reserved, we need to
+ * unreserve it in this function)
+ *
+ * Evict a memory resource corresponding to a lru_entity. This should be
+ * called holding lru_lock
+ *
+ */
+int ttm_mem_evict_entity(struct drm_lru_entity *lru_entity,
+			const struct drm_lru_evict_ctx *lru_evict_ctx, bool locked)
+{
+	struct ttm_resource *res;
+	struct ttm_buffer_object *bo = NULL;
+	struct ttm_device *bdev;
+	int ret;
+	struct ttm_operation_ctx *ctx;
+	struct ttm_mem_evict_ctx *evict_ctx;
+
+	evict_ctx = (struct ttm_mem_evict_ctx *)lru_evict_ctx;
+	ctx = evict_ctx->ctx;
+
+	res = container_of(lru_entity, struct ttm_resource, lru_entity);
+	bo = res->bo;
+	bdev = bo->bdev;
+
 	if (bo->deleted) {
 		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
 					  ctx->no_wait_gpu, locked);
@@ -650,6 +748,28 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	return ret;
 }
 
+struct drm_lru_evict_func ttm_evict_func = {
+	.evict_allowable = ttm_mem_evict_allowable,
+	.evict_busy_entity = ttm_mem_evict_busy_entity,
+	.evict_entity = ttm_mem_evict_entity
+};
+EXPORT_SYMBOL(ttm_evict_func);
+
+int ttm_mem_evict_first(struct ttm_device *bdev,
+			struct ttm_resource_manager *man,
+			const struct ttm_place *place,
+			struct ttm_operation_ctx *ctx,
+			struct ww_acquire_ctx *ticket)
+{
+	struct drm_lru_evict_ctx evict_ctx = {
+			.data1 = place,
+			.data2 = ctx,
+			.data3 = ticket
+	};
+
+	return drm_lru_evict_first(man->lru_mgr, &evict_ctx);
+}
+
 /**
  * ttm_bo_pin - Pin the buffer object.
  * @bo: The buffer object to pin
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 49f32df32204..223b198fe371 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -50,6 +50,7 @@ struct ttm_place;
 struct ttm_resource;
 struct ttm_resource_manager;
 struct ttm_tt;
+struct drm_lru_evict_func;
 
 /**
  * enum ttm_bo_type
@@ -424,4 +425,5 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 
+extern struct drm_lru_evict_func ttm_evict_func;
 #endif
-- 
2.26.3

