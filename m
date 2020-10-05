Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F017283F01
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 20:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEEF89B70;
	Mon,  5 Oct 2020 18:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4B89B70;
 Mon,  5 Oct 2020 18:50:25 +0000 (UTC)
IronPort-SDR: n3BBWBTQ+aI7EZCY9aKI8Bt9zlKw9xIQ9GX6C7N3zgIQlQotVkfCBzWA9kviilQCJZReX6zdXw
 ivqua+HS6S7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="160813297"
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="160813297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 11:50:14 -0700
IronPort-SDR: L4afZ6ke8vs6YuXmjYsD2FJz7+aoMLwWHaZYxufVnNkvR+61tZe22vIqhrr4MDnFkw7a1WBdjo
 LxmxbuJeN7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="341226012"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2020 09:35:59 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 james.ausmus@intel.com, matthew.d.roper@intel.com, jose.souza@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 hariom.pandey@intel.com
Subject: [PATCH v4 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids
Date: Mon,  5 Oct 2020 21:57:35 +0530
Message-Id: <20201005162736.280653-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005162736.280653-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20201005162736.280653-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the basic platform definition, macros, and PCI IDs to
differentiate between EHL and JSL platforms.

Changes since V3 :
	- Changed IS_EHL_JSL to IS_JSL_EHL
	- Renamed IS_EHL_REVID to IS_JSL_EHL_REVID
	- Reverted removal of IS_ELKHARTLAKE and also
          added IS_JASPERLAKE

Changes since V2 :
        - Added IS_EHL_JSL to replace IS_ELKHARTLAKE
        - EHL/JSL PCI ids split added

Changes since V1 :
        - IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
          HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively
        - Reverted EHL/JSL PCI ids split change

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c         |  4 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.c     |  4 ++--
 drivers/gpu/drm/i915/display/intel_combo_phy.c |  6 +++---
 drivers/gpu/drm/i915/display/intel_display.c   |  8 ++++----
 drivers/gpu/drm/i915/display/intel_dp.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c  | 16 ++++++++--------
 drivers/gpu/drm/i915/gt/intel_sseu.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c    |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h                |  9 ++++++---
 drivers/gpu/drm/i915/i915_pci.c                |  9 +++++++++
 drivers/gpu/drm/i915/intel_device_info.c       |  1 +
 drivers/gpu/drm/i915/intel_device_info.h       |  1 +
 drivers/gpu/drm/i915/intel_pch.c               |  2 +-
 include/drm/i915_pciids.h                      |  9 ++++++---
 14 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index fe946a2e2082..f7c3731f5a4b 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -455,7 +455,7 @@ static void gen11_dsi_config_phy_lanes_sequence(struct intel_encoder *encoder)
 		intel_de_write(dev_priv, ICL_PORT_TX_DW2_GRP(phy), tmp);
 
 		/* For EHL, TGL, set latency optimization for PCS_DW1 lanes */
-		if (IS_ELKHARTLAKE(dev_priv) || (INTEL_GEN(dev_priv) >= 12)) {
+		if (IS_JSL_EHL(dev_priv) || (INTEL_GEN(dev_priv) >= 12)) {
 			tmp = intel_de_read(dev_priv,
 					    ICL_PORT_PCS_DW1_AUX(phy));
 			tmp &= ~LATENCY_OPTIM_MASK;
@@ -612,7 +612,7 @@ gen11_dsi_setup_dphy_timings(struct intel_encoder *encoder,
 		}
 	}
 
-	if (IS_ELKHARTLAKE(dev_priv)) {
+	if (IS_JSL_EHL(dev_priv)) {
 		for_each_dsi_phy(phy, intel_dsi->phys) {
 			tmp = intel_de_read(dev_priv, ICL_DPHY_CHKN(phy));
 			tmp |= ICL_DPHY_CHKN_AFE_OVER_PPI_STRAP;
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index cb93f6cf6d37..c6e87569b3d6 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2588,7 +2588,7 @@ static int intel_compute_max_dotclk(struct drm_i915_private *dev_priv)
  */
 void intel_update_max_cdclk(struct drm_i915_private *dev_priv)
 {
-	if (IS_ELKHARTLAKE(dev_priv)) {
+	if (IS_JSL_EHL(dev_priv)) {
 		if (dev_priv->cdclk.hw.ref == 24000)
 			dev_priv->max_cdclk_freq = 552000;
 		else
@@ -2815,7 +2815,7 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 		dev_priv->display.modeset_calc_cdclk = bxt_modeset_calc_cdclk;
 		dev_priv->display.calc_voltage_level = tgl_calc_voltage_level;
 		dev_priv->cdclk.table = icl_cdclk_table;
-	} else if (IS_ELKHARTLAKE(dev_priv)) {
+	} else if (IS_JSL_EHL(dev_priv)) {
 		dev_priv->display.set_cdclk = bxt_set_cdclk;
 		dev_priv->display.bw_calc_min_cdclk = skl_bw_calc_min_cdclk;
 		dev_priv->display.modeset_calc_cdclk = bxt_modeset_calc_cdclk;
diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index 157d8c8c605a..d59ceaa2916a 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -188,7 +188,7 @@ static bool has_phy_misc(struct drm_i915_private *i915, enum phy phy)
 	 * PHY-B and may not even have instances of the register for the
 	 * other combo PHY's.
 	 */
-	if (IS_ELKHARTLAKE(i915) ||
+	if (IS_JSL_EHL(i915) ||
 	    IS_ROCKETLAKE(i915))
 		return phy < PHY_C;
 
@@ -282,7 +282,7 @@ static bool icl_combo_phy_verify_state(struct drm_i915_private *dev_priv,
 		ret &= check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW8(phy),
 				     IREFGEN, IREFGEN);
 
-		if (IS_ELKHARTLAKE(dev_priv)) {
+		if (IS_JSL_EHL(dev_priv)) {
 			if (ehl_vbt_ddi_d_present(dev_priv))
 				expected_val = ICL_PHY_MISC_MUX_DDID;
 
@@ -376,7 +376,7 @@ static void icl_combo_phys_init(struct drm_i915_private *dev_priv)
 		 * "internal" child devices.
 		 */
 		val = intel_de_read(dev_priv, ICL_PHY_MISC(phy));
-		if (IS_ELKHARTLAKE(dev_priv) && phy == PHY_A) {
+		if (IS_JSL_EHL(dev_priv) && phy == PHY_A) {
 			val &= ~ICL_PHY_MISC_MUX_DDID;
 
 			if (ehl_vbt_ddi_d_present(dev_priv))
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 753f202ef6a0..dba10cbd240f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7334,7 +7334,7 @@ bool intel_phy_is_combo(struct drm_i915_private *dev_priv, enum phy phy)
 		return false;
 	else if (IS_ROCKETLAKE(dev_priv))
 		return phy <= PHY_D;
-	else if (IS_ELKHARTLAKE(dev_priv))
+	else if (IS_JSL_EHL(dev_priv))
 		return phy <= PHY_C;
 	else if (INTEL_GEN(dev_priv) >= 11)
 		return phy <= PHY_B;
@@ -7348,7 +7348,7 @@ bool intel_phy_is_tc(struct drm_i915_private *dev_priv, enum phy phy)
 		return false;
 	else if (INTEL_GEN(dev_priv) >= 12)
 		return phy >= PHY_D && phy <= PHY_I;
-	else if (INTEL_GEN(dev_priv) >= 11 && !IS_ELKHARTLAKE(dev_priv))
+	else if (INTEL_GEN(dev_priv) >= 11 && !IS_JSL_EHL(dev_priv))
 		return phy >= PHY_C && phy <= PHY_F;
 	else
 		return false;
@@ -7358,7 +7358,7 @@ enum phy intel_port_to_phy(struct drm_i915_private *i915, enum port port)
 {
 	if (IS_ROCKETLAKE(i915) && port >= PORT_D)
 		return (enum phy)port - 1;
-	else if (IS_ELKHARTLAKE(i915) && port == PORT_D)
+	else if (IS_JSL_EHL(i915) && port == PORT_D)
 		return PHY_A;
 
 	return (enum phy)port;
@@ -17116,7 +17116,7 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_H);
 		intel_ddi_init(dev_priv, PORT_I);
 		icl_dsi_init(dev_priv);
-	} else if (IS_ELKHARTLAKE(dev_priv)) {
+	} else if (IS_JSL_EHL(dev_priv)) {
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
 		intel_ddi_init(dev_priv, PORT_C);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7429597b57be..8d4cf979bd36 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -277,7 +277,7 @@ static int icl_max_source_rate(struct intel_dp *intel_dp)
 	enum phy phy = intel_port_to_phy(dev_priv, dig_port->base.port);
 
 	if (intel_phy_is_combo(dev_priv, phy) &&
-	    !IS_ELKHARTLAKE(dev_priv) &&
+	    !IS_JSL_EHL(dev_priv) &&
 	    !intel_dp_is_edp(intel_dp))
 		return 540000;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index e08684e34078..e14945cf7393 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -152,7 +152,7 @@ intel_combo_pll_enable_reg(struct drm_i915_private *i915,
 			   struct intel_shared_dpll *pll)
 {
 
-	if (IS_ELKHARTLAKE(i915) && (pll->info->id == DPLL_ID_EHL_DPLL4))
+	if (IS_JSL_EHL(i915) && (pll->info->id == DPLL_ID_EHL_DPLL4))
 		return MG_PLL_ENABLE(0);
 
 	return CNL_DPLL_ENABLE(pll->info->id);
@@ -3529,7 +3529,7 @@ static bool icl_get_combo_phy_dpll(struct intel_atomic_state *state,
 			BIT(DPLL_ID_EHL_DPLL4) |
 			BIT(DPLL_ID_ICL_DPLL1) |
 			BIT(DPLL_ID_ICL_DPLL0);
-	} else if (IS_ELKHARTLAKE(dev_priv) && port != PORT_A) {
+	} else if (IS_JSL_EHL(dev_priv) && port != PORT_A) {
 		dpll_mask =
 			BIT(DPLL_ID_EHL_DPLL4) |
 			BIT(DPLL_ID_ICL_DPLL1) |
@@ -3831,7 +3831,7 @@ static bool icl_pll_get_hw_state(struct drm_i915_private *dev_priv,
 		hw_state->cfgcr1 = intel_de_read(dev_priv,
 						 TGL_DPLL_CFGCR1(id));
 	} else {
-		if (IS_ELKHARTLAKE(dev_priv) && id == DPLL_ID_EHL_DPLL4) {
+		if (IS_JSL_EHL(dev_priv) && id == DPLL_ID_EHL_DPLL4) {
 			hw_state->cfgcr0 = intel_de_read(dev_priv,
 							 ICL_DPLL_CFGCR0(4));
 			hw_state->cfgcr1 = intel_de_read(dev_priv,
@@ -3880,7 +3880,7 @@ static void icl_dpll_write(struct drm_i915_private *dev_priv,
 		cfgcr0_reg = TGL_DPLL_CFGCR0(id);
 		cfgcr1_reg = TGL_DPLL_CFGCR1(id);
 	} else {
-		if (IS_ELKHARTLAKE(dev_priv) && id == DPLL_ID_EHL_DPLL4) {
+		if (IS_JSL_EHL(dev_priv) && id == DPLL_ID_EHL_DPLL4) {
 			cfgcr0_reg = ICL_DPLL_CFGCR0(4);
 			cfgcr1_reg = ICL_DPLL_CFGCR1(4);
 		} else {
@@ -4054,7 +4054,7 @@ static void combo_pll_enable(struct drm_i915_private *dev_priv,
 {
 	i915_reg_t enable_reg = intel_combo_pll_enable_reg(dev_priv, pll);
 
-	if (IS_ELKHARTLAKE(dev_priv) &&
+	if (IS_JSL_EHL(dev_priv) &&
 	    pll->info->id == DPLL_ID_EHL_DPLL4) {
 
 		/*
@@ -4167,7 +4167,7 @@ static void combo_pll_disable(struct drm_i915_private *dev_priv,
 
 	icl_pll_disable(dev_priv, pll, enable_reg);
 
-	if (IS_ELKHARTLAKE(dev_priv) &&
+	if (IS_JSL_EHL(dev_priv) &&
 	    pll->info->id == DPLL_ID_EHL_DPLL4)
 		intel_display_power_put(dev_priv, POWER_DOMAIN_DPLL_DC_OFF,
 					pll->wakeref);
@@ -4334,7 +4334,7 @@ void intel_shared_dpll_init(struct drm_device *dev)
 		dpll_mgr = &rkl_pll_mgr;
 	else if (INTEL_GEN(dev_priv) >= 12)
 		dpll_mgr = &tgl_pll_mgr;
-	else if (IS_ELKHARTLAKE(dev_priv))
+	else if (IS_JSL_EHL(dev_priv))
 		dpll_mgr = &ehl_pll_mgr;
 	else if (INTEL_GEN(dev_priv) >= 11)
 		dpll_mgr = &icl_pll_mgr;
@@ -4476,7 +4476,7 @@ static void readout_dpll_hw_state(struct drm_i915_private *i915,
 	pll->on = pll->info->funcs->get_hw_state(i915, pll,
 						 &pll->state.hw_state);
 
-	if (IS_ELKHARTLAKE(i915) && pll->on &&
+	if (IS_JSL_EHL(i915) && pll->on &&
 	    pll->info->id == DPLL_ID_EHL_DPLL4) {
 		pll->wakeref = intel_display_power_get(i915,
 						       POWER_DOMAIN_DPLL_DC_OFF);
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index f1c039e1b5ad..8a72e0fe34ca 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -169,7 +169,7 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
 	u8 eu_en;
 	u8 s_en;
 
-	if (IS_ELKHARTLAKE(gt->i915))
+	if (IS_JSL_EHL(gt->i915))
 		intel_sseu_set_info(sseu, 1, 4, 8);
 	else
 		intel_sseu_set_info(sseu, 1, 8, 8);
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 6c580d0d9ea8..0d50cf1d8ceb 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1212,7 +1212,7 @@ icl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 
 	/* Wa_1607087056:icl,ehl,jsl */
 	if (IS_ICELAKE(i915) ||
-	    IS_EHL_REVID(i915, EHL_REVID_A0, EHL_REVID_A0)) {
+		IS_JSL_EHL_REVID(i915, EHL_REVID_A0, EHL_REVID_A0)) {
 		wa_write_or(wal,
 			    SLICE_UNIT_LEVEL_CLKGATE,
 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
@@ -1839,7 +1839,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			    GEN12_FF_TESSELATION_DOP_GATE_DISABLE);
 
 		/* Wa_22010271021:ehl */
-		if (IS_ELKHARTLAKE(i915))
+		if (IS_JSL_EHL(i915))
 			wa_masked_en(wal,
 				     GEN9_CS_DEBUG_MODE1,
 				     FF_DOP_CLOCK_GATE_DISABLE);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index eef9a821c49c..05a16f0c6d09 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1417,7 +1417,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_COMETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COMETLAKE)
 #define IS_CANNONLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_CANNONLAKE)
 #define IS_ICELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ICELAKE)
-#define IS_ELKHARTLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE)
+#define IS_JASPERLAKE(dev_priv) IS_PLATFORM(dev_priv, INTEL_JASPERLAKE)
+#define IS_ELKHARTLAKE(dev_priv) IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE)
+#define IS_JSL_EHL(dev_priv)	(IS_JASPERLAKE(dev_priv) || \
+				IS_ELKHARTLAKE(dev_priv))
 #define IS_TIGERLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_TIGERLAKE)
 #define IS_ROCKETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ROCKETLAKE)
 #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, INTEL_DG1)
@@ -1558,8 +1561,8 @@ extern const struct i915_rev_steppings kbl_revids[];
 
 #define EHL_REVID_A0            0x0
 
-#define IS_EHL_REVID(p, since, until) \
-	(IS_ELKHARTLAKE(p) && IS_REVID(p, since, until))
+#define IS_JSL_EHL_REVID(p, since, until) \
+	(IS_JSL_EHL(p) && IS_REVID(p, since, until))
 
 enum {
 	TGL_REVID_A0,
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 366ddfc8df6b..8690b69fcf33 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -846,6 +846,14 @@ static const struct intel_device_info ehl_info = {
 	.ppgtt_size = 36,
 };
 
+static const struct intel_device_info jsl_info = {
+	GEN11_FEATURES,
+	PLATFORM(INTEL_JASPERLAKE),
+	.require_force_probe = 1,
+	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(VECS0),
+	.ppgtt_size = 36,
+};
+
 #define GEN12_FEATURES \
 	GEN11_FEATURES, \
 	GEN(12), \
@@ -985,6 +993,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_CNL_IDS(&cnl_info),
 	INTEL_ICL_11_IDS(&icl_info),
 	INTEL_EHL_IDS(&ehl_info),
+	INTEL_JSL_IDS(&jsl_info),
 	INTEL_TGL_12_IDS(&tgl_info),
 	INTEL_RKL_IDS(&rkl_info),
 	{0, 0, 0}
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index adc836f15fde..e67cec8fa2aa 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -62,6 +62,7 @@ static const char * const platform_names[] = {
 	PLATFORM_NAME(CANNONLAKE),
 	PLATFORM_NAME(ICELAKE),
 	PLATFORM_NAME(ELKHARTLAKE),
+	PLATFORM_NAME(JASPERLAKE),
 	PLATFORM_NAME(TIGERLAKE),
 	PLATFORM_NAME(ROCKETLAKE),
 	PLATFORM_NAME(DG1),
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 6a3d607218aa..d92fa041c700 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -79,6 +79,7 @@ enum intel_platform {
 	/* gen11 */
 	INTEL_ICELAKE,
 	INTEL_ELKHARTLAKE,
+	INTEL_JASPERLAKE,
 	/* gen12 */
 	INTEL_TIGERLAKE,
 	INTEL_ROCKETLAKE,
diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
index 6c97192e9ca8..bc08e8e455b6 100644
--- a/drivers/gpu/drm/i915/intel_pch.c
+++ b/drivers/gpu/drm/i915/intel_pch.c
@@ -126,7 +126,7 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
 	case INTEL_PCH_JSP_DEVICE_ID_TYPE:
 	case INTEL_PCH_JSP2_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found Jasper Lake PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_ELKHARTLAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_JASPERLAKE(dev_priv));
 		return PCH_JSP;
 	default:
 		return PCH_NONE;
diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index 7eeecb07c9a1..1b5e09cfa11e 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -579,15 +579,18 @@
 	INTEL_VGA_DEVICE(0x8A51, info), \
 	INTEL_VGA_DEVICE(0x8A5D, info)
 
-/* EHL/JSL */
+/* EHL */
 #define INTEL_EHL_IDS(info) \
 	INTEL_VGA_DEVICE(0x4500, info),	\
 	INTEL_VGA_DEVICE(0x4571, info), \
 	INTEL_VGA_DEVICE(0x4551, info), \
 	INTEL_VGA_DEVICE(0x4541, info), \
-	INTEL_VGA_DEVICE(0x4E71, info), \
 	INTEL_VGA_DEVICE(0x4557, info), \
-	INTEL_VGA_DEVICE(0x4555, info), \
+	INTEL_VGA_DEVICE(0x4555, info)
+
+/* JSL */
+#define INTEL_JSL_IDS(info) \
+	INTEL_VGA_DEVICE(0x4E71, info), \
 	INTEL_VGA_DEVICE(0x4E61, info), \
 	INTEL_VGA_DEVICE(0x4E57, info), \
 	INTEL_VGA_DEVICE(0x4E55, info), \
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
