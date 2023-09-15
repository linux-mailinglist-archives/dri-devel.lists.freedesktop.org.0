Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693657A1945
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F8410E5DD;
	Fri, 15 Sep 2023 08:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B16810E5DF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:17 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by baptiste.telenet-ops.be with bizsmtp
 id m8uF2A00k1C8whw018uF2t; Fri, 15 Sep 2023 10:54:15 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aK-003lIY-Ad;
 Fri, 15 Sep 2023 10:54:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ad-00Gddu-BK;
 Fri, 15 Sep 2023 10:54:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 41/41] drm: renesas: shmobile: Add DT support
Date: Fri, 15 Sep 2023 10:53:56 +0200
Message-Id: <6185ab76aa300fa402e4f6610b2109665f2d8a1c.1694767209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT support, by:
  1. Creating a panel bridge from DT, and attaching it to the encoder,
  2. Replacing the custom connector with a bridge connector,
  3. Obtaining clock configuration based on the compatible value.

Note that for now the driver uses a fixed clock configuration selecting
the bus clock, as the current code to select other clock inputs needs
changes to support any other SoCs than SH7724.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - Use devm_drm_of_get_bridge(),
  - Don't print bridge->of_node on failure, as this field depends on
    CONFIG_OF.

Notes:
  - SH-Mobile AG5 (SH73A0) support is untested.
  - Unbind crashes when drm_encoder_cleanup() calls drm_bridge_detach(),
    as the bridge (allocated by devm_drm_panel_bridge_add()) has already
    been freed by that time. This is a known issue with the bridge code.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 56 ++++++++++++++-----
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  1 +
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 27 ++++++++-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  6 ++
 4 files changed, 74 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 729028a15efae00c..2e2f37b9d0a4bafa 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -9,12 +9,16 @@
 
 #include <linux/clk.h>
 #include <linux/media-bus-format.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_dma_helper.h>
@@ -23,6 +27,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
@@ -35,10 +40,6 @@
 #include "shmob_drm_plane.h"
 #include "shmob_drm_regs.h"
 
-/*
- * TODO: panel support
- */
-
 /* -----------------------------------------------------------------------------
  * Page Flip
  */
@@ -201,7 +202,7 @@ static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
-	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
+	unsigned int clk_div = sdev->config.clk_div;
 	struct device *dev = sdev->dev;
 	u32 value;
 	int ret;
@@ -223,17 +224,17 @@ static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 	lcdc_write(sdev, LDPMR, 0);
 
 	value = sdev->lddckr;
-	if (idata->clk_div) {
+	if (clk_div) {
 		/* FIXME: sh7724 can only use 42, 48, 54 and 60 for the divider
 		 * denominator.
 		 */
 		lcdc_write(sdev, LDDCKPAT1R, 0);
-		lcdc_write(sdev, LDDCKPAT2R, (1 << (idata->clk_div / 2)) - 1);
+		lcdc_write(sdev, LDDCKPAT2R, (1 << (clk_div / 2)) - 1);
 
-		if (idata->clk_div == 1)
+		if (clk_div == 1)
 			value |= LDDCKR_MOSEL;
 		else
-			value |= idata->clk_div;
+			value |= clk_div;
 	}
 
 	lcdc_write(sdev, LDDCKR, value);
@@ -406,7 +407,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 }
 
 /* -----------------------------------------------------------------------------
- * Encoder
+ * Legacy Encoder
  */
 
 static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
@@ -435,9 +436,14 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
 };
 
+/* -----------------------------------------------------------------------------
+ * Encoder
+ */
+
 int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 {
 	struct drm_encoder *encoder = &sdev->encoder;
+	struct drm_bridge *bridge;
 	int ret;
 
 	encoder->possible_crtcs = 1;
@@ -447,13 +453,30 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 	if (ret < 0)
 		return ret;
 
-	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
+	if (sdev->pdata) {
+		drm_encoder_helper_add(encoder, &encoder_helper_funcs);
+		return 0;
+	}
+
+	/* Create a panel bridge */
+	bridge = devm_drm_of_get_bridge(sdev->dev, sdev->dev->of_node, 0, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
+
+	/* Attach the bridge to the encoder */
+	ret = drm_bridge_attach(encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(sdev->dev, "failed to attach bridge: %pe\n",
+			ERR_PTR(ret));
+		return ret;
+	}
 
 	return 0;
 }
 
 /* -----------------------------------------------------------------------------
- * Connector
+ * Legacy Connector
  */
 
 static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connector *connector)
@@ -563,13 +586,20 @@ shmob_drm_connector_init(struct shmob_drm_device *sdev,
 	return connector;
 }
 
+/* -----------------------------------------------------------------------------
+ * Connector
+ */
+
 int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 			       struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
 	int ret;
 
-	connector = shmob_drm_connector_init(sdev, encoder);
+	if (sdev->pdata)
+		connector = shmob_drm_connector_init(sdev, encoder);
+	else
+		connector = drm_bridge_connector_init(&sdev->ddev, encoder);
 	if (IS_ERR(connector)) {
 		dev_err(sdev->dev, "failed to created connector: %pe\n",
 			connector);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index 89a0746f9a35807d..16e1712dd04e0f2b 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -29,6 +29,7 @@ struct shmob_drm_crtc {
 	wait_queue_head_t flip_wait;
 };
 
+/* Legacy connector */
 struct shmob_drm_connector {
 	struct drm_connector base;
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index c498d0d9b4fc4fc5..e83c3e52251dedf9 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -173,11 +174,13 @@ static void shmob_drm_remove(struct platform_device *pdev)
 static int shmob_drm_probe(struct platform_device *pdev)
 {
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
+	const struct shmob_drm_config *config;
 	struct shmob_drm_device *sdev;
 	struct drm_device *ddev;
 	int ret;
 
-	if (pdata == NULL) {
+	config = of_device_get_match_data(&pdev->dev);
+	if (!config && !pdata) {
 		dev_err(&pdev->dev, "no platform data\n");
 		return -EINVAL;
 	}
@@ -193,7 +196,13 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 	ddev = &sdev->ddev;
 	sdev->dev = &pdev->dev;
-	sdev->pdata = pdata;
+	if (config) {
+		sdev->config = *config;
+	} else {
+		sdev->pdata = pdata;
+		sdev->config.clk_source = pdata->clk_source;
+		sdev->config.clk_div = pdata->iface.clk_div;
+	}
 	spin_lock_init(&sdev->irq_lock);
 
 	platform_set_drvdata(pdev, sdev);
@@ -202,7 +211,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (IS_ERR(sdev->mmio))
 		return PTR_ERR(sdev->mmio);
 
-	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
+	ret = shmob_drm_setup_clocks(sdev, sdev->config.clk_source);
 	if (ret < 0)
 		return ret;
 
@@ -250,11 +259,23 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static const struct shmob_drm_config shmob_arm_config = {
+	.clk_source = SHMOB_DRM_CLK_BUS,
+	.clk_div = 5,
+};
+
+static const struct of_device_id shmob_drm_of_table[] __maybe_unused = {
+	{ .compatible = "renesas,r8a7740-lcdc",	.data = &shmob_arm_config, },
+	{ .compatible = "renesas,sh73a0-lcdc",	.data = &shmob_arm_config, },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
 	.remove_new	= shmob_drm_remove,
 	.driver		= {
 		.name	= "shmob-drm",
+		.of_match_table = of_match_ptr(shmob_drm_of_table),
 		.pm	= &shmob_drm_pm_ops,
 	},
 };
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
index 18907e5ace51c681..088ac5381e91e61a 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
@@ -20,9 +20,15 @@ struct clk;
 struct device;
 struct drm_device;
 
+struct shmob_drm_config {
+	enum shmob_drm_clk_source clk_source;
+	unsigned int clk_div;
+};
+
 struct shmob_drm_device {
 	struct device *dev;
 	const struct shmob_drm_platform_data *pdata;
+	struct shmob_drm_config config;
 
 	void __iomem *mmio;
 	struct clk *clock;
-- 
2.34.1

