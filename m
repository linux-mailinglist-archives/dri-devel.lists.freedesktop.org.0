Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF342A786
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 16:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E4389A08;
	Tue, 12 Oct 2021 14:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44EE6E9AA;
 Tue, 12 Oct 2021 14:43:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="214316194"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="214316194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 07:43:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="491003833"
Received: from annahenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.209.214])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 07:43:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH 1/2] drm/dp: add helpers to read link training delays
Date: Tue, 12 Oct 2021 17:43:20 +0300
Message-Id: <20211012144321.5990-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The link training delays are different and/or available in different
DPCD offsets depending on:

- Clock recovery vs. channel equalization
- DPRX vs. LTTPR
- 128b/132b vs. 8b/10b
- DPCD 1.4+ vs. earlier

Add helpers to get the correct delays in us, reading DPCD if
necessary. This is more straightforward than trying to retrofit the
existing helpers to take 128b/132b into account.

Having to pass in the DPCD receiver cap field seems unavoidable, because
reading it involves checking the revision and reading extended receiver
cap. So unfortunately the interface is mixed cached and read as needed.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 132 ++++++++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h     |  21 ++++-
 2 files changed, 151 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 4d0d1e8e51fa..04ebef7f5aa7 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -154,6 +154,138 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
 
+static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
+{
+	if (rd_interval > 4)
+		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x (max 4)\n",
+			    aux->name, rd_interval);
+
+	if (rd_interval == 0)
+		return 100;
+
+	return rd_interval * 4 * USEC_PER_MSEC;
+}
+
+static int __8b10b_channel_eq_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
+{
+	if (rd_interval > 4)
+		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x (max 4)\n",
+			    aux->name, rd_interval);
+
+	if (rd_interval == 0)
+		return 400;
+
+	return rd_interval * 4 * USEC_PER_MSEC;
+}
+
+static int __128b132b_channel_eq_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
+{
+	switch (rd_interval) {
+	default:
+		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x\n",
+			    aux->name, rd_interval);
+		fallthrough;
+	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US:
+		return 400;
+	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS:
+		return 4000;
+	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_8_MS:
+		return 8000;
+	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_12_MS:
+		return 12000;
+	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_16_MS:
+		return 16000;
+	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS:
+		return 32000;
+	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS:
+		return 64000;
+	}
+}
+
+/*
+ * The link training delays are different for:
+ *
+ *  - Clock recovery vs. channel equalization
+ *  - DPRX vs. LTTPR
+ *  - 128b/132b vs. 8b/10b
+ *  - DPCD rev 1.3 vs. later
+ *
+ * Get the correct delay in us, reading DPCD if necessary.
+ */
+static int __read_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+			enum drm_dp_phy dp_phy, bool uhbr, bool cr)
+{
+	int (*parse)(const struct drm_dp_aux *aux, u8 rd_interval);
+	unsigned int offset;
+	u8 rd_interval, mask;
+	int delay_us;
+
+	if (dp_phy == DP_PHY_DPRX) {
+		if (uhbr) {
+			if (cr)
+				return 100;
+
+			offset = DP_128B132B_TRAINING_AUX_RD_INTERVAL;
+			mask = DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
+			parse = __128b132b_channel_eq_delay_us;
+		} else {
+			if (cr && dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
+				return 100;
+
+			offset = DP_TRAINING_AUX_RD_INTERVAL;
+			mask = DP_TRAINING_AUX_RD_MASK;
+			if (cr)
+				parse = __8b10b_clock_recovery_delay_us;
+			else
+				parse = __8b10b_channel_eq_delay_us;
+		}
+	} else {
+		if (uhbr) {
+			offset = DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy);
+			mask = DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
+			parse = __128b132b_channel_eq_delay_us;
+		} else {
+			if (cr)
+				return 100;
+
+			offset = DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy);
+			mask = DP_TRAINING_AUX_RD_MASK;
+			parse = __8b10b_channel_eq_delay_us;
+		}
+	}
+
+	if (offset < DP_RECEIVER_CAP_SIZE) {
+		rd_interval = dpcd[offset];
+	} else {
+		if (drm_dp_dpcd_readb(aux, offset, &rd_interval) != 1) {
+			drm_dbg_kms(aux->drm_dev, "%s: failed rd interval read\n",
+				    aux->name);
+			/* arbitrary default delay */
+			return 400;
+		}
+	}
+
+	delay_us = parse(aux, rd_interval & mask);
+	if (delay_us < 0)
+		return 0;
+
+	return delay_us;
+}
+
+int drm_dp_read_clock_recovery_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				     enum drm_dp_phy dp_phy, bool uhbr)
+{
+	return __read_delay(aux, dpcd, dp_phy, uhbr, true);
+}
+EXPORT_SYMBOL(drm_dp_read_clock_recovery_delay);
+
+int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				 enum drm_dp_phy dp_phy, bool uhbr)
+{
+	return __read_delay(aux, dpcd, dp_phy, uhbr, false);
+}
+EXPORT_SYMBOL(drm_dp_read_channel_eq_delay);
+
 void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index b52df4db3e8f..afdf7f4183f9 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1114,8 +1114,15 @@ struct drm_panel;
 # define DP_UHBR20                             (1 << 1)
 # define DP_UHBR13_5                           (1 << 2)
 
-#define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
-# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
+#define DP_128B132B_TRAINING_AUX_RD_INTERVAL                    0x2216 /* 2.0 */
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK              0x7f
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US            0x00
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS              0x01
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_8_MS              0x02
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_12_MS             0x03
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_16_MS             0x04
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS             0x05
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS             0x06
 
 #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
 #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
@@ -1389,6 +1396,11 @@ enum drm_dp_phy {
 # define DP_VOLTAGE_SWING_LEVEL_3_SUPPORTED		    BIT(0)
 # define DP_PRE_EMPHASIS_LEVEL_3_SUPPORTED		    BIT(1)
 
+#define DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1  0xf0022 /* 2.0 */
+#define DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy)	\
+	DP_LTTPR_REG(dp_phy, DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1)
+/* see DP_128B132B_TRAINING_AUX_RD_INTERVAL for values */
+
 #define DP_LANE0_1_STATUS_PHY_REPEATER1			    0xf0030 /* 1.3 */
 #define DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy) \
 	DP_LTTPR_REG(dp_phy, DP_LANE0_1_STATUS_PHY_REPEATER1)
@@ -1527,6 +1539,11 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
 #define DP_LTTPR_COMMON_CAP_SIZE	8
 #define DP_LTTPR_PHY_CAP_SIZE		3
 
+int drm_dp_read_clock_recovery_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				     enum drm_dp_phy dp_phy, bool uhbr);
+int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				 enum drm_dp_phy dp_phy, bool uhbr);
+
 void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 void drm_dp_lttpr_link_train_clock_recovery_delay(void);
-- 
2.30.2

