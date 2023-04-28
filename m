Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5BA6F1E56
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 20:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7728A10EDA5;
	Fri, 28 Apr 2023 18:56:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9135210E138;
 Fri, 28 Apr 2023 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682708192; x=1714244192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=asd6VhdnhR4YO9UanNdAwY4KAk78eCIE2tKl0/DRXUg=;
 b=RbQa3DRtlUoDsCsuusFS2FAapvmROjnIZMI8uSlUpFNB+Mv54HQP3vEI
 b5rVsqvmdG1rr/KmmnzOqYnIgsztN4xITe2jfrFEkvxEEkkHT1j1C2usE
 SNao6xknMOvP/W9TSMWHSivTe8ff0zVAMrBuWMmIwgR/26jpSRbs6sFrH
 gJEY9M3D5Fwy/XNGU/Szep6s/Ft3zDAPMgdxR97gZeZFj6GoCNL5TNGI+
 /MKYGvG/aJYAku+5pXqSpNI0gC02/WQqepIhuui2hKj0w4MSjIXvFrpFi
 +kxtjnHc02XbeqLvszW44LWH/+v+y4sBcM9fd4bKuGaRwAH94tK61YEPR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410934516"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="410934516"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869291583"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="869291583"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 11:56:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/4] drm/i915/guc: Consolidate duplicated capture list code
Date: Fri, 28 Apr 2023 11:56:34 -0700
Message-Id: <20230428185636.457407-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230428185636.457407-1-John.C.Harrison@Intel.com>
References: <20230428185636.457407-1-John.C.Harrison@Intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Remove 99% duplicated steered register list code. Also, include the
pre-Xe steered registers in the pre-Xe list generation.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
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

