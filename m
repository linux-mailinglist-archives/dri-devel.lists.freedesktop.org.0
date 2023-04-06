Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56F6DA5C3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F19210ED50;
	Thu,  6 Apr 2023 22:26:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CBD10EA51;
 Thu,  6 Apr 2023 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680820003; x=1712356003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XPhumf7VrZPUUyCtKsmJZMJPt5E7P0go5UfmCHMYEzo=;
 b=e6ReMMpt05g+9tS7iQswpjBehp5788xfSKDMn/uDkeRyj7MU01STBsLw
 sA6D65P7nXUgIuZwWqyNua0KemyW6vtOeiM+PeX9IZu/PwD4KBhYDc+e7
 zxRvPjv0evC9E9S/6FQ58+u18ItzVRcDcu7Fay+G+JfmX/cUhyOYG60Sd
 NYMr7VOgOleZuUxYBZ7p/W3dD02UMK4P00SaDJVXZoIyhMI39fPCtZ99g
 z+plb3Hi4QLIAidLWjM+MDZpk5UkiLcPmoYjGyg6fuKEpQSJtd+49rYGi
 6QPpe321rhQBfXFWhZ8SQScsPv4MT+fag65Y4MfNWFLCpfKCRZdYmgBlJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341604981"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341604981"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 15:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776635894"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776635894"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 15:26:42 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/5] drm/i915/guc: Capture list clean up - 1
Date: Thu,  6 Apr 2023 15:26:14 -0700
Message-Id: <20230406222617.790484-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230406222617.790484-1-John.C.Harrison@Intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
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

Remove 99% duplicated steered register list code. Also, include the
pre-Xe steered registers in the pre-Xe list generation.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 112 +++++-------------
 1 file changed, 29 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index e0e793167d61b..9184d2595e4ce 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -260,11 +260,15 @@ struct __ext_steer_reg {
 	i915_mcr_reg_t reg;
 };
 
-static const struct __ext_steer_reg xe_extregs[] = {
+static const struct __ext_steer_reg gen8_extregs[] = {
 	{"GEN8_SAMPLER_INSTDONE", GEN8_SAMPLER_INSTDONE},
 	{"GEN8_ROW_INSTDONE", GEN8_ROW_INSTDONE}
 };
 
+static const struct __ext_steer_reg xehpg_extregs[] = {
+	{"XEHPG_INSTDONE_GEOM_SVG", XEHPG_INSTDONE_GEOM_SVG}
+};
+
 static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
 			   const struct __ext_steer_reg *extlist,
 			   int slice_id, int subslice_id)
@@ -295,8 +299,8 @@ __alloc_ext_regs(struct __guc_mmio_reg_descr_group *newlist,
 }
 
 static void
-guc_capture_alloc_steered_lists_xe_lpd(struct intel_guc *guc,
-				       const struct __guc_mmio_reg_descr_group *lists)
+guc_capture_alloc_steered_lists(struct intel_guc *guc,
+				const struct __guc_mmio_reg_descr_group *lists)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	int slice, subslice, iter, i, num_steer_regs, num_tot_regs = 0;
@@ -304,74 +308,19 @@ guc_capture_alloc_steered_lists_xe_lpd(struct intel_guc *guc,
 	struct __guc_mmio_reg_descr_group *extlists;
 	struct __guc_mmio_reg_descr *extarray;
 	struct sseu_dev_info *sseu;
+	bool has_xehpg_extregs;
 
-	/* In XE_LPD we only have steered registers for the render-class */
+	/* steered registers currently only exist for the render-class */
 	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
 					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS, GUC_RENDER_CLASS);
 	/* skip if extlists was previously allocated */
 	if (!list || guc->capture->extlists)
 		return;
 
-	num_steer_regs = ARRAY_SIZE(xe_extregs);
-
-	sseu = &gt->info.sseu;
-	for_each_ss_steering(iter, gt, slice, subslice)
-		num_tot_regs += num_steer_regs;
-
-	if (!num_tot_regs)
-		return;
-
-	/* allocate an extra for an end marker */
-	extlists = kcalloc(2, sizeof(struct __guc_mmio_reg_descr_group), GFP_KERNEL);
-	if (!extlists)
-		return;
-
-	if (__alloc_ext_regs(&extlists[0], list, num_tot_regs)) {
-		kfree(extlists);
-		return;
-	}
-
-	extarray = extlists[0].extlist;
-	for_each_ss_steering(iter, gt, slice, subslice) {
-		for (i = 0; i < num_steer_regs; ++i) {
-			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
-			++extarray;
-		}
-	}
-
-	guc->capture->extlists = extlists;
-}
-
-static const struct __ext_steer_reg xehpg_extregs[] = {
-	{"XEHPG_INSTDONE_GEOM_SVG", XEHPG_INSTDONE_GEOM_SVG}
-};
-
-static bool __has_xehpg_extregs(u32 ipver)
-{
-	return (ipver >= IP_VER(12, 55));
-}
-
-static void
-guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
-				       const struct __guc_mmio_reg_descr_group *lists,
-				       u32 ipver)
-{
-	struct intel_gt *gt = guc_to_gt(guc);
-	struct sseu_dev_info *sseu;
-	int slice, subslice, i, iter, num_steer_regs, num_tot_regs = 0;
-	const struct __guc_mmio_reg_descr_group *list;
-	struct __guc_mmio_reg_descr_group *extlists;
-	struct __guc_mmio_reg_descr *extarray;
-
-	/* In XE_LP / HPG we only have render-class steering registers during error-capture */
-	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
-					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS, GUC_RENDER_CLASS);
-	/* skip if extlists was previously allocated */
-	if (!list || guc->capture->extlists)
-		return;
+	has_xehpg_extregs = GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 55);
 
-	num_steer_regs = ARRAY_SIZE(xe_extregs);
-	if (__has_xehpg_extregs(ipver))
+	num_steer_regs = ARRAY_SIZE(gen8_extregs);
+	if (has_xehpg_extregs)
 		num_steer_regs += ARRAY_SIZE(xehpg_extregs);
 
 	sseu = &gt->info.sseu;
@@ -393,11 +342,12 @@ guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
 
 	extarray = extlists[0].extlist;
 	for_each_ss_steering(iter, gt, slice, subslice) {
-		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
-			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
+		for (i = 0; i < ARRAY_SIZE(gen8_extregs); ++i) {
+			__fill_ext_reg(extarray, &gen8_extregs[i], slice, subslice);
 			++extarray;
 		}
-		if (__has_xehpg_extregs(ipver)) {
+
+		if (has_xehpg_extregs) {
 			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
 				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
 				++extarray;
@@ -413,26 +363,22 @@ static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct intel_guc *guc)
 {
 	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	const struct __guc_mmio_reg_descr_group *lists;
 
-	if (GRAPHICS_VER(i915) > 11) {
-		/*
-		 * For certain engine classes, there are slice and subslice
-		 * level registers requiring steering. We allocate and populate
-		 * these at init time based on hw config add it as an extension
-		 * list at the end of the pre-populated render list.
-		 */
-		if (IS_DG2(i915))
-			guc_capture_alloc_steered_lists_xe_hpg(guc, xe_lpd_lists, IP_VER(12, 55));
-		else if (IS_XEHPSDV(i915))
-			guc_capture_alloc_steered_lists_xe_hpg(guc, xe_lpd_lists, IP_VER(12, 50));
-		else
-			guc_capture_alloc_steered_lists_xe_lpd(guc, xe_lpd_lists);
+	if (GRAPHICS_VER(i915) >= 12)
+		lists = xe_lpd_lists;
+	else
+		lists = default_lists;
 
-		return xe_lpd_lists;
-	}
+	/*
+	 * For certain engine classes, there are slice and subslice
+	 * level registers requiring steering. We allocate and populate
+	 * these at init time based on hw config add it as an extension
+	 * list at the end of the pre-populated render list.
+	 */
+	guc_capture_alloc_steered_lists(guc, lists);
 
-	/* if GuC submission is enabled on a non-POR platform, just use a common baseline */
-	return default_lists;
+	return lists;
 }
 
 static const char *
-- 
2.39.1

