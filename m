Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BD375AE0
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439DD6EDE2;
	Thu,  6 May 2021 18:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1B86ED01;
 Thu,  6 May 2021 18:57:12 +0000 (UTC)
IronPort-SDR: Sba7eQkfiYlAtMDlQLRom8s+YxnOFzXQS+ul+zLa7AQodwhXLBiTUeZPV9gdHLcK1oMsAbKaTC
 +gNVEo2CkyQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531005"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531005"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: /P++zdotpVXdXo5XYFvo1JgXtKkZ/0p9Cx8Aat9gUOrlfAuaBItKN2oeJaISxngq8fCl5UfWkY
 XuOi1ij/2zEA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583466"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 34/97] drm/i915/guc: Use guc_class instead of engine_class
 in fw interface
Date: Thu,  6 May 2021 12:13:48 -0700
Message-Id: <20210506191451.77768-35-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

GuC has its own defines for the engine classes. They're currently
mapping 1:1 to the defines used by the driver, but there is no guarantee
this will continue in the future. Given that we've been caught off-guard
in the past by similar divergences, we can prepare for the changes by
introducing helper functions to convert from engine class to GuC class and
back again.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   |  6 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 20 +++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 26 +++++++++++++++++++++
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c88b792c1ab5..7866ff0c2673 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -289,6 +289,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 	const struct engine_info *info = &intel_engines[id];
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_engine_cs *engine;
+	u8 guc_class;
 
 	BUILD_BUG_ON(MAX_ENGINE_CLASS >= BIT(GEN11_ENGINE_CLASS_WIDTH));
 	BUILD_BUG_ON(MAX_ENGINE_INSTANCE >= BIT(GEN11_ENGINE_INSTANCE_WIDTH));
@@ -317,9 +318,10 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 	engine->i915 = i915;
 	engine->gt = gt;
 	engine->uncore = gt->uncore;
-	engine->mmio_base = __engine_mmio_base(i915, info->mmio_bases);
 	engine->hw_id = info->hw_id;
-	engine->guc_id = MAKE_GUC_ID(info->class, info->instance);
+	guc_class = engine_class_to_guc_class(info->class);
+	engine->guc_id = MAKE_GUC_ID(guc_class, info->instance);
+	engine->mmio_base = __engine_mmio_base(i915, info->mmio_bases);
 
 	engine->irq_handler = nop_irq_handler;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 775f00d706fa..ecd18531b40a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -6,6 +6,7 @@
 #include "gt/intel_gt.h"
 #include "gt/intel_lrc.h"
 #include "intel_guc_ads.h"
+#include "intel_guc_fwif.h"
 #include "intel_uc.h"
 #include "i915_drv.h"
 
@@ -78,7 +79,7 @@ static void guc_mapping_table_init(struct intel_gt *gt,
 				GUC_MAX_INSTANCES_PER_CLASS;
 
 	for_each_engine(engine, gt, id) {
-		u8 guc_class = engine->class;
+		u8 guc_class = engine_class_to_guc_class(engine->class);
 
 		system_info->mapping_table[guc_class][engine->instance] =
 			engine->instance;
@@ -98,7 +99,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	struct __guc_ads_blob *blob = guc->ads_blob;
 	const u32 skipped_size = LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE;
 	u32 base;
-	u8 engine_class;
+	u8 engine_class, guc_class;
 
 	/* GuC scheduling policies */
 	guc_policies_init(&blob->policies);
@@ -114,22 +115,25 @@ static void __guc_ads_init(struct intel_guc *guc)
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
 		if (engine_class == OTHER_CLASS)
 			continue;
+
+		guc_class = engine_class_to_guc_class(engine_class);
+
 		/*
 		 * TODO: Set context pointer to default state to allow
 		 * GuC to re-init guilty contexts after internal reset.
 		 */
-		blob->ads.golden_context_lrca[engine_class] = 0;
-		blob->ads.eng_state_size[engine_class] =
+		blob->ads.golden_context_lrca[guc_class] = 0;
+		blob->ads.eng_state_size[guc_class] =
 			intel_engine_context_size(guc_to_gt(guc),
 						  engine_class) -
 			skipped_size;
 	}
 
 	/* System info */
-	blob->system_info.engine_enabled_masks[RENDER_CLASS] = 1;
-	blob->system_info.engine_enabled_masks[COPY_ENGINE_CLASS] = 1;
-	blob->system_info.engine_enabled_masks[VIDEO_DECODE_CLASS] = VDBOX_MASK(gt);
-	blob->system_info.engine_enabled_masks[VIDEO_ENHANCEMENT_CLASS] = VEBOX_MASK(gt);
+	blob->system_info.engine_enabled_masks[GUC_RENDER_CLASS] = 1;
+	blob->system_info.engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
+	blob->system_info.engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
+	blob->system_info.engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
 
 	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
 		hweight8(gt->info.sseu.slice_mask);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 301b173a26bc..558cfe168cb7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -15,6 +15,7 @@
 #include "abi/guc_communication_mmio_abi.h"
 #include "abi/guc_communication_ctb_abi.h"
 #include "abi/guc_messages_abi.h"
+#include "gt/intel_engine_types.h"
 
 #define GUC_CLIENT_PRIORITY_KMD_HIGH	0
 #define GUC_CLIENT_PRIORITY_HIGH	1
@@ -32,6 +33,12 @@
 #define GUC_VIDEO_ENGINE2		4
 #define GUC_MAX_ENGINES_NUM		(GUC_VIDEO_ENGINE2 + 1)
 
+#define GUC_RENDER_CLASS		0
+#define GUC_VIDEO_CLASS			1
+#define GUC_VIDEOENHANCE_CLASS		2
+#define GUC_BLITTER_CLASS		3
+#define GUC_RESERVED_CLASS		4
+#define GUC_LAST_ENGINE_CLASS		GUC_RESERVED_CLASS
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
@@ -129,6 +136,25 @@
 #define GUC_ID_TO_ENGINE_INSTANCE(guc_id) \
 	(((guc_id) & GUC_ENGINE_INSTANCE_MASK) >> GUC_ENGINE_INSTANCE_SHIFT)
 
+static inline u8 engine_class_to_guc_class(u8 class)
+{
+	BUILD_BUG_ON(GUC_RENDER_CLASS != RENDER_CLASS);
+	BUILD_BUG_ON(GUC_BLITTER_CLASS != COPY_ENGINE_CLASS);
+	BUILD_BUG_ON(GUC_VIDEO_CLASS != VIDEO_DECODE_CLASS);
+	BUILD_BUG_ON(GUC_VIDEOENHANCE_CLASS != VIDEO_ENHANCEMENT_CLASS);
+	GEM_BUG_ON(class > MAX_ENGINE_CLASS || class == OTHER_CLASS);
+
+	return class;
+}
+
+static inline u8 guc_class_to_engine_class(u8 guc_class)
+{
+	GEM_BUG_ON(guc_class > GUC_LAST_ENGINE_CLASS);
+	GEM_BUG_ON(guc_class == GUC_RESERVED_CLASS);
+
+	return guc_class;
+}
+
 /* Work item for submitting workloads into work queue of GuC. */
 struct guc_wq_item {
 	u32 header;
-- 
2.28.0

