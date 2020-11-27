Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800012C6580
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D826ED91;
	Fri, 27 Nov 2020 12:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCDE6ED82;
 Fri, 27 Nov 2020 12:12:08 +0000 (UTC)
IronPort-SDR: dTEykAMdS4hRxQlaRMosUmlsCOMPpGtpkB/PeV5gHXKhA+LONMIWDeWYBZ48xDdM/BL/MEPi5x
 bR2hyxMXRXWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883829"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883829"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:07 -0800
IronPort-SDR: LToREtdqm7tmXCn4cNNWIiponY0Tp0/30uUjhoh7JoyI/ML8bgVM7TMObD1T6GrsOqfcZOG0se
 pygw7kV6vIIQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029993"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:06 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 145/162] drm/i915/dg1: Add dedicated context for blitter
 eviction
Date: Fri, 27 Nov 2020 12:07:01 +0000
Message-Id: <20201127120718.454037-146-matthew.auld@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Without a dedicated context there can be a "deadlock" due inversion
between object clearing and eviction on the shared blitter context
timeline.

Clearing of a newly allocated objects emits it's request, but to execute
the request, something may need to be evicted in order to make space for
the new VMA. When the eviction code emits it's copy request it will be
after the buffer clear one in the ringbuffer and so neither can complete.

If we add a dedicated context for eviction then we can de-couple the two
and break the "deadlock".

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c   |  4 +-
 drivers/gpu/drm/i915/gt/intel_engine.h       |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 40 ++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_engine_pm.c    |  9 +++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
 5 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index c84443e01ef1..ddb448f275eb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -767,7 +767,7 @@ static struct i915_vma *
 i915_window_vma_init(struct drm_i915_private *i915,
 		     struct intel_memory_region *mem)
 {
-	struct intel_context *ce = i915->gt.engine[BCS0]->blitter_context;
+	struct intel_context *ce = i915->gt.engine[BCS0]->evict_context;
 	struct i915_address_space *vm = ce->vm;
 	struct i915_vma *vma;
 	int ret;
@@ -984,7 +984,7 @@ int i915_window_blt_copy(struct drm_i915_gem_object *dst,
 			 struct drm_i915_gem_object *src)
 {
 	struct drm_i915_private *i915 = to_i915(src->base.dev);
-	struct intel_context *ce = i915->gt.engine[BCS0]->blitter_context;
+	struct intel_context *ce = i915->gt.engine[BCS0]->evict_context;
 	bool src_is_lmem = i915_gem_object_is_lmem(src);
 	bool dst_is_lmem = i915_gem_object_is_lmem(dst);
 	u64 remain = src->base.size, offset = 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 188c5ff6dc64..623a6876dca5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -188,6 +188,8 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
 #define I915_GEM_HWS_SEQNO_ADDR		(I915_GEM_HWS_SEQNO * sizeof(u32))
 #define I915_GEM_HWS_BLITTER		0x42
 #define I915_GEM_HWS_BLITTER_ADDR	(I915_GEM_HWS_BLITTER * sizeof(u32))
+#define I915_GEM_HWS_EVICT		0x44
+#define I915_GEM_HWS_EVICT_ADDR		(I915_GEM_HWS_EVICT * sizeof(u32))
 #define I915_GEM_HWS_SCRATCH		0x80
 
 #define I915_HWS_CSB_BUF0_INDEX		0x10
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 9e0394b06f38..a83af8775a64 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -874,6 +874,20 @@ create_blitter_context(struct intel_engine_cs *engine)
 	return ce;
 }
 
+static struct intel_context *
+create_evict_context(struct intel_engine_cs *engine)
+{
+	static struct lock_class_key evict;
+	struct intel_context *ce;
+
+	ce = create_pinned_context(engine, I915_GEM_HWS_EVICT_ADDR, &evict,
+				   "evict_context");
+	if (IS_ERR(ce))
+		return ce;
+
+	return ce;
+}
+
 /**
  * intel_engines_init_common - initialize cengine state which might require hw access
  * @engine: Engine to initialize.
@@ -912,22 +926,35 @@ static int engine_init_common(struct intel_engine_cs *engine)
 	engine->emit_fini_breadcrumb_dw = ret;
 
 	/*
-	 * The blitter context is used to quickly memset or migrate objects
-	 * in local memory, so it has to always be available.
+	 * The blitter and evict contexts are used to clear and migrate objects
+	 * in local memory so they have to always be available.
 	 */
 	if (engine->class == COPY_ENGINE_CLASS) {
 		ce = create_blitter_context(engine);
 		if (IS_ERR(ce)) {
 			ret = PTR_ERR(ce);
-			goto err_unpin;
+			goto err_blitter;
 		}
 
 		engine->blitter_context = ce;
+
+		if (HAS_LMEM(engine->i915)) {
+			ce = create_evict_context(engine);
+			if (IS_ERR(ce)) {
+				ret = PTR_ERR(ce);
+				goto err_evict;
+			}
+
+			engine->evict_context = ce;
+		}
 	}
 
 	return 0;
 
-err_unpin:
+err_evict:
+	intel_context_unpin(engine->blitter_context);
+	intel_context_put(engine->blitter_context);
+err_blitter:
 	intel_context_unpin(engine->kernel_context);
 err_context:
 	intel_context_put(engine->kernel_context);
@@ -986,6 +1013,11 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 	if (engine->default_state)
 		fput(engine->default_state);
 
+	if (engine->evict_context) {
+		intel_context_unpin(engine->evict_context);
+		intel_context_put(engine->evict_context);
+	}
+
 	if (engine->blitter_context) {
 		intel_context_unpin(engine->blitter_context);
 		intel_context_put(engine->blitter_context);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 69c8ea70d1e8..a5ca95270e92 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -66,10 +66,13 @@ static int __engine_unpark(struct intel_wakeref *wf)
 		ce->ops->reset(ce);
 	}
 
-	if (engine->class == COPY_ENGINE_CLASS) {
-		ce = engine->blitter_context;
+	ce = engine->blitter_context;
+	if (ce)
+		ce->ops->reset(ce);
+
+	ce = engine->evict_context;
+	if (ce)
 		ce->ops->reset(ce);
-	}
 
 	if (engine->unpark)
 		engine->unpark(engine);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index cb2de4bf86ba..14e92423661b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -348,6 +348,7 @@ struct intel_engine_cs {
 
 	struct intel_context *kernel_context; /* pinned */
 	struct intel_context *blitter_context; /* pinned; exists for BCS only */
+	struct intel_context *evict_context; /* pinned; exists for BCS only */
 
 	intel_engine_mask_t saturated; /* submitting semaphores too late? */
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
