Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4F52F5FB
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 01:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD7710ECD8;
	Fri, 20 May 2022 23:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0941E10EB8E;
 Fri, 20 May 2022 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653087860; x=1684623860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EXIcdZrnUmGufyJ0iFeUzpG/bOUy6k4SmmTCTj1YrDg=;
 b=UP46oGPq7nXrPNczmBfd3yc5vEVGMFb3qvu2mmWyDufk+gbzA4zptot7
 9oZGOgEJMyyyHrhnZ9/QLR6KB4iIbmmUKBynNl72XZHi+qMicPSF5J2NP
 72EJWaYUwM9p8qwcx1KFZePatViGQKNBaVfoUredtv/EzLkm3FIeRqFAP
 z82a/M3IaJ0ZKrbC9zxQiJPn4PgdZZtIgFB0kR18YlHWUPnIPPAgwnmWr
 l+dQBGmeSs7JV/akFxgAtE9K4xzjsd9oAaH6Z0ozx+hcz5iuOMyBh6oCf
 A2O1okt5eENyfvs5ssMKdK6dWwLrZSVd3L1MfeZC46bMFCqSCGBfU1bTv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="272472170"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="272472170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 16:04:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="599482051"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 16:04:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/i915/pvc: Add SSEU changes
Date: Fri, 20 May 2022 16:04:08 -0700
Message-Id: <20220520230408.3787166-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220520230408.3787166-1-matthew.d.roper@intel.com>
References: <20220520230408.3787166-1-matthew.d.roper@intel.com>
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

PVC splits the mask of enabled DSS over two registers.  It also changes
the meaning of the EU fuse register such that each bit represents a
single EU rather than a pair of EUs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c     | 31 ++++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_sseu.h     |  2 +-
 drivers/gpu/drm/i915/i915_drv.h          |  2 ++
 drivers/gpu/drm/i915/i915_pci.c          |  3 ++-
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 6 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7246eb870c7e..3f2b46c884f9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -561,6 +561,7 @@
 #define   GEN11_GT_VEBOX_DISABLE_MASK		(0x0f << GEN11_GT_VEBOX_DISABLE_SHIFT)
 
 #define GEN12_GT_COMPUTE_DSS_ENABLE		_MMIO(0x9144)
+#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		_MMIO(0x9148)
 
 #define GEN6_UCGCTL1				_MMIO(0x9400)
 #define   GEN6_GAMUNIT_CLOCK_GATE_DISABLE	(1 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 6fbc2ac507b7..82e6f324b2ef 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -212,27 +212,44 @@ static void xehp_sseu_info_init(struct intel_gt *gt)
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
index 0d3def55e770..79732c1af6c4 100644
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
index c5fc402d9c50..1f8422e9511b 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1405,6 +1405,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915))
 
+#define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
+
 /* i915_gem.c */
 void i915_gem_init_early(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 5ad9884874c2..9cee3c69edde 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1079,7 +1079,8 @@ static const struct intel_device_info ats_m_info = {
 #define XE_HPC_FEATURES \
 	XE_HP_FEATURES, \
 	.dma_mask_size = 52, \
-	.has_l3_ccs_read = 1
+	.has_l3_ccs_read = 1, \
+	.has_one_eu_per_fuse_bit = 1
 
 __maybe_unused
 static const struct intel_device_info pvc_info = {
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index a134914237dd..d4ae3a7861cd 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -157,6 +157,7 @@ enum intel_ppgtt_type {
 	func(has_logical_ring_elsq); \
 	func(has_media_ratio_mode); \
 	func(has_mslices); \
+	func(has_one_eu_per_fuse_bit); \
 	func(has_pooled_eu); \
 	func(has_pxp); \
 	func(has_rc6); \
-- 
2.35.3

