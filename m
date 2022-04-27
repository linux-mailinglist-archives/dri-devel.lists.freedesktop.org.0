Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9D512762
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 01:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79FA10E697;
	Wed, 27 Apr 2022 23:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7F110E6A8;
 Wed, 27 Apr 2022 23:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651100874; x=1682636874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7GAo4EUPy8Xww+4o/i5/Q7d5Z82BEOCd27NtXVLtP08=;
 b=VpySa96iZrdlYRtmUoYLuv7WvnqIOdx0JOX8OWlDN8xHBK2PccBGbblF
 V8A61u7ZXi0Q6X7DeI/LfCIgBFjdepvNu++moD9NDQxmK/7boC5Ay/gXy
 iDywO1SBpZfpMFAOvTlDt5gefGLYsBfiqZVsGie8oAe8HyWXSKWAe9OQd
 aYFelisHkB3mcCyElkAPXFiZFhTuTQDMri9HpF6HvkSGmhe6N/dUvvlzX
 EB7fDmqUBzWp7CfGWDKwgERYBIfBqboJlTA8WGhg7z7C9/fl7EI7ey1xw
 Gezzg/VVH/QcEYc+dByB+DNgwIP4jf7k1GDHuJQ8NrqVGEgSe6F8xyPwr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265912016"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="265912016"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="533495694"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/sseu: Simplify gen11+ SSEU handling
Date: Wed, 27 Apr 2022 16:07:46 -0700
Message-Id: <20220427230747.906625-5-matthew.d.roper@intel.com>
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

Although gen11 and gen12 architectures supported the concept of multiple
slices, in practice all the platforms that were actually designed only
had a single slice (i.e., note the parameters to 'intel_sseu_set_info'
that we pass for each platform).  We can simplify the code slightly by
dropping the multi-slice logic from gen11+ platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 73 ++++++++++++++--------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index ef66c2b8861a..f7ff6a9f67b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -155,48 +155,32 @@ int intel_sseu_copy_eumask_to_user(void __user *to,
 	return copy_to_user(to, eu_mask, len);
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
-	int s;
+	u32 valid_ss_mask = GENMASK(sseu->max_subslices - 1, 0);
 
 	/* g_ss_en/c_ss_en represent entire subslice mask across all slices */
 	GEM_BUG_ON(sseu->max_slices * sseu->max_subslices >
 		   sizeof(g_ss_en) * BITS_PER_BYTE);
 
-	for (s = 0; s < sseu->max_slices; s++) {
-		if ((s_en & BIT(s)) == 0)
-			continue;
+	sseu->slice_mask |= BIT(0);
+
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
-	}
 	sseu->has_common_ss_eumask = 1;
 	sseu->eu_mask[0] = eu_en;
 	sseu->eu_per_subslice = hweight16(eu_en);
@@ -229,7 +213,7 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, 0x1, g_dss_en, c_dss_en, eu_en);
+	gen11_compute_sseu_info(sseu, g_dss_en, c_dss_en, eu_en);
 }
 
 static void gen12_sseu_info_init(struct intel_gt *gt)
@@ -249,8 +233,15 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
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
 
@@ -262,7 +253,7 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, s_en, g_dss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, g_dss_en, 0, eu_en);
 
 	/* TGL only supports slice-level power gating */
 	sseu->has_slice_pg = 1;
@@ -281,14 +272,22 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
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
2.35.1

