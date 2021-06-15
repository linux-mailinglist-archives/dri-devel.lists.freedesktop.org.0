Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23103A7B64
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 12:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23B26E23B;
	Tue, 15 Jun 2021 10:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6823F6E22B;
 Tue, 15 Jun 2021 10:04:58 +0000 (UTC)
IronPort-SDR: Bp1Xg9ALpj+aIl4qF06rWzW38OWvYuxBLQoEEHry8hgtham6tXXEmBpH7/0WC/yGMU6c3VwXAy
 DeQq/w522Zcg==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="202936426"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="202936426"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 03:04:55 -0700
IronPort-SDR: +UjwLZMwunbmfgGDXoNm+iFrmQijOgNiP1LX8apgWcvQfmvrXHabfvL45l0MT0PkvY3Jihzzrf
 gFIjaeObAVEw==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="421076013"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 03:04:53 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3] drm/i915/ttm: accelerated move implementation
Date: Tue, 15 Jun 2021 15:36:21 +0530
Message-Id: <20210615100621.5805-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0e309744-4d13-69de-2ad8-ee0df5cd46c1@linux.intel.com>
References: <0e309744-4d13-69de-2ad8-ee0df5cd46c1@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Invokes the pipelined page migration through blt, for
i915_ttm_move requests of eviction and also obj clear.

v2:
 - subfunction for accel_move (Thomas)
 - engine_pm_get/put around context_move/clear (Thomas)
 - Invalidation at accel_clear (Thomas)

v3:
 - Timeout is set for MAX_SCHEDULE_TIMEOUT (Thomas)
 - s/TTM_PL_PRIV/I915_PL_LMEM0 (Thomas)

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 88 +++++++++++++++++++++----
 1 file changed, 75 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 3748098b42d5..94571757fb42 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -15,6 +15,9 @@
 #include "gem/i915_gem_ttm.h"
 #include "gem/i915_gem_mman.h"
 
+#include "gt/intel_migrate.h"
+#include "gt/intel_engine_pm.h"
+
 #define I915_PL_LMEM0 TTM_PL_PRIV
 #define I915_PL_SYSTEM TTM_PL_SYSTEM
 #define I915_PL_STOLEN TTM_PL_VRAM
@@ -282,6 +285,62 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 	return intel_region_ttm_node_to_st(obj->mm.region, res->mm_node);
 }
 
+static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
+			       struct ttm_resource *dst_mem,
+			       struct sg_table *dst_st)
+{
+	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
+						     bdev);
+	struct ttm_resource_manager *src_man =
+		ttm_manager_type(bo->bdev, bo->mem.mem_type);
+	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	struct sg_table *src_st;
+	struct i915_request *rq;
+	int ret;
+
+	if (!i915->gt.migrate.context)
+		return -EINVAL;
+
+	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm)) {
+		if (bo->type == ttm_bo_type_kernel)
+			return -EINVAL;
+
+		if (bo->ttm &&
+		    !(bo->ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
+			return 0;
+
+		intel_engine_pm_get(i915->gt.migrate.context->engine);
+		ret = intel_context_migrate_clear(i915->gt.migrate.context, NULL,
+						  dst_st->sgl, I915_CACHE_NONE,
+						  dst_mem->mem_type >= I915_PL_LMEM0,
+						  0, &rq);
+
+		if (!ret && rq) {
+			i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
+			i915_request_put(rq);
+		}
+		intel_engine_pm_put(i915->gt.migrate.context->engine);
+	} else {
+		src_st = src_man->use_tt ? i915_ttm_tt_get_st(bo->ttm) :
+						obj->ttm.cached_io_st;
+
+		intel_engine_pm_get(i915->gt.migrate.context->engine);
+		ret = intel_context_migrate_copy(i915->gt.migrate.context,
+						 NULL, src_st->sgl, I915_CACHE_NONE,
+						 bo->mem.mem_type >= I915_PL_LMEM0,
+						 dst_st->sgl, I915_CACHE_NONE,
+						 dst_mem->mem_type >= I915_PL_LMEM0,
+						 &rq);
+		if (!ret && rq) {
+			i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
+			i915_request_put(rq);
+		}
+		intel_engine_pm_put(i915->gt.migrate.context->engine);
+	}
+
+	return ret;
+}
+
 static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 			 struct ttm_operation_ctx *ctx,
 			 struct ttm_resource *dst_mem,
@@ -332,19 +391,22 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	if (IS_ERR(dst_st))
 		return PTR_ERR(dst_st);
 
-	/* If we start mapping GGTT, we can no longer use man::use_tt here. */
-	dst_iter = dst_man->use_tt ?
-		ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
-		ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
-					 dst_st, dst_reg->region.start);
-
-	src_iter = src_man->use_tt ?
-		ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
-		ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
-					 obj->ttm.cached_io_st,
-					 src_reg->region.start);
-
-	ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
+	ret = i915_ttm_accel_move(bo, dst_mem, dst_st);
+	if (ret) {
+		/* If we start mapping GGTT, we can no longer use man::use_tt here. */
+		dst_iter = dst_man->use_tt ?
+			ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
+			ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
+						 dst_st, dst_reg->region.start);
+
+		src_iter = src_man->use_tt ?
+			ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
+			ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
+						 obj->ttm.cached_io_st,
+						 src_reg->region.start);
+
+		ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
+	}
 	ttm_bo_move_sync_cleanup(bo, dst_mem);
 	i915_ttm_free_cached_io_st(obj);
 
-- 
2.20.1

