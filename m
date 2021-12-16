Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1AB4774A3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6C41122F1;
	Thu, 16 Dec 2021 14:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48D10FF3B;
 Thu, 16 Dec 2021 14:28:07 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 11/17] drm/i915: Add ww ctx to i915_gem_object_trylock
Date: Thu, 16 Dec 2021 15:27:43 +0100
Message-Id: <20211216142749.1966107-12-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required for i915_gem_evict_vm, to be able to evict the entire VM,
including objects that are already locked to the current ww ctx.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h   | 8 ++++++--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c   | 2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c    | 2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c        | 2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c   | 2 +-
 6 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 66f20b803b01..f66d46882ea7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -210,9 +210,13 @@ static inline int i915_gem_object_lock_interruptible(struct drm_i915_gem_object
 	return __i915_gem_object_lock(obj, ww, true);
 }
 
-static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj)
+static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj,
+					   struct i915_gem_ww_ctx *ww)
 {
-	return dma_resv_trylock(obj->base.resv);
+	if (!ww)
+		return dma_resv_trylock(obj->base.resv);
+	else
+		return ww_mutex_trylock(&obj->base.resv->lock, &ww->ctx);
 }
 
 static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index ad2123369e0d..85ff182ddbc2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -216,7 +216,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 
 			/* May arrive from get_pages on another bo */
 			if (!ww) {
-				if (!i915_gem_object_trylock(obj))
+				if (!i915_gem_object_trylock(obj, NULL))
 					goto skip;
 			} else {
 				err = i915_gem_object_lock(obj, ww);
@@ -410,7 +410,7 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 		if (!vma->iomap || i915_vma_is_active(vma))
 			continue;
 
-		if (!i915_gem_object_trylock(obj))
+		if (!i915_gem_object_trylock(obj, NULL))
 			continue;
 
 		if (__i915_vma_unbind(vma) == 0)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index ad7a8e9e13e7..7df50fd6cc7b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -656,7 +656,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
 	i915_gem_object_set_cache_coherency(obj, cache_level);
 
-	if (WARN_ON(!i915_gem_object_trylock(obj)))
+	if (WARN_ON(!i915_gem_object_trylock(obj, NULL)))
 		return -EBUSY;
 
 	i915_gem_object_init_memory_region(obj, mem);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index a8a2ad44b7e3..b0a4a2dbe3ee 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -26,7 +26,7 @@ static void dbg_poison_ce(struct intel_context *ce)
 		int type = i915_coherent_map_type(ce->engine->i915, obj, true);
 		void *map;
 
-		if (!i915_gem_object_trylock(obj))
+		if (!i915_gem_object_trylock(obj, NULL))
 			return;
 
 		map = i915_gem_object_pin_map(obj, type);
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index bb99fc03f503..240265354274 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -17,7 +17,7 @@ static int mock_timeline_pin(struct intel_timeline *tl)
 {
 	int err;
 
-	if (WARN_ON(!i915_gem_object_trylock(tl->hwsp_ggtt->obj)))
+	if (WARN_ON(!i915_gem_object_trylock(tl->hwsp_ggtt->obj, NULL)))
 		return -EBUSY;
 
 	err = intel_timeline_pin_map(tl);
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index e21787301bbd..cb574ea6b29d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -465,7 +465,7 @@ create_init_lmem_internal(struct intel_gt *gt, size_t sz, bool try_lmem)
 			return obj;
 	}
 
-	i915_gem_object_trylock(obj);
+	i915_gem_object_trylock(obj, NULL);
 	err = i915_gem_object_pin_pages(obj);
 	if (err) {
 		i915_gem_object_unlock(obj);
-- 
2.34.1

