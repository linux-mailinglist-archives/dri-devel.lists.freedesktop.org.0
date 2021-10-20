Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE551434B5D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 14:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18296E28A;
	Wed, 20 Oct 2021 12:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E826E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 12:39:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g2so18689977wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 05:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/IFVpxHHJMHARIjdjaFpebNjFZaqu9DmMEXQC6d8lb8=;
 b=fQfz2s+GIjH1uU5O3aV4gRZQgQlDTXAi3ZHtBRiY0MWbjfbwsRPV+HHvL9uhEVivX9
 CusCd4St2091KB5+whbMAidQabmHVLFWq6yDodC8C5aIAJMexkIZ0zLfs4G60dxLgLzA
 k2kMj+jdh/ZQUyfK3LR5Fx3N6G8+vNi0HurSQ/XMUvwuZOZNoAvc0mFG0vBIzMiCmI3o
 ax7U2UjMfzDwTd1PyUTy7MRTlCVioTf8F2V0Kfg6qfDro8eiix7YE8053M0EfJtdKYbL
 rDWDqVlnJqHk3dyoQmLCuiuCLuF3uJ4QPJN0b7m4ooHGJmCKxrDmhWVZQ03zFwx6WNTn
 Eq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/IFVpxHHJMHARIjdjaFpebNjFZaqu9DmMEXQC6d8lb8=;
 b=WXuO2Efpa36HLcPTUeTCjbpOQETbNie/oFvagAAh67SC9h07LCDj3y9ioXJhuOPwfb
 Mo/4BnWds2SYgeFu7KBwkNg0EXzApuG7UWnp31BQZyyOoCxRlyvp4r7AbK44SITkIVvr
 cneXLRwuTe4HUH2jhuiq2MTIoiDSXXlpj5cxHxf78rJAYQ3f5Ug6rrrpBngnmQx2wU74
 A80t0jeL2ZlyL8nE8nYhMyax+CAIqCyeS5kHs96NylKgv73UMiGeoMlK3RH1TF3nmqL2
 W0AgyXDW0MAYlfHboRzSwSwgwVtMyCyft6i9ff0DeUAweD0I6cjZmr8rcP74oXxa1v99
 dMMg==
X-Gm-Message-State: AOAM533eek1TKj84BhUnZn8nu9p3GtlxloU2apFspmXi5/XdqIc3tyKf
 gt/OK0i+gP3LGxIvM0Dq7VV+NQ==
X-Google-Smtp-Source: ABdhPJx5PaHHkfj44R0jHo5Eflv7DvAaCo43R50VoGhU9CgRj98KJuZdQp4to6o81FLwm3sGVufnQA==
X-Received: by 2002:a05:600c:378d:: with SMTP id
 o13mr8404439wmr.41.1634733597149; 
 Wed, 20 Oct 2021 05:39:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d31f:1512:8915:e439])
 by smtp.gmail.com with ESMTPSA id b19sm5342680wmj.9.2021.10.20.05.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 05:39:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
Date: Wed, 20 Oct 2021 14:39:47 +0200
Message-Id: <20211020123947.2585572-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020123947.2585572-1-narmstrong@baylibre.com>
References: <20211020123947.2585572-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12904; h=from:subject;
 bh=OlNNTmN8nosYoeNKPBE53UzuRFb9R4pSq4LSfrZKnuU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhcA34ftCu2bQYD9BgERzGjB8Kv6U3gZ6EYg3Pbf2X
 sOB7GZyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYXAN+AAKCRB33NvayMhJ0T5pD/
 9V1YFO4VRnw1txSSTLIOCukxA5xMFCG60fCaPJKrz3SP2K9mbvjgNMDv64J0wWNnNi+hYI3MoHJgYe
 HlGiUG6pVI2hoG1knDcD0xnBCme/yQos+D1VWlyytThYS5KgEjspl4xJd0bMzpKFHr1t/DEYTQQNUR
 KtS1ZBv/j/4s5eywzX/P9MBcMkiuhpa4E+RPUy7/7bNae57Bjr/Ajci060PWGGBgCoiu68NB2I8+sR
 A3uMg2N8pCxOZMlN0b9RYsrBplRtWjYIfr9Q2TsSqTWiPEhs+H/dYMwD2OsHhVnLDo1enrVKD7Me2V
 0qHvTxM6S+CZMASm4Zx6+2cv8VOlXcigjDc/jp1pOXU5nP5F83i8l1K2qJyXnrQoDKFWGygy9pQq8X
 rPtga2U+6sWdqojR3EkcwcKjEE4tTmextefuqctUigRGb52VC5wwgf5cBOUGee1Va3+HjELeDCMCPM
 51Gh8zI/NTfwPqmro8fTcItx1r6F3Lm1yTZF/Fz58ueDgbdfOvjTW5hPekC2ZfIb8+HX5ltqcae0kq
 E7p3W2gzt98B6j6TApYZWTayN6V4cWbHBk8pPGYqa0i7uJ9k30ZT2GF6daCgHi3WlYewoFG/c2Hl8k
 yuMSdLVacNYwGHLeooKtZGj6rYURnvHyDbuzqKy5u1d0x1ECNPhmTCTDFOOg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the local connector and move all callback to bridge funcs in order
to leverage the generic CVBS diplay connector.

This will also permit adding custom cvbs connectors for ADC based HPD
detection on some Amlogic SoC based boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 241 ++++++++++-----------
 1 file changed, 116 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 01024c5f610c..fd8db97ba8ba 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -13,10 +13,12 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_print.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "meson_registers.h"
 #include "meson_vclk.h"
@@ -30,14 +32,13 @@
 
 struct meson_encoder_cvbs {
 	struct drm_encoder	encoder;
-	struct drm_connector	connector;
+	struct drm_bridge	bridge;
+	struct drm_bridge	*next_bridge;
 	struct meson_drm	*priv;
 };
-#define encoder_to_meson_encoder_cvbs(x) \
-	container_of(x, struct meson_encoder_cvbs, encoder)
 
-#define connector_to_meson_encoder_cvbs(x) \
-	container_of(x, struct meson_encoder_cvbs, connector)
+#define bridge_to_meson_encoder_cvbs(x) \
+	container_of(x, struct meson_encoder_cvbs, bridge)
 
 /* Supported Modes */
 
@@ -81,32 +82,31 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
 	return NULL;
 }
 
-/* Connector */
-
-static void meson_cvbs_connector_destroy(struct drm_connector *connector)
+static int meson_encoder_cvbs_attach(struct drm_bridge *bridge,
+				     enum drm_bridge_attach_flags flags)
 {
-	drm_connector_cleanup(connector);
-}
+	struct meson_encoder_cvbs *meson_encoder_cvbs =
+					bridge_to_meson_encoder_cvbs(bridge);
 
-static enum drm_connector_status
-meson_cvbs_connector_detect(struct drm_connector *connector, bool force)
-{
-	/* FIXME: Add load-detect or jack-detect if possible */
-	return connector_status_connected;
+	return drm_bridge_attach(bridge->encoder, meson_encoder_cvbs->next_bridge,
+				 &meson_encoder_cvbs->bridge, flags);
 }
 
-static int meson_cvbs_connector_get_modes(struct drm_connector *connector)
+static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
+					struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct meson_encoder_cvbs *meson_encoder_cvbs =
+					bridge_to_meson_encoder_cvbs(bridge);
+	struct meson_drm *priv = meson_encoder_cvbs->priv;
 	struct drm_display_mode *mode;
 	int i;
 
 	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
 		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
 
-		mode = drm_mode_duplicate(dev, &meson_mode->mode);
+		mode = drm_mode_duplicate(priv->drm, &meson_mode->mode);
 		if (!mode) {
-			DRM_ERROR("Failed to create a new display mode\n");
+			dev_err(priv->dev, "Failed to create a new display mode\n");
 			return 0;
 		}
 
@@ -116,40 +116,18 @@ static int meson_cvbs_connector_get_modes(struct drm_connector *connector)
 	return i;
 }
 
-static int meson_cvbs_connector_mode_valid(struct drm_connector *connector,
-					   struct drm_display_mode *mode)
+static int meson_encoder_cvbs_mode_valid(struct drm_bridge *bridge,
+					const struct drm_display_info *display_info,
+					const struct drm_display_mode *mode)
 {
-	/* Validate the modes added in get_modes */
-	return MODE_OK;
-}
-
-static const struct drm_connector_funcs meson_cvbs_connector_funcs = {
-	.detect			= meson_cvbs_connector_detect,
-	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.destroy		= meson_cvbs_connector_destroy,
-	.reset			= drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
-};
+	if (meson_cvbs_get_mode(mode))
+		return MODE_OK;
 
-static const
-struct drm_connector_helper_funcs meson_cvbs_connector_helper_funcs = {
-	.get_modes	= meson_cvbs_connector_get_modes,
-	.mode_valid	= meson_cvbs_connector_mode_valid,
-};
-
-/* Encoder */
-
-static void meson_encoder_cvbs_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
+	return MODE_BAD;
 }
 
-static const struct drm_encoder_funcs meson_encoder_cvbs_encoder_funcs = {
-	.destroy        = meson_encoder_cvbs_encoder_destroy,
-};
-
-static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
+static int meson_encoder_cvbs_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
@@ -159,27 +137,40 @@ static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
 	return -EINVAL;
 }
 
-static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
+static void meson_encoder_cvbs_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state)
 {
-	struct meson_encoder_cvbs *meson_encoder_cvbs =
-					encoder_to_meson_encoder_cvbs(encoder);
-	struct meson_drm *priv = meson_encoder_cvbs->priv;
+	struct meson_encoder_cvbs *encoder_cvbs = bridge_to_meson_encoder_cvbs(bridge);
+	struct drm_atomic_state *state = bridge_state->base.state;
+	struct meson_drm *priv = encoder_cvbs->priv;
+	const struct meson_cvbs_mode *meson_mode;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
 
-	/* Disable CVBS VDAC */
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
-		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
-		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
-	} else {
-		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
-		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
-	}
-}
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
 
-static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
-{
-	struct meson_encoder_cvbs *meson_encoder_cvbs =
-					encoder_to_meson_encoder_cvbs(encoder);
-	struct meson_drm *priv = meson_encoder_cvbs->priv;
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	meson_mode = meson_cvbs_get_mode(&crtc_state->adjusted_mode);
+	if (WARN_ON(!meson_mode))
+		return;
+
+	meson_venci_cvbs_mode_set(priv, meson_mode->enci);
+
+	/* Setup 27MHz vclk2 for ENCI and VDAC */
+	meson_vclk_setup(priv, MESON_VCLK_TARGET_CVBS,
+			 MESON_VCLK_CVBS, MESON_VCLK_CVBS,
+			 MESON_VCLK_CVBS, MESON_VCLK_CVBS,
+			 true);
 
 	/* VDAC0 source is not from ATV */
 	writel_bits_relaxed(VENC_VDAC_SEL_ATV_DMD, 0,
@@ -198,96 +189,96 @@ static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
 	}
 }
 
-static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
-				   struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
+static void meson_encoder_cvbs_atomic_disable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *bridge_state)
 {
-	const struct meson_cvbs_mode *meson_mode = meson_cvbs_get_mode(mode);
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
-					encoder_to_meson_encoder_cvbs(encoder);
+					bridge_to_meson_encoder_cvbs(bridge);
 	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
-	if (meson_mode) {
-		meson_venci_cvbs_mode_set(priv, meson_mode->enci);
-
-		/* Setup 27MHz vclk2 for ENCI and VDAC */
-		meson_vclk_setup(priv, MESON_VCLK_TARGET_CVBS,
-				 MESON_VCLK_CVBS, MESON_VCLK_CVBS,
-				 MESON_VCLK_CVBS, MESON_VCLK_CVBS,
-				 true);
+	/* Disable CVBS VDAC */
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
+	} else {
+		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
 	}
 }
 
-static const struct drm_encoder_helper_funcs
-				meson_encoder_cvbs_encoder_helper_funcs = {
-	.atomic_check	= meson_encoder_cvbs_encoder_atomic_check,
-	.disable	= meson_encoder_cvbs_encoder_disable,
-	.enable		= meson_encoder_cvbs_encoder_enable,
-	.mode_set	= meson_encoder_cvbs_encoder_mode_set,
+static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
+	.attach = meson_encoder_cvbs_attach,
+	.mode_valid = meson_encoder_cvbs_mode_valid,
+	.get_modes = meson_encoder_cvbs_get_modes,
+	.atomic_enable = meson_encoder_cvbs_atomic_enable,
+	.atomic_disable = meson_encoder_cvbs_atomic_disable,
+	.atomic_check = meson_encoder_cvbs_atomic_check,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
-static bool meson_encoder_cvbs_connector_is_available(struct meson_drm *priv)
-{
-	struct device_node *remote;
-
-	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
-	if (!remote)
-		return false;
-
-	of_node_put(remote);
-	return true;
-}
-
 int meson_encoder_cvbs_init(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
 	struct meson_encoder_cvbs *meson_encoder_cvbs;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder;
+	struct device_node *remote;
 	int ret;
 
-	if (!meson_encoder_cvbs_connector_is_available(priv)) {
+	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs), GFP_KERNEL);
+	if (!meson_encoder_cvbs)
+		return -ENOMEM;
+
+	/* CVBS Connector Bridge */
+	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
+	if (!remote) {
 		dev_info(drm->dev, "CVBS Output connector not available\n");
 		return 0;
 	}
 
-	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs),
-				       GFP_KERNEL);
-	if (!meson_encoder_cvbs)
-		return -ENOMEM;
+	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	if (!meson_encoder_cvbs->next_bridge) {
+		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
+		return -EPROBE_DEFER;
+	}
 
-	meson_encoder_cvbs->priv = priv;
-	encoder = &meson_encoder_cvbs->encoder;
-	connector = &meson_encoder_cvbs->connector;
+	/* CVBS Encoder Bridge */
+	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
+	meson_encoder_cvbs->bridge.of_node = priv->dev->of_node;
+	meson_encoder_cvbs->bridge.type = DRM_MODE_CONNECTOR_Composite;
+	meson_encoder_cvbs->bridge.ops = DRM_BRIDGE_OP_MODES;
+	meson_encoder_cvbs->bridge.interlace_allowed = true;
 
-	/* Connector */
+	drm_bridge_add(&meson_encoder_cvbs->bridge);
 
-	drm_connector_helper_add(connector,
-				 &meson_cvbs_connector_helper_funcs);
+	meson_encoder_cvbs->priv = priv;
 
-	ret = drm_connector_init(drm, connector, &meson_cvbs_connector_funcs,
-				 DRM_MODE_CONNECTOR_Composite);
+	/* Encoder */
+	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
+				      DRM_MODE_ENCODER_TVDAC);
 	if (ret) {
-		dev_err(priv->dev, "Failed to init CVBS connector\n");
+		dev_err(priv->dev, "Failed to init CVBS encoder: %d\n", ret);
 		return ret;
 	}
 
-	connector->interlace_allowed = 1;
-
-	/* Encoder */
-
-	drm_encoder_helper_add(encoder, &meson_encoder_cvbs_encoder_helper_funcs);
+	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
 
-	ret = drm_encoder_init(drm, encoder, &meson_encoder_cvbs_encoder_funcs,
-			       DRM_MODE_ENCODER_TVDAC, "meson_encoder_cvbs");
+	/* Attach CVBS Encoder Bridge to Encoder */
+	ret = drm_bridge_attach(&meson_encoder_cvbs->encoder, &meson_encoder_cvbs->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
-		dev_err(priv->dev, "Failed to init CVBS encoder\n");
+		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
 		return ret;
 	}
 
-	encoder->possible_crtcs = BIT(0);
-
-	drm_connector_attach_encoder(connector, encoder);
+	/* Initialize & attach Bridge Connector */
+	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
+	if (IS_ERR(connector)) {
+		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
+		return PTR_ERR(connector);
+	}
+	drm_connector_attach_encoder(connector, &meson_encoder_cvbs->encoder);
 
 	return 0;
 }
-- 
2.25.1

