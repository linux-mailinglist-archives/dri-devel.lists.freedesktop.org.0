Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18313B9780
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3806EC22;
	Thu,  1 Jul 2021 20:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AAF6EB9B;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436155"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436155"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564423"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/53] drm/i915/xehp: Extra media engines - Part 1 (engine
 definitions)
Date: Thu,  1 Jul 2021 13:23:41 -0700
Message-Id: <20210701202427.1547543-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Xe_HP can have a lot of extra media engines. This patch adds the basic
definitions for them.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     |  7 ++-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 50 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 14 ++++--
 drivers/gpu/drm/i915/i915_reg.h              |  6 +++
 4 files changed, 69 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 87b06572fd2e..35edc55720f4 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -279,7 +279,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode & EMIT_INVALIDATE)
 		aux_inv = rq->engine->mask & ~BIT(BCS0);
 	if (aux_inv)
-		cmd += 2 * hweight8(aux_inv) + 2;
+		cmd += 2 * hweight32(aux_inv) + 2;
 
 	cs = intel_ring_begin(rq, cmd);
 	if (IS_ERR(cs))
@@ -313,9 +313,8 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 		struct intel_engine_cs *engine;
 		unsigned int tmp;
 
-		*cs++ = MI_LOAD_REGISTER_IMM(hweight8(aux_inv));
-		for_each_engine_masked(engine, rq->engine->gt,
-				       aux_inv, tmp) {
+		*cs++ = MI_LOAD_REGISTER_IMM(hweight32(aux_inv));
+		for_each_engine_masked(engine, rq->engine->gt, aux_inv, tmp) {
 			*cs++ = i915_mmio_reg_offset(aux_inv_reg(engine));
 			*cs++ = AUX_INV;
 		}
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 4ab2c9abb943..6e2aa1acc4d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -104,6 +104,38 @@ static const struct engine_info intel_engines[] = {
 			{ .graphics_ver = 11, .base = GEN11_BSD4_RING_BASE }
 		},
 	},
+	[VCS4] = {
+		.hw_id = 0, /* not used in GEN12+, see MI_SEMAPHORE_SIGNAL */
+		.class = VIDEO_DECODE_CLASS,
+		.instance = 4,
+		.mmio_bases = {
+			{ .graphics_ver = 11, .base = XEHP_BSD5_RING_BASE }
+		},
+	},
+	[VCS5] = {
+		.hw_id = 0, /* not used in GEN12+, see MI_SEMAPHORE_SIGNAL */
+		.class = VIDEO_DECODE_CLASS,
+		.instance = 5,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHP_BSD6_RING_BASE }
+		},
+	},
+	[VCS6] = {
+		.hw_id = 0, /* not used in GEN12+, see MI_SEMAPHORE_SIGNAL */
+		.class = VIDEO_DECODE_CLASS,
+		.instance = 6,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHP_BSD7_RING_BASE }
+		},
+	},
+	[VCS7] = {
+		.hw_id = 0, /* not used in GEN12+, see MI_SEMAPHORE_SIGNAL */
+		.class = VIDEO_DECODE_CLASS,
+		.instance = 7,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHP_BSD8_RING_BASE }
+		},
+	},
 	[VECS0] = {
 		.hw_id = VECS0_HW,
 		.class = VIDEO_ENHANCEMENT_CLASS,
@@ -121,6 +153,22 @@ static const struct engine_info intel_engines[] = {
 			{ .graphics_ver = 11, .base = GEN11_VEBOX2_RING_BASE }
 		},
 	},
+	[VECS2] = {
+		.hw_id = 0, /* not used in GEN12+, see MI_SEMAPHORE_SIGNAL */
+		.class = VIDEO_ENHANCEMENT_CLASS,
+		.instance = 2,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHP_VEBOX3_RING_BASE }
+		},
+	},
+	[VECS3] = {
+		.hw_id = 0, /* not used in GEN12+, see MI_SEMAPHORE_SIGNAL */
+		.class = VIDEO_ENHANCEMENT_CLASS,
+		.instance = 3,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHP_VEBOX4_RING_BASE }
+		},
+	},
 };
 
 /**
@@ -269,6 +317,8 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 
 	BUILD_BUG_ON(MAX_ENGINE_CLASS >= BIT(GEN11_ENGINE_CLASS_WIDTH));
 	BUILD_BUG_ON(MAX_ENGINE_INSTANCE >= BIT(GEN11_ENGINE_INSTANCE_WIDTH));
+	BUILD_BUG_ON(I915_MAX_VCS > (MAX_ENGINE_INSTANCE + 1));
+	BUILD_BUG_ON(I915_MAX_VECS > (MAX_ENGINE_INSTANCE + 1));
 
 	if (GEM_DEBUG_WARN_ON(id >= ARRAY_SIZE(gt->engine)))
 		return -EINVAL;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 5b91068ab277..b25f594a7e4b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -46,7 +46,7 @@
 #define COPY_ENGINE_CLASS	3
 #define OTHER_CLASS		4
 #define MAX_ENGINE_CLASS	4
-#define MAX_ENGINE_INSTANCE	3
+#define MAX_ENGINE_INSTANCE	7
 
 #define I915_MAX_SLICES	3
 #define I915_MAX_SUBSLICES 8
@@ -64,7 +64,7 @@ struct intel_gt;
 struct intel_ring;
 struct intel_uncore;
 
-typedef u8 intel_engine_mask_t;
+typedef u32 intel_engine_mask_t;
 #define ALL_ENGINES ((intel_engine_mask_t)~0ul)
 
 struct intel_hw_status_page {
@@ -101,8 +101,8 @@ struct i915_ctx_workarounds {
 	struct i915_vma *vma;
 };
 
-#define I915_MAX_VCS	4
-#define I915_MAX_VECS	2
+#define I915_MAX_VCS	8
+#define I915_MAX_VECS	4
 
 /*
  * Engine IDs definitions.
@@ -115,9 +115,15 @@ enum intel_engine_id {
 	VCS1,
 	VCS2,
 	VCS3,
+	VCS4,
+	VCS5,
+	VCS6,
+	VCS7,
 #define _VCS(n) (VCS0 + (n))
 	VECS0,
 	VECS1,
+	VECS2,
+	VECS3,
 #define _VECS(n) (VECS0 + (n))
 	I915_NUM_ENGINES
 #define INVALID_ENGINE ((enum intel_engine_id)-1)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index f7dad8541417..d4546e871833 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2516,9 +2516,15 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define GEN11_BSD2_RING_BASE	0x1c4000
 #define GEN11_BSD3_RING_BASE	0x1d0000
 #define GEN11_BSD4_RING_BASE	0x1d4000
+#define XEHP_BSD5_RING_BASE	0x1e0000
+#define XEHP_BSD6_RING_BASE	0x1e4000
+#define XEHP_BSD7_RING_BASE	0x1f0000
+#define XEHP_BSD8_RING_BASE	0x1f4000
 #define VEBOX_RING_BASE		0x1a000
 #define GEN11_VEBOX_RING_BASE		0x1c8000
 #define GEN11_VEBOX2_RING_BASE		0x1d8000
+#define XEHP_VEBOX3_RING_BASE		0x1e8000
+#define XEHP_VEBOX4_RING_BASE		0x1f8000
 #define BLT_RING_BASE		0x22000
 #define RING_TAIL(base)		_MMIO((base) + 0x30)
 #define RING_HEAD(base)		_MMIO((base) + 0x34)
-- 
2.25.4

