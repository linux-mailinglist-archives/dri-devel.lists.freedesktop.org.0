Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3703D0528
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 01:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94786E455;
	Tue, 20 Jul 2021 23:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F167589E7C;
 Tue, 20 Jul 2021 23:24:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209441160"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209441160"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:24:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="632477387"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:24:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/gt: nuke gen6_hw_id
Date: Tue, 20 Jul 2021 16:20:14 -0700
Message-Id: <20210720232014.3302645-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720232014.3302645-1-lucas.demarchi@intel.com>
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
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

This is only used by GRAPHICS_VER == 6 and GRAPHICS_VER == 7. All other
recent platforms do not depend on this field, so it doesn't make much
sense to keep it generic like that. Instead, just do a mapping from
engine class to HW ID in the single place that is needed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 6 ------
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 8 --------
 drivers/gpu/drm/i915/i915_reg.h              | 4 +++-
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 508221de411c..0a04e8d90e9e 100644
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
index 266422d8d1b1..64330bfb7641 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -28,13 +28,6 @@
 #include "intel_wakeref.h"
 #include "intel_workarounds_types.h"
 
-/* Legacy HW Engine ID */
-
-#define RCS0_HW		0
-#define VCS0_HW		1
-#define BCS0_HW		2
-#define VECS0_HW	3
-
 /* Gen11+ HW Engine class + instance */
 #define RENDER_CLASS		0
 #define VIDEO_DECODE_CLASS	1
@@ -268,7 +261,6 @@ struct intel_engine_cs {
 
 	intel_engine_mask_t mask;
 
-	u8 gen6_hw_id;
 	u8 class;
 	u8 instance;
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8750ffce9d61..d91386f4828e 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2572,7 +2572,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   ARB_MODE_BWGTLB_DISABLE (1 << 9)
 #define   ARB_MODE_SWIZZLE_BDW	(1 << 1)
 #define RENDER_HWS_PGA_GEN7	_MMIO(0x04080)
-#define RING_FAULT_REG(engine)	_MMIO(0x4094 + 0x100 * (engine)->gen6_hw_id)
+
+#define _GEN6_ENGINE_CLASS_TO_ID(class) _PICK((class), 0, 1, 3, 2)
+#define RING_FAULT_REG(engine)	_MMIO(0x4094 + 0x100 * _GEN6_ENGINE_CLASS_TO_ID((engine)->class))
 #define GEN8_RING_FAULT_REG	_MMIO(0x4094)
 #define GEN12_RING_FAULT_REG	_MMIO(0xcec4)
 #define   GEN8_RING_FAULT_ENGINE_ID(x)	(((x) >> 12) & 0x7)
-- 
2.31.1

