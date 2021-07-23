Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C73D30E2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 02:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53E66F88C;
	Fri, 23 Jul 2021 00:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE566F88C;
 Fri, 23 Jul 2021 00:26:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="209881426"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="209881426"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 17:26:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="633175359"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 17:26:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gt: nuke gen6_hw_id
Date: Thu, 22 Jul 2021 17:25:51 -0700
Message-Id: <20210723002551.3906535-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is only used by GRAPHICS_VER == 6 and GRAPHICS_VER == 7. All other
recent platforms do not depend on this field, so it doesn't make much
sense to keep it generic like that. Instead, just do a mapping from
engine class to HW ID in the single place that is needed.

v2: use macros with the direct register address instead of calculating
from the legacy HW_ID (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  6 ------
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 10 +---------
 drivers/gpu/drm/i915/i915_reg.h              | 11 ++++++++++-
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 9c8cba1c6cd1..876efa29b123 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -42,7 +42,6 @@
 
 #define MAX_MMIO_BASES 3
 struct engine_info {
-	u8 gen6_hw_id;
 	u8 class;
 	u8 instance;
 	/* mmio bases table *must* be sorted in reverse graphics_ver order */
@@ -54,7 +53,6 @@ struct engine_info {
 
 static const struct engine_info intel_engines[] = {
 	[RCS0] = {
-		.gen6_hw_id = RCS0_HW,
 		.class = RENDER_CLASS,
 		.instance = 0,
 		.mmio_bases = {
@@ -62,7 +60,6 @@ static const struct engine_info intel_engines[] = {
 		},
 	},
 	[BCS0] = {
-		.gen6_hw_id = BCS0_HW,
 		.class = COPY_ENGINE_CLASS,
 		.instance = 0,
 		.mmio_bases = {
@@ -70,7 +67,6 @@ static const struct engine_info intel_engines[] = {
 		},
 	},
 	[VCS0] = {
-		.gen6_hw_id = VCS0_HW,
 		.class = VIDEO_DECODE_CLASS,
 		.instance = 0,
 		.mmio_bases = {
@@ -102,7 +98,6 @@ static const struct engine_info intel_engines[] = {
 		},
 	},
 	[VECS0] = {
-		.gen6_hw_id = VECS0_HW,
 		.class = VIDEO_ENHANCEMENT_CLASS,
 		.instance = 0,
 		.mmio_bases = {
@@ -290,7 +285,6 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 	engine->i915 = i915;
 	engine->gt = gt;
 	engine->uncore = gt->uncore;
-	engine->gen6_hw_id = info->gen6_hw_id;
 	guc_class = engine_class_to_guc_class(info->class);
 	engine->guc_id = MAKE_GUC_ID(guc_class, info->instance);
 	engine->mmio_base = __engine_mmio_base(i915, info->mmio_bases);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 266422d8d1b1..a4111813f993 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -28,14 +28,7 @@
 #include "intel_wakeref.h"
 #include "intel_workarounds_types.h"
 
-/* Legacy HW Engine ID */
-
-#define RCS0_HW		0
-#define VCS0_HW		1
-#define BCS0_HW		2
-#define VECS0_HW	3
-
-/* Gen11+ HW Engine class + instance */
+/* HW Engine class + instance */
 #define RENDER_CLASS		0
 #define VIDEO_DECODE_CLASS	1
 #define VIDEO_ENHANCEMENT_CLASS	2
@@ -268,7 +261,6 @@ struct intel_engine_cs {
 
 	intel_engine_mask_t mask;
 
-	u8 gen6_hw_id;
 	u8 class;
 	u8 instance;
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8e1392028184..3718da619d90 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2572,7 +2572,16 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   ARB_MODE_BWGTLB_DISABLE (1 << 9)
 #define   ARB_MODE_SWIZZLE_BDW	(1 << 1)
 #define RENDER_HWS_PGA_GEN7	_MMIO(0x04080)
-#define RING_FAULT_REG(engine)	_MMIO(0x4094 + 0x100 * (engine)->gen6_hw_id)
+
+#define _RING_FAULT_REG_RCS        0x4094
+#define _RING_FAULT_REG_VCS        0x4194
+#define _RING_FAULT_REG_BCS        0x4294
+#define _RING_FAULT_REG_VECS       0x4394
+#define RING_FAULT_REG(engine)     _MMIO(_PICK((engine)->class, \
+					       _RING_FAULT_REG_RCS, \
+					       _RING_FAULT_REG_VCS, \
+					       _RING_FAULT_REG_VECS, \
+					       _RING_FAULT_REG_BCS))
 #define GEN8_RING_FAULT_REG	_MMIO(0x4094)
 #define GEN12_RING_FAULT_REG	_MMIO(0xcec4)
 #define   GEN8_RING_FAULT_ENGINE_ID(x)	(((x) >> 12) & 0x7)
-- 
2.31.1

