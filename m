Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C853B975A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0026EBFD;
	Thu,  1 Jul 2021 20:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBDE6EBAC;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998658"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998658"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564457"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 17/53] drm/i915/xehp: Changes to ss/eu definitions
Date: Thu,  1 Jul 2021 13:23:51 -0700
Message-Id: <20210701202427.1547543-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>,
 Henryk Napiatek <henryk.j.napiatek@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Prasad Nallani <prasad.nallani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

Xe_HP no longer has "slices" in the same way that old platforms did.
There are new concepts (gslices, cslices, mslices) that apply in various
contexts, but for the purposes of fusing slices no longer exist and we
just have one large pool of dual-subslices (DSS) to work with.
Furthermore, the meaning of the DSS fuse is inverted compared to past
platforms --- it now specifies which DSS are enabled rather than which
ones are disabled.

Cc: Henryk Napiatek <henryk.j.napiatek@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Prasad Nallani <prasad.nallani@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 24 ++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_getparam.c |  6 ++++--
 drivers/gpu/drm/i915/i915_reg.h      |  3 +++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index bbed8e8625e1..5d1b7d06c96b 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -139,17 +139,33 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 	 * Gen12 has Dual-Subslices, which behave similarly to 2 gen11 SS.
 	 * Instead of splitting these, provide userspace with an array
 	 * of DSS to more closely represent the hardware resource.
+	 *
+	 * In addition, the concept of slice has been removed in Xe_HP.
+	 * To be compatible with prior generations, assume a single slice
+	 * across the entire device. Then calculate out the DSS for each
+	 * workload type within that software slice.
 	 */
 	intel_sseu_set_info(sseu, 1, 6, 16);
 
-	s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
-		GEN11_GT_S_ENA_MASK;
+	/*
+	 * As mentioned above, Xe_HP does not have the concept of a slice.
+	 * Enable one for software backwards compatibility.
+	 */
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
+		s_en = 0x1;
+	else
+		s_en = intel_uncore_read(uncore, GEN11_GT_SLICE_ENABLE) &
+		       GEN11_GT_S_ENA_MASK;
 
 	dss_en = intel_uncore_read(uncore, GEN12_GT_DSS_ENABLE);
 
 	/* one bit per pair of EUs */
-	eu_en_fuse = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
-		       GEN11_EU_DIS_MASK);
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
+		eu_en_fuse = intel_uncore_read(uncore, XEHP_EU_ENABLE) & XEHP_EU_ENA_MASK;
+	else
+		eu_en_fuse = ~(intel_uncore_read(uncore, GEN11_EU_DISABLE) &
+			       GEN11_EU_DIS_MASK);
+
 	for (eu = 0; eu < sseu->max_eus_per_subslice / 2; eu++)
 		if (eu_en_fuse & BIT(eu))
 			eu_en |= BIT(eu * 2) | BIT(eu * 2 + 1);
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 24e18219eb50..e289397d9178 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -15,7 +15,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
 	drm_i915_getparam_t *param = data;
-	int value;
+	int value = 0;
 
 	switch (param->param) {
 	case I915_PARAM_IRQ_ACTIVE:
@@ -150,7 +150,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			return -ENODEV;
 		break;
 	case I915_PARAM_SUBSLICE_MASK:
-		value = sseu->subslice_mask[0];
+		/* Only copy bits from the first slice */
+		memcpy(&value, sseu->subslice_mask,
+		       min(sseu->ss_stride, (u8)sizeof(value)));
 		if (!value)
 			return -ENODEV;
 		break;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 43fdf63a2240..9edb58c796e8 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3151,6 +3151,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 
 #define GEN12_GT_DSS_ENABLE _MMIO(0x913C)
 
+#define XEHP_EU_ENABLE			_MMIO(0x9134)
+#define XEHP_EU_ENA_MASK		0xFF
+
 #define GEN6_BSD_SLEEP_PSMI_CONTROL	_MMIO(0x12050)
 #define   GEN6_BSD_SLEEP_MSG_DISABLE	(1 << 0)
 #define   GEN6_BSD_SLEEP_FLUSH_DISABLE	(1 << 2)
-- 
2.25.4

