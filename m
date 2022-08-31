Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501655A8881
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D2210E514;
	Wed, 31 Aug 2022 21:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2984A10E4F1;
 Wed, 31 Aug 2022 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982632; x=1693518632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KF65IsSMn/fDt6xUmtYDcYkhLuMm8mUaw5y6BIlqmg4=;
 b=fO0fr209qyeCazJ1BRbYZ+0O06K1prdyYWG4LrFafr+tJBckVQz6Jp1N
 UXJNbWHYi0zgLEu1eHxAjRRKyoc4tYYMdT3fr1fp4Ur/T4ZXrpfMTHIo0
 fGNr45/HfrpS3PD2NtYHEjHPy4CItnahMzAjEo0qq2or5tcSOn4fYfDUZ
 +N4pWQyOw19SBwJFZ3ahmaAn8zd6pq3Qy9AW1f5LECXE7t23DosEYa+Vg
 9S9GK4QuKaMv0ZoCRM2+YLcXAtArJJvX8+e7H/XSUwnftL62FLNvdh0YU
 tHJ7NoX7rvHzju014zuw9D0aiCWUfD6IjNpxXayjkXOrV4Jdayv/2Cdbz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296833060"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="296833060"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586210"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:30 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/11] drm/i915: Read graphics/media/display arch version
 from hw
Date: Wed, 31 Aug 2022 14:49:49 -0700
Message-Id: <20220831214958.109753-3-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Going forward, the hardware teams no longer consider new platforms to
have a "generation" in the way we've defined it for past platforms.
Instead, each IP block (graphics, media, display) will have their own
architecture major.minor versions and stepping ID's which should be read
directly from a register in the MMIO space.  New hardware programming
styles, features, and workarounds should be conditional solely on the
architecture version, and should no longer be derived from the PCI
device ID, revision ID, or platform-specific feature flags.

Bspec: 63361, 64111

v2:
  - Move the IP version readout to intel_device_info.c
  - Convert the macro into a function

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
 drivers/gpu/drm/i915/i915_driver.c       |  2 +
 drivers/gpu/drm/i915/i915_drv.h          |  2 +
 drivers/gpu/drm/i915/i915_pci.c          |  1 +
 drivers/gpu/drm/i915/i915_reg.h          |  6 ++
 drivers/gpu/drm/i915/intel_device_info.c | 73 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_device_info.h |  3 +
 7 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index d414785003cc..579da62158c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -39,6 +39,8 @@
 #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
 #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
 
+#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
+
 #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
 #define SF_MCR_SELECTOR				_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 3aedc33ded57..5826c70d6fa5 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -323,6 +323,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	if (i915_inject_probe_failure(dev_priv))
 		return -ENODEV;
 
+	intel_device_info_runtime_init_early(dev_priv);
+
 	intel_device_info_subplatform_init(dev_priv);
 	intel_step_init(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index bf60593a4ce5..935ff3486fef 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -936,6 +936,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
 
+#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
+
 #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
 
 #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 72577e327c71..9772c315185d 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1129,6 +1129,7 @@ static const struct intel_device_info mtl_info = {
 	PLATFORM(INTEL_METEORLAKE),
 	.display.has_modular_fia = 1,
 	.has_flat_ccs = 0,
+	.has_gmd_id = 1,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5e6239864c35..f52ed6d00030 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -5798,6 +5798,11 @@
 #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
 #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
 
+#define GMD_ID_DISPLAY				_MMIO(0x510a0)
+#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
+#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
+#define   GMD_ID_STEP				REG_GENMASK(5, 0)
+
 /*GEN11 chicken */
 #define _PIPEA_CHICKEN				0x70038
 #define _PIPEB_CHICKEN				0x71038
@@ -8298,4 +8303,5 @@ enum skl_power_gate {
 #define  MTL_LATENCY_LEVEL_EVEN_MASK	REG_GENMASK(12, 0)
 #define  MTL_LATENCY_LEVEL_ODD_MASK	REG_GENMASK(28, 16)
 
+#define MTL_MEDIA_GSI_BASE		0x380000
 #endif /* _I915_REG_H_ */
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 8ff66b4e11c1..e36ba0520be7 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -29,6 +29,7 @@
 
 #include "display/intel_cdclk.h"
 #include "display/intel_de.h"
+#include "gt/intel_gt_regs.h"
 #include "intel_device_info.h"
 #include "i915_drv.h"
 #include "i915_utils.h"
@@ -133,6 +134,78 @@ void intel_device_info_print(const struct intel_device_info *info,
 	drm_printf(p, "rawclk rate: %u kHz\n", runtime->rawclk_freq);
 }
 
+static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct ip_version *ip,
+			const struct ip_version *dr_ip)
+{
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	void __iomem *addr;
+	u32 ver;
+
+	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32));
+	if (drm_WARN_ON(&i915->drm, !addr))
+		return;
+
+	ver = ioread32(addr);
+	pci_iounmap(pdev, addr);
+
+	ip->ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, ver);
+	ip->rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
+	ip->step = REG_FIELD_GET(GMD_ID_STEP, ver);
+
+	/* Sanity check against expected versions from device info */
+	if (ip->ver != dr_ip->ver || ip->rel > dr_ip->rel)
+		drm_dbg(&i915->drm,
+			"Hardware reports GMD IP version %u.%u but minimum expected is %u.%u\n",
+			ip->ver, ip->rel, dr_ip->ver, dr_ip->rel);
+}
+
+/**
+ * intel_ipver_early_init - setup IP version values
+ * @dev_priv: device private
+ *
+ * Setup the graphics version for the current device.  This must be done before
+ * any code that performs checks on GRAPHICS_VER or DISPLAY_VER, so this
+ * function should be called very early in the driver initialization sequence.
+ *
+ * Regular MMIO access is not yet setup at the point this function is called so
+ * we peek at the appropriate MMIO offset directly.  The GMD_ID register is
+ * part of an 'always on' power well by design, so we don't need to worry about
+ * forcewake while reading it.
+ */
+static void intel_ipver_early_init(struct drm_i915_private *i915)
+{
+	struct intel_runtime_info *rtime = RUNTIME_INFO(i915);
+	const struct intel_runtime_info *drinfo = &INTEL_INFO(i915)->__runtime;
+
+	if (!HAS_GMD_ID(i915))
+		return;
+
+	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS), &rtime->graphics,
+		    &drinfo->graphics);
+	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_DISPLAY), &rtime->display,
+		    &drinfo->display);
+	ip_ver_read(i915, MTL_MEDIA_GSI_BASE + i915_mmio_reg_offset(GMD_ID_GRAPHICS),
+		    &rtime->media, &drinfo->media);
+}
+
+/**
+ * intel_device_info_runtime_init_early - initialize early runtime info
+ * @i915: the i915 device
+ *
+ * Determine early intel_device_info fields at runtime.
+ *
+ * Use it when:
+ *   - Early init of certain runtime info fields are to be initialized
+ *
+ * This function needs to be called:
+ *   - before the MMIO has been setup as we are reading registers,
+ *   - before the PCH has been detected,
+ *   - before the first usage of the fields it can tweak.
+ */
+void intel_device_info_runtime_init_early(struct drm_i915_private *i915)
+{
+	intel_ipver_early_init(i915);
+}
 #undef INTEL_VGA_DEVICE
 #define INTEL_VGA_DEVICE(id, info) (id)
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 6511b25277dc..6031e729714e 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -152,6 +152,7 @@ enum intel_ppgtt_type {
 	func(has_4tile); \
 	func(has_flat_ccs); \
 	func(has_global_mocs); \
+	func(has_gmd_id); \
 	func(has_gt_uc); \
 	func(has_heci_pxp); \
 	func(has_heci_gscfi); \
@@ -197,6 +198,7 @@ enum intel_ppgtt_type {
 struct ip_version {
 	u8 ver;
 	u8 rel;
+	u8 step;
 };
 
 struct intel_runtime_info {
@@ -307,6 +309,7 @@ struct intel_driver_caps {
 
 const char *intel_platform_name(enum intel_platform platform);
 
+void intel_device_info_runtime_init_early(struct drm_i915_private *dev_priv);
 void intel_device_info_subplatform_init(struct drm_i915_private *dev_priv);
 void intel_device_info_runtime_init(struct drm_i915_private *dev_priv);
 
-- 
2.25.1

