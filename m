Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6051E18ED
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA7B89F03;
	Tue, 26 May 2020 01:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6518889DA6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:43 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17285DC3;
 Tue, 26 May 2020 03:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455742;
 bh=OPcNevIzGVBERxc4SlPiLT/vm7s14OgcBHJEElRMWZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p0LZGK/3nrFfRzLVrpVHvnp3vWu4ZpWAcChX4aQ5rC5l/IraPs1BYPlcokTQ59ad9
 rQc47c5eZQLeHm5sps1hcsOtxDQZBqn6IKQbicrnLhPqZh4nPT5kGocvUd5tNuwpTu
 jacgzKxfu9r5MoJn+gwg8Tv+Bst6O1AIOQvsTl2o=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/27] drm: bridge: dw-hdmi: Pass drm_display_info to
 .mode_valid()
Date: Tue, 26 May 2020 04:14:53 +0300
Message-Id: <20200526011505.31884-16-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the drm_connector pointer passed to the .mode_valid() function
with a const drm_display_info pointer, as that's all the function should
need. Use the display info passed to the bridge .mode_valid() operation
instead of retrieving it from the connector, to prepare for make
connector creation optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  5 ++---
 drivers/gpu/drm/imx/dw_hdmi-imx.c           |  4 ++--
 drivers/gpu/drm/meson/meson_dw_hdmi.c       | 20 ++++++++++----------
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      |  2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h       |  2 +-
 include/drm/bridge/dw_hdmi.h                |  4 ++--
 8 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index adc5a95a06e9..23650e69604c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2769,7 +2769,6 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
-	struct drm_connector *connector = &hdmi->connector;
 	enum drm_mode_status mode_status = MODE_OK;
 
 	/* We don't support double-clocked modes */
@@ -2777,8 +2776,8 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_BAD;
 
 	if (pdata->mode_valid)
-		mode_status = pdata->mode_valid(hdmi, pdata->priv_data,
-						connector, mode);
+		mode_status = pdata->mode_valid(hdmi, pdata->priv_data, info,
+						mode);
 
 	return mode_status;
 }
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index 95aed4666c95..2dc93fa6ecb6 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -146,7 +146,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
 
 static enum drm_mode_status
 imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
-		      struct drm_connector *con,
+		      const struct drm_display_info *info,
 		      const struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
@@ -160,7 +160,7 @@ imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 
 static enum drm_mode_status
 imx6dl_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
-		       struct drm_connector *con,
+		       const struct drm_display_info *info,
 		       const struct drm_display_mode *mode)
 {
 	if (mode->clock < 13500)
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 34ba94922605..71d599970ec7 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -631,12 +631,12 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
 
 static enum drm_mode_status
 dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
-		   struct drm_connector *connector,
+		   const struct drm_display_info *display_info,
 		   const struct drm_display_mode *mode)
 {
 	struct meson_dw_hdmi *dw_hdmi = data;
 	struct meson_drm *priv = dw_hdmi->priv;
-	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
+	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
 	unsigned int phy_freq;
 	unsigned int vclk_freq;
 	unsigned int venc_freq;
@@ -647,10 +647,10 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 
 	/* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
-	if (connector->display_info.max_tmds_clock &&
-	    mode->clock > connector->display_info.max_tmds_clock &&
-	    !drm_mode_is_420_only(&connector->display_info, mode) &&
-	    !drm_mode_is_420_also(&connector->display_info, mode))
+	if (display_info->max_tmds_clock &&
+	    mode->clock > display_info->max_tmds_clock &&
+	    !drm_mode_is_420_only(display_info, mode) &&
+	    !drm_mode_is_420_also(display_info, mode))
 		return MODE_BAD;
 
 	/* Check against non-VIC supported modes */
@@ -667,9 +667,9 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 	vclk_freq = mode->clock;
 
 	/* For 420, pixel clock is half unlike venc clock */
-	if (drm_mode_is_420_only(&connector->display_info, mode) ||
+	if (drm_mode_is_420_only(display_info, mode) ||
 	    (!is_hdmi2_sink &&
-	     drm_mode_is_420_also(&connector->display_info, mode)))
+	     drm_mode_is_420_also(display_info, mode)))
 		vclk_freq /= 2;
 
 	/* TMDS clock is pixel_clock * 10 */
@@ -684,9 +684,9 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 
 	/* VENC double pixels for 1080i, 720p and YUV420 modes */
 	if (meson_venc_hdmi_venc_repeat(vic) ||
-	    drm_mode_is_420_only(&connector->display_info, mode) ||
+	    drm_mode_is_420_only(display_info, mode) ||
 	    (!is_hdmi2_sink &&
-	     drm_mode_is_420_also(&connector->display_info, mode)))
+	     drm_mode_is_420_also(display_info, mode)))
 		venc_freq *= 2;
 
 	vclk_freq = max(venc_freq, hdmi_freq);
diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index d0dffe55a7cb..7b8ec8310699 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -39,7 +39,7 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
 
 static enum drm_mode_status
 rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
-		     struct drm_connector *connector,
+		     const struct drm_display_info *info,
 		     const struct drm_display_mode *mode)
 {
 	/*
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index d08f86783a28..d286751bb333 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -221,7 +221,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 
 static enum drm_mode_status
 dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
-			    struct drm_connector *connector,
+			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode)
 {
 	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 0a3637442ba6..d4c08043dd81 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -32,7 +32,7 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
 
 static enum drm_mode_status
 sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi, void *data,
-			      struct drm_connector *connector,
+			      const struct drm_display_info *info,
 			      const struct drm_display_mode *mode)
 {
 	if (mode->clock > 297000)
@@ -43,7 +43,7 @@ sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi, void *data,
 
 static enum drm_mode_status
 sun8i_dw_hdmi_mode_valid_h6(struct dw_hdmi *hdmi, void *data,
-			    struct drm_connector *connector,
+			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode)
 {
 	/*
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 8587b8d2590e..d983746fa194 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -177,7 +177,7 @@ struct sun8i_hdmi_phy {
 
 struct sun8i_dw_hdmi_quirks {
 	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
-					   struct drm_connector *connector,
+					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 	unsigned int set_rate : 1;
 	unsigned int use_drm_infoframe : 1;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 5dfa9d83e2d3..fec293b21c2e 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -8,7 +8,7 @@
 
 #include <sound/hdmi-codec.h>
 
-struct drm_connector;
+struct drm_display_info;
 struct drm_display_mode;
 struct drm_encoder;
 struct dw_hdmi;
@@ -137,7 +137,7 @@ struct dw_hdmi_plat_data {
 
 	/* Platform-specific mode validation (optional). */
 	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
-					   struct drm_connector *connector,
+					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 
 	/* Vendor PHY support */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
