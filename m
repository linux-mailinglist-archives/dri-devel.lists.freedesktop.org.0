Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C352A5D3
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 17:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C44112141;
	Tue, 17 May 2022 15:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F338112024;
 Tue, 17 May 2022 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652800523; x=1684336523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=puHXglS/in/EcANYLBrQ3VUH9hoSHgN0rJMIAJdOe+E=;
 b=cOGaB9PtOqetuncVp/m/itA5Px3KkZ1ycGcjbh9Mi8fxiXe1w3FCKt3C
 yZufpQ3mwA4m+5wG4Xjt+b2HW63ZzRqzG7usgPYW21CuX523xEzFlnN0J
 xt2FTLuAu7LjkNl6mxwbZkr2rWS/iJuCl9wEcfaN98m95+QshRZ7r+4HM
 pXQ0o/K7U2WKXFaSUDV7Fls88K0XoHt6VVfjarm+RQn8tcBl4qPZ/B5sh
 f5yhhyALJgHpSHfLyVM3mFaUuGvLcmThok6gkMhiGBWRz2h+C0GiMpTFb
 sZ1OZlIWROHqeTXcDexUTZOHR8dFNopCMutUxeGPqYIowf+bQPm28Hn4E g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270904890"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="270904890"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 08:15:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="626522662"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 08:15:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/i915/sseu: Disassociate internal subslice mask
 representation from uapi
Date: Tue, 17 May 2022 08:15:06 -0700
Message-Id: <20220517151506.2729378-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517032005.2694737-6-matthew.d.roper@intel.com>
References: <20220517032005.2694737-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As with EU masks, it's easier to store subslice/DSS masks internally in
a format that's more natural for the driver to work with, and then only
covert into the u8[] uapi form when the query ioctl is invoked.  Since
the hardware design changed significantly with Xe_HP, we'll use a union
to choose between the old "hsw-style" subslice masks or the newer xehp
mask.  HSW-style masks will be stored in an array of u8's, indexed by
slice (there's never more than 6 subslices per slice on older
platforms).  For Xe_HP and beyond where slices no longer exist, we only
need a single bitmask.  However we already know that this mask is
eventually going to grow too large for a simple u64 to hold, so we'll
represent it in a manner that can be operated on by the utilities in
linux/bitmap.h.

v3:
 - Fix typo: BIT(s) -> BIT(ss) in gen9_sseu_device_status()

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c  |   5 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c           |  12 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 246 +++++++++++--------
 drivers/gpu/drm/i915/gt/intel_sseu.h         |  78 +++---
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  30 +--
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |  24 +-
 drivers/gpu/drm/i915/i915_getparam.c         |   3 +-
 drivers/gpu/drm/i915/i915_query.c            |   8 +-
 9 files changed, 226 insertions(+), 184 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ab4c5ab28e4d..a3bb73f5d53b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1875,6 +1875,7 @@ i915_gem_user_to_context_sseu(struct intel_gt *gt,
 {
 	const struct sseu_dev_info *device = &gt->info.sseu;
 	struct drm_i915_private *i915 = gt->i915;
+	unsigned int dev_subslice_mask = intel_sseu_get_hsw_subslices(device, 0);
 
 	/* No zeros in any field. */
 	if (!user->slice_mask || !user->subslice_mask ||
@@ -1901,7 +1902,7 @@ i915_gem_user_to_context_sseu(struct intel_gt *gt,
 	if (user->slice_mask & ~device->slice_mask)
 		return -EINVAL;
 
-	if (user->subslice_mask & ~device->subslice_mask[0])
+	if (user->subslice_mask & ~dev_subslice_mask)
 		return -EINVAL;
 
 	if (user->max_eus_per_subslice > device->max_eus_per_subslice)
@@ -1915,7 +1916,7 @@ i915_gem_user_to_context_sseu(struct intel_gt *gt,
 	/* Part specific restrictions. */
 	if (GRAPHICS_VER(i915) == 11) {
 		unsigned int hw_s = hweight8(device->slice_mask);
-		unsigned int hw_ss_per_s = hweight8(device->subslice_mask[0]);
+		unsigned int hw_ss_per_s = hweight8(dev_subslice_mask);
 		unsigned int req_s = hweight8(context->slice_mask);
 		unsigned int req_ss = hweight8(context->subslice_mask);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 1adbf34c3632..f0acf8518a51 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -674,8 +674,8 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
 		return;
 
-	ccs_mask = intel_slicemask_from_dssmask(intel_sseu_get_compute_subslices(&info->sseu),
-						ss_per_ccs);
+	ccs_mask = intel_slicemask_from_xehp_dssmask(info->sseu.compute_subslice_mask,
+						     ss_per_ccs);
 	/*
 	 * If all DSS in a quadrant are fused off, the corresponding CCS
 	 * engine is not available for use.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 034182f85501..2921f510642f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -133,13 +133,6 @@ static const struct intel_mmio_range dg2_lncf_steering_table[] = {
 	{},
 };
 
-static u16 slicemask(struct intel_gt *gt, int count)
-{
-	u64 dss_mask = intel_sseu_get_subslices(&gt->info.sseu, 0);
-
-	return intel_slicemask_from_dssmask(dss_mask, count);
-}
-
 int intel_gt_init_mmio(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
@@ -155,9 +148,12 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 	 */
 	if (HAS_MSLICES(i915)) {
 		gt->info.mslice_mask =
-			slicemask(gt, GEN_DSS_PER_MSLICE) |
+			intel_slicemask_from_xehp_dssmask(gt->info.sseu.subslice_mask,
+							  GEN_DSS_PER_MSLICE);
+		gt->info.mslice_mask |=
 			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
 			 GEN12_MEML3_EN_MASK);
+
 		if (!gt->info.mslice_mask) /* should be impossible! */
 			drm_warn(&i915->drm, "mslice mask all zero!\n");
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index d89e2e0f05e5..e1bce8a9044e 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -28,54 +28,23 @@ intel_sseu_subslice_total(const struct sseu_dev_info *sseu)
 {
 	unsigned int i, total = 0;
 
-	for (i = 0; i < ARRAY_SIZE(sseu->subslice_mask); i++)
-		total += hweight8(sseu->subslice_mask[i]);
+	if (sseu->has_xehp_dss)
+		return bitmap_weight(sseu->subslice_mask.xehp,
+				     I915_MAX_SS_FUSE_BITS);
 
-	return total;
-}
-
-static u32
-sseu_get_subslices(const struct sseu_dev_info *sseu,
-		   const u8 *subslice_mask, u8 slice)
-{
-	int i, offset = slice * sseu->ss_stride;
-	u32 mask = 0;
-
-	GEM_BUG_ON(slice >= sseu->max_slices);
-
-	for (i = 0; i < sseu->ss_stride; i++)
-		mask |= (u32)subslice_mask[offset + i] << i * BITS_PER_BYTE;
-
-	return mask;
-}
-
-u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
-{
-	return sseu_get_subslices(sseu, sseu->subslice_mask, slice);
-}
+	for (i = 0; i < ARRAY_SIZE(sseu->subslice_mask.hsw); i++)
+		total += hweight8(sseu->subslice_mask.hsw[i]);
 
-static u32 sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
-{
-	return sseu_get_subslices(sseu, sseu->geometry_subslice_mask, 0);
-}
-
-u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu)
-{
-	return sseu_get_subslices(sseu, sseu->compute_subslice_mask, 0);
-}
-
-void intel_sseu_set_subslices(struct sseu_dev_info *sseu, int slice,
-			      u8 *subslice_mask, u32 ss_mask)
-{
-	int offset = slice * sseu->ss_stride;
-
-	memcpy(&subslice_mask[offset], &ss_mask, sseu->ss_stride);
+	return total;
 }
 
 unsigned int
-intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice)
+intel_sseu_get_hsw_subslices(const struct sseu_dev_info *sseu, u8 slice)
 {
-	return hweight32(intel_sseu_get_subslices(sseu, slice));
+	WARN_ON(sseu->has_xehp_dss);
+	WARN_ON(slice >= sseu->max_slices);
+
+	return sseu->subslice_mask.hsw[slice];
 }
 
 static u16 sseu_get_eus(const struct sseu_dev_info *sseu, int slice,
@@ -148,32 +117,65 @@ int intel_sseu_copy_eumask_to_user(void __user *to,
 	return copy_to_user(to, eu_mask, len);
 }
 
+/**
+ * intel_sseu_copy_ssmask_to_user - Copy subslice mask into a userspace buffer
+ * @to: Pointer to userspace buffer to copy to
+ * @sseu: SSEU structure containing subslice mask to copy
+ *
+ * Copies the subslice mask to a userspace buffer in the format expected by
+ * the query ioctl's topology queries.
+ *
+ * Returns the result of the copy_to_user() operation.
+ */
+int intel_sseu_copy_ssmask_to_user(void __user *to,
+				   const struct sseu_dev_info *sseu)
+{
+	u8 ss_mask[GEN_SS_MASK_SIZE] = {};
+	int len = sseu->max_slices * sseu->ss_stride;
+	int s, ss, i;
+
+	for (s = 0; s < sseu->max_slices; s++) {
+		for (ss = 0; ss < sseu->max_subslices; ss++) {
+			i = s * sseu->ss_stride * BITS_PER_BYTE + ss;
+
+			if (!intel_sseu_has_subslice(sseu, s, ss))
+				continue;
+
+			ss_mask[i / BITS_PER_BYTE] |= BIT(i % BITS_PER_BYTE);
+		}
+	}
+
+	return copy_to_user(to, ss_mask, len);
+}
+
 static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
-				    u32 g_ss_en, u32 c_ss_en, u16 eu_en)
+				    u32 ss_en, u16 eu_en)
 {
 	u32 valid_ss_mask = GENMASK(sseu->max_subslices - 1, 0);
 	int ss;
 
-	/* g_ss_en/c_ss_en represent entire subslice mask across all slices */
-	GEM_BUG_ON(sseu->max_slices * sseu->max_subslices >
-		   sizeof(g_ss_en) * BITS_PER_BYTE);
+	sseu->slice_mask |= BIT(0);
+	sseu->subslice_mask.hsw[0] = ss_en & valid_ss_mask;
+
+	for (ss = 0; ss < sseu->max_subslices; ss++)
+		if (intel_sseu_has_subslice(sseu, 0, ss))
+			sseu_set_eus(sseu, 0, ss, eu_en);
+
+	sseu->eu_per_subslice = hweight16(eu_en);
+	sseu->eu_total = compute_eu_total(sseu);
+}
+
+static void xehp_compute_sseu_info(struct sseu_dev_info *sseu,
+				   u16 eu_en)
+{
+	int ss;
 
 	sseu->slice_mask |= BIT(0);
 
-	/*
-	 * XeHP introduces the concept of compute vs geometry DSS. To reduce
-	 * variation between GENs around subslice usage, store a mask for both
-	 * the geometry and compute enabled masks since userspace will need to
-	 * be able to query these masks independently.  Also compute a total
-	 * enabled subslice count for the purposes of selecting subslices to
-	 * use in a particular GEM context.
-	 */
-	intel_sseu_set_subslices(sseu, 0, sseu->compute_subslice_mask,
-				 c_ss_en & valid_ss_mask);
-	intel_sseu_set_subslices(sseu, 0, sseu->geometry_subslice_mask,
-				 g_ss_en & valid_ss_mask);
-	intel_sseu_set_subslices(sseu, 0, sseu->subslice_mask,
-				 (g_ss_en | c_ss_en) & valid_ss_mask);
+	bitmap_or(sseu->subslice_mask.xehp,
+		  sseu->compute_subslice_mask.xehp,
+		  sseu->geometry_subslice_mask.xehp,
+		  I915_MAX_SS_FUSE_BITS);
 
 	for (ss = 0; ss < sseu->max_subslices; ss++)
 		if (intel_sseu_has_subslice(sseu, 0, ss))
@@ -183,11 +185,31 @@ static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
 	sseu->eu_total = compute_eu_total(sseu);
 }
 
+static void
+xehp_load_dss_mask(struct intel_uncore *uncore,
+		   intel_sseu_ss_mask_t *ssmask,
+		   int numregs,
+		   ...)
+{
+	va_list argp;
+	u32 fuse_val[I915_MAX_SS_FUSE_REGS] = {};
+	int i;
+
+	if (WARN_ON(numregs > I915_MAX_SS_FUSE_REGS))
+		numregs = I915_MAX_SS_FUSE_REGS;
+
+	va_start(argp, numregs);
+	for (i = 0; i < numregs; i++)
+		fuse_val[i] = intel_uncore_read(uncore, va_arg(argp, i915_reg_t));
+	va_end(argp);
+
+	bitmap_from_arr32(ssmask->xehp, fuse_val, numregs * 32);
+}
+
 static void xehp_sseu_info_init(struct intel_gt *gt)
 {
 	struct sseu_dev_info *sseu = &gt->info.sseu;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 g_dss_en, c_dss_en = 0;
 	u16 eu_en = 0;
 	u8 eu_en_fuse;
 	int eu;
@@ -201,8 +223,10 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
 	intel_sseu_set_info(sseu, 1, 32, 16);
 	sseu->has_xehp_dss = 1;
 
-	g_dss_en = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
-	c_dss_en = intel_uncore_read(uncore, GEN12_GT_COMPUTE_DSS_ENABLE);
+	xehp_load_dss_mask(uncore, &sseu->geometry_subslice_mask, 1,
+			   GEN12_GT_GEOMETRY_DSS_ENABLE);
+	xehp_load_dss_mask(uncore, &sseu->compute_subslice_mask, 1,
+			   GEN12_GT_COMPUTE_DSS_ENABLE);
 
 	eu_en_fuse = intel_uncore_read(uncore, XEHP_EU_ENABLE) & XEHP_EU_ENA_MASK;
 
@@ -210,7 +234,7 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, g_dss_en, c_dss_en, eu_en);
+	xehp_compute_sseu_info(sseu, eu_en);
 }
 
 static void gen12_sseu_info_init(struct intel_gt *gt)
@@ -250,7 +274,7 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, g_dss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, g_dss_en, eu_en);
 
 	/* TGL only supports slice-level power gating */
 	sseu->has_slice_pg = 1;
@@ -284,7 +308,7 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
 	eu_en = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
 		  GEN11_EU_DIS_MASK);
 
-	gen11_compute_sseu_info(sseu, ss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, ss_en, eu_en);
 
 	/* ICL has no power gating restrictions. */
 	sseu->has_slice_pg = 1;
@@ -296,7 +320,6 @@ static void cherryview_sseu_info_init(struct intel_gt *gt)
 {
 	struct sseu_dev_info *sseu = &gt->info.sseu;
 	u32 fuse;
-	u8 subslice_mask = 0;
 
 	fuse = intel_uncore_read(gt->uncore, CHV_FUSE_GT);
 
@@ -310,7 +333,7 @@ static void cherryview_sseu_info_init(struct intel_gt *gt)
 			(((fuse & CHV_FGT_EU_DIS_SS0_R1_MASK) >>
 			  CHV_FGT_EU_DIS_SS0_R1_SHIFT) << 4);
 
-		subslice_mask |= BIT(0);
+		sseu->subslice_mask.hsw[0] |= BIT(0);
 		sseu_set_eus(sseu, 0, 0, ~disabled_mask);
 	}
 
@@ -321,12 +344,10 @@ static void cherryview_sseu_info_init(struct intel_gt *gt)
 			(((fuse & CHV_FGT_EU_DIS_SS1_R1_MASK) >>
 			  CHV_FGT_EU_DIS_SS1_R1_SHIFT) << 4);
 
-		subslice_mask |= BIT(1);
+		sseu->subslice_mask.hsw[0] |= BIT(1);
 		sseu_set_eus(sseu, 0, 1, ~disabled_mask);
 	}
 
-	intel_sseu_set_subslices(sseu, 0, sseu->subslice_mask, subslice_mask);
-
 	sseu->eu_total = compute_eu_total(sseu);
 
 	/*
@@ -381,8 +402,7 @@ static void gen9_sseu_info_init(struct intel_gt *gt)
 			/* skip disabled slice */
 			continue;
 
-		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
-					 subslice_mask);
+		sseu->subslice_mask.hsw[s] = subslice_mask;
 
 		eu_disable = intel_uncore_read(uncore, GEN9_EU_DISABLE(s));
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
@@ -439,8 +459,8 @@ static void gen9_sseu_info_init(struct intel_gt *gt)
 	sseu->has_eu_pg = sseu->eu_per_subslice > 2;
 
 	if (IS_GEN9_LP(i915)) {
-#define IS_SS_DISABLED(ss)	(!(sseu->subslice_mask[0] & BIT(ss)))
-		info->has_pooled_eu = hweight8(sseu->subslice_mask[0]) == 3;
+#define IS_SS_DISABLED(ss)	(!(sseu->subslice_mask.hsw[0] & BIT(ss)))
+		info->has_pooled_eu = hweight8(sseu->subslice_mask.hsw[0]) == 3;
 
 		sseu->min_eu_in_pool = 0;
 		if (info->has_pooled_eu) {
@@ -494,8 +514,7 @@ static void bdw_sseu_info_init(struct intel_gt *gt)
 			/* skip disabled slice */
 			continue;
 
-		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
-					 subslice_mask);
+		sseu->subslice_mask.hsw[s] = subslice_mask;
 
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			u8 eu_disabled_mask;
@@ -592,8 +611,7 @@ static void hsw_sseu_info_init(struct intel_gt *gt)
 			    sseu->eu_per_subslice);
 
 	for (s = 0; s < sseu->max_slices; s++) {
-		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
-					 subslice_mask);
+		sseu->subslice_mask.hsw[s] = subslice_mask;
 
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			sseu_set_eus(sseu, s, ss,
@@ -682,7 +700,7 @@ u32 intel_sseu_make_rpcs(struct intel_gt *gt,
 	 */
 	if (GRAPHICS_VER(i915) == 11 &&
 	    slices == 1 &&
-	    subslices > min_t(u8, 4, hweight8(sseu->subslice_mask[0]) / 2)) {
+	    subslices > min_t(u8, 4, hweight8(sseu->subslice_mask.hsw[0]) / 2)) {
 		GEM_BUG_ON(subslices & 1);
 
 		subslice_pg = false;
@@ -748,14 +766,25 @@ void intel_sseu_dump(const struct sseu_dev_info *sseu, struct drm_printer *p)
 {
 	int s;
 
-	drm_printf(p, "slice total: %u, mask=%04x\n",
-		   hweight8(sseu->slice_mask), sseu->slice_mask);
-	drm_printf(p, "subslice total: %u\n", intel_sseu_subslice_total(sseu));
-	for (s = 0; s < sseu->max_slices; s++) {
-		drm_printf(p, "slice%d: %u subslices, mask=%08x\n",
-			   s, intel_sseu_subslices_per_slice(sseu, s),
-			   intel_sseu_get_subslices(sseu, s));
+	if (sseu->has_xehp_dss) {
+		drm_printf(p, "subslice total: %u\n",
+			   intel_sseu_subslice_total(sseu));
+		drm_printf(p, "subslice mask=%*pb\n", I915_MAX_SS_FUSE_BITS,
+			   sseu->subslice_mask.xehp);
+	} else {
+		drm_printf(p, "slice total: %u, mask=%04x\n",
+			   hweight8(sseu->slice_mask), sseu->slice_mask);
+		drm_printf(p, "subslice total: %u\n",
+			   intel_sseu_subslice_total(sseu));
+
+		for (s = 0; s < sseu->max_slices; s++) {
+			u8 ss_mask = sseu->subslice_mask.hsw[s];
+
+			drm_printf(p, "slice%d: %u subslices, mask=%08x\n",
+				   s, hweight8(ss_mask), ss_mask);
+		}
 	}
+
 	drm_printf(p, "EU total: %u\n", sseu->eu_total);
 	drm_printf(p, "EU per subslice: %u\n", sseu->eu_per_subslice);
 	drm_printf(p, "has slice power gating: %s\n",
@@ -772,9 +801,10 @@ static void sseu_print_hsw_topology(const struct sseu_dev_info *sseu,
 	int s, ss;
 
 	for (s = 0; s < sseu->max_slices; s++) {
+		u8 ss_mask = sseu->subslice_mask.hsw[s];
+
 		drm_printf(p, "slice%d: %u subslice(s) (0x%08x):\n",
-			   s, intel_sseu_subslices_per_slice(sseu, s),
-			   intel_sseu_get_subslices(sseu, s));
+			   s, hweight8(ss_mask), ss_mask);
 
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			u16 enabled_eus = sseu_get_eus(sseu, s, ss);
@@ -788,16 +818,14 @@ static void sseu_print_hsw_topology(const struct sseu_dev_info *sseu,
 static void sseu_print_xehp_topology(const struct sseu_dev_info *sseu,
 				     struct drm_printer *p)
 {
-	u32 g_dss_mask = sseu_get_geometry_subslices(sseu);
-	u32 c_dss_mask = intel_sseu_get_compute_subslices(sseu);
 	int dss;
 
 	for (dss = 0; dss < sseu->max_subslices; dss++) {
 		u16 enabled_eus = sseu_get_eus(sseu, 0, dss);
 
 		drm_printf(p, "DSS_%02d: G:%3s C:%3s, %2u EUs (0x%04hx)\n", dss,
-			   str_yes_no(g_dss_mask & BIT(dss)),
-			   str_yes_no(c_dss_mask & BIT(dss)),
+			   str_yes_no(test_bit(dss, sseu->geometry_subslice_mask.xehp)),
+			   str_yes_no(test_bit(dss, sseu->compute_subslice_mask.xehp)),
 			   hweight16(enabled_eus), enabled_eus);
 	}
 }
@@ -815,20 +843,40 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
 	}
 }
 
-u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice)
+void intel_sseu_print_ss_info(const char* type,
+			      const struct sseu_dev_info *sseu,
+			      struct seq_file *m)
+{
+	int s;
+
+	if (sseu->has_xehp_dss)
+		seq_printf(m, "  %s Subslices: %u\n", type,
+			   bitmap_weight(sseu->subslice_mask.xehp,
+					 I915_MAX_SS_FUSE_BITS));
+	else
+		for (s = 0; s < fls(sseu->slice_mask); s++)
+			seq_printf(m, "  %s Slice%i subslices: %u\n", type,
+				   s, hweight8(sseu->subslice_mask.hsw[s]));
+}
+
+u16 intel_slicemask_from_xehp_dssmask(intel_sseu_ss_mask_t dss_mask,
+				      int dss_per_slice)
 {
+	intel_sseu_ss_mask_t per_slice_mask = {};
 	u16 slice_mask = 0;
 	int i;
 
-	WARN_ON(sizeof(dss_mask) * 8 / dss_per_slice > 8 * sizeof(slice_mask));
+	WARN_ON(DIV_ROUND_UP(I915_MAX_SS_FUSE_BITS, dss_per_slice) >
+		8 * sizeof(slice_mask));
 
-	for (i = 0; dss_mask; i++) {
-		if (dss_mask & GENMASK(dss_per_slice - 1, 0))
+	bitmap_fill(per_slice_mask.xehp, dss_per_slice);
+	for (i = 0; !bitmap_empty(dss_mask.xehp, I915_MAX_SS_FUSE_BITS); i++) {
+		if (bitmap_intersects(dss_mask.xehp, per_slice_mask.xehp, dss_per_slice))
 			slice_mask |= BIT(i);
 
-		dss_mask >>= dss_per_slice;
+		bitmap_shift_right(dss_mask.xehp, dss_mask.xehp, dss_per_slice,
+				   I915_MAX_SS_FUSE_BITS);
 	}
 
 	return slice_mask;
 }
-
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 43a8f8f98687..7fbb9276a1c2 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -25,12 +25,16 @@ struct drm_printer;
 /*
  * Maximum number of subslices that can exist within a HSW-style slice.  This
  * is only relevant to pre-Xe_HP platforms (Xe_HP and beyond use the
- * GEN_MAX_DSS value below).
+ * I915_MAX_SS_FUSE_BITS value below).
  */
 #define GEN_MAX_SS_PER_HSW_SLICE	6
 
-/* Maximum number of DSS on newer platforms (Xe_HP and beyond). */
-#define GEN_MAX_DSS			32
+/*
+ * Maximum number of 32-bit registers used by hardware to express the
+ * enabled/disabled subslices.
+ */
+#define I915_MAX_SS_FUSE_REGS	1
+#define I915_MAX_SS_FUSE_BITS	(I915_MAX_SS_FUSE_REGS * 32)
 
 /* Maximum number of EUs that can exist within a subslice or DSS. */
 #define GEN_MAX_EUS_PER_SS		16
@@ -38,7 +42,7 @@ struct drm_printer;
 #define SSEU_MAX(a, b)			((a) > (b) ? (a) : (b))
 
 /* The maximum number of bits needed to express each subslice/DSS independently */
-#define GEN_SS_MASK_SIZE		SSEU_MAX(GEN_MAX_DSS, \
+#define GEN_SS_MASK_SIZE		SSEU_MAX(I915_MAX_SS_FUSE_BITS, \
 						 GEN_MAX_HSW_SLICES * GEN_MAX_SS_PER_HSW_SLICE)
 
 #define GEN_SSEU_STRIDE(max_entries)	DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
@@ -49,17 +53,24 @@ struct drm_printer;
 #define GEN_DSS_PER_CSLICE	8
 #define GEN_DSS_PER_MSLICE	8
 
-#define GEN_MAX_GSLICES		(GEN_MAX_DSS / GEN_DSS_PER_GSLICE)
-#define GEN_MAX_CSLICES		(GEN_MAX_DSS / GEN_DSS_PER_CSLICE)
+#define GEN_MAX_GSLICES		(I915_MAX_SS_FUSE_BITS / GEN_DSS_PER_GSLICE)
+#define GEN_MAX_CSLICES		(I915_MAX_SS_FUSE_BITS / GEN_DSS_PER_CSLICE)
+
+typedef union {
+	u8 hsw[GEN_MAX_HSW_SLICES];
+
+	/* Bitmap compatible with linux/bitmap.h; may exceed size of u64 */
+	unsigned long xehp[BITS_TO_LONGS(I915_MAX_SS_FUSE_BITS)];
+} intel_sseu_ss_mask_t;
 
 struct sseu_dev_info {
 	u8 slice_mask;
-	u8 subslice_mask[GEN_SS_MASK_SIZE];
-	u8 geometry_subslice_mask[GEN_SS_MASK_SIZE];
-	u8 compute_subslice_mask[GEN_SS_MASK_SIZE];
+	intel_sseu_ss_mask_t subslice_mask;
+	intel_sseu_ss_mask_t geometry_subslice_mask;
+	intel_sseu_ss_mask_t compute_subslice_mask;
 	union {
 		u16 hsw[GEN_MAX_HSW_SLICES][GEN_MAX_SS_PER_HSW_SLICE];
-		u16 xehp[GEN_MAX_DSS];
+		u16 xehp[I915_MAX_SS_FUSE_BITS];
 	} eu_mask;
 
 	u16 eu_total;
@@ -100,7 +111,7 @@ intel_sseu_from_device_info(const struct sseu_dev_info *sseu)
 {
 	struct intel_sseu value = {
 		.slice_mask = sseu->slice_mask,
-		.subslice_mask = sseu->subslice_mask[0],
+		.subslice_mask = sseu->subslice_mask.hsw[0],
 		.min_eus_per_subslice = sseu->max_eus_per_subslice,
 		.max_eus_per_subslice = sseu->max_eus_per_subslice,
 	};
@@ -112,18 +123,23 @@ static inline bool
 intel_sseu_has_subslice(const struct sseu_dev_info *sseu, int slice,
 			int subslice)
 {
-	u8 mask;
-	int ss_idx = subslice / BITS_PER_BYTE;
-
-	if (slice >= sseu->max_slices ||
-	    subslice >= sseu->max_subslices)
-		return false;
-
-	GEM_BUG_ON(ss_idx >= sseu->ss_stride);
-
-	mask = sseu->subslice_mask[slice * sseu->ss_stride + ss_idx];
+	if (sseu->has_xehp_dss)
+		return test_bit(subslice, sseu->subslice_mask.xehp);
+	else
+		return sseu->subslice_mask.hsw[slice] & BIT(subslice);
+}
 
-	return mask & BIT(subslice % BITS_PER_BYTE);
+/*
+ * Used to obtain the index of the first DSS.  Can start searching from the
+ * beginning of a specific dss group (e.g., gslice, cslice, etc.) if
+ * groupsize and groupnum are non-zero.
+ */
+static inline unsigned int
+intel_sseu_find_first_xehp_dss(const struct sseu_dev_info *sseu, int groupsize,
+			       int groupnum)
+{
+	return find_next_bit(sseu->subslice_mask.xehp, I915_MAX_SS_FUSE_BITS,
+			     groupnum * groupsize);
 }
 
 void intel_sseu_set_info(struct sseu_dev_info *sseu, u8 max_slices,
@@ -133,14 +149,10 @@ unsigned int
 intel_sseu_subslice_total(const struct sseu_dev_info *sseu);
 
 unsigned int
-intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice);
-
-u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice);
+intel_sseu_get_hsw_subslices(const struct sseu_dev_info *sseu, u8 slice);
 
-u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu);
-
-void intel_sseu_set_subslices(struct sseu_dev_info *sseu, int slice,
-			      u8 *subslice_mask, u32 ss_mask);
+intel_sseu_ss_mask_t
+intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu);
 
 void intel_sseu_info_init(struct intel_gt *gt);
 
@@ -152,9 +164,15 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
 			       const struct sseu_dev_info *sseu,
 			       struct drm_printer *p);
 
-u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice);
+u16 intel_slicemask_from_xehp_dssmask(intel_sseu_ss_mask_t dss_mask, int dss_per_slice);
 
 int intel_sseu_copy_eumask_to_user(void __user *to,
 				   const struct sseu_dev_info *sseu);
+int intel_sseu_copy_ssmask_to_user(void __user *to,
+				   const struct sseu_dev_info *sseu);
+
+void intel_sseu_print_ss_info(const char* type,
+			      const struct sseu_dev_info *sseu,
+			      struct seq_file *m);
 
 #endif /* __INTEL_SSEU_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index 2d5d011e01db..c2ee5e1826b5 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -4,6 +4,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include <linux/bitmap.h>
 #include <linux/string_helpers.h>
 
 #include "i915_drv.h"
@@ -11,14 +12,6 @@
 #include "intel_gt_regs.h"
 #include "intel_sseu_debugfs.h"
 
-static void sseu_copy_subslices(const struct sseu_dev_info *sseu,
-				int slice, u8 *to_mask)
-{
-	int offset = slice * sseu->ss_stride;
-
-	memcpy(&to_mask[offset], &sseu->subslice_mask[offset], sseu->ss_stride);
-}
-
 static void cherryview_sseu_device_status(struct intel_gt *gt,
 					  struct sseu_dev_info *sseu)
 {
@@ -41,7 +34,7 @@ static void cherryview_sseu_device_status(struct intel_gt *gt,
 			continue;
 
 		sseu->slice_mask = BIT(0);
-		sseu->subslice_mask[0] |= BIT(ss);
+		sseu->subslice_mask.hsw[0] |= BIT(ss);
 		eu_cnt = ((sig1[ss] & CHV_EU08_PG_ENABLE) ? 0 : 2) +
 			 ((sig1[ss] & CHV_EU19_PG_ENABLE) ? 0 : 2) +
 			 ((sig1[ss] & CHV_EU210_PG_ENABLE) ? 0 : 2) +
@@ -92,7 +85,7 @@ static void gen11_sseu_device_status(struct intel_gt *gt,
 			continue;
 
 		sseu->slice_mask |= BIT(s);
-		sseu_copy_subslices(&info->sseu, s, sseu->subslice_mask);
+		sseu->subslice_mask.hsw[s] = info->sseu.subslice_mask.hsw[s];
 
 		for (ss = 0; ss < info->sseu.max_subslices; ss++) {
 			unsigned int eu_cnt;
@@ -147,21 +140,17 @@ static void gen9_sseu_device_status(struct intel_gt *gt,
 		sseu->slice_mask |= BIT(s);
 
 		if (IS_GEN9_BC(gt->i915))
-			sseu_copy_subslices(&info->sseu, s,
-					    sseu->subslice_mask);
+			sseu->subslice_mask.hsw[s] = info->sseu.subslice_mask.hsw[s];
 
 		for (ss = 0; ss < info->sseu.max_subslices; ss++) {
 			unsigned int eu_cnt;
-			u8 ss_idx = s * info->sseu.ss_stride +
-				    ss / BITS_PER_BYTE;
 
 			if (IS_GEN9_LP(gt->i915)) {
 				if (!(s_reg[s] & (GEN9_PGCTL_SS_ACK(ss))))
 					/* skip disabled subslice */
 					continue;
 
-				sseu->subslice_mask[ss_idx] |=
-					BIT(ss % BITS_PER_BYTE);
+				sseu->subslice_mask.hsw[s] |= BIT(ss);
 			}
 
 			eu_cnt = eu_reg[2 * s + ss / 2] & eu_mask[ss % 2];
@@ -188,8 +177,7 @@ static void bdw_sseu_device_status(struct intel_gt *gt,
 	if (sseu->slice_mask) {
 		sseu->eu_per_subslice = info->sseu.eu_per_subslice;
 		for (s = 0; s < fls(sseu->slice_mask); s++)
-			sseu_copy_subslices(&info->sseu, s,
-					    sseu->subslice_mask);
+			sseu->subslice_mask.hsw[s] = info->sseu.subslice_mask.hsw[s];
 		sseu->eu_total = sseu->eu_per_subslice *
 				 intel_sseu_subslice_total(sseu);
 
@@ -208,7 +196,6 @@ static void i915_print_sseu_info(struct seq_file *m,
 				 const struct sseu_dev_info *sseu)
 {
 	const char *type = is_available_info ? "Available" : "Enabled";
-	int s;
 
 	seq_printf(m, "  %s Slice Mask: %04x\n", type,
 		   sseu->slice_mask);
@@ -216,10 +203,7 @@ static void i915_print_sseu_info(struct seq_file *m,
 		   hweight8(sseu->slice_mask));
 	seq_printf(m, "  %s Subslice Total: %u\n", type,
 		   intel_sseu_subslice_total(sseu));
-	for (s = 0; s < fls(sseu->slice_mask); s++) {
-		seq_printf(m, "  %s Slice%i subslices: %u\n", type,
-			   s, intel_sseu_subslices_per_slice(sseu, s));
-	}
+	intel_sseu_print_ss_info(type, sseu, m);
 	seq_printf(m, "  %s EU Total: %u\n", type,
 		   sseu->eu_total);
 	seq_printf(m, "  %s EU Per Subslice: %u\n", type,
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 756807c4b405..fc6274708f8e 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -948,8 +948,8 @@ gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 	 * on s/ss combo, the read should be done with read_subslice_reg.
 	 */
 	slice = ffs(sseu->slice_mask) - 1;
-	GEM_BUG_ON(slice >= ARRAY_SIZE(sseu->subslice_mask));
-	subslice = ffs(intel_sseu_get_subslices(sseu, slice));
+	GEM_BUG_ON(slice >= ARRAY_SIZE(sseu->subslice_mask.hsw));
+	subslice = ffs(intel_sseu_get_hsw_subslices(sseu, slice));
 	GEM_BUG_ON(!subslice);
 	subslice--;
 
@@ -1087,11 +1087,10 @@ static void
 icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	const struct sseu_dev_info *sseu = &gt->info.sseu;
-	unsigned int slice, subslice;
+	unsigned int subslice;
 
 	GEM_BUG_ON(GRAPHICS_VER(gt->i915) < 11);
 	GEM_BUG_ON(hweight8(sseu->slice_mask) > 1);
-	slice = 0;
 
 	/*
 	 * Although a platform may have subslices, we need to always steer
@@ -1102,7 +1101,7 @@ icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	 * one of the higher subslices, we run the risk of reading back 0's or
 	 * random garbage.
 	 */
-	subslice = __ffs(intel_sseu_get_subslices(sseu, slice));
+	subslice = __ffs(intel_sseu_get_hsw_subslices(sseu, 0));
 
 	/*
 	 * If the subslice we picked above also steers us to a valid L3 bank,
@@ -1112,7 +1111,7 @@ icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	if (gt->info.l3bank_mask & BIT(subslice))
 		gt->steering_table[L3BANK] = NULL;
 
-	__add_mcr_wa(gt, wal, slice, subslice);
+	__add_mcr_wa(gt, wal, 0, subslice);
 }
 
 static void
@@ -1120,7 +1119,6 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	const struct sseu_dev_info *sseu = &gt->info.sseu;
 	unsigned long slice, subslice = 0, slice_mask = 0;
-	u64 dss_mask = 0;
 	u32 lncf_mask = 0;
 	int i;
 
@@ -1151,8 +1149,8 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	 */
 
 	/* Find the potential gslice candidates */
-	dss_mask = intel_sseu_get_subslices(sseu, 0);
-	slice_mask = intel_slicemask_from_dssmask(dss_mask, GEN_DSS_PER_GSLICE);
+	slice_mask = intel_slicemask_from_xehp_dssmask(sseu->subslice_mask,
+						       GEN_DSS_PER_GSLICE);
 
 	/*
 	 * Find the potential LNCF candidates.  Either LNCF within a valid
@@ -1177,9 +1175,8 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	}
 
 	slice = __ffs(slice_mask);
-	subslice = __ffs(dss_mask >> (slice * GEN_DSS_PER_GSLICE));
+	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice);
 	WARN_ON(subslice > GEN_DSS_PER_GSLICE);
-	WARN_ON(dss_mask >> (slice * GEN_DSS_PER_GSLICE) == 0);
 
 	__add_mcr_wa(gt, wal, slice, subslice);
 
@@ -2030,9 +2027,8 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 
 static bool needs_wa_1308578152(struct intel_engine_cs *engine)
 {
-	u64 dss_mask = intel_sseu_get_subslices(&engine->gt->info.sseu, 0);
-
-	return (dss_mask & GENMASK(GEN_DSS_PER_GSLICE - 1, 0)) == 0;
+	return intel_sseu_find_first_xehp_dss(&engine->gt->info.sseu, 0, 0) >
+		GEN_DSS_PER_GSLICE;
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index ac9767c56619..6fd15b39570c 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -162,8 +162,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 
 		/* Only copy bits from the first slice */
-		memcpy(&value, sseu->subslice_mask,
-		       min(sseu->ss_stride, (u8)sizeof(value)));
+		value = intel_sseu_get_hsw_subslices(sseu, 0);
 		if (!value)
 			return -ENODEV;
 		break;
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 16f43bf32a05..9afa6d1eaf95 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -31,7 +31,7 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
 
 static int fill_topology_info(const struct sseu_dev_info *sseu,
 			      struct drm_i915_query_item *query_item,
-			      const u8 *subslice_mask)
+			      intel_sseu_ss_mask_t subslice_mask)
 {
 	struct drm_i915_query_topology_info topo;
 	u32 slice_length, subslice_length, eu_length, total_length;
@@ -71,9 +71,9 @@ static int fill_topology_info(const struct sseu_dev_info *sseu,
 			 &sseu->slice_mask, slice_length))
 		return -EFAULT;
 
-	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
-					 sizeof(topo) + slice_length),
-			 subslice_mask, subslice_length))
+	if (intel_sseu_copy_ssmask_to_user(u64_to_user_ptr(query_item->data_ptr +
+							   sizeof(topo) + slice_length),
+					   sseu))
 		return -EFAULT;
 
 	if (intel_sseu_copy_eumask_to_user(u64_to_user_ptr(query_item->data_ptr +
-- 
2.35.3

