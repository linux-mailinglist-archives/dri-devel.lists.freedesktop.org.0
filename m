Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF44D5B77
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 07:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E2310E1E2;
	Fri, 11 Mar 2022 06:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24F210E1E2;
 Fri, 11 Mar 2022 06:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646979354; x=1678515354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XMx3oD4MZseJb8Q0bnpaY26JZjvlTcZENslKx3g3uNk=;
 b=FSB99rV1Cf69lvq7xXPPnfLYX/FZ8pUJYn8bK5heCSBP+OHkyd999Xqj
 0eFCiZMbFGC5UJbx0ehJZzCUtOjBsmxbNAT3rr4fmKh9iw+FnxUtk0TSj
 qxX0/T3gOP98ftSPTK/KxCQuD4LDmGvthAQ6haAyl94SzeSM1EnsHlLFR
 OXtxdjic5CKYPNV93qAUYnKmYrJcTH+RFlpi8Ms/+LG11O8DrA0NhGPKt
 IKkGEXBk2CNO5kBnxdlv88/PvsYt1PAWyf7EiibFV15sESd7Bg7+4X424
 PdE+xeCz6+viQsLbHYCuTDYaDDLF/W5+LKeK7natvf6H2WyQYqZuDGKgB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="316231245"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="316231245"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 22:15:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="538885116"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 22:15:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/sseu: Don't overallocate subslice storage
Date: Thu, 10 Mar 2022 22:15:42 -0800
Message-Id: <20220311061543.153611-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe_HP removed "slice" as a first-class unit in the hardware design.
Instead we now have a single pool of subslices (which are now referred
to as "DSS") that different hardware units have different ways of
grouping ("compute slices," "geometry slices," etc.).  For the purposes
of topology representation, we treat Xe_HP-based platforms as having a
single slice that contains all of the platform's DSS.  There's no need
to allocate storage space for (max legacy slices * max dss); let's
update some of our macros to minimize the storage requirement for sseu
topology.  We'll also document some of the constants to make it a little
bit more clear what they represent.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h         | 47 +++++++++++++++-----
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 4fbf45a74ec0..f9e246004bc0 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -645,7 +645,7 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
 
 #define for_each_instdone_gslice_dss_xehp(dev_priv_, sseu_, iter_, gslice_, dss_) \
 	for ((iter_) = 0, (gslice_) = 0, (dss_) = 0; \
-	     (iter_) < GEN_MAX_SUBSLICES; \
+	     (iter_) < GEN_SS_MASK_SIZE; \
 	     (iter_)++, (gslice_) = (iter_) / GEN_DSS_PER_GSLICE, \
 	     (dss_) = (iter_) % GEN_DSS_PER_GSLICE) \
 		for_each_if(intel_sseu_has_subslice((sseu_), 0, (iter_)))
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 8a79cd8eaab4..4f59eadbb61a 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -15,26 +15,49 @@ struct drm_i915_private;
 struct intel_gt;
 struct drm_printer;
 
-#define GEN_MAX_SLICES		(3) /* SKL upper bound */
-#define GEN_MAX_SUBSLICES	(32) /* XEHPSDV upper bound */
-#define GEN_SSEU_STRIDE(max_entries) DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
-#define GEN_MAX_SUBSLICE_STRIDE GEN_SSEU_STRIDE(GEN_MAX_SUBSLICES)
-#define GEN_MAX_EUS		(16) /* TGL upper bound */
-#define GEN_MAX_EU_STRIDE GEN_SSEU_STRIDE(GEN_MAX_EUS)
+/*
+ * Maximum number of legacy slices.  Legacy slices no longer exist starting on
+ * Xe_HP ("gslices," "cslices," etc. on Xe_HP and beyond are a different
+ * concept and are not expressed through fusing).
+ */
+#define GEN_MAX_LEGACY_SLICES		3
+
+/*
+ * Maximum number of subslices that can exist within a legacy slice.  This is
+ * only relevant to pre-Xe_HP platforms (Xe_HP and beyond use the GEN_MAX_DSS
+ * value below).
+ */
+#define GEN_MAX_LEGACY_SUBSLICES	6
+
+/* Maximum number of DSS on newer platforms (Xe_HP and beyond). */
+#define GEN_MAX_DSS			32
+
+/* Maximum number of EUs that can exist within a subslice or DSS. */
+#define GEN_MAX_EUS_PER_SS		16
+
+#define MAX(a, b)			((a) > (b) ? (a) : (b))
+
+/* The maximum number of bits needed to express each subslice/DSS independently */
+#define GEN_SS_MASK_SIZE		MAX(GEN_MAX_DSS, \
+					    GEN_MAX_LEGACY_SLICES * GEN_MAX_LEGACY_SUBSLICES)
+
+#define GEN_SSEU_STRIDE(max_entries)	DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
+#define GEN_MAX_SUBSLICE_STRIDE		GEN_SSEU_STRIDE(GEN_SS_MASK_SIZE)
+#define GEN_MAX_EU_STRIDE		GEN_SSEU_STRIDE(GEN_MAX_EUS_PER_SS)
 
 #define GEN_DSS_PER_GSLICE	4
 #define GEN_DSS_PER_CSLICE	8
 #define GEN_DSS_PER_MSLICE	8
 
-#define GEN_MAX_GSLICES		(GEN_MAX_SUBSLICES / GEN_DSS_PER_GSLICE)
-#define GEN_MAX_CSLICES		(GEN_MAX_SUBSLICES / GEN_DSS_PER_CSLICE)
+#define GEN_MAX_GSLICES		(GEN_MAX_DSS / GEN_DSS_PER_GSLICE)
+#define GEN_MAX_CSLICES		(GEN_MAX_DSS / GEN_DSS_PER_CSLICE)
 
 struct sseu_dev_info {
 	u8 slice_mask;
-	u8 subslice_mask[GEN_MAX_SLICES * GEN_MAX_SUBSLICE_STRIDE];
-	u8 geometry_subslice_mask[GEN_MAX_SLICES * GEN_MAX_SUBSLICE_STRIDE];
-	u8 compute_subslice_mask[GEN_MAX_SLICES * GEN_MAX_SUBSLICE_STRIDE];
-	u8 eu_mask[GEN_MAX_SLICES * GEN_MAX_SUBSLICES * GEN_MAX_EU_STRIDE];
+	u8 subslice_mask[GEN_SS_MASK_SIZE];
+	u8 geometry_subslice_mask[GEN_SS_MASK_SIZE];
+	u8 compute_subslice_mask[GEN_SS_MASK_SIZE];
+	u8 eu_mask[GEN_SS_MASK_SIZE * GEN_MAX_EU_STRIDE];
 	u16 eu_total;
 	u8 eu_per_subslice;
 	u8 min_eu_in_pool;
-- 
2.34.1

