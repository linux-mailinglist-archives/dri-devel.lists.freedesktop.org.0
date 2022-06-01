Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48B53A999
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CE610EB70;
	Wed,  1 Jun 2022 15:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCAD10EA63;
 Wed,  1 Jun 2022 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654096071; x=1685632071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XSlMKMDhjLRlb/Sl+xgxEo8Fhha9Q8xO/z6MnD4PHmY=;
 b=ltFnD/FdXY8o9i24qvWL1Vkj2UVm7BU3JLx5/VhlOl9WRu3gnU+YI8pb
 4j1j2lcIbZRWCzwz7/k1Pqzl/x0SJO6MXlyKNzfLk8zO+C6aKUBIROykS
 /IEwgDgR/oDNPz0R7KFaksoaLCgxdAR99ylNLuTXPoQ1Q21NwQfoKSbb7
 jJEyW2gBfKpC5s1b8ULh2Wase+Va3uwlpFqwULqTq2sLIaI/cwfqM5THM
 YmEpRgaUcgJWYjBU6xMNuwj/sdlyI0hWQ67HXb16YBXS7bIOsEIxurXWs
 wwGfXLae+JcMIjoa11ww8KC1YiqwJ8UDxBGEEtZ+Z2FAw2+R3ux2BPg8E w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="338665525"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="338665525"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="667465443"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 1/6] drm/i915/xehp: Use separate sseu init function
Date: Wed,  1 Jun 2022 08:07:20 -0700
Message-Id: <20220601150725.521468-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220601150725.521468-1-matthew.d.roper@intel.com>
References: <20220601150725.521468-1-matthew.d.roper@intel.com>
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
Cc: balasubramani.vivekanandan@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe_HP has enough fundamental differences from previous platforms that it
makes sense to use a separate SSEU init function to keep things
straightforward and easy to understand.  We'll also add a has_xehp_dss
flag to the SSEU structure that will be used by other upcoming changes.

v2:
 - Add has_xehp_dss flag

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

