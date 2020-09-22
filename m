Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB7274275
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 14:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108ED6E85D;
	Tue, 22 Sep 2020 12:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185FB6E85F;
 Tue, 22 Sep 2020 12:51:33 +0000 (UTC)
IronPort-SDR: BaXtYfo/BO1Qk5zrU9YCpQjMM5ASbQ80f8m3uZWSefwQ0te0cvLj7/0Kh/SgL1DZNCTrIWb8TW
 zqmm7YxrbO3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148342816"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="148342816"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 05:51:32 -0700
IronPort-SDR: paPSrR/0fFI0wP/i0esNWwd7P1Klye9YtS75/8sR0iGfYLtPzqRnTdD0Bo8Pt7w6hLdHFeUWcp
 XIhZLzxwBUOg==
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="309485630"
Received: from ideak-desk.fi.intel.com (HELO localhost) ([10.237.68.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 05:51:31 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/dp: Add LTTPR helpers
Date: Tue, 22 Sep 2020 15:51:04 +0300
Message-Id: <20200922125106.30540-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922125106.30540-1-imre.deak@intel.com>
References: <20200922125106.30540-1-imre.deak@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the helpers and register definitions needed to read out the common
and per-PHY LTTPR capabilities and perform link training in the LTTPR
non-transparent mode.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 179 +++++++++++++++++++++++++++++++-
 include/drm/drm_dp_helper.h     |  56 ++++++++++
 2 files changed, 231 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 90807a6b415c..115d2c3320ef 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -150,11 +150,8 @@ void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
 
-void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+static void __drm_dp_link_train_channel_eq_delay(unsigned long rd_interval)
 {
-	unsigned long rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
-					 DP_TRAINING_AUX_RD_MASK;
-
 	if (rd_interval > 4)
 		DRM_DEBUG_KMS("AUX interval %lu, out of range (max 4)\n",
 			      rd_interval);
@@ -166,8 +163,35 @@ void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 
 	usleep_range(rd_interval, rd_interval * 2);
 }
+
+void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	__drm_dp_link_train_channel_eq_delay(dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
+					     DP_TRAINING_AUX_RD_MASK);
+}
 EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
 
+void drm_dp_lttpr_link_train_clock_recovery_delay(void)
+{
+	usleep_range(100, 200);
+}
+EXPORT_SYMBOL(drm_dp_lttpr_link_train_clock_recovery_delay);
+
+static u8 dp_lttpr_phy_cap(const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE], int r)
+{
+	return phy_cap[r - DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1];
+}
+
+void drm_dp_lttpr_link_train_channel_eq_delay(const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE])
+{
+	u8 interval = dp_lttpr_phy_cap(phy_cap,
+				       DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1) &
+		      DP_TRAINING_AUX_RD_MASK;
+
+	__drm_dp_link_train_channel_eq_delay(interval);
+}
+EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
+
 u8 drm_dp_link_rate_to_bw_code(int link_rate)
 {
 	/* Spec says link_bw = link_rate / 0.27Gbps */
@@ -2093,6 +2117,153 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
 
+/**
+ * drm_dp_read_lttpr_common_caps - read the LTTPR common capabilities
+ * @aux: DisplayPort AUX channel
+ * @caps: buffer to return the capability info in
+ *
+ * Read capabilities common to all LTTPRs.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
+				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux,
+			       DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
+			       caps, DP_LTTPR_COMMON_CAP_SIZE);
+	if (ret < 0)
+		return ret;
+
+	WARN_ON(ret != DP_LTTPR_COMMON_CAP_SIZE);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_read_lttpr_common_caps);
+
+/**
+ * drm_dp_read_lttpr_phy_caps - read the capabilities for a given LTTPR PHY
+ * @aux: DisplayPort AUX channel
+ * @dp_phy: LTTPR PHY to read the capabilities for
+ * @caps: buffer to return the capability info in
+ *
+ * Read the capabilities for the given LTTPR PHY.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
+			       enum drm_dp_phy dp_phy,
+			       u8 caps[DP_LTTPR_PHY_CAP_SIZE])
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux,
+			       DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy),
+			       caps, DP_LTTPR_PHY_CAP_SIZE);
+	if (ret < 0)
+		return ret;
+
+	WARN_ON(ret != DP_LTTPR_PHY_CAP_SIZE);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_read_lttpr_phy_caps);
+
+static u8 dp_lttpr_common_cap(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE], int r)
+{
+	return caps[r - DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
+}
+
+/**
+ * drm_dp_lttpr_count - get the number of detected LTTPRs
+ * @caps: LTTPR common capabilities
+ *
+ * Get the number of detected LTTPRs from the LTTPR common capabilities info.
+ *
+ * Returns:
+ *   -ERANGE if more than supported number (8) of LTTPRs are detected
+ *   -EINVAL if the DP_PHY_REPEATER_CNT register contains an invalid value
+ *   otherwise the number of detected LTTPRs
+ */
+int drm_dp_lttpr_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
+{
+	u8 count = dp_lttpr_common_cap(caps, DP_PHY_REPEATER_CNT);
+
+	switch (hweight8(count)) {
+	case 0:
+		return 0;
+	case 1:
+		return 8 - ilog2(count);
+	case 8:
+		return -ERANGE;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(drm_dp_lttpr_count);
+
+/**
+ * drm_dp_lttpr_max_link_rate - get the maximum link rate supported by all LTTPRs
+ * @caps: LTTPR common capabilities
+ *
+ * Returns the maximum link rate supported by all detected LTTPRs.
+ */
+int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
+{
+	u8 rate = dp_lttpr_common_cap(caps, DP_MAX_LINK_RATE_PHY_REPEATER);
+
+	return drm_dp_bw_code_to_link_rate(rate);
+}
+EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
+
+/**
+ * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
+ * @caps: LTTPR common capabilities
+ *
+ * Returns the maximum lane count supported by all detected LTTPRs.
+ */
+int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
+{
+	u8 max_lanes = dp_lttpr_common_cap(caps, DP_MAX_LANE_COUNT_PHY_REPEATER);
+
+	return max_lanes & DP_MAX_LANE_COUNT_MASK;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_max_lane_count);
+
+/**
+ * drm_dp_lttpr_voltage_swing_level_3_supported - check for LTTPR vswing3 support
+ * @caps: LTTPR PHY capabilities
+ *
+ * Returns true if the @caps for an LTTPR TX PHY indicate support for
+ * voltage swing level 3.
+ */
+bool
+drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE])
+{
+	u8 txcap = dp_lttpr_phy_cap(caps, DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1);
+
+	return txcap & DP_VOLTAGE_SWING_LEVEL_3_SUPPORTED;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_voltage_swing_level_3_supported);
+
+/**
+ * drm_dp_lttpr_pre_emphasis_level_3_supported - check for LTTPR preemph3 support
+ * @caps: LTTPR PHY capabilities
+ *
+ * Returns true if the @caps for an LTTPR TX PHY indicate support for
+ * pre-emphasis level 3.
+ */
+bool
+drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE])
+{
+	u8 txcap = dp_lttpr_phy_cap(caps, DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1);
+
+	return txcap & DP_PRE_EMPHASIS_LEVEL_3_SUPPORTED;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_pre_emphasis_level_3_supported);
+
 /**
  * drm_dp_get_phy_test_pattern() - get the requested pattern from the sink.
  * @aux: DisplayPort AUX channel
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index c9f2851904d0..de9ea7602f80 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1066,15 +1066,56 @@ struct drm_device;
 #define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /* 1.4a */
 #define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
 #define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /* 1.4a */
+
+enum drm_dp_phy {
+	DP_PHY_DPRX,
+
+	DP_PHY_LTTPR1,
+	DP_PHY_LTTPR2,
+	DP_PHY_LTTPR3,
+	DP_PHY_LTTPR4,
+	DP_PHY_LTTPR5,
+	DP_PHY_LTTPR6,
+	DP_PHY_LTTPR7,
+	DP_PHY_LTTPR8,
+
+	DP_MAX_LTTPR_COUNT = DP_PHY_LTTPR8,
+};
+
+#define __DP_LTTPR1_BASE				    0xf0010 /* 1.3 */
+#define __DP_LTTPR2_BASE				    0xf0060 /* 1.3 */
+#define DP_LTTPR_BASE(dp_phy) \
+	(__DP_LTTPR1_BASE + (__DP_LTTPR2_BASE - __DP_LTTPR1_BASE) * \
+		((dp_phy) - DP_PHY_LTTPR1))
+
+#define DP_LTTPR_REG(dp_phy, lttpr1_reg) \
+	(DP_LTTPR_BASE(dp_phy) - DP_LTTPR_BASE(DP_PHY_LTTPR1) + (lttpr1_reg))
+
 #define DP_TRAINING_PATTERN_SET_PHY_REPEATER1		    0xf0010 /* 1.3 */
+#define DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy) \
+	DP_LTTPR_REG(dp_phy, DP_TRAINING_PATTERN_SET_PHY_REPEATER1)
+
 #define DP_TRAINING_LANE0_SET_PHY_REPEATER1		    0xf0011 /* 1.3 */
+#define DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy) \
+	DP_LTTPR_REG(dp_phy, DP_TRAINING_LANE0_SET_PHY_REPEATER1)
+
 #define DP_TRAINING_LANE1_SET_PHY_REPEATER1		    0xf0012 /* 1.3 */
 #define DP_TRAINING_LANE2_SET_PHY_REPEATER1		    0xf0013 /* 1.3 */
 #define DP_TRAINING_LANE3_SET_PHY_REPEATER1		    0xf0014 /* 1.3 */
 #define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1	    0xf0020 /* 1.4a */
+#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy)	\
+	DP_LTTPR_REG(dp_phy, DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1)
+
 #define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1		    0xf0021 /* 1.4a */
+# define DP_VOLTAGE_SWING_LEVEL_3_SUPPORTED		    BIT(0)
+# define DP_PRE_EMPHASIS_LEVEL_3_SUPPORTED		    BIT(1)
+
 #define DP_LANE0_1_STATUS_PHY_REPEATER1			    0xf0030 /* 1.3 */
+#define DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy) \
+	DP_LTTPR_REG(dp_phy, DP_LANE0_1_STATUS_PHY_REPEATER1)
+
 #define DP_LANE2_3_STATUS_PHY_REPEATER1			    0xf0031 /* 1.3 */
+
 #define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1	    0xf0032 /* 1.3 */
 #define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1		    0xf0033 /* 1.3 */
 #define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1		    0xf0034 /* 1.3 */
@@ -1184,9 +1225,13 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
 #define DP_DSC_RECEIVER_CAP_SIZE        0xf
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	3
+#define DP_LTTPR_COMMON_CAP_SIZE	8
+#define DP_LTTPR_PHY_CAP_SIZE		3
 
 void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+void drm_dp_lttpr_link_train_clock_recovery_delay(void);
 void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+void drm_dp_lttpr_link_train_channel_eq_delay(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 
 u8 drm_dp_link_rate_to_bw_code(int link_rate);
 int drm_dp_bw_code_to_link_rate(u8 link_bw);
@@ -1694,6 +1739,17 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
 				const struct drm_dp_desc *desc);
 int drm_dp_read_sink_count(struct drm_dp_aux *aux);
 
+int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
+				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
+			       enum drm_dp_phy dp_phy,
+			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
+int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
+bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
+
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
 int drm_dp_aux_register(struct drm_dp_aux *aux);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
