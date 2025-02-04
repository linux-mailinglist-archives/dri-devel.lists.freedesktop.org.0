Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47CA27500
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40F610E673;
	Tue,  4 Feb 2025 14:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="co0aeE7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452E110E674
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:58:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 732485C6A2E;
 Tue,  4 Feb 2025 14:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FE4C4CEDF;
 Tue,  4 Feb 2025 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681104;
 bh=DgiQvmaOeJVqBTFP18QMv1G2DcKiHgWyr56jy4yf9Co=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=co0aeE7D5m0XncWoUM5dZQ8/93lT9URDGM2bjdjyIP3reZT0jScXd7snuMsHGPmW0
 3MPvNNPjR8JEgUvptsg/VQIsEJw6qILBY+DE7Sp1o/1V+v0qzW0PpcRUbE79bQWqDB
 Wh8qBaIN909laRwe+pqH56GQyh79+5QEPgg5b2pM6V/nVO7MPEYk0ciC4+R5rWacUy
 fRbdQjUQl9u0YHkPYqkYuFmQbeSPk8JPtjVRR7Jox0WgLWR3NhDaeu1yd00ID21gr2
 5N27WMVfYjhM3reKrbUdHJPa8L+/bS8qrjJzShG3eLm5Z9n4fYXI2fHEpCbkLcjpw5
 5AfnWNVVih74w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:32 +0100
Subject: [PATCH v2 04/35] drm/bridge: Pass full state to atomic_disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-4-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=39617; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DgiQvmaOeJVqBTFP18QMv1G2DcKiHgWyr56jy4yf9Co=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtF6t6vxx0G1b9LIza5f1bj0xQfMA03WREvn7p06eE
 O4NfjZtR8dUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYSLEJY8O19fdmsV0+cS7k
 ocT/JAfJ6rzU17pKnxXbL0aKLjnSyiDDsqjsdadegumStmDdOZy/2BkbVogvVrKTvxrxfYLZ32t
 LZOqNPh0/NF3w1TajjFa5XkM2d9516qELLituCbdx+vXp4YzJAA==
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
drm_bridges, so let's change the atomic_disable hook prototype to pass
it directly.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |  6 ++----
 drivers/gpu/drm/bridge/analogix/anx7625.c           |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  2 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                    |  2 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |  5 ++---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |  7 +++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c |  5 ++---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  5 ++---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 +++-----
 drivers/gpu/drm/bridge/ite-it6263.c                 |  5 ++---
 drivers/gpu/drm/bridge/ite-it6505.c                 |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c                |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c             |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c             |  5 ++---
 drivers/gpu/drm/bridge/nwl-dsi.c                    |  5 ++---
 drivers/gpu/drm/bridge/panel.c                      |  3 +--
 drivers/gpu/drm/bridge/samsung-dsim.c               |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                    |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  2 +-
 drivers/gpu/drm/bridge/tc358767.c                   | 10 ++++------
 drivers/gpu/drm/bridge/ti-sn65dsi83.c               |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c               |  2 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                  |  3 ++-
 drivers/gpu/drm/drm_bridge.c                        | 10 +---------
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c           |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                   |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                  |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c          |  2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c           |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c          |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                 |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                     |  5 ++---
 drivers/gpu/drm/msm/dp/dp_drm.h                     |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                 |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                 |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c     |  2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      |  2 +-
 drivers/gpu/drm/stm/lvds.c                          |  2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                       |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                    |  4 +++-
 include/drm/drm_bridge.h                            |  2 +-
 45 files changed, 63 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 7939d622d6a24657092d0cd9ebdf835e092c51ee..5ebda1ca880439db8fbfa048be7274f763b82f51 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1321,15 +1321,13 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	dp->fast_train_enable = false;
 	dp->psr_supported = false;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
-static void
-analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state)
+static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *old_state)
 {
-	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *old_crtc, *new_crtc;
 	struct drm_crtc_state *old_crtc_state = NULL;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 79f78dbe96351ef5fb746dc6731176a8d2989376..0b97b66de577421b0e68e748d0075f674c71fbf1 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2417,11 +2417,11 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 		}
 	}
 }
 
 static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old)
+					  struct drm_atomic_state *state)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
 
 	dev_dbg(dev, "drm atomic disable\n");
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d3cebc79aaef75bd745892b7987f0a64bdc327f4..ef586e7df83b96f39ab552171d2ef665971a81ef 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2067,11 +2067,11 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	if (ret < 0)
 		schedule_work(&mhdp->modeset_retry_work);
 }
 
 static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *bridge_state)
+				     struct drm_atomic_state *state)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	u32 resp;
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0ba8bbc1afaec9cd7ae420568f98d21a31759614..26ae1ab5237f81ebd6c56075a18136f4a5b56ec9 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -221,11 +221,11 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
 }
 
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
-				   struct drm_bridge_state *old_bridge_state)
+				   struct drm_atomic_state *state)
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
 	/* Stop channel(s). */
 	if (fsl_ldb->devdata->lvds_en_bit)
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 9ee645489ea30a0478b114457aa0768dd7f2952e..a17433a7c75530668662ed8dd1526b44f9a32f32 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -87,11 +87,11 @@ static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
 
 	writel(val, pvi->regs + HTX_PVI_CTRL);
 }
 
 static void imx8mp_hdmi_pvi_bridge_disable(struct drm_bridge *bridge,
-					   struct drm_bridge_state *bridge_state)
+					   struct drm_atomic_state *state)
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
 
 	writel(0x0, pvi->regs + HTX_PVI_CTRL);
 
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
index fe2313aa2051c9d36ec0edbbd27d103229da6a9b..524aac751359f5cd377807508cbeeb6a597529e1 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -244,13 +244,12 @@ static void imx8qm_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	ldb_bridge_enable_helper(bridge);
 }
 
-static void
-imx8qm_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
-				 struct drm_bridge_state *old_bridge_state)
+static void imx8qm_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
+					     struct drm_atomic_state *state)
 {
 	struct ldb_channel *ldb_ch = bridge->driver_private;
 	struct ldb *ldb = ldb_ch->ldb;
 	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
 					base_to_imx8qm_ldb_channel(ldb_ch);
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index f3f5b7b810f682f9973413ad1d65c9764437e94a..3cb484773ddf95695111d4d64c1eba4fbb363dc3 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -251,13 +251,12 @@ static void imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	if (is_split && companion)
 		companion->funcs->atomic_enable(companion, state);
 }
 
-static void
-imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state)
+static void imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *state)
 {
 	struct ldb_channel *ldb_ch = bridge->driver_private;
 	struct ldb *ldb = ldb_ch->ldb;
 	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
 					base_to_imx8qxp_ldb_channel(ldb_ch);
@@ -279,11 +278,11 @@ imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	clk_disable_unprepare(imx8qxp_ldb->clk_bypass);
 	clk_disable_unprepare(imx8qxp_ldb->clk_pixel);
 
 	if (is_split && companion)
-		companion->funcs->atomic_disable(companion, old_bridge_state);
+		companion->funcs->atomic_disable(companion, state);
 
 	ret = pm_runtime_put(dev);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 1812bd106261b802658dfbd9d52ecab7de1036e2..1d9529dc7f2a93e7547ae1f4c6193598a5574135 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -174,13 +174,12 @@ imx8qxp_pc_bridge_mode_set(struct drm_bridge *bridge,
 	imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_DISP_BYPASS(ch->stream_id));
 
 	clk_disable_unprepare(pc->clk_apb);
 }
 
-static void
-imx8qxp_pc_bridge_atomic_disable(struct drm_bridge *bridge,
-				 struct drm_bridge_state *old_bridge_state)
+static void imx8qxp_pc_bridge_atomic_disable(struct drm_bridge *bridge,
+					     struct drm_atomic_state *state)
 {
 	struct imx8qxp_pc_channel *ch = bridge->driver_private;
 	struct imx8qxp_pc *pc = ch->pc;
 	int ret;
 
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 9b79e5dbcaca7f2b24a4183bcea4d6aac4464165..cd6818db0fd332cac03241917bbb107b7261097c 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -161,13 +161,12 @@ static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
 	imx8qxp_pixel_link_enable_mst_en(pl);
 	imx8qxp_pixel_link_enable_mst_vld(pl);
 	imx8qxp_pixel_link_enable_sync(pl);
 }
 
-static void
-imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_bridge_state)
+static void imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
+						     struct drm_atomic_state *state)
 {
 	struct imx8qxp_pixel_link *pl = bridge->driver_private;
 
 	imx8qxp_pixel_link_disable_mst_en(pl);
 	imx8qxp_pixel_link_disable_mst_vld(pl);
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 65cf3a6c8ec692488aaf421946c6b2180fcebcc1..49dd4f96d52c966d9a038b0b04007631d0837f4d 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -120,24 +120,22 @@ imx8qxp_pxl2dpi_bridge_mode_set(struct drm_bridge *bridge,
 		p2d->companion->funcs->mode_set(p2d->companion, mode,
 							adjusted_mode);
 	}
 }
 
-static void
-imx8qxp_pxl2dpi_bridge_atomic_disable(struct drm_bridge *bridge,
-				      struct drm_bridge_state *old_bridge_state)
+static void imx8qxp_pxl2dpi_bridge_atomic_disable(struct drm_bridge *bridge,
+						  struct drm_atomic_state *state)
 {
 	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
 	int ret;
 
 	ret = pm_runtime_put(p2d->dev);
 	if (ret < 0)
 		DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n", ret);
 
 	if (p2d->companion)
-		p2d->companion->funcs->atomic_disable(p2d->companion,
-							old_bridge_state);
+		p2d->companion->funcs->atomic_disable(p2d->companion, state);
 }
 
 static const u32 imx8qxp_pxl2dpi_bus_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 07de6257967e7a1a448c69f495bd414be884c2c3..12dcd569972a6eea8283a3b9b9ad4981f1133a5b 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -567,13 +567,12 @@ static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
 	}
 
 	return 0;
 }
 
-static void
-it6263_bridge_atomic_disable(struct drm_bridge *bridge,
-			     struct drm_bridge_state *old_bridge_state)
+static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
 	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
 	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e4c8e8ebdb2db084c19adf275e5e94a82ff5b4a0..9301366525bde0af0b2e2d112d2b06c32d028aeb 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3235,11 +3235,11 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 				     DP_SET_POWER_D0);
 }
 
 static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_state)
+					 struct drm_atomic_state *state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 4b784ac04b3a0284c4ff4b62a390ade75d686c21..b9f90f32145de0f17eadfdf0efbe95a2b5ca026d 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -729,11 +729,11 @@ static void it66121_bridge_enable(struct drm_bridge *bridge,
 
 	it66121_set_mute(ctx, false);
 }
 
 static void it66121_bridge_disable(struct drm_bridge *bridge,
-				   struct drm_bridge_state *bridge_state)
+				   struct drm_atomic_state *state)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
 
 	it66121_set_mute(ctx, true);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 65d5cdfe0d32cf9dca6582a60225db335c80172c..0fc5ea18fe6a8d0c1578dcae960d78cc33f4fb6d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -550,11 +550,11 @@ static void lt9211_atomic_enable(struct drm_bridge *bridge,
 
 	dev_dbg(ctx->dev, "LT9211 enabled.\n");
 }
 
 static void lt9211_atomic_disable(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state)
+				  struct drm_atomic_state *state)
 {
 	struct lt9211 *ctx = bridge_to_lt9211(bridge);
 	int ret;
 
 	/*
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 521cce42d0332564dfa1bb1cb06012711198022e..bacc8d373fe7c8af1370afef2588d9c41fd7f5f3 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -685,13 +685,12 @@ static void lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	/* Enable HDMI output */
 	regmap_write(lt9611->regmap, 0x8130, 0xea);
 }
 
-static void
-lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
-			     struct drm_bridge_state *old_bridge_state)
+static void lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	int ret;
 
 	/* Disable HDMI output */
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 00a2ffb3dc7d93be70496de53a9de1195a4d2b18..09b8b2e7d9fb358b5fb11d9646cf9c2f13221f3c 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -734,13 +734,12 @@ static int nwl_dsi_disable(struct nwl_dsi *dsi)
 	clk_disable_unprepare(dsi->tx_esc_clk);
 
 	return 0;
 }
 
-static void
-nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
-			      struct drm_bridge_state *old_bridge_state)
+static void nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
 
 	nwl_dsi_disable(dsi);
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index c8988de36ba3b5a76f221a61cb3007a815b8c58a..4ac9d32c701eb84df1fdff7d4ef06106bfd2e51d 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -145,14 +145,13 @@ static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	drm_panel_enable(panel_bridge->panel);
 }
 
 static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
-				struct drm_bridge_state *old_bridge_state)
+					struct drm_atomic_state *atomic_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 
 	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ddf55fad2815125e70c2c7029d26e7ba036eb9ad..4a75a49110bca0e4ce71fbb81081fbffd7d72465 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1494,11 +1494,11 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
 static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_bridge_state)
+					struct drm_atomic_state *state)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index ae53d94a39317b4f753d4d59184f7ee5858e44d9..2100a687096e50c83a7c554e6d21b3c638ef713b 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -323,11 +323,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
 	.get_modes = sii902x_get_modes,
 };
 
 static void sii902x_bridge_atomic_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
+					  struct drm_atomic_state *state)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
 	mutex_lock(&sii902x->mutex);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index e480842016232d36014a849d6b1cc0f29b409cc7..1d39015f1533e7957fb8bcc57995125dddbd4fd3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -393,11 +393,11 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 }
 
 static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_state)
+					     struct drm_atomic_state *state)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
 	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 55aacdd568d051f91ff04ba2b0ce96d7763b9c06..612b81c79f4a1ffe5bc4adf2502c20adea45d922 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2943,11 +2943,11 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 
 	mutex_unlock(&hdmi->mutex);
 }
 
 static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_state)
+					  struct drm_atomic_state *state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = true;
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index a1f72e61b9444cc79bf1bb7bed552c302bc30873..39e2d3a7a27d2603bb847d55c4812fb170389ba0 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1561,13 +1561,12 @@ static void tc_dpi_bridge_atomic_enable(struct drm_bridge *bridge,
 		tc_main_link_disable(tc);
 		return;
 	}
 }
 
-static void
-tc_dpi_bridge_atomic_disable(struct drm_bridge *bridge,
-			     struct drm_bridge_state *old_bridge_state)
+static void tc_dpi_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
 	ret = tc_dpi_stream_disable(tc);
@@ -1599,13 +1598,12 @@ static void tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
 		tc_main_link_disable(tc);
 		return;
 	}
 }
 
-static void
-tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
-			     struct drm_bridge_state *old_bridge_state)
+static void tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
 	ret = tc_edp_stream_disable(tc);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 64dfa5399ae1edc1d7949941bae8bdcbe8ea508f..4d9cbe966a9e728b35fc4a00c2898bd5eb9f455a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -549,11 +549,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	if (pval)
 		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
 }
 
 static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *old_bridge_state)
+				     struct drm_atomic_state *state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	int ret;
 
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 64b69101bd940a5bb49aabf6072a224d2f23ca72..eaa95e46513299f1fa9e7e9f065bd3560fe55f99 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -812,11 +812,11 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return MODE_OK;
 }
 
 static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_bridge_state)
+					struct drm_atomic_state *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/ti-tdp158.c
index c0308f997445f52f7f9c680eb67dde55edcb1049..22316382451fa3a55e1b3977982bd306b52b5888 100644
--- a/drivers/gpu/drm/bridge/ti-tdp158.c
+++ b/drivers/gpu/drm/bridge/ti-tdp158.c
@@ -33,11 +33,12 @@ static void tdp158_enable(struct drm_bridge *bridge,
 		dev_err(tdp158->dev, "failed to enable vdd: %d", err);
 
 	gpiod_set_value_cansleep(tdp158->enable, 1);
 }
 
-static void tdp158_disable(struct drm_bridge *bridge, struct drm_bridge_state *prev)
+static void tdp158_disable(struct drm_bridge *bridge,
+			   struct drm_atomic_state *state)
 {
 	struct tdp158 *tdp158 = bridge->driver_private;
 
 	gpiod_set_value_cansleep(tdp158->enable, 0);
 	regulator_disable(tdp158->vdd);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 7e18879b4f63410fb09657ba099522937bdf5976..f52b2d7c987bcc861ef84a26db2dd8d1b3669535 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -565,19 +565,11 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 		return;
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		if (iter->funcs->atomic_disable) {
-			struct drm_bridge_state *old_bridge_state;
-
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								iter);
-			if (WARN_ON(!old_bridge_state))
-				return;
-
-			iter->funcs->atomic_disable(iter, old_bridge_state);
+			iter->funcs->atomic_disable(iter, old_state);
 		} else if (iter->funcs->disable) {
 			iter->funcs->disable(iter);
 		}
 
 		if (iter == bridge)
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e52d8c4f0b7e93d6be88e3b3897e711a12bc70c1..20b93fff023995062096941ae571756185688387 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -258,11 +258,11 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_on(crtc);
 }
 
 static void ingenic_drm_bridge_atomic_disable(struct drm_bridge *bridge,
-					      struct drm_bridge_state *old_bridge_state)
+					      struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
 	unsigned int var;
 
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 687cdb8e3667e122e65ae7adb66d2ffcad765f8a..d3ffdbca48955a488e2fa5a9435deee970ab12a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2376,11 +2376,11 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 			   DP_PWR_STATE_BANDGAP_TPLL,
 			   DP_PWR_STATE_MASK);
 }
 
 static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_state)
+					 struct drm_atomic_state *state)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
 	mtk_dp->enabled = false;
 	mtk_dp_update_plugged_status(mtk_dp);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 2b6f65ac77d7d9274a8dda0a6116259948ed6206..d3a7e1cb27c00ab77404a1ed6ec3481bca44b976 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -823,11 +823,11 @@ static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
 
 	drm_display_mode_to_videomode(adjusted, &dsi->vm);
 }
 
 static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
+					  struct drm_atomic_state *state)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
 	mtk_output_dsi_disable(dsi);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a1904480fff8dcc0b4f3da883b9abe3238653253..602c9d348a7d3ec4f0ba13386508c531772b6e14 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1307,11 +1307,11 @@ static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
 {
 	return true;
 }
 
 static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
-					   struct drm_bridge_state *old_bridge_state)
+					   struct drm_atomic_state *state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
 	if (!hdmi->enabled)
 		return;
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index b535e74345f02079e22a18c8d991adeb03c5e41a..e79f7c3ce32efa8e5fe7afe274fe991ac363b734 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -188,11 +188,11 @@ static void meson_encoder_cvbs_atomic_enable(struct drm_bridge *bridge,
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
 	}
 }
 
 static void meson_encoder_cvbs_atomic_disable(struct drm_bridge *bridge,
-					      struct drm_bridge_state *bridge_state)
+					      struct drm_atomic_state *state)
 {
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
 					bridge_to_meson_encoder_cvbs(bridge);
 	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 140b3604dba10ac2aabadae065c2d9de8169ed03..fe204437bd6576a258dc11319e2b905f170a24a1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -77,11 +77,11 @@ static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
 
 	writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
 }
 
 static void meson_encoder_dsi_atomic_disable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi =
 					bridge_to_meson_encoder_dsi(bridge);
 	struct meson_drm *priv = meson_encoder_dsi->priv;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 7544c4e6af635b7e612a1a970987e0e15e054cf1..6d1c9262a2cfb7b08a68efb86821bf5ecf8c0941 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -247,11 +247,11 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
 	else
 		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
 }
 
 static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *bridge_state)
+					      struct drm_atomic_state *state)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 
 	writel_bits_relaxed(0x3, 0,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 47693c780a73fb59dddbb6e1e925d35e6915f3e2..c97bac8121fc0b76dffd4c90b0f42f8ec691ad46 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1557,11 +1557,11 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-			      struct drm_bridge_state *old_bridge_state)
+				  struct drm_atomic_state *state)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index eae8e849edc54da1faa9c557757873561fa223a1..84ecec79467dcb1d3c35abf422b1d6b7caf8d0ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -164,13 +164,12 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	msm_dp_bridge_atomic_enable(drm_bridge, state);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				      struct drm_bridge_state *old_bridge_state)
+					  struct drm_atomic_state *atomic_state)
 {
-	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state = NULL, *old_crtc_state = NULL;
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 
@@ -205,11 +204,11 @@ static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 		msm_dp_display_set_psr(dp, false);
 		return;
 	}
 
 out:
-	msm_dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
+	msm_dp_bridge_atomic_disable(drm_bridge, atomic_state);
 }
 
 static void msm_edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d54253ecbbff85f06112a1f62981c724774c237a..faf31a9da752c9ea65e80c8c95896fef39ffa8a8 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -26,11 +26,11 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   bool yuv_supported);
 
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-			      struct drm_bridge_state *old_bridge_state);
+				  struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *old_bridge_state);
 enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index c43f4a5218d1227a7431cccb015530e1b1543329..e1ac447221ee5ae5ee50637acfc8a30a8f111850 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -407,11 +407,11 @@ static void hdmi4_bridge_enable(struct drm_bridge *bridge,
 done:
 	mutex_unlock(&hdmi->lock);
 }
 
 static void hdmi4_bridge_disable(struct drm_bridge *bridge,
-				 struct drm_bridge_state *bridge_state)
+				 struct drm_atomic_state *state)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 	unsigned long flags;
 
 	mutex_lock(&hdmi->lock);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 49a4d31243e7dbb4ad6a9136e16032fd15dbe607..fa9904e4c218235bafa87be600680b3e5d5e2ea5 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -405,11 +405,11 @@ static void hdmi5_bridge_enable(struct drm_bridge *bridge,
 done:
 	mutex_unlock(&hdmi->lock);
 }
 
 static void hdmi5_bridge_disable(struct drm_bridge *bridge,
-				 struct drm_bridge_state *bridge_state)
+				 struct drm_atomic_state *state)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 	unsigned long flags;
 
 	mutex_lock(&hdmi->lock);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 86e112fe1fc44603585d916fc70c0a3bd7ab1313..380a855b832af9c09652ce39a78f974b63d949bb 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -593,11 +593,11 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 
 	rcar_lvds_enable(bridge, state, crtc, connector);
 }
 
 static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *old_bridge_state)
+				     struct drm_atomic_state *state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
 	/*
 	 * For D3 and E3, disabling the LVDS encoder before the DU would stall
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 4c8f63bd106e12b62e6c5006a439305f979beb64..d1e626068065c559a708772d3bbf16efe166ff59 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -814,11 +814,11 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 
 	rcar_mipi_dsi_start_video(dsi);
 }
 
 static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_bridge_state)
+					 struct drm_atomic_state *state)
 {
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
 	rcar_mipi_dsi_stop_video(dsi);
 }
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 1eafb637092b1731a606ed50d7cc8f89a7964606..4550c6d847962f06886f2b7645bae73646f1ffb6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -565,11 +565,11 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 err_stop:
 	rzg2l_mipi_dsi_stop(dsi);
 }
 
 static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
+					  struct drm_atomic_state *state)
 {
 	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
 
 	rzg2l_mipi_dsi_stop_video(dsi);
 	rzg2l_mipi_dsi_stop_hs_clock(dsi);
diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 7ec44f2264038c3642c40202bc014c438ecee104..4613e8e3b8fddc4455be0e3f81e0e811418746a0 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -1014,11 +1014,11 @@ static void lvds_atomic_enable(struct drm_bridge *bridge,
 		drm_panel_enable(lvds->panel);
 	}
 }
 
 static void lvds_atomic_disable(struct drm_bridge *bridge,
-				struct drm_bridge_state *old_bridge_state)
+				struct drm_atomic_state *state)
 {
 	struct stm_lvds *lvds = bridge_to_stm_lvds(bridge);
 
 	if (lvds->panel) {
 		drm_panel_disable(lvds->panel);
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 59d881ddf0eebf1265875c3cad7cce45990cde4d..60b300db52d24af6a04131c99cfdc05b6e9509aa 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -798,11 +798,11 @@ dsi_esc_timing(u32 ns)
 {
 	return DIV_ROUND_UP(ns, ESC_TIME_NS);
 }
 
 static void vc4_dsi_bridge_disable(struct drm_bridge *bridge,
-				   struct drm_bridge_state *state)
+				   struct drm_atomic_state *state)
 {
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	u32 disp0_ctrl;
 
 	disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 793a63ae514a5330803cd70be695800db7013bf0..82d10891d9cca2f5f6c26b54eeefcb75462339ba 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1624,12 +1624,14 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
 	mutex_unlock(&dp->lock);
 }
 
 static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-					    struct drm_bridge_state *old_bridge_state)
+					    struct drm_atomic_state *state)
 {
+	struct drm_bridge_state *old_bridge_state = drm_atomic_get_old_bridge_state(state,
+										    bridge);
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
 	mutex_lock(&dp->lock);
 	dp->enabled = false;
 	cancel_work(&dp->hpd_work);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ecc2801a771165622af3dbc60a5ff9c269c51a4b..140611fa68e01437f34d06c78d70ba7a7162c2c0 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -340,11 +340,11 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is still running when this callback is called.
 	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_bridge_state *old_bridge_state);
+			       struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_post_disable:
 	 *
 	 * This callback should disable the bridge. It is called right after the

-- 
2.48.0

