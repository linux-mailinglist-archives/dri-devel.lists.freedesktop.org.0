Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC5512763
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 01:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8DD10F835;
	Wed, 27 Apr 2022 23:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A96710EE38;
 Wed, 27 Apr 2022 23:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651100874; x=1682636874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfgMjXLkB879LNZ1hYiJL2duTAW16jVh1S1D++sQFDs=;
 b=AhFTSzMyQErrBhAghtbC/RYDGVhjPuzrpbJMtHPC4odZxgU4/7rgd6a6
 jHwIB3AIt4Lxl+PH6JwB1TBr2md3164wYnOAfWdZtP9zKCsikksIA2yzD
 JSsY/a/yT62REu53uamebLwVkdydE663Bn2VGbV9/Cxa2uwAGCUzWch1a
 8b0/fsgibowblWkZOfNyizWu0K5t/K5npyjILH3EmSDech9cwcx2YaZD6
 IiWpceujO/8UoaVpVv4QA89zeMr/F2mBiaKxImw5FTCDewN3s4IZ37EwM
 vgXZtbJ9R1OvjUWMpjqmhAP+XQx0K2E5hhSZnLo34GBcAbH49vlp0Pk0u A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265912017"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="265912017"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="533495698"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/sseu: Disassociate internal subslice mask
 representation from uapi
Date: Wed, 27 Apr 2022 16:07:47 -0700
Message-Id: <20220427230747.906625-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427230747.906625-1-matthew.d.roper@intel.com>
References: <20220427230747.906625-1-matthew.d.roper@intel.com>
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

Rather than storing subslice masks internally as u8[] (inside the sseu
structure) and u32 (everywhere else), let's move over to using an
intel_sseu_ss_mask_t typedef compatible with the operations in
linux/bitmap.h.  We're soon going to start adding code for a new
platform where subslice masks are spread across two 32-bit registers
(requiring 64 bits to represent), and we expect future platforms will
likely take this even farther, requiring bitmask storage larger than a
simple u64 can hold.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c  |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c           |  14 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 197 +++++++++++--------
 drivers/gpu/drm/i915/gt/intel_sseu.h         |  48 ++---
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  28 +--
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |  28 ++-
 drivers/gpu/drm/i915/i915_getparam.c         |   2 +-
 drivers/gpu/drm/i915/i915_query.c            |   8 +-
 9 files changed, 183 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ab4c5ab28e4d..ea012ee3a8de 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1901,7 +1901,7 @@ i915_gem_user_to_context_sseu(struct intel_gt *gt,
 	if (user->slice_mask & ~device->slice_mask)
 		return -EINVAL;
 
-	if (user->subslice_mask & ~device->subslice_mask[0])
+	if (user->subslice_mask & ~device->subslice_mask.b[0])
 		return -EINVAL;
 
 	if (user->max_eus_per_subslice > device->max_eus_per_subslice)
@@ -1915,7 +1915,7 @@ i915_gem_user_to_context_sseu(struct intel_gt *gt,
 	/* Part specific restrictions. */
 	if (GRAPHICS_VER(i915) == 11) {
 		unsigned int hw_s = hweight8(device->slice_mask);
-		unsigned int hw_ss_per_s = hweight8(device->subslice_mask[0]);
+		unsigned int hw_ss_per_s = hweight8(device->subslice_mask.b[0]);
 		unsigned int req_s = hweight8(context->slice_mask);
 		unsigned int req_ss = hweight8(context->subslice_mask);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 14c6ddbbfde8..39c09963b3c7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -610,7 +610,7 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
 		return;
 
-	ccs_mask = intel_slicemask_from_dssmask(intel_sseu_get_compute_subslices(&info->sseu),
+	ccs_mask = intel_slicemask_from_dssmask(info->sseu.compute_subslice_mask,
 						ss_per_ccs);
 	/*
 	 * If all DSS in a quadrant are fused off, the corresponding CCS
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 92394f13b42f..cc03512d59ba 100644
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
@@ -153,11 +146,14 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 	 * An mslice is unavailable only if both the meml3 for the slice is
 	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
 	 */
-	if (HAS_MSLICES(i915))
+	if (HAS_MSLICES(i915)) {
 		gt->info.mslice_mask =
-			slicemask(gt, GEN_DSS_PER_MSLICE) |
+			intel_slicemask_from_dssmask(gt->info.sseu.subslice_mask,
+						     GEN_DSS_PER_MSLICE);
+		gt->info.mslice_mask |=
 			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
 			 GEN12_MEML3_EN_MASK);
+	}
 
 	if (IS_DG2(i915)) {
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index f7ff6a9f67b0..466505d6bd18 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -28,56 +28,49 @@ void intel_sseu_set_info(struct sseu_dev_info *sseu, u8 max_slices,
 unsigned int
 intel_sseu_subslice_total(const struct sseu_dev_info *sseu)
 {
-	unsigned int i, total = 0;
-
-	for (i = 0; i < ARRAY_SIZE(sseu->subslice_mask); i++)
-		total += hweight8(sseu->subslice_mask[i]);
-
-	return total;
+	return bitmap_weight(sseu->subslice_mask.b, I915_MAX_SS_FUSE_BITS);
 }
 
-static u32
-sseu_get_subslices(const struct sseu_dev_info *sseu,
-		   const u8 *subslice_mask, u8 slice)
+static intel_sseu_ss_mask_t
+get_ss_mask_for_slice(const struct sseu_dev_info *sseu,
+		      intel_sseu_ss_mask_t all_ss,
+		      int slice)
 {
-	int i, offset = slice * sseu->ss_stride;
-	u32 mask = 0;
+	intel_sseu_ss_mask_t mask = {}, slice_ss = {};
+	int offset = slice * sseu->max_subslices;
 
 	GEM_BUG_ON(slice >= sseu->max_slices);
 
-	for (i = 0; i < sseu->ss_stride; i++)
-		mask |= (u32)subslice_mask[offset + i] << i * BITS_PER_BYTE;
+	if (sseu->max_slices == 1)
+		return all_ss;
 
-	return mask;
-}
+	bitmap_set(mask.b, offset, sseu->max_subslices);
+	bitmap_and(slice_ss.b, all_ss.b, mask.b, I915_MAX_SS_FUSE_BITS);
+	bitmap_shift_right(slice_ss.b, slice_ss.b, offset, I915_MAX_SS_FUSE_BITS);
 
-u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
-{
-	return sseu_get_subslices(sseu, sseu->subslice_mask, slice);
+	return slice_ss;
 }
 
-static u32 sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
+intel_sseu_ss_mask_t
+intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
 {
-	return sseu_get_subslices(sseu, sseu->geometry_subslice_mask, 0);
+	return get_ss_mask_for_slice(sseu, sseu->subslice_mask, slice);
 }
 
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
-}
-
-unsigned int
-intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice)
+/*
+ * Set the subslice mask associated with a specific slice.  Only needed on
+ * pre-gen11 platforms that have multiple slices.
+ */
+static void set_subslices(struct sseu_dev_info *sseu, int slice, u32 ss_mask)
 {
-	return hweight32(intel_sseu_get_subslices(sseu, slice));
+	intel_sseu_ss_mask_t mask = {}, newbits = {};
+	int offset = slice * sseu->max_subslices;
+
+	bitmap_set(mask.b, offset, sseu->max_subslices);
+	bitmap_from_arr32(newbits.b, &ss_mask, 32);
+	bitmap_shift_left(newbits.b, newbits.b, offset, I915_MAX_SS_FUSE_BITS);
+	bitmap_replace(sseu->subslice_mask.b, sseu->subslice_mask.b,
+		       newbits.b, mask.b, I915_MAX_SS_FUSE_BITS);
 }
 
 static int sseu_eu_idx(const struct sseu_dev_info *sseu, int slice,
@@ -115,7 +108,7 @@ static u16 compute_eu_total(const struct sseu_dev_info *sseu)
 	u16 i, total = 0;
 
 	if (sseu->has_common_ss_eumask)
-		return intel_sseu_subslices_per_slice(sseu, 0) *
+		return bitmap_weight(sseu->subslice_mask.b, I915_MAX_SS_FUSE_BITS) *
 			hweight16(sseu->eu_mask[0]);
 
 	for (i = 0; i < ARRAY_SIZE(sseu->eu_mask); i++)
@@ -155,11 +148,42 @@ int intel_sseu_copy_eumask_to_user(void __user *to,
 	return copy_to_user(to, eu_mask, len);
 }
 
-static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
-				    u32 g_ss_en, u32 c_ss_en, u16 eu_en)
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
 {
-	u32 valid_ss_mask = GENMASK(sseu->max_subslices - 1, 0);
+	u8 ss_mask[GEN_SS_MASK_SIZE] = {};
+	int len = sseu->max_slices * sseu->ss_stride;
+	int s, ss, i;
 
+	for (s = 0; s < sseu->max_slices; s++) {
+		for (ss = 0; ss < sseu->max_subslices; ss++) {
+			i = s * sseu->ss_stride + ss;
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
+static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
+				    intel_sseu_ss_mask_t g_ss_en,
+				    intel_sseu_ss_mask_t c_ss_en,
+				    u16 eu_en)
+{
 	/* g_ss_en/c_ss_en represent entire subslice mask across all slices */
 	GEM_BUG_ON(sseu->max_slices * sseu->max_subslices >
 		   sizeof(g_ss_en) * BITS_PER_BYTE);
@@ -174,12 +198,12 @@ static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
 	 * enabled subslice count for the purposes of selecting subslices to
 	 * use in a particular GEM context.
 	 */
-	intel_sseu_set_subslices(sseu, 0, sseu->compute_subslice_mask,
-				 c_ss_en & valid_ss_mask);
-	intel_sseu_set_subslices(sseu, 0, sseu->geometry_subslice_mask,
-				 g_ss_en & valid_ss_mask);
-	intel_sseu_set_subslices(sseu, 0, sseu->subslice_mask,
-				 (g_ss_en | c_ss_en) & valid_ss_mask);
+	bitmap_copy(sseu->compute_subslice_mask.b, c_ss_en.b, I915_MAX_SS_FUSE_BITS);
+	bitmap_copy(sseu->geometry_subslice_mask.b, g_ss_en.b, I915_MAX_SS_FUSE_BITS);
+	bitmap_or(sseu->subslice_mask.b,
+		  sseu->compute_subslice_mask.b,
+		  sseu->geometry_subslice_mask.b,
+		  I915_MAX_SS_FUSE_BITS);
 
 	sseu->has_common_ss_eumask = 1;
 	sseu->eu_mask[0] = eu_en;
@@ -191,7 +215,8 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
 {
 	struct sseu_dev_info *sseu = &gt->info.sseu;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 g_dss_en, c_dss_en = 0;
+	intel_sseu_ss_mask_t g_dss_en = {}, c_dss_en = {};
+	u32 val;
 	u16 eu_en = 0;
 	u8 eu_en_fuse;
 	int eu;
@@ -204,8 +229,11 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
 	 */
 	intel_sseu_set_info(sseu, 1, 32, 16);
 
-	g_dss_en = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
-	c_dss_en = intel_uncore_read(uncore, GEN12_GT_COMPUTE_DSS_ENABLE);
+	val = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
+	bitmap_from_arr32(g_dss_en.b, &val, 32);
+
+	val = intel_uncore_read(uncore, GEN12_GT_COMPUTE_DSS_ENABLE);
+	bitmap_from_arr32(c_dss_en.b, &val, 32);
 
 	eu_en_fuse = intel_uncore_read(uncore, XEHP_EU_ENABLE) & XEHP_EU_ENA_MASK;
 
@@ -220,7 +248,8 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 {
 	struct sseu_dev_info *sseu = &gt->info.sseu;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 g_dss_en;
+	intel_sseu_ss_mask_t g_dss_en = {}, empty_mask = {};
+	u32 val;
 	u16 eu_en = 0;
 	u8 eu_en_fuse;
 	u8 s_en;
@@ -243,7 +272,8 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 		drm_dbg(&gt->i915->drm, "Slice mask %#x is not the expected 0x1!\n",
 			s_en);
 
-	g_dss_en = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
+	val = intel_uncore_read(uncore, GEN12_GT_GEOMETRY_DSS_ENABLE);
+	bitmap_from_arr32(g_dss_en.b, &val, 32);
 
 	/* one bit per pair of EUs */
 	eu_en_fuse = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
@@ -253,7 +283,7 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
-	gen11_compute_sseu_info(sseu, g_dss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, g_dss_en, empty_mask, eu_en);
 
 	/* TGL only supports slice-level power gating */
 	sseu->has_slice_pg = 1;
@@ -263,7 +293,8 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
 {
 	struct sseu_dev_info *sseu = &gt->info.sseu;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 ss_en;
+	intel_sseu_ss_mask_t ss_en = {}, empty_mask = {};
+	u32 val;
 	u8 eu_en;
 	u8 s_en;
 
@@ -282,12 +313,13 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
 		drm_dbg(&gt->i915->drm, "Slice mask %#x is not the expected 0x1!\n",
 			s_en);
 
-	ss_en = ~intel_uncore_read(uncore, GEN11_GT_SUBSLICE_DISABLE);
+	val = ~intel_uncore_read(uncore, GEN11_GT_SUBSLICE_DISABLE);
+	bitmap_from_arr32(ss_en.b, &val, 32);
 
 	eu_en = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
 		  GEN11_EU_DIS_MASK);
 
-	gen11_compute_sseu_info(sseu, ss_en, 0, eu_en);
+	gen11_compute_sseu_info(sseu, ss_en, empty_mask, eu_en);
 
 	/* ICL has no power gating restrictions. */
 	sseu->has_slice_pg = 1;
@@ -328,7 +360,7 @@ static void cherryview_sseu_info_init(struct intel_gt *gt)
 		sseu_set_eus(sseu, 0, 1, ~disabled_mask);
 	}
 
-	intel_sseu_set_subslices(sseu, 0, sseu->subslice_mask, subslice_mask);
+	set_subslices(sseu, 0, subslice_mask);
 
 	sseu->eu_total = compute_eu_total(sseu);
 
@@ -384,8 +416,7 @@ static void gen9_sseu_info_init(struct intel_gt *gt)
 			/* skip disabled slice */
 			continue;
 
-		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
-					 subslice_mask);
+		set_subslices(sseu, s, subslice_mask);
 
 		eu_disable = intel_uncore_read(uncore, GEN9_EU_DISABLE(s));
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
@@ -442,8 +473,8 @@ static void gen9_sseu_info_init(struct intel_gt *gt)
 	sseu->has_eu_pg = sseu->eu_per_subslice > 2;
 
 	if (IS_GEN9_LP(i915)) {
-#define IS_SS_DISABLED(ss)	(!(sseu->subslice_mask[0] & BIT(ss)))
-		info->has_pooled_eu = hweight8(sseu->subslice_mask[0]) == 3;
+#define IS_SS_DISABLED(ss)	test_bit(ss, sseu->subslice_mask.b)
+		info->has_pooled_eu = hweight8(sseu->subslice_mask.b[0]) == 3;
 
 		sseu->min_eu_in_pool = 0;
 		if (info->has_pooled_eu) {
@@ -497,8 +528,7 @@ static void bdw_sseu_info_init(struct intel_gt *gt)
 			/* skip disabled slice */
 			continue;
 
-		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
-					 subslice_mask);
+		set_subslices(sseu, s, subslice_mask);
 
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			u8 eu_disabled_mask;
@@ -595,8 +625,7 @@ static void hsw_sseu_info_init(struct intel_gt *gt)
 			    sseu->eu_per_subslice);
 
 	for (s = 0; s < sseu->max_slices; s++) {
-		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
-					 subslice_mask);
+		set_subslices(sseu, s, subslice_mask);
 
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			sseu_set_eus(sseu, s, ss,
@@ -685,7 +714,7 @@ u32 intel_sseu_make_rpcs(struct intel_gt *gt,
 	 */
 	if (GRAPHICS_VER(i915) == 11 &&
 	    slices == 1 &&
-	    subslices > min_t(u8, 4, hweight8(sseu->subslice_mask[0]) / 2)) {
+	    subslices > min_t(u8, 4, hweight8(sseu->subslice_mask.b[0]) / 2)) {
 		GEM_BUG_ON(subslices & 1);
 
 		subslice_pg = false;
@@ -755,9 +784,11 @@ void intel_sseu_dump(const struct sseu_dev_info *sseu, struct drm_printer *p)
 		   hweight8(sseu->slice_mask), sseu->slice_mask);
 	drm_printf(p, "subslice total: %u\n", intel_sseu_subslice_total(sseu));
 	for (s = 0; s < sseu->max_slices; s++) {
-		drm_printf(p, "slice%d: %u subslices, mask=%08x\n",
-			   s, intel_sseu_subslices_per_slice(sseu, s),
-			   intel_sseu_get_subslices(sseu, s));
+		intel_sseu_ss_mask_t ssmask = intel_sseu_get_subslices(sseu, s);
+
+		drm_printf(p, "slice%d: %u subslices, mask=%*pb\n",
+			   s, bitmap_weight(ssmask.b, I915_MAX_SS_FUSE_BITS),
+			   I915_MAX_SS_FUSE_BITS, ssmask.b);
 	}
 	drm_printf(p, "EU total: %u\n", sseu->eu_total);
 	drm_printf(p, "EU per subslice: %u\n", sseu->eu_per_subslice);
@@ -775,9 +806,11 @@ static void sseu_print_hsw_topology(const struct sseu_dev_info *sseu,
 	int s, ss;
 
 	for (s = 0; s < sseu->max_slices; s++) {
-		drm_printf(p, "slice%d: %u subslice(s) (0x%08x):\n",
-			   s, intel_sseu_subslices_per_slice(sseu, s),
-			   intel_sseu_get_subslices(sseu, s));
+		intel_sseu_ss_mask_t ssmask = intel_sseu_get_subslices(sseu, s);
+
+		drm_printf(p, "slice%d: %u subslice(s) (0x%*pb):\n",
+			   s, bitmap_weight(ssmask.b, I915_MAX_SS_FUSE_BITS),
+			   I915_MAX_SS_FUSE_BITS, ssmask.b);
 
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			u16 enabled_eus = sseu_get_eus(sseu, s, ss);
@@ -791,16 +824,14 @@ static void sseu_print_hsw_topology(const struct sseu_dev_info *sseu,
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
+			   str_yes_no(test_bit(dss, sseu->geometry_subslice_mask.b)),
+			   str_yes_no(test_bit(dss, sseu->compute_subslice_mask.b)),
 			   hweight16(enabled_eus), enabled_eus);
 	}
 }
@@ -818,20 +849,24 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
 	}
 }
 
-u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice)
+u16 intel_slicemask_from_dssmask(intel_sseu_ss_mask_t dss_mask,
+				 int dss_per_slice)
 {
+	intel_sseu_ss_mask_t per_slice_mask = {};
 	u16 slice_mask = 0;
 	int i;
 
-	WARN_ON(sizeof(dss_mask) * 8 / dss_per_slice > 8 * sizeof(slice_mask));
+	WARN_ON(DIV_ROUND_UP(I915_MAX_SS_FUSE_BITS, dss_per_slice) >
+		8 * sizeof(slice_mask));
 
-	for (i = 0; dss_mask; i++) {
-		if (dss_mask & GENMASK(dss_per_slice - 1, 0))
+	bitmap_fill(per_slice_mask.b, dss_per_slice);
+	for (i = 0; !bitmap_empty(dss_mask.b, I915_MAX_SS_FUSE_BITS); i++) {
+		if (bitmap_intersects(dss_mask.b, per_slice_mask.b, dss_per_slice))
 			slice_mask |= BIT(i);
 
-		dss_mask >>= dss_per_slice;
+		bitmap_shift_right(dss_mask.b, dss_mask.b, dss_per_slice,
+				   I915_MAX_SS_FUSE_BITS);
 	}
 
 	return slice_mask;
 }
-
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 106726a2244e..455f085093ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -52,11 +52,22 @@ struct drm_printer;
 #define GEN_MAX_GSLICES		(GEN_MAX_DSS / GEN_DSS_PER_GSLICE)
 #define GEN_MAX_CSLICES		(GEN_MAX_DSS / GEN_DSS_PER_CSLICE)
 
+/*
+ * Maximum number of 32-bit registers used by hardware to express the
+ * enabled/disabled subslices.
+ */
+#define I915_MAX_SS_FUSE_REGS	1
+#define I915_MAX_SS_FUSE_BITS	(I915_MAX_SS_FUSE_REGS * 32)
+
+typedef struct {
+	unsigned long b[BITS_TO_LONGS(I915_MAX_SS_FUSE_BITS)];
+} intel_sseu_ss_mask_t;
+
 struct sseu_dev_info {
 	u8 slice_mask;
-	u8 subslice_mask[GEN_SS_MASK_SIZE];
-	u8 geometry_subslice_mask[GEN_SS_MASK_SIZE];
-	u8 compute_subslice_mask[GEN_SS_MASK_SIZE];
+	intel_sseu_ss_mask_t subslice_mask;
+	intel_sseu_ss_mask_t geometry_subslice_mask;
+	intel_sseu_ss_mask_t compute_subslice_mask;
 
 	/*
 	 * EU masks.  Use has_common_ss_eumask to determine how the field
@@ -107,7 +118,7 @@ intel_sseu_from_device_info(const struct sseu_dev_info *sseu)
 {
 	struct intel_sseu value = {
 		.slice_mask = sseu->slice_mask,
-		.subslice_mask = sseu->subslice_mask[0],
+		.subslice_mask = sseu->subslice_mask.b[0],
 		.min_eus_per_subslice = sseu->max_eus_per_subslice,
 		.max_eus_per_subslice = sseu->max_eus_per_subslice,
 	};
@@ -119,18 +130,8 @@ static inline bool
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
-
-	return mask & BIT(subslice % BITS_PER_BYTE);
+	return test_bit(slice * sseu->ss_stride + subslice,
+			sseu->subslice_mask.b);
 }
 
 void intel_sseu_set_info(struct sseu_dev_info *sseu, u8 max_slices,
@@ -139,15 +140,14 @@ void intel_sseu_set_info(struct sseu_dev_info *sseu, u8 max_slices,
 unsigned int
 intel_sseu_subslice_total(const struct sseu_dev_info *sseu);
 
-unsigned int
-intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice);
+intel_sseu_ss_mask_t
+intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice);
 
-u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice);
-
-u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu);
+intel_sseu_ss_mask_t
+intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu);
 
 void intel_sseu_set_subslices(struct sseu_dev_info *sseu, int slice,
-			      u8 *subslice_mask, u32 ss_mask);
+			      u32 ss_mask);
 
 void intel_sseu_info_init(struct intel_gt *gt);
 
@@ -159,9 +159,11 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
 			       const struct sseu_dev_info *sseu,
 			       struct drm_printer *p);
 
-u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice);
+u16 intel_slicemask_from_dssmask(intel_sseu_ss_mask_t dss_mask, int dss_per_slice);
 
 int intel_sseu_copy_eumask_to_user(void __user *to,
 				   const struct sseu_dev_info *sseu);
+int intel_sseu_copy_ssmask_to_user(void __user *to,
+				   const struct sseu_dev_info *sseu);
 
 #endif /* __INTEL_SSEU_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index 2d5d011e01db..1f77bd52a3a6 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -4,6 +4,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include <linux/bitmap.h>
 #include <linux/string_helpers.h>
 
 #include "i915_drv.h"
@@ -12,11 +13,15 @@
 #include "intel_sseu_debugfs.h"
 
 static void sseu_copy_subslices(const struct sseu_dev_info *sseu,
-				int slice, u8 *to_mask)
+				int slice,
+				intel_sseu_ss_mask_t *to_mask)
 {
-	int offset = slice * sseu->ss_stride;
+	int offset = slice * sseu->max_subslices;
 
-	memcpy(&to_mask[offset], &sseu->subslice_mask[offset], sseu->ss_stride);
+	bitmap_fill(to_mask->b, sseu->max_subslices);
+	bitmap_shift_left(to_mask->b, to_mask->b, offset, I915_MAX_SS_FUSE_BITS);
+	bitmap_and(to_mask->b, to_mask->b, sseu->subslice_mask.b, I915_MAX_SS_FUSE_BITS);
+	bitmap_shift_right(to_mask->b, to_mask->b, offset, I915_MAX_SS_FUSE_BITS);
 }
 
 static void cherryview_sseu_device_status(struct intel_gt *gt,
@@ -41,7 +46,7 @@ static void cherryview_sseu_device_status(struct intel_gt *gt,
 			continue;
 
 		sseu->slice_mask = BIT(0);
-		sseu->subslice_mask[0] |= BIT(ss);
+		set_bit(0, sseu->subslice_mask.b);
 		eu_cnt = ((sig1[ss] & CHV_EU08_PG_ENABLE) ? 0 : 2) +
 			 ((sig1[ss] & CHV_EU19_PG_ENABLE) ? 0 : 2) +
 			 ((sig1[ss] & CHV_EU210_PG_ENABLE) ? 0 : 2) +
@@ -92,7 +97,7 @@ static void gen11_sseu_device_status(struct intel_gt *gt,
 			continue;
 
 		sseu->slice_mask |= BIT(s);
-		sseu_copy_subslices(&info->sseu, s, sseu->subslice_mask);
+		sseu_copy_subslices(&info->sseu, s, &sseu->subslice_mask);
 
 		for (ss = 0; ss < info->sseu.max_subslices; ss++) {
 			unsigned int eu_cnt;
@@ -148,20 +153,17 @@ static void gen9_sseu_device_status(struct intel_gt *gt,
 
 		if (IS_GEN9_BC(gt->i915))
 			sseu_copy_subslices(&info->sseu, s,
-					    sseu->subslice_mask);
+					    &sseu->subslice_mask);
 
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
+				set_bit(ss, sseu->subslice_mask.b);
 			}
 
 			eu_cnt = eu_reg[2 * s + ss / 2] & eu_mask[ss % 2];
@@ -189,7 +191,7 @@ static void bdw_sseu_device_status(struct intel_gt *gt,
 		sseu->eu_per_subslice = info->sseu.eu_per_subslice;
 		for (s = 0; s < fls(sseu->slice_mask); s++)
 			sseu_copy_subslices(&info->sseu, s,
-					    sseu->subslice_mask);
+					    &sseu->subslice_mask);
 		sseu->eu_total = sseu->eu_per_subslice *
 				 intel_sseu_subslice_total(sseu);
 
@@ -217,8 +219,10 @@ static void i915_print_sseu_info(struct seq_file *m,
 	seq_printf(m, "  %s Subslice Total: %u\n", type,
 		   intel_sseu_subslice_total(sseu));
 	for (s = 0; s < fls(sseu->slice_mask); s++) {
+		intel_sseu_ss_mask_t ssmask = intel_sseu_get_subslices(sseu, s);
+
 		seq_printf(m, "  %s Slice%i subslices: %u\n", type,
-			   s, intel_sseu_subslices_per_slice(sseu, s));
+			   s, bitmap_weight(ssmask.b, I915_MAX_SS_FUSE_BITS));
 	}
 	seq_printf(m, "  %s EU Total: %u\n", type,
 		   sseu->eu_total);
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index a05c4b99b3fb..5db492072f99 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -931,6 +931,7 @@ static void
 gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 {
 	const struct sseu_dev_info *sseu = &to_gt(i915)->info.sseu;
+	intel_sseu_ss_mask_t ssmask;
 	unsigned int slice, subslice;
 	u32 mcr, mcr_mask;
 
@@ -948,9 +949,9 @@ gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 	 * on s/ss combo, the read should be done with read_subslice_reg.
 	 */
 	slice = ffs(sseu->slice_mask) - 1;
-	GEM_BUG_ON(slice >= ARRAY_SIZE(sseu->subslice_mask));
-	subslice = ffs(intel_sseu_get_subslices(sseu, slice));
-	GEM_BUG_ON(!subslice);
+	ssmask = intel_sseu_get_subslices(sseu, slice);
+	subslice = find_first_bit(ssmask.b, I915_MAX_SS_FUSE_BITS);
+	GEM_BUG_ON(subslice == I915_MAX_SS_FUSE_BITS);
 	subslice--;
 
 	/*
@@ -1087,11 +1088,10 @@ static void
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
@@ -1102,7 +1102,7 @@ icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	 * one of the higher subslices, we run the risk of reading back 0's or
 	 * random garbage.
 	 */
-	subslice = __ffs(intel_sseu_get_subslices(sseu, slice));
+	subslice = find_first_bit(sseu->subslice_mask.b, I915_MAX_SS_FUSE_BITS);
 
 	/*
 	 * If the subslice we picked above also steers us to a valid L3 bank,
@@ -1112,7 +1112,7 @@ icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	if (gt->info.l3bank_mask & BIT(subslice))
 		gt->steering_table[L3BANK] = NULL;
 
-	__add_mcr_wa(gt, wal, slice, subslice);
+	__add_mcr_wa(gt, wal, 0, subslice);
 }
 
 static void
@@ -1120,7 +1120,6 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	const struct sseu_dev_info *sseu = &gt->info.sseu;
 	unsigned long slice, subslice = 0, slice_mask = 0;
-	u64 dss_mask = 0;
 	u32 lncf_mask = 0;
 	int i;
 
@@ -1151,8 +1150,8 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	 */
 
 	/* Find the potential gslice candidates */
-	dss_mask = intel_sseu_get_subslices(sseu, 0);
-	slice_mask = intel_slicemask_from_dssmask(dss_mask, GEN_DSS_PER_GSLICE);
+	slice_mask = intel_slicemask_from_dssmask(sseu->subslice_mask,
+						  GEN_DSS_PER_GSLICE);
 
 	/*
 	 * Find the potential LNCF candidates.  Either LNCF within a valid
@@ -1177,9 +1176,9 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	}
 
 	slice = __ffs(slice_mask);
-	subslice = __ffs(dss_mask >> (slice * GEN_DSS_PER_GSLICE));
+	subslice = find_next_bit(sseu->subslice_mask.b, I915_MAX_SS_FUSE_BITS,
+				 slice * GEN_DSS_PER_GSLICE);
 	WARN_ON(subslice > GEN_DSS_PER_GSLICE);
-	WARN_ON(dss_mask >> (slice * GEN_DSS_PER_GSLICE) == 0);
 
 	__add_mcr_wa(gt, wal, slice, subslice);
 
@@ -2012,9 +2011,8 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 
 static bool needs_wa_1308578152(struct intel_engine_cs *engine)
 {
-	u64 dss_mask = intel_sseu_get_subslices(&engine->gt->info.sseu, 0);
-
-	return (dss_mask & GENMASK(GEN_DSS_PER_GSLICE - 1, 0)) == 0;
+	return find_first_bit(engine->gt->info.sseu.subslice_mask.b,
+			      I915_MAX_SS_FUSE_BITS) >= GEN_DSS_PER_GSLICE;
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index ac9767c56619..349d496d164a 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -162,7 +162,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 
 		/* Only copy bits from the first slice */
-		memcpy(&value, sseu->subslice_mask,
+		memcpy(&value, sseu->subslice_mask.b,
 		       min(sseu->ss_stride, (u8)sizeof(value)));
 		if (!value)
 			return -ENODEV;
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
2.35.1

