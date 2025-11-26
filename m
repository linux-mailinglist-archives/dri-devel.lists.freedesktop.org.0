Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0103EC8B3CB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2640010E6CB;
	Wed, 26 Nov 2025 17:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2YeZMSCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE80C10E6D2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:37:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D95C74E418F9;
 Wed, 26 Nov 2025 17:37:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AEF4160721;
 Wed, 26 Nov 2025 17:37:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9CE7102F2343; Wed, 26 Nov 2025 18:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JrLE9DmCjwAQqwwhBvUzVJpeX/Pzl72dCfyYD6sC8EI=;
 b=2YeZMSCgMwBWWUoWmwUsnddccIlZPdNRnXbD+fBO0z4eH0oKcbHeuZKvMRV57OTRQ8q6yN
 um6hIkgAqpDMLksoRrHmLELlH7WZtzQMh0BsS0ntp+i8vvVy+687HWspi0ao3O2rQlgwbN
 nCCoDmZN47017skWXOoQZP7AfFYwrDHYbhR/Nypk2IZP1p909XgEmiJOQoyHLA6pAmqAKp
 sMB9P4Auh7GOUt0Kj3PICirjK001dxmTBWAVe84mbyXoIHkzzhEm9bFUE3b+u+xGxCYWGY
 mHmLJyG3suvje5hCVEdUBdTB+Fbdyg4Yz6afAZZH0onrLZw/mHx10DQ2sPdsJQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:36:02 +0100
Subject: [PATCH 20/21] drm/bridge: tda998x: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-20-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

Add support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to allow display
controller drivers to create their own connectors. This modernizes the
driver to work with the current DRM bridge framework.

The implementation includes:
- Refactoring detection and EDID reading into bridge-usable helpers
- Adding bridge operations: edid_read, detect, hpd_enable, hpd_disable
- Setting appropriate bridge ops (DRM_BRIDGE_OP_EDID, DRM_BRIDGE_OP_DETECT,
  DRM_BRIDGE_OP_HPD) and connector type (HDMIA)
- Skipping connector creation when DRM_BRIDGE_ATTACH_NO_CONNECTOR is set
- Handling conditional connector cleanup in bridge_detach

The driver maintains backward compatibility by continuing to create its
own connector when the flag is not set.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 96 +++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 43ace6ee2ca35..4d78615634691 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -1193,16 +1193,22 @@ static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 
 /* DRM connector functions */
 
-static enum drm_connector_status
-tda998x_connector_detect(struct drm_connector *connector, bool force)
+static enum drm_connector_status tda998x_conn_detect(struct tda998x_priv *priv)
 {
-	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 	u8 val = cec_read(priv, REG_CEC_RXSHPDLEV);
 
 	return (val & CEC_RXSHPDLEV_HPD) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
+static enum drm_connector_status
+tda998x_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
+
+	return tda998x_conn_detect(priv);
+}
+
 static const struct drm_connector_funcs tda998x_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -1276,11 +1282,10 @@ static int read_edid_block(void *data, u8 *buf, unsigned int blk, size_t length)
 	return ret;
 }
 
-static int tda998x_connector_get_modes(struct drm_connector *connector)
+static const struct drm_edid *tda998x_edid_read(struct tda998x_priv *priv,
+						struct drm_connector *connector)
 {
-	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 	const struct drm_edid *drm_edid;
-	int n;
 
 	/*
 	 * If we get killed while waiting for the HPD timeout, return
@@ -1298,6 +1303,16 @@ static int tda998x_connector_get_modes(struct drm_connector *connector)
 	if (priv->rev == TDA19988)
 		reg_set(priv, REG_TX4, TX4_PD_RAM);
 
+	return drm_edid;
+}
+
+static int tda998x_connector_get_modes(struct drm_connector *connector)
+{
+	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
+	const struct drm_edid *drm_edid;
+	int n;
+
+	drm_edid = tda998x_edid_read(priv, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	cec_notifier_set_phys_addr(priv->cec_notify,
 				   connector->display_info.source_physical_address);
@@ -1365,10 +1380,8 @@ static int tda998x_bridge_attach(struct drm_bridge *bridge,
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	return tda998x_connector_init(priv, bridge->dev);
 }
@@ -1377,7 +1390,8 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
-	drm_connector_cleanup(&priv->connector);
+	if (priv->connector.dev)
+		drm_connector_cleanup(&priv->connector);
 }
 
 static enum drm_mode_status tda998x_bridge_mode_valid(struct drm_bridge *bridge,
@@ -1677,6 +1691,59 @@ static void tda998x_bridge_mode_set(struct drm_bridge *bridge,
 	mutex_unlock(&priv->audio_mutex);
 }
 
+static const struct drm_edid *
+tda998x_bridge_edid_read(struct drm_bridge *bridge,
+			 struct drm_connector *connector)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
+
+	drm_edid = tda998x_edid_read(priv, connector);
+	if (!drm_edid) {
+		dev_dbg(&priv->hdmi->dev, "failed to get edid\n");
+		return NULL;
+	}
+
+	/*
+	 * FIXME: This should use connector->display_info.has_audio from
+	 * a path that has read the EDID and called
+	 * drm_edid_connector_update().
+	 */
+	edid = drm_edid_raw(drm_edid);
+
+	dev_dbg(&priv->hdmi->dev, "got edid: width[%d] x height[%d]\n",
+		edid->width_cm, edid->height_cm);
+
+	priv->sink_has_audio = drm_detect_monitor_audio(edid);
+	cec_notifier_set_phys_addr_from_edid(priv->cec_notify, edid);
+
+	return drm_edid;
+}
+
+static enum drm_connector_status
+tda998x_bridge_detect(struct drm_bridge *bridge,
+		      struct drm_connector *connector)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+
+	return tda998x_conn_detect(priv);
+}
+
+static void tda998x_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+
+	cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
+}
+
+static void tda998x_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+
+	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
+}
+
 static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.attach = tda998x_bridge_attach,
 	.detach = tda998x_bridge_detach,
@@ -1684,6 +1751,10 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.disable = tda998x_bridge_disable,
 	.mode_set = tda998x_bridge_mode_set,
 	.enable = tda998x_bridge_enable,
+	.edid_read = tda998x_bridge_edid_read,
+	.detect = tda998x_bridge_detect,
+	.hpd_enable = tda998x_bridge_hpd_enable,
+	.hpd_disable = tda998x_bridge_hpd_disable,
 };
 
 /* I2C driver functions */
@@ -1872,6 +1943,7 @@ tda998x_probe(struct i2c_client *client)
 
 		/* enable HPD irq */
 		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
+		priv->bridge.ops = DRM_BRIDGE_OP_HPD;
 	}
 
 	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
@@ -1932,6 +2004,8 @@ tda998x_probe(struct i2c_client *client)
 	priv->bridge.of_node = dev->of_node;
 #endif
 
+	priv->bridge.ops |= DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	priv->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	drm_bridge_add(&priv->bridge);
 
 	return 0;

-- 
2.43.0

