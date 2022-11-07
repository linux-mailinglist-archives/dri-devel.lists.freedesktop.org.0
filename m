Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DFD61EBC1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFC310E22B;
	Mon,  7 Nov 2022 07:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE4F10E204;
 Mon,  7 Nov 2022 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805624; x=1699341624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AENuynl9d410PjDiLPzGEssj3fg+efk8k/jBPKevzPI=;
 b=R07hePirfGz9MygjZd5FMMNdh89ZgOY2IARUGYtVt7PSF4YJfbI/aFr8
 6a2w74FkneLd5hHJE2yutznBeqkfUsAsKEtCo542ZyjCn5hPy47EQeN+m
 KrsRW2TQN91ZBgrXfbsy7irerv7TlX2+iSmx+Suy27exDPZCU6jsvNuEI
 e3SvF8+AXlmsZN3mCAxrj+7BDSC+A+jL3k6wWiH7Bd7G8fmLoFdQDVgdU
 EBYJrcem/v/bK4ei701jgSes17bihKxAq5roEFk3ULJhq4csKFTd+qsIW
 E6JOV9o3OHXwAhQ66aJCCxTph4BJyATHQx9iE/SdH8O+V1/3+llTAVbAx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463352"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463352"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767260"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767260"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:21 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 06/15] drm/drm_scdc_helper: Add SCDC helper funcs for HDMI2.1
Date: Mon,  7 Nov 2022 12:50:36 +0530
Message-Id: <20221107072045.628895-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HDMI2.1 specifies new SCDC registers to configure FRL Training
between source and sink and get the FRL Training updated from
and HDMI2.1 sink.

This patch adds new SCDC registers and helper functions to
read and configure these registers.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_scdc_helper.c | 196 ++++++++++++++++++++++
 include/drm/display/drm_scdc.h            |  23 +++
 include/drm/display/drm_scdc_helper.h     |  21 +++
 3 files changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index c3ad4ab2b456..dcf05167473d 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -261,3 +261,199 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set)
 	return true;
 }
 EXPORT_SYMBOL(drm_scdc_set_high_tmds_clock_ratio);
+
+/**
+ * drm_scdc_read_update_flags - read the SCDC update flags
+ * @adapter: I2C adapter for DDC channel
+ *
+ * Returns:
+ * 8bit SCDC update
+ */
+u8 drm_scdc_read_update_flags(struct i2c_adapter *adapter)
+{
+	u8 update = 0;
+	int ret;
+
+	ret = drm_scdc_readb(adapter, SCDC_UPDATE_0, &update);
+	if (ret < 0)
+		DRM_DEBUG_KMS("Failed to read scdc update: %d\n", ret);
+
+	return update;
+}
+EXPORT_SYMBOL(drm_scdc_read_update_flags);
+
+/**
+ * drm_scdc_clear_update_flags - Clears the given update flag bits
+ * @adapter: I2C adapter for DDC channel
+ * @status: update flag bits to be cleared
+ *
+ * Returns:
+ * 0 on success, negative error code otherwise.
+ */
+int drm_scdc_clear_update_flags(struct i2c_adapter *adapter, u8 update_flags)
+{
+	u8 buf;
+	int ret;
+
+	/* Not all flags can be cleared by source */
+	if (update_flags & ~(SCDC_STATUS_UPDATE | SCDC_CED_UPDATE |
+			     SCDC_SOURCE_TEST_UPDATE | SCDC_FLT_UPDATE |
+			     SCDC_RSED_UPDATE)) {
+		DRM_DEBUG_KMS("SCDC Update flag/s %u cannot be cleared\n",
+			      update_flags);
+
+		return false;
+	}
+
+	ret = drm_scdc_readb(adapter, SCDC_UPDATE_0, &buf);
+	if (ret < 0) {
+		DRM_DEBUG_KMS("Failed to read SCDC_UPDATE_0\n");
+
+		return ret;
+	}
+
+	buf = buf | update_flags;
+
+	ret = drm_scdc_writeb(adapter, SCDC_UPDATE_0, buf);
+	if (ret < 0) {
+		DRM_DEBUG_KMS("Failed to clear SCDC Update flag/s\n");
+
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_scdc_clear_update_flags);
+
+/**
+ * drm_scdc_read_status_flags - Read the status flags from offset 0x40
+ * @adapter: I2C adapter for DDC channel
+ *
+ * Returns:
+ * 8 bit value read from the 0ffset 0x40
+ */
+u8 drm_scdc_read_status_flags(struct i2c_adapter *adapter)
+{
+	u8 update = 0;
+	int ret;
+
+	ret = drm_scdc_readb(adapter, SCDC_STATUS_FLAGS_0, &update);
+	if (ret < 0)
+		DRM_DEBUG_KMS("Failed to read scdc status flag: %d\n", ret);
+
+	return update;
+}
+EXPORT_SYMBOL(drm_scdc_read_status_flags);
+
+/**
+ * drm_scdc_config_frl - configure the sink for starting FRL training
+ * @adapter: I2C adapter for DDC channel
+ * @frl_rate: FRL rate per lane required.
+ * @num_lanes: no. of lanes required, can be either 3 or 4.
+ * @ffe_levelw: max FFE Levelw supported for current rate for the given FRL rate.
+ *
+ * Returns:
+ * 0 if the SCDC offsets for FRL training are successfully configure,
+ * negative error code otherwise.
+ */
+int drm_scdc_config_frl(struct i2c_adapter *adapter, int frl_rate,
+			int num_lanes, int ffe_levels)
+{
+	u8 write_buf = 0;
+	int ret;
+
+	if (num_lanes > 4 || num_lanes < 3) {
+		DRM_DEBUG_KMS("No. of lanes can be 3 or 4 only\n");
+
+		return -EINVAL;
+	}
+	if (ffe_levels > 3) {
+		DRM_DEBUG_KMS("Max FFE levels can be 3 or less\n");
+
+		return -EINVAL;
+	}
+	switch (frl_rate) {
+	case 3:
+		write_buf |= (num_lanes == 3) ? SCDC_FRL_RATE_3GBPS_3LANES : 0;
+		break;
+	case 6:
+		write_buf |= (num_lanes == 3) ? SCDC_FRL_RATE_6GBPS_3LANES :
+			     SCDC_FRL_RATE_6GBPS_4LANES;
+		break;
+	case 8:
+		write_buf |= (num_lanes == 4) ? SCDC_FRL_RATE_8GBPS_4LANES : 0;
+		break;
+	case 10:
+		write_buf |= (num_lanes == 4) ? SCDC_FRL_RATE_10GBPS_4LANES : 0;
+		break;
+	case 12:
+		write_buf |= (num_lanes == 4) ? SCDC_FRL_RATE_12GBPS_4LANES : 0;
+		break;
+	default:
+		write_buf |= SCDC_FRL_DISABLE;
+	}
+
+	write_buf |= (ffe_levels << SCDC_FFE_LEVELS_SHIFT);
+
+	ret = drm_scdc_writeb(adapter, SCDC_CONFIG_1, write_buf);
+	if (ret < 0) {
+		DRM_DEBUG_KMS("Failed to write SCDC config: %d\n", ret);
+
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_scdc_config_frl);
+
+/**
+ * drm_scdc_get_ltp - get the Link training patterns for the 4 lanes
+ * @adapter: I2C adapter for DDC channel
+ * @ltp: pointer array for reading Link training patterns for the 4 lanes.
+ *
+ * Returns:
+ * 0 on success also filling ltp out argument, negetive error code otherwise.
+ */
+int drm_scdc_get_ltp(struct i2c_adapter *adapter,
+		     enum drm_scdc_frl_ltp ltp[4])
+{
+	u8 buf;
+	u8 ltp_reg;
+	u8 ltp_mask;
+	int ret;
+	int lane;
+
+	for (lane = 0; lane < 4; lane++) {
+		switch (lane) {
+		case 0:
+			ltp_reg = SCDC_STATUS_FLAGS_1;
+			ltp_mask = SCDC_LN0_LTP_REQ;
+			break;
+		case 1:
+			ltp_reg = SCDC_STATUS_FLAGS_1;
+			ltp_mask = SCDC_LN1_LTP_REQ;
+			break;
+		case 2:
+			ltp_reg = SCDC_STATUS_FLAGS_2;
+			ltp_mask = SCDC_LN2_LTP_REQ;
+			break;
+		case 3:
+		default:
+			ltp_reg = SCDC_STATUS_FLAGS_2;
+			ltp_mask = SCDC_LN3_LTP_REQ;
+			break;
+		}
+		ret = drm_scdc_readb(adapter, ltp_reg, &buf);
+		if (ret < 0) {
+			DRM_DEBUG_KMS("Failed to read link training pattern for Lane%d: %d\n",
+				      lane, ret);
+
+			return ret;
+		}
+
+		ltp[lane] = (buf & ltp_mask) >> lane % 2;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_scdc_get_ltp);
diff --git a/include/drm/display/drm_scdc.h b/include/drm/display/drm_scdc.h
index 3d58f37e8ed8..c7e621f4cc31 100644
--- a/include/drm/display/drm_scdc.h
+++ b/include/drm/display/drm_scdc.h
@@ -29,6 +29,10 @@
 #define SCDC_SOURCE_VERSION 0x02
 
 #define SCDC_UPDATE_0 0x10
+#define  SCDC_RSED_UPDATE (1 << 6)
+#define  SCDC_FLT_UPDATE (1 << 5)
+#define  SCDC_FRL_START (1 << 4)
+#define  SCDC_SOURCE_TEST_UPDATE (1 << 3)
 #define  SCDC_READ_REQUEST_TEST (1 << 2)
 #define  SCDC_CED_UPDATE (1 << 1)
 #define  SCDC_STATUS_UPDATE (1 << 0)
@@ -46,7 +50,20 @@
 #define SCDC_CONFIG_0 0x30
 #define  SCDC_READ_REQUEST_ENABLE (1 << 0)
 
+#define SCDC_CONFIG_1 0x31
+#define  SCDC_FRL_DISABLE		0
+#define  SCDC_FRL_RATE_3GBPS_3LANES	1
+#define  SCDC_FRL_RATE_6GBPS_3LANES	2
+#define  SCDC_FRL_RATE_6GBPS_4LANES	3
+#define  SCDC_FRL_RATE_8GBPS_4LANES	4
+#define  SCDC_FRL_RATE_10GBPS_4LANES	5
+#define  SCDC_FRL_RATE_12GBPS_4LANES	6
+#define  SCDC_FFE_LEVELS_SHIFT		4
+
 #define SCDC_STATUS_FLAGS_0 0x40
+#define  SCDC_DSC_DECODE_FAIL (1 << 7)
+#define  SCDC_FLT_READY (1 << 6)
+#define  SCDC_LANE3_LOCKED (1 << 4)
 #define  SCDC_CH2_LOCK (1 << 3)
 #define  SCDC_CH1_LOCK (1 << 2)
 #define  SCDC_CH0_LOCK (1 << 1)
@@ -54,6 +71,12 @@
 #define  SCDC_CLOCK_DETECT (1 << 0)
 
 #define SCDC_STATUS_FLAGS_1 0x41
+#define  SCDC_LN0_LTP_REQ (0xF << 0)
+#define  SCDC_LN1_LTP_REQ (0xF << 4)
+
+#define SCDC_STATUS_FLAGS_2 0x42
+#define  SCDC_LN2_LTP_REQ (0xF << 0)
+#define  SCDC_LN3_LTP_REQ (0xF << 4)
 
 #define SCDC_ERR_DET_0_L 0x50
 #define SCDC_ERR_DET_0_H 0x51
diff --git a/include/drm/display/drm_scdc_helper.h b/include/drm/display/drm_scdc_helper.h
index ded01fd948b4..405386335f20 100644
--- a/include/drm/display/drm_scdc_helper.h
+++ b/include/drm/display/drm_scdc_helper.h
@@ -35,6 +35,20 @@ ssize_t drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
 ssize_t drm_scdc_write(struct i2c_adapter *adapter, u8 offset,
 		       const void *buffer, size_t size);
 
+enum drm_scdc_frl_ltp {
+	SCDC_FRL_NO_LTP = 0,
+	SCDC_FRL_LTP1,
+	SCDC_FRL_LTP2,
+	SCDC_FRL_LTP3,
+	SCDC_FRL_LTP4,
+	SCDC_FRL_LTP5,
+	SCDC_FRL_LTP6,
+	SCDC_FRL_LTP7,
+	SCDC_FRL_LTP8,
+	SCDC_FRL_CHNG_FFE = 0xE,
+	SCDC_FRL_CHNG_RATE = 0xF,
+};
+
 /**
  * drm_scdc_readb - read a single byte from SCDC
  * @adapter: I2C adapter
@@ -75,5 +89,12 @@ bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter);
 
 bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable);
 bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set);
+u8 drm_scdc_read_update_flags(struct i2c_adapter *adapter);
+int drm_scdc_clear_update_flags(struct i2c_adapter *adapter, u8 update_flags);
+u8 drm_scdc_read_status_flags(struct i2c_adapter *adapter);
+int drm_scdc_config_frl(struct i2c_adapter *adapter, int frl_rate,
+			int num_lanes, int ffe_levels);
+int drm_scdc_get_ltp(struct i2c_adapter *adapter,
+		     enum drm_scdc_frl_ltp ltp[4]);
 
 #endif
-- 
2.25.1

