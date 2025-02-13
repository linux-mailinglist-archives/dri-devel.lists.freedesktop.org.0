Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D10A342F2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C38A10EACE;
	Thu, 13 Feb 2025 14:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RB6M1a/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA42E10EAD6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7E553A41E1A;
 Thu, 13 Feb 2025 14:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF78AC4CED1;
 Thu, 13 Feb 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457843;
 bh=Ao8CFv29puHGuHdCCMOvwL1SP8xf25M1lOJbOifFnfM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RB6M1a/USrdIGgV1Z7fkdWqosgTQsK3wkXv2vXmz0Myz0BkacPDui8GkWmrCpcUo2
 iwUZmIUoLXWS8Hc91f3+aJaKUA7M1drkwsByn9meZm2l/KUjD8E2bUmYVWJ3+cRMFu
 4DksHdibmr+cBx4xaAD9jyVOYTTV8bfUiDKXaBip0BThTgwA9BuCj/i4BMLcQTKnyk
 VjOQpGDlZdh+K819pZEiReIVLWbrULIDQugss3Yfpm3BgKZoGs1Jc7MOJt1Q/weiL9
 qk3lFGpiHrMkcqMLOzvIX6TANsIaaP/Ma6BlRC+Ccc43x/fFgLxhATTXqRUw63MhSW
 691fhorXo1thA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:22 +0100
Subject: [PATCH v3 03/37] drm/bridge: Pass full state to atomic_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-3-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=50673; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ao8CFv29puHGuHdCCMOvwL1SP8xf25M1lOJbOifFnfM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWMVtKybYHedZbWQ6f87JDet/vpH5l/Las+JTqq+25
 NKzkRsOdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJTCtgbJjyfvN58ekyy4sq
 b096UuSlJLprmfBNxo7TDFvrhF+4xvaYrb9yImbj/Sd73p37FP9nxUvGetepb1u49RV71T/dL4k
 od8xmTxdN391af/P2zD+rOTlnz361jfnTrmXHFTwiO/vCn69OBwA=
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
drm_bridges, so let's change the atomic_enable hook prototype to pass it
directly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |  6 ++----
 drivers/gpu/drm/bridge/analogix/anx7625.c           |  6 +++---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  3 +--
 drivers/gpu/drm/bridge/chipone-icn6211.c            |  3 +--
 drivers/gpu/drm/bridge/fsl-ldb.c                    |  3 +--
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        |  5 +++--
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |  5 ++---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |  7 +++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  5 ++---
 drivers/gpu/drm/bridge/ite-it6263.c                 |  6 ++----
 drivers/gpu/drm/bridge/ite-it6505.c                 |  3 +--
 drivers/gpu/drm/bridge/ite-it66121.c                |  3 +--
 drivers/gpu/drm/bridge/lontium-lt9211.c             |  3 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c             |  6 ++----
 drivers/gpu/drm/bridge/nwl-dsi.c                    |  5 ++---
 drivers/gpu/drm/bridge/panel.c                      |  3 +--
 drivers/gpu/drm/bridge/samsung-dsim.c               |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                    |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  3 +--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  3 +--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  2 +-
 drivers/gpu/drm/bridge/tc358762.c                   |  3 ++-
 drivers/gpu/drm/bridge/tc358767.c                   | 10 ++++------
 drivers/gpu/drm/bridge/ti-dlpc3433.c                |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c               |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c               |  4 ++--
 drivers/gpu/drm/bridge/ti-tdp158.c                  |  3 ++-
 drivers/gpu/drm/drm_bridge.c                        | 10 +---------
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c           |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                   |  4 ++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                  |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  3 +--
 drivers/gpu/drm/meson/meson_encoder_cvbs.c          |  3 +--
 drivers/gpu/drm/meson/meson_encoder_dsi.c           |  3 +--
 drivers/gpu/drm/meson/meson_encoder_hdmi.c          |  3 +--
 drivers/gpu/drm/msm/dp/dp_display.c                 | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_drm.c                     |  9 ++++-----
 drivers/gpu/drm/msm/dp/dp_drm.h                     |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                 |  3 +--
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                 |  3 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  3 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c     |  2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      |  3 +--
 drivers/gpu/drm/stm/lvds.c                          |  3 +--
 drivers/gpu/drm/vc4/vc4_dsi.c                       |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                    | 10 ++++------
 include/drm/drm_bridge.h                            |  2 +-
 49 files changed, 79 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 19f4319eb6473699fac90d36a12159fe9edd2913..3d22685d33b51f59115b289b70c990d585aa5230 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -909,11 +909,11 @@ static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct adv7511, bridge);
 }
 
 static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *bridge_state)
+					 struct drm_atomic_state *state)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
 	adv7511_power_on(adv);
 }
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index e097d97fb7d9f1523ec2162c2a7a7df104fcaa99..7939d622d6a24657092d0cd9ebdf835e092c51ee 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1253,15 +1253,13 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	pm_runtime_put_sync(dp->dev);
 
 	return ret;
 }
 
-static void
-analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
-				 struct drm_bridge_state *old_bridge_state)
+static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_atomic_state *old_state)
 {
-	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int timeout_loop = 0;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4be34d5c7a3b8295f6b4593b3734ec8131bb3a4a..79f78dbe96351ef5fb746dc6731176a8d2989376 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2378,20 +2378,20 @@ static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
 
 	return 0;
 }
 
 static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *state)
+					 struct drm_atomic_state *state)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 
 	dev_dbg(dev, "drm atomic enable\n");
 
-	connector = drm_atomic_get_new_connector_for_encoder(state->base.state,
+	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	if (!connector)
 		return;
 
 	ctx->connector = connector;
@@ -2399,11 +2399,11 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 	pm_runtime_get_sync(dev);
 	_anx7625_hpd_polling(ctx, 5000 * 100);
 
 	anx7625_dp_start(ctx);
 
-	conn_state = drm_atomic_get_new_connector_state(state->base.state, connector);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
 
 	if (WARN_ON(!conn_state))
 		return;
 
 	if (conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 25345c3274e341bbb09cd9f6442e7730e2f4b5c8..d3cebc79aaef75bd745892b7987f0a64bdc327f4 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1977,14 +1977,13 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 
 	cdns_mhdp_configure_video(mhdp, mode);
 }
 
 static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_bridge_state *bridge_state)
+				    struct drm_atomic_state *state)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
-	struct drm_atomic_state *state = bridge_state->base.state;
 	struct cdns_mhdp_bridge_state *mhdp_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_bridge_state *new_state;
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 7a009ab57f9ec8e944d1410373ac9e06db12a815..2d9e3add135c45f63966ee9df8d4cbe3b215aa1f 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -339,14 +339,13 @@ static void chipone_configure_pll(struct chipone *icn,
 	chipone_writeb(icn, PLL_REF_DIV, ref_div);
 	chipone_writeb(icn, PLL_INT(0), best_m);
 }
 
 static void chipone_atomic_enable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state)
+				  struct drm_atomic_state *state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct drm_display_mode *mode = &icn->mode;
 	const struct drm_bridge_state *bridge_state;
 	u16 hfp, hbp, hsync;
 	u32 bus_flags;
 	u8 pol, sys_ctrl_1, id[4];
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0fc8a14fd80062248a43b8b93272101a7ca6158a..0ba8bbc1afaec9cd7ae420568f98d21a31759614 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -120,14 +120,13 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
 				 bridge, flags);
 }
 
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state)
+				  struct drm_atomic_state *state)
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	const struct drm_bridge_state *bridge_state;
 	const struct drm_crtc_state *crtc_state;
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 0d1ac3edcab41658cf604a8a994026b4bf40cf27..9ee645489ea30a0478b114457aa0768dd7f2952e 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -47,20 +47,21 @@ static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(bridge->encoder, pvi->next_bridge,
 				 bridge, flags);
 }
 
 static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *bridge_state)
+					  struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = bridge_state->base.state;
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
 	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
 	const struct drm_display_mode *mode;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	u32 bus_flags = 0, val;
 
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 
 	if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
index dd5823f04c700f7890c4a28cb7ef12ff16b20c18..fe2313aa2051c9d36ec0edbbd27d103229da6a9b 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -198,13 +198,12 @@ imx8qm_ldb_bridge_mode_set(struct drm_bridge *bridge,
 	else if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
 		regmap_update_bits(ldb->regmap, SS_CTRL,
 				   CH_HSYNC_M(chno), CH_PHSYNC(chno));
 }
 
-static void
-imx8qm_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
-				struct drm_bridge_state *old_bridge_state)
+static void imx8qm_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
+					    struct drm_atomic_state *state)
 {
 	struct ldb_channel *ldb_ch = bridge->driver_private;
 	struct ldb *ldb = ldb_ch->ldb;
 	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
 					base_to_imx8qm_ldb_channel(ldb_ch);
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 009c7fcb3d595d7bfabde298511fde89a85dc890..f3f5b7b810f682f9973413ad1d65c9764437e94a 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -217,13 +217,12 @@ static void imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	if (is_split && companion)
 		companion->funcs->atomic_pre_enable(companion, state);
 }
 
-static void
-imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
-				 struct drm_bridge_state *old_bridge_state)
+static void imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_atomic_state *state)
 {
 	struct ldb_channel *ldb_ch = bridge->driver_private;
 	struct ldb *ldb = ldb_ch->ldb;
 	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
 					base_to_imx8qxp_ldb_channel(ldb_ch);
@@ -249,11 +248,11 @@ imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
 	ret = phy_power_on(imx8qxp_ldb_ch->phy);
 	if (ret)
 		DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
 
 	if (is_split && companion)
-		companion->funcs->atomic_enable(companion, old_bridge_state);
+		companion->funcs->atomic_enable(companion, state);
 }
 
 static void
 imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 4b0715ed6f38c9b6a1d24cb0142ca94cfd6042e1..9b79e5dbcaca7f2b24a4183bcea4d6aac4464165 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -151,13 +151,12 @@ imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
 	struct imx8qxp_pixel_link *pl = bridge->driver_private;
 
 	imx8qxp_pixel_link_set_mst_addr(pl);
 }
 
-static void
-imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_bridge_state)
+static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
+						    struct drm_atomic_state *state)
 {
 	struct imx8qxp_pixel_link *pl = bridge->driver_private;
 
 	imx8qxp_pixel_link_enable_mst_en(pl);
 	imx8qxp_pixel_link_enable_mst_vld(pl);
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 306b5e374b9eaf9875ad2faaa7691aca61162ac2..0cf624a8495c00c15158aed6e0ec7227bcad529d 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -579,15 +579,13 @@ it6263_bridge_atomic_disable(struct drm_bridge *bridge,
 	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
 	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
 		     AFE_DRV_RST | AFE_DRV_PWD);
 }
 
-static void
-it6263_bridge_atomic_enable(struct drm_bridge *bridge,
-			    struct drm_bridge_state *old_bridge_state)
+static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct it6263 *it = bridge_to_it6263(bridge);
 	const struct drm_crtc_state *crtc_state;
 	struct regmap *regmap = it->hdmi_regmap;
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 647579342a0a82ce4f4f4f04ea5d0633e4d03af8..159fdce3512978daae28d652d3d91e4968d4a729 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3181,15 +3181,14 @@ it6505_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return MODE_OK;
 }
 
 static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_state)
+					struct drm_atomic_state *state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 	struct device *dev = it6505->dev;
-	struct drm_atomic_state *state = old_state->base.state;
 	struct hdmi_avi_infoframe frame;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector_state *conn_state;
 	struct drm_display_mode *mode;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 23edcde6b9a7d4f67313492d776b37f0126b6b95..4b784ac04b3a0284c4ff4b62a390ade75d686c21 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -719,14 +719,13 @@ static u32 *it66121_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 
 	return input_fmts;
 }
 
 static void it66121_bridge_enable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *bridge_state)
+				  struct drm_atomic_state *state)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
-	struct drm_atomic_state *state = bridge_state->base.state;
 
 	ctx->connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 
 	it66121_set_mute(ctx, false);
 }
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 999ddebb832de1a3e4a4174c3d5d4cfb3bfcee74..65d5cdfe0d32cf9dca6582a60225db335c80172c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -453,14 +453,13 @@ static int lt9211_configure_tx(struct lt9211 *ctx, bool jeida,
 
 	return 0;
 }
 
 static void lt9211_atomic_enable(struct drm_bridge *bridge,
-				 struct drm_bridge_state *old_bridge_state)
+				 struct drm_atomic_state *state)
 {
 	struct lt9211 *ctx = bridge_to_lt9211(bridge);
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	const struct drm_bridge_state *bridge_state;
 	const struct drm_crtc_state *crtc_state;
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 5d3bbfeaf2299e2425e0079cff0805b37180351b..521cce42d0332564dfa1bb1cb06012711198022e 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -638,16 +638,14 @@ lt9611_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 
 	return 0;
 }
 
 /* bridge funcs */
-static void
-lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
-			    struct drm_bridge_state *old_bridge_state)
+static void lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_display_mode *mode;
 	unsigned int postdiv;
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 1e5b2a37cb8c9a7be4438039502226255cc952bb..00a2ffb3dc7d93be70496de53a9de1195a4d2b18 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -896,13 +896,12 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 
 runtime_put:
 	pm_runtime_put_sync(dev);
 }
 
-static void
-nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
-			     struct drm_bridge_state *old_bridge_state)
+static void nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
 
 	/* Step 5 from DSI reset-out instructions */
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 1dbe1c2139879c8c8b6ffa150bcf57fcad2af964..c8988de36ba3b5a76f221a61cb3007a815b8c58a 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -126,14 +126,13 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	drm_panel_prepare(panel_bridge->panel);
 }
 
 static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
-				struct drm_bridge_state *old_bridge_state)
+				       struct drm_atomic_state *atomic_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 415ce14e747dfca0c5395e18f1195733e17616da..ddf55fad2815125e70c2c7029d26e7ba036eb9ad 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1483,11 +1483,11 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 			return;
 	}
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
-				       struct drm_bridge_state *old_bridge_state)
+				       struct drm_atomic_state *state)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
 	samsung_dsim_set_display_mode(dsi);
 	samsung_dsim_set_display_enable(dsi, true);
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index bf2d1632b020c38fec39f217b53f8e02ea862454..ae53d94a39317b4f753d4d59184f7ee5858e44d9 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -337,11 +337,11 @@ static void sii902x_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	mutex_unlock(&sii902x->mutex);
 }
 
 static void sii902x_bridge_atomic_enable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_bridge_state)
+					 struct drm_atomic_state *state)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
 	mutex_lock(&sii902x->mutex);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index b281cabfe992eff88a4ba7bc903758bb119281f2..e480842016232d36014a849d6b1cc0f29b409cc7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -360,14 +360,13 @@ static int dw_hdmi_qp_config_drm_infoframe(struct dw_hdmi_qp *hdmi,
 
 	return 0;
 }
 
 static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
-					    struct drm_bridge_state *old_state)
+					    struct drm_atomic_state *state)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	struct drm_atomic_state *state = old_state->base.state;
 	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
 	unsigned int op_mode;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index d1256c82de96a43211af64ad70848cd18d5044e5..b92e1fa9f3526c3d81b50cf95f4fc4d447907975 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2957,14 +2957,13 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 	handle_plugged_change(hdmi, false);
 	mutex_unlock(&hdmi->mutex);
 }
 
 static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_state)
+					 struct drm_atomic_state *state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
-	struct drm_atomic_state *state = old_state->base.state;
 	struct drm_connector *connector;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 9731a6b45a52b54fdf910a3cc84d8f97b0c37c91..f9371b19a476bbba17165632e4f2230ac9d48e9d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1041,11 +1041,11 @@ static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	/* Store the display mode for later use in pre_enable callback */
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
 static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
 	/* Switch to video mode for panel-bridge enable & panel enable */
 	dw_mipi_dsi_set_mode(dsi, MIPI_DSI_MODE_VIDEO);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index 194ac6e192f4c2a89048e241da7b7d0e2db75149..1d9d16fbcc7f2231fa71cc6a22a34be6f2ba46fd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -838,11 +838,11 @@ static void dw_mipi_dsi2_bridge_mode_set(struct drm_bridge *bridge,
 	/* Store the display mode for later use in pre_enable callback */
 	drm_mode_copy(&dsi2->mode, adjusted_mode);
 }
 
 static void dw_mipi_dsi2_bridge_atomic_enable(struct drm_bridge *bridge,
-					      struct drm_bridge_state *old_bridge_state)
+					      struct drm_atomic_state *state)
 {
 	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
 
 	/* Switch to video mode for panel-bridge enable & panel enable */
 	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO)
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 15daf6d97365e6127273079a6e3b48597398fd37..6ed8ae6ffc3defa9857397a7f47d44195ac0f774 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -187,11 +187,12 @@ static void tc358762_pre_enable(struct drm_bridge *bridge,
 	}
 
 	ctx->pre_enabled = true;
 }
 
-static void tc358762_enable(struct drm_bridge *bridge, struct drm_bridge_state *state)
+static void tc358762_enable(struct drm_bridge *bridge,
+			    struct drm_atomic_state *state)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
 
 	ret = tc358762_init(ctx);
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 4637bf6ea7a360c0000ab6f88cefaa50060687e2..a1f72e61b9444cc79bf1bb7bed552c302bc30873 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1546,13 +1546,12 @@ static int tc_edp_stream_disable(struct tc_data *tc)
 	tc_pxl_pll_dis(tc);
 
 	return 0;
 }
 
-static void
-tc_dpi_bridge_atomic_enable(struct drm_bridge *bridge,
-			    struct drm_bridge_state *old_bridge_state)
+static void tc_dpi_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
@@ -1574,13 +1573,12 @@ tc_dpi_bridge_atomic_disable(struct drm_bridge *bridge,
 	ret = tc_dpi_stream_disable(tc);
 	if (ret < 0)
 		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
 }
 
-static void
-tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
-			    struct drm_bridge_state *old_bridge_state)
+static void tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
 	ret = tc_get_display_props(tc);
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index c513cd1902048d52088b946691db8a1aa24a5a32..963af4fc28a88f7ed0b0f01933d96dd8077c6602 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -103,11 +103,11 @@ static const struct regmap_config dlpc_regmap_config = {
 	.cache_type		= REGCACHE_MAPLE,
 	.name			= "dlpc3433",
 };
 
 static void dlpc_atomic_enable(struct drm_bridge *bridge,
-			       struct drm_bridge_state *old_bridge_state)
+			       struct drm_atomic_state *state)
 {
 	struct dlpc *dlpc = bridge_to_dlpc(bridge);
 	struct device *dev = dlpc->dev;
 	struct drm_display_mode *mode = &dlpc->mode;
 	struct regmap *regmap = dlpc->regmap;
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 049d73526b904637dc1162893fa11d002c7b77d1..b2ff5cdb7fd26bfeb75af741abad06b21a765316 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -531,11 +531,11 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Wait for 10ms after soft reset as specified in datasheet */
 	usleep_range(10000, 12000);
 }
 
 static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_bridge_state *old_bridge_state)
+				    struct drm_atomic_state *state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	unsigned int pval;
 
 	/* Clear all errors that got asserted during initialization. */
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 86bbfdc37d97f0ee33a7b116f89f885b527dc3d8..c3ad7e326ae809eda8e61c905d37a85ff2137487 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1071,11 +1071,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 
 	return ret;
 }
 
 static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
-				       struct drm_bridge_state *old_bridge_state)
+				       struct drm_atomic_state *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	struct drm_connector *connector;
 	const char *last_err_str = "No supported DP rate";
 	unsigned int valid_rates;
@@ -1083,11 +1083,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	unsigned int val;
 	int ret = -EINVAL;
 	int max_dp_lanes;
 	unsigned int bpp;
 
-	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
+	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	if (!connector) {
 		dev_err_ratelimited(pdata->dev, "Could not get the connector\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/ti-tdp158.c
index 3472ed5924e8b939d6b55a489fbb9989114d35db..c0308f997445f52f7f9c680eb67dde55edcb1049 100644
--- a/drivers/gpu/drm/bridge/ti-tdp158.c
+++ b/drivers/gpu/drm/bridge/ti-tdp158.c
@@ -16,11 +16,12 @@ struct tdp158 {
 	struct regulator *vcc; // 3.3V
 	struct regulator *vdd; // 1.1V
 	struct device *dev;
 };
 
-static void tdp158_enable(struct drm_bridge *bridge, struct drm_bridge_state *prev)
+static void tdp158_enable(struct drm_bridge *bridge,
+			  struct drm_atomic_state *state)
 {
 	int err;
 	struct tdp158 *tdp158 = bridge->driver_private;
 
 	err = regulator_enable(tdp158->vcc);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e6bf964ddd82e4e2eea5c8e83201d08bb50a3137..7d9d176347f37569dddeb8fc0dbdcdebe4445a60 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -804,19 +804,11 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 		return;
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
 		if (bridge->funcs->atomic_enable) {
-			struct drm_bridge_state *old_bridge_state;
-
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								bridge);
-			if (WARN_ON(!old_bridge_state))
-				return;
-
-			bridge->funcs->atomic_enable(bridge, old_bridge_state);
+			bridge->funcs->atomic_enable(bridge, old_state);
 		} else if (bridge->funcs->enable) {
 			bridge->funcs->enable(bridge);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index c23ee2d214de67706f7de99fce01066f59898fa4..e52d8c4f0b7e93d6be88e3b3897e711a12bc70c1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -227,11 +227,11 @@ static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 		return NOTIFY_OK;
 	}
 }
 
 static void ingenic_drm_bridge_atomic_enable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
 
 	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index cd385ba4c66aaad8649fa0c138273489ced5e39b..bd67423556b789be74fe648fd5ca6141a8ab9fb8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2348,16 +2348,16 @@ static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
 	mtk_dp_poweroff(mtk_dp);
 	drm_dp_aux_unregister(&mtk_dp->aux);
 }
 
 static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_state)
+					struct drm_atomic_state *state)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	int ret;
 
-	mtk_dp->conn = drm_atomic_get_new_connector_for_encoder(old_state->base.state,
+	mtk_dp->conn = drm_atomic_get_new_connector_for_encoder(state,
 								bridge->encoder);
 	if (!mtk_dp->conn) {
 		drm_err(mtk_dp->drm_dev,
 			"Can't enable bridge as connector is missing\n");
 		return;
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index aed9d03bcf012fc555277da8fe6adfbd6b839070..be21f8e643172b5fe07ce640af2c33f060a3bb24 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -832,11 +832,11 @@ static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	mtk_output_dsi_disable(dsi);
 }
 
 static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_bridge_state)
+					 struct drm_atomic_state *state)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
 	if (dsi->refcount == 0)
 		return;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 928909b4403a4c7ee6b919056f9cfd0c01d13cbd..a1904480fff8dcc0b4f3da883b9abe3238653253 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1381,13 +1381,12 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
 	if (mode->flags & DRM_MODE_FLAG_3D_MASK)
 		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
 }
 
 static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_state)
+					  struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = old_state->base.state;
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
 	/* Retrieve the connector through the atomic state. */
 	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
 								   bridge->encoder);
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index d1191de855d910f9845bf2d5aef336e391982ba2..b535e74345f02079e22a18c8d991adeb03c5e41a 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -137,14 +137,13 @@ static int meson_encoder_cvbs_atomic_check(struct drm_bridge *bridge,
 
 	return -EINVAL;
 }
 
 static void meson_encoder_cvbs_atomic_enable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct meson_encoder_cvbs *encoder_cvbs = bridge_to_meson_encoder_cvbs(bridge);
-	struct drm_atomic_state *state = bridge_state->base.state;
 	struct meson_drm *priv = encoder_cvbs->priv;
 	const struct meson_cvbs_mode *meson_mode;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 7816902f590753d2f5e15aea45df0ce86e7595fb..140b3604dba10ac2aabadae065c2d9de8169ed03 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -40,14 +40,13 @@ static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(bridge->encoder, encoder_dsi->next_bridge,
 				 &encoder_dsi->bridge, flags);
 }
 
 static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
-					    struct drm_bridge_state *bridge_state)
+					    struct drm_atomic_state *state)
 {
 	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
-	struct drm_atomic_state *state = bridge_state->base.state;
 	struct meson_drm *priv = encoder_dsi->priv;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0593a1cde906ffab10c010c40942fb910059b2ab..7544c4e6af635b7e612a1a970987e0e15e054cf1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -184,14 +184,13 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 
 	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
 }
 
 static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
-	struct drm_atomic_state *state = bridge_state->base.state;
 	unsigned int ycrcb_map = VPU_HDMI_OUTPUT_CBYCR;
 	struct meson_drm *priv = encoder_hdmi->priv;
 	struct drm_connector_state *conn_state;
 	const struct drm_display_mode *mode;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..ffb9c80543ad2306b2148b6f05a803d7634334d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1489,17 +1489,17 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 	return 0;
 }
 
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-			     struct drm_bridge_state *old_bridge_state)
+				 struct drm_atomic_state *state)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
-	u32 state;
+	u32 hpd_state;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
 		DRM_ERROR("invalid params\n");
@@ -1514,12 +1514,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	state = msm_dp_display->hpd_state;
-	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
+	hpd_state = msm_dp_display->hpd_state;
+	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
@@ -1527,13 +1527,13 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	state =  msm_dp_display->hpd_state;
+	hpd_state =  msm_dp_display->hpd_state;
 
-	if (state == ST_DISPLAY_OFF) {
+	if (hpd_state == ST_DISPLAY_OFF) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
 
 	msm_dp_display_enable(msm_dp_display, force_link_train);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d3e241ea6941615b8e274dd17426c2f8557f09b5..eae8e849edc54da1faa9c557757873561fa223a1 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -135,13 +135,12 @@ static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 
 	return 0;
 }
 
 static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				     struct drm_bridge_state *old_bridge_state)
+					 struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 
@@ -149,23 +148,23 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	 * Check the old state of the crtc to determine if the panel
 	 * was put into psr state previously by the msm_edp_bridge_atomic_disable.
 	 * If the panel is in psr, just exit psr state and skip the full
 	 * bridge enable sequence.
 	 */
-	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state,
+	crtc = drm_atomic_get_new_crtc_for_encoder(state,
 						   drm_bridge->encoder);
 	if (!crtc)
 		return;
 
-	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 
 	if (old_crtc_state && old_crtc_state->self_refresh_active) {
 		msm_dp_display_set_psr(dp, false);
 		return;
 	}
 
-	msm_dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
+	msm_dp_bridge_atomic_enable(drm_bridge, state);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 				      struct drm_bridge_state *old_bridge_state)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 8eae2f74839f71cd3ef8511df4bb1aaa235abf1b..d54253ecbbff85f06112a1f62981c724774c237a 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -24,11 +24,11 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-			     struct drm_bridge_state *old_bridge_state);
+				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 			      struct drm_bridge_state *old_bridge_state);
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *old_bridge_state);
 enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 4435f0027c78d75067be42b1c097db2980828ed8..c43f4a5218d1227a7431cccb015530e1b1543329 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -339,14 +339,13 @@ static void hdmi4_bridge_mode_set(struct drm_bridge *bridge,
 
 	mutex_unlock(&hdmi->lock);
 }
 
 static void hdmi4_bridge_enable(struct drm_bridge *bridge,
-				struct drm_bridge_state *bridge_state)
+				struct drm_atomic_state *state)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
-	struct drm_atomic_state *state = bridge_state->base.state;
 	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
 	struct drm_crtc_state *crtc_state;
 	unsigned long flags;
 	int ret;
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index a8c740df3146eb9dd2b64b2520cfd07e46bc2539..49a4d31243e7dbb4ad6a9136e16032fd15dbe607 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -337,14 +337,13 @@ static void hdmi5_bridge_mode_set(struct drm_bridge *bridge,
 
 	mutex_unlock(&hdmi->lock);
 }
 
 static void hdmi5_bridge_enable(struct drm_bridge *bridge,
-				struct drm_bridge_state *bridge_state)
+				struct drm_atomic_state *state)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
-	struct drm_atomic_state *state = bridge_state->base.state;
 	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
 	struct drm_crtc_state *crtc_state;
 	unsigned long flags;
 	int ret;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index e8d64583e3bdb9b0cb35622b1bbe6d9fc88daadf..86e112fe1fc44603585d916fc70c0a3bd7ab1313 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -580,13 +580,12 @@ EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
 /* -----------------------------------------------------------------------------
  * Bridge
  */
 
 static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_bridge_state *old_bridge_state)
+				    struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 3c0c18d5249ae47c85676253d39664e009b19d1e..4c8f63bd106e12b62e6c5006a439305f979beb64 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -806,11 +806,11 @@ static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
 				 flags);
 }
 
 static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_bridge_state)
+					struct drm_atomic_state *state)
 {
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
 	rcar_mipi_dsi_start_video(dsi);
 }
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index fa7a1ae22aa3d9bbe7995edef040ac69d922ca2d..1eafb637092b1731a606ed50d7cc8f89a7964606 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -530,13 +530,12 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
 				 flags);
 }
 
 static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_bridge_state)
+					 struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
 	int ret;
diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 06f2d7a56cc963faa87307b96146cb08adf8b248..7ec44f2264038c3642c40202bc014c438ecee104 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -978,13 +978,12 @@ static int lvds_attach(struct drm_bridge *bridge,
 
 	return ret;
 }
 
 static void lvds_atomic_enable(struct drm_bridge *bridge,
-			       struct drm_bridge_state *old_bridge_state)
+			       struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct stm_lvds *lvds = bridge_to_stm_lvds(bridge);
 	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
 	int ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index eb747ea3325c1d487ac879a91d2b5436f5cd10c7..59d881ddf0eebf1265875c3cad7cce45990cde4d 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1140,11 +1140,11 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
 			       DSI_DISP0_COMMAND_MODE);
 	}
 }
 
 static void vc4_dsi_bridge_enable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_state)
+				  struct drm_atomic_state *state)
 {
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	bool debug_dump_regs = false;
 	u32 disp0_ctrl;
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 979f6d3239ba69ce0dbf6d55447b423875612fee..1715e42d0b70cb23cfb4eeeefd851299cf6d46a4 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1435,22 +1435,21 @@ zynqmp_dp_disp_connected_live_layer(struct zynqmp_dp *dp)
 	else
 		return NULL;
 }
 
 static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
-				  struct drm_bridge_state *old_bridge_state)
+				  struct drm_atomic_state *state)
 {
 	struct zynqmp_disp_layer *layer;
 	struct drm_bridge_state *bridge_state;
 	u32 bus_fmt;
 
 	layer = zynqmp_dp_disp_connected_live_layer(dp);
 	if (!layer)
 		return;
 
-	bridge_state = drm_atomic_get_new_bridge_state(old_bridge_state->base.state,
-						       old_bridge_state->bridge);
+	bridge_state = drm_atomic_get_new_bridge_state(state, &dp->bridge);
 	if (WARN_ON(!bridge_state))
 		return;
 
 	bus_fmt = bridge_state->input_bus_cfg.format;
 	zynqmp_disp_layer_set_live_format(layer, bus_fmt);
@@ -1547,14 +1546,13 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return MODE_OK;
 }
 
 static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
-					   struct drm_bridge_state *old_bridge_state)
+					   struct drm_atomic_state *state)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	const struct drm_crtc_state *crtc_state;
 	const struct drm_display_mode *adjusted_mode;
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
@@ -1563,11 +1561,11 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	int ret;
 
 	pm_runtime_get_sync(dp->dev);
 
 	guard(mutex)(&dp->lock);
-	zynqmp_dp_disp_enable(dp, old_bridge_state);
+	zynqmp_dp_disp_enable(dp, state);
 
 	/*
 	 * Retrieve the CRTC mode and adjusted mode. This requires a little
 	 * dance to go from the bridge to the encoder, to the connector and to
 	 * the CRTC.
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index eef4487f45af50dccbee5144378dbb3b5972a210..4c5e231230301f08ed568edbb4b6b2020234c012 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -323,11 +323,11 @@ struct drm_bridge_funcs {
 	 * chain if there is one.
 	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_bridge_state *old_bridge_state);
+			      struct drm_atomic_state *state);
 	/**
 	 * @atomic_disable:
 	 *
 	 * This callback should disable the bridge. It is called right before
 	 * the preceding element in the display pipe is disabled. If the

-- 
2.48.0

