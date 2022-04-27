Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418D512764
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 01:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1BE10F832;
	Wed, 27 Apr 2022 23:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF75E10EDBA;
 Wed, 27 Apr 2022 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651100873; x=1682636873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lUf66ZnAVhl/rYa+kuUa5DCiytTqc7HQSC0tlHA4nBE=;
 b=k9hhy5jhSQPitKkVbGp/3wsN5HT3olNkN+4MByypn6TOI/DjBB+pERpv
 dC0atdvUKJSZsN5vz/m2HRqdJCj9HsutKrIPDN+NFomg9nd5ll/5ZRzds
 X2kDYLvZrfMkX6LKrgMPwzDxCfk+K1xxOE2LSeW8y4n2If1YUqftFX/Wh
 EUe/vOeuQ6qq+uKs5BkSl8alpQDlqepiO2Io/bHfGImyFpDcBNAllej9D
 rqP9jewSLZWBOAaFEig/i0vY4REyCXCWVn0XuLRBp20H7NDYNCMgYUqM+
 qJtHDdmyoTbt3lZur9GRZPuAv5fXO15S+7NYEq9vpPLM1UkKf29GuO596 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265912015"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="265912015"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="533495690"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/xehp: Use separate sseu init function
Date: Wed, 27 Apr 2022 16:07:45 -0700
Message-Id: <20220427230747.906625-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427230747.906625-1-matthew.d.roper@intel.com>
References: <20220427230747.906625-1-matthew.d.roper@intel.com>
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
straightforward and easy to understand.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 85 ++++++++++++++++------------
 1 file changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 13387b4024ea..ef66c2b8861a 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -203,13 +203,42 @@ static void gen11_compute_sseu_info(struct sseu_dev_info *sseu, u8 s_en,
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
 
@@ -217,43 +246,23 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
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
@@ -608,18 +617,20 @@ void intel_sseu_info_init(struct intel_gt *gt)
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
-- 
2.35.1

