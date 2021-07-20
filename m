Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA233D02E4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5E36E529;
	Tue, 20 Jul 2021 20:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05AA6E3DA;
 Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885369"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885369"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906072"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 14/42] drm/i915: Add logical engine mapping
Date: Tue, 20 Jul 2021 13:57:34 -0700
Message-Id: <20210720205802.39610-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add logical engine mapping. This is required for split-frame, as
workloads need to be placed on engines in a logically contiguous manner.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 60 ++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
 .../drm/i915/gt/intel_execlists_submission.c  |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 21 +------
 5 files changed, 56 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 51a0d860d551..1ce112fefcf5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -260,7 +260,8 @@ static void nop_irq_handler(struct intel_engine_cs *engine, u16 iir)
 	GEM_DEBUG_WARN_ON(iir);
 }
 
-static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
+static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
+			      u8 logical_instance)
 {
 	const struct engine_info *info = &intel_engines[id];
 	struct drm_i915_private *i915 = gt->i915;
@@ -303,6 +304,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 
 	engine->class = info->class;
 	engine->instance = info->instance;
+	engine->logical_mask = BIT(logical_instance);
 	__sprint_engine_name(engine);
 
 	engine->props.heartbeat_interval_ms =
@@ -516,6 +518,37 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	return info->engine_mask;
 }
 
+static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
+				 u8 class, const u8 *map, u8 num_instances)
+{
+	int i, j;
+	u8 current_logical_id = 0;
+
+	for (j = 0; j < num_instances; ++j) {
+		for (i = 0; i < ARRAY_SIZE(intel_engines); ++i) {
+			if (!HAS_ENGINE(gt, i) ||
+			    intel_engines[i].class != class)
+				continue;
+
+			if (intel_engines[i].instance == map[j]) {
+				logical_ids[intel_engines[i].instance] =
+					current_logical_id++;
+				break;
+			}
+		}
+	}
+}
+
+static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
+{
+	int i;
+	u8 map[MAX_ENGINE_INSTANCE + 1];
+
+	for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
+		map[i] = i;
+	populate_logical_ids(gt, logical_ids, class, map, ARRAY_SIZE(map));
+}
+
 /**
  * intel_engines_init_mmio() - allocate and prepare the Engine Command Streamers
  * @gt: pointer to struct intel_gt
@@ -527,7 +560,8 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	struct drm_i915_private *i915 = gt->i915;
 	const unsigned int engine_mask = init_engine_mask(gt);
 	unsigned int mask = 0;
-	unsigned int i;
+	unsigned int i, class;
+	u8 logical_ids[MAX_ENGINE_INSTANCE + 1];
 	int err;
 
 	drm_WARN_ON(&i915->drm, engine_mask == 0);
@@ -537,15 +571,23 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	if (i915_inject_probe_failure(i915))
 		return -ENODEV;
 
-	for (i = 0; i < ARRAY_SIZE(intel_engines); i++) {
-		if (!HAS_ENGINE(gt, i))
-			continue;
+	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
+		setup_logical_ids(gt, logical_ids, class);
 
-		err = intel_engine_setup(gt, i);
-		if (err)
-			goto cleanup;
+		for (i = 0; i < ARRAY_SIZE(intel_engines); ++i) {
+			u8 instance = intel_engines[i].instance;
+
+			if (intel_engines[i].class != class ||
+			    !HAS_ENGINE(gt, i))
+				continue;
 
-		mask |= BIT(i);
+			err = intel_engine_setup(gt, i,
+						 logical_ids[instance]);
+			if (err)
+				goto cleanup;
+
+			mask |= BIT(i);
+		}
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index eec57e57403f..1a458d527988 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -272,6 +272,7 @@ struct intel_engine_cs {
 	unsigned int guc_id;
 
 	intel_engine_mask_t mask;
+	intel_engine_mask_t logical_mask;
 
 	u8 class;
 	u8 instance;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 2aa5cc100956..2b9a2a61495f 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3823,6 +3823,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 
 		ve->siblings[ve->num_siblings++] = sibling;
 		ve->base.mask |= sibling->mask;
+		ve->base.logical_mask |= sibling->logical_mask;
 
 		/*
 		 * All physical engines must be compatible for their emission
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index c56302dedb32..676c394734ce 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -176,7 +176,7 @@ static void guc_mapping_table_init(struct intel_gt *gt,
 	for_each_engine(engine, gt, id) {
 		u8 guc_class = engine_class_to_guc_class(engine->class);
 
-		system_info->mapping_table[guc_class][engine->instance] =
+		system_info->mapping_table[guc_class][ilog2(engine->logical_mask)] =
 			engine->instance;
 	}
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 65f59497e7ef..b159297b9334 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1781,23 +1781,6 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
 	return __guc_action_deregister_context(guc, guc_id, loop);
 }
 
-static intel_engine_mask_t adjust_engine_mask(u8 class, intel_engine_mask_t mask)
-{
-	switch (class) {
-	case RENDER_CLASS:
-		return mask >> RCS0;
-	case VIDEO_ENHANCEMENT_CLASS:
-		return mask >> VECS0;
-	case VIDEO_DECODE_CLASS:
-		return mask >> VCS0;
-	case COPY_ENGINE_CLASS:
-		return mask >> BCS0;
-	default:
-		MISSING_CASE(class);
-		return 0;
-	}
-}
-
 static void guc_context_policy_init(struct intel_engine_cs *engine,
 				    struct guc_lrc_desc *desc)
 {
@@ -1938,8 +1921,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 	desc = __get_lrc_desc(guc, ce->guc_lrcd_reg_idx);
 	desc->engine_class = engine_class_to_guc_class(engine->class);
-	desc->engine_submit_mask = adjust_engine_mask(engine->class,
-						      engine->mask);
+	desc->engine_submit_mask = engine->logical_mask;
 	desc->hw_context_desc = ce->lrc.lrca;
 	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
 	desc->priority = ce->guc_prio;
@@ -3946,6 +3928,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 		}
 
 		ve->base.mask |= sibling->mask;
+		ve->base.logical_mask |= sibling->logical_mask;
 
 		if (n != 0 && ve->base.class != sibling->class) {
 			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
-- 
2.28.0

