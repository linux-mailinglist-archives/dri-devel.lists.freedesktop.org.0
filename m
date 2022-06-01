Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6892053A9AC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8D10ED58;
	Wed,  1 Jun 2022 15:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B4810EABD;
 Wed,  1 Jun 2022 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654096072; x=1685632072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=smFkVac93Nmbl1pQN5zv2H81XDgVi58ovZ6VqIVhs4I=;
 b=Drhi4/Cy//gdMdnzQHDEPHbqmCFGgwQbtD5S6SfIwPquVbIOPFRnzZdA
 bAtj1GdsPYE0od3tThYBWAUxfolKwCq9bXFhRJ9VfG1ZNZkufLKhVZm2O
 cT2cojtVZyYECAxoI7im7d2poXPgUFXlwNvig2mEWh4cY6HFQgcIrxIAF
 JCMtFAO7PQTumGi34rEXw/Gc9S86Rn8aYLYk+N+i2sldl9gUnwv34BZln
 OXA/stSQkUWfgL0GaR94IkFmMgE9As5JFScROsedBMkAFbwD0Vok2hxNV
 RSrmKc2jL9nQGI9VsRlHRmR879YftGN2SG7ahFtIQNKd8r32U58FXdzYs Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="338665532"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="338665532"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="667465448"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/6] drm/i915/sseu: Simplify gen11+ SSEU handling
Date: Wed,  1 Jun 2022 08:07:22 -0700
Message-Id: <20220601150725.521468-4-matthew.d.roper@intel.com>
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

Although gen11 and gen12 architectures supported the concept of multiple
slices, in practice all the platforms that were actually designed only
had a single slice (i.e., note the parameters to 'intel_sseu_set_info'
that we pass for each platform).  We can simplify the code slightly by
dropping the multi-slice logic from gen11+ platforms.

v2:
 - Promote drm_dbg to drm_WARN_ON if the slice fuse register reports
   unexpected fusing.  (Tvrtko)

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 76 +++++++++++++---------------
 1 file changed, 36 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index b5fd479a7b85..7e5222ad2f98 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -119,52 +119,37 @@ static u16 compute_eu_total(const struct sseu_dev_info *sseu)
 	return total;
 }
 
-static u32 get_ss_stride_mask(struct sseu_dev_info *sseu, u8 s, u32 ss_en)
-{
-	u32 ss_mask;
-
-	ss_mask = ss_en >> (s * sseu->max_subslices);
-	ss_mask &= GENMASK(sseu->max_subslices - 1, 0);
-
-	return ss_mask;
-}
-
-static void gen11_compute_sseu_info(struct sseu_dev_info *sseu, u8 s_en,
+static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
 				    u32 g_ss_en, u32 c_ss_en, u16 eu_en)
 {
-	int s, ss;
+	u32 valid_ss_mask = GENMASK(sseu->max_subslices - 1, 0);
+	int ss;
 
 	/* g_ss_en/c_ss_en represent entire subslice mask across all slices */
 	GEM_BUG_ON(sseu->max_slices * sseu->max_subslices >
 		   sizeof(g_ss_en) * BITS_PER_BYTE);
 
-	for (s = 0; s < sseu->max_slices; s++) {
-		if ((s_en & BIT(s)) == 0)
-			continue;
+	sseu->slice_mask |= BIT(0);
 
-		sseu->slice_mask |= BIT(s);
-
-		/*
-		 * XeHP introduces the concept of compute vs geometry DSS. To
-		 * reduce variation between GENs around subslice usage, store a
-		 * mask for both the geometry and compute enabled masks since
-		 * userspace will need to be able to query these masks
-		 * independently.  Also compute a total enabled subslice count
-		 * for the purposes of selecting subslices to use in a
-		 * particular GEM context.
-		 */
-		intel_sseu_set_subslices(sseu, s, sseu->compute_subslice_mask,
-					 get_ss_stride_mask(sseu, s, c_ss_en));
-		intel_sseu_set_subslices(sseu, s, sseu->geometry_subslice_mask,
-					 get_ss_stride_mask(sseu, s, g_ss_en));
-		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
-					 get_ss_stride_mask(sseu, s,
-							    g_ss_en | c_ss_en));
+	/*
+	 * XeHP introduces the concept of compute vs geometry DSS. To reduce
+	 * variation between GENs around subslice usage, store a mask for both
+	 * the geometry and compute enabled masks since userspace will need to
+	 * be able to query these masks independently.  Also compute a total
+	 * enabled subslice count for the purposes of selecting subslices to
+	 * use in a particular GEM context.
+	 */
+	intel_sseu_set_subslices(sseu, 0, sseu->compute_subslice_mask,
+				 c_ss_en & valid_ss_mask);
+	intel_sseu_set_subslices(sseu, 0, sseu->geometry_subslice_mask,
+				 g_ss_en & valid_ss_mask);
+	intel_sseu_set_subslices(sseu, 0, sseu->subslice_mask,
+				 (g_ss_en | c_ss_en) & valid_ss_mask);
+
+	for (ss = 0; ss < sseu->max_subslices; ss++)
+		if (intel_sseu_has_subslice(sseu, 0, ss))
+			sseu_set_eus(sseu, 0, ss, eu_en);
 
-		for (ss = 0; ss < sseu->max_subslices; ss++)
-			if (intel_sseu_has_subslice(sseu, s, ss))
-				sseu_set_eus(sseu, s, ss, eu_en);
-	}
 	sseu->eu_per_subslice = hweight16(eu_en);
 	sseu->eu_total = compute_eu_total(sseu);
 }
@@ -196,7 +181,7 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, 0x1, g_dss_en, c_dss_en, eu_en);
+	gen11_compute_sseu_info(sseu, g_dss_en, c_dss_en, eu_en);
 }
 
 static void gen12_sseu_info_init(struct intel_gt *gt)
@@ -216,8 +201,13 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 	 */
 	intel_sseu_set_info(sseu, 1, 6, 16);
 
+	/*
+	 * Although gen12 architecture supported multiple slices, TGL, RKL,
+	 * DG1, and ADL only had a single slice.
+	 */
 	s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
 		GEN11_GT_S_ENA_MASK;
+	drm_WARN_ON(&gt->i915->drm, s_en != 0x1);
 
 	g_dss_en = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
 
@@ -229,7 +219,7 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, s_en, g_dss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, g_dss_en, 0, eu_en);
 
 	/* TGL only supports slice-level power gating */
 	sseu->has_slice_pg = 1;
@@ -248,14 +238,20 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
 	else
 		intel_sseu_set_info(sseu, 1, 8, 8);
 
+	/*
+	 * Although gen11 architecture supported multiple slices, ICL and
+	 * EHL/JSL only had a single slice in practice.
+	 */
 	s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
 		GEN11_GT_S_ENA_MASK;
+	drm_WARN_ON(&gt->i915->drm, s_en != 0x1);
+
 	ss_en = ~intel_uncore_read(uncore, GEN11_GT_SUBSLICE_DISABLE);
 
 	eu_en = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
 		  GEN11_EU_DIS_MASK);
 
-	gen11_compute_sseu_info(sseu, s_en, ss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, ss_en, 0, eu_en);
 
 	/* ICL has no power gating restrictions. */
 	sseu->has_slice_pg = 1;
-- 
2.35.3

