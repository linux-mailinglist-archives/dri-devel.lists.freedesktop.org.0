Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8391E9E33
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD146E048;
	Mon,  1 Jun 2020 06:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5768D6E039
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:28:59 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8E66D1A0630;
 Mon,  1 Jun 2020 08:23:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1DE451A0632;
 Mon,  1 Jun 2020 08:23:12 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B8CC8402DF;
 Mon,  1 Jun 2020 14:23:04 +0800 (SGT)
From: sandor.yu@nxp.com
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, heiko@sntech.de, hjc@rock-chips.com,
 Sandor.yu@nxp.com, dkos@cadence.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/rockchip: prepare common code for cdns and rk dpi/dp
 driver
Date: Mon,  1 Jun 2020 14:17:31 +0800
Message-Id: <d3d707cf37e7928a839071242c752779061cc094.1590982881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

- Extracted common fields from cdn_dp_device to a new cdns_mhdp_device
  structure which will be used by two separate drivers later on.
- Moved some datatypes (audio_format, audio_info, vic_pxl_encoding_format,
  video_info) from cdn-dp-core.c to cdn-dp-reg.h.
- Changed prefixes from cdn_dp to cdns_mhdp
    cdn -> cdns to match the other Cadence's drivers
    dp -> mhdp to distinguish it from a "just a DP" as the IP underneath
      this registers map can be a HDMI (which is internally different,
      but the interface for commands, events is pretty much the same).
- Modified cdn-dp-core.c to use the new driver structure and new function
  names.
- writel and readl are replaced by cdns_mhdp_bus_write and
  cdns_mhdp_bus_read.

Signed-off-by: Damian Kos <dkos@cadence.com>
Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 240 ++++++------
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  44 +--
 drivers/gpu/drm/rockchip/cdn-dp-reg.c  | 488 +++++++++++++------------
 drivers/gpu/drm/rockchip/cdn-dp-reg.h  | 133 +++++--
 4 files changed, 483 insertions(+), 422 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index eed594bd38d3..b6aa21779608 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -26,7 +26,7 @@
 #include "rockchip_drm_vop.h"
 
 #define connector_to_dp(c) \
-		container_of(c, struct cdn_dp_device, connector)
+		container_of(c, struct cdn_dp_device, mhdp.connector.base)
 
 #define encoder_to_dp(c) \
 		container_of(c, struct cdn_dp_device, encoder)
@@ -61,17 +61,18 @@ MODULE_DEVICE_TABLE(of, cdn_dp_dt_ids);
 static int cdn_dp_grf_write(struct cdn_dp_device *dp,
 			    unsigned int reg, unsigned int val)
 {
+	struct device *dev = dp->mhdp.dev;
 	int ret;
 
 	ret = clk_prepare_enable(dp->grf_clk);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to prepare_enable grf clock\n");
+		DRM_DEV_ERROR(dev, "Failed to prepare_enable grf clock\n");
 		return ret;
 	}
 
 	ret = regmap_write(dp->grf, reg, val);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
+		DRM_DEV_ERROR(dev, "Could not write to GRF: %d\n", ret);
 		return ret;
 	}
 
@@ -82,24 +83,25 @@ static int cdn_dp_grf_write(struct cdn_dp_device *dp,
 
 static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
 {
+	struct device *dev = dp->mhdp.dev;
 	int ret;
 	unsigned long rate;
 
 	ret = clk_prepare_enable(dp->pclk);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dp->dev, "cannot enable dp pclk %d\n", ret);
+		DRM_DEV_ERROR(dev, "cannot enable dp pclk %d\n", ret);
 		goto err_pclk;
 	}
 
 	ret = clk_prepare_enable(dp->core_clk);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dp->dev, "cannot enable core_clk %d\n", ret);
+		DRM_DEV_ERROR(dev, "cannot enable core_clk %d\n", ret);
 		goto err_core_clk;
 	}
 
-	ret = pm_runtime_get_sync(dp->dev);
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dp->dev, "cannot get pm runtime %d\n", ret);
+		DRM_DEV_ERROR(dev, "cannot get pm runtime %d\n", ret);
 		goto err_pm_runtime_get;
 	}
 
@@ -112,18 +114,18 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
 
 	rate = clk_get_rate(dp->core_clk);
 	if (!rate) {
-		DRM_DEV_ERROR(dp->dev, "get clk rate failed\n");
+		DRM_DEV_ERROR(dev, "get clk rate failed\n");
 		ret = -EINVAL;
 		goto err_set_rate;
 	}
 
-	cdn_dp_set_fw_clk(dp, rate);
-	cdn_dp_clock_reset(dp);
+	cdns_mhdp_set_fw_clk(&dp->mhdp, rate);
+	cdns_mhdp_clock_reset(&dp->mhdp);
 
 	return 0;
 
 err_set_rate:
-	pm_runtime_put(dp->dev);
+	pm_runtime_put(dev);
 err_pm_runtime_get:
 	clk_disable_unprepare(dp->core_clk);
 err_core_clk:
@@ -134,7 +136,7 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
 
 static void cdn_dp_clk_disable(struct cdn_dp_device *dp)
 {
-	pm_runtime_put_sync(dp->dev);
+	pm_runtime_put_sync(dp->mhdp.dev);
 	clk_disable_unprepare(dp->pclk);
 	clk_disable_unprepare(dp->core_clk);
 }
@@ -167,7 +169,7 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
 	u8 value;
 
 	*sink_count = 0;
-	ret = cdn_dp_dpcd_read(dp, DP_SINK_COUNT, &value, 1);
+	ret = drm_dp_dpcd_read(&dp->mhdp.dp.aux, DP_SINK_COUNT, &value, 1);
 	if (ret)
 		return ret;
 
@@ -191,12 +193,13 @@ static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
 
 static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 {
+	struct device *dev = dp->mhdp.dev;
 	unsigned long timeout = jiffies + msecs_to_jiffies(CDN_DPCD_TIMEOUT_MS);
 	struct cdn_dp_port *port;
 	u8 sink_count = 0;
 
 	if (dp->active_port < 0 || dp->active_port >= dp->ports) {
-		DRM_DEV_ERROR(dp->dev, "active_port is wrong!\n");
+		DRM_DEV_ERROR(dev, "active_port is wrong!\n");
 		return false;
 	}
 
@@ -218,7 +221,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 		usleep_range(5000, 10000);
 	}
 
-	DRM_DEV_ERROR(dp->dev, "Get sink capability timed out\n");
+	DRM_DEV_ERROR(dev, "Get sink capability timed out\n");
 	return false;
 }
 
@@ -260,7 +263,8 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 	mutex_lock(&dp->lock);
 	edid = dp->edid;
 	if (edid) {
-		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
+		DRM_DEV_DEBUG_KMS(dp->mhdp.dev,
+				  "got edid: width[%d] x height[%d]\n",
 				  edid->width_cm, edid->height_cm);
 
 		dp->sink_has_audio = drm_detect_monitor_audio(edid);
@@ -278,7 +282,8 @@ static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
 				       struct drm_display_mode *mode)
 {
 	struct cdn_dp_device *dp = connector_to_dp(connector);
-	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct drm_display_info *display_info =
+		&dp->mhdp.connector.base.display_info;
 	u32 requested, actual, rate, sink_max, source_max = 0;
 	u8 lanes, bpc;
 
@@ -301,11 +306,11 @@ static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
 	requested = mode->clock * bpc * 3 / 1000;
 
 	source_max = dp->lanes;
-	sink_max = drm_dp_max_lane_count(dp->dpcd);
+	sink_max = drm_dp_max_lane_count(dp->mhdp.dp.dpcd);
 	lanes = min(source_max, sink_max);
 
-	source_max = drm_dp_bw_code_to_link_rate(CDN_DP_MAX_LINK_RATE);
-	sink_max = drm_dp_max_link_rate(dp->dpcd);
+	source_max = CDNS_DP_MAX_LINK_RATE;
+	sink_max = drm_dp_max_link_rate(dp->mhdp.dp.dpcd);
 	rate = min(source_max, sink_max);
 
 	actual = rate * lanes / 100;
@@ -314,7 +319,7 @@ static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
 	actual = actual * 8 / 10;
 
 	if (requested > actual) {
-		DRM_DEV_DEBUG_KMS(dp->dev,
+		DRM_DEV_DEBUG_KMS(dp->mhdp.dev,
 				  "requested=%d, actual=%d, clock=%d\n",
 				  requested, actual, mode->clock);
 		return MODE_CLOCK_HIGH;
@@ -334,59 +339,62 @@ static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
 	const u32 *iram_data, *dram_data;
 	const struct firmware *fw = dp->fw;
 	const struct cdn_firmware_header *hdr;
+	struct device *dev = dp->mhdp.dev;
 
 	hdr = (struct cdn_firmware_header *)fw->data;
 	if (fw->size != le32_to_cpu(hdr->size_bytes)) {
-		DRM_DEV_ERROR(dp->dev, "firmware is invalid\n");
+		DRM_DEV_ERROR(dev, "firmware is invalid\n");
 		return -EINVAL;
 	}
 
 	iram_data = (const u32 *)(fw->data + hdr->header_size);
 	dram_data = (const u32 *)(fw->data + hdr->header_size + hdr->iram_size);
 
-	ret = cdn_dp_load_firmware(dp, iram_data, hdr->iram_size,
-				   dram_data, hdr->dram_size);
+	ret = cdns_mhdp_load_firmware(&dp->mhdp, iram_data, hdr->iram_size,
+				      dram_data, hdr->dram_size);
 	if (ret)
 		return ret;
 
-	ret = cdn_dp_set_firmware_active(dp, true);
+	ret = cdns_mhdp_set_firmware_active(&dp->mhdp, true);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "active ucpu failed: %d\n", ret);
+		DRM_DEV_ERROR(dev, "active ucpu failed: %d\n", ret);
 		return ret;
 	}
 
-	return cdn_dp_event_config(dp);
+	return cdns_mhdp_event_config(&dp->mhdp);
 }
 
 static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 {
+	struct cdns_mhdp_device *mhdp = &dp->mhdp;
 	int ret;
 
 	if (!cdn_dp_check_sink_connection(dp))
 		return -ENODEV;
 
-	ret = cdn_dp_dpcd_read(dp, DP_DPCD_REV, dp->dpcd,
+	ret = drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV, mhdp->dp.dpcd,
 			       DP_RECEIVER_CAP_SIZE);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to get caps %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "Failed to get caps %d\n", ret);
 		return ret;
 	}
 
 	kfree(dp->edid);
-	dp->edid = drm_do_get_edid(&dp->connector,
-				   cdn_dp_get_edid_block, dp);
+	dp->edid = drm_do_get_edid(&mhdp->connector.base,
+				   cdns_mhdp_get_edid_block, mhdp);
 	return 0;
 }
 
 static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 {
+	struct device *dev = dp->mhdp.dev;
 	union extcon_property_value property;
 	int ret;
 
 	if (!port->phy_enabled) {
 		ret = phy_power_on(port->phy);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "phy power on failed: %d\n",
+			DRM_DEV_ERROR(dev, "phy power on failed: %d\n",
 				      ret);
 			goto err_phy;
 		}
@@ -396,28 +404,28 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 	ret = cdn_dp_grf_write(dp, GRF_SOC_CON26,
 			       DPTX_HPD_SEL_MASK | DPTX_HPD_SEL);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to write HPD_SEL %d\n", ret);
+		DRM_DEV_ERROR(dev, "Failed to write HPD_SEL %d\n", ret);
 		goto err_power_on;
 	}
 
-	ret = cdn_dp_get_hpd_status(dp);
+	ret = cdns_mhdp_read_hpd(&dp->mhdp);
 	if (ret <= 0) {
 		if (!ret)
-			DRM_DEV_ERROR(dp->dev, "hpd does not exist\n");
+			DRM_DEV_ERROR(dev, "hpd does not exist\n");
 		goto err_power_on;
 	}
 
 	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
 				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
+		DRM_DEV_ERROR(dev, "get property failed\n");
 		goto err_power_on;
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
-	ret = cdn_dp_set_host_cap(dp, port->lanes, property.intval);
+	ret = cdns_mhdp_set_host_cap(&dp->mhdp, property.intval);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "set host capabilities failed: %d\n",
+		DRM_DEV_ERROR(dev, "set host capabilities failed: %d\n",
 			      ret);
 		goto err_power_on;
 	}
@@ -427,7 +435,7 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 
 err_power_on:
 	if (phy_power_off(port->phy))
-		DRM_DEV_ERROR(dp->dev, "phy power off failed: %d", ret);
+		DRM_DEV_ERROR(dev, "phy power off failed: %d", ret);
 	else
 		port->phy_enabled = false;
 
@@ -445,7 +453,8 @@ static int cdn_dp_disable_phy(struct cdn_dp_device *dp,
 	if (port->phy_enabled) {
 		ret = phy_power_off(port->phy);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "phy power off failed: %d", ret);
+			DRM_DEV_ERROR(dp->mhdp.dev,
+				      "phy power off failed: %d", ret);
 			return ret;
 		}
 	}
@@ -469,16 +478,16 @@ static int cdn_dp_disable(struct cdn_dp_device *dp)
 	ret = cdn_dp_grf_write(dp, GRF_SOC_CON26,
 			       DPTX_HPD_SEL_MASK | DPTX_HPD_DEL);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to clear hpd sel %d\n",
+		DRM_DEV_ERROR(dp->mhdp.dev, "Failed to clear hpd sel %d\n",
 			      ret);
 		return ret;
 	}
 
-	cdn_dp_set_firmware_active(dp, false);
+	cdns_mhdp_set_firmware_active(&dp->mhdp, false);
 	cdn_dp_clk_disable(dp);
 	dp->active = false;
-	dp->max_lanes = 0;
-	dp->max_rate = 0;
+	dp->mhdp.dp.rate = 0;
+	dp->mhdp.dp.num_lanes = 0;
 	if (!dp->connected) {
 		kfree(dp->edid);
 		dp->edid = NULL;
@@ -491,11 +500,11 @@ static int cdn_dp_enable(struct cdn_dp_device *dp)
 {
 	int ret, i, lanes;
 	struct cdn_dp_port *port;
+	struct device *dev = dp->mhdp.dev;
 
 	port = cdn_dp_connected_port(dp);
 	if (!port) {
-		DRM_DEV_ERROR(dp->dev,
-			      "Can't enable without connection\n");
+		DRM_DEV_ERROR(dev, "Can't enable without connection\n");
 		return -ENODEV;
 	}
 
@@ -508,7 +517,7 @@ static int cdn_dp_enable(struct cdn_dp_device *dp)
 
 	ret = cdn_dp_firmware_init(dp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "firmware init failed: %d", ret);
+		DRM_DEV_ERROR(dp->mhdp.dev, "firmware init failed: %d", ret);
 		goto err_clk_disable;
 	}
 
@@ -542,8 +551,9 @@ static void cdn_dp_encoder_mode_set(struct drm_encoder *encoder,
 				    struct drm_display_mode *adjusted)
 {
 	struct cdn_dp_device *dp = encoder_to_dp(encoder);
-	struct drm_display_info *display_info = &dp->connector.display_info;
-	struct video_info *video = &dp->video_info;
+	struct drm_display_info *display_info =
+		&dp->mhdp.connector.base.display_info;
+	struct video_info *video = &dp->mhdp.video_info;
 
 	switch (display_info->bpc) {
 	case 10:
@@ -561,20 +571,20 @@ static void cdn_dp_encoder_mode_set(struct drm_encoder *encoder,
 	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
 	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
 
-	memcpy(&dp->mode, adjusted, sizeof(*mode));
+	memcpy(&dp->mhdp.mode, adjusted, sizeof(*mode));
 }
 
 static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
 {
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	struct cdn_dp_port *port = cdn_dp_connected_port(dp);
-	u8 sink_lanes = drm_dp_max_lane_count(dp->dpcd);
+	u8 sink_lanes = drm_dp_max_lane_count(dp->mhdp.dp.dpcd);
 
-	if (!port || !dp->max_rate || !dp->max_lanes)
+	if (!port || !dp->mhdp.dp.rate || !dp->mhdp.dp.num_lanes)
 		return false;
 
-	if (cdn_dp_dpcd_read(dp, DP_LANE0_1_STATUS, link_status,
-			     DP_LINK_STATUS_SIZE)) {
+	if (drm_dp_dpcd_read(&dp->mhdp.dp.aux, DP_LANE0_1_STATUS, link_status,
+				DP_LINK_STATUS_SIZE)) {
 		DRM_ERROR("Failed to get link status\n");
 		return false;
 	}
@@ -586,15 +596,16 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
 static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 {
 	struct cdn_dp_device *dp = encoder_to_dp(encoder);
+	struct device *dev = dp->mhdp.dev;
 	int ret, val;
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	ret = drm_of_encoder_active_endpoint_id(dev->of_node, encoder);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
+		DRM_DEV_ERROR(dev, "Could not get vop id, %d", ret);
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dp->dev, "vop %s output to cdn-dp\n",
+	DRM_DEV_DEBUG_KMS(dev, "vop %s output to cdn-dp\n",
 			  (ret) ? "LIT" : "BIG");
 	if (ret)
 		val = DP_SEL_VOP_LIT | (DP_SEL_VOP_LIT << 16);
@@ -609,33 +620,33 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 
 	ret = cdn_dp_enable(dp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to enable encoder %d\n",
+		DRM_DEV_ERROR(dev, "Failed to enable encoder %d\n",
 			      ret);
 		goto out;
 	}
 	if (!cdn_dp_check_link_status(dp)) {
-		ret = cdn_dp_train_link(dp);
+		ret = cdns_mhdp_train_link(&dp->mhdp);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "Failed link train %d\n", ret);
+			DRM_DEV_ERROR(dev, "Failed link train %d\n", ret);
 			goto out;
 		}
 	}
 
-	ret = cdn_dp_set_video_status(dp, CONTROL_VIDEO_IDLE);
+	ret = cdns_mhdp_set_video_status(&dp->mhdp, CONTROL_VIDEO_IDLE);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to idle video %d\n", ret);
+		DRM_DEV_ERROR(dev, "Failed to idle video %d\n", ret);
 		goto out;
 	}
 
-	ret = cdn_dp_config_video(dp);
+	ret = cdns_mhdp_config_video(&dp->mhdp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to config video %d\n", ret);
+		DRM_DEV_ERROR(dev, "Failed to config video %d\n", ret);
 		goto out;
 	}
 
-	ret = cdn_dp_set_video_status(dp, CONTROL_VIDEO_VALID);
+	ret = cdns_mhdp_set_video_status(&dp->mhdp, CONTROL_VIDEO_VALID);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to valid video %d\n", ret);
+		DRM_DEV_ERROR(dev, "Failed to valid video %d\n", ret);
 		goto out;
 	}
 out:
@@ -651,7 +662,8 @@ static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "Failed to disable encoder %d\n",
+			DRM_DEV_ERROR(dp->mhdp.dev,
+				      "Failed to disable encoder %d\n",
 				      ret);
 		}
 	}
@@ -695,7 +707,7 @@ static const struct drm_encoder_funcs cdn_dp_encoder_funcs = {
 
 static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 {
-	struct device *dev = dp->dev;
+	struct device *dev = dp->mhdp.dev;
 	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *res;
@@ -707,10 +719,10 @@ static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dp->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(dp->regs)) {
+	dp->mhdp.regs_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(dp->mhdp.regs_base)) {
 		DRM_DEV_ERROR(dev, "ioremap reg failed\n");
-		return PTR_ERR(dp->regs);
+		return PTR_ERR(dp->mhdp.regs_base);
 	}
 
 	dp->core_clk = devm_clk_get(dev, "core-clk");
@@ -725,10 +737,10 @@ static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 		return PTR_ERR(dp->pclk);
 	}
 
-	dp->spdif_clk = devm_clk_get(dev, "spdif");
-	if (IS_ERR(dp->spdif_clk)) {
+	dp->mhdp.spdif_clk = devm_clk_get(dev, "spdif");
+	if (IS_ERR(dp->mhdp.spdif_clk)) {
 		DRM_DEV_ERROR(dev, "cannot get spdif_clk\n");
-		return PTR_ERR(dp->spdif_clk);
+		return PTR_ERR(dp->mhdp.spdif_clk);
 	}
 
 	dp->grf_clk = devm_clk_get(dev, "grf");
@@ -737,10 +749,10 @@ static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 		return PTR_ERR(dp->grf_clk);
 	}
 
-	dp->spdif_rst = devm_reset_control_get(dev, "spdif");
-	if (IS_ERR(dp->spdif_rst)) {
+	dp->mhdp.spdif_rst = devm_reset_control_get(dev, "spdif");
+	if (IS_ERR(dp->mhdp.spdif_rst)) {
 		DRM_DEV_ERROR(dev, "no spdif reset control found\n");
-		return PTR_ERR(dp->spdif_rst);
+		return PTR_ERR(dp->mhdp.spdif_rst);
 	}
 
 	dp->dptx_rst = devm_reset_control_get(dev, "dptx");
@@ -787,7 +799,7 @@ static int cdn_dp_audio_hw_params(struct device *dev,  void *data,
 		audio.format = AFMT_I2S;
 		break;
 	case HDMI_SPDIF:
-		audio.format = AFMT_SPDIF;
+		audio.format = AFMT_SPDIF_INT;
 		break;
 	default:
 		DRM_DEV_ERROR(dev, "Invalid format %d\n", daifmt->fmt);
@@ -795,9 +807,9 @@ static int cdn_dp_audio_hw_params(struct device *dev,  void *data,
 		goto out;
 	}
 
-	ret = cdn_dp_audio_config(dp, &audio);
+	ret = cdns_mhdp_audio_config(&dp->mhdp, &audio);
 	if (!ret)
-		dp->audio_info = audio;
+		dp->mhdp.audio_info = audio;
 
 out:
 	mutex_unlock(&dp->lock);
@@ -813,9 +825,9 @@ static void cdn_dp_audio_shutdown(struct device *dev, void *data)
 	if (!dp->active)
 		goto out;
 
-	ret = cdn_dp_audio_stop(dp, &dp->audio_info);
+	ret = cdns_mhdp_audio_stop(&dp->mhdp, &dp->mhdp.audio_info);
 	if (!ret)
-		dp->audio_info.format = AFMT_UNUSED;
+		dp->mhdp.audio_info.format = AFMT_UNUSED;
 out:
 	mutex_unlock(&dp->lock);
 }
@@ -832,7 +844,7 @@ static int cdn_dp_audio_digital_mute(struct device *dev, void *data,
 		goto out;
 	}
 
-	ret = cdn_dp_audio_mute(dp, enable);
+	ret = cdns_mhdp_audio_mute(&dp->mhdp, enable);
 
 out:
 	mutex_unlock(&dp->lock);
@@ -844,7 +856,8 @@ static int cdn_dp_audio_get_eld(struct device *dev, void *data,
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 
-	memcpy(buf, dp->connector.eld, min(sizeof(dp->connector.eld), len));
+	memcpy(buf, dp->mhdp.connector.base.eld,
+	       min(sizeof(dp->mhdp.connector.base.eld), len));
 
 	return 0;
 }
@@ -866,11 +879,11 @@ static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
 		.max_i2s_channels = 8,
 	};
 
-	dp->audio_pdev = platform_device_register_data(
-			 dev, HDMI_CODEC_DRV_NAME, PLATFORM_DEVID_AUTO,
-			 &codec_data, sizeof(codec_data));
+	dp->mhdp.audio_pdev = platform_device_register_data(
+			      dev, HDMI_CODEC_DRV_NAME, PLATFORM_DEVID_AUTO,
+			      &codec_data, sizeof(codec_data));
 
-	return PTR_ERR_OR_ZERO(dp->audio_pdev);
+	return PTR_ERR_OR_ZERO(dp->mhdp.audio_pdev);
 }
 
 static int cdn_dp_request_firmware(struct cdn_dp_device *dp)
@@ -878,6 +891,7 @@ static int cdn_dp_request_firmware(struct cdn_dp_device *dp)
 	int ret;
 	unsigned long timeout = jiffies + msecs_to_jiffies(CDN_FW_TIMEOUT_MS);
 	unsigned long sleep = 1000;
+	struct device *dev = dp->mhdp.dev;
 
 	WARN_ON(!mutex_is_locked(&dp->lock));
 
@@ -888,13 +902,13 @@ static int cdn_dp_request_firmware(struct cdn_dp_device *dp)
 	mutex_unlock(&dp->lock);
 
 	while (time_before(jiffies, timeout)) {
-		ret = request_firmware(&dp->fw, CDN_DP_FIRMWARE, dp->dev);
+		ret = request_firmware(&dp->fw, CDN_DP_FIRMWARE, dev);
 		if (ret == -ENOENT) {
 			msleep(sleep);
 			sleep *= 2;
 			continue;
 		} else if (ret) {
-			DRM_DEV_ERROR(dp->dev,
+			DRM_DEV_ERROR(dev,
 				      "failed to request firmware: %d\n", ret);
 			goto out;
 		}
@@ -904,7 +918,7 @@ static int cdn_dp_request_firmware(struct cdn_dp_device *dp)
 		goto out;
 	}
 
-	DRM_DEV_ERROR(dp->dev, "Timed out trying to load firmware\n");
+	DRM_DEV_ERROR(dev, "Timed out trying to load firmware\n");
 	ret = -ETIMEDOUT;
 out:
 	mutex_lock(&dp->lock);
@@ -915,8 +929,9 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	struct drm_connector *connector = &dp->connector;
+	struct drm_connector *connector = &dp->mhdp.connector.base;
 	enum drm_connector_status old_status;
+	struct device *dev = dp->mhdp.dev;
 
 	int ret;
 
@@ -933,44 +948,45 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 	/* Not connected, notify userspace to disable the block */
 	if (!cdn_dp_connected_port(dp)) {
-		DRM_DEV_INFO(dp->dev, "Not connected. Disabling cdn\n");
+		DRM_DEV_INFO(dev, "Not connected. Disabling cdn\n");
 		dp->connected = false;
 
 	/* Connected but not enabled, enable the block */
 	} else if (!dp->active) {
-		DRM_DEV_INFO(dp->dev, "Connected, not enabled. Enabling cdn\n");
+		DRM_DEV_INFO(dev, "Connected, not enabled. Enabling cdn\n");
 		ret = cdn_dp_enable(dp);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "Enable dp failed %d\n", ret);
+			DRM_DEV_ERROR(dev, "Enable dp failed %d\n", ret);
 			dp->connected = false;
 		}
 
 	/* Enabled and connected to a dongle without a sink, notify userspace */
 	} else if (!cdn_dp_check_sink_connection(dp)) {
-		DRM_DEV_INFO(dp->dev, "Connected without sink. Assert hpd\n");
+		DRM_DEV_INFO(dev, "Connected without sink. Assert hpd\n");
 		dp->connected = false;
 
 	/* Enabled and connected with a sink, re-train if requested */
 	} else if (!cdn_dp_check_link_status(dp)) {
-		unsigned int rate = dp->max_rate;
-		unsigned int lanes = dp->max_lanes;
-		struct drm_display_mode *mode = &dp->mode;
+		unsigned int rate = dp->mhdp.dp.rate;
+		unsigned int lanes = dp->mhdp.dp.num_lanes;
+		struct drm_display_mode *mode = &dp->mhdp.mode;
 
-		DRM_DEV_INFO(dp->dev, "Connected with sink. Re-train link\n");
-		ret = cdn_dp_train_link(dp);
+		DRM_DEV_INFO(dev, "Connected with sink. Re-train link\n");
+		ret = cdns_mhdp_train_link(&dp->mhdp);
 		if (ret) {
 			dp->connected = false;
-			DRM_DEV_ERROR(dp->dev, "Train link failed %d\n", ret);
+			DRM_DEV_ERROR(dev, "Train link failed %d\n", ret);
 			goto out;
 		}
 
 		/* If training result is changed, update the video config */
 		if (mode->clock &&
-		    (rate != dp->max_rate || lanes != dp->max_lanes)) {
-			ret = cdn_dp_config_video(dp);
+		    (rate != dp->mhdp.dp.rate ||
+		     lanes != dp->mhdp.dp.num_lanes)) {
+			ret = cdns_mhdp_config_video(&dp->mhdp);
 			if (ret) {
 				dp->connected = false;
-				DRM_DEV_ERROR(dp->dev,
+				DRM_DEV_ERROR(dev,
 					      "Failed to config video %d\n",
 					      ret);
 			}
@@ -1039,7 +1055,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
 
-	connector = &dp->connector;
+	connector = &dp->mhdp.connector.base;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 	connector->dpms = DRM_MODE_DPMS_OFF;
 
@@ -1063,7 +1079,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 		port = dp->port[i];
 
 		port->event_nb.notifier_call = cdn_dp_pd_event;
-		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
+		ret = devm_extcon_register_notifier(dp->mhdp.dev, port->extcon,
 						    EXTCON_DISP_DP,
 						    &port->event_nb);
 		if (ret) {
@@ -1090,7 +1106,7 @@ static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dp->encoder;
-	struct drm_connector *connector = &dp->connector;
+	struct drm_connector *connector = &dp->mhdp.connector.base;
 
 	cancel_work_sync(&dp->event_work);
 	cdn_dp_encoder_disable(encoder);
@@ -1150,7 +1166,7 @@ static int cdn_dp_probe(struct platform_device *pdev)
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
-	dp->dev = dev;
+	dp->mhdp.dev = dev;
 
 	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
 	dp_data = (struct cdn_dp_data *)match->data;
@@ -1194,8 +1210,8 @@ static int cdn_dp_remove(struct platform_device *pdev)
 {
 	struct cdn_dp_device *dp = platform_get_drvdata(pdev);
 
-	platform_device_unregister(dp->audio_pdev);
-	cdn_dp_suspend(dp->dev);
+	platform_device_unregister(dp->mhdp.audio_pdev);
+	cdn_dp_suspend(dp->mhdp.dev);
 	component_del(&pdev->dev, &cdn_dp_component_ops);
 
 	return 0;
@@ -1205,7 +1221,7 @@ static void cdn_dp_shutdown(struct platform_device *pdev)
 {
 	struct cdn_dp_device *dp = platform_get_drvdata(pdev);
 
-	cdn_dp_suspend(dp->dev);
+	cdn_dp_suspend(dp->mhdp.dev);
 }
 
 static const struct dev_pm_ops cdn_dp_pm_ops = {
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 81ac9b658a70..d5dcb75b2398 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -11,39 +11,11 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
+#include "cdn-dp-reg.h"
 #include "rockchip_drm_drv.h"
 
 #define MAX_PHY		2
 
-enum audio_format {
-	AFMT_I2S = 0,
-	AFMT_SPDIF = 1,
-	AFMT_UNUSED,
-};
-
-struct audio_info {
-	enum audio_format format;
-	int sample_rate;
-	int channels;
-	int sample_width;
-};
-
-enum vic_pxl_encoding_format {
-	PXL_RGB = 0x1,
-	YCBCR_4_4_4 = 0x2,
-	YCBCR_4_2_2 = 0x4,
-	YCBCR_4_2_0 = 0x8,
-	Y_ONLY = 0x10,
-};
-
-struct video_info {
-	bool h_sync_polarity;
-	bool v_sync_polarity;
-	bool interlaced;
-	int color_depth;
-	enum vic_pxl_encoding_format color_fmt;
-};
-
 struct cdn_firmware_header {
 	u32 size_bytes; /* size of the entire header+image(s) in bytes */
 	u32 header_size; /* size of just the header in bytes */
@@ -62,12 +34,9 @@ struct cdn_dp_port {
 };
 
 struct cdn_dp_device {
-	struct device *dev;
+	struct cdns_mhdp_device mhdp;
 	struct drm_device *drm_dev;
-	struct drm_connector connector;
 	struct drm_encoder encoder;
-	struct drm_display_mode mode;
-	struct platform_device *audio_pdev;
 	struct work_struct event_work;
 	struct edid *edid;
 
@@ -77,29 +46,20 @@ struct cdn_dp_device {
 	bool suspended;
 
 	const struct firmware *fw;	/* cdn dp firmware */
-	unsigned int fw_version;	/* cdn fw version */
 	bool fw_loaded;
 
-	void __iomem *regs;
 	struct regmap *grf;
 	struct clk *core_clk;
 	struct clk *pclk;
-	struct clk *spdif_clk;
 	struct clk *grf_clk;
-	struct reset_control *spdif_rst;
 	struct reset_control *dptx_rst;
 	struct reset_control *apb_rst;
 	struct reset_control *core_rst;
-	struct audio_info audio_info;
-	struct video_info video_info;
 	struct cdn_dp_port *port[MAX_PHY];
 	u8 ports;
-	u8 max_lanes;
-	unsigned int max_rate;
 	u8 lanes;
 	int active_port;
 
-	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	bool sink_has_audio;
 };
 #endif  /* _CDN_DP_CORE_H */
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
index 7361c07cb4a7..f7ccf93fe5e1 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
@@ -4,6 +4,7 @@
  * Author: Chris Zhong <zyw@rock-chips.com>
  */
 
+#include <asm/unaligned.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/delay.h>
@@ -14,19 +15,29 @@
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
-#define CDN_DP_SPDIF_CLK		200000000
+#define CDNS_DP_SPDIF_CLK		200000000
 #define FW_ALIVE_TIMEOUT_US		1000000
 #define MAILBOX_RETRY_US		1000
 #define MAILBOX_TIMEOUT_US		5000000
 #define LINK_TRAINING_RETRY_MS		20
 #define LINK_TRAINING_TIMEOUT_MS	500
 
-void cdn_dp_set_fw_clk(struct cdn_dp_device *dp, unsigned long clk)
+u32 cdns_mhdp_bus_read(struct cdns_mhdp_device *mhdp, u32 offset)
 {
-	writel(clk / 1000000, dp->regs + SW_CLK_H);
+	return readl(mhdp->regs_base + offset);
 }
 
-void cdn_dp_clock_reset(struct cdn_dp_device *dp)
+void cdns_mhdp_bus_write(u32 val, struct cdns_mhdp_device *mhdp, u32 offset)
+{
+	writel(val, mhdp->regs_base + offset);
+}
+
+void cdns_mhdp_set_fw_clk(struct cdns_mhdp_device *mhdp, unsigned long clk)
+{
+	cdns_mhdp_bus_write(clk / 1000000, mhdp, SW_CLK_H);
+}
+
+void cdns_mhdp_clock_reset(struct cdns_mhdp_device *mhdp)
 {
 	u32 val;
 
@@ -42,16 +53,16 @@ void cdn_dp_clock_reset(struct cdn_dp_device *dp)
 	      DPTX_SYS_CLK_EN |
 	      CFG_DPTX_VIF_CLK_RSTN_EN |
 	      CFG_DPTX_VIF_CLK_EN;
-	writel(val, dp->regs + SOURCE_DPTX_CAR);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_DPTX_CAR);
 
 	val = SOURCE_PHY_RSTN_EN | SOURCE_PHY_CLK_EN;
-	writel(val, dp->regs + SOURCE_PHY_CAR);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_PHY_CAR);
 
 	val = SOURCE_PKT_SYS_RSTN_EN |
 	      SOURCE_PKT_SYS_CLK_EN |
 	      SOURCE_PKT_DATA_RSTN_EN |
 	      SOURCE_PKT_DATA_CLK_EN;
-	writel(val, dp->regs + SOURCE_PKT_CAR);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_PKT_CAR);
 
 	val = SPDIF_CDR_CLK_RSTN_EN |
 	      SPDIF_CDR_CLK_EN |
@@ -59,53 +70,52 @@ void cdn_dp_clock_reset(struct cdn_dp_device *dp)
 	      SOURCE_AIF_SYS_CLK_EN |
 	      SOURCE_AIF_CLK_RSTN_EN |
 	      SOURCE_AIF_CLK_EN;
-	writel(val, dp->regs + SOURCE_AIF_CAR);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_AIF_CAR);
 
 	val = SOURCE_CIPHER_SYSTEM_CLK_RSTN_EN |
 	      SOURCE_CIPHER_SYS_CLK_EN |
 	      SOURCE_CIPHER_CHAR_CLK_RSTN_EN |
 	      SOURCE_CIPHER_CHAR_CLK_EN;
-	writel(val, dp->regs + SOURCE_CIPHER_CAR);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_CIPHER_CAR);
 
 	val = SOURCE_CRYPTO_SYS_CLK_RSTN_EN |
 	      SOURCE_CRYPTO_SYS_CLK_EN;
-	writel(val, dp->regs + SOURCE_CRYPTO_CAR);
+	cdns_mhdp_bus_write(val, mhdp, SOURCE_CRYPTO_CAR);
 
 	/* enable Mailbox and PIF interrupt */
-	writel(0, dp->regs + APB_INT_MASK);
+	cdns_mhdp_bus_write(0, mhdp, APB_INT_MASK);
 }
 
-static int cdn_dp_mailbox_read(struct cdn_dp_device *dp)
+static int mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
 	int val, ret;
 
-	ret = readx_poll_timeout(readl, dp->regs + MAILBOX_EMPTY_ADDR,
+	ret = readx_poll_timeout(readl, mhdp->regs_base + MAILBOX_EMPTY_ADDR,
 				 val, !val, MAILBOX_RETRY_US,
 				 MAILBOX_TIMEOUT_US);
 	if (ret < 0)
 		return ret;
 
-	return readl(dp->regs + MAILBOX0_RD_DATA) & 0xff;
+	return cdns_mhdp_bus_read(mhdp, MAILBOX0_RD_DATA) & 0xff;
 }
 
-static int cdp_dp_mailbox_write(struct cdn_dp_device *dp, u8 val)
+static int mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
 {
 	int ret, full;
 
-	ret = readx_poll_timeout(readl, dp->regs + MAILBOX_FULL_ADDR,
+	ret = readx_poll_timeout(readl, mhdp->regs_base + MAILBOX_FULL_ADDR,
 				 full, !full, MAILBOX_RETRY_US,
 				 MAILBOX_TIMEOUT_US);
 	if (ret < 0)
 		return ret;
 
-	writel(val, dp->regs + MAILBOX0_WR_DATA);
+	cdns_mhdp_bus_write(val, mhdp, MAILBOX0_WR_DATA);
 
 	return 0;
 }
 
-static int cdn_dp_mailbox_validate_receive(struct cdn_dp_device *dp,
-					   u8 module_id, u8 opcode,
-					   u16 req_size)
+int cdns_mhdp_mailbox_validate_receive(struct cdns_mhdp_device *mhdp,
+					      u8 module_id, u8 opcode, u16 req_size)
 {
 	u32 mbox_size, i;
 	u8 header[4];
@@ -113,14 +123,14 @@ static int cdn_dp_mailbox_validate_receive(struct cdn_dp_device *dp,
 
 	/* read the header of the message */
 	for (i = 0; i < 4; i++) {
-		ret = cdn_dp_mailbox_read(dp);
+		ret = mhdp_mailbox_read(mhdp);
 		if (ret < 0)
 			return ret;
 
 		header[i] = ret;
 	}
 
-	mbox_size = (header[2] << 8) | header[3];
+	mbox_size = get_unaligned_be16(header + 2);
 
 	if (opcode != header[0] || module_id != header[1] ||
 	    req_size != mbox_size) {
@@ -129,7 +139,7 @@ static int cdn_dp_mailbox_validate_receive(struct cdn_dp_device *dp,
 		 * clear the mailbox by reading its contents.
 		 */
 		for (i = 0; i < mbox_size; i++)
-			if (cdn_dp_mailbox_read(dp) < 0)
+			if (mhdp_mailbox_read(mhdp) < 0)
 				break;
 
 		return -EINVAL;
@@ -138,14 +148,14 @@ static int cdn_dp_mailbox_validate_receive(struct cdn_dp_device *dp,
 	return 0;
 }
 
-static int cdn_dp_mailbox_read_receive(struct cdn_dp_device *dp,
-				       u8 *buff, u16 buff_size)
+int cdns_mhdp_mailbox_read_receive(struct cdns_mhdp_device *mhdp,
+					  u8 *buff, u16 buff_size)
 {
 	u32 i;
 	int ret;
 
 	for (i = 0; i < buff_size; i++) {
-		ret = cdn_dp_mailbox_read(dp);
+		ret = mhdp_mailbox_read(mhdp);
 		if (ret < 0)
 			return ret;
 
@@ -155,25 +165,24 @@ static int cdn_dp_mailbox_read_receive(struct cdn_dp_device *dp,
 	return 0;
 }
 
-static int cdn_dp_mailbox_send(struct cdn_dp_device *dp, u8 module_id,
-			       u8 opcode, u16 size, u8 *message)
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
+				  u8 opcode, u16 size, u8 *message)
 {
 	u8 header[4];
 	int ret, i;
 
 	header[0] = opcode;
 	header[1] = module_id;
-	header[2] = (size >> 8) & 0xff;
-	header[3] = size & 0xff;
+	put_unaligned_be16(size, header + 2);
 
 	for (i = 0; i < 4; i++) {
-		ret = cdp_dp_mailbox_write(dp, header[i]);
+		ret = mhdp_mailbox_write(mhdp, header[i]);
 		if (ret)
 			return ret;
 	}
 
 	for (i = 0; i < size; i++) {
-		ret = cdp_dp_mailbox_write(dp, message[i]);
+		ret = mhdp_mailbox_write(mhdp, message[i]);
 		if (ret)
 			return ret;
 	}
@@ -181,146 +190,136 @@ static int cdn_dp_mailbox_send(struct cdn_dp_device *dp, u8 module_id,
 	return 0;
 }
 
-static int cdn_dp_reg_write(struct cdn_dp_device *dp, u16 addr, u32 val)
+int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u32 addr, u32 val)
 {
-	u8 msg[6];
-
-	msg[0] = (addr >> 8) & 0xff;
-	msg[1] = addr & 0xff;
-	msg[2] = (val >> 24) & 0xff;
-	msg[3] = (val >> 16) & 0xff;
-	msg[4] = (val >> 8) & 0xff;
-	msg[5] = val & 0xff;
-	return cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_WRITE_REGISTER,
-				   sizeof(msg), msg);
+	u8 msg[8];
+
+	put_unaligned_be32(addr, msg);
+	put_unaligned_be32(val, msg + 4);
+
+	return cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
+				      GENERAL_WRITE_REGISTER, sizeof(msg), msg);
 }
 
-static int cdn_dp_reg_write_bit(struct cdn_dp_device *dp, u16 addr,
-				u8 start_bit, u8 bits_no, u32 val)
+int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
+				   u8 start_bit, u8 bits_no, u32 val)
 {
 	u8 field[8];
 
-	field[0] = (addr >> 8) & 0xff;
-	field[1] = addr & 0xff;
+	put_unaligned_be16(addr, field);
 	field[2] = start_bit;
 	field[3] = bits_no;
-	field[4] = (val >> 24) & 0xff;
-	field[5] = (val >> 16) & 0xff;
-	field[6] = (val >> 8) & 0xff;
-	field[7] = val & 0xff;
+	put_unaligned_be32(val, field + 4);
 
-	return cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_WRITE_FIELD,
-				   sizeof(field), field);
+	return cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				      DPTX_WRITE_FIELD, sizeof(field), field);
 }
 
-int cdn_dp_dpcd_read(struct cdn_dp_device *dp, u32 addr, u8 *data, u16 len)
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
+			u32 addr, u8 *data, u16 len)
 {
 	u8 msg[5], reg[5];
 	int ret;
 
-	msg[0] = (len >> 8) & 0xff;
-	msg[1] = len & 0xff;
-	msg[2] = (addr >> 16) & 0xff;
-	msg[3] = (addr >> 8) & 0xff;
-	msg[4] = addr & 0xff;
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_READ_DPCD,
-				  sizeof(msg), msg);
+	put_unaligned_be16(len, msg);
+	put_unaligned_be24(addr, msg + 2);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_READ_DPCD, sizeof(msg), msg);
 	if (ret)
 		goto err_dpcd_read;
 
-	ret = cdn_dp_mailbox_validate_receive(dp, MB_MODULE_ID_DP_TX,
-					      DPTX_READ_DPCD,
-					      sizeof(reg) + len);
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
+						 DPTX_READ_DPCD,
+						 sizeof(reg) + len);
 	if (ret)
 		goto err_dpcd_read;
 
-	ret = cdn_dp_mailbox_read_receive(dp, reg, sizeof(reg));
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
 	if (ret)
 		goto err_dpcd_read;
 
-	ret = cdn_dp_mailbox_read_receive(dp, data, len);
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, data, len);
 
 err_dpcd_read:
 	return ret;
 }
 
-int cdn_dp_dpcd_write(struct cdn_dp_device *dp, u32 addr, u8 value)
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value)
 {
 	u8 msg[6], reg[5];
 	int ret;
 
-	msg[0] = 0;
-	msg[1] = 1;
-	msg[2] = (addr >> 16) & 0xff;
-	msg[3] = (addr >> 8) & 0xff;
-	msg[4] = addr & 0xff;
+	put_unaligned_be16(1, msg);
+	put_unaligned_be24(addr, msg + 2);
 	msg[5] = value;
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_WRITE_DPCD,
-				  sizeof(msg), msg);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_DPCD, sizeof(msg), msg);
 	if (ret)
 		goto err_dpcd_write;
 
-	ret = cdn_dp_mailbox_validate_receive(dp, MB_MODULE_ID_DP_TX,
-					      DPTX_WRITE_DPCD, sizeof(reg));
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
+						 DPTX_WRITE_DPCD, sizeof(reg));
 	if (ret)
 		goto err_dpcd_write;
 
-	ret = cdn_dp_mailbox_read_receive(dp, reg, sizeof(reg));
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
 	if (ret)
 		goto err_dpcd_write;
 
-	if (addr != (reg[2] << 16 | reg[3] << 8 | reg[4]))
+	if (addr != get_unaligned_be24(reg + 2))
 		ret = -EINVAL;
 
 err_dpcd_write:
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "dpcd write failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "dpcd write failed: %d\n", ret);
 	return ret;
 }
 
-int cdn_dp_load_firmware(struct cdn_dp_device *dp, const u32 *i_mem,
-			 u32 i_size, const u32 *d_mem, u32 d_size)
+int cdns_mhdp_load_firmware(struct cdns_mhdp_device *mhdp, const u32 *i_mem,
+			    u32 i_size, const u32 *d_mem, u32 d_size)
 {
 	u32 reg;
 	int i, ret;
 
 	/* reset ucpu before load firmware*/
-	writel(APB_IRAM_PATH | APB_DRAM_PATH | APB_XT_RESET,
-	       dp->regs + APB_CTRL);
+	cdns_mhdp_bus_write(APB_IRAM_PATH | APB_DRAM_PATH | APB_XT_RESET,
+	       mhdp, APB_CTRL);
 
 	for (i = 0; i < i_size; i += 4)
-		writel(*i_mem++, dp->regs + ADDR_IMEM + i);
+		cdns_mhdp_bus_write(*i_mem++, mhdp, ADDR_IMEM + i);
 
 	for (i = 0; i < d_size; i += 4)
-		writel(*d_mem++, dp->regs + ADDR_DMEM + i);
+		cdns_mhdp_bus_write(*d_mem++, mhdp, ADDR_DMEM + i);
 
 	/* un-reset ucpu */
-	writel(0, dp->regs + APB_CTRL);
+	cdns_mhdp_bus_write(0, mhdp, APB_CTRL);
 
 	/* check the keep alive register to make sure fw working */
-	ret = readx_poll_timeout(readl, dp->regs + KEEP_ALIVE,
+	ret = readx_poll_timeout(readl, mhdp->regs_base + KEEP_ALIVE,
 				 reg, reg, 2000, FW_ALIVE_TIMEOUT_US);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dp->dev, "failed to loaded the FW reg = %x\n",
+		DRM_DEV_ERROR(mhdp->dev, "failed to loaded the FW reg = %x\n",
 			      reg);
 		return -EINVAL;
 	}
 
-	reg = readl(dp->regs + VER_L) & 0xff;
-	dp->fw_version = reg;
-	reg = readl(dp->regs + VER_H) & 0xff;
-	dp->fw_version |= reg << 8;
-	reg = readl(dp->regs + VER_LIB_L_ADDR) & 0xff;
-	dp->fw_version |= reg << 16;
-	reg = readl(dp->regs + VER_LIB_H_ADDR) & 0xff;
-	dp->fw_version |= reg << 24;
+	reg = cdns_mhdp_bus_read(mhdp, VER_L) & 0xff;
+	mhdp->fw_version = reg;
+	reg = cdns_mhdp_bus_read(mhdp, VER_H) & 0xff;
+	mhdp->fw_version |= reg << 8;
+	reg = cdns_mhdp_bus_read(mhdp, VER_LIB_L_ADDR) & 0xff;
+	mhdp->fw_version |= reg << 16;
+	reg = cdns_mhdp_bus_read(mhdp, VER_LIB_H_ADDR) & 0xff;
+	mhdp->fw_version |= reg << 24;
 
-	DRM_DEV_DEBUG(dp->dev, "firmware version: %x\n", dp->fw_version);
+	DRM_DEV_DEBUG(mhdp->dev, "firmware version: %x\n", mhdp->fw_version);
 
 	return 0;
 }
 
-int cdn_dp_set_firmware_active(struct cdn_dp_device *dp, bool enable)
+int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
 {
 	u8 msg[5];
 	int ret, i;
@@ -332,14 +331,14 @@ int cdn_dp_set_firmware_active(struct cdn_dp_device *dp, bool enable)
 	msg[4] = enable ? FW_ACTIVE : FW_STANDBY;
 
 	for (i = 0; i < sizeof(msg); i++) {
-		ret = cdp_dp_mailbox_write(dp, msg[i]);
+		ret = mhdp_mailbox_write(mhdp, msg[i]);
 		if (ret)
 			goto err_set_firmware_active;
 	}
 
 	/* read the firmware state */
 	for (i = 0; i < sizeof(msg); i++)  {
-		ret = cdn_dp_mailbox_read(dp);
+		ret = mhdp_mailbox_read(mhdp);
 		if (ret < 0)
 			goto err_set_firmware_active;
 
@@ -350,17 +349,17 @@ int cdn_dp_set_firmware_active(struct cdn_dp_device *dp, bool enable)
 
 err_set_firmware_active:
 	if (ret < 0)
-		DRM_DEV_ERROR(dp->dev, "set firmware active failed\n");
+		DRM_DEV_ERROR(mhdp->dev, "set firmware active failed\n");
 	return ret;
 }
 
-int cdn_dp_set_host_cap(struct cdn_dp_device *dp, u8 lanes, bool flip)
+int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp, bool flip)
 {
 	u8 msg[8];
 	int ret;
 
-	msg[0] = CDN_DP_MAX_LINK_RATE;
-	msg[1] = lanes | SCRAMBLER_EN;
+	msg[0] = drm_dp_link_rate_to_bw_code(mhdp->dp.rate);
+	msg[1] = mhdp->dp.num_lanes | SCRAMBLER_EN;
 	msg[2] = VOLTAGE_LEVEL_2;
 	msg[3] = PRE_EMPHASIS_LEVEL_3;
 	msg[4] = PTS1 | PTS2 | PTS3 | PTS4;
@@ -368,73 +367,73 @@ int cdn_dp_set_host_cap(struct cdn_dp_device *dp, u8 lanes, bool flip)
 	msg[6] = flip ? LANE_MAPPING_FLIPPED : LANE_MAPPING_NORMAL;
 	msg[7] = ENHANCED;
 
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX,
-				  DPTX_SET_HOST_CAPABILITIES,
-				  sizeof(msg), msg);
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_SET_HOST_CAPABILITIES,
+				     sizeof(msg), msg);
 	if (ret)
 		goto err_set_host_cap;
 
-	ret = cdn_dp_reg_write(dp, DP_AUX_SWAP_INVERSION_CONTROL,
-			       AUX_HOST_INVERT);
+	ret = cdns_mhdp_reg_write(mhdp, DP_AUX_SWAP_INVERSION_CONTROL,
+					AUX_HOST_INVERT);
 
 err_set_host_cap:
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "set host cap failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "set host cap failed: %d\n", ret);
 	return ret;
 }
 
-int cdn_dp_event_config(struct cdn_dp_device *dp)
+int cdns_mhdp_event_config(struct cdns_mhdp_device *mhdp)
 {
 	u8 msg[5];
 	int ret;
 
 	memset(msg, 0, sizeof(msg));
 
-	msg[0] = DPTX_EVENT_ENABLE_HPD | DPTX_EVENT_ENABLE_TRAINING;
+	msg[0] = MHDP_EVENT_ENABLE_HPD | MHDP_EVENT_ENABLE_TRAINING;
 
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_ENABLE_EVENT,
-				  sizeof(msg), msg);
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_ENABLE_EVENT, sizeof(msg), msg);
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "set event config failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "set event config failed: %d\n", ret);
 
 	return ret;
 }
 
-u32 cdn_dp_get_event(struct cdn_dp_device *dp)
+u32 cdns_mhdp_get_event(struct cdns_mhdp_device *mhdp)
 {
-	return readl(dp->regs + SW_EVENTS0);
+	return cdns_mhdp_bus_read(mhdp, SW_EVENTS0);
 }
 
-int cdn_dp_get_hpd_status(struct cdn_dp_device *dp)
+int cdns_mhdp_read_hpd(struct cdns_mhdp_device *mhdp)
 {
 	u8 status;
 	int ret;
 
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_HPD_STATE,
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL, GENERAL_GET_HPD_STATE,
 				  0, NULL);
 	if (ret)
 		goto err_get_hpd;
 
-	ret = cdn_dp_mailbox_validate_receive(dp, MB_MODULE_ID_DP_TX,
-					      DPTX_HPD_STATE, sizeof(status));
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_GENERAL,
+							GENERAL_GET_HPD_STATE, sizeof(status));
 	if (ret)
 		goto err_get_hpd;
 
-	ret = cdn_dp_mailbox_read_receive(dp, &status, sizeof(status));
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, &status, sizeof(status));
 	if (ret)
 		goto err_get_hpd;
 
 	return status;
 
 err_get_hpd:
-	DRM_DEV_ERROR(dp->dev, "get hpd status failed: %d\n", ret);
+	DRM_ERROR("read hpd  failed: %d\n", ret);
 	return ret;
 }
 
-int cdn_dp_get_edid_block(void *data, u8 *edid,
+int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 			  unsigned int block, size_t length)
 {
-	struct cdn_dp_device *dp = data;
+	struct cdns_mhdp_device *mhdp = data;
 	u8 msg[2], reg[2], i;
 	int ret;
 
@@ -442,22 +441,23 @@ int cdn_dp_get_edid_block(void *data, u8 *edid,
 		msg[0] = block / 2;
 		msg[1] = block % 2;
 
-		ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_GET_EDID,
-					  sizeof(msg), msg);
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+					     DPTX_GET_EDID, sizeof(msg), msg);
 		if (ret)
 			continue;
 
-		ret = cdn_dp_mailbox_validate_receive(dp, MB_MODULE_ID_DP_TX,
-						      DPTX_GET_EDID,
-						      sizeof(reg) + length);
+		ret = cdns_mhdp_mailbox_validate_receive(mhdp,
+							 MB_MODULE_ID_DP_TX,
+							 DPTX_GET_EDID,
+							 sizeof(reg) + length);
 		if (ret)
 			continue;
 
-		ret = cdn_dp_mailbox_read_receive(dp, reg, sizeof(reg));
+		ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
 		if (ret)
 			continue;
 
-		ret = cdn_dp_mailbox_read_receive(dp, edid, length);
+		ret = cdns_mhdp_mailbox_read_receive(mhdp, edid, length);
 		if (ret)
 			continue;
 
@@ -466,13 +466,13 @@ int cdn_dp_get_edid_block(void *data, u8 *edid,
 	}
 
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "get block[%d] edid failed: %d\n", block,
-			      ret);
+		DRM_DEV_ERROR(mhdp->dev, "get block[%d] edid failed: %d\n",
+			      block, ret);
 
 	return ret;
 }
 
-static int cdn_dp_training_start(struct cdn_dp_device *dp)
+static int cdns_mhdp_training_start(struct cdns_mhdp_device *mhdp)
 {
 	unsigned long timeout;
 	u8 msg, event[2];
@@ -481,26 +481,27 @@ static int cdn_dp_training_start(struct cdn_dp_device *dp)
 	msg = LINK_TRAINING_RUN;
 
 	/* start training */
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_TRAINING_CONTROL,
-				  sizeof(msg), &msg);
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, DPTX_TRAINING_CONTROL,
+								sizeof(msg), &msg);
 	if (ret)
 		goto err_training_start;
 
 	timeout = jiffies + msecs_to_jiffies(LINK_TRAINING_TIMEOUT_MS);
 	while (time_before(jiffies, timeout)) {
 		msleep(LINK_TRAINING_RETRY_MS);
-		ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX,
-					  DPTX_READ_EVENT, 0, NULL);
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+					     DPTX_READ_EVENT, 0, NULL);
 		if (ret)
 			goto err_training_start;
 
-		ret = cdn_dp_mailbox_validate_receive(dp, MB_MODULE_ID_DP_TX,
-						      DPTX_READ_EVENT,
-						      sizeof(event));
+		ret = cdns_mhdp_mailbox_validate_receive(mhdp,
+							 MB_MODULE_ID_DP_TX,
+							 DPTX_READ_EVENT,
+							 sizeof(event));
 		if (ret)
 			goto err_training_start;
 
-		ret = cdn_dp_mailbox_read_receive(dp, event, sizeof(event));
+		ret = cdns_mhdp_mailbox_read_receive(mhdp, event, sizeof(event));
 		if (ret)
 			goto err_training_start;
 
@@ -511,77 +512,77 @@ static int cdn_dp_training_start(struct cdn_dp_device *dp)
 	ret = -ETIMEDOUT;
 
 err_training_start:
-	DRM_DEV_ERROR(dp->dev, "training failed: %d\n", ret);
+	DRM_DEV_ERROR(mhdp->dev, "training failed: %d\n", ret);
 	return ret;
 }
 
-static int cdn_dp_get_training_status(struct cdn_dp_device *dp)
+static int cdns_mhdp_get_training_status(struct cdns_mhdp_device *mhdp)
 {
 	u8 status[10];
 	int ret;
 
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_READ_LINK_STAT,
-				  0, NULL);
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, DPTX_READ_LINK_STAT,
+								0, NULL);
 	if (ret)
 		goto err_get_training_status;
 
-	ret = cdn_dp_mailbox_validate_receive(dp, MB_MODULE_ID_DP_TX,
-					      DPTX_READ_LINK_STAT,
-					      sizeof(status));
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
+						 DPTX_READ_LINK_STAT,
+						 sizeof(status));
 	if (ret)
 		goto err_get_training_status;
 
-	ret = cdn_dp_mailbox_read_receive(dp, status, sizeof(status));
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, status, sizeof(status));
 	if (ret)
 		goto err_get_training_status;
 
-	dp->max_rate = drm_dp_bw_code_to_link_rate(status[0]);
-	dp->max_lanes = status[1];
+	mhdp->dp.rate = drm_dp_bw_code_to_link_rate(status[0]);
+	mhdp->dp.num_lanes = status[1];
 
 err_get_training_status:
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "get training status failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "get training status failed: %d\n", ret);
 	return ret;
 }
 
-int cdn_dp_train_link(struct cdn_dp_device *dp)
+int cdns_mhdp_train_link(struct cdns_mhdp_device *mhdp)
 {
 	int ret;
 
-	ret = cdn_dp_training_start(dp);
+	ret = cdns_mhdp_training_start(mhdp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to start training %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "Failed to start training %d\n", ret);
 		return ret;
 	}
 
-	ret = cdn_dp_get_training_status(dp);
+	ret = cdns_mhdp_get_training_status(mhdp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to get training stat %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "Failed to get training stat %d\n", ret);
 		return ret;
 	}
 
-	DRM_DEV_DEBUG_KMS(dp->dev, "rate:0x%x, lanes:%d\n", dp->max_rate,
-			  dp->max_lanes);
+	DRM_DEV_DEBUG_KMS(mhdp->dev, "rate:0x%x, lanes:%d\n", mhdp->dp.rate,
+			  mhdp->dp.num_lanes);
 	return ret;
 }
 
-int cdn_dp_set_video_status(struct cdn_dp_device *dp, int active)
+int cdns_mhdp_set_video_status(struct cdns_mhdp_device *mhdp, int active)
 {
 	u8 msg;
 	int ret;
 
 	msg = !!active;
 
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_SET_VIDEO,
-				  sizeof(msg), &msg);
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, DPTX_SET_VIDEO,
+								sizeof(msg), &msg);
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "set video status failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "set video status failed: %d\n", ret);
 
 	return ret;
 }
 
-static int cdn_dp_get_msa_misc(struct video_info *video,
-			       struct drm_display_mode *mode)
+static int mhdp_get_msa_misc(struct video_info *video,
+				  struct drm_display_mode *mode)
 {
 	u32 msa_misc;
 	u8 val[2] = {0};
@@ -627,10 +628,10 @@ static int cdn_dp_get_msa_misc(struct video_info *video,
 	return msa_misc;
 }
 
-int cdn_dp_config_video(struct cdn_dp_device *dp)
+int cdns_mhdp_config_video(struct cdns_mhdp_device *mhdp)
 {
-	struct video_info *video = &dp->video_info;
-	struct drm_display_mode *mode = &dp->mode;
+	struct video_info *video = &mhdp->video_info;
+	struct drm_display_mode *mode = &mhdp->mode;
 	u64 symbol;
 	u32 val, link_rate, rem;
 	u8 bit_per_pix, tu_size_reg = TU_SIZE;
@@ -639,13 +640,13 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
 	bit_per_pix = (video->color_fmt == YCBCR_4_2_2) ?
 		      (video->color_depth * 2) : (video->color_depth * 3);
 
-	link_rate = dp->max_rate / 1000;
+	link_rate = mhdp->dp.rate / 1000;
 
-	ret = cdn_dp_reg_write(dp, BND_HSYNC2VSYNC, VIF_BYPASS_INTERLACE);
+	ret = cdns_mhdp_reg_write(mhdp, BND_HSYNC2VSYNC, VIF_BYPASS_INTERLACE);
 	if (ret)
 		goto err_config_video;
 
-	ret = cdn_dp_reg_write(dp, HSYNC2VSYNC_POL_CTRL, 0);
+	ret = cdns_mhdp_reg_write(mhdp, HSYNC2VSYNC_POL_CTRL, 0);
 	if (ret)
 		goto err_config_video;
 
@@ -659,13 +660,13 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
 	do {
 		tu_size_reg += 2;
 		symbol = tu_size_reg * mode->clock * bit_per_pix;
-		do_div(symbol, dp->max_lanes * link_rate * 8);
+		do_div(symbol, mhdp->dp.num_lanes * link_rate * 8);
 		rem = do_div(symbol, 1000);
 		if (tu_size_reg > 64) {
 			ret = -EINVAL;
-			DRM_DEV_ERROR(dp->dev,
+			DRM_DEV_ERROR(mhdp->dev,
 				      "tu error, clk:%d, lanes:%d, rate:%d\n",
-				      mode->clock, dp->max_lanes, link_rate);
+				      mode->clock, mhdp->dp.num_lanes, link_rate);
 			goto err_config_video;
 		}
 	} while ((symbol <= 1) || (tu_size_reg - symbol < 4) ||
@@ -673,16 +674,16 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
 
 	val = symbol + (tu_size_reg << 8);
 	val |= TU_CNT_RST_EN;
-	ret = cdn_dp_reg_write(dp, DP_FRAMER_TU, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRAMER_TU, val);
 	if (ret)
 		goto err_config_video;
 
 	/* set the FIFO Buffer size */
 	val = div_u64(mode->clock * (symbol + 1), 1000) + link_rate;
-	val /= (dp->max_lanes * link_rate);
+	val /= (mhdp->dp.num_lanes * link_rate);
 	val = div_u64(8 * (symbol + 1), bit_per_pix) - val;
 	val += 2;
-	ret = cdn_dp_reg_write(dp, DP_VC_TABLE(15), val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_VC_TABLE(15), val);
 
 	switch (video->color_depth) {
 	case 6:
@@ -703,136 +704,136 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
 	};
 
 	val += video->color_fmt << 8;
-	ret = cdn_dp_reg_write(dp, DP_FRAMER_PXL_REPR, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRAMER_PXL_REPR, val);
 	if (ret)
 		goto err_config_video;
 
 	val = video->h_sync_polarity ? DP_FRAMER_SP_HSP : 0;
 	val |= video->v_sync_polarity ? DP_FRAMER_SP_VSP : 0;
-	ret = cdn_dp_reg_write(dp, DP_FRAMER_SP, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRAMER_SP, val);
 	if (ret)
 		goto err_config_video;
 
 	val = (mode->hsync_start - mode->hdisplay) << 16;
 	val |= mode->htotal - mode->hsync_end;
-	ret = cdn_dp_reg_write(dp, DP_FRONT_BACK_PORCH, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRONT_BACK_PORCH, val);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->hdisplay * bit_per_pix / 8;
-	ret = cdn_dp_reg_write(dp, DP_BYTE_COUNT, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_BYTE_COUNT, val);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->htotal | ((mode->htotal - mode->hsync_start) << 16);
-	ret = cdn_dp_reg_write(dp, MSA_HORIZONTAL_0, val);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_HORIZONTAL_0, val);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->hsync_end - mode->hsync_start;
 	val |= (mode->hdisplay << 16) | (video->h_sync_polarity << 15);
-	ret = cdn_dp_reg_write(dp, MSA_HORIZONTAL_1, val);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_HORIZONTAL_1, val);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->vtotal;
 	val |= (mode->vtotal - mode->vsync_start) << 16;
-	ret = cdn_dp_reg_write(dp, MSA_VERTICAL_0, val);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_VERTICAL_0, val);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->vsync_end - mode->vsync_start;
 	val |= (mode->vdisplay << 16) | (video->v_sync_polarity << 15);
-	ret = cdn_dp_reg_write(dp, MSA_VERTICAL_1, val);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_VERTICAL_1, val);
 	if (ret)
 		goto err_config_video;
 
-	val = cdn_dp_get_msa_misc(video, mode);
-	ret = cdn_dp_reg_write(dp, MSA_MISC, val);
+	val = mhdp_get_msa_misc(video, mode);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_MISC, val);
 	if (ret)
 		goto err_config_video;
 
-	ret = cdn_dp_reg_write(dp, STREAM_CONFIG, 1);
+	ret = cdns_mhdp_reg_write(mhdp, STREAM_CONFIG, 1);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->hsync_end - mode->hsync_start;
 	val |= mode->hdisplay << 16;
-	ret = cdn_dp_reg_write(dp, DP_HORIZONTAL, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_HORIZONTAL, val);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->vdisplay;
 	val |= (mode->vtotal - mode->vsync_start) << 16;
-	ret = cdn_dp_reg_write(dp, DP_VERTICAL_0, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_VERTICAL_0, val);
 	if (ret)
 		goto err_config_video;
 
 	val = mode->vtotal;
-	ret = cdn_dp_reg_write(dp, DP_VERTICAL_1, val);
+	ret = cdns_mhdp_reg_write(mhdp, DP_VERTICAL_1, val);
 	if (ret)
 		goto err_config_video;
 
-	ret = cdn_dp_reg_write_bit(dp, DP_VB_ID, 2, 1, 0);
+	ret = cdns_mhdp_reg_write_bit(mhdp, DP_VB_ID, 2, 1, 0);
 
 err_config_video:
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "config video failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "config video failed: %d\n", ret);
 	return ret;
 }
 
-int cdn_dp_audio_stop(struct cdn_dp_device *dp, struct audio_info *audio)
+int cdns_mhdp_audio_stop(struct cdns_mhdp_device *mhdp, struct audio_info *audio)
 {
 	int ret;
 
-	ret = cdn_dp_reg_write(dp, AUDIO_PACK_CONTROL, 0);
+	ret = cdns_mhdp_reg_write(mhdp, AUDIO_PACK_CONTROL, 0);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "audio stop failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "audio stop failed: %d\n", ret);
 		return ret;
 	}
 
-	writel(0, dp->regs + SPDIF_CTRL_ADDR);
+	cdns_mhdp_bus_write(0, mhdp, SPDIF_CTRL_ADDR);
 
 	/* clearn the audio config and reset */
-	writel(0, dp->regs + AUDIO_SRC_CNTL);
-	writel(0, dp->regs + AUDIO_SRC_CNFG);
-	writel(AUDIO_SW_RST, dp->regs + AUDIO_SRC_CNTL);
-	writel(0, dp->regs + AUDIO_SRC_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNFG);
+	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, AUDIO_SRC_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNTL);
 
 	/* reset smpl2pckt component  */
-	writel(0, dp->regs + SMPL2PKT_CNTL);
-	writel(AUDIO_SW_RST, dp->regs + SMPL2PKT_CNTL);
-	writel(0, dp->regs + SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, SMPL2PKT_CNTL);
 
 	/* reset FIFO */
-	writel(AUDIO_SW_RST, dp->regs + FIFO_CNTL);
-	writel(0, dp->regs + FIFO_CNTL);
+	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, FIFO_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, FIFO_CNTL);
 
-	if (audio->format == AFMT_SPDIF)
-		clk_disable_unprepare(dp->spdif_clk);
+	if (audio->format == AFMT_SPDIF_INT)
+		clk_disable_unprepare(mhdp->spdif_clk);
 
 	return 0;
 }
 
-int cdn_dp_audio_mute(struct cdn_dp_device *dp, bool enable)
+int cdns_mhdp_audio_mute(struct cdns_mhdp_device *mhdp, bool enable)
 {
-	int ret;
+	int ret = true;
 
-	ret = cdn_dp_reg_write_bit(dp, DP_VB_ID, 4, 1, enable);
+	ret = cdns_mhdp_reg_write_bit(mhdp, DP_VB_ID, 4, 1, enable);
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "audio mute failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "audio mute failed: %d\n", ret);
 
 	return ret;
 }
 
-static void cdn_dp_audio_config_i2s(struct cdn_dp_device *dp,
-				    struct audio_info *audio)
+static void cdns_mhdp_audio_config_i2s(struct cdns_mhdp_device *mhdp,
+				       struct audio_info *audio)
 {
 	int sub_pckt_num = 1, i2s_port_en_val = 0xf, i;
 	u32 val;
 
 	if (audio->channels == 2) {
-		if (dp->max_lanes == 1)
+		if (mhdp->dp.num_lanes == 1)
 			sub_pckt_num = 2;
 		else
 			sub_pckt_num = 4;
@@ -842,15 +843,15 @@ static void cdn_dp_audio_config_i2s(struct cdn_dp_device *dp,
 		i2s_port_en_val = 3;
 	}
 
-	writel(0x0, dp->regs + SPDIF_CTRL_ADDR);
+	cdns_mhdp_bus_write(0x0, mhdp, SPDIF_CTRL_ADDR);
 
-	writel(SYNC_WR_TO_CH_ZERO, dp->regs + FIFO_CNTL);
+	cdns_mhdp_bus_write(SYNC_WR_TO_CH_ZERO, mhdp, FIFO_CNTL);
 
 	val = MAX_NUM_CH(audio->channels);
 	val |= NUM_OF_I2S_PORTS(audio->channels);
 	val |= AUDIO_TYPE_LPCM;
 	val |= CFG_SUB_PCKT_NUM(sub_pckt_num);
-	writel(val, dp->regs + SMPL2PKT_CNFG);
+	cdns_mhdp_bus_write(val, mhdp, SMPL2PKT_CNFG);
 
 	if (audio->sample_width == 16)
 		val = 0;
@@ -862,7 +863,7 @@ static void cdn_dp_audio_config_i2s(struct cdn_dp_device *dp,
 	val |= AUDIO_CH_NUM(audio->channels);
 	val |= I2S_DEC_PORT_EN(i2s_port_en_val);
 	val |= TRANS_SMPL_WIDTH_32;
-	writel(val, dp->regs + AUDIO_SRC_CNFG);
+	cdns_mhdp_bus_write(val, mhdp, AUDIO_SRC_CNFG);
 
 	for (i = 0; i < (audio->channels + 1) / 2; i++) {
 		if (audio->sample_width == 16)
@@ -871,7 +872,7 @@ static void cdn_dp_audio_config_i2s(struct cdn_dp_device *dp,
 			val = (0x0b << 8) | (0x0b << 20);
 
 		val |= ((2 * i) << 4) | ((2 * i + 1) << 16);
-		writel(val, dp->regs + STTS_BIT_CH(i));
+		cdns_mhdp_bus_write(val, mhdp, STTS_BIT_CH(i));
 	}
 
 	switch (audio->sample_rate) {
@@ -905,56 +906,57 @@ static void cdn_dp_audio_config_i2s(struct cdn_dp_device *dp,
 		break;
 	}
 	val |= 4;
-	writel(val, dp->regs + COM_CH_STTS_BITS);
+	cdns_mhdp_bus_write(val, mhdp, COM_CH_STTS_BITS);
 
-	writel(SMPL2PKT_EN, dp->regs + SMPL2PKT_CNTL);
-	writel(I2S_DEC_START, dp->regs + AUDIO_SRC_CNTL);
+	cdns_mhdp_bus_write(SMPL2PKT_EN, mhdp, SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(I2S_DEC_START, mhdp, AUDIO_SRC_CNTL);
 }
 
-static void cdn_dp_audio_config_spdif(struct cdn_dp_device *dp)
+static void cdns_mhdp_audio_config_spdif(struct cdns_mhdp_device *mhdp)
 {
 	u32 val;
 
-	writel(SYNC_WR_TO_CH_ZERO, dp->regs + FIFO_CNTL);
+	cdns_mhdp_bus_write(SYNC_WR_TO_CH_ZERO, mhdp, FIFO_CNTL);
 
 	val = MAX_NUM_CH(2) | AUDIO_TYPE_LPCM | CFG_SUB_PCKT_NUM(4);
-	writel(val, dp->regs + SMPL2PKT_CNFG);
-	writel(SMPL2PKT_EN, dp->regs + SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(val, mhdp, SMPL2PKT_CNFG);
+	cdns_mhdp_bus_write(SMPL2PKT_EN, mhdp, SMPL2PKT_CNTL);
 
 	val = SPDIF_ENABLE | SPDIF_AVG_SEL | SPDIF_JITTER_BYPASS;
-	writel(val, dp->regs + SPDIF_CTRL_ADDR);
+	cdns_mhdp_bus_write(val, mhdp, SPDIF_CTRL_ADDR);
 
-	clk_prepare_enable(dp->spdif_clk);
-	clk_set_rate(dp->spdif_clk, CDN_DP_SPDIF_CLK);
+	clk_prepare_enable(mhdp->spdif_clk);
+	clk_set_rate(mhdp->spdif_clk, CDNS_DP_SPDIF_CLK);
 }
 
-int cdn_dp_audio_config(struct cdn_dp_device *dp, struct audio_info *audio)
+int cdns_mhdp_audio_config(struct cdns_mhdp_device *mhdp,
+							struct audio_info *audio)
 {
 	int ret;
 
 	/* reset the spdif clk before config */
-	if (audio->format == AFMT_SPDIF) {
-		reset_control_assert(dp->spdif_rst);
-		reset_control_deassert(dp->spdif_rst);
+	if (audio->format == AFMT_SPDIF_INT) {
+		reset_control_assert(mhdp->spdif_rst);
+		reset_control_deassert(mhdp->spdif_rst);
 	}
 
-	ret = cdn_dp_reg_write(dp, CM_LANE_CTRL, LANE_REF_CYC);
+	ret = cdns_mhdp_reg_write(mhdp, CM_LANE_CTRL, LANE_REF_CYC);
 	if (ret)
 		goto err_audio_config;
 
-	ret = cdn_dp_reg_write(dp, CM_CTRL, 0);
+	ret = cdns_mhdp_reg_write(mhdp, CM_CTRL, 0);
 	if (ret)
 		goto err_audio_config;
 
 	if (audio->format == AFMT_I2S)
-		cdn_dp_audio_config_i2s(dp, audio);
-	else if (audio->format == AFMT_SPDIF)
-		cdn_dp_audio_config_spdif(dp);
+		cdns_mhdp_audio_config_i2s(mhdp, audio);
+	else if (audio->format == AFMT_SPDIF_INT)
+		cdns_mhdp_audio_config_spdif(mhdp);
 
-	ret = cdn_dp_reg_write(dp, AUDIO_PACK_CONTROL, AUDIO_PACK_EN);
+	ret = cdns_mhdp_reg_write(mhdp, AUDIO_PACK_CONTROL, AUDIO_PACK_EN);
 
 err_audio_config:
 	if (ret)
-		DRM_DEV_ERROR(dp->dev, "audio config failed: %d\n", ret);
+		DRM_DEV_ERROR(mhdp->dev, "audio config failed: %d\n", ret);
 	return ret;
 }
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.h b/drivers/gpu/drm/rockchip/cdn-dp-reg.h
index 441248b7a79e..3c1235ff8e1c 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.h
@@ -7,6 +7,8 @@
 #ifndef _CDN_DP_REG_H
 #define _CDN_DP_REG_H
 
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
 #include <linux/bitops.h>
 
 #define ADDR_IMEM		0x10000
@@ -308,17 +310,22 @@
 #define MB_SIZE_LSB_ID			3
 #define MB_DATA_ID			4
 
-#define MB_MODULE_ID_DP_TX		0x01
+#define MB_MODULE_ID_DP_TX			0x01
+#define MB_MODULE_ID_HDMI_TX		0x03
 #define MB_MODULE_ID_HDCP_TX		0x07
 #define MB_MODULE_ID_HDCP_RX		0x08
 #define MB_MODULE_ID_HDCP_GENERAL	0x09
-#define MB_MODULE_ID_GENERAL		0x0a
+#define MB_MODULE_ID_GENERAL		0x0A
 
 /* general opcode */
 #define GENERAL_MAIN_CONTROL            0x01
 #define GENERAL_TEST_ECHO               0x02
 #define GENERAL_BUS_SETTINGS            0x03
 #define GENERAL_TEST_ACCESS             0x04
+#define GENERAL_WRITE_REGISTER          0x05
+#define GENERAL_WRITE_FIELD             0x06
+#define GENERAL_READ_REGISTER           0x07
+#define GENERAL_GET_HPD_STATE           0x11
 
 #define DPTX_SET_POWER_MNG			0x00
 #define DPTX_SET_HOST_CAPABILITIES		0x01
@@ -342,8 +349,8 @@
 #define FW_STANDBY				0
 #define FW_ACTIVE				1
 
-#define DPTX_EVENT_ENABLE_HPD			BIT(0)
-#define DPTX_EVENT_ENABLE_TRAINING		BIT(1)
+#define MHDP_EVENT_ENABLE_HPD			BIT(0)
+#define MHDP_EVENT_ENABLE_TRAINING		BIT(1)
 
 #define LINK_TRAINING_NOT_ACTIVE		0
 #define LINK_TRAINING_RUN			1
@@ -387,7 +394,7 @@
 #define HDCP_TX_IS_RECEIVER_ID_VALID_EVENT	BIT(7)
 
 #define TU_SIZE					30
-#define CDN_DP_MAX_LINK_RATE			DP_LINK_BW_5_4
+#define CDNS_DP_MAX_LINK_RATE	540000
 
 /* audio */
 #define AUDIO_PACK_EN				BIT(8)
@@ -451,24 +458,100 @@ enum vic_bt_type {
 	BT_709 = 0x1,
 };
 
-void cdn_dp_clock_reset(struct cdn_dp_device *dp);
-
-void cdn_dp_set_fw_clk(struct cdn_dp_device *dp, unsigned long clk);
-int cdn_dp_load_firmware(struct cdn_dp_device *dp, const u32 *i_mem,
-			 u32 i_size, const u32 *d_mem, u32 d_size);
-int cdn_dp_set_firmware_active(struct cdn_dp_device *dp, bool enable);
-int cdn_dp_set_host_cap(struct cdn_dp_device *dp, u8 lanes, bool flip);
-int cdn_dp_event_config(struct cdn_dp_device *dp);
-u32 cdn_dp_get_event(struct cdn_dp_device *dp);
-int cdn_dp_get_hpd_status(struct cdn_dp_device *dp);
-int cdn_dp_dpcd_write(struct cdn_dp_device *dp, u32 addr, u8 value);
-int cdn_dp_dpcd_read(struct cdn_dp_device *dp, u32 addr, u8 *data, u16 len);
-int cdn_dp_get_edid_block(void *dp, u8 *edid,
-			  unsigned int block, size_t length);
-int cdn_dp_train_link(struct cdn_dp_device *dp);
-int cdn_dp_set_video_status(struct cdn_dp_device *dp, int active);
-int cdn_dp_config_video(struct cdn_dp_device *dp);
-int cdn_dp_audio_stop(struct cdn_dp_device *dp, struct audio_info *audio);
-int cdn_dp_audio_mute(struct cdn_dp_device *dp, bool enable);
-int cdn_dp_audio_config(struct cdn_dp_device *dp, struct audio_info *audio);
+enum audio_format {
+	AFMT_I2S = 0,
+	AFMT_SPDIF_INT = 1,
+	AFMT_SPDIF_EXT = 2,
+	AFMT_UNUSED,
+};
+
+struct audio_info {
+	enum audio_format format;
+	int sample_rate;
+	int channels;
+	int sample_width;
+	int connector_type;
+};
+
+enum vic_pxl_encoding_format {
+	PXL_RGB = 0x1,
+	YCBCR_4_4_4 = 0x2,
+	YCBCR_4_2_2 = 0x4,
+	YCBCR_4_2_0 = 0x8,
+	Y_ONLY = 0x10,
+};
+
+struct video_info {
+	bool h_sync_polarity;
+	bool v_sync_polarity;
+	bool interlaced;
+	int color_depth;
+	enum vic_pxl_encoding_format color_fmt;
+};
+
+struct cdns_mhdp_bridge {
+	struct cdns_mhdp_device *mhdp;
+	struct drm_bridge base;
+	int pbn;
+	int8_t stream_id;
+	struct cdns_mhdp_connector *connector;
+	bool is_active;
+};
+
+struct cdns_mhdp_connector {
+	struct drm_connector base;
+	struct cdns_mhdp_bridge *bridge;
+};
+
+struct cdns_mhdp_device {
+	struct device *dev;
+	struct cdns_mhdp_connector connector;
+
+	void __iomem *regs_base;
+	struct reset_control *spdif_rst;
+
+	struct video_info video_info;
+	struct drm_display_mode	mode;
+
+	struct platform_device *audio_pdev;
+	struct audio_info audio_info;
+	struct clk *spdif_clk;
+
+	unsigned int fw_version;
+
+	union {
+		struct _dp_data {
+			u32 rate;
+			u8 num_lanes;
+			struct drm_dp_aux aux;
+			u8 dpcd[DP_RECEIVER_CAP_SIZE];
+		} dp;
+	};
+};
+
+int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr);
+int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u32 addr, u32 val);
+void cdns_mhdp_clock_reset(struct cdns_mhdp_device *mhdp);
+void cdns_mhdp_set_fw_clk(struct cdns_mhdp_device *mhdp, unsigned long clk);
+int cdns_mhdp_load_firmware(struct cdns_mhdp_device *mhdp, const u32 *i_mem,
+			    u32 i_size, const u32 *d_mem, u32 d_size);
+int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable);
+int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp, bool flip);
+int cdns_mhdp_event_config(struct cdns_mhdp_device *mhdp);
+u32 cdns_mhdp_get_event(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_read_hpd(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value);
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
+			u32 addr, u8 *data, u16 len);
+int cdns_mhdp_get_edid_block(void *mhdp, u8 *edid,
+			     unsigned int block, size_t length);
+int cdns_mhdp_train_link(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_set_video_status(struct cdns_mhdp_device *mhdp, int active);
+int cdns_mhdp_config_video(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_audio_stop(struct cdns_mhdp_device *mhdp,
+			 struct audio_info *audio);
+int cdns_mhdp_audio_mute(struct cdns_mhdp_device *mhdp, bool enable);
+int cdns_mhdp_audio_config(struct cdns_mhdp_device *mhdp,
+			   struct audio_info *audio);
+
 #endif /* _CDN_DP_REG_H */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
