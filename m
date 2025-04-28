Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A097CA9EDC6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 12:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8CA10E3EF;
	Mon, 28 Apr 2025 10:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ICqoQGjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2353010E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=6sCIv
 I1DWDP8J3OnEjie52hCc+L8DYiyY5nifNG4kyo=; b=ICqoQGjjKLuhxEzw/KxD/
 K6y7Y7Hbq861tRUchInnjZRgjaOVF51ksO/2KTrw2je570anD1ndhB+TcEnKjop7
 ZJ1btdYhMBZtVJ6rXIglAo1gUoMa/03XnlEJY2FXqzdxkMWz/DvHla3jeuI4/gvn
 gZyPSP0w7ZOfY4SEdHZfiA=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wD311sPVw9oDBZeDA--.10563S2; 
 Mon, 28 Apr 2025 18:23:14 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: mripard@kernel.org, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: rk3066_hdmi: switch to drm bridge
Date: Mon, 28 Apr 2025 18:23:07 +0800
Message-ID: <20250428102309.1501986-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD311sPVw9oDBZeDA--.10563S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3tr1Dtr1fZFW5WFyDZF1xGrg_yoW8AF1fXo
 ZxJwn3Xw4rG348WFWvy3WUKr4jqa1ktr1fXw45GFWDua1DG3yqq347CryjqFW7WF1aqrW5
 Z3Wvyr1fXFnrCF4kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsUUUUUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAk9XmgPURumhAABsM
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

Note: I don't have the hardware to test this driver, so for now
I can only do the compilation test.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 315 ++++++++++++-------------
 1 file changed, 146 insertions(+), 169 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f7a4601903134..a2268abc30c5b 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -5,6 +5,9 @@
  */
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
@@ -46,27 +49,20 @@ struct rk3066_hdmi {
 	struct clk *hclk;
 	void __iomem *regs;
 
-	struct drm_connector connector;
+	struct drm_bridge bridge;
+	struct drm_connector *connector;
 	struct rockchip_encoder encoder;
 
 	struct rk3066_hdmi_i2c *i2c;
-	struct i2c_adapter *ddc;
 
 	unsigned int tmdsclk;
 
 	struct hdmi_data_info hdmi_data;
 };
 
-static struct rk3066_hdmi *encoder_to_rk3066_hdmi(struct drm_encoder *encoder)
+static struct rk3066_hdmi *bridge_to_rk3066_hdmi(struct drm_bridge *bridge)
 {
-	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-	return container_of(rkencoder, struct rk3066_hdmi, encoder);
-}
-
-static struct rk3066_hdmi *connector_to_rk3066_hdmi(struct drm_connector *connector)
-{
-	return container_of(connector, struct rk3066_hdmi, connector);
+	return container_of(bridge, struct rk3066_hdmi, bridge);
 }
 
 static inline u8 hdmi_readb(struct rk3066_hdmi *hdmi, u16 offset)
@@ -161,57 +157,40 @@ static void rk3066_hdmi_set_power_mode(struct rk3066_hdmi *hdmi, int mode)
 		hdmi->tmdsclk = DEFAULT_PLLA_RATE;
 }
 
-static int
-rk3066_hdmi_upload_frame(struct rk3066_hdmi *hdmi, int setup_rc,
-			 union hdmi_infoframe *frame, u32 frame_index,
-			 u32 mask, u32 disable, u32 enable)
+static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
+					      enum hdmi_infoframe_type type)
 {
-	if (mask)
-		hdmi_modb(hdmi, HDMI_CP_AUTO_SEND_CTRL, mask, disable);
-
-	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, frame_index);
-
-	if (setup_rc >= 0) {
-		u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-		ssize_t rc, i;
+	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-		rc = hdmi_infoframe_pack(frame, packed_frame,
-					 sizeof(packed_frame));
-		if (rc < 0)
-			return rc;
-
-		for (i = 0; i < rc; i++)
-			hdmi_writeb(hdmi, HDMI_CP_BUF_ACC_HB0 + i * 4,
-				    packed_frame[i]);
-
-		if (mask)
-			hdmi_modb(hdmi, HDMI_CP_AUTO_SEND_CTRL, mask, enable);
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
+		return 0;
 	}
 
-	return setup_rc;
+	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
+
+	return 0;
 }
 
-static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
-				  struct drm_display_mode *mode)
+static int
+rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
+				   enum hdmi_infoframe_type type,
+				   const u8 *buffer, size_t len)
 {
-	union hdmi_infoframe frame;
-	int rc;
+	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
+	ssize_t i;
 
-	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						      &hdmi->connector, mode);
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
+		return 0;
+	}
 
-	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
-	else if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV422)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
-	else
-		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
+	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
 
-	frame.avi.colorimetry = hdmi->hdmi_data.colorimetry;
-	frame.avi.scan_mode = HDMI_SCAN_MODE_NONE;
+	for (i = 0; i < len; i++)
+		hdmi_writeb(hdmi, HDMI_CP_BUF_ACC_HB0 + i * 4, buffer[i]);
 
-	return rk3066_hdmi_upload_frame(hdmi, rc, &frame,
-					HDMI_INFOFRAME_AVI, 0, 0, 0);
+	return 0;
 }
 
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
@@ -324,9 +303,27 @@ static void rk3066_hdmi_config_phy(struct rk3066_hdmi *hdmi)
 }
 
 static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
-			     struct drm_display_mode *mode)
+			     struct drm_atomic_state *state)
 {
-	struct drm_display_info *display = &hdmi->connector.display_info;
+	struct drm_bridge *bridge = &hdmi->bridge;
+	struct drm_connector *connector;
+	struct drm_display_info *display;
+	struct drm_display_mode *mode;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *new_crtc_state;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!new_conn_state))
+		return -EINVAL;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
+	if (WARN_ON(!new_crtc_state))
+		return -EINVAL;
+
+	display = &connector->display_info;
+	mode = &new_crtc_state->adjusted_mode;
 
 	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
 	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
@@ -363,7 +360,7 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	if (display->is_hdmi) {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK,
 			  HDMI_VIDEO_MODE_HDMI);
-		rk3066_hdmi_config_avi(hdmi, mode);
+		drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 	} else {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK, 0);
 	}
@@ -386,15 +383,15 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	return 0;
 }
 
-static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
+static void rk3066_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 				       struct drm_atomic_state *state)
 {
-	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	int mux, val;
 
-	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
+	conn_state = drm_atomic_get_new_connector_state(state, hdmi->connector);
 	if (WARN_ON(!conn_state))
 		return;
 
@@ -402,7 +399,7 @@ static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
 	if (WARN_ON(!crtc_state))
 		return;
 
-	mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
+	mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, &hdmi->encoder.encoder);
 	if (mux)
 		val = (HDMI_VIDEO_SEL << 16) | HDMI_VIDEO_SEL;
 	else
@@ -413,13 +410,13 @@ static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
 	DRM_DEV_DEBUG(hdmi->dev, "hdmi encoder enable select: vop%s\n",
 		      (mux) ? "1" : "0");
 
-	rk3066_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+	rk3066_hdmi_setup(hdmi, state);
 }
 
-static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder,
-					struct drm_atomic_state *state)
+static void rk3066_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *state)
 {
-	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
 	DRM_DEV_DEBUG(hdmi->dev, "hdmi encoder disable\n");
 
@@ -450,39 +447,34 @@ rk3066_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 static const
 struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
 	.atomic_check   = rk3066_hdmi_encoder_atomic_check,
-	.atomic_enable  = rk3066_hdmi_encoder_enable,
-	.atomic_disable = rk3066_hdmi_encoder_disable,
 };
 
 static enum drm_connector_status
-rk3066_hdmi_connector_detect(struct drm_connector *connector, bool force)
+rk3066_hdmi_bridge_detect(struct drm_bridge *bridge)
 {
-	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
+	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
 	return (hdmi_readb(hdmi, HDMI_HPG_MENS_STA) & HDMI_HPG_IN_STATUS_HIGH) ?
 		connector_status_connected : connector_status_disconnected;
 }
 
-static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
+static const struct drm_edid *
+rk3066_hdmi_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
+	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	const struct drm_edid *drm_edid;
-	int ret = 0;
-
-	if (!hdmi->ddc)
-		return 0;
 
-	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
+	drm_edid = drm_edid_read_ddc(connector, bridge->ddc);
+	if (!drm_edid)
+		dev_dbg(hdmi->dev, "failed to get edid\n");
 
-	return ret;
+	return drm_edid;
 }
 
 static enum drm_mode_status
-rk3066_hdmi_connector_mode_valid(struct drm_connector *connector,
-				 const struct drm_display_mode *mode)
+rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+			      const struct drm_display_info *info,
+			      const struct drm_display_mode *mode)
 {
 	u32 vic = drm_match_cea_mode(mode);
 
@@ -492,82 +484,19 @@ rk3066_hdmi_connector_mode_valid(struct drm_connector *connector,
 		return MODE_BAD;
 }
 
-static struct drm_encoder *
-rk3066_hdmi_connector_best_encoder(struct drm_connector *connector)
-{
-	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
-
-	return &hdmi->encoder.encoder;
-}
-
-static int
-rk3066_hdmi_probe_single_connector_modes(struct drm_connector *connector,
-					 uint32_t maxX, uint32_t maxY)
-{
-	if (maxX > 1920)
-		maxX = 1920;
-	if (maxY > 1080)
-		maxY = 1080;
-
-	return drm_helper_probe_single_connector_modes(connector, maxX, maxY);
-}
-
-static void rk3066_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static const struct drm_connector_funcs rk3066_hdmi_connector_funcs = {
-	.fill_modes = rk3066_hdmi_probe_single_connector_modes,
-	.detect = rk3066_hdmi_connector_detect,
-	.destroy = rk3066_hdmi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_enable = rk3066_hdmi_bridge_atomic_enable,
+	.atomic_disable = rk3066_hdmi_bridge_atomic_disable,
+	.detect = rk3066_hdmi_bridge_detect,
+	.edid_read = rk3066_hdmi_bridge_edid_read,
+	.hdmi_clear_infoframe = rk3066_hdmi_bridge_clear_infoframe,
+	.hdmi_write_infoframe = rk3066_hdmi_bridge_write_infoframe,
+	.mode_valid = rk3066_hdmi_bridge_mode_valid,
 };
 
-static const
-struct drm_connector_helper_funcs rk3066_hdmi_connector_helper_funcs = {
-	.get_modes = rk3066_hdmi_connector_get_modes,
-	.mode_valid = rk3066_hdmi_connector_mode_valid,
-	.best_encoder = rk3066_hdmi_connector_best_encoder,
-};
-
-static int
-rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
-{
-	struct drm_encoder *encoder = &hdmi->encoder.encoder;
-	struct device *dev = hdmi->dev;
-
-	encoder->possible_crtcs =
-		drm_of_find_possible_crtcs(drm, dev->of_node);
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
-	drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-
-	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(&hdmi->connector,
-				 &rk3066_hdmi_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, &hdmi->connector,
-				    &rk3066_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
-
-	drm_connector_attach_encoder(&hdmi->connector, encoder);
-
-	return 0;
-}
 
 static irqreturn_t rk3066_hdmi_hardirq(int irq, void *dev_id)
 {
@@ -597,7 +526,7 @@ static irqreturn_t rk3066_hdmi_irq(int irq, void *dev_id)
 {
 	struct rk3066_hdmi *hdmi = dev_id;
 
-	drm_helper_hpd_irq_event(hdmi->connector.dev);
+	drm_helper_hpd_irq_event(hdmi->connector->dev);
 
 	return IRQ_HANDLED;
 }
@@ -720,7 +649,7 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
 	strscpy(adap->name, "RK3066 HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
-	ret = i2c_add_adapter(adap);
+	ret = devm_i2c_add_adapter(hdmi->dev, adap);
 	if (ret) {
 		DRM_DEV_ERROR(hdmi->dev, "cannot add %s I2C adapter\n",
 			      adap->name);
@@ -735,6 +664,66 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
 	return adap;
 }
 
+static int
+rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
+{
+	struct drm_encoder *encoder = &hdmi->encoder.encoder;
+	struct device *dev = hdmi->dev;
+	int ret;
+
+	encoder->possible_crtcs =
+		drm_of_find_possible_crtcs(drm, dev->of_node);
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
+	drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+
+	hdmi->bridge.driver_private = hdmi;
+	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
+			   DRM_BRIDGE_OP_EDID |
+			   DRM_BRIDGE_OP_HDMI |
+			   DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.of_node = hdmi->dev->of_node;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.vendor = "Rockchip";
+	hdmi->bridge.product = "RK3066 HDMI";
+
+	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
+	if (IS_ERR(hdmi->bridge.ddc))
+		return PTR_ERR(hdmi->bridge.ddc);
+
+	if (IS_ERR(hdmi->bridge.ddc))
+		return PTR_ERR(hdmi->bridge.ddc);
+
+	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
+	if (ret)
+		return ret;
+
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
+
+	hdmi->connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(hdmi->connector)) {
+		ret = PTR_ERR(hdmi->connector);
+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
+		return ret;
+	}
+
+	drm_connector_attach_encoder(hdmi->connector, encoder);
+
+	return 0;
+}
+
 static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 			    void *data)
 {
@@ -781,14 +770,7 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 	/* internal hclk = hdmi_hclk / 25 */
 	hdmi_writeb(hdmi, HDMI_INTERNAL_CLK_DIVIDER, 25);
 
-	hdmi->ddc = rk3066_hdmi_i2c_adapter(hdmi);
-	if (IS_ERR(hdmi->ddc)) {
-		ret = PTR_ERR(hdmi->ddc);
-		hdmi->ddc = NULL;
-		goto err_disable_hclk;
-	}
-
-	rk3066_hdmi_set_power_mode(hdmi, HDMI_SYS_POWER_MODE_B);
+		rk3066_hdmi_set_power_mode(hdmi, HDMI_SYS_POWER_MODE_B);
 	usleep_range(999, 1000);
 	hdmi_writeb(hdmi, HDMI_INTR_MASK1, HDMI_INTR_HOTPLUG);
 	hdmi_writeb(hdmi, HDMI_INTR_MASK2, 0);
@@ -798,7 +780,7 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 
 	ret = rk3066_hdmi_register(drm, hdmi);
 	if (ret)
-		goto err_disable_i2c;
+		goto err_disable_hclk;
 
 	dev_set_drvdata(dev, hdmi);
 
@@ -813,10 +795,7 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 	return 0;
 
 err_cleanup_hdmi:
-	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_disable_i2c:
-	i2c_put_adapter(hdmi->ddc);
 err_disable_hclk:
 	clk_disable_unprepare(hdmi->hclk);
 
@@ -828,10 +807,8 @@ static void rk3066_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
 
-	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
 
-	i2c_put_adapter(hdmi->ddc);
 	clk_disable_unprepare(hdmi->hclk);
 }
 
-- 
2.43.0

