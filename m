Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB405297D3
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 05:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4B210E8C6;
	Tue, 17 May 2022 03:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BF810E3CC;
 Tue, 17 May 2022 03:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652757627; x=1684293627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5c35i9ShNIUQtk4/ysw+Cnr9SmSSczxbc8wy/s0ekxk=;
 b=Hc7AkDqVCRoaktJexe53j8Ts20c7v0aBI/Ckihd0pZrLXK/VjxBGOaNK
 pAuoTgHkqw/G+lqMPHyGZgVC7qMsS8jqWC3wo37gM9e/IIgtp40GPrJh5
 8vH/6G04UZdi3xEkSN2lki3EX3k5sNB4nDXbVYHvcRcouTml0vRDMqg0z
 uIq3koB/71K1WzhYY//6aqEaJO0oT+cHY+thhswnqTK1PoXGJ1oYPZnJY
 yrqX9jr6gmtEfOg6DFK8AU+dMcXqyMpoeq98+XQhkVoN+j6MYijXKZQrF
 4cuU0a2BYj+wVlhOlIfiO0gcIPsh1pyBY6mSDNjyMgEVrGtAF2OOnGFA4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="258603234"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="258603234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="596877370"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/i915/pvc: Add SSEU changes
Date: Mon, 16 May 2022 20:20:05 -0700
Message-Id: <20220517032005.2694737-7-matthew.d.roper@intel.com>
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
index 98ede9c93f00..4ba7f1ad9510 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -561,6 +561,7 @@
 #define   GEN11_GT_VEBOX_DISABLE_MASK		(0x0f << GEN11_GT_VEBOX_DISABLE_SHIFT)
 
 #define GEN12_GT_COMPUTE_DSS_ENABLE		_MMIO(0x9144)
+#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		_MMIO(0x9148)
 
 #define GEN6_UCGCTL1				_MMIO(0x9400)
 #define   GEN6_GAMUNIT_CLOCK_GATE_DISABLE	(1 << 22)
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index e1bce8a9044e..10e6e450019f 100644
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
index 7fbb9276a1c2..647301569707 100644
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
index 10f273800645..afafc083c31d 100644
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
index d8d893bafa51..2952e8e51885 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1050,7 +1050,8 @@ static const struct intel_device_info ats_m_info = {
 #define XE_HPC_FEATURES \
 	XE_HP_FEATURES, \
 	.dma_mask_size = 52, \
-	.has_l3_ccs_read = 1
+	.has_l3_ccs_read = 1, \
+	.has_one_eu_per_fuse_bit = 1
 
 __maybe_unused
 static const struct intel_device_info pvc_info = {
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 60fc35ae81df..b20ef217bf75 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -153,6 +153,7 @@ enum intel_ppgtt_type {
 	func(has_llc); \
 	func(has_logical_ring_contexts); \
 	func(has_mslices); \
+	func(has_one_eu_per_fuse_bit); \
 	func(has_pooled_eu); \
 	func(has_pxp); \
 	func(has_rc6p); \
-- 
2.35.3

