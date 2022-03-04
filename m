Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8204CE02D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 23:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923B113478;
	Fri,  4 Mar 2022 22:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B223113478;
 Fri,  4 Mar 2022 22:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646432387; x=1677968387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cKHRnfT7FKFbtrTJu5rOU1u7ylmmcSMBlej6L5aQpz8=;
 b=nG5vACScm1v580OqHJbBVUPlK+V1ZA3NtmxNIdeQtWpD8lFvKi4UrRoc
 OfL+dGLu8y/iI9MG5zVNd9iGtfItvLIYChjOZw8ZzGYi/I8N2ki5dKW3Z
 +OkN/pMQoNZ05sUQM3Zd9yTdv0WoLI7R4IXrGwZrYfAfBeSu7j7u+jp0/
 fkJUi5GHfkSjaONSYCj8J0hnX3T1YO9hdsQxBOngEk4tmo2KFw4Uwk/M5
 O0sKYkOXKLKhEMSuV4KJBAI5Rlrk1PYNVgOqSh5g2rhmSqtuwVfY80Rs0
 D8qw5a7ysT7ggBSvvdWfRuQwhz1TJZqK15K3v0Uh97O0Yx6kUarvdiGbO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="234682146"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="234682146"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 14:19:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="642650604"
Received: from fphy-dev.jf.intel.com (HELO fyang16-desk.jf.intel.com)
 ([134.134.244.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 14:19:46 -0800
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Date: Fri,  4 Mar 2022 14:14:07 -0800
Message-Id: <20220304221407.2416898-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: stuart.summers@intel.com, akeem.g.abodunrin@intel.com,
 Fei Yang <fei.yang@intel.com>, chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

GPU hangs have been observed when multiple engines write to the
same aux_inv register at the same time. To avoid this each engine
should only invalidate its own auxiliary table. The function
gen12_emit_flush_xcs() currently invalidate the auxiliary table for
all engines because the rq->engine is not necessarily the engine
eventually carrying out the request, and potentially the engine
could even be a virtual one (with engine->instance being -1).
With this patch, auxiliary table invalidation is done only for the
engine executing the request. And the mmio address for the aux_inv
register is set after the engine instance becomes certain.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c      |  9 +++
 drivers/gpu/drm/i915/gt/gen6_engine_cs.c      |  9 +++
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 61 ++++++++-----------
 .../drm/i915/gt/intel_execlists_submission.c  | 35 +++++++++++
 drivers/gpu/drm/i915/i915_request.h           |  2 +
 5 files changed, 82 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen2_engine_cs.c b/drivers/gpu/drm/i915/gt/gen2_engine_cs.c
index 1c82caf525c3..0ec4986e4805 100644
--- a/drivers/gpu/drm/i915/gt/gen2_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen2_engine_cs.c
@@ -37,6 +37,9 @@ int gen2_emit_flush(struct i915_request *rq, u32 mode)
 
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen2 */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -123,6 +126,9 @@ int gen4_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen4 rcs */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -138,6 +144,9 @@ int gen4_emit_flush_vcs(struct i915_request *rq, u32 mode)
 	*cs++ = MI_NOOP;
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen4 vcs */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/gen6_engine_cs.c b/drivers/gpu/drm/i915/gt/gen6_engine_cs.c
index 5e65550b4dfb..efe51c4662fe 100644
--- a/drivers/gpu/drm/i915/gt/gen6_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen6_engine_cs.c
@@ -137,6 +137,9 @@ int gen6_emit_flush_rcs(struct i915_request *rq, u32 mode)
 	*cs++ = 0;
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen6 */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -208,6 +211,9 @@ static int mi_flush_dw(struct i915_request *rq, u32 flags)
 
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen6 */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -347,6 +353,9 @@ int gen7_emit_flush_rcs(struct i915_request *rq, u32 mode)
 	*cs++ = 0;
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen7 rcs */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index b1b9c3fd7bf9..b6374cf53314 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -73,6 +73,9 @@ int gen8_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen8 rcs */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -106,6 +109,9 @@ int gen8_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	*cs++ = 0; /* value */
 	intel_ring_advance(rq, cs);
 
+	/* hsdes: 1809175790. No fixup needed for gen8 xcs */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -157,6 +163,9 @@ int gen11_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		intel_ring_advance(rq, cs);
 	}
 
+	/* hsdes: 1809175790. No fixup needed for gen11 rcs */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -165,30 +174,6 @@ static u32 preparser_disable(bool state)
 	return MI_ARB_CHECK | 1 << 8 | state;
 }
 
-static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
-{
-	static const i915_reg_t vd[] = {
-		GEN12_VD0_AUX_NV,
-		GEN12_VD1_AUX_NV,
-		GEN12_VD2_AUX_NV,
-		GEN12_VD3_AUX_NV,
-	};
-
-	static const i915_reg_t ve[] = {
-		GEN12_VE0_AUX_NV,
-		GEN12_VE1_AUX_NV,
-	};
-
-	if (engine->class == VIDEO_DECODE_CLASS)
-		return vd[engine->instance];
-
-	if (engine->class == VIDEO_ENHANCEMENT_CLASS)
-		return ve[engine->instance];
-
-	GEM_BUG_ON("unknown aux_inv reg\n");
-	return INVALID_MMIO_REG;
-}
-
 static u32 *gen12_emit_aux_table_inv(const i915_reg_t inv_reg, u32 *cs)
 {
 	*cs++ = MI_LOAD_REGISTER_IMM(1);
@@ -274,6 +259,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		intel_ring_advance(rq, cs);
 	}
 
+	/* hsdes: 1809175790. aux_inv has been done above, no fixup needed */
+	rq->aux_inv_fixup = NULL;
+
 	return 0;
 }
 
@@ -288,7 +276,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode & EMIT_INVALIDATE)
 		aux_inv = rq->engine->mask & ~BIT(BCS0);
 	if (aux_inv)
-		cmd += 2 * hweight32(aux_inv) + 2;
+		cmd += 4;
 
 	cs = intel_ring_begin(rq, cmd);
 	if (IS_ERR(cs))
@@ -319,16 +307,21 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	*cs++ = 0; /* value */
 
 	if (aux_inv) { /* hsdes: 1809175790 */
-		struct intel_engine_cs *engine;
-		unsigned int tmp;
-
-		*cs++ = MI_LOAD_REGISTER_IMM(hweight32(aux_inv));
-		for_each_engine_masked(engine, rq->engine->gt, aux_inv, tmp) {
-			*cs++ = i915_mmio_reg_offset(aux_inv_reg(engine));
-			*cs++ = AUX_INV;
-		}
+		/*
+		 * We don't know which engine will eventually carry out
+		 * this request, so the mmio aux_inv register address is
+		 * unknown at this moment. We save the cs pointer supposed
+		 * to hold the aux_inv address in rq->aux_inv_fixup and set
+		 * it in execlists_dequeue() when the engine instance
+		 * carrying out this request becomes certain
+		 */
+		*cs++ = MI_LOAD_REGISTER_IMM(1);
+		rq->aux_inv_fixup = cs; /* save the pointer to aux_inv */
+		*cs++ = 0; /* mmio addr to be set at submission to HW */
+		*cs++ = AUX_INV;
 		*cs++ = MI_NOOP;
-	}
+	} else
+		rq->aux_inv_fixup = NULL;
 
 	if (mode & EMIT_INVALIDATE)
 		*cs++ = preparser_disable(false);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index e1470bb60f34..7e8552414275 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1258,6 +1258,34 @@ static bool completed(const struct i915_request *rq)
 	return __i915_request_is_complete(rq);
 }
 
+static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
+{
+	static const i915_reg_t vd[] = {
+		GEN12_VD0_AUX_NV,
+		GEN12_VD1_AUX_NV,
+		GEN12_VD2_AUX_NV,
+		GEN12_VD3_AUX_NV,
+	};
+
+	static const i915_reg_t ve[] = {
+		GEN12_VE0_AUX_NV,
+		GEN12_VE1_AUX_NV,
+	};
+
+	if (engine->class == VIDEO_DECODE_CLASS) {
+		GEM_BUG_ON(engine->instance >= ARRAY_SIZE(vd));
+		return vd[engine->instance];
+	}
+
+	if (engine->class == VIDEO_ENHANCEMENT_CLASS) {
+		GEM_BUG_ON(engine->instance >= ARRAY_SIZE(ve));
+		return ve[engine->instance];
+	}
+
+	GEM_BUG_ON("unknown aux_inv reg\n");
+	return INVALID_MMIO_REG;
+}
+
 static void execlists_dequeue(struct intel_engine_cs *engine)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
@@ -1538,6 +1566,13 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 			}
 
 			if (__i915_request_submit(rq)) {
+				/* hsdes: 1809175790 */
+				if (rq->aux_inv_fixup) {
+					*rq->aux_inv_fixup =
+						i915_mmio_reg_offset
+							(aux_inv_reg(engine));
+					rq->execution_mask = engine->mask;
+				}
 				if (!merge) {
 					*port++ = i915_request_get(last);
 					last = NULL;
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 28b1f9db5487..8e0764c43936 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -312,6 +312,8 @@ struct i915_request {
 	struct i915_capture_list *capture_list;
 #endif
 
+	u32 *aux_inv_fixup; /* hsdes: 1809175790 */
+
 	/** Time at which this request was emitted, in jiffies. */
 	unsigned long emitted_jiffies;
 
-- 
2.25.1

