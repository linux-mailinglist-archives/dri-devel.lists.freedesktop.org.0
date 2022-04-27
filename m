Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E951275D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 01:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0521510F823;
	Wed, 27 Apr 2022 23:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6713910EDBA;
 Wed, 27 Apr 2022 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651100873; x=1682636873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1BxofhpDeBUp2vIZ0Sw+QC5nMLkRAec7DLj2JtpQj8=;
 b=LXfsXWfp2TvCFRyuD2w0TtLR/KUd6fdCYJ5Y+fDCPuD5AUSSjgdQT6BJ
 /Z2ueUALqzY9/Lgmb/FethVS0bYmJLuXd6qSg8Mhltd34O+hNbw3sTwNW
 Yh9cipy1ZfpNIhCOozSyRyKBXm8PWn/eTEnICTV3v5gLYny1pF1Ir2sES
 LQxWYFZa300lUehhKrAFjhTtmRJyTW3iTxrn1ZaVBzsrgnqE3oD9CiLTW
 wUdckgdw024N2rcvF41VshwzWi7SMBy/gptuOGUIxwulntTo14PKXM1Tv
 Sal34D23tmKRL1k0po5qrD/uIndnN9z7cQOp3udfkXld4RA0kZrhXe5PA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265912013"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="265912013"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="533495681"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/sseu: Don't try to store EU mask internally in
 UAPI format
Date: Wed, 27 Apr 2022 16:07:43 -0700
Message-Id: <20220427230747.906625-2-matthew.d.roper@intel.com>
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

Storing the EU mask internally in the same format the I915_QUERY
topology queries use makes the final copy_to_user() a bit simpler, but
makes the rest of the driver's SSEU more complicated.  Given that modern
platforms (gen11 and beyond) are architecturally guaranteed to have
equivalent EU masks for every subslice, it also wastes quite a bit of
space since we're storing a duplicate copy of the EU mask for every
single subslice where we really only need to store one instance.

Let's add a has_common_ss_eumask flag to the SSEU structure to determine
which type of hardware we're working on.  For the older pre-gen11
platforms the various subslices can have different EU masks so we use an
array of u16[] to store each subslice's copy.  For gen11 and beyond
we'll only use index [0] of the array and not worry about copying the
repeated value, except when converting into uapi form for the I915_QUERY
ioctl.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 66 +++++++++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_sseu.h | 21 ++++++++-
 drivers/gpu/drm/i915/i915_query.c    |  8 ++--
 3 files changed, 73 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 9881a6790574..13387b4024ea 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -91,36 +91,70 @@ static int sseu_eu_idx(const struct sseu_dev_info *sseu, int slice,
 static u16 sseu_get_eus(const struct sseu_dev_info *sseu, int slice,
 			int subslice)
 {
-	int i, offset = sseu_eu_idx(sseu, slice, subslice);
-	u16 eu_mask = 0;
-
-	for (i = 0; i < sseu->eu_stride; i++)
-		eu_mask |=
-			((u16)sseu->eu_mask[offset + i]) << (i * BITS_PER_BYTE);
+	if (!intel_sseu_has_subslice(sseu, slice, subslice))
+		return 0;
 
-	return eu_mask;
+	if (sseu->has_common_ss_eumask)
+		return sseu->eu_mask[0];
+	else
+		return sseu->eu_mask[slice * sseu->max_subslices + subslice];
 }
 
 static void sseu_set_eus(struct sseu_dev_info *sseu, int slice, int subslice,
 			 u16 eu_mask)
 {
-	int i, offset = sseu_eu_idx(sseu, slice, subslice);
+	WARN_ON(sseu->has_common_ss_eumask);
+	WARN_ON(sseu->max_eus_per_subslice > sizeof(sseu->eu_mask[0]) * BITS_PER_BYTE);
 
-	for (i = 0; i < sseu->eu_stride; i++)
-		sseu->eu_mask[offset + i] =
-			(eu_mask >> (BITS_PER_BYTE * i)) & 0xff;
+	sseu->eu_mask[slice * sseu->max_subslices + subslice] =
+		eu_mask & GENMASK(sseu->max_eus_per_subslice - 1, 0);
 }
 
 static u16 compute_eu_total(const struct sseu_dev_info *sseu)
 {
 	u16 i, total = 0;
 
+	if (sseu->has_common_ss_eumask)
+		return intel_sseu_subslices_per_slice(sseu, 0) *
+			hweight16(sseu->eu_mask[0]);
+
 	for (i = 0; i < ARRAY_SIZE(sseu->eu_mask); i++)
-		total += hweight8(sseu->eu_mask[i]);
+		total += hweight16(sseu->eu_mask[i]);
 
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
+			int offset = sseu_eu_idx(sseu, s, ss);
+			u16 mask = sseu_get_eus(sseu, s, ss);
+
+			for (i = 0; i < sseu->eu_stride; i++)
+				eu_mask[offset + i] =
+					(mask >> (BITS_PER_BYTE * i)) & 0xff;
+		}
+	}
+
+	return copy_to_user(to, eu_mask, len);
+}
+
 static u32 get_ss_stride_mask(struct sseu_dev_info *sseu, u8 s, u32 ss_en)
 {
 	u32 ss_mask;
@@ -134,7 +168,7 @@ static u32 get_ss_stride_mask(struct sseu_dev_info *sseu, u8 s, u32 ss_en)
 static void gen11_compute_sseu_info(struct sseu_dev_info *sseu, u8 s_en,
 				    u32 g_ss_en, u32 c_ss_en, u16 eu_en)
 {
-	int s, ss;
+	int s;
 
 	/* g_ss_en/c_ss_en represent entire subslice mask across all slices */
 	GEM_BUG_ON(sseu->max_slices * sseu->max_subslices >
@@ -162,11 +196,9 @@ static void gen11_compute_sseu_info(struct sseu_dev_info *sseu, u8 s_en,
 		intel_sseu_set_subslices(sseu, s, sseu->subslice_mask,
 					 get_ss_stride_mask(sseu, s,
 							    g_ss_en | c_ss_en));
-
-		for (ss = 0; ss < sseu->max_subslices; ss++)
-			if (intel_sseu_has_subslice(sseu, s, ss))
-				sseu_set_eus(sseu, s, ss, eu_en);
 	}
+	sseu->has_common_ss_eumask = 1;
+	sseu->eu_mask[0] = eu_en;
 	sseu->eu_per_subslice = hweight16(eu_en);
 	sseu->eu_total = compute_eu_total(sseu);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 5c078df4729c..106726a2244e 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -57,7 +57,21 @@ struct sseu_dev_info {
 	u8 subslice_mask[GEN_SS_MASK_SIZE];
 	u8 geometry_subslice_mask[GEN_SS_MASK_SIZE];
 	u8 compute_subslice_mask[GEN_SS_MASK_SIZE];
-	u8 eu_mask[GEN_SS_MASK_SIZE * GEN_MAX_EU_STRIDE];
+
+	/*
+	 * EU masks.  Use has_common_ss_eumask to determine how the field
+	 * will be interpreted.
+	 *
+	 * On pre-gen11 platforms, each subslice has independent EU fusing, so
+	 * we store an array of u16's that are sufficient to represent each
+	 * subslice's EU mask on pre-gen11 platforms.
+	 *
+	 * For gen11 and beyond, all subslices will always have the same set of
+	 * enabled/disabled EUs so only eu_mask[0] is utilized; all other array
+	 * entries are ignored.
+	 */
+	u16 eu_mask[GEN_MAX_HSW_SLICES * GEN_MAX_SS_PER_HSW_SLICE];
+
 	u16 eu_total;
 	u8 eu_per_subslice;
 	u8 min_eu_in_pool;
@@ -66,6 +80,8 @@ struct sseu_dev_info {
 	u8 has_slice_pg:1;
 	u8 has_subslice_pg:1;
 	u8 has_eu_pg:1;
+	/* All subslices have the same set of enabled/disabled EUs? */
+	u8 has_common_ss_eumask:1;
 
 	/* Topology fields */
 	u8 max_slices;
@@ -145,4 +161,7 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
 
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
2.35.1

