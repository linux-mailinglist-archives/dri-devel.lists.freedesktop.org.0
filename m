Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9A5297DB
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 05:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0DC10FCF7;
	Tue, 17 May 2022 03:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2963610E3FE;
 Tue, 17 May 2022 03:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652757627; x=1684293627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0RfYxmZcoe+qRaVlz6oAvPBs3n0im4EuWufoKUwqb18=;
 b=SjjxRM6w/wayoG+0BrU9jmEX/F/cuIjOnxrQc15KzNRib149uv8SGaEo
 CAKdh3lTuFuCKIuuN7vyVEtEEW+SEiiidzAxYyZBwniUQ3WzuNRDmRUQ0
 wqTTxXo5oCDbnhMjDgE0d9Cqd3vfg3p9HzH8Acw0WzrxVrk/Q8DboWwxc
 RCqiMBWb4CbKSNOT6b/BGHBdmJtUFXvvu6RkByehtOWIU43KBXuwBDKKK
 pk/nqiTR2kTeE3IhudTPQuPbVqY4rmjI3TmUAruYjN+hBTNCynByZcWtB
 difTByoJ9hK341Z58kSLrdw7uN+Ix/IW3eNarYhPycU5+5S2zFR07G+EP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="258603232"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="258603232"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="596877363"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/i915/sseu: Don't try to store EU mask internally
 in UAPI format
Date: Mon, 16 May 2022 20:20:03 -0700
Message-Id: <20220517032005.2694737-5-matthew.d.roper@intel.com>
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

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 77 +++++++++++++++++++---------
 drivers/gpu/drm/i915/gt/intel_sseu.h |  9 +++-
 drivers/gpu/drm/i915/i915_query.c    |  8 +--
 3 files changed, 65 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index ade3e1805782..d89e2e0f05e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -78,47 +78,76 @@ intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice)
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
+	if (sseu->has_xehp_dss) {
+		WARN_ON(slice > 0);
+		sseu->eu_mask.xehp[subslice] = eu_mask;
+	} else {
+		eu_mask &= GENMASK(sseu->max_eus_per_subslice - 1, 0);
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
+	int len = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
+	int s, ss, i;
+
+	for (s = 0; s < sseu->max_slices; s++) {
+		for (ss = 0; ss < sseu->max_subslices; ss++) {
+			int uapi_offset =
+				s * sseu->max_subslices * sseu->eu_stride +
+				ss * sseu->eu_stride;
+			u16 mask = sseu_get_eus(sseu, s, ss);
+
+			for (i = 0; i < sseu->eu_stride; i++)
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
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 4a041f9dc490..43a8f8f98687 100644
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
@@ -150,4 +154,7 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
 
 u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice);
 
+int intel_sseu_copy_eumask_to_user(void __user *to,
+				   const struct sseu_dev_info *sseu);
+
 #endif /* __INTEL_SSEU_H__ */
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 7584cec53d5d..16f43bf32a05 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -76,10 +76,10 @@ static int fill_topology_info(const struct sseu_dev_info *sseu,
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

