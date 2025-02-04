Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1CA27501
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D2110E676;
	Tue,  4 Feb 2025 14:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GDRcMqUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C298610E674
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:58:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BE41BA4280D;
 Tue,  4 Feb 2025 14:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453A2C4CEE2;
 Tue,  4 Feb 2025 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681106;
 bh=kTbZ4km/g6ogUK8MnFJMAYEka9eVtjDZ4FRAokwYnCY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GDRcMqUZ+QrF7ITrHy/x++tCKlAfGlk7FWew+0K+a7tfiyQV8QiYNxophVFEB1XC1
 F3m6oJ1hyIwJc4slC91SyKmhLX6m5xFDj/pUrsAYIHwkCIgQ883l/5QWLrZsLYXId8
 w68+c2kYGoZfZ5Sq6oue3PQQ8TN5Uk2oG/lEA8e8IV+Qs5BRcqH37jupIdXnx+5qDE
 q/ksvvUg3vmBbwUXkmj3tGWA6uqKRv+opBnBOsxFsg7AEDkBhbffzOBYfW7GE++6it
 1C9MRml19lMLtRCsVrEXYKgswDaz3b5WGKB8/JqbiD4EeBd/Z3HdTAR4xkNhqkYvmx
 u24dyav/YHvzw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:33 +0100
Subject: [PATCH v2 05/35] drm/bridge: Pass full state to
 atomic_post_disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-5-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18812; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kTbZ4km/g6ogUK8MnFJMAYEka9eVtjDZ4FRAokwYnCY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtF7z2QZOS03yOXJl6WvPNY2+Wy+znyrfwvF3Ts+aw
 8/Of7AP6ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATETzIWF9UNTN/0cxtIhcu
 zfeM+3J0LWN7VMPT6D3vPn+b5ZBkPMvq7Y1fjgdXmzCuOMyj0hWsys9YZzv1nO8Fbi4mFa5ZgRL
 zVE/O6uZc3/fDebZEzp4lq48Z7tI+xLef/3DQC93dEQ/fSX2QAgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

It's pretty inconvenient to access the full atomic state from
drm_bridges, so let's change the atomic_post_disable hook prototype to
pass it directly.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  5 ++---
 drivers/gpu/drm/bridge/panel.c                     |  3 +--
 drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
 drivers/gpu/drm/bridge/tc358762.c                  |  3 ++-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
 drivers/gpu/drm/drm_bridge.c                       | 16 +++-------------
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 14 +++++++-------
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  5 ++---
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  2 +-
 include/drm/drm_bridge.h                           |  2 +-
 20 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5ebda1ca880439db8fbfa048be7274f763b82f51..60ce33eadd97548c39201332e26b56e71245253a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1359,15 +1359,13 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	}
 
 	analogix_dp_bridge_disable(bridge);
 }
 
-static void
-analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
-				struct drm_bridge_state *old_bridge_state)
+static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						   struct drm_atomic_state *old_state)
 {
-	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
 
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 2d9e3add135c45f63966ee9df8d4cbe3b215aa1f..81f7c701961fddadbced6e4ad1bf9f12d3325fa7 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -479,11 +479,11 @@ static void chipone_atomic_pre_enable(struct drm_bridge *bridge,
 
 	usleep_range(10000, 11000);
 }
 
 static void chipone_atomic_post_disable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_bridge_state)
+					struct drm_atomic_state *state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 
 	clk_disable_unprepare(icn->refclk);
 
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 9301366525bde0af0b2e2d112d2b06c32d028aeb..8573b33f823730cacea2dae11ce82c0268999aa4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3261,11 +3261,11 @@ static void it6505_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	pm_runtime_get_sync(dev);
 }
 
 static void it6505_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					      struct drm_bridge_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index bacc8d373fe7c8af1370afef2588d9c41fd7f5f3..026803034231f78c17f619dc04119bdd9b2b6679 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -781,13 +781,12 @@ static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 			       reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	lt9611->sleep = false;
 }
 
-static void
-lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state)
+static void lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
 	lt9611_sleep_setup(lt9611);
 }
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 4ac9d32c701eb84df1fdff7d4ef06106bfd2e51d..890bd45c46eda8366e44974e3ec5891aa473fd00 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -164,14 +164,13 @@ static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	drm_panel_disable(panel_bridge->panel);
 }
 
 static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
-				struct drm_bridge_state *old_bridge_state)
+					     struct drm_atomic_state *atomic_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 
 	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index b9d803cf88041171a485cd3e15d6d5e81a4f873b..0f9a0639550bd25bba0a7175e1a86e839a7687fe 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -471,11 +471,11 @@ static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
 
 	ps_bridge->pre_enabled = true;
 }
 
 static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
-				       struct drm_bridge_state *old_bridge_state)
+				       struct drm_atomic_state *state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 
 	ps_bridge->pre_enabled = false;
 
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4a75a49110bca0e4ce71fbb81081fbffd7d72465..54de6ed2fae81bc13301a6b1ee8f38183a3118b6 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1506,11 +1506,11 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
 	samsung_dsim_set_display_enable(dsi, false);
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
 static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index f9371b19a476bbba17165632e4f2230ac9d48e9d..2b6e70a49f438c475bc60d9595bf246a9e54995b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -932,11 +932,11 @@ static void dw_mipi_dsi_clear_err(struct dw_mipi_dsi *dsi)
 	dsi_write(dsi, DSI_INT_MSK0, 0);
 	dsi_write(dsi, DSI_INT_MSK1, 0);
 }
 
 static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
-						   struct drm_bridge_state *old_bridge_state)
+						   struct drm_atomic_state *state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
 
 	/*
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index 1d9d16fbcc7f2231fa71cc6a22a34be6f2ba46fd..5fd7a459efdd4fc4884cdf77ffedc19c36d1ca13 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -743,11 +743,11 @@ static int dw_mipi_dsi2_bridge_atomic_check(struct drm_bridge *bridge,
 
 	return 0;
 }
 
 static void dw_mipi_dsi2_bridge_post_atomic_disable(struct drm_bridge *bridge,
-						    struct drm_bridge_state *old_bridge_state)
+						    struct drm_atomic_state *state)
 {
 	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
 	const struct dw_mipi_dsi2_phy_ops *phy_ops = dsi2->plat_data->phy_ops;
 
 	regmap_write(dsi2->regmap, DSI2_IPI_PIX_PKT_CFG, 0);
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index de3a0d056d44b3cf838d4fde7fd74c968946e6ad..6526c9685758ac57bd53c16551127074fb22b5b7 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -147,11 +147,12 @@ static int tc358762_init(struct tc358762 *ctx)
 	msleep(100);
 
 	return tc358762_clear_error(ctx);
 }
 
-static void tc358762_post_disable(struct drm_bridge *bridge, struct drm_bridge_state *state)
+static void tc358762_post_disable(struct drm_bridge *bridge,
+				  struct drm_atomic_state *state)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
 
 	/*
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 963af4fc28a88f7ed0b0f01933d96dd8077c6602..85f2a0e74a1c8aaa272ce828ad1c82660503b7a8 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -191,11 +191,11 @@ static void dlpc_atomic_pre_enable(struct drm_bridge *bridge,
 
 	msleep(10);
 }
 
 static void dlpc_atomic_post_disable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *old_bridge_state)
+				     struct drm_atomic_state *state)
 {
 	struct dlpc *dlpc = bridge_to_dlpc(bridge);
 
 	regulator_disable(dlpc->vcc_flsh);
 	regulator_disable(dlpc->vcc_intf);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index eaa95e46513299f1fa9e7e9f065bd3560fe55f99..a78f80bbc65b8c5aed7aeae0cd15cc7d5210c5e5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1177,11 +1177,11 @@ static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* td7: min 100 us after enable before DSI data */
 	usleep_range(100, 110);
 }
 
 static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	/* semi auto link training mode OFF */
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f52b2d7c987bcc861ef84a26db2dd8d1b3669535..a5d60d908251b6381f452c10ddfd7469fa01902f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -579,24 +579,14 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
 static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
 						struct drm_atomic_state *old_state)
 {
-	if (old_state && bridge->funcs->atomic_post_disable) {
-		struct drm_bridge_state *old_bridge_state;
-
-		old_bridge_state =
-			drm_atomic_get_old_bridge_state(old_state,
-							bridge);
-		if (WARN_ON(!old_bridge_state))
-			return;
-
-		bridge->funcs->atomic_post_disable(bridge,
-						   old_bridge_state);
-	} else if (bridge->funcs->post_disable) {
+	if (old_state && bridge->funcs->atomic_post_disable)
+		bridge->funcs->atomic_post_disable(bridge, old_state);
+	else if (bridge->funcs->post_disable)
 		bridge->funcs->post_disable(bridge);
-	}
 }
 
 /**
  * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
  *					  in the encoder chain
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d3a7e1cb27c00ab77404a1ed6ec3481bca44b976..40f2258a42dab0ededf09196423d95a88f21fc39 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -853,11 +853,11 @@ static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (ret < 0)
 		DRM_ERROR("failed to power on dsi\n");
 }
 
 static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					       struct drm_bridge_state *old_bridge_state)
+					       struct drm_atomic_state *state)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
 	mtk_dsi_poweroff(dsi);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 602c9d348a7d3ec4f0ba13386508c531772b6e14..ac5e40c2761710dfbe722e1ba569d76e4cd5b8fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1324,11 +1324,11 @@ static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	hdmi->enabled = false;
 }
 
 static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-						struct drm_bridge_state *old_state)
+						struct drm_atomic_state *state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
 	if (!hdmi->powered)
 		return;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c97bac8121fc0b76dffd4c90b0f42f8ec691ad46..4435787eb66a0453e4193e9b7f87e1c7bddcae68 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1569,33 +1569,33 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				   struct drm_bridge_state *old_bridge_state)
+				       struct drm_atomic_state *state)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	u32 state;
+	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
-	state = msm_dp_display->hpd_state;
-	if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED)
+	hpd_state = msm_dp_display->hpd_state;
+	if (hpd_state != ST_DISCONNECT_PENDING && hpd_state != ST_CONNECTED)
 		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
-			   dp->connector_type, state);
+			   dp->connector_type, hpd_state);
 
 	msm_dp_display_disable(msm_dp_display);
 
-	state =  msm_dp_display->hpd_state;
-	if (state == ST_DISCONNECT_PENDING) {
+	hpd_state =  msm_dp_display->hpd_state;
+	if (hpd_state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
 	} else {
 		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 84ecec79467dcb1d3c35abf422b1d6b7caf8d0ee..dc888f8269d698daa046d5a861a2a8bd80aa76d3 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -208,13 +208,12 @@ static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 out:
 	msm_dp_bridge_atomic_disable(drm_bridge, atomic_state);
 }
 
 static void msm_edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				struct drm_bridge_state *old_bridge_state)
+					       struct drm_atomic_state *atomic_state)
 {
-	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 
 	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state,
 						   drm_bridge->encoder);
@@ -229,11 +228,11 @@ static void msm_edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	 * Self refresh mode is already set in msm_edp_bridge_atomic_disable.
 	 */
 	if (new_crtc_state->self_refresh_active)
 		return;
 
-	msm_dp_bridge_atomic_post_disable(drm_bridge, old_bridge_state);
+	msm_dp_bridge_atomic_post_disable(drm_bridge, atomic_state);
 }
 
 /**
  * msm_edp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index faf31a9da752c9ea65e80c8c95896fef39ffa8a8..d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -28,11 +28,11 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 				  struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				   struct drm_bridge_state *old_bridge_state);
+				       struct drm_atomic_state *state);
 enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
 void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 60b300db52d24af6a04131c99cfdc05b6e9509aa..779b22efe27bffc586a760fdc49012e02ac23d0d 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -809,11 +809,11 @@ static void vc4_dsi_bridge_disable(struct drm_bridge *bridge,
 	disp0_ctrl &= ~DSI_DISP0_ENABLE;
 	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
 }
 
 static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge,
-					struct drm_bridge_state *state)
+					struct drm_atomic_state *state)
 {
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct device *dev = &dsi->pdev->dev;
 
 	clk_disable_unprepare(dsi->pll_phy_clock);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 140611fa68e01437f34d06c78d70ba7a7162c2c0..df62b9391d5613933ad68b4d8f69a732966b3a0b 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -359,11 +359,11 @@ struct drm_bridge_funcs {
 	 * called.
 	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_bridge_state *old_bridge_state);
+				    struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current bridge state object (which is guaranteed to be

-- 
2.48.0

