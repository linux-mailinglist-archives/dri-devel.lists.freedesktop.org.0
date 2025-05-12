Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855CAB379C
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF510E3F2;
	Mon, 12 May 2025 12:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="b1PHt/p8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3896210E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oJ
 9/osYL4DDM44SiwCMwCPovpFIpouBP5LSsduArYSA=; b=b1PHt/p8upzOG8ujmC
 yzT+TV2RRwr5uB9DCrzavIlC6vu2Tggb4Br9T5HKURtuqBA1519cJGb73DaVYKuA
 xXk6ME7UdlgBaeXhTchPt+tLg5zFUd3kHv6iAabQnfY9S+p1S1Ba+7ZktU2AZCOD
 a3eqXoQViiFJ00uqN9Bt7UGus=
Received: from ProDesk.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S11;
 Mon, 12 May 2025 20:46:30 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 neil.armstrong@linaro.org, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 09/10] drm/rockchip: inno-hdmi: Convert to drm bridge
Date: Mon, 12 May 2025 20:46:10 +0800
Message-ID: <20250512124615.2848731-10-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S11
X-Coremail-Antispam: 1Uf129KBjvAXoWfWF17Zw1xZr1kXFy7try7Wrg_yoW5Kry5Jo
 Z7JFn8Xr4xuryxWrWUKF10kF4jva1ayrn3Z3WrArWDZan8Gw4jga47KryrZFZrXF1avrW2
 kw1kKrs3Xrn7Jr4kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIyxRDUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g9LXmgh5MDHDwABss
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

From: Andy Yan <andy.yan@rock-chips.com>

Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split cleanup code to separate patch
- Switch to devm_drm_bridge_alloc() API

Changes in v4:
- Do not store colorimetry within inno_hdmi struct

Changes in v3:
- First included in v3

 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 503 +++++-------------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 188 +++++++
 include/drm/bridge/inno_hdmi.h                |  33 ++
 7 files changed, 366 insertions(+), 369 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (69%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 create mode 100644 include/drm/bridge/inno_hdmi.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a6..b70df0c3cc03d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -100,6 +100,13 @@ config DRM_I2C_NXP_TDA998X
 	help
 	  Support for NXP Semiconductors TDA998X HDMI encoders.
 
+config DRM_INNO_HDMI
+	tristate
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 245e8a27e3fc5..efe049afa4d27 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
 tda998x-y := tda998x_drv.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
 
+obj-$(CONFIG_DRM_INNO_HDMI) += inno-hdmi.o
 obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
similarity index 69%
rename from drivers/gpu/drm/rockchip/inno_hdmi.c
rename to drivers/gpu/drm/bridge/inno-hdmi.c
index 1ab3ad4bde9ea..e53e1849fe37b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -3,12 +3,14 @@
  * Copyright (C) Rockchip Electronics Co., Ltd.
  *    Zheng Yang <zhengyang@rock-chips.com>
  *    Yakir Yang <ykk@rock-chips.com>
+ *    Andy Yan <andyshrk@163.com>
  */
 
 #include <linux/irq.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/hdmi.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
@@ -17,18 +19,18 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <drm/bridge/inno_hdmi.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-#include "rockchip_drm_drv.h"
-
 #define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
 
 #define DDC_SEGMENT_ADDR		0x30
@@ -382,29 +384,6 @@ enum {
 #define HDMI_CEC_BUSFREETIME_H		0xdd
 #define HDMI_CEC_LOGICADDR		0xde
 
-#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
-
-#define RK3036_GRF_SOC_CON2	0x148
-#define RK3036_HDMI_PHSYNC	BIT(4)
-#define RK3036_HDMI_PVSYNC	BIT(5)
-
-enum inno_hdmi_dev_type {
-	RK3036_HDMI,
-	RK3128_HDMI,
-};
-
-struct inno_hdmi_phy_config {
-	unsigned long pixelclock;
-	u8 pre_emphasis;
-	u8 voltage_level_control;
-};
-
-struct inno_hdmi_variant {
-	enum inno_hdmi_dev_type dev_type;
-	struct inno_hdmi_phy_config *phy_configs;
-	struct inno_hdmi_phy_config *default_phy_config;
-};
-
 struct inno_hdmi_i2c {
 	struct i2c_adapter adap;
 
@@ -417,41 +396,17 @@ struct inno_hdmi_i2c {
 
 struct inno_hdmi {
 	struct device *dev;
-
+	struct drm_bridge bridge;
 	struct clk *pclk;
 	struct clk *refclk;
 	void __iomem *regs;
 	struct regmap *grf;
 
-	struct drm_connector	connector;
-	struct rockchip_encoder	encoder;
-
 	struct inno_hdmi_i2c *i2c;
 	struct i2c_adapter *ddc;
-
-	const struct inno_hdmi_variant *variant;
-};
-
-struct inno_hdmi_connector_state {
-	struct drm_connector_state	base;
-	unsigned int			colorimetry;
+	const struct inno_hdmi_plat_data *plat_data;
 };
 
-static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
-{
-	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-	return container_of(rkencoder, struct inno_hdmi, encoder);
-}
-
-static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
-{
-	return container_of(connector, struct inno_hdmi, connector);
-}
-
-#define to_inno_hdmi_conn_state(conn_state) \
-	container_of_const(conn_state, struct inno_hdmi_connector_state, base)
-
 enum {
 	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
 	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
@@ -494,23 +449,15 @@ static const char coeff_csc[][24] = {
 	},
 };
 
-static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] = {
-	{  74250000, 0x3f, 0xbb },
-	{ 165000000, 0x6f, 0xbb },
-	{      ~0UL, 0x00, 0x00 }
-};
-
-static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] = {
-	{  74250000, 0x3f, 0xaa },
-	{ 165000000, 0x5f, 0xaa },
-	{      ~0UL, 0x00, 0x00 }
-};
+static struct inno_hdmi *bridge_to_inno_hdmi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct inno_hdmi, bridge);
+}
 
 static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
 				     unsigned long pixelclk)
 {
-	const struct inno_hdmi_phy_config *phy_configs =
-						hdmi->variant->phy_configs;
+	const struct inno_hdmi_phy_config *phy_configs = hdmi->plat_data->phy_configs;
 	int i;
 
 	for (i = 0; phy_configs[i].pixelclock != ~0UL; i++) {
@@ -582,12 +529,12 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
 
 	if (ret < 0) {
-		phy_config = hdmi->variant->default_phy_config;
+		phy_config = hdmi->plat_data->default_phy_config;
 		DRM_DEV_ERROR(hdmi->dev,
 			      "Using default phy configuration for TMDS rate %lu",
 			      mpixelclock);
 	} else {
-		phy_config = &hdmi->variant->phy_configs[ret];
+		phy_config = &hdmi->plat_data->phy_configs[ret];
 	}
 
 	inno_hdmi_sys_power(hdmi, false);
@@ -637,14 +584,13 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
 }
 
-static int inno_hdmi_disable_frame(struct drm_connector *connector,
-				   enum hdmi_infoframe_type type)
+static int inno_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
+					    enum hdmi_infoframe_type type)
 {
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
+		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
 		return 0;
 	}
 
@@ -653,20 +599,19 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 	return 0;
 }
 
-static int inno_hdmi_upload_frame(struct drm_connector *connector,
-				  enum hdmi_infoframe_type type,
-				  const u8 *buffer, size_t len)
+static int inno_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
 {
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 	ssize_t i;
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
+		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
 		return 0;
 	}
 
-	inno_hdmi_disable_frame(connector, type);
+	inno_hdmi_bridge_clear_infoframe(bridge, type);
 
 	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);
@@ -674,23 +619,26 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
-static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
-	.clear_infoframe	= inno_hdmi_disable_frame,
-	.write_infoframe	= inno_hdmi_upload_frame,
-};
-
-static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
+static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi,
+				      struct drm_connector *connector,
+				      struct drm_display_mode *mode)
 {
-	struct drm_connector *connector = &hdmi->connector;
 	struct drm_connector_state *conn_state = connector->state;
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
 	int c0_c2_change = 0;
 	int csc_enable = 0;
 	int csc_mode = 0;
 	int auto_csc = 0;
 	int value;
 	int i;
+	int colorimetry;
+	u8 vic = drm_match_cea_mode(mode);
+
+	if (vic == 6 || vic == 7 || vic == 21 || vic == 22 ||
+	    vic == 2 || vic == 3 || vic == 17 || vic == 18)
+		colorimetry = HDMI_COLORIMETRY_ITU_601;
+	else
+		colorimetry = HDMI_COLORIMETRY_ITU_709;
+
 
 	/* Input video mode is SDR RGB24bit, data enable signal from external */
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
@@ -720,7 +668,7 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 			return 0;
 		}
 	} else {
-		if (inno_conn_state->colorimetry == HDMI_COLORIMETRY_ITU_601) {
+		if (colorimetry == HDMI_COLORIMETRY_ITU_601) {
 			if (conn_state->hdmi.output_format == HDMI_COLORSPACE_YUV444) {
 				csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
 				auto_csc = AUTO_CSC_DISABLE;
@@ -738,8 +686,7 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 	}
 
 	for (i = 0; i < 24; i++)
-		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
-			    coeff_csc[csc_mode][i]);
+		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i, coeff_csc[csc_mode][i]);
 
 	value = v_SOF_DISABLE | csc_enable | v_COLOR_DEPTH_NOT_INDICATED(1);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
@@ -753,15 +700,11 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 					 struct drm_display_mode *mode)
 {
-	int value, psync;
-
-	if (hdmi->variant->dev_type == RK3036_HDMI) {
-		psync = mode->flags & DRM_MODE_FLAG_PHSYNC ? RK3036_HDMI_PHSYNC : 0;
-		value = HIWORD_UPDATE(psync, RK3036_HDMI_PHSYNC);
-		psync = mode->flags & DRM_MODE_FLAG_PVSYNC ? RK3036_HDMI_PVSYNC : 0;
-		value |= HIWORD_UPDATE(psync, RK3036_HDMI_PVSYNC);
-		regmap_write(hdmi->grf, RK3036_GRF_SOC_CON2, value);
-	}
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
+	u32 value;
+
+	if (plat_ops && plat_ops->enable)
+		plat_ops->enable(hdmi->dev, mode);
 
 	/* Set detail external video timing polarity and interlace mode */
 	value = v_EXTERANL_VIDEO(1);
@@ -810,14 +753,16 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static int inno_hdmi_setup(struct inno_hdmi *hdmi,
-			   struct drm_atomic_state *state)
+static int inno_hdmi_setup(struct inno_hdmi *hdmi, struct drm_atomic_state *state)
 {
-	struct drm_connector *connector = &hdmi->connector;
-	struct drm_display_info *display = &connector->display_info;
+	struct drm_bridge *bridge = &hdmi->bridge;
+	struct drm_connector *connector;
+	struct drm_display_info *info;
 	struct drm_connector_state *new_conn_state;
 	struct drm_crtc_state *new_crtc_state;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+
 	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
 	if (WARN_ON(!new_conn_state))
 		return -EINVAL;
@@ -826,17 +771,18 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	if (WARN_ON(!new_crtc_state))
 		return -EINVAL;
 
+	info = &connector->display_info;
+
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
 		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
 
 	/* Set HDMI Mode */
-	hdmi_writeb(hdmi, HDMI_HDCP_CTRL,
-		    v_HDMI_DVI(display->is_hdmi));
+	hdmi_writeb(hdmi, HDMI_HDCP_CTRL, v_HDMI_DVI(info->is_hdmi));
 
 	inno_hdmi_config_video_timing(hdmi, &new_crtc_state->adjusted_mode);
 
-	inno_hdmi_config_video_csc(hdmi);
+	inno_hdmi_config_video_csc(hdmi, connector, &new_crtc_state->adjusted_mode);
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
@@ -857,9 +803,11 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
-							 const struct drm_display_mode *mode)
+static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+							const struct drm_display_info *info,
+							const struct drm_display_mode *mode)
 {
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 	unsigned long mpixelclk, max_tolerance;
 	long rounded_refclk;
 
@@ -889,189 +837,56 @@ static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
 	return MODE_OK;
 }
 
-static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
-				     struct drm_atomic_state *state)
-{
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-
-	inno_hdmi_setup(hdmi, state);
-}
-
-static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
-				      struct drm_atomic_state *state)
-{
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-
-	inno_hdmi_standby(hdmi);
-}
-
-static int
-inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_connector_state *conn_state)
-{
-	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	u8 vic = drm_match_cea_mode(mode);
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
-
-	s->output_mode = ROCKCHIP_OUT_MODE_P888;
-	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
-
-	if (vic == 6 || vic == 7 ||
-	    vic == 21 || vic == 22 ||
-	    vic == 2 || vic == 3 ||
-	    vic == 17 || vic == 18)
-		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_601;
-	else
-		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
-
-	return 0;
-}
-
-static const struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
-	.atomic_check	= inno_hdmi_encoder_atomic_check,
-	.atomic_enable	= inno_hdmi_encoder_enable,
-	.atomic_disable	= inno_hdmi_encoder_disable,
-};
-
-static enum drm_connector_status
-inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
+static enum drm_connector_status inno_hdmi_bridge_detect(struct drm_bridge *bridge)
 {
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
 	return (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
 		connector_status_connected : connector_status_disconnected;
 }
 
-static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
+static const struct drm_edid *
+inno_hdmi_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 	const struct drm_edid *drm_edid;
-	int ret = 0;
-
-	if (!hdmi->ddc)
-		return 0;
-
-	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	return ret;
-}
-
-static enum drm_mode_status
-inno_hdmi_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
-
-	return  inno_hdmi_display_mode_valid(hdmi, mode);
-}
 
-static void
-inno_hdmi_connector_destroy_state(struct drm_connector *connector,
-				  struct drm_connector_state *state)
-{
-	struct inno_hdmi_connector_state *inno_conn_state =
-						to_inno_hdmi_conn_state(state);
+	drm_edid = drm_edid_read_ddc(connector, bridge->ddc);
+	if (!drm_edid)
+		dev_dbg(hdmi->dev, "failed to get edid\n");
 
-	__drm_atomic_helper_connector_destroy_state(&inno_conn_state->base);
-	kfree(inno_conn_state);
+	return drm_edid;
 }
 
-static void inno_hdmi_connector_reset(struct drm_connector *connector)
+static void inno_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					   struct drm_atomic_state *state)
 {
-	struct inno_hdmi_connector_state *inno_conn_state;
-
-	if (connector->state) {
-		inno_hdmi_connector_destroy_state(connector, connector->state);
-		connector->state = NULL;
-	}
-
-	inno_conn_state = kzalloc(sizeof(*inno_conn_state), GFP_KERNEL);
-	if (!inno_conn_state)
-		return;
-
-	__drm_atomic_helper_connector_reset(connector, &inno_conn_state->base);
-	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
-	inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
+	inno_hdmi_setup(hdmi, state);
 }
 
-static struct drm_connector_state *
-inno_hdmi_connector_duplicate_state(struct drm_connector *connector)
+static void inno_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					    struct drm_atomic_state *state)
 {
-	struct inno_hdmi_connector_state *inno_conn_state;
-
-	if (WARN_ON(!connector->state))
-		return NULL;
-
-	inno_conn_state = kmemdup(to_inno_hdmi_conn_state(connector->state),
-				  sizeof(*inno_conn_state), GFP_KERNEL);
-
-	if (!inno_conn_state)
-		return NULL;
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
-	__drm_atomic_helper_connector_duplicate_state(connector,
-						      &inno_conn_state->base);
-
-	return &inno_conn_state->base;
+	inno_hdmi_standby(hdmi);
 }
 
-static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = inno_hdmi_connector_detect,
-	.reset = inno_hdmi_connector_reset,
-	.atomic_duplicate_state = inno_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = inno_hdmi_connector_destroy_state,
-};
-
-static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
-	.get_modes = inno_hdmi_connector_get_modes,
-	.mode_valid = inno_hdmi_connector_mode_valid,
+static const struct drm_bridge_funcs inno_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_enable = inno_hdmi_bridge_atomic_enable,
+	.atomic_disable = inno_hdmi_bridge_atomic_disable,
+	.detect = inno_hdmi_bridge_detect,
+	.edid_read = inno_hdmi_bridge_edid_read,
+	.hdmi_clear_infoframe = inno_hdmi_bridge_clear_infoframe,
+	.hdmi_write_infoframe = inno_hdmi_bridge_write_infoframe,
+	.mode_valid = inno_hdmi_bridge_mode_valid,
 };
 
-static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
-{
-	struct drm_encoder *encoder = &hdmi->encoder.encoder;
-	struct device *dev = hdmi->dev;
-
-	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-
-	/*
-	 * If we failed to find the CRTC(s) which this encoder is
-	 * supposed to be connected to, it's because the CRTC has
-	 * not been registered yet.  Defer probing, and hope that
-	 * the required CRTC is added later.
-	 */
-	if (encoder->possible_crtcs == 0)
-		return -EPROBE_DEFER;
-
-	drm_encoder_helper_add(encoder, &inno_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-
-	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(&hdmi->connector,
-				 &inno_hdmi_connector_helper_funcs);
-	drmm_connector_hdmi_init(drm, &hdmi->connector,
-				 "Rockchip", "Inno HDMI",
-				 &inno_hdmi_connector_funcs,
-				 &inno_hdmi_hdmi_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA,
-				 hdmi->ddc,
-				 BIT(HDMI_COLORSPACE_RGB),
-				 8);
-
-	drm_connector_attach_encoder(&hdmi->connector, encoder);
-
-	return 0;
-}
-
 static irqreturn_t inno_hdmi_i2c_irq(struct inno_hdmi *hdmi)
 {
 	struct inno_hdmi_i2c *i2c = hdmi->i2c;
@@ -1111,7 +926,7 @@ static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
 {
 	struct inno_hdmi *hdmi = dev_id;
 
-	drm_helper_hpd_irq_event(hdmi->connector.dev);
+	drm_helper_hpd_irq_event(hdmi->bridge.dev);
 
 	return IRQ_HANDLED;
 }
@@ -1243,128 +1058,80 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	return adap;
 }
 
-static int inno_hdmi_bind(struct device *dev, struct device *master,
-				 void *data)
+struct inno_hdmi *inno_hdmi_bind(struct device *dev,
+				 struct drm_encoder *encoder,
+				 const struct inno_hdmi_plat_data *plat_data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = data;
 	struct inno_hdmi *hdmi;
-	const struct inno_hdmi_variant *variant;
 	int irq;
 	int ret;
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
-
-	hdmi->dev = dev;
+	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
+		dev_err(dev, "Missing platform PHY ops\n");
+		return ERR_PTR(-ENODEV);
+	}
 
-	variant = of_device_get_match_data(hdmi->dev);
-	if (!variant)
-		return -EINVAL;
+	hdmi = devm_drm_bridge_alloc(dev, struct inno_hdmi, bridge, &inno_hdmi_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return ERR_CAST(hdmi);
 
-	hdmi->variant = variant;
+	hdmi->dev = dev;
+	hdmi->plat_data = plat_data;
 
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
-		return PTR_ERR(hdmi->regs);
+		return ERR_CAST(hdmi->regs);
 
 	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
-	if (IS_ERR(hdmi->pclk))
-		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
+	if (IS_ERR(hdmi->pclk)) {
+		dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
+		return ERR_CAST(hdmi->pclk);
+	}
 
 	hdmi->refclk = devm_clk_get_optional_enabled(hdmi->dev, "ref");
-	if (IS_ERR(hdmi->refclk))
-		return dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
-
-	if (hdmi->variant->dev_type == RK3036_HDMI) {
-		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
-		if (IS_ERR(hdmi->grf))
-			return dev_err_probe(dev,
-					     PTR_ERR(hdmi->grf), "Unable to get rockchip,grf\n");
+	if (IS_ERR(hdmi->refclk)) {
+		dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
+		return ERR_CAST(hdmi->refclk);
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
 	inno_hdmi_init_hw(hdmi);
 
-	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
-	if (IS_ERR(hdmi->ddc))
-		return PTR_ERR(hdmi->ddc);
-
-	ret = inno_hdmi_register(drm, hdmi);
-	if (ret)
-		return ret;
-
-	dev_set_drvdata(dev, hdmi);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return ERR_PTR(irq);
 
 	ret = devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
 					inno_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
-	if (ret < 0)
-		goto err_cleanup_hdmi;
-
-	return 0;
-err_cleanup_hdmi:
-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-	return ret;
-}
-
-static void inno_hdmi_unbind(struct device *dev, struct device *master,
-			     void *data)
-{
-	struct inno_hdmi *hdmi = dev_get_drvdata(dev);
-
-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-}
+	if (ret)
+		return ERR_PTR(ret);
 
-static const struct component_ops inno_hdmi_ops = {
-	.bind	= inno_hdmi_bind,
-	.unbind	= inno_hdmi_unbind,
-};
+	hdmi->bridge.driver_private = hdmi;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
+			   DRM_BRIDGE_OP_EDID |
+			   DRM_BRIDGE_OP_HDMI |
+			   DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.vendor = "Inno";
+	hdmi->bridge.product = "Inno HDMI";
+
+	hdmi->bridge.ddc = inno_hdmi_i2c_adapter(hdmi);
+	if (IS_ERR(hdmi->bridge.ddc))
+		return ERR_CAST(hdmi->bridge.ddc);
+
+	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
+	if (ret)
+		return ERR_PTR(ret);
 
-static int inno_hdmi_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &inno_hdmi_ops);
-}
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ERR_PTR(ret);
 
-static void inno_hdmi_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &inno_hdmi_ops);
+	return hdmi;
 }
-
-static const struct inno_hdmi_variant rk3036_inno_hdmi_variant = {
-	.dev_type = RK3036_HDMI,
-	.phy_configs = rk3036_hdmi_phy_configs,
-	.default_phy_config = &rk3036_hdmi_phy_configs[1],
-};
-
-static const struct inno_hdmi_variant rk3128_inno_hdmi_variant = {
-	.dev_type = RK3128_HDMI,
-	.phy_configs = rk3128_hdmi_phy_configs,
-	.default_phy_config = &rk3128_hdmi_phy_configs[1],
-};
-
-static const struct of_device_id inno_hdmi_dt_ids[] = {
-	{ .compatible = "rockchip,rk3036-inno-hdmi",
-	  .data = &rk3036_inno_hdmi_variant,
-	},
-	{ .compatible = "rockchip,rk3128-inno-hdmi",
-	  .data = &rk3128_inno_hdmi_variant,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, inno_hdmi_dt_ids);
-
-struct platform_driver inno_hdmi_driver = {
-	.probe  = inno_hdmi_probe,
-	.remove = inno_hdmi_remove,
-	.driver = {
-		.name = "innohdmi-rockchip",
-		.of_match_table = inno_hdmi_dt_ids,
-	},
-};
+EXPORT_SYMBOL_GPL(inno_hdmi_bind);
+MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
+MODULE_DESCRIPTION("INNOSILICON HDMI transmitter library");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index cb8ff41dca2fc..67d1c8c3082a2 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -12,6 +12,7 @@ config DRM_ROCKCHIP
 	select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
 	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
+	select DRM_INNO_HDMI if ROCKCHIP_INNO_HDMI
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
 	select DRM_DW_MIPI_DSI2 if ROCKCHIP_DW_MIPI_DSI2
 	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
index 2b867cebbc121..11176db14af6e 100644
--- a/drivers/gpu/drm/rockchip/Makefile
+++ b/drivers/gpu/drm/rockchip/Makefile
@@ -14,7 +14,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI_QP) += dw_hdmi_qp-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI2) += dw-mipi-dsi2-rockchip.o
-rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
+rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) += rockchip_lvds.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RGB) += rockchip_rgb.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RK3066_HDMI) += rk3066_hdmi.o
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
new file mode 100644
index 0000000000000..31cb2a90308c1
--- /dev/null
+++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) Rockchip Electronics Co., Ltd.
+ *    Zheng Yang <zhengyang@rock-chips.com>
+ *    Andy Yan <andy.yan@rock-chips.com>
+ */
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/bridge/inno_hdmi.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_of.h>
+
+#include "rockchip_drm_drv.h"
+
+#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
+
+#define RK3036_GRF_SOC_CON2	0x148
+#define RK3036_HDMI_PHSYNC	BIT(4)
+#define RK3036_HDMI_PVSYNC	BIT(5)
+
+enum inno_hdmi_dev_type {
+	RK3036_HDMI,
+	RK3128_HDMI,
+};
+
+struct inno_hdmi_connector_state {
+	struct drm_connector_state	base;
+	unsigned int			colorimetry;
+};
+
+struct rockchip_inno_hdmi {
+	struct inno_hdmi *base;
+	struct device *dev;
+	struct regmap *grf;
+	struct rockchip_encoder encoder;
+};
+
+static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] = {
+	{  74250000, 0x3f, 0xbb },
+	{ 165000000, 0x6f, 0xbb },
+	{      ~0UL, 0x00, 0x00 }
+};
+
+static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] = {
+	{  74250000, 0x3f, 0xaa },
+	{ 165000000, 0x5f, 0xaa },
+	{      ~0UL, 0x00, 0x00 }
+};
+
+static void inno_hdmi_rk3036_enable(struct device *dev, struct drm_display_mode *mode)
+{
+	struct rockchip_inno_hdmi *hdmi = dev_get_drvdata(dev);
+	int value, psync;
+
+	psync = mode->flags & DRM_MODE_FLAG_PHSYNC ? RK3036_HDMI_PHSYNC : 0;
+	value = HIWORD_UPDATE(psync, RK3036_HDMI_PHSYNC);
+	psync = mode->flags & DRM_MODE_FLAG_PVSYNC ? RK3036_HDMI_PVSYNC : 0;
+	value |= HIWORD_UPDATE(psync, RK3036_HDMI_PVSYNC);
+	regmap_write(hdmi->grf, RK3036_GRF_SOC_CON2, value);
+}
+
+static int inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+
+	s->output_mode = ROCKCHIP_OUT_MODE_P888;
+	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs inno_hdmi_rockchip_encoder_helper_funcs = {
+	.atomic_check	= inno_hdmi_encoder_atomic_check,
+};
+
+static int inno_hdmi_rockchip_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct rockchip_inno_hdmi *hdmi;
+	const struct inno_hdmi_plat_data *plat_data;
+	int ret;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->dev = dev;
+
+	plat_data = of_device_get_match_data(hdmi->dev);
+	if (!plat_data)
+		return -EINVAL;
+
+	if (of_device_is_compatible(dev->of_node, "rockchip,rk3036-inno-hdmi")) {
+		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
+		if (IS_ERR(hdmi->grf))
+			return dev_err_probe(dev,
+					     PTR_ERR(hdmi->grf), "Unable to get rockchip,grf\n");
+	}
+
+	encoder = &hdmi->encoder.encoder;
+	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
+
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet.  Defer probing, and hope that
+	 * the required CRTC is added later.
+	 */
+	if (encoder->possible_crtcs == 0)
+		return -EPROBE_DEFER;
+
+	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
+
+	drm_encoder_helper_add(encoder, &inno_hdmi_rockchip_encoder_helper_funcs);
+
+	dev_set_drvdata(dev, hdmi);
+
+	hdmi->base = inno_hdmi_bind(dev, encoder, plat_data);
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
+		return ret;
+	}
+
+	return drm_connector_attach_encoder(connector, encoder);
+}
+
+static const struct component_ops inno_hdmi_rockchip_ops = {
+	.bind	= inno_hdmi_rockchip_bind,
+};
+
+static int inno_hdmi_rockchip_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &inno_hdmi_rockchip_ops);
+}
+
+static void inno_hdmi_rockchip_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &inno_hdmi_rockchip_ops);
+}
+
+static const struct inno_hdmi_plat_ops rk3036_inno_hdmi_plat_ops = {
+	.enable = inno_hdmi_rk3036_enable,
+};
+
+static const struct inno_hdmi_plat_data rk3036_inno_hdmi_plat_data = {
+	.ops = &rk3036_inno_hdmi_plat_ops,
+	.phy_configs = rk3036_hdmi_phy_configs,
+	.default_phy_config = &rk3036_hdmi_phy_configs[1],
+};
+
+static const struct inno_hdmi_plat_data rk3128_inno_hdmi_plat_data = {
+	.phy_configs = rk3128_hdmi_phy_configs,
+	.default_phy_config = &rk3128_hdmi_phy_configs[1],
+};
+
+static const struct of_device_id inno_hdmi_rockchip_dt_ids[] = {
+	{ .compatible = "rockchip,rk3036-inno-hdmi",
+	  .data = &rk3036_inno_hdmi_plat_data,
+	},
+	{ .compatible = "rockchip,rk3128-inno-hdmi",
+	  .data = &rk3128_inno_hdmi_plat_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, inno_hdmi_rockchip_dt_ids);
+
+struct platform_driver inno_hdmi_driver = {
+	.probe  = inno_hdmi_rockchip_probe,
+	.remove = inno_hdmi_rockchip_remove,
+	.driver = {
+		.name = "innohdmi-rockchip",
+		.of_match_table = inno_hdmi_rockchip_dt_ids,
+	},
+};
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
new file mode 100644
index 0000000000000..8b39655212e24
--- /dev/null
+++ b/include/drm/bridge/inno_hdmi.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef __INNO_HDMI__
+#define __INNO_HDMI__
+
+struct device;
+struct drm_encoder;
+struct drm_display_mode;
+struct inno_hdmi;
+
+struct inno_hdmi_plat_ops {
+	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
+};
+
+struct inno_hdmi_phy_config {
+	unsigned long pixelclock;
+	u8 pre_emphasis;
+	u8 voltage_level_control;
+};
+
+struct inno_hdmi_plat_data {
+	const struct inno_hdmi_plat_ops *ops;
+	struct inno_hdmi_phy_config *phy_configs;
+	struct inno_hdmi_phy_config *default_phy_config;
+};
+
+struct inno_hdmi *inno_hdmi_bind(struct device *pdev,
+				 struct drm_encoder *encoder,
+				 const struct inno_hdmi_plat_data *plat_data);
+#endif /* __INNO_HDMI__ */
-- 
2.43.0

