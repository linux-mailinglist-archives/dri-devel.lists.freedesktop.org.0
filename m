Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD05297D4
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 05:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4810910E3CC;
	Tue, 17 May 2022 03:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2840210E377;
 Tue, 17 May 2022 03:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652757627; x=1684293627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GirTLKyDVXPYp/JK3nbklwCvY8UB2PmvvzwGX8+WhXI=;
 b=Rw7VNbGBmyA6aldWPb1b26qxeHkVsfuvh0IavmMzkMms/jG7UMPbeKwl
 MErkXmfSh6+75CUBldANnaay58LOYwt14r5daKTEJG6gIORNzWei5FabM
 9EDRVjgWODaLgWh+Q2EA0irs1+KfN9lbxpetrbMMHXxPbZbyzd4NweeyF
 S/pBvO7R71oYA1vG8SI0xc2GH86NAQb5ZpgpoAOGvXZbSqWnZJdi9qirs
 xhyZr+3AmjuGNk2d/QH0tQKHguWqotmx/cqtBF5HbnkGntP43IOq4l880
 nBJnqtSTQgsAc5NuPRahqqyJaLEj3nwxoNoZa1FIMdhD7l7aKd7T4i6/c Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="258603231"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="258603231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="596877359"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/i915/sseu: Simplify gen11+ SSEU handling
Date: Mon, 16 May 2022 20:20:02 -0700
Message-Id: <20220517032005.2694737-4-matthew.d.roper@intel.com>
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

Although gen11 and gen12 architectures supported the concept of multiple
slices, in practice all the platforms that were actually designed only
had a single slice (i.e., note the parameters to 'intel_sseu_set_info'
that we pass for each platform).  We can simplify the code slightly by
dropping the multi-slice logic from gen11+ platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 80 ++++++++++++++--------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index b5fd479a7b85..ade3e1805782 100644
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
@@ -216,8 +201,15 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 	 */
 	intel_sseu_set_info(sseu, 1, 6, 16);
 
+	/*
+	 * Although gen12 architecture supported multiple slices, TGL, RKL,
+	 * DG1, and ADL only had a single slice.
+	 */
 	s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
 		GEN11_GT_S_ENA_MASK;
+	if (s_en != 0x1)
+		drm_dbg(&gt->i915->drm, "Slice mask %#x is not the expected 0x1!\n",
+			s_en);
 
 	g_dss_en = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
 
@@ -229,7 +221,7 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, s_en, g_dss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, g_dss_en, 0, eu_en);
 
 	/* TGL only supports slice-level power gating */
 	sseu->has_slice_pg = 1;
@@ -248,14 +240,22 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
 	else
 		intel_sseu_set_info(sseu, 1, 8, 8);
 
+	/*
+	 * Although gen11 architecture supported multiple slices, ICL and
+	 * EHL/JSL only had a single slice in practice.
+	 */
 	s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
 		GEN11_GT_S_ENA_MASK;
+	if (s_en != 0x1)
+		drm_dbg(&gt->i915->drm, "Slice mask %#x is not the expected 0x1!\n",
+			s_en);
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

