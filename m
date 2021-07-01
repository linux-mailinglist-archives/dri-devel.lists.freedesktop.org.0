Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248D3B9782
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2550E6EC23;
	Thu,  1 Jul 2021 20:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3C96EC08;
 Thu,  1 Jul 2021 20:25:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998670"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998670"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564535"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 44/53] drm/i915/dg2: Add vswing programming for SNPS phys
Date: Thu,  1 Jul 2021 13:24:18 -0700
Message-Id: <20210701202427.1547543-45-matthew.d.roper@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vswing programming for SNPS PHYs is just a single step -- look up the
value that corresponds to the voltage level from a table and program it
into the SNPS_PHY_TX_EQ register.

Bspec: 53920
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      | 23 ++++++--
 drivers/gpu/drm/i915/display/intel_snps_phy.c | 54 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_snps_phy.h |  4 ++
 drivers/gpu/drm/i915/i915_reg.h               |  5 ++
 4 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 929a95ddb316..ade03cf41caa 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1496,6 +1496,16 @@ static int intel_ddi_dp_level(struct intel_dp *intel_dp)
 	return translate_signal_level(intel_dp, signal_levels);
 }
 
+static void
+dg2_set_signal_levels(struct intel_dp *intel_dp,
+		      const struct intel_crtc_state *crtc_state)
+{
+	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
+	int level = intel_ddi_dp_level(intel_dp);
+
+	intel_snps_phy_ddi_vswing_sequence(encoder, level);
+}
+
 static void
 tgl_set_signal_levels(struct intel_dp *intel_dp,
 		      const struct intel_crtc_state *crtc_state)
@@ -2563,7 +2573,10 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	 */
 
 	/* 7.e Configure voltage swing and related IO settings */
-	tgl_ddi_vswing_sequence(encoder, crtc_state, level);
+	if (IS_DG2(dev_priv))
+		intel_snps_phy_ddi_vswing_sequence(encoder, level);
+	else
+		tgl_ddi_vswing_sequence(encoder, crtc_state, level);
 
 	/*
 	 * 7.f Combo PHY: Configure PORT_CL_DW10 Static Power Down to power up
@@ -3102,7 +3115,9 @@ static void intel_enable_ddi_hdmi(struct intel_atomic_state *state,
 			    "[CONNECTOR:%d:%s] Failed to configure sink scrambling/TMDS bit clock ratio\n",
 			    connector->base.id, connector->name);
 
-	if (DISPLAY_VER(dev_priv) >= 12)
+	if (IS_DG2(dev_priv))
+		intel_snps_phy_ddi_vswing_sequence(encoder, U32_MAX);
+	else if (DISPLAY_VER(dev_priv) >= 12)
 		tgl_ddi_vswing_sequence(encoder, crtc_state, level);
 	else if (DISPLAY_VER(dev_priv) == 11)
 		icl_ddi_vswing_sequence(encoder, crtc_state, level);
@@ -4075,7 +4090,9 @@ intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
 	dig_port->dp.set_link_train = intel_ddi_set_link_train;
 	dig_port->dp.set_idle_link_train = intel_ddi_set_idle_link_train;
 
-	if (DISPLAY_VER(dev_priv) >= 12)
+	if (IS_DG2(dev_priv))
+		dig_port->dp.set_signal_levels = dg2_set_signal_levels;
+	else if (DISPLAY_VER(dev_priv) >= 12)
 		dig_port->dp.set_signal_levels = tgl_set_signal_levels;
 	else if (DISPLAY_VER(dev_priv) >= 11)
 		dig_port->dp.set_signal_levels = icl_set_signal_levels;
diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
index 1317b4e94b50..77759bda98a4 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
@@ -21,6 +21,60 @@
  * since it is not handled by the shared DPLL framework as on other platforms.
  */
 
+static const u32 dg2_ddi_translations[] = {
+	/* VS 0, pre-emph 0 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 26),
+
+	/* VS 0, pre-emph 1 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 33) |
+		REG_FIELD_PREP(SNPS_PHY_TX_EQ_POST, 6),
+
+	/* VS 0, pre-emph 2 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 38) |
+		REG_FIELD_PREP(SNPS_PHY_TX_EQ_POST, 12),
+
+	/* VS 0, pre-emph 3 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 43) |
+		REG_FIELD_PREP(SNPS_PHY_TX_EQ_POST, 19),
+
+	/* VS 1, pre-emph 0 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 39),
+
+	/* VS 1, pre-emph 1 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 44) |
+		REG_FIELD_PREP(SNPS_PHY_TX_EQ_POST, 8),
+
+	/* VS 1, pre-emph 2 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 47) |
+		REG_FIELD_PREP(SNPS_PHY_TX_EQ_POST, 15),
+
+	/* VS 2, pre-emph 0 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 52),
+
+	/* VS 2, pre-emph 1 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 51) |
+		REG_FIELD_PREP(SNPS_PHY_TX_EQ_POST, 10),
+
+	/* VS 3, pre-emph 0 */
+	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 62),
+};
+
+void intel_snps_phy_ddi_vswing_sequence(struct intel_encoder *encoder,
+					u32 level)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
+	int n_entries, ln;
+
+	n_entries = ARRAY_SIZE(dg2_ddi_translations);
+	if (level >= n_entries)
+		level = n_entries - 1;
+
+	for (ln = 0; ln < 4; ln++)
+		intel_de_write(dev_priv, SNPS_PHY_TX_EQ(ln, phy),
+			       dg2_ddi_translations[level]);
+}
+
 /*
  * Basic DP link rates with 100 MHz reference clock.
  */
diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.h b/drivers/gpu/drm/i915/display/intel_snps_phy.h
index ca4c2a25182b..3ce92d424f66 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_SNPS_PHY_H__
 #define __INTEL_SNPS_PHY_H__
 
+#include <linux/types.h>
+
 struct intel_encoder;
 struct intel_crtc_state;
 struct intel_mpllb_state;
@@ -21,5 +23,7 @@ int intel_mpllb_calc_port_clock(struct intel_encoder *encoder,
 				const struct intel_mpllb_state *pll_state);
 
 int intel_snps_phy_check_hdmi_link_rate(int clock);
+void intel_snps_phy_ddi_vswing_sequence(struct intel_encoder *encoder,
+					u32 level);
 
 #endif /* __INTEL_SNPS_PHY_H__ */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 15465f9cf9ab..203056b9f02c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2340,6 +2340,11 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define SNPS_PHY_REF_CONTROL(phy)		_MMIO_SNPS(phy, 0x168188)
 #define   SNPS_PHY_REF_CONTROL_REF_RANGE	REG_GENMASK(31, 27)
 
+#define SNPS_PHY_TX_EQ(ln, phy)			_MMIO_SNPS_LN(ln, phy, 0x168300)
+#define   SNPS_PHY_TX_EQ_MAIN			REG_GENMASK(23, 18)
+#define   SNPS_PHY_TX_EQ_POST			REG_GENMASK(15, 10)
+#define   SNPS_PHY_TX_EQ_PRE			REG_GENMASK(7, 2)
+
 /* The spec defines this only for BXT PHY0, but lets assume that this
  * would exist for PHY1 too if it had a second channel.
  */
-- 
2.25.4

