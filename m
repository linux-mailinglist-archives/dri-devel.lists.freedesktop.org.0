Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8A01E18EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F8A89E86;
	Tue, 26 May 2020 01:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCEB89DA6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:45 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E31891184;
 Tue, 26 May 2020 03:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455744;
 bh=73KlFca9C/60d+P3S1vw6JEe9D2sxfQOSkTAHKylAEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sfl1Xx51oLjqsuqEvRhstojKDQRzmHgzHDYRoHCUZ8qYuwnDo+8/Io79g52F6CFfO
 QcRvHepbXOb2D9nB+jdzAOdQEXI1G+nxEi4jqWN3LGKABNQ5bRZlHvxIvX06ndZBfJ
 qQ+9Xhpvm6c4fAtK1mivAPnOJ4xI5gYhe7oLuxmM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/27] drm: bridge: dw-hdmi: Pass drm_display_info to
 dw_hdmi_support_scdc()
Date: Tue, 26 May 2020 04:14:56 +0300
Message-Id: <20200526011505.31884-19-laurent.pinchart+renesas@ideasonboard.com>
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

To prepare for making connector creation optional in the driver, pass
the drm_display_info explicitly to dw_hdmi_support_scdc(). The pointer
is passed to the callers where required, particularly to the
dw_hdmi_phy_ops .init() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 32 ++++++++++++---------
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |  3 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  1 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c      |  1 +
 include/drm/bridge/dw_hdmi.h                |  4 ++-
 5 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 5b5f07a23400..a18794cce0d8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1241,10 +1241,9 @@ void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 EXPORT_SYMBOL_GPL(dw_hdmi_phy_i2c_write);
 
 /* Filter out invalid setups to avoid configuring SCDC and scrambling */
-static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi)
+static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi,
+				 const struct drm_display_info *display)
 {
-	struct drm_display_info *display = &hdmi->connector.display_info;
-
 	/* Completely disable SCDC support for older controllers */
 	if (hdmi->version < 0x200a)
 		return false;
@@ -1282,12 +1281,13 @@ static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi)
  * helper should called right before enabling the TMDS Clock and Data in
  * the PHY configuration callback.
  */
-void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi)
+void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi,
+				       const struct drm_display_info *display)
 {
 	unsigned long mtmdsclock = hdmi->hdmi_data.video_mode.mtmdsclock;
 
 	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
-	if (dw_hdmi_support_scdc(hdmi)) {
+	if (dw_hdmi_support_scdc(hdmi, display)) {
 		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
 			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 1);
 		else
@@ -1490,7 +1490,8 @@ static int hdmi_phy_configure_dwc_hdmi_3d_tx(struct dw_hdmi *hdmi,
 	return 0;
 }
 
-static int hdmi_phy_configure(struct dw_hdmi *hdmi)
+static int hdmi_phy_configure(struct dw_hdmi *hdmi,
+			      const struct drm_display_info *display)
 {
 	const struct dw_hdmi_phy_data *phy = hdmi->phy.data;
 	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
@@ -1500,7 +1501,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 
 	dw_hdmi_phy_power_off(hdmi);
 
-	dw_hdmi_set_high_tmds_clock_ratio(hdmi);
+	dw_hdmi_set_high_tmds_clock_ratio(hdmi, display);
 
 	/* Leave low power consumption mode by asserting SVSRET. */
 	if (phy->has_svsret)
@@ -1531,6 +1532,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 }
 
 static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
+			    const struct drm_display_info *display,
 			    const struct drm_display_mode *mode)
 {
 	int i, ret;
@@ -1540,7 +1542,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 		dw_hdmi_phy_sel_data_en_pol(hdmi, 1);
 		dw_hdmi_phy_sel_interface_control(hdmi, 0);
 
-		ret = hdmi_phy_configure(hdmi);
+		ret = hdmi_phy_configure(hdmi, display);
 		if (ret)
 			return ret;
 	}
@@ -1846,10 +1848,11 @@ static void hdmi_config_drm_infoframe(struct dw_hdmi *hdmi)
 }
 
 static void hdmi_av_composer(struct dw_hdmi *hdmi,
+			     const struct drm_display_info *display,
 			     const struct drm_display_mode *mode)
 {
 	u8 inv_val, bytes;
-	struct drm_hdmi_info *hdmi_info = &hdmi->connector.display_info.hdmi;
+	const struct drm_hdmi_info *hdmi_info = &display->hdmi;
 	struct hdmi_vmode *vmode = &hdmi->hdmi_data.video_mode;
 	int hblank, vblank, h_de_hs, v_de_vs, hsync_len, vsync_len;
 	unsigned int vdisplay, hdisplay;
@@ -1882,7 +1885,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	/* Set up HDMI_FC_INVIDCONF */
 	inv_val = (hdmi->hdmi_data.hdcp_enable ||
-		   (dw_hdmi_support_scdc(hdmi) &&
+		   (dw_hdmi_support_scdc(hdmi, display) &&
 		    (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
 		     hdmi_info->scdc.scrambling.low_rates)) ?
 		HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE :
@@ -1950,7 +1953,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	}
 
 	/* Scrambling Control */
-	if (dw_hdmi_support_scdc(hdmi)) {
+	if (dw_hdmi_support_scdc(hdmi, display)) {
 		if (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
 		    hdmi_info->scdc.scrambling.low_rates) {
 			/*
@@ -2116,6 +2119,7 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 			 const struct drm_display_mode *mode)
 {
+	struct drm_connector *connector = &hdmi->connector;
 	int ret;
 
 	hdmi_disable_overflow_interrupts(hdmi);
@@ -2161,10 +2165,12 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 	hdmi->hdmi_data.video_mode.mdataenablepolarity = true;
 
 	/* HDMI Initialization Step B.1 */
-	hdmi_av_composer(hdmi, mode);
+	hdmi_av_composer(hdmi, &connector->display_info, mode);
 
 	/* HDMI Initializateion Step B.2 */
-	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data, &hdmi->previous_mode);
+	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
+				  &connector->display_info,
+				  &hdmi->previous_mode);
 	if (ret)
 		return ret;
 	hdmi->phy.enabled = true;
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 757c17fbb29f..15e62f327894 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -427,6 +427,7 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
 }
 
 static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
+			    const struct drm_display_info *display,
 			    const struct drm_display_mode *mode)
 {
 	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
@@ -496,7 +497,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	/* Disable clock, fifo, fifo_wr */
 	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
 
-	dw_hdmi_set_high_tmds_clock_ratio(hdmi);
+	dw_hdmi_set_high_tmds_clock_ratio(hdmi, display);
 
 	msleep(100);
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 10e210f6455d..23de359a1dec 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -312,6 +312,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_rockchip_encoder_helper_fun
 };
 
 static int dw_hdmi_rockchip_genphy_init(struct dw_hdmi *dw_hdmi, void *data,
+					const struct drm_display_info *display,
 					const struct drm_display_mode *mode)
 {
 	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 8e078cacf063..156d00e5165b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -341,6 +341,7 @@ static int sun8i_hdmi_phy_config_h3(struct dw_hdmi *hdmi,
 }
 
 static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
+				 const struct drm_display_info *display,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_hdmi_phy *phy = (struct sun8i_hdmi_phy *)data;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index f930d218cc6b..ea34ca146b82 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -114,6 +114,7 @@ struct dw_hdmi_phy_config {
 
 struct dw_hdmi_phy_ops {
 	int (*init)(struct dw_hdmi *hdmi, void *data,
+		    const struct drm_display_info *display,
 		    const struct drm_display_mode *mode);
 	void (*disable)(struct dw_hdmi *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi *hdmi, void *data);
@@ -174,7 +175,8 @@ void dw_hdmi_set_channel_status(struct dw_hdmi *hdmi, u8 *channel_status);
 void dw_hdmi_set_channel_allocation(struct dw_hdmi *hdmi, unsigned int ca);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
-void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi);
+void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi,
+				       const struct drm_display_info *display);
 
 /* PHY configuration */
 void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
