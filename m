Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DDF42DE1A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F796EB70;
	Thu, 14 Oct 2021 15:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E340A6EB6A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 15:26:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g25so20606150wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c94TXJUU9Tn5Br00ptQarYNibinITrqp1MJiXWZUIJU=;
 b=14XacjbBkZaME+xCLEdSax/U5zpDQeLqh7gNIqTN2ZuKCqmkTEIn2sQNF1t60Umsyw
 rykCOWAqvIFez9pLl82PTsWjkcwugIxDh9aLGjZBuMTtXd1OGVv0I+b6DVM4IEHBCzu7
 yk7UmfzBHMN0QABAu5/nElNLZ6QfrGQekwQwJZEZUaK/Kmc4vQmF9V5BVdQYa8UqLonB
 mkLO4YJwr4Pv+79HMlCJAILB/vK5vrnyyheSdSQ78OY+iTRpaT+nG5MvD/jwAWUfxLv9
 DIUqI35bp42tD+bvsiShYTsNnJUxN7wtMdEQzwvR+HbVWWL4CpEd7KwfCzAzIVPaXKac
 AR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c94TXJUU9Tn5Br00ptQarYNibinITrqp1MJiXWZUIJU=;
 b=kIypmVGXI7mHkrNAdab7Fbivtscd13WWg52DudULYj7NRckbDlX5anTZRZK6/TzX0a
 4AL5qJ8RbS+44TItRQmIn7oa6V2kS7upjyIquea827zBY4THxpOz/QIdmmKWbdzLSqpy
 TxOLJ9yDKy/jPgTrKCnl69qEE5B/aiZkBNqEYXImLrr/95gF8jNLXfcBOzWGJtgb1Df1
 0nq6+3xcDsDIDdZhlh9B5P05wBT/vKOtio5/QD/xaT4xjyAfyc8v4JoMnvqdazqq88Hq
 fNDMu9Mi5wiOqnzw6HDqPZwseLdcBac7FPwMu1dJcbrQEXg+c5LCzPiRRzc1aS5VGyOs
 xlhw==
X-Gm-Message-State: AOAM533AFMiEiDhW4FluigXHECiEDl9zDiKTDxayNwFT7aH5vjfBlMQH
 W/aS2I2WTtZNTuxJqSgQkKwfNg==
X-Google-Smtp-Source: ABdhPJwbAIl/G9Vvg9EDmTf5st6qJ9/7+rVtHD/s1W7j3fv7YlrZ00juRyfjffGoLWyBWQgqMmMm2w==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr20071328wmp.43.1634225179181; 
 Thu, 14 Oct 2021 08:26:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 7/7] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
Date: Thu, 14 Oct 2021 17:26:06 +0200
Message-Id: <20211014152606.2289528-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014152606.2289528-1-narmstrong@baylibre.com>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10509; h=from:subject;
 bh=KCHKpDSUauSGGy0CAW8huADDJq10sL56KJUwfhOuo9Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEuAQdh5GZ47uzc7qfa90gniMaahg1dOSAn7TAko
 oxIO+GqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLgAAKCRB33NvayMhJ0aCSEA
 CfmobsOMHngkWrpqm5G+/r7LPzvZ63Y7ggiz2e6mVd400koeRaBSqtGba+Q8p9pjzcFv/JL1lWicWW
 nYQdrOpt1mKXX/4LZ3lZ6Te45h50ZuD8l2SUBolPtnI5dnMy8UHOhpj7I6oZDT8HFTS5zoOnwFkV/P
 CJHZjtLjYo8moQAx9QVg5Co98ULO+/n9OJ6nS9V7/QPlthnJ3kDrtXqrmeHjm76x3kZ0BbxH7TpHAo
 X76ZKeAuvXhxzM8wDQuSE4xZHB01YZ4bM+g/k1YwvUrV6fU7iDZ1IOpkMWHrQdXIIbIsotPLH0DdOP
 Mk2DNPiEbSQMVhZt0ak3bkY/rQ5yoxyP8DW3GUHE62xNzV/N2FxVvLvga32YcSVIHnjcR/DzTULCtu
 Zr0tI3JUMkWZ3WDkjFZxskuYz4oLsLWuclqpgEdMEoY6F6Ulamcn0zNUgTjiuZfOvV55VJqhbdgfTH
 HLA4y+H6uWFOkUQXzFTkLL/zontlIO6E9fVnmROvPNhEAnzMWujFuVStwW8H1cOG8eGIZkm8FYO83c
 CtVf6XSBv4geJMZ3Ku7Xlp7u0HCpD1ln3R5iNNf6XwPgksgqDvZA7wPfwx1SBBIxGeCJyU9M1dNgCq
 BhHX5toXUty3H45GTaOcTQWtCAFJ5/dEOFjZYfgaNxjdp1gFWjx+kJCINcwg==
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
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 178 +++++++++------------
 1 file changed, 79 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 01024c5f610c..0b974667cf55 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -13,6 +13,9 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
@@ -30,14 +33,14 @@
 
 struct meson_encoder_cvbs {
 	struct drm_encoder	encoder;
-	struct drm_connector	connector;
+	struct drm_bridge	bridge;
+	struct drm_bridge	*next_bridge;
+	struct drm_connector	*connector;
 	struct meson_drm	*priv;
 };
-#define encoder_to_meson_encoder_cvbs(x) \
-	container_of(x, struct meson_encoder_cvbs, encoder)
 
-#define connector_to_meson_encoder_cvbs(x) \
-	container_of(x, struct meson_encoder_cvbs, connector)
+#define bridge_to_meson_encoder_cvbs(x) \
+	container_of(x, struct meson_encoder_cvbs, bridge)
 
 /* Supported Modes */
 
@@ -81,21 +84,18 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
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
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode;
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
+	if (meson_cvbs_get_mode(mode))
+		return MODE_OK;
 
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
@@ -198,13 +176,13 @@ static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
 	}
 }
 
-static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
-				   struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
+static void meson_encoder_cvbs_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
 {
 	const struct meson_cvbs_mode *meson_mode = meson_cvbs_get_mode(mode);
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
-					encoder_to_meson_encoder_cvbs(encoder);
+					bridge_to_meson_encoder_cvbs(bridge);
 	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
 	if (meson_mode) {
@@ -218,76 +196,78 @@ static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
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
+	.mode_set = meson_encoder_cvbs_mode_set,
+	.get_modes = meson_encoder_cvbs_get_modes,
+	.atomic_check = meson_encoder_cvbs_atomic_check,
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
-	struct drm_connector *connector;
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
+	meson_encoder_cvbs->connector = drm_bridge_connector_init(priv->drm,
+							&meson_encoder_cvbs->encoder);
+	if (IS_ERR(meson_encoder_cvbs->connector)) {
+		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
+		return PTR_ERR(meson_encoder_cvbs->connector);
+	}
+	drm_connector_attach_encoder(meson_encoder_cvbs->connector,
+				     &meson_encoder_cvbs->encoder);
 
 	return 0;
 }
-- 
2.25.1

