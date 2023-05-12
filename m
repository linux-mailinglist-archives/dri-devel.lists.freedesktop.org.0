Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2406FFE76
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 03:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C0B10E60D;
	Fri, 12 May 2023 01:35:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5946610E60C;
 Fri, 12 May 2023 01:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683855335; x=1715391335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7v6ExAyANdfFsQlPrioAJ0L7CIHA2ISdusbIjeosZiQ=;
 b=VIslrBRqWmr0Icdn2HpkxuU+h1vkIjXlxuO0j+SsKxZ3/ba/ciclVzjj
 +98TPUyGkdzd45D+WHgTrpqG8Z6leV3lu1XZUMOEY1z91CrSLrTpm4YpW
 PA1rQT9/XPd5Rp21LUFv4tSB5aqO4mvC6imbcTxYm7U1ZJQpAJzwMh0eW
 jVAKT80W3JzZepJ8uPFYrv0fraDJkuyWg8ha9Sz1OPBxGZr/aqOTYx4Pz
 DGID+uuIgzEbkhlGocZrfk9IGNL3wC6SsStTtQICQ7PuBbOSiDI+TldxW
 MB0tZK+NvOgBEV7Csmj55Oxkyx765qJYzc3qtmLMOFpBld4+5d9Njl6qx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378814133"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="378814133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 18:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732829899"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="732829899"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 11 May 2023 18:35:20 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Fix confused register capture list creation
Date: Thu, 11 May 2023 18:35:44 -0700
Message-Id: <20230512013544.3367606-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The GuC has a completely separate engine class enum when referring to
register capture lists, which combines render and compute. The driver
was using the 'normal' GuC specific engine class enum instead. That
meant that it thought it was defining a capture list for compute
engines, the list was actually being applied to the GSC engine. And if
a platform didn't have a render engine, then it would get no compute
register captures at all.

Fix that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 36 ++++++++++-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 61 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  9 +++
 3 files changed, 72 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 69ce06faf8cda..63724e17829a7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -643,6 +643,39 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 }
 
+static u32 guc_get_capture_engine_mask(struct iosys_map *info_map, u32 capture_class)
+{
+	u32 mask;
+
+	switch (capture_class) {
+	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
+		mask = info_map_read(info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
+		mask |= info_map_read(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEO:
+		mask = info_map_read(info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
+		mask = info_map_read(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_BLITTER:
+		mask = info_map_read(info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
+		mask = info_map_read(info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
+		break;
+
+	default:
+		mask = 0;
+	}
+
+	return mask;
+}
+
 static int
 guc_capture_prep_lists(struct intel_guc *guc)
 {
@@ -678,9 +711,10 @@ guc_capture_prep_lists(struct intel_guc *guc)
 
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
 		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
+			u32 engine_mask = guc_get_capture_engine_mask(&info_map, j);
 
 			/* null list if we dont have said engine or list */
-			if (!info_map_read(&info_map, engine_enabled_masks[j])) {
+			if (!engine_mask) {
 				if (ads_is_mapped) {
 					ads_blob_write(guc, ads.capture_class[i][j], null_ggtt);
 					ads_blob_write(guc, ads.capture_instance[i][j], null_ggtt);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 1def0b6467c79..0ff864da92dfe 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -174,35 +174,31 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 /* List of lists */
 static const struct __guc_mmio_reg_descr_group gen8_lists[] = {
 	MAKE_REGLIST(gen8_global_regs, PF, GLOBAL, 0),
-	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
-	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
-	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
 	{}
 };
 
 static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
 	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
-	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
-	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
-	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(xe_lp_vec_class_regs, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
-	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe_lp_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
 	{}
 };
 
@@ -310,7 +306,8 @@ guc_capture_alloc_steered_lists(struct intel_guc *guc,
 
 	/* steered registers currently only exist for the render-class */
 	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
-					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS, GUC_RENDER_CLASS);
+					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+					GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE);
 	/* skip if extlists was previously allocated */
 	if (!list || guc->capture->extlists)
 		return;
@@ -400,17 +397,15 @@ static const char *
 __stringify_engclass(u32 class)
 {
 	switch (class) {
-	case GUC_RENDER_CLASS:
-		return "Render";
-	case GUC_VIDEO_CLASS:
+	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
+		return "Render/Compute";
+	case GUC_CAPTURE_LIST_CLASS_VIDEO:
 		return "Video";
-	case GUC_VIDEOENHANCE_CLASS:
+	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
 		return "VideoEnhance";
-	case GUC_BLITTER_CLASS:
+	case GUC_CAPTURE_LIST_CLASS_BLITTER:
 		return "Blitter";
-	case GUC_COMPUTE_CLASS:
-		return "Compute";
-	case GUC_GSC_OTHER_CLASS:
+	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
 		return "GSC-Other";
 	default:
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 8bb9ed7c7b4dd..4e57bd09d50d9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -411,6 +411,15 @@ enum guc_capture_type {
 	GUC_CAPTURE_LIST_TYPE_MAX,
 };
 
+/* Class indecies for capture_class and capture_instance arrays */
+enum {
+	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
+	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
+	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
+	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
+	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
+};
+
 /* GuC Additional Data Struct */
 struct guc_ads {
 	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
-- 
2.39.1

