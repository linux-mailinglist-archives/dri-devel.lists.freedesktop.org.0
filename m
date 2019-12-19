Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E9125F9C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E26EB0C;
	Thu, 19 Dec 2019 10:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690FF6EB07
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:44 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B6CFE8;
 Thu, 19 Dec 2019 11:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752342;
 bh=sAs5eh1bEJVHo5x7Frewp4qpovNJOABglvmIuSiWuZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vSAoqL9mIiq1VxkPK3hCfa8ODtKP1qAuIa90SXoNC5sVVeOPlZHLPccd00cZ64Gje
 3r2sPjsn2ZoSl3Y2eD4vrbPvqS17bHmFNNJJyC3aPSWD7bspWX4uvaspj+Gy1IrUIJ
 4qevNuZU9gUmB1VUj1UAK/dMUcCg0hY1wlwmCimo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/51] drm/bridge: Extend bridge API to disable connector
 creation
Date: Thu, 19 Dec 2019 12:44:36 +0200
Message-Id: <20191219104522.9379-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most bridge drivers create a DRM connector to model the connector at the
output of the bridge. This model is historical and has worked pretty
well so far, but causes several issues:

- It prevents supporting more complex display pipelines where DRM
connector operations are split over multiple components. For instance a
pipeline with a bridge connected to the DDC signals to read EDID data,
and another one connected to the HPD signal to detect connection and
disconnection, will not be possible to support through this model.

- It requires every bridge driver to implement similar connector
handling code, resulting in code duplication.

- It assumes that a bridge will either be wired to a connector or to
another bridge, but doesn't support bridges that can be used in both
positions very well (although there is some ad-hoc support for this in
the analogix_dp bridge driver).

In order to solve these issues, ownership of the connector should be
moved to the display controller driver (where it can be implemented
using helpers provided by the core).

Extend the bridge API to allow disabling connector creation in bridge
drivers as a first step towards the new model. The new flags argument to
the bridge .attach() operation allows instructing the bridge driver to
skip creating a connector. Unconditionally set the new flags argument to
0 for now to keep the existing behaviour, and modify all existing bridge
drivers to return an error when connector creation is not requested as
they don't support this feature yet.

The change is based on the following semantic patch, with manual review
and edits.

@ rule1 @
identifier funcs;
identifier fn;
@@
 struct drm_bridge_funcs funcs = {
 	...,
 	.attach = fn
 };

@ depends on rule1 @
identifier rule1.fn;
identifier bridge;
statement S, S1;
@@
 int fn(
 	struct drm_bridge *bridge
+	, enum drm_bridge_attach_flags flags
 )
 {
 	... when != S
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	S1
 	...
 }

@ depends on rule1 @
identifier rule1.fn;
identifier bridge, flags;
expression E1, E2, E3;
@@
 int fn(
 	struct drm_bridge *bridge,
 	enum drm_bridge_attach_flags flags
 ) {
 <...
 drm_bridge_attach(E1, E2, E3
+	, flags
 )
 ...>
 }

@@
expression E1, E2, E3;
@@
 drm_bridge_attach(E1, E2, E3
+	, 0
 )

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v3:

- Print error message when DRM_BRIDGE_ATTACH_NO_CONNECTOR can't be
  honoured
- Fix semantic patch to correctly handle drm_bridge_attach() calls from
  within a bridge .attach() handler
- Include drm_print.h in tc358767.c and rcar_lvds.c

Changes since v2:

- Update commit message to the new flags argument
- Replace a leftover 'true' with 0
- Update msm edp and hdmi

Changes since v1:

- Replace the create_connector boolean with a flags bitmask
- Update ingenic driver
- Add semantic patch to commit message
---
 drivers/gpu/drm/arc/arcpgu_hdmi.c             |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  8 +++++++-
 .../drm/bridge/analogix/analogix-anx6345.c    |  8 +++++++-
 .../drm/bridge/analogix/analogix-anx78xx.c    |  8 +++++++-
 .../drm/bridge/analogix/analogix_dp_core.c    | 10 ++++++++--
 drivers/gpu/drm/bridge/cdns-dsi.c             |  6 ++++--
 drivers/gpu/drm/bridge/dumb-vga-dac.c         |  8 +++++++-
 drivers/gpu/drm/bridge/lvds-encoder.c         |  5 +++--
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  8 +++++++-
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |  8 +++++++-
 drivers/gpu/drm/bridge/panel.c                |  8 +++++++-
 drivers/gpu/drm/bridge/parade-ps8622.c        |  8 +++++++-
 drivers/gpu/drm/bridge/sii902x.c              |  8 +++++++-
 drivers/gpu/drm/bridge/sil-sii8620.c          |  3 ++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 10 ++++++++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  8 +++++---
 drivers/gpu/drm/bridge/tc358764.c             |  8 +++++++-
 drivers/gpu/drm/bridge/tc358767.c             |  9 ++++++++-
 drivers/gpu/drm/bridge/thc63lvd1024.c         |  5 +++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  8 +++++++-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  8 +++++++-
 drivers/gpu/drm/drm_bridge.c                  |  6 ++++--
 drivers/gpu/drm/drm_simple_kms_helper.c       |  2 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |  3 ++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  4 ++--
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |  2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |  2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c             | 10 ++++++++--
 drivers/gpu/drm/imx/imx-ldb.c                 |  2 +-
 drivers/gpu/drm/imx/parallel-display.c        |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c               |  5 +++--
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 10 ++++++++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++--
 drivers/gpu/drm/msm/edp/edp.c                 |  2 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c          |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c               |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |  2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           | 11 ++++++++--
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |  2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |  2 +-
 drivers/gpu/drm/sti/sti_dvo.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hda.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
 drivers/gpu/drm/stm/ltdc.c                    |  2 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c            |  2 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c      |  2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                 |  2 +-
 include/drm/drm_bridge.h                      | 20 ++++++++++++++++---
 57 files changed, 208 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
index 8fd7094beece..52839934f2fb 100644
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
@@ -40,7 +40,7 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 		return ret;
 
 	/* Link drm_bridge to encoder */
-	ret = drm_bridge_attach(encoder, bridge, NULL);
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
 		drm_encoder_cleanup(encoder);
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 121b62682d80..e2019fe97fff 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -114,7 +114,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	}
 
 	if (bridge) {
-		ret = drm_bridge_attach(&output->encoder, bridge, NULL);
+		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);
 		if (!ret)
 			return 0;
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..63c006a0eaa9 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -847,11 +847,17 @@ static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
 	adv7511_mode_set(adv, mode, adj_mode);
 }
 
-static int adv7511_bridge_attach(struct drm_bridge *bridge)
+static int adv7511_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 56f55c53abfd..770c93af2448 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -520,11 +520,17 @@ static const struct drm_connector_funcs anx6345_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int anx6345_bridge_attach(struct drm_bridge *bridge)
+static int anx6345_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct anx6345 *anx6345 = bridge_to_anx6345(bridge);
 	int err;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 41867be03751..2216aaf400b8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -887,11 +887,17 @@ static const struct drm_connector_funcs anx78xx_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int anx78xx_bridge_attach(struct drm_bridge *bridge)
+static int anx78xx_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct anx78xx *anx78xx = bridge_to_anx78xx(bridge);
 	int err;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6effe532f820..6db2fb486831 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1216,13 +1216,19 @@ static const struct drm_connector_funcs analogix_dp_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int analogix_dp_bridge_attach(struct drm_bridge *bridge)
+static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
+				     enum drm_bridge_attach_flags flags)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_encoder *encoder = dp->encoder;
 	struct drm_connector *connector = NULL;
 	int ret = 0;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
@@ -1588,7 +1594,7 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
 	bridge->driver_private = dp;
 	bridge->funcs = &analogix_dp_bridge_funcs;
 
-	ret = drm_bridge_attach(dp->encoder, bridge, NULL);
+	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("failed to attach drm bridge\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 3a5bd4e7fd1e..330e28c8065a 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -645,7 +645,8 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	return 0;
 }
 
-static int cdns_dsi_bridge_attach(struct drm_bridge *bridge)
+static int cdns_dsi_bridge_attach(struct drm_bridge *bridge,
+				  enum drm_bridge_attach_flags flags)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -657,7 +658,8 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *bridge)
 		return -ENOTSUPP;
 	}
 
-	return drm_bridge_attach(bridge->encoder, output->bridge, bridge);
+	return drm_bridge_attach(bridge->encoder, output->bridge, bridge,
+				 flags);
 }
 
 static enum drm_mode_status
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index cc33dc411b9e..ad5b5a849e43 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -100,11 +100,17 @@ static const struct drm_connector_funcs dumb_vga_con_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
-static int dumb_vga_attach(struct drm_bridge *bridge)
+static int dumb_vga_attach(struct drm_bridge *bridge,
+			   enum drm_bridge_attach_flags flags)
 {
 	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
index e2132a8d5106..1089cd204977 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -18,14 +18,15 @@ struct lvds_encoder {
 	struct gpio_desc *powerdown_gpio;
 };
 
-static int lvds_encoder_attach(struct drm_bridge *bridge)
+static int lvds_encoder_attach(struct drm_bridge *bridge,
+			       enum drm_bridge_attach_flags flags)
 {
 	struct lvds_encoder *lvds_encoder = container_of(bridge,
 							 struct lvds_encoder,
 							 bridge);
 
 	return drm_bridge_attach(bridge->encoder, lvds_encoder->panel_bridge,
-				 bridge);
+				 bridge, flags);
 }
 
 static void lvds_encoder_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index e8a49f6146c6..6200f12a37e6 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -206,13 +206,19 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int ge_b850v3_lvds_attach(struct drm_bridge *bridge)
+static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
 	struct i2c_client *stdp4028_i2c
 			= ge_b850v3_lvds_ptr->stdp4028_i2c;
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 57ff01339559..438e566ce0a4 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -236,11 +236,17 @@ static const struct drm_connector_funcs ptn3460_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ptn3460_bridge_attach(struct drm_bridge *bridge)
+static int ptn3460_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index f66777e24968..49bf5592c6f7 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -53,12 +53,18 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int panel_bridge_attach(struct drm_bridge *bridge)
+static int panel_bridge_attach(struct drm_bridge *bridge,
+			       enum drm_bridge_attach_flags flags)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 10c47c008b40..d789ea2a7fb9 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -476,11 +476,17 @@ static const struct drm_connector_funcs ps8622_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ps8622_attach(struct drm_bridge *bridge)
+static int ps8622_attach(struct drm_bridge *bridge,
+			 enum drm_bridge_attach_flags flags)
 {
 	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index b70e8c5cf2e1..6dad025f8da7 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -399,12 +399,18 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 	mutex_unlock(&sii902x->mutex);
 }
 
-static int sii902x_bridge_attach(struct drm_bridge *bridge)
+static int sii902x_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	drm_connector_helper_add(&sii902x->connector,
 				 &sii902x_connector_helper_funcs);
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 4c0eef406eb1..92acd336aa89 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2202,7 +2202,8 @@ static inline struct sii8620 *bridge_to_sii8620(struct drm_bridge *bridge)
 	return container_of(bridge, struct sii8620, bridge);
 }
 
-static int sii8620_attach(struct drm_bridge *bridge)
+static int sii8620_attach(struct drm_bridge *bridge,
+			  enum drm_bridge_attach_flags flags)
 {
 	struct sii8620 *ctx = bridge_to_sii8620(bridge);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 67fca439bbfb..9bad194cfd0a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2371,7 +2371,8 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.atomic_check = dw_hdmi_connector_atomic_check,
 };
 
-static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
+static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 	struct drm_encoder *encoder = bridge->encoder;
@@ -2379,6 +2380,11 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 	struct cec_connector_info conn_info;
 	struct cec_notifier *notifier;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	connector->interlace_allowed = 1;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
@@ -3076,7 +3082,7 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 	if (IS_ERR(hdmi))
 		return hdmi;
 
-	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL);
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, 0);
 	if (ret) {
 		dw_hdmi_remove(hdmi);
 		DRM_ERROR("Failed to initialize bridge with drm\n");
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b6e793bb653c..bd32bb3a2eff 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -924,7 +924,8 @@ dw_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	return mode_status;
 }
 
-static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge)
+static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
+				     enum drm_bridge_attach_flags flags)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -937,7 +938,8 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge)
 	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge);
+	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
@@ -1107,7 +1109,7 @@ int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder)
 {
 	int ret;
 
-	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL);
+	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("Failed to initialize bridge with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 96207fcfde19..283e4a8dd923 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -349,12 +349,18 @@ static void tc358764_enable(struct drm_bridge *bridge)
 		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
 }
 
-static int tc358764_attach(struct drm_bridge *bridge)
+static int tc358764_attach(struct drm_bridge *bridge,
+			   enum drm_bridge_attach_flags flags)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	ret = drm_connector_init(drm, &ctx->connector,
 				 &tc358764_connector_funcs,
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 3709e5ace724..402a690d1fe5 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -31,6 +31,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 /* Registers */
@@ -1403,13 +1404,19 @@ static const struct drm_connector_funcs tc_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int tc_bridge_attach(struct drm_bridge *bridge)
+static int tc_bridge_attach(struct drm_bridge *bridge,
+			    enum drm_bridge_attach_flags flags)
 {
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	/* Create DP/eDP connector */
 	drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
 	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs,
diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 3d74129b2995..97d8129760e9 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -42,11 +42,12 @@ static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
 	return container_of(bridge, struct thc63_dev, bridge);
 }
 
-static int thc63_attach(struct drm_bridge *bridge)
+static int thc63_attach(struct drm_bridge *bridge,
+			enum drm_bridge_attach_flags flags)
 {
 	struct thc63_dev *thc63 = to_thc63(bridge);
 
-	return drm_bridge_attach(bridge->encoder, thc63->next, bridge);
+	return drm_bridge_attach(bridge->encoder, thc63->next, bridge, flags);
 }
 
 static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9a2dd986afa5..52efe8bd042e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -264,7 +264,8 @@ static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
 				       pdata->supplies);
 }
 
-static int ti_sn_bridge_attach(struct drm_bridge *bridge)
+static int ti_sn_bridge_attach(struct drm_bridge *bridge,
+			       enum drm_bridge_attach_flags flags)
 {
 	int ret, val;
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
@@ -275,6 +276,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 						   .node = NULL,
 						 };
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	ret = drm_connector_init(bridge->dev, &pdata->connector,
 				 &ti_sn_bridge_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 6f6d6d1e60ae..ae6ff7d93656 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -118,11 +118,17 @@ static const struct drm_connector_funcs tfp410_con_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
-static int tfp410_attach(struct drm_bridge *bridge)
+static int tfp410_attach(struct drm_bridge *bridge,
+			 enum drm_bridge_attach_flags flags)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	if (!bridge->encoder) {
 		dev_err(dvi->dev, "Missing encoder\n");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 473353bd762f..30fcb10f2a1e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -99,6 +99,7 @@ EXPORT_SYMBOL(drm_bridge_remove);
  * @encoder: DRM encoder
  * @bridge: bridge to attach
  * @previous: previous bridge in the chain (optional)
+ * @flags: DRM_BRIDGE_ATTACH_* flags
  *
  * Called by a kms driver to link the bridge to an encoder's chain. The previous
  * argument specifies the previous bridge in the chain. If NULL, the bridge is
@@ -116,7 +117,8 @@ EXPORT_SYMBOL(drm_bridge_remove);
  * Zero on success, error code on failure
  */
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
-		      struct drm_bridge *previous)
+		      struct drm_bridge *previous,
+		      enum drm_bridge_attach_flags flags)
 {
 	int ret;
 
@@ -138,7 +140,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		list_add(&bridge->chain_node, &encoder->bridge_chain);
 
 	if (bridge->funcs->attach) {
-		ret = bridge->funcs->attach(bridge);
+		ret = bridge->funcs->attach(bridge, flags);
 		if (ret < 0) {
 			list_del(&bridge->chain_node);
 			bridge->dev = NULL;
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 15fb516ae2d8..8ff4504161d5 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -229,7 +229,7 @@ static const struct drm_plane_funcs drm_simple_kms_plane_funcs = {
 int drm_simple_display_pipe_attach_bridge(struct drm_simple_display_pipe *pipe,
 					  struct drm_bridge *bridge)
 {
-	return drm_bridge_attach(&pipe->encoder, bridge, NULL);
+	return drm_bridge_attach(&pipe->encoder, bridge, NULL, 0);
 }
 EXPORT_SYMBOL(drm_simple_display_pipe_attach_bridge);
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 4785885c0f4f..d23d3502ca91 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -106,7 +106,8 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (dp->ptn_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, dp->ptn_bridge, bridge);
+		ret = drm_bridge_attach(&dp->encoder, dp->ptn_bridge, bridge,
+					0);
 		if (ret) {
 			DRM_DEV_ERROR(dp->dev,
 				      "Failed to attach bridge to drm\n");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 3955f84dc893..c6e2ea1a7622 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1521,7 +1521,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	out_bridge  = of_drm_find_bridge(device->dev.of_node);
 	if (out_bridge) {
-		drm_bridge_attach(encoder, out_bridge, NULL);
+		drm_bridge_attach(encoder, out_bridge, NULL, 0);
 		dsi->out_bridge = out_bridge;
 		list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
@@ -1698,7 +1698,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	if (dsi->in_bridge_node) {
 		in_bridge = of_drm_find_bridge(dsi->in_bridge_node);
 		if (in_bridge)
-			drm_bridge_attach(encoder, in_bridge, NULL);
+			drm_bridge_attach(encoder, in_bridge, NULL, 0);
 	}
 
 	return mipi_dsi_host_register(&dsi->dsi_host);
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9ff921f43a93..3e5f1a77286d 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -960,7 +960,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 	drm_connector_attach_encoder(connector, encoder);
 
 	if (hdata->bridge) {
-		ret = drm_bridge_attach(encoder, hdata->bridge, NULL);
+		ret = drm_bridge_attach(encoder, hdata->bridge, NULL, 0);
 		if (ret)
 			DRM_DEV_ERROR(hdata->dev, "Failed to attach bridge\n");
 	}
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 9598ee3cc4d2..cff344367f81 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -151,5 +151,5 @@ int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 		return fsl_dcu_attach_panel(fsl_dev, panel);
 	}
 
-	return drm_bridge_attach(&fsl_dev->encoder, bridge, NULL);
+	return drm_bridge_attach(&fsl_dev->encoder, bridge, NULL, 0);
 }
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index bdcf9c6ae9e9..f31068d74b18 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -777,7 +777,7 @@ static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
 	int ret;
 
 	/* associate the bridge to dsi encoder */
-	ret = drm_bridge_attach(encoder, bridge, NULL);
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("failed to attach external bridge\n");
 		return ret;
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index a63790d32d75..c3332209f27a 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1356,10 +1356,16 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 
 /* DRM bridge functions */
 
-static int tda998x_bridge_attach(struct drm_bridge *bridge)
+static int tda998x_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	return tda998x_connector_init(priv, bridge->dev);
 }
 
@@ -2022,7 +2028,7 @@ static int tda998x_encoder_init(struct device *dev, struct drm_device *drm)
 	if (ret)
 		goto err_encoder;
 
-	ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL);
+	ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL, 0);
 	if (ret)
 		goto err_bridge;
 
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 8cb2665b2c74..4da22a94790c 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -446,7 +446,7 @@ static int imx_ldb_register(struct drm_device *drm,
 
 	if (imx_ldb_ch->bridge) {
 		ret = drm_bridge_attach(&imx_ldb_ch->encoder,
-					imx_ldb_ch->bridge, NULL);
+					imx_ldb_ch->bridge, NULL, 0);
 		if (ret) {
 			DRM_ERROR("Failed to initialize bridge with drm\n");
 			return ret;
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 3dca424059f7..edb7022fbfc2 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -182,7 +182,7 @@ static int imx_pd_register(struct drm_device *drm,
 		drm_panel_attach(imxpd->panel, &imxpd->connector);
 
 	if (imxpd->bridge) {
-		ret = drm_bridge_attach(encoder, imxpd->bridge, NULL);
+		ret = drm_bridge_attach(encoder, imxpd->bridge, NULL, 0);
 		if (ret < 0) {
 			dev_err(imxpd->dev, "failed to attach bridge: %d\n",
 				ret);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 6d47ef7b148c..9dfe7cb530e1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -737,7 +737,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = drm_bridge_attach(&priv->encoder, bridge, NULL);
+	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Unable to attach bridge");
 		return ret;
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index d76106743f84..5317e4de59b7 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -843,7 +843,8 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
 	clk_disable_unprepare(d->lp_clk);
 }
 
-static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
+static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
+				  enum drm_bridge_attach_flags flags)
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	struct drm_device *drm = bridge->dev;
@@ -855,7 +856,7 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
 	}
 
 	/* Attach the DSI bridge to the output (panel etc) bridge */
-	ret = drm_bridge_attach(bridge->encoder, d->bridge_out, bridge);
+	ret = drm_bridge_attach(bridge->encoder, d->bridge_out, bridge, flags);
 	if (ret) {
 		dev_err(d->dev, "failed to attach the DSI bridge\n");
 		return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 01fa8b8d763d..14fbe1c09ce9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -607,7 +607,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	/* Currently DPI0 is fixed to be driven by OVL1 */
 	dpi->encoder.possible_crtcs = BIT(1);
 
-	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL);
+	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to attach bridge: %d\n", ret);
 		goto err_cleanup;
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b5e016d16c4..d708e73f24f3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -895,7 +895,7 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
 
 	/* If there's a bridge, attach to it and let it create the connector */
 	if (dsi->bridge) {
-		ret = drm_bridge_attach(&dsi->encoder, dsi->bridge, NULL);
+		ret = drm_bridge_attach(&dsi->encoder, dsi->bridge, NULL, 0);
 		if (ret) {
 			DRM_ERROR("Failed to attach bridge to drm\n");
 			goto err_encoder_cleanup;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5e4a4dbda443..a8b20557539b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1297,11 +1297,17 @@ static void mtk_hdmi_hpd_event(bool hpd, struct device *dev)
  * Bridge callbacks
  */
 
-static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge)
+static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
+				  enum drm_bridge_attach_flags flags)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 	int ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
 	ret = drm_connector_init_with_ddc(bridge->encoder->dev, &hdmi->conn,
 					  &mtk_hdmi_connector_funcs,
 					  DRM_MODE_CONNECTOR_HDMIA,
@@ -1326,7 +1332,7 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	if (hdmi->next_bridge) {
 		ret = drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
-					bridge);
+					bridge, flags);
 		if (ret) {
 			dev_err(hdmi->dev,
 				"Failed to attach external bridge: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0fc29f1be8cc..2e06732fa861 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -664,7 +664,7 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
-	ret = drm_bridge_attach(encoder, bridge, NULL);
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
 
@@ -693,7 +693,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 	encoder = msm_dsi->encoder;
 
 	/* link the internal dsi bridge to the external bridge */
-	drm_bridge_attach(encoder, ext_bridge, int_bridge);
+	drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
 
 	/*
 	 * we need the drm_connector created by the external bridge
diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
index ad4e963ccd9b..a78d6077802b 100644
--- a/drivers/gpu/drm/msm/edp/edp.c
+++ b/drivers/gpu/drm/msm/edp/edp.c
@@ -178,7 +178,7 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
 		goto fail;
 	}
 
-	ret = drm_bridge_attach(encoder, edp->bridge, NULL);
+	ret = drm_bridge_attach(encoder, edp->bridge, NULL, 0);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
index b65b5cc2dba2..c69a37e0c708 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -97,7 +97,7 @@ struct drm_bridge *msm_edp_bridge_init(struct msm_edp *edp)
 	bridge = &edp_bridge->base;
 	bridge->funcs = &edp_bridge_funcs;
 
-	ret = drm_bridge_attach(edp->encoder, bridge, NULL);
+	ret = drm_bridge_attach(edp->encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 1a9b6289637d..3a8646535c14 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -327,7 +327,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
+	ret = drm_bridge_attach(encoder, hdmi->bridge, NULL, 0);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index ba81338a9bf8..6e380db9287b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -287,7 +287,7 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge = &hdmi_bridge->base;
 	bridge->funcs = &msm_hdmi_bridge_funcs;
 
-	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL);
+	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index d2750f60f519..390e0662a8b8 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -297,7 +297,7 @@ static int omap_modeset_init(struct drm_device *dev)
 
 		if (pipe->output->bridge) {
 			ret = drm_bridge_attach(pipe->encoder,
-						pipe->output->bridge, NULL);
+						pipe->output->bridge, NULL, 0);
 			if (ret < 0)
 				return ret;
 		}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 3cd83a030a04..c07c6a88aff0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -121,7 +121,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	 * Attach the bridge to the encoder. The bridge will create the
 	 * connector.
 	 */
-	ret = drm_bridge_attach(encoder, bridge, NULL);
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
 		drm_encoder_cleanup(encoder);
 		return ret;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 2cf44b91853c..86984131a1a6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "rcar_lvds.h"
@@ -606,7 +607,8 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
 	rcar_lvds_get_lvds_mode(lvds);
 }
 
-static int rcar_lvds_attach(struct drm_bridge *bridge)
+static int rcar_lvds_attach(struct drm_bridge *bridge,
+			    enum drm_bridge_attach_flags flags)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 	struct drm_connector *connector = &lvds->connector;
@@ -616,7 +618,12 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
 	/* If we have a next bridge just attach it. */
 	if (lvds->next_bridge)
 		return drm_bridge_attach(bridge->encoder, lvds->next_bridge,
-					 bridge);
+					 bridge, flags);
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
 
 	/* Otherwise if we have a panel, create a connector. */
 	if (!lvds->panel)
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 325811d2e26e..24461feda880 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -441,7 +441,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 			goto err_free_connector;
 		}
 	} else {
-		ret = drm_bridge_attach(encoder, lvds->bridge, NULL);
+		ret = drm_bridge_attach(encoder, lvds->bridge, NULL, 0);
 		if (ret) {
 			DRM_DEV_ERROR(drm_dev->dev,
 				      "failed to attach bridge: %d\n", ret);
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index ae730275a34f..3e2484985955 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -144,7 +144,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 
 	rgb->bridge = bridge;
 
-	ret = drm_bridge_attach(encoder, rgb->bridge, NULL);
+	ret = drm_bridge_attach(encoder, rgb->bridge, NULL, 0);
 	if (ret) {
 		DRM_DEV_ERROR(drm_dev->dev,
 			      "failed to attach bridge: %d\n", ret);
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index df2ee86cd4c1..393fe61ab208 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -467,7 +467,7 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	bridge->of_node = dvo->dev.of_node;
 	drm_bridge_add(bridge);
 
-	err = drm_bridge_attach(encoder, bridge, NULL);
+	err = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (err) {
 		DRM_ERROR("Failed to attach bridge\n");
 		return err;
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 8f7bf33815fd..d7ea1d54c0c7 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -701,7 +701,7 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
 
 	bridge->driver_private = hda;
 	bridge->funcs = &sti_hda_bridge_funcs;
-	drm_bridge_attach(encoder, bridge, NULL);
+	drm_bridge_attach(encoder, bridge, NULL, 0);
 
 	connector->encoder = encoder;
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 814560ead4e1..49c8af82887f 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1281,7 +1281,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	bridge->driver_private = hdmi;
 	bridge->funcs = &sti_hdmi_bridge_funcs;
-	drm_bridge_attach(encoder, bridge, NULL);
+	drm_bridge_attach(encoder, bridge, NULL, 0);
 
 	connector->encoder = encoder;
 
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5b51298921cf..d65893f04b20 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1088,7 +1088,7 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 
 	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
 
-	ret = drm_bridge_attach(encoder, bridge, NULL);
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
 		drm_encoder_cleanup(encoder);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 65b7a8739666..26e5c7ceb8ff 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -156,7 +156,7 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 	}
 
 	if (bridge) {
-		ret = drm_bridge_attach(encoder, bridge, NULL);
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't attach our bridge\n");
 			goto err_cleanup_connector;
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index b27f16af50f5..3b23d5be3cf3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -253,7 +253,7 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 	}
 
 	if (rgb->bridge) {
-		ret = drm_bridge_attach(encoder, rgb->bridge, NULL);
+		ret = drm_bridge_attach(encoder, rgb->bridge, NULL, 0);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't attach our bridge\n");
 			goto err_cleanup_connector;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 51d034e095f4..28b7f703236e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -95,7 +95,7 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 
 	priv->external_encoder->possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(priv->external_encoder, bridge, NULL);
+	ret = drm_bridge_attach(priv->external_encoder, bridge, NULL, 0);
 	if (ret) {
 		dev_err(ddev->dev, "drm_bridge_attach() failed %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c586325de2a5..6dfede03396e 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -252,7 +252,7 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_DPI);
 
-	return drm_bridge_attach(dpi->encoder, bridge, NULL);
+	return drm_bridge_attach(dpi->encoder, bridge, NULL, 0);
 }
 
 static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 6c5b80ad6154..247ee034c6ec 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1603,7 +1603,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 			 DRM_MODE_ENCODER_DSI, NULL);
 	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
 
-	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL);
+	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev, "bridge attach failed: %d\n", ret);
 		return ret;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index dbaf6a2e7e4e..6774c51dadb3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -38,6 +38,17 @@ struct drm_panel;
 struct edid;
 struct i2c_adapter;
 
+/**
+ * enum drm_bridge_attach_flags - Flags for &drm_bridge_funcs.attach
+ */
+enum drm_bridge_attach_flags {
+	/**
+	 * @DRM_BRIDGE_ATTACH_NO_CONNECTOR: When this flag is set the bridge
+	 * shall not create a drm_connector.
+	 */
+	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
+};
+
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
  */
@@ -46,7 +57,8 @@ struct drm_bridge_funcs {
 	 * @attach:
 	 *
 	 * This callback is invoked whenever our bridge is being attached to a
-	 * &drm_encoder.
+	 * &drm_encoder. The flags argument tunes the behaviour of the attach
+	 * operation (see DRM_BRIDGE_ATTACH_*).
 	 *
 	 * The @attach callback is optional.
 	 *
@@ -54,7 +66,8 @@ struct drm_bridge_funcs {
 	 *
 	 * Zero on success, error code on failure.
 	 */
-	int (*attach)(struct drm_bridge *bridge);
+	int (*attach)(struct drm_bridge *bridge,
+		      enum drm_bridge_attach_flags flags);
 
 	/**
 	 * @detach:
@@ -586,7 +599,8 @@ void drm_bridge_add(struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
-		      struct drm_bridge *previous);
+		      struct drm_bridge *previous,
+		      enum drm_bridge_attach_flags flags);
 
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
