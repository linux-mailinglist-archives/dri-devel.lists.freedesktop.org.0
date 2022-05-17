Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE25297D2
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 05:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CE210E377;
	Tue, 17 May 2022 03:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1810E377;
 Tue, 17 May 2022 03:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652757626; x=1684293626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r6XPrPvos+yKEW+yrB4wzSkta5zzFat+i9rOpqOHLv0=;
 b=fASEHHFEGyTmeqloIfzL8RzzAbneUtoT+dKvZX82eg0b3LFTSOz5lvbY
 50B2OyemGahNMkSXnNMybnWf+J3wXjXMAg/4wk08rQDqchveXrJ+bqWM9
 11wKPy1PxI1pHYDfxj6Vc5wJ22OftOwExfuIkP9UI8h3PFjZns8EmH+hc
 wuSX/RRzCVfy+1SYU6Arxcj4l8GXMSZkJr8TfjpJX/FRCUeYywjGW8Eot
 sZdMHwkgE7n7p/rpkNok3MpRGs8xSQvAfECR/A/2zVMfJj/NdC2wrzfC+
 r0NaYDFPzSlTVONm2KGmz52iPcY+yLtP7RgPs+BFga7Lqe2SiL7dY5CQT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="258603229"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="258603229"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="596877351"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/i915/xehp: Use separate sseu init function
Date: Mon, 16 May 2022 20:20:00 -0700
Message-Id: <20220517032005.2694737-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517032005.2694737-1-matthew.d.roper@intel.com>
References: <20220517032005.2694737-1-matthew.d.roper@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe_HP has enough fundamental differences from previous platforms that it
makes sense to use a separate SSEU init function to keep things
straightforward and easy to understand.  We'll also add a has_xehp_dss
flag to the SSEU structure that will be used by other upcoming changes.

v2:
 - Add has_xehp_dss flag

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 86 ++++++++++++++++------------
 drivers/gpu/drm/i915/gt/intel_sseu.h |  5 ++
 2 files changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index fdd25691beda..b5fd479a7b85 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -169,13 +169,43 @@ static void gen11_compute_sseu_info(struct sseu_dev_info *sseu, u8 s_en,
 	sseu->eu_total = compute_eu_total(sseu);
 }
 
-static void gen12_sseu_info_init(struct intel_gt *gt)
+static void xehp_sseu_info_init(struct intel_gt *gt)
 {
 	struct sseu_dev_info *sseu = &gt->info.sseu;
 	struct intel_uncore *uncore = gt->uncore;
 	u32 g_dss_en, c_dss_en = 0;
 	u16 eu_en = 0;
 	u8 eu_en_fuse;
+	int eu;
+
+	/*
+	 * The concept of slice has been removed in Xe_HP.  To be compatible
+	 * with prior generations, assume a single slice across the entire
+	 * device. Then calculate out the DSS for each workload type within
+	 * that software slice.
+	 */
+	intel_sseu_set_info(sseu, 1, 32, 16);
+	sseu->has_xehp_dss = 1;
+
+	g_dss_en = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
+	c_dss_en = intel_uncore_read(uncore, GEN12_GT_COMPUTE_DSS_ENABLE);
+
+	eu_en_fuse = intel_uncore_read(uncore, XEHP_EU_ENABLE) & XEHP_EU_ENA_MASK;
+
+	for (eu = 0; eu < sseu->max_eus_per_subslice / 2; eu++)
+		if (eu_en_fuse & BIT(eu))
+			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
+
+	gen11_compute_sseu_info(sseu, 0x1, g_dss_en, c_dss_en, eu_en);
+}
+
+static void gen12_sseu_info_init(struct intel_gt *gt)
+{
+	struct sseu_dev_info *sseu = &gt->info.sseu;
+	struct intel_uncore *uncore = gt->uncore;
+	u32 g_dss_en;
+	u16 eu_en = 0;
+	u8 eu_en_fuse;
 	u8 s_en;
 	int eu;
 
@@ -183,43 +213,23 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 	 * Gen12 has Dual-Subslices, which behave similarly to 2 gen11 SS.
 	 * Instead of splitting these, provide userspace with an array
 	 * of DSS to more closely represent the hardware resource.
-	 *
-	 * In addition, the concept of slice has been removed in Xe_HP.
-	 * To be compatible with prior generations, assume a single slice
-	 * across the entire device. Then calculate out the DSS for each
-	 * workload type within that software slice.
 	 */
-	if (IS_DG2(gt->i915) || IS_XEHPSDV(gt->i915))
-		intel_sseu_set_info(sseu, 1, 32, 16);
-	else
-		intel_sseu_set_info(sseu, 1, 6, 16);
+	intel_sseu_set_info(sseu, 1, 6, 16);
 
-	/*
-	 * As mentioned above, Xe_HP does not have the concept of a slice.
-	 * Enable one for software backwards compatibility.
-	 */
-	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
-		s_en = 0x1;
-	else
-		s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
-		       GEN11_GT_S_ENA_MASK;
+	s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
+		GEN11_GT_S_ENA_MASK;
 
 	g_dss_en = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
-	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
-		c_dss_en = intel_uncore_read(uncore, GEN12_GT_COMPUTE_DSS_ENABLE);
 
 	/* one bit per pair of EUs */
-	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
-		eu_en_fuse = intel_uncore_read(uncore, XEHP_EU_ENABLE) & XEHP_EU_ENA_MASK;
-	else
-		eu_en_fuse = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
-			       GEN11_EU_DIS_MASK);
+	eu_en_fuse = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
+		       GEN11_EU_DIS_MASK);
 
 	for (eu = 0; eu < sseu->max_eus_per_subslice / 2; eu++)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, s_en, g_dss_en, c_dss_en, eu_en);
+	gen11_compute_sseu_info(sseu, s_en, g_dss_en, 0, eu_en);
 
 	/* TGL only supports slice-level power gating */
 	sseu->has_slice_pg = 1;
@@ -574,18 +584,20 @@ void intel_sseu_info_init(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
-	if (IS_HASWELL(i915))
-		hsw_sseu_info_init(gt);
-	else if (IS_CHERRYVIEW(i915))
-		cherryview_sseu_info_init(gt);
-	else if (IS_BROADWELL(i915))
-		bdw_sseu_info_init(gt);
-	else if (GRAPHICS_VER(i915) == 9)
-		gen9_sseu_info_init(gt);
-	else if (GRAPHICS_VER(i915) == 11)
-		gen11_sseu_info_init(gt);
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+		xehp_sseu_info_init(gt);
 	else if (GRAPHICS_VER(i915) >= 12)
 		gen12_sseu_info_init(gt);
+	else if (GRAPHICS_VER(i915) >= 11)
+		gen11_sseu_info_init(gt);
+	else if (GRAPHICS_VER(i915) >= 9)
+		gen9_sseu_info_init(gt);
+	else if (IS_BROADWELL(i915))
+		bdw_sseu_info_init(gt);
+	else if (IS_CHERRYVIEW(i915))
+		cherryview_sseu_info_init(gt);
+	else if (IS_HASWELL(i915))
+		hsw_sseu_info_init(gt);
 }
 
 u32 intel_sseu_make_rpcs(struct intel_gt *gt,
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 5c078df4729c..4a041f9dc490 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -66,6 +66,11 @@ struct sseu_dev_info {
 	u8 has_slice_pg:1;
 	u8 has_subslice_pg:1;
 	u8 has_eu_pg:1;
+	/*
+	 * For Xe_HP and beyond, the hardware no longer has traditional slices
+	 * so we just report the entire DSS pool under a fake "slice 0."
+	 */
+	u8 has_xehp_dss:1;
 
 	/* Topology fields */
 	u8 max_slices;
-- 
2.35.3

