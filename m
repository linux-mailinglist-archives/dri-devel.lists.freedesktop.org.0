Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9B53A996
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DB610EA78;
	Wed,  1 Jun 2022 15:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD83810EA63;
 Wed,  1 Jun 2022 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654096055; x=1685632055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6aqW4bvZQ6KPwm3e2wHZec+Jvlz11MZyvWzJTklU1rs=;
 b=WqZVaWKGCKzRym5T+h0/QWRpkqniaA1/5uUeZiWiTXa1B3sVVWfKTZjv
 rXxWz9oIYgRbAjPmEfjHqodLovu24+C4QUYgBBKranRwjwQkJQ2soEF0p
 5yf20N0VUR1hBrMENqxNCLofagThcmv82wb1Kg5H7Je5fX6j2ZryVKAXl
 1XUf7s47XIpZBg+/Fsc3xFXB05FhefpIHM2YYASty60ejNd85cFG6xgjB
 Lgz/QRuAHYAEG9lC/0Nqv8Ql224fd3IcgsLYmIJXMTILIpXnVBBBeQ5fC
 vzPrks7eKzpCvQVLu3eXDl8ScnBez3ivJX8KDMWJJG9aPBrz6FBv6zntD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="257688445"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="257688445"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="667465458"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 6/6] drm/i915/pvc: Add SSEU changes
Date: Wed,  1 Jun 2022 08:07:25 -0700
Message-Id: <20220601150725.521468-7-matthew.d.roper@intel.com>
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

PVC splits the mask of enabled DSS over two registers.  It also changes
the meaning of the EU fuse register such that each bit represents a
single EU rather than a pair of EUs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c     | 31 ++++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_sseu.h     |  2 +-
 drivers/gpu/drm/i915/i915_drv.h          |  2 ++
 drivers/gpu/drm/i915/i915_pci.c          |  3 ++-
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 6 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 58e9b464d564..6aa1ceaa8d27 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -561,6 +561,7 @@
 #define   GEN11_GT_VEBOX_DISABLE_MASK		(0x0f << GEN11_GT_VEBOX_DISABLE_SHIFT)
 
 #define GEN12_GT_COMPUTE_DSS_ENABLE		_MMIO(0x9144)
+#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		_MMIO(0x9148)
 
 #define GEN6_UCGCTL1				_MMIO(0x9400)
 #define   GEN6_GAMUNIT_CLOCK_GATE_DISABLE	(1 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 38069330d828..5cc1896a6cb9 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -210,27 +210,44 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
 	struct intel_uncore *uncore = gt->uncore;
 	u16 eu_en = 0;
 	u8 eu_en_fuse;
+	int num_compute_regs, num_geometry_regs;
 	int eu;
 
+	if (IS_PONTEVECCHIO(gt->i915)) {
+		num_geometry_regs = 0;
+		num_compute_regs = 2;
+	} else {
+		num_geometry_regs = 1;
+		num_compute_regs = 1;
+	}
+
 	/*
 	 * The concept of slice has been removed in Xe_HP.  To be compatible
 	 * with prior generations, assume a single slice across the entire
 	 * device. Then calculate out the DSS for each workload type within
 	 * that software slice.
 	 */
-	intel_sseu_set_info(sseu, 1, 32, 16);
+	intel_sseu_set_info(sseu, 1,
+			    32 * max(num_geometry_regs, num_compute_regs),
+			    16);
 	sseu->has_xehp_dss = 1;
 
-	xehp_load_dss_mask(uncore, &sseu->geometry_subslice_mask, 1,
+	xehp_load_dss_mask(uncore, &sseu->geometry_subslice_mask,
+			   num_geometry_regs,
 			   GEN12_GT_GEOMETRY_DSS_ENABLE);
-	xehp_load_dss_mask(uncore, &sseu->compute_subslice_mask, 1,
-			   GEN12_GT_COMPUTE_DSS_ENABLE);
+	xehp_load_dss_mask(uncore, &sseu->compute_subslice_mask,
+			   num_compute_regs,
+			   GEN12_GT_COMPUTE_DSS_ENABLE,
+			   XEHPC_GT_COMPUTE_DSS_ENABLE_EXT);
 
 	eu_en_fuse = intel_uncore_read(uncore, XEHP_EU_ENABLE) & XEHP_EU_ENA_MASK;
 
-	for (eu = 0; eu < sseu->max_eus_per_subslice / 2; eu++)
-		if (eu_en_fuse & BIT(eu))
-			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
+	if (HAS_ONE_EU_PER_FUSE_BIT(gt->i915))
+		eu_en = eu_en_fuse;
+	else
+		for (eu = 0; eu < sseu->max_eus_per_subslice / 2; eu++)
+			if (eu_en_fuse & BIT(eu))
+				eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
 
 	xehp_compute_sseu_info(sseu, eu_en);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 61abcab5a76b..b86f23f5b3a1 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -33,7 +33,7 @@ struct drm_printer;
  * Maximum number of 32-bit registers used by hardware to express the
  * enabled/disabled subslices.
  */
-#define I915_MAX_SS_FUSE_REGS	1
+#define I915_MAX_SS_FUSE_REGS	2
 #define I915_MAX_SS_FUSE_BITS	(I915_MAX_SS_FUSE_REGS * 32)
 
 /* Maximum number of EUs that can exist within a subslice or DSS. */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index bc1a7ff19463..c3854b8a014f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1359,6 +1359,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->has_3d_pipeline)
 
+#define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
+
 /* i915_gem.c */
 void i915_gem_init_early(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 61386d1bb07b..047a6e326031 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1089,7 +1089,8 @@ static const struct intel_device_info ats_m_info = {
 	XE_HP_FEATURES, \
 	.dma_mask_size = 52, \
 	.has_3d_pipeline = 0, \
-	.has_l3_ccs_read = 1
+	.has_l3_ccs_read = 1, \
+	.has_one_eu_per_fuse_bit = 1
 
 __maybe_unused
 static const struct intel_device_info pvc_info = {
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 4e1c80966ab5..346f17f2dce8 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -158,6 +158,7 @@ enum intel_ppgtt_type {
 	func(has_logical_ring_elsq); \
 	func(has_media_ratio_mode); \
 	func(has_mslices); \
+	func(has_one_eu_per_fuse_bit); \
 	func(has_pooled_eu); \
 	func(has_pxp); \
 	func(has_rc6); \
-- 
2.35.3

