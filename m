Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9FB17439
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EFB10E7C6;
	Thu, 31 Jul 2025 15:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC2710E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:52:59 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id C7C301C271A;
 Thu, 31 Jul 2025 17:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdc9:0:1347:874c:9851:58c6])
 by srv01.abscue.de (Postfix) with ESMTPSA id 133EB1C2715;
 Thu, 31 Jul 2025 17:52:55 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Thu, 31 Jul 2025 17:51:20 +0200
Subject: [PATCH v3 07/16] drm: sprd: register a DSI bridge and initialize
 in pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-ums9230-drm-v3-7-06d4f57c4b08@abscue.de>
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
In-Reply-To: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Eric Anholt <eric@anholt.net>, 
 Kevin Tang <kevin3.tang@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
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

If a panel needs to send DSI commands during initialization, it sets the
prepare_prev_first flag, which allows the DSI host to initialize itself
before the panel's prepare function is called. To support this, the DSI
host must register a bridge and perform the necessary initialization
steps in its pre_enable function.

Implement this for the Unisoc DSI driver by moving the initialization
code from the encoder callbacks to a bridge. Make the pre_enable
function initialize the host in command mode without starting the DPU.
Video mode (if supported by the panel) and the DPU are then started
in the enable function after the panel is initialized.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/Kconfig    |   2 +
 drivers/gpu/drm/sprd/sprd_dsi.c | 188 +++++++++++++++++++++++++---------------
 drivers/gpu/drm/sprd/sprd_dsi.h |   7 +-
 3 files changed, 125 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
index e22b780fe82248296a7153d02269faf8cd63294f..1afcdbf6f0ee3304f2297835241c9bb10d422154 100644
--- a/drivers/gpu/drm/sprd/Kconfig
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -2,6 +2,8 @@ config DRM_SPRD
 	tristate "DRM Support for Unisoc SoCs Platform"
 	depends on ARCH_SPRD || COMPILE_TEST
 	depends on DRM && OF
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_DISPLAY_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 23b0e1dc547a5023ee6ad7d5e1c49e2cec986bf0..22f300654a1903ecb7002c1e643361c6c51623d4 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 
@@ -778,26 +779,60 @@ static void sprd_dphy_fini(struct dsi_context *ctx)
 	dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_RESET_N, RF_PHY_RESET_N);
 }
 
-static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
-				      struct drm_display_mode *mode,
-				 struct drm_display_mode *adj_mode)
+static const struct drm_encoder_funcs sprd_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static int sprd_dsi_encoder_init(struct sprd_dsi *dsi,
+				 struct device *dev)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	u32 crtc_mask;
+	int ret;
+
+	crtc_mask = drm_of_find_possible_crtcs(dsi->drm, dev->of_node);
+	if (!crtc_mask) {
+		drm_err(dsi->drm, "failed to find crtc mask\n");
+		return -EINVAL;
+	}
+
+	drm_dbg(dsi->drm, "find possible crtcs: 0x%08x\n", crtc_mask);
+
+	encoder->possible_crtcs = crtc_mask;
+	ret = drm_encoder_init(dsi->drm, encoder, &sprd_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
+	if (ret) {
+		drm_err(dsi->drm, "failed to init dsi encoder\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sprd_dsi_bridge_attach(struct drm_bridge *bridge,
+				  struct drm_encoder *encoder,
+				  enum drm_bridge_attach_flags flags)
 {
-	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
+	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
+
+	return drm_bridge_attach(&dsi->encoder, dsi->panel_bridge,
+				 bridge, flags);
+}
+
+static void sprd_dsi_bridge_mode_set(struct drm_bridge *bridge,
+				     const struct drm_display_mode *mode,
+				     const struct drm_display_mode *adj_mode)
+{
+	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
 
 	drm_display_mode_to_videomode(adj_mode, &dsi->ctx.vm);
 }
 
-static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
+static void sprd_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 {
-	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
-	struct sprd_dpu *dpu = to_sprd_crtc(encoder->crtc);
+	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
 	struct dsi_context *ctx = &dsi->ctx;
 
-	if (ctx->enabled) {
-		drm_warn(dsi->drm, "dsi is initialized\n");
-		return;
-	}
-
 	sprd_dsi_init(ctx);
 	if (ctx->work_mode == DSI_MODE_VIDEO)
 		sprd_dsi_dpi_video(ctx);
@@ -806,6 +841,18 @@ static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
 
 	sprd_dphy_init(ctx);
 
+	/*
+	 * Initialize in command mode to allow panels to prepare by sending
+	 * DSI commands before the DPU is started.
+	 */
+	sprd_dsi_set_work_mode(ctx, DSI_MODE_CMD);
+}
+
+static void sprd_dsi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
+	struct dsi_context *ctx = &dsi->ctx;
+
 	sprd_dsi_set_work_mode(ctx, ctx->work_mode);
 	sprd_dsi_state_reset(ctx);
 
@@ -819,67 +866,38 @@ static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
 		dphy_wait_pll_locked(ctx);
 	}
 
-	sprd_dpu_run(dpu);
-
-	ctx->enabled = true;
+	sprd_dpu_run(to_sprd_crtc(dsi->encoder.crtc));
 }
 
-static void sprd_dsi_encoder_disable(struct drm_encoder *encoder)
+static void sprd_dsi_bridge_disable(struct drm_bridge *bridge)
 {
-	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
-	struct sprd_dpu *dpu = to_sprd_crtc(encoder->crtc);
+	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
 	struct dsi_context *ctx = &dsi->ctx;
 
-	if (!ctx->enabled) {
-		drm_warn(dsi->drm, "dsi isn't initialized\n");
-		return;
-	}
-
-	sprd_dpu_stop(dpu);
-	sprd_dphy_fini(ctx);
-	sprd_dsi_fini(ctx);
+	sprd_dpu_stop(to_sprd_crtc(dsi->encoder.crtc));
 
-	ctx->enabled = false;
+	/* Switch to command mode to allow panels to unprepare */
+	sprd_dsi_set_work_mode(ctx, DSI_MODE_CMD);
 }
 
-static const struct drm_encoder_helper_funcs sprd_encoder_helper_funcs = {
-	.mode_set	= sprd_dsi_encoder_mode_set,
-	.enable		= sprd_dsi_encoder_enable,
-	.disable	= sprd_dsi_encoder_disable
-};
-
-static const struct drm_encoder_funcs sprd_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-static int sprd_dsi_encoder_init(struct sprd_dsi *dsi,
-				 struct device *dev)
+static void sprd_dsi_bridge_post_disable(struct drm_bridge *bridge)
 {
-	struct drm_encoder *encoder = &dsi->encoder;
-	u32 crtc_mask;
-	int ret;
-
-	crtc_mask = drm_of_find_possible_crtcs(dsi->drm, dev->of_node);
-	if (!crtc_mask) {
-		drm_err(dsi->drm, "failed to find crtc mask\n");
-		return -EINVAL;
-	}
-
-	drm_dbg(dsi->drm, "find possible crtcs: 0x%08x\n", crtc_mask);
-
-	encoder->possible_crtcs = crtc_mask;
-	ret = drm_encoder_init(dsi->drm, encoder, &sprd_encoder_funcs,
-			       DRM_MODE_ENCODER_DSI, NULL);
-	if (ret) {
-		drm_err(dsi->drm, "failed to init dsi encoder\n");
-		return ret;
-	}
-
-	drm_encoder_helper_add(encoder, &sprd_encoder_helper_funcs);
+	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
+	struct dsi_context *ctx = &dsi->ctx;
 
-	return 0;
+	sprd_dphy_fini(ctx);
+	sprd_dsi_fini(ctx);
 }
 
+static const struct drm_bridge_funcs sprd_dsi_bridge_funcs = {
+	.attach		= sprd_dsi_bridge_attach,
+	.mode_set	= sprd_dsi_bridge_mode_set,
+	.pre_enable	= sprd_dsi_bridge_pre_enable,
+	.enable		= sprd_dsi_bridge_enable,
+	.disable	= sprd_dsi_bridge_disable,
+	.post_disable	= sprd_dsi_bridge_post_disable,
+};
+
 static int sprd_dsi_bridge_init(struct sprd_dsi *dsi,
 				struct device *dev)
 {
@@ -889,11 +907,34 @@ static int sprd_dsi_bridge_init(struct sprd_dsi *dsi,
 	if (IS_ERR(dsi->panel_bridge))
 		return PTR_ERR(dsi->panel_bridge);
 
-	ret = drm_bridge_attach(&dsi->encoder, dsi->panel_bridge, NULL, 0);
+	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
+	drm_bridge_add(&dsi->bridge);
+
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
-		return ret;
+		goto err_cleanup;
+
+	dsi->connector = drm_bridge_connector_init(dsi->drm, &dsi->encoder);
+	if (IS_ERR(dsi->connector)) {
+		drm_err(dsi->drm, "Unable to create bridge connector\n");
+		ret = PTR_ERR(dsi->connector);
+		goto err_cleanup;
+	}
+
+	ret = drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
+	if (ret < 0)
+		goto err_cleanup;
 
 	return 0;
+
+err_cleanup:
+	drm_bridge_remove(&dsi->bridge);
+	drm_of_panel_bridge_remove(dev->of_node, 1, 0);
+
+	return ret;
 }
 
 static int sprd_dsi_context_init(struct sprd_dsi *dsi,
@@ -921,7 +962,6 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
 	ctx->max_rd_time = 6000;
 	ctx->int0_mask = 0xffffffff;
 	ctx->int1_mask = 0xffffffff;
-	ctx->enabled = true;
 
 	return 0;
 }
@@ -940,13 +980,21 @@ static int sprd_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = sprd_dsi_bridge_init(dsi, dev);
 	if (ret)
-		return ret;
+		goto err_cleanup_encoder;
 
 	ret = sprd_dsi_context_init(dsi, dev);
 	if (ret)
-		return ret;
+		goto err_cleanup_bridge;
 
 	return 0;
+
+err_cleanup_encoder:
+	drm_encoder_cleanup(&dsi->encoder);
+err_cleanup_bridge:
+	drm_bridge_remove(&dsi->bridge);
+	drm_of_panel_bridge_remove(dev->of_node, 1, 0);
+
+	return ret;
 }
 
 static void sprd_dsi_unbind(struct device *dev,
@@ -954,6 +1002,7 @@ static void sprd_dsi_unbind(struct device *dev,
 {
 	struct sprd_dsi *dsi = dev_get_drvdata(dev);
 
+	drm_bridge_remove(&dsi->bridge);
 	drm_of_panel_bridge_remove(dev->of_node, 1, 0);
 
 	drm_encoder_cleanup(&dsi->encoder);
@@ -1032,9 +1081,10 @@ static int sprd_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sprd_dsi *dsi;
 
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return -ENOMEM;
+	dsi = devm_drm_bridge_alloc(dev, struct sprd_dsi, bridge,
+				    &sprd_dsi_bridge_funcs);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
 
 	dev_set_drvdata(dev, dsi);
 
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h b/drivers/gpu/drm/sprd/sprd_dsi.h
index d858ebb111150546e99403a87bc7cea42cad0158..d15b8bfd61f2e69f877aa727fbbbe4b61e9cb0fe 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.h
+++ b/drivers/gpu/drm/sprd/sprd_dsi.h
@@ -18,8 +18,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_panel.h>
 
-#define encoder_to_dsi(encoder) \
-	container_of(encoder, struct sprd_dsi, encoder)
+#define bridge_to_dsi(x)	container_of(x, struct sprd_dsi, bridge)
+#define encoder_to_dsi(x)	container_of(x, struct sprd_dsi, encoder)
 
 enum dsi_work_mode {
 	DSI_MODE_CMD = 0,
@@ -88,7 +88,6 @@ struct dsi_context {
 	struct regmap *regmap;
 	struct dphy_pll pll;
 	struct videomode vm;
-	bool enabled;
 
 	u8 work_mode;
 	u8 burst_mode;
@@ -116,7 +115,9 @@ struct sprd_dsi {
 	struct mipi_dsi_host host;
 	struct mipi_dsi_device *slave;
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_connector *connector;
 	struct dsi_context ctx;
 };
 

-- 
2.50.0
