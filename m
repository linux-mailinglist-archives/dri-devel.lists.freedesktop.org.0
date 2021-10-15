Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B443E42F4E5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 16:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B87F6EDBB;
	Fri, 15 Oct 2021 14:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A988A6EDB4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 14:11:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k7so26610445wrd.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vazHN/sxAXSZFHwmXnL6gCn2h6WlVRsJ2PaV0+Ktbs=;
 b=cix6G8OmeYe2NR9QMI7gs6p0SCbQqqw857qtWxz1fdoEsStyJxhY44trrNduqK0XIH
 VaU6xRvoVfDIREDXhryV4K/nixjqpaPZv8PMHjktiFb1TPdeXT3PGHJg6UIaXW+qDhEF
 vrKd7e8sk4Sfd5MfIp0acX1/leP7SRCAgDSSsPu1EPSRW3f8t6GN/1Nwa/Hu/mxfQKUS
 9dnh8qeCmWMRIccFIgcLNRkc+eQ5cUw84qAm95rETY//7Hhq8Q5dIApHadX/qS1rkn/J
 JCT55HjeWvPFQ0z2Un8wr1f8L/+TaAoX72trVvudtb0Hv/vucKhwxgzzR5ccyfmEtAh3
 Hhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vazHN/sxAXSZFHwmXnL6gCn2h6WlVRsJ2PaV0+Ktbs=;
 b=o1quu5VG/E7U4NGOD6s9TgtPMKeDVASoktXymRb4DQkkSuinGG5NEEMTBcR8wf6jl3
 ffa95O1ZYoBrwMHAVR66UwQOJby/QdbN+MmgTHrhO42fdMEqdhSmM+STiuY1nuVyJks+
 LBHauPRetLQWDpXc6K2MtvJxnn9vB6VFs4UJVXPeCMxtYkiQ7BAuWbwP9UXgkgaCN3Iy
 zaVzeqjiMQi9iM1Fjv/6p+XowApPrViEQAyVQz0lOcYAIBD+oyd80qpmAx6VmRh4Z3HM
 pQkhFl1iBUicLFfLmI6d3X3+3hnAUD8W1aWra58tJzAD+PeATTVITCb+5J0RjESfch6p
 mmZg==
X-Gm-Message-State: AOAM530nV1oqN+N0eM4SxW8bvr4mmKqroJAM5mfroGgzw+2XYGFeszLd
 sLdeZfTj/a0qdKOo9gJSe1baJg==
X-Google-Smtp-Source: ABdhPJzt7lTmfxrDygCR5sNDAj+pieSg5qan65EvgB1Y3zR7QUUIzAQz9beMv5drxhOSHuJ9g9BCGA==
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr14792691wri.345.1634307077025; 
 Fri, 15 Oct 2021 07:11:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id f15sm4971434wrt.38.2021.10.15.07.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:11:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
Date: Fri, 15 Oct 2021 16:11:07 +0200
Message-Id: <20211015141107.2430800-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015141107.2430800-1-narmstrong@baylibre.com>
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12009; h=from:subject;
 bh=RGN+o5J8zyhu8akT0urPtTxpYJE0MX6eJNXFa9k9q3E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaYolaHOAeH/g5zTUhW2OTSwG5k5qnTzdae5VBPSZ
 ctTthuSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWmKJQAKCRB33NvayMhJ0SGMD/
 4gM9GD/XCGrtcLmv+b8iJb8hbvKBk0DTGxeiA74vlT2JoUHPbBHK++HOxLLq1clxSpbV/tubH2mR+r
 z6//qoC1TBFPgauUJ/l0MqpeP0NQFYHxFQhWl3oOYdgKBDMQMLaHcRewMZ9c+TCRlxYmifB/6ClQpu
 bMMQh+buyNKkzS1Pqu0EWzEqCSzir5FwHLjyULhc+m8uXF+icw+xCpH7rOYtK2x8En9kcWERFtXC7K
 hbfPB1NufWp3gXXs+j1C8B8mgOKlbTsCIE/B/ikL/P3jO939vHcEVjP2XwCtG3UkVqmEWOBoPfMRvj
 LOKlHAKQvKzipbJbv44oXj6NApeTKePPzTBY/uE14JGvIExsuhsUlfLrfiVfx3Mr9AvUJ/pOyWVvKq
 /vKo8oE5QtnS+6ihvO5PHR1CH0uhSFcbOVdMXQMlR4KXowP6CNS0SsVvZqLeCWeaQVPNNKjXu3/qoW
 FprbC1hxhRCOnUHsy04VpNm+NKrcfES2kWbH9LUrIWLJGh/H+FxUJvcyknaA610jBpojhKdGWMTK86
 S9/jWYD7KXciJ4ZUXe4MKOsri/CImgtLTUxwhhUzVFHvCPNeYHQIc1aHwtrcRRwJFtdsQy9sMcCAzo
 HIMVZZDqC2f0hKYfWMPEE6iPoSH2tmjbRHshqYb4U9qOmp/vDCmstxgG632A==
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
to leverage the generic CVBS display connector.

This will also permit adding custom cvbs connectors for ADC based HPD
detection on some Amlogic SoC based boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 208 ++++++++++-----------
 1 file changed, 103 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 01024c5f610c..5b9704d78cf9 100644
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
-
-static const
-struct drm_connector_helper_funcs meson_cvbs_connector_helper_funcs = {
-	.get_modes	= meson_cvbs_connector_get_modes,
-	.mode_valid	= meson_cvbs_connector_mode_valid,
-};
-
-/* Encoder */
+	if (meson_cvbs_get_mode(mode))
+		return MODE_OK;
 
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
@@ -159,10 +137,10 @@ static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
 	return -EINVAL;
 }
 
-static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
+static void meson_encoder_cvbs_disable(struct drm_bridge *bridge)
 {
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
-					encoder_to_meson_encoder_cvbs(encoder);
+					bridge_to_meson_encoder_cvbs(bridge);
 	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
 	/* Disable CVBS VDAC */
@@ -175,10 +153,10 @@ static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
 	}
 }
 
-static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
+static void meson_encoder_cvbs_enable(struct drm_bridge *bridge)
 {
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
-					encoder_to_meson_encoder_cvbs(encoder);
+					bridge_to_meson_encoder_cvbs(bridge);
 	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
 	/* VDAC0 source is not from ATV */
@@ -198,14 +176,30 @@ static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
 	}
 }
 
-static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
-				   struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
+static void meson_encoder_cvbs_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state)
 {
-	const struct meson_cvbs_mode *meson_mode = meson_cvbs_get_mode(mode);
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
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	meson_mode = meson_cvbs_get_mode(&crtc_state->adjusted_mode);
 
 	if (meson_mode) {
 		meson_venci_cvbs_mode_set(priv, meson_mode->enci);
@@ -218,76 +212,80 @@ static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
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
+	.enable	= meson_encoder_cvbs_enable,
+	.disable = meson_encoder_cvbs_disable,
+	.mode_valid = meson_encoder_cvbs_mode_valid,
+	.get_modes = meson_encoder_cvbs_get_modes,
+	.atomic_enable = meson_encoder_cvbs_atomic_enable,
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
+	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
 
-	/* Encoder */
-
-	drm_encoder_helper_add(encoder, &meson_encoder_cvbs_encoder_helper_funcs);
-
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

