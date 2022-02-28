Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1F84C7435
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE510E871;
	Mon, 28 Feb 2022 17:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5156210E199;
 Mon, 28 Feb 2022 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070184; x=1677606184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x/T2p0AsCy4SIKWxLTWdLJHQMht8ZoOWGmOH/T52zLE=;
 b=fybY1v501P1PROn2LZt5sZUwpaXiGAn38flUlcyxwdEwWGpBo0UtJf0t
 GwVIr5/aU31ncAZSiPbBNxmPv/p4sLcBv9qozfF7kajweaxUN3+WYIbUO
 YEc927JTgw2pVrlEnfJWE+2ifp6eSdbs/rlFb9u7o3voHw8EIUNmAiZhO
 9U9L0//siFUbgxv+2U2td6QHx+dKzh/2E5o4pXoC0jxilu3G4nb7u/BEz
 AZ37Zisxs2fk4Q+6CAp1wlZtX+1+cEuQBdLr87IQjWAWgCH6EMEHNn42K
 9DoMIDDv3k1NEco68F95pdT/bClbPzAhes3Uk1K9qbK1EQvxUIcHc7x5p Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240351463"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="240351463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:03 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392814"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 01/13] drm/i915/xehp: Define compute class and engine
Date: Mon, 28 Feb 2022 09:42:33 -0800
Message-Id: <20220228174245.1569581-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a Compute Command Streamer (CCS), which has access to
the media and GPGPU pipelines (but not the 3D pipeline).

To begin with, define the compute class/engine common functions, based
on the existing render ones.

v2:
 - Add kerneldoc for drm_i915_gem_engine_class since we're adding a new
   element to it.  (Daniel)
 - Make engine class <-> guc class converters use lookup tables to make
   it more clear/explicit how the IDs map.  (Tvrtko)

v3:
 - Don't update uapi for now; we'll just include the driver-internal
   changes for the time being.

Bspec: 46167, 45544
Original-author: Michel Thierry
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> #v1
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 28 +++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  9 +++++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c  |  5 ++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  4 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h  | 32 ++++++++++++++------
 drivers/gpu/drm/i915/i915_reg.h              |  4 +++
 6 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index e855c801ba28..3190b7b462a9 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -156,6 +156,34 @@ static const struct engine_info intel_engines[] = {
 			{ .graphics_ver = 12, .base = XEHP_VEBOX4_RING_BASE }
 		},
 	},
+	[CCS0] = {
+		.class = COMPUTE_CLASS,
+		.instance = 0,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = GEN12_COMPUTE0_RING_BASE }
+		}
+	},
+	[CCS1] = {
+		.class = COMPUTE_CLASS,
+		.instance = 1,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = GEN12_COMPUTE1_RING_BASE }
+		}
+	},
+	[CCS2] = {
+		.class = COMPUTE_CLASS,
+		.instance = 2,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = GEN12_COMPUTE2_RING_BASE }
+		}
+	},
+	[CCS3] = {
+		.class = COMPUTE_CLASS,
+		.instance = 3,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = GEN12_COMPUTE3_RING_BASE }
+		}
+	},
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 36365bdbe1ee..f4533ccafbaf 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -33,7 +33,8 @@
 #define VIDEO_ENHANCEMENT_CLASS	2
 #define COPY_ENGINE_CLASS	3
 #define OTHER_CLASS		4
-#define MAX_ENGINE_CLASS	4
+#define COMPUTE_CLASS		5
+#define MAX_ENGINE_CLASS	5
 #define MAX_ENGINE_INSTANCE	7
 
 #define I915_MAX_SLICES	3
@@ -95,6 +96,7 @@ struct i915_ctx_workarounds {
 
 #define I915_MAX_VCS	8
 #define I915_MAX_VECS	4
+#define I915_MAX_CCS	4
 
 /*
  * Engine IDs definitions.
@@ -117,6 +119,11 @@ enum intel_engine_id {
 	VECS2,
 	VECS3,
 #define _VECS(n) (VECS0 + (n))
+	CCS0,
+	CCS1,
+	CCS2,
+	CCS3,
+#define _CCS(n) (CCS0 + (n))
 	I915_NUM_ENGINES
 #define INVALID_ENGINE ((enum intel_engine_id)-1)
 };
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 9ce85a845105..b8c9b6b89003 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -47,6 +47,7 @@ static const u8 uabi_classes[] = {
 	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
 	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
 	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
+	/* TODO: Add COMPUTE_CLASS mapping once ABI is available */
 };
 
 static int engine_cmp(void *priv, const struct list_head *A,
@@ -139,6 +140,7 @@ const char *intel_engine_class_repr(u8 class)
 		[COPY_ENGINE_CLASS] = "bcs",
 		[VIDEO_DECODE_CLASS] = "vcs",
 		[VIDEO_ENHANCEMENT_CLASS] = "vecs",
+		[COMPUTE_CLASS] = "ccs",
 	};
 
 	if (class >= ARRAY_SIZE(uabi_names) || !uabi_names[class])
@@ -162,6 +164,7 @@ static int legacy_ring_idx(const struct legacy_ring *ring)
 		[COPY_ENGINE_CLASS] = { BCS0, 1 },
 		[VIDEO_DECODE_CLASS] = { VCS0, I915_MAX_VCS },
 		[VIDEO_ENHANCEMENT_CLASS] = { VECS0, I915_MAX_VECS },
+		[COMPUTE_CLASS] = { CCS0, I915_MAX_CCS },
 	};
 
 	if (GEM_DEBUG_WARN_ON(ring->class >= ARRAY_SIZE(map)))
@@ -190,7 +193,7 @@ static void add_legacy_ring(struct legacy_ring *ring,
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
 	struct legacy_ring ring = {};
-	u8 uabi_instances[4] = {};
+	u8 uabi_instances[5] = {};
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
 	LIST_HEAD(engines);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index d752db5669dd..530807bfe9a0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1452,6 +1452,10 @@
 #define   GEN11_KCR				(19)
 #define   GEN11_GTPM				(16)
 #define   GEN11_BCS				(15)
+#define   GEN12_CCS3				(7)
+#define   GEN12_CCS2				(6)
+#define   GEN12_CCS1				(5)
+#define   GEN12_CCS0				(4)
 #define   GEN11_RCS0				(0)
 #define   GEN11_VECS(x)				(31 - (x))
 #define   GEN11_VCS(x)				(x)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 6a4612a852e2..4b300b6cc0f9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -46,8 +46,8 @@
 #define GUC_VIDEO_CLASS			1
 #define GUC_VIDEOENHANCE_CLASS		2
 #define GUC_BLITTER_CLASS		3
-#define GUC_RESERVED_CLASS		4
-#define GUC_LAST_ENGINE_CLASS		GUC_RESERVED_CLASS
+#define GUC_COMPUTE_CLASS		4
+#define GUC_LAST_ENGINE_CLASS		GUC_COMPUTE_CLASS
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
@@ -156,23 +156,37 @@ FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID, id) | \
 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, c) \
 )
 
+/* the GuC arrays don't include OTHER_CLASS */
+static u8 engine_class_guc_class_map[] = {
+	[RENDER_CLASS]            = GUC_RENDER_CLASS,
+	[COPY_ENGINE_CLASS]       = GUC_BLITTER_CLASS,
+	[VIDEO_DECODE_CLASS]      = GUC_VIDEO_CLASS,
+	[VIDEO_ENHANCEMENT_CLASS] = GUC_VIDEOENHANCE_CLASS,
+	[COMPUTE_CLASS]           = GUC_COMPUTE_CLASS,
+};
+
+static u8 guc_class_engine_class_map[] = {
+	[GUC_RENDER_CLASS]       = RENDER_CLASS,
+	[GUC_BLITTER_CLASS]      = COPY_ENGINE_CLASS,
+	[GUC_VIDEO_CLASS]        = VIDEO_DECODE_CLASS,
+	[GUC_VIDEOENHANCE_CLASS] = VIDEO_ENHANCEMENT_CLASS,
+	[GUC_COMPUTE_CLASS]      = COMPUTE_CLASS,
+};
+
 static inline u8 engine_class_to_guc_class(u8 class)
 {
-	BUILD_BUG_ON(GUC_RENDER_CLASS != RENDER_CLASS);
-	BUILD_BUG_ON(GUC_BLITTER_CLASS != COPY_ENGINE_CLASS);
-	BUILD_BUG_ON(GUC_VIDEO_CLASS != VIDEO_DECODE_CLASS);
-	BUILD_BUG_ON(GUC_VIDEOENHANCE_CLASS != VIDEO_ENHANCEMENT_CLASS);
+	BUILD_BUG_ON(ARRAY_SIZE(engine_class_guc_class_map) != MAX_ENGINE_CLASS + 1);
 	GEM_BUG_ON(class > MAX_ENGINE_CLASS || class == OTHER_CLASS);
 
-	return class;
+	return engine_class_guc_class_map[class];
 }
 
 static inline u8 guc_class_to_engine_class(u8 guc_class)
 {
+	BUILD_BUG_ON(ARRAY_SIZE(guc_class_engine_class_map) != GUC_LAST_ENGINE_CLASS + 1);
 	GEM_BUG_ON(guc_class > GUC_LAST_ENGINE_CLASS);
-	GEM_BUG_ON(guc_class == GUC_RESERVED_CLASS);
 
-	return guc_class;
+	return guc_class_engine_class_map[guc_class];
 }
 
 /* Work item for submitting workloads into work queue of GuC. */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index a2f36ef91cec..6db8c426daa1 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -971,6 +971,10 @@
 #define GEN11_VEBOX2_RING_BASE		0x1d8000
 #define XEHP_VEBOX3_RING_BASE		0x1e8000
 #define XEHP_VEBOX4_RING_BASE		0x1f8000
+#define GEN12_COMPUTE0_RING_BASE	0x1a000
+#define GEN12_COMPUTE1_RING_BASE	0x1c000
+#define GEN12_COMPUTE2_RING_BASE	0x1e000
+#define GEN12_COMPUTE3_RING_BASE	0x26000
 #define BLT_RING_BASE		0x22000
 
 
-- 
2.34.1

