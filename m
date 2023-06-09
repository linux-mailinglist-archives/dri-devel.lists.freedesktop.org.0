Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A5E728F9F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 08:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC8010E0E2;
	Fri,  9 Jun 2023 06:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBAE10E0E2;
 Fri,  9 Jun 2023 06:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686290633; x=1717826633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rQ5qUjzNGcfcaM71Se4tDaQsKUFxjRYIl0KE5Vn7hGQ=;
 b=kA26MMd6+UEeKjiazTXO7+3ZQP76NS2rjxFUp/dEchQn9isbMzPREktX
 6n1K8C1fnUnJh5+TRWUC49YyX9jqjCWDJFgcGabiF1NJckpT5a4OUDEja
 qB63njDswjMQhbnQYaZItdIH1mBtFMMpxbKVOzrYZa+NBUQa/CK9Bg2GT
 Nxoc85LjqokuzRtGZLuqo2tOs8Lpfo5UXnKs0n7AmfTSU5T+xE7e3ON+6
 C0jPQ7FP66zJt2NTKyXN93pPHvP0RTUw892EBrhpUa3SYrMYPw/qqjUoN
 zcAZTUlHCbGdn3otQVw7qJunMS4Cpwe7PnSg9gO3lGYIX12nLCQnoAZwH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385879156"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="385879156"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 23:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="957018700"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="957018700"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 23:03:49 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: Cable type identification for DP2.1
Date: Fri,  9 Jun 2023 11:24:35 +0530
Message-Id: <20230609055435.299584-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DP alt mode display driver get the information
about cable speed and cable type through TCSS_DDI_STATUS
register which will be updated by type-c platform driver.
Accodingly Update dpcd 0x110 with cable information before
link training start. This change came part of DP2.1 SCR.

Note: This patch is not tested due to unavailability of
cable. Sending as RFC for design review.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 57 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_tc.c  | 10 +++++
 drivers/gpu/drm/i915/display/intel_tc.h  |  1 +
 drivers/gpu/drm/i915/i915_reg.h          |  5 +++
 include/drm/display/drm_dp.h             |  9 ++++
 5 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 70d44edd8c6e..3a0f6a3c9f98 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2208,6 +2208,55 @@ static void intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp *intel
 			    str_enable_disable(enable));
 }
 
+#define CABLE_SPEED_SHIFT 4
+
+enum dp_cable_speed {
+	DP_CABLE_HBR3 = 1,
+	DP_CABLE_UHBR10,
+	DP_CABLE_GEN3_UHBR20,
+	DP_CABLE_GEN4_UHBR20
+};
+
+static void intel_dp_set_cable_attributes(struct intel_dp *intel_dp,
+					  u8 cable_attributes)
+{
+	u8 cable_speed;
+	bool active_cable, retimer;
+	u8 cable_attr_dpcd;
+
+	cable_speed = cable_attributes >> CABLE_SPEED_SHIFT;
+
+	switch (cable_speed) {
+	case DP_CABLE_HBR3:
+		cable_attr_dpcd = 0;
+		break;
+	case DP_CABLE_UHBR10:
+		cable_attr_dpcd = 1;
+		break;
+	case DP_CABLE_GEN3_UHBR20:
+	case DP_CABLE_GEN4_UHBR20:
+		cable_attr_dpcd = 2;
+		break;
+	default:
+		cable_attr_dpcd = 0;
+		break;
+	}
+
+	active_cable = (cable_attributes << TCSS_DDI_STATUS_CABLE_ATTR_SHIFT) &
+		       TCSS_DDI_STATUS_ACTIVE_CABLE;
+	retimer = (cable_attributes << TCSS_DDI_STATUS_CABLE_ATTR_SHIFT) &
+		  TCSS_DDI_STATUS_RETIMER_REDRIVER;
+	if (retimer && active_cable)
+		cable_attr_dpcd |= DP_CABLE_TYPE_RETIMER_ACTIVE;
+	else if (active_cable)
+		cable_attr_dpcd |= DP_CABLE_TYPE_LRD_ACTIVE;
+	else
+		cable_attr_dpcd |= DP_CABLE_TYPE_PASSIVE;
+
+	drm_dp_dpcd_writeb(&intel_dp->aux, DP_CABLE_ATTRIBUTES_UPDATED_BY_TX,
+			   cable_attr_dpcd);
+}
+
 static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
 					const struct intel_crtc_state *crtc_state)
 {
@@ -2414,6 +2463,7 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 
 	intel_dp_set_link_params(intel_dp,
 				 crtc_state->port_clock,
@@ -2480,6 +2530,13 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_check_frl_training(intel_dp);
 	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
 
+	if (intel_tc_port_in_dp_alt_mode(dig_port)) {
+		u8 cable_attributes;
+
+		cable_attributes = intel_tc_get_cable_attributes(dig_port);
+		intel_dp_set_cable_attributes(intel_dp, cable_attributes);
+	}
+
 	/*
 	 * 6. The rest of the below are substeps under the bspec's "Enable and
 	 * Train Display Port" step.  Note that steps that are specific to
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 3ebf41859043..6b10a8839563 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -260,6 +260,16 @@ assert_tc_port_power_enabled(struct intel_tc_port *tc)
 		    !intel_display_power_is_enabled(i915, tc_port_power_domain(tc)));
 }
 
+u8 intel_tc_get_cable_attributes(struct intel_digital_port *dig_port)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	enum tc_port tc_port = intel_port_to_tc(i915, dig_port->base.port);
+
+	return (intel_de_read(i915, TCSS_DDI_STATUS(tc_port)) &
+		TCSS_DDI_STATUS_CABLE_ATTR_MASK) >>
+		TCSS_DDI_STATUS_CABLE_ATTR_SHIFT;
+}
+
 u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_tc.h b/drivers/gpu/drm/i915/display/intel_tc.h
index 3b16491925fa..edafe92844b4 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.h
+++ b/drivers/gpu/drm/i915/display/intel_tc.h
@@ -43,5 +43,6 @@ int intel_tc_port_init(struct intel_digital_port *dig_port, bool is_legacy);
 void intel_tc_port_cleanup(struct intel_digital_port *dig_port);
 
 bool intel_tc_cold_requires_aux_pw(struct intel_digital_port *dig_port);
+u8 intel_tc_get_cable_attributes(struct intel_digital_port *dig_port);
 
 #endif /* __INTEL_TC_H__ */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0523418129c5..991ecf082b5c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6576,6 +6576,11 @@ enum skl_power_gate {
 #define TCSS_DDI_STATUS(tc)			_MMIO(_PICK_EVEN(tc, \
 								 _TCSS_DDI_STATUS_1, \
 								 _TCSS_DDI_STATUS_2))
+#define  TCSS_DDI_STATUS_CABLE_ATTR_SHIFT	9
+#define  TCSS_DDI_STATUS_CABLE_ATTR_MASK	REG_GENMASK(14, 9)
+#define  TCSS_DDI_STATUS_ACTIVE_CABLE		REG_BIT(11)
+#define  TCSS_DDI_STATUS_CABLE_TYPE		REG_BIT(10)
+#define  TCSS_DDI_STATUS_RETIMER_REDRIVER	REG_BIT(9)
 #define  TCSS_DDI_STATUS_READY			REG_BIT(2)
 #define  TCSS_DDI_STATUS_HPD_LIVE_STATUS_TBT	REG_BIT(1)
 #define  TCSS_DDI_STATUS_HPD_LIVE_STATUS_ALT	REG_BIT(0)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index b046f79f4744..dde715d567c2 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -654,6 +654,13 @@
 # define DP_LANE13_POST_CURSOR2_SET_MASK    (3 << 4)
 # define DP_LANE13_MAX_POST_CURSOR2_REACHED (1 << 6)
 
+#define DP_CABLE_ATTRIBUTES_UPDATED_BY_TX   0x110
+# define DP_CABLE_TYPE_MASK		    (0x7 << 3)
+# define DP_CABLE_TYPE_UNKNOWN		    (0x0 << 3)
+# define DP_CABLE_TYPE_PASSIVE		    (0x1 << 3)
+# define DP_CABLE_TYPE_LRD_ACTIVE	    (0x2 << 3)
+# define DP_CABLE_TYPE_RETIMER_ACTIVE	    (0x3 << 3)
+
 #define DP_MSTM_CTRL			    0x111   /* 1.2 */
 # define DP_MST_EN			    (1 << 0)
 # define DP_UP_REQ_EN			    (1 << 1)
@@ -1139,6 +1146,8 @@
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS             0x05
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS             0x06
 
+#define DP_CABLE_ATTRIBUTES_UPDATED_BY_RX               0x2217 /* 2.1 */
+
 #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
 #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
 
-- 
2.29.0

