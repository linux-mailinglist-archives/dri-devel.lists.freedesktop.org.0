Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C153A99C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E2E10EAA4;
	Wed,  1 Jun 2022 15:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D65010EAC8;
 Wed,  1 Jun 2022 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654096072; x=1685632072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5NiJhvS1gJ6TCiPgl8byC9n1HP5VEWC+EQIClcJnHM=;
 b=nGGXdhvEgAQqM0js+C7RLSrwdCtp3m1TM/5MM7R9UH2nw3FRZ4v6X6Jr
 72fyzZEn9zBFOc74dE+10ghIzNzevDiQvfomtbcw8O6DB16WbNDwxTqGK
 ZAS35N+UIjIFGejJcdNk/Wpm2UYpK0D8zS0LT6EDPcnCXdiIxpQEFIKVx
 AjUBC7yskv0ZULzrMYHxf7G2a5EOXAZ1h8qa+/SLY2L/nHuAp4y2SpXga
 QVOIwkwgjJMaogAbsFp7FMS05GcPis4eH3uh36mUkzJsjyQR0Njx1SBLJ
 c2H3xqS1jX/C1XVF9WGwW8NEr6Wp54cM1we1HVraIqPLIp+ju6ZDxvk6s A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="338665534"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="338665534"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="667465451"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 4/6] drm/i915/sseu: Don't try to store EU mask internally
 in UAPI format
Date: Wed,  1 Jun 2022 08:07:23 -0700
Message-Id: <20220601150725.521468-5-matthew.d.roper@intel.com>
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

Storing the EU mask internally in the same format the I915_QUERY
topology queries use makes the final copy_to_user() a bit simpler, but
makes the rest of the driver's SSEU more complicated and harder to
follow.  Let's switch to an internal representation that's more natural:
Xe_HP platforms will be a simple array of u16 masks, whereas pre-Xe_HP
platforms will be a two-dimensional array, indexed by [slice][subslice].
We'll convert to the uapi format only when the query uapi is called.

v2:
 - Drop has_common_ss_eumask.  We waste some space repeating identical
   EU masks for every single DSS, but the code is simpler without it.
   (Tvrtko)

v3:
 - Mask down EUs passed to sseu_set_eus at the callsite rather than
   inside the function.  (Tvrtko)
 - Eliminate sseu->eu_stride and calculate it when needed.  (Tvrtko)

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 88 ++++++++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_sseu.h | 10 +++-
 drivers/gpu/drm/i915/i915_query.c    | 13 ++--
 3 files changed, 73 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 7e5222ad2f98..285cfd758bdc 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -19,8 +19,6 @@ void intel_sseu_set_info(struct sseu_dev_info *sseu, u8 max_slices,
 
 	sseu->ss_stride = GEN_SSEU_STRIDE(sseu->max_subslices);
 	GEM_BUG_ON(sseu->ss_stride > GEN_MAX_SUBSLICE_STRIDE);
-	sseu->eu_stride = GEN_SSEU_STRIDE(sseu->max_eus_per_subslice);
-	GEM_BUG_ON(sseu->eu_stride > GEN_MAX_EU_STRIDE);
 }
 
 unsigned int
@@ -78,47 +76,77 @@ intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice)
 	return hweight32(intel_sseu_get_subslices(sseu, slice));
 }
 
-static int sseu_eu_idx(const struct sseu_dev_info *sseu, int slice,
-		       int subslice)
-{
-	int slice_stride = sseu->max_subslices * sseu->eu_stride;
-
-	return slice * slice_stride + subslice * sseu->eu_stride;
-}
-
 static u16 sseu_get_eus(const struct sseu_dev_info *sseu, int slice,
 			int subslice)
 {
-	int i, offset = sseu_eu_idx(sseu, slice, subslice);
-	u16 eu_mask = 0;
-
-	for (i = 0; i < sseu->eu_stride; i++)
-		eu_mask |=
-			((u16)sseu->eu_mask[offset + i]) << (i * BITS_PER_BYTE);
-
-	return eu_mask;
+	if (sseu->has_xehp_dss) {
+		WARN_ON(slice > 0);
+		return sseu->eu_mask.xehp[subslice];
+	} else {
+		return sseu->eu_mask.hsw[slice][subslice];
+	}
 }
 
 static void sseu_set_eus(struct sseu_dev_info *sseu, int slice, int subslice,
 			 u16 eu_mask)
 {
-	int i, offset = sseu_eu_idx(sseu, slice, subslice);
-
-	for (i = 0; i < sseu->eu_stride; i++)
-		sseu->eu_mask[offset + i] =
-			(eu_mask >> (BITS_PER_BYTE * i)) & 0xff;
+	GEM_WARN_ON(eu_mask && __fls(eu_mask) >= sseu->max_eus_per_subslice);
+	if (sseu->has_xehp_dss) {
+		GEM_WARN_ON(slice > 0);
+		sseu->eu_mask.xehp[subslice] = eu_mask;
+	} else {
+		sseu->eu_mask.hsw[slice][subslice] = eu_mask;
+	}
 }
 
 static u16 compute_eu_total(const struct sseu_dev_info *sseu)
 {
-	u16 i, total = 0;
+	int s, ss, total = 0;
 
-	for (i = 0; i < ARRAY_SIZE(sseu->eu_mask); i++)
-		total += hweight8(sseu->eu_mask[i]);
+	for (s = 0; s < sseu->max_slices; s++)
+		for (ss = 0; ss < sseu->max_subslices; ss++)
+			if (sseu->has_xehp_dss)
+				total += hweight16(sseu->eu_mask.xehp[ss]);
+			else
+				total += hweight16(sseu->eu_mask.hsw[s][ss]);
 
 	return total;
 }
 
+/**
+ * intel_sseu_copy_eumask_to_user - Copy EU mask into a userspace buffer
+ * @to: Pointer to userspace buffer to copy to
+ * @sseu: SSEU structure containing EU mask to copy
+ *
+ * Copies the EU mask to a userspace buffer in the format expected by
+ * the query ioctl's topology queries.
+ *
+ * Returns the result of the copy_to_user() operation.
+ */
+int intel_sseu_copy_eumask_to_user(void __user *to,
+				   const struct sseu_dev_info *sseu)
+{
+	u8 eu_mask[GEN_SS_MASK_SIZE * GEN_MAX_EU_STRIDE] = {};
+	int eu_stride = GEN_SSEU_STRIDE(sseu->max_eus_per_subslice);
+	int len = sseu->max_slices * sseu->max_subslices * eu_stride;
+	int s, ss, i;
+
+	for (s = 0; s < sseu->max_slices; s++) {
+		for (ss = 0; ss < sseu->max_subslices; ss++) {
+			int uapi_offset =
+				s * sseu->max_subslices * eu_stride +
+				ss * eu_stride;
+			u16 mask = sseu_get_eus(sseu, s, ss);
+
+			for (i = 0; i < eu_stride; i++)
+				eu_mask[uapi_offset + i] =
+					(mask >> (BITS_PER_BYTE * i)) & 0xff;
+		}
+	}
+
+	return copy_to_user(to, eu_mask, len);
+}
+
 static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
 				    u32 g_ss_en, u32 c_ss_en, u16 eu_en)
 {
@@ -278,7 +306,7 @@ static void cherryview_sseu_info_init(struct intel_gt *gt)
 			  CHV_FGT_EU_DIS_SS0_R1_SHIFT) << 4);
 
 		subslice_mask |= BIT(0);
-		sseu_set_eus(sseu, 0, 0, ~disabled_mask);
+		sseu_set_eus(sseu, 0, 0, ~disabled_mask & 0xFF);
 	}
 
 	if (!(fuse & CHV_FGT_DISABLE_SS1)) {
@@ -289,7 +317,7 @@ static void cherryview_sseu_info_init(struct intel_gt *gt)
 			  CHV_FGT_EU_DIS_SS1_R1_SHIFT) << 4);
 
 		subslice_mask |= BIT(1);
-		sseu_set_eus(sseu, 0, 1, ~disabled_mask);
+		sseu_set_eus(sseu, 0, 1, ~disabled_mask & 0xFF);
 	}
 
 	intel_sseu_set_subslices(sseu, 0, sseu->subslice_mask, subslice_mask);
@@ -362,7 +390,7 @@ static void gen9_sseu_info_init(struct intel_gt *gt)
 
 			eu_disabled_mask = (eu_disable >> (ss * 8)) & eu_mask;
 
-			sseu_set_eus(sseu, s, ss, ~eu_disabled_mask);
+			sseu_set_eus(sseu, s, ss, ~eu_disabled_mask & eu_mask);
 
 			eu_per_ss = sseu->max_eus_per_subslice -
 				hweight8(eu_disabled_mask);
@@ -475,7 +503,7 @@ static void bdw_sseu_info_init(struct intel_gt *gt)
 			eu_disabled_mask =
 				eu_disable[s] >> (ss * sseu->max_eus_per_subslice);
 
-			sseu_set_eus(sseu, s, ss, ~eu_disabled_mask);
+			sseu_set_eus(sseu, s, ss, ~eu_disabled_mask & 0xFF);
 
 			n_disabled = hweight8(eu_disabled_mask);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 4a041f9dc490..ffa375e68959 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -57,7 +57,11 @@ struct sseu_dev_info {
 	u8 subslice_mask[GEN_SS_MASK_SIZE];
 	u8 geometry_subslice_mask[GEN_SS_MASK_SIZE];
 	u8 compute_subslice_mask[GEN_SS_MASK_SIZE];
-	u8 eu_mask[GEN_SS_MASK_SIZE * GEN_MAX_EU_STRIDE];
+	union {
+		u16 hsw[GEN_MAX_HSW_SLICES][GEN_MAX_SS_PER_HSW_SLICE];
+		u16 xehp[GEN_MAX_DSS];
+	} eu_mask;
+
 	u16 eu_total;
 	u8 eu_per_subslice;
 	u8 min_eu_in_pool;
@@ -78,7 +82,6 @@ struct sseu_dev_info {
 	u8 max_eus_per_subslice;
 
 	u8 ss_stride;
-	u8 eu_stride;
 };
 
 /*
@@ -150,4 +153,7 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
 
 u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice);
 
+int intel_sseu_copy_eumask_to_user(void __user *to,
+				   const struct sseu_dev_info *sseu);
+
 #endif /* __INTEL_SSEU_H__ */
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 7584cec53d5d..89c475d525b8 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -35,6 +35,7 @@ static int fill_topology_info(const struct sseu_dev_info *sseu,
 {
 	struct drm_i915_query_topology_info topo;
 	u32 slice_length, subslice_length, eu_length, total_length;
+	int eu_stride = GEN_SSEU_STRIDE(sseu->max_eus_per_subslice);
 	int ret;
 
 	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
@@ -44,7 +45,7 @@ static int fill_topology_info(const struct sseu_dev_info *sseu,
 
 	slice_length = sizeof(sseu->slice_mask);
 	subslice_length = sseu->max_slices * sseu->ss_stride;
-	eu_length = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
+	eu_length = sseu->max_slices * sseu->max_subslices * eu_stride;
 	total_length = sizeof(topo) + slice_length + subslice_length +
 		       eu_length;
 
@@ -61,7 +62,7 @@ static int fill_topology_info(const struct sseu_dev_info *sseu,
 	topo.subslice_offset = slice_length;
 	topo.subslice_stride = sseu->ss_stride;
 	topo.eu_offset = slice_length + subslice_length;
-	topo.eu_stride = sseu->eu_stride;
+	topo.eu_stride = eu_stride;
 
 	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
 			 &topo, sizeof(topo)))
@@ -76,10 +77,10 @@ static int fill_topology_info(const struct sseu_dev_info *sseu,
 			 subslice_mask, subslice_length))
 		return -EFAULT;
 
-	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
-					 sizeof(topo) +
-					 slice_length + subslice_length),
-			 sseu->eu_mask, eu_length))
+	if (intel_sseu_copy_eumask_to_user(u64_to_user_ptr(query_item->data_ptr +
+							   sizeof(topo) +
+							   slice_length + subslice_length),
+					   sseu))
 		return -EFAULT;
 
 	return total_length;
-- 
2.35.3

