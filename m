Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFBC3F36D0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2286EB4A;
	Fri, 20 Aug 2021 22:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4747C6EB2F;
 Fri, 20 Aug 2021 22:50:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580038"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580038"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098581"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 08/27] drm/i915: Add logical engine mapping
Date: Fri, 20 Aug 2021 15:44:27 -0700
Message-Id: <20210820224446.30620-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
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

v2:
 (Daniel Vetter)
  - Add kernel doc for new fields

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 60 ++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  5 ++
 .../drm/i915/gt/intel_execlists_submission.c  |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 21 +------
 5 files changed, 60 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 0d9105a31d84..4d790f9a65dd 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -290,7 +290,8 @@ static void nop_irq_handler(struct intel_engine_cs *engine, u16 iir)
 	GEM_DEBUG_WARN_ON(iir);
 }
 
-static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
+static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
+			      u8 logical_instance)
 {
 	const struct engine_info *info = &intel_engines[id];
 	struct drm_i915_private *i915 = gt->i915;
@@ -334,6 +335,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 
 	engine->class = info->class;
 	engine->instance = info->instance;
+	engine->logical_mask = BIT(logical_instance);
 	__sprint_engine_name(engine);
 
 	engine->props.heartbeat_interval_ms =
@@ -572,6 +574,37 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
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
@@ -583,7 +616,8 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	struct drm_i915_private *i915 = gt->i915;
 	const unsigned int engine_mask = init_engine_mask(gt);
 	unsigned int mask = 0;
-	unsigned int i;
+	unsigned int i, class;
+	u8 logical_ids[MAX_ENGINE_INSTANCE + 1];
 	int err;
 
 	drm_WARN_ON(&i915->drm, engine_mask == 0);
@@ -593,15 +627,23 @@ int intel_engines_init_mmio(struct intel_gt *gt)
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
index ed91bcff20eb..fddf35546b58 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -266,6 +266,11 @@ struct intel_engine_cs {
 	unsigned int guc_id;
 
 	intel_engine_mask_t mask;
+	/**
+	 * @logical_mask: logical mask of engine, reported to user space via
+	 * query IOCTL and used to communicate with the GuC in logical space
+	 */
+	intel_engine_mask_t logical_mask;
 
 	u8 class;
 	u8 instance;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index cafb0608ffb4..813a6de01382 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3875,6 +3875,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 
 		ve->siblings[ve->num_siblings++] = sibling;
 		ve->base.mask |= sibling->mask;
+		ve->base.logical_mask |= sibling->logical_mask;
 
 		/*
 		 * All physical engines must be compatible for their emission
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 6926919bcac6..9f5f43a16182 100644
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
index e0eed70f9b92..ffafbac7335e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1401,23 +1401,6 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
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
@@ -1459,8 +1442,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 	desc = __get_lrc_desc(guc, desc_idx);
 	desc->engine_class = engine_class_to_guc_class(engine->class);
-	desc->engine_submit_mask = adjust_engine_mask(engine->class,
-						      engine->mask);
+	desc->engine_submit_mask = engine->logical_mask;
 	desc->hw_context_desc = ce->lrc.lrca;
 	desc->priority = ce->guc_state.prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
@@ -3260,6 +3242,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 		}
 
 		ve->base.mask |= sibling->mask;
+		ve->base.logical_mask |= sibling->logical_mask;
 
 		if (n != 0 && ve->base.class != sibling->class) {
 			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
-- 
2.32.0

