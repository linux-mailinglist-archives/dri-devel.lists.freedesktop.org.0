Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF5313B518
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 23:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4476E59F;
	Tue, 14 Jan 2020 22:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495746E593;
 Tue, 14 Jan 2020 22:07:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 14:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="217896772"
Received: from unknown (HELO localhost.jf.intel.com) ([10.166.29.74])
 by orsmga008.jf.intel.com with ESMTP; 14 Jan 2020 14:07:36 -0800
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
To: akeem.g.abodunrin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, omer.aran@intel.com,
 pragyansri.pathi@intel.com, d.scott.phillips@intel.com,
 david.c.stewart@intel.com, tony.luck@intel.com, jon.bloomfield@intel.com,
 sudeep.dutt@intel.com, daniel.vetter@intel.com, joonas.lahtinen@intel.com,
 jani.nikula@intel.com, chris.p.wilson@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@intel.com,
 francesco.balestrieri@intel.com
Subject: [RFC PATCH 1/2] drm/i915: Add mechanism to submit a context WA on
 ring submission
Date: Tue, 14 Jan 2020 06:51:35 -0800
Message-Id: <20200114145136.65373-2-akeem.g.abodunrin@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114145136.65373-1-akeem.g.abodunrin@intel.com>
References: <20200114145136.65373-1-akeem.g.abodunrin@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

This patch adds framework to submit an arbitrary batchbuffer on each
context switch to clear residual state for render engine on Gen7/7.5
devices.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: Kumar Valsan Prathap <prathap.kumar.valsan@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Balestrieri Francesco <francesco.balestrieri@intel.com>
Cc: Bloomfield Jon <jon.bloomfield@intel.com>
Cc: Dutt Sudeep <sudeep.dutt@intel.com>
---
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 102 +++++++++++++++++-
 1 file changed, 99 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index bc44fe8e5ffa..204c450b7c42 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -1384,7 +1384,9 @@ static int load_pd_dir(struct i915_request *rq,
 	return rq->engine->emit_flush(rq, EMIT_FLUSH);
 }
 
-static inline int mi_set_context(struct i915_request *rq, u32 flags)
+static inline int mi_set_context(struct i915_request *rq,
+				 struct intel_context *ce,
+				 u32 flags)
 {
 	struct drm_i915_private *i915 = rq->i915;
 	struct intel_engine_cs *engine = rq->engine;
@@ -1459,7 +1461,7 @@ static inline int mi_set_context(struct i915_request *rq, u32 flags)
 
 	*cs++ = MI_NOOP;
 	*cs++ = MI_SET_CONTEXT;
-	*cs++ = i915_ggtt_offset(rq->context->state) | flags;
+	*cs++ = i915_ggtt_offset(ce->state) | flags;
 	/*
 	 * w/a: MI_SET_CONTEXT must always be followed by MI_NOOP
 	 * WaMiSetContext_Hang:snb,ivb,vlv
@@ -1574,13 +1576,51 @@ static int switch_mm(struct i915_request *rq, struct i915_address_space *vm)
 	return rq->engine->emit_flush(rq, EMIT_INVALIDATE);
 }
 
+static int clear_residuals(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine = rq->engine;
+	int ret;
+
+	GEM_BUG_ON(!engine->kernel_context->state);
+
+	ret = switch_mm(rq, vm_alias(engine->kernel_context));
+	if (ret)
+		return ret;
+
+	ret = mi_set_context(rq,
+			     engine->kernel_context,
+			     MI_MM_SPACE_GTT | MI_RESTORE_INHIBIT);
+	if (ret)
+		return ret;
+
+	ret = engine->emit_bb_start(rq,
+				    engine->wa_ctx.vma->node.start, 0,
+				    0);
+	if (ret)
+		return ret;
+
+	ret = engine->emit_flush(rq, EMIT_FLUSH);
+	if (ret)
+		return ret;
+
+	/* Always invalidate before the next switch_mm() */
+	return engine->emit_flush(rq, EMIT_INVALIDATE);
+}
+
 static int switch_context(struct i915_request *rq)
 {
+	struct intel_engine_cs *engine = rq->engine;
 	struct intel_context *ce = rq->context;
 	int ret;
 
 	GEM_BUG_ON(HAS_EXECLISTS(rq->i915));
 
+	if (engine->wa_ctx.vma && ce != engine->kernel_context) {
+		ret = clear_residuals(rq);
+		if (ret)
+			return ret;
+	}
+
 	ret = switch_mm(rq, vm_alias(ce));
 	if (ret)
 		return ret;
@@ -1600,7 +1640,7 @@ static int switch_context(struct i915_request *rq)
 		else
 			flags |= MI_RESTORE_INHIBIT;
 
-		ret = mi_set_context(rq, flags);
+		ret = mi_set_context(rq, ce, flags);
 		if (ret)
 			return ret;
 	}
@@ -1792,6 +1832,8 @@ static void ring_release(struct intel_engine_cs *engine)
 
 	intel_engine_cleanup_common(engine);
 
+	i915_vma_unpin_and_release(&engine->wa_ctx.vma, 0);
+
 	intel_ring_unpin(engine->legacy.ring);
 	intel_ring_put(engine->legacy.ring);
 
@@ -1939,6 +1981,52 @@ static void setup_vecs(struct intel_engine_cs *engine)
 	engine->emit_fini_breadcrumb = gen7_xcs_emit_breadcrumb;
 }
 
+static int gen7_ctx_switch_bb_setup(struct intel_engine_cs * const engine,
+				    struct i915_vma * const vma)
+{
+	return 0;
+}
+
+static int gen7_ctx_switch_bb_init(struct intel_engine_cs *engine)
+{
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+	int size;
+	int err;
+
+	size = gen7_ctx_switch_bb_setup(engine, NULL /* probe size */);
+	if (size <= 0)
+		return size;
+
+	size = ALIGN(size, PAGE_SIZE);
+	obj = i915_gem_object_create_internal(engine->i915, size);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	vma = i915_vma_instance(obj, engine->gt->vm, NULL);
+	if (IS_ERR(vma)) {
+		err = PTR_ERR(vma);
+		goto err_obj;
+	}
+
+	err = i915_vma_pin(vma, 0, 0, PIN_USER | PIN_HIGH);
+	if (err)
+		goto err_obj;
+
+	err = gen7_ctx_switch_bb_setup(engine, vma);
+	if (err)
+		goto err_unpin;
+
+	engine->wa_ctx.vma = vma;
+	return 0;
+
+err_unpin:
+	i915_vma_unpin(vma);
+err_obj:
+	i915_gem_object_put(obj);
+	return err;
+}
+
 int intel_ring_submission_setup(struct intel_engine_cs *engine)
 {
 	struct intel_timeline *timeline;
@@ -1992,11 +2080,19 @@ int intel_ring_submission_setup(struct intel_engine_cs *engine)
 
 	GEM_BUG_ON(timeline->hwsp_ggtt != engine->status_page.vma);
 
+	if (IS_GEN(engine->i915, 7) && engine->class == RENDER_CLASS) {
+		err = gen7_ctx_switch_bb_init(engine);
+		if (err)
+			goto err_ring_unpin;
+	}
+
 	/* Finally, take ownership and responsibility for cleanup! */
 	engine->release = ring_release;
 
 	return 0;
 
+err_ring_unpin:
+	intel_ring_unpin(ring);
 err_ring:
 	intel_ring_put(ring);
 err_timeline_unpin:
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
