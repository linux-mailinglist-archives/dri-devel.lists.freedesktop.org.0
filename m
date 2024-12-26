Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2E9FC8FA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 07:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26310E75D;
	Thu, 26 Dec 2024 06:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="IiRdYqwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12798.qiye.163.com (mail-m12798.qiye.163.com
 [115.236.127.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C46910E751
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 06:33:55 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6dc511a1;
 Thu, 26 Dec 2024 14:33:51 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 13/17] drm/bridge: analogix_dp: Convert
 &analogix_dp_device.aux into a pointer
Date: Thu, 26 Dec 2024 14:33:09 +0800
Message-Id: <20241226063313.3267515-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0eQlYZHh5LGUwaQ0pOH0JWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abeb9703a3kunm6dc511a1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NTY6Phw*NTIIIkw*Nz8qKjYe
 SAwaFExVSlVKTEhOSkJPQ0hITk9PVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTkJISjcG
DKIM-Signature: a=rsa-sha256;
 b=IiRdYqwl08YY7mnUj+lVJyJiOSEsIuDxqQUdUSUsizvqoJtYH5ZmAaNOjy7bUWelij7EzUyfeH6Y1Pwk8LwuyEEi4XSO9+WIDnz5353FX8Ut5u0cB6+qL9IrSXE/nNyB4Hr0Lmto0DqUwV9DxDA+DUl8Z5yNUxg+/e/W9HkGDSE=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=HyAL0207yxtI894aU/vKmfqIQOHKKx77e57mJwtt0YU=;
 h=date:mime-version:subject:message-id:from;
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

With the previous patch related to the support of getting panel from
the DP AUX bus, the &analogix_dp_device.aux can be obtained from the
&analogix_dp_plat_data.aux.

Furthermore, the assignment of &analogix_dp_plat_data.connector is
intended to obtain the pointer of struct analogix_dp_device within the
analogix_dpaux_transfer() function.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 92 ++++++++++---------
 .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  2 +-
 3 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9429c50cc1bc..f7ff9520ad5f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -33,6 +33,7 @@
 #include "analogix_dp_reg.h"
 
 #define to_dp(nm)	container_of(nm, struct analogix_dp_device, nm)
+#define to_pdata(nm)	container_of(nm, struct analogix_dp_plat_data, nm)
 
 static const bool verify_fast_training;
 
@@ -98,7 +99,7 @@ static bool analogix_dp_detect_sink_psr(struct analogix_dp_device *dp)
 	unsigned char psr_version;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(&dp->aux, DP_PSR_SUPPORT, &psr_version);
+	ret = drm_dp_dpcd_readb(dp->aux, DP_PSR_SUPPORT, &psr_version);
 	if (ret != 1) {
 		dev_err(dp->dev, "failed to get PSR version, disable it\n");
 		return false;
@@ -114,14 +115,14 @@ static int analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
 	int ret;
 
 	/* Disable psr function */
-	ret = drm_dp_dpcd_readb(&dp->aux, DP_PSR_EN_CFG, &psr_en);
+	ret = drm_dp_dpcd_readb(dp->aux, DP_PSR_EN_CFG, &psr_en);
 	if (ret != 1) {
 		dev_err(dp->dev, "failed to get psr config\n");
 		goto end;
 	}
 
 	psr_en &= ~DP_PSR_ENABLE;
-	ret = drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_PSR_EN_CFG, psr_en);
 	if (ret != 1) {
 		dev_err(dp->dev, "failed to disable panel psr\n");
 		goto end;
@@ -129,7 +130,7 @@ static int analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
 
 	/* Main-Link transmitter remains active during PSR active states */
 	psr_en = DP_PSR_CRC_VERIFICATION;
-	ret = drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_PSR_EN_CFG, psr_en);
 	if (ret != 1) {
 		dev_err(dp->dev, "failed to set panel psr\n");
 		goto end;
@@ -137,7 +138,7 @@ static int analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
 
 	/* Enable psr function */
 	psr_en = DP_PSR_ENABLE | DP_PSR_CRC_VERIFICATION;
-	ret = drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_PSR_EN_CFG, psr_en);
 	if (ret != 1) {
 		dev_err(dp->dev, "failed to set panel psr\n");
 		goto end;
@@ -161,16 +162,16 @@ analogix_dp_enable_rx_to_enhanced_mode(struct analogix_dp_device *dp,
 	u8 data;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(&dp->aux, DP_LANE_COUNT_SET, &data);
+	ret = drm_dp_dpcd_readb(dp->aux, DP_LANE_COUNT_SET, &data);
 	if (ret != 1)
 		return ret;
 
 	if (enable)
-		ret = drm_dp_dpcd_writeb(&dp->aux, DP_LANE_COUNT_SET,
+		ret = drm_dp_dpcd_writeb(dp->aux, DP_LANE_COUNT_SET,
 					 DP_LANE_COUNT_ENHANCED_FRAME_EN |
 					 DPCD_LANE_COUNT_SET(data));
 	else
-		ret = drm_dp_dpcd_writeb(&dp->aux, DP_LANE_COUNT_SET,
+		ret = drm_dp_dpcd_writeb(dp->aux, DP_LANE_COUNT_SET,
 					 DPCD_LANE_COUNT_SET(data));
 
 	return ret < 0 ? ret : 0;
@@ -182,7 +183,7 @@ static int analogix_dp_is_enhanced_mode_available(struct analogix_dp_device *dp,
 	u8 data;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(&dp->aux, DP_MAX_LANE_COUNT, &data);
+	ret = drm_dp_dpcd_readb(dp->aux, DP_MAX_LANE_COUNT, &data);
 	if (ret != 1) {
 		*enhanced_mode_support = 0;
 		return ret;
@@ -217,7 +218,7 @@ static int analogix_dp_training_pattern_dis(struct analogix_dp_device *dp)
 
 	analogix_dp_set_training_pattern(dp, DP_NONE);
 
-	ret = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_TRAINING_PATTERN_SET,
 				 DP_TRAINING_PATTERN_DISABLE);
 
 	return ret < 0 ? ret : 0;
@@ -253,7 +254,7 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 	/* Setup RX configuration */
 	buf[0] = dp->link_train.link_rate;
 	buf[1] = dp->link_train.lane_count;
-	retval = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, 2);
+	retval = drm_dp_dpcd_write(dp->aux, DP_LINK_BW_SET, buf, 2);
 	if (retval < 0)
 		return retval;
 	/* set enhanced mode if available */
@@ -274,7 +275,7 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
 
 	/* Set RX training pattern */
-	retval = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
+	retval = drm_dp_dpcd_writeb(dp->aux, DP_TRAINING_PATTERN_SET,
 				    DP_LINK_SCRAMBLING_DISABLE |
 					DP_TRAINING_PATTERN_1);
 	if (retval < 0)
@@ -284,7 +285,7 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 		buf[lane] = DP_TRAIN_PRE_EMPH_LEVEL_0 |
 			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
 
-	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, buf,
+	retval = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET, buf,
 				   lane_count);
 	if (retval < 0)
 		return retval;
@@ -393,7 +394,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 
 	lane_count = dp->link_train.lane_count;
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_LANE0_1_STATUS, link_status, 2);
+	retval = drm_dp_dpcd_read(dp->aux, DP_LANE0_1_STATUS, link_status, 2);
 	if (retval < 0)
 		return retval;
 
@@ -401,7 +402,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 		/* set training pattern 2 for EQ */
 		analogix_dp_set_training_pattern(dp, TRAINING_PTN2);
 
-		retval = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
+		retval = drm_dp_dpcd_writeb(dp->aux, DP_TRAINING_PATTERN_SET,
 					    DP_LINK_SCRAMBLING_DISABLE |
 						DP_TRAINING_PATTERN_2);
 		if (retval < 0)
@@ -413,7 +414,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 		return 0;
 	}
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
+	retval = drm_dp_dpcd_read(dp->aux, DP_ADJUST_REQUEST_LANE0_1,
 				  adjust_request, 2);
 	if (retval < 0)
 		return retval;
@@ -441,7 +442,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 	analogix_dp_get_adjust_training_lane(dp, adjust_request);
 	analogix_dp_set_lane_link_training(dp);
 
-	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
+	retval = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET,
 				   dp->link_train.training_lane, lane_count);
 	if (retval < 0)
 		return retval;
@@ -459,7 +460,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 
 	lane_count = dp->link_train.lane_count;
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_LANE0_1_STATUS, link_status, 2);
+	retval = drm_dp_dpcd_read(dp->aux, DP_LANE0_1_STATUS, link_status, 2);
 	if (retval < 0)
 		return retval;
 
@@ -468,12 +469,12 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 		return -EIO;
 	}
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
+	retval = drm_dp_dpcd_read(dp->aux, DP_ADJUST_REQUEST_LANE0_1,
 				  adjust_request, 2);
 	if (retval < 0)
 		return retval;
 
-	retval = drm_dp_dpcd_readb(&dp->aux, DP_LANE_ALIGN_STATUS_UPDATED,
+	retval = drm_dp_dpcd_readb(dp->aux, DP_LANE_ALIGN_STATUS_UPDATED,
 				   &link_align);
 	if (retval < 0)
 		return retval;
@@ -513,7 +514,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 
 	analogix_dp_set_lane_link_training(dp);
 
-	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
+	retval = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET,
 				   dp->link_train.training_lane, lane_count);
 	if (retval < 0)
 		return retval;
@@ -532,7 +533,7 @@ static void analogix_dp_get_max_rx_bandwidth(struct analogix_dp_device *dp,
 	 * For DP rev.1.2, Maximum link rate of Main Link lanes
 	 * 0x06 = 1.62 Gbps, 0x0a = 2.7 Gbps, 0x14 = 5.4Gbps
 	 */
-	drm_dp_dpcd_readb(&dp->aux, DP_MAX_LINK_RATE, &data);
+	drm_dp_dpcd_readb(dp->aux, DP_MAX_LINK_RATE, &data);
 	*bandwidth = data;
 }
 
@@ -545,7 +546,7 @@ static void analogix_dp_get_max_rx_lane_count(struct analogix_dp_device *dp,
 	 * For DP rev.1.1, Maximum number of Main Link lanes
 	 * 0x01 = 1 lane, 0x02 = 2 lanes, 0x04 = 4 lanes
 	 */
-	drm_dp_dpcd_readb(&dp->aux, DP_MAX_LANE_COUNT, &data);
+	drm_dp_dpcd_readb(dp->aux, DP_MAX_LANE_COUNT, &data);
 	*lane_count = DPCD_MAX_LANE_COUNT(data);
 }
 
@@ -652,7 +653,7 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 	 * speed
 	 */
 	if (verify_fast_training) {
-		ret = drm_dp_dpcd_readb(&dp->aux, DP_LANE_ALIGN_STATUS_UPDATED,
+		ret = drm_dp_dpcd_readb(dp->aux, DP_LANE_ALIGN_STATUS_UPDATED,
 					&link_align);
 		if (ret < 0) {
 			DRM_DEV_ERROR(dp->dev, "Read align status failed %d\n",
@@ -660,7 +661,7 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 			return ret;
 		}
 
-		ret = drm_dp_dpcd_read(&dp->aux, DP_LANE0_1_STATUS, link_status,
+		ret = drm_dp_dpcd_read(dp->aux, DP_LANE0_1_STATUS, link_status,
 				       2);
 		if (ret < 0) {
 			DRM_DEV_ERROR(dp->dev, "Read link status failed %d\n",
@@ -762,20 +763,20 @@ static int analogix_dp_enable_scramble(struct analogix_dp_device *dp,
 	if (enable) {
 		analogix_dp_enable_scrambling(dp);
 
-		ret = drm_dp_dpcd_readb(&dp->aux, DP_TRAINING_PATTERN_SET,
+		ret = drm_dp_dpcd_readb(dp->aux, DP_TRAINING_PATTERN_SET,
 					&data);
 		if (ret != 1)
 			return ret;
-		ret = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
+		ret = drm_dp_dpcd_writeb(dp->aux, DP_TRAINING_PATTERN_SET,
 				   (u8)(data & ~DP_LINK_SCRAMBLING_DISABLE));
 	} else {
 		analogix_dp_disable_scrambling(dp);
 
-		ret = drm_dp_dpcd_readb(&dp->aux, DP_TRAINING_PATTERN_SET,
+		ret = drm_dp_dpcd_readb(dp->aux, DP_TRAINING_PATTERN_SET,
 					&data);
 		if (ret != 1)
 			return ret;
-		ret = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
+		ret = drm_dp_dpcd_writeb(dp->aux, DP_TRAINING_PATTERN_SET,
 				   (u8)(data | DP_LINK_SCRAMBLING_DISABLE));
 	}
 	return ret < 0 ? ret : 0;
@@ -822,7 +823,7 @@ static int analogix_dp_fast_link_train_detection(struct analogix_dp_device *dp)
 	int ret;
 	u8 spread;
 
-	ret = drm_dp_dpcd_readb(&dp->aux, DP_MAX_DOWNSPREAD, &spread);
+	ret = drm_dp_dpcd_readb(dp->aux, DP_MAX_DOWNSPREAD, &spread);
 	if (ret != 1) {
 		dev_err(dp->dev, "failed to read downspread %d\n", ret);
 		return ret;
@@ -891,7 +892,7 @@ static int analogix_dp_enable_psr(struct analogix_dp_device *dp)
 	int ret;
 	u8 sink;
 
-	ret = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &sink);
+	ret = drm_dp_dpcd_readb(dp->aux, DP_PSR_STATUS, &sink);
 	if (ret != 1)
 		DRM_DEV_ERROR(dp->dev, "Failed to read psr status %d\n", ret);
 	else if (sink == DP_PSR_SINK_ACTIVE_RFB)
@@ -921,13 +922,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
 
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, false);
 
-	ret = drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 	if (ret != 1) {
 		DRM_DEV_ERROR(dp->dev, "Failed to set DP Power0 %d\n", ret);
 		return ret;
 	}
 
-	ret = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &sink);
+	ret = drm_dp_dpcd_readb(dp->aux, DP_PSR_STATUS, &sink);
 	if (ret != 1) {
 		DRM_DEV_ERROR(dp->dev, "Failed to read psr status %d\n", ret);
 		return ret;
@@ -1016,7 +1017,7 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 			return 0;
 		}
 
-		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
 
 		drm_edid_connector_update(&dp->connector, drm_edid);
 
@@ -1127,6 +1128,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 
 	if (!dp->plat_data->skip_connector) {
 		connector = &dp->connector;
+		dp->plat_data->connector = &dp->connector;
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 
 		ret = drm_connector_init(dp->drm_dev, connector,
@@ -1535,7 +1537,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 				       struct drm_dp_aux_msg *msg)
 {
-	struct analogix_dp_device *dp = to_dp(aux);
+	struct analogix_dp_plat_data *plat_data = to_pdata(aux);
+	struct drm_connector *connector = plat_data->connector;
+	struct analogix_dp_device *dp = to_dp(connector);
 	int ret;
 
 	pm_runtime_get_sync(dp->dev);
@@ -1722,12 +1726,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 			return ret;
 	}
 
-	dp->aux.name = "DP-AUX";
-	dp->aux.transfer = analogix_dpaux_transfer;
-	dp->aux.dev = dp->dev;
-	dp->aux.drm_dev = drm_dev;
+	dp->aux = &dp->plat_data->aux;
+	dp->aux->name = "DP-AUX";
+	dp->aux->transfer = analogix_dpaux_transfer;
+	dp->aux->drm_dev = drm_dev;
 
-	ret = drm_dp_aux_register(&dp->aux);
+	ret = drm_dp_aux_register(dp->aux);
 	if (ret) {
 		DRM_ERROR("failed to register AUX (%d)\n", ret);
 		goto err_disable_pm_runtime;
@@ -1742,7 +1746,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	return 0;
 
 err_unregister_aux:
-	drm_dp_aux_unregister(&dp->aux);
+	drm_dp_aux_unregister(dp->aux);
 err_disable_pm_runtime:
 	if (IS_ENABLED(CONFIG_PM)) {
 		pm_runtime_dont_use_autosuspend(dp->dev);
@@ -1765,7 +1769,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 			DRM_ERROR("failed to turnoff the panel\n");
 	}
 
-	drm_dp_aux_unregister(&dp->aux);
+	drm_dp_aux_unregister(dp->aux);
 
 	if (IS_ENABLED(CONFIG_PM)) {
 		pm_runtime_dont_use_autosuspend(dp->dev);
@@ -1786,7 +1790,7 @@ int analogix_dp_start_crc(struct drm_connector *connector)
 		return -EINVAL;
 	}
 
-	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
+	return drm_dp_start_crc(dp->aux, connector->state->crtc);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
 
@@ -1794,7 +1798,7 @@ int analogix_dp_stop_crc(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
 
-	return drm_dp_stop_crc(&dp->aux);
+	return drm_dp_stop_crc(dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_stop_crc);
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 774d11574b09..ec0bfae1d588 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -155,7 +155,7 @@ struct analogix_dp_device {
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
 	struct drm_bridge	*bridge;
-	struct drm_dp_aux       aux;
+	struct drm_dp_aux	*aux;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 38fd8d5014d2..3c52457d99ed 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -892,7 +892,7 @@ static ssize_t analogix_dp_get_psr_status(struct analogix_dp_device *dp)
 	ssize_t val;
 	u8 status;
 
-	val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &status);
+	val = drm_dp_dpcd_readb(dp->aux, DP_PSR_STATUS, &status);
 	if (val < 0) {
 		dev_err(dp->dev, "PSR_STATUS read failed ret=%zd", val);
 		return val;
-- 
2.34.1

