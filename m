Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8272C64EA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679D76ECAB;
	Fri, 27 Nov 2020 12:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE126EC9D;
 Fri, 27 Nov 2020 12:10:01 +0000 (UTC)
IronPort-SDR: MugP7D+Pmh9A6Yy9TwbWS8vut04oYFYaOtju8mQcTGlIn4/BOQ1ah87IJqwtYuL20hmYgPog6R
 M7u0mtsqKz9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540744"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540744"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:00 -0800
IronPort-SDR: HBWWFpiBYukguEVFSjF195e5wtFDTXdeIRvGIWwvRBYiCc7S5yYNVr/5P7A4ZvHOFPUCaDnBqY
 tbgUe+eazmtA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029182"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 083/162] drm/i915: Update the helper to set correct mapping
Date: Fri, 27 Nov 2020 12:05:59 +0000
Message-Id: <20201127120718.454037-84-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 dri-devel@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

Determine the possible coherent map type based on object location,
and if target has llc or if user requires an always coherent
mapping.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c            |  3 ++-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c            |  2 +-
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c |  4 ++--
 drivers/gpu/drm/i915/gt/intel_ring.c                 |  9 ++++++---
 drivers/gpu/drm/i915/gt/intel_timeline.c             |  8 ++++++--
 drivers/gpu/drm/i915/gt/selftest_context.c           |  3 ++-
 drivers/gpu/drm/i915/gt/selftest_execlists.c         |  3 ++-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c         |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc.c               |  4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c               |  4 +++-
 drivers/gpu/drm/i915/i915_drv.h                      | 11 +++++++++--
 drivers/gpu/drm/i915/selftests/igt_spinner.c         |  4 ++--
 12 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 420c6a35f3ed..677c97ded81d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -680,7 +680,8 @@ static int init_status_page(struct intel_engine_cs *engine)
 	if (ret)
 		goto err;
 
-	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map(obj,
+					i915_coherent_map_type(engine->i915, obj, true));
 	if (IS_ERR(vaddr)) {
 		ret = PTR_ERR(vaddr);
 		goto err_unpin;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 5d51144ef074..1b2009b4dcb7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -24,7 +24,7 @@ static void dbg_poison_ce(struct intel_context *ce)
 
 	if (ce->state) {
 		struct drm_i915_gem_object *obj = ce->state->obj;
-		int type = i915_coherent_map_type(ce->engine->i915);
+		int type = i915_coherent_map_type(ce->engine->i915, obj, true);
 		void *map;
 
 		if (!i915_gem_object_trylock(ce->state->obj))
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 7eec42b27bc1..582a9044727e 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3535,8 +3535,8 @@ __execlists_context_pre_pin(struct intel_context *ce,
 	GEM_BUG_ON(!i915_vma_is_pinned(ce->state));
 
 	*vaddr = i915_gem_object_pin_map(ce->state->obj,
-					i915_coherent_map_type(ce->engine->i915) |
-					I915_MAP_OVERRIDE);
+					 i915_coherent_map_type(ce->engine->i915, ce->state->obj, false) |
+					 I915_MAP_OVERRIDE);
 	if (IS_ERR(*vaddr))
 		return PTR_ERR(*vaddr);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
index 4034a4bac7f0..d636c6ed88b7 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring.c
@@ -51,9 +51,12 @@ int intel_ring_pin(struct intel_ring *ring, struct i915_gem_ww_ctx *ww)
 
 	if (i915_vma_is_map_and_fenceable(vma))
 		addr = (void __force *)i915_vma_pin_iomap(vma);
-	else
-		addr = i915_gem_object_pin_map(vma->obj,
-					       i915_coherent_map_type(vma->vm->i915));
+	else {
+		int type = i915_coherent_map_type(vma->vm->i915, vma->obj, false);
+
+		addr = i915_gem_object_pin_map(vma->obj, type);
+	}
+
 	if (IS_ERR(addr)) {
 		ret = PTR_ERR(addr);
 		goto err_ring;
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b2d04717db20..065943781586 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -31,6 +31,7 @@ static int __hwsp_alloc(struct intel_gt *gt, struct intel_timeline_hwsp *hwsp)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	struct drm_i915_gem_object *obj;
+	int type;
 	int ret;
 
 	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
@@ -47,7 +48,8 @@ static int __hwsp_alloc(struct intel_gt *gt, struct intel_timeline_hwsp *hwsp)
 	}
 
 	/* Pin early so we can call i915_ggtt_pin_unlocked(). */
-	hwsp->vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+	type = i915_coherent_map_type(i915, obj, true);
+	hwsp->vaddr = i915_gem_object_pin_map(obj, type);
 	if (IS_ERR(hwsp->vaddr)) {
 		ret = PTR_ERR(hwsp->vaddr);
 		goto out_unlock;
@@ -235,9 +237,11 @@ intel_timeline_pin_map(struct intel_timeline *timeline)
 	if (!timeline->hwsp_cacheline) {
 		struct drm_i915_gem_object *obj = timeline->hwsp_ggtt->obj;
 		u32 ofs = offset_in_page(timeline->hwsp_offset);
+		int type;
 		void *vaddr;
 
-		vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+		type = i915_coherent_map_type(timeline->gt->i915, obj, true);
+		vaddr = i915_gem_object_pin_map(obj, type);
 		if (IS_ERR(vaddr))
 			return PTR_ERR(vaddr);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index d9b0ebc938f1..86b6795dc4f3 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -89,7 +89,8 @@ static int __live_context_size(struct intel_engine_cs *engine)
 		goto err;
 
 	vaddr = i915_gem_object_pin_map_unlocked(ce->state->obj,
-						 i915_coherent_map_type(engine->i915));
+						 i915_coherent_map_type(engine->i915,
+									ce->state->obj, false));
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
 		intel_context_unpin(ce);
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 124011f6fb51..cb17da6a616f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -5854,7 +5854,8 @@ static int compare_isolation(struct intel_engine_cs *engine,
 	}
 
 	lrc = i915_gem_object_pin_map_unlocked(ce->state->obj,
-				      i915_coherent_map_type(engine->i915));
+					       i915_coherent_map_type(engine->i915,
+								      ce->state->obj, true));
 	if (IS_ERR(lrc)) {
 		err = PTR_ERR(lrc);
 		goto err_B1;
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index e3027cebab5b..bc93dba3c8df 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -88,7 +88,7 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
 	h->seqno = memset(vaddr, 0xff, PAGE_SIZE);
 
 	vaddr = i915_gem_object_pin_map_unlocked(h->obj,
-						 i915_coherent_map_type(gt->i915));
+						 i915_coherent_map_type(gt->i915, h->obj, false));
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
 		goto err_unpin_hws;
@@ -149,7 +149,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 		return ERR_CAST(obj);
 	}
 
-	vaddr = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(gt->i915));
+	vaddr = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(gt->i915, obj, false));
 	if (IS_ERR(vaddr)) {
 		i915_gem_object_put(obj);
 		i915_vm_put(vm);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index a65661eb5d5d..b54b9de31c3e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -694,7 +694,9 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
-	vaddr = i915_gem_object_pin_map_unlocked(vma->obj, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
+						 i915_coherent_map_type(guc_to_gt(guc)->i915,
+									vma->obj, true));
 	if (IS_ERR(vaddr)) {
 		i915_vma_unpin_and_release(&vma, 0);
 		return PTR_ERR(vaddr);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 2126dd81ac38..56d2144dc6a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -82,7 +82,9 @@ static int intel_huc_rsa_data_create(struct intel_huc *huc)
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
-	vaddr = i915_gem_object_pin_map_unlocked(vma->obj, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
+						 i915_coherent_map_type(gt->i915,
+									vma->obj, true));
 	if (IS_ERR(vaddr)) {
 		i915_vma_unpin_and_release(&vma, 0);
 		return PTR_ERR(vaddr);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index ce8d5ff8b9f4..13cb4936f15c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -78,6 +78,7 @@
 #include "gem/i915_gem_context_types.h"
 #include "gem/i915_gem_shrinker.h"
 #include "gem/i915_gem_stolen.h"
+#include "gem/i915_gem_lmem.h"
 
 #include "gt/intel_engine.h"
 #include "gt/intel_gt_types.h"
@@ -2027,9 +2028,15 @@ static inline int intel_hws_csb_write_index(struct drm_i915_private *i915)
 }
 
 static inline enum i915_map_type
-i915_coherent_map_type(struct drm_i915_private *i915)
+i915_coherent_map_type(struct drm_i915_private *i915,
+		       struct drm_i915_gem_object *obj, bool always_coherent)
 {
-	return HAS_LLC(i915) ? I915_MAP_WB : I915_MAP_WC;
+	if (i915_gem_object_is_lmem(obj))
+		return I915_MAP_WC;
+	if (HAS_LLC(i915) || always_coherent)
+		return I915_MAP_WB;
+	else
+		return I915_MAP_WC;
 }
 
 static inline u64 i915_cs_timestamp_ns_to_ticks(struct drm_i915_private *i915, u64 val)
diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.c b/drivers/gpu/drm/i915/selftests/igt_spinner.c
index 9c461edb0b73..b2a1f98c97f5 100644
--- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
+++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
@@ -93,9 +93,9 @@ int igt_spinner_pin(struct igt_spinner *spin,
 	}
 
 	if (!spin->batch) {
-		unsigned int mode =
-			i915_coherent_map_type(spin->gt->i915);
+		unsigned int mode;
 
+		mode = i915_coherent_map_type(spin->gt->i915, spin->obj, false);
 		vaddr = igt_spinner_pin_obj(ce, ww, spin->obj, mode, &spin->batch_vma);
 		if (IS_ERR(vaddr))
 			return PTR_ERR(vaddr);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
