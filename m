Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5CCFDDDB
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33210E5BF;
	Wed,  7 Jan 2026 13:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pPm8csoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE53310E5C0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:13:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9C5CD1A26D8;
 Wed,  7 Jan 2026 13:13:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6EA5B606F8;
 Wed,  7 Jan 2026 13:13:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4BC18103C8744; Wed,  7 Jan 2026 14:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767791627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AofJV46GCcIycup8AyvdwScpLkblbZyy7dzUs70zbeM=;
 b=pPm8csoJHFOtCpXH2s+CTdsiSGlOr6aFzuCyOraotIbgXUOF67e30ioJY4KQ30d/H6x7gc
 G6WKbMrwHr2QbJzFOtDlld557GcNqd0KKD+Sni+DQ5Id3tTWL+1MUxKcJylQ3rW9WctVZu
 /2SdyuZcUpXPHO7GK2Mx6K59cv9frqTGZYRo6Q5xDYqjDjibdL4gMRCxcyjIAXKSlBOgA9
 6m45RVyHag4wNIpNkZUzPjXxrTXPMzr28GWso7PMYzjK7g8fU9YXeMnwZBON2kvOmyixOO
 ff7hgGnjSfA8/dLgG9b7VEs94HlAHXGbGvNLqCQrKDmnmF0wJQJ3WVQCU+1RIA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:56 +0100
Subject: [PATCH 05/12] drm/bridge: tfp410: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-5-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b80ee089f880..11b5bb50e9f4 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -30,7 +30,6 @@ struct tfp410 {
 	struct gpio_desc	*powerdown;
 
 	struct drm_bridge_timings timings;
-	struct drm_bridge	*next_bridge;
 
 	struct device *dev;
 };
@@ -53,8 +52,8 @@ static int tfp410_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
-		drm_edid = drm_bridge_edid_read(dvi->next_bridge, connector);
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID) {
+		drm_edid = drm_bridge_edid_read(dvi->bridge.next_bridge, connector);
 		if (!drm_edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 	} else {
@@ -89,7 +88,7 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 
-	return drm_bridge_detect(dvi->next_bridge, connector);
+	return drm_bridge_detect(dvi->bridge.next_bridge, connector);
 }
 
 static const struct drm_connector_funcs tfp410_con_funcs = {
@@ -126,7 +125,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, dvi->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, dvi->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
@@ -134,14 +133,14 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
 		dvi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	else
 		dvi->connector.polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
 		INIT_DELAYED_WORK(&dvi->hpd_work, tfp410_hpd_work_func);
-		drm_bridge_hpd_enable(dvi->next_bridge, tfp410_hpd_callback,
+		drm_bridge_hpd_enable(dvi->bridge.next_bridge, tfp410_hpd_callback,
 				      dvi);
 	}
 
@@ -149,8 +148,8 @@ static int tfp410_attach(struct drm_bridge *bridge,
 				 &tfp410_con_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
 					  &tfp410_con_funcs,
-					  dvi->next_bridge->type,
-					  dvi->next_bridge->ddc);
+					  dvi->bridge.next_bridge->type,
+					  dvi->bridge.next_bridge->ddc);
 	if (ret) {
 		dev_err(dvi->dev, "drm_connector_init_with_ddc() failed: %d\n",
 			ret);
@@ -169,8 +168,8 @@ static void tfp410_detach(struct drm_bridge *bridge)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 
-	if (dvi->connector.dev && dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_disable(dvi->next_bridge);
+	if (dvi->connector.dev && dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_disable(dvi->bridge.next_bridge);
 		cancel_delayed_work_sync(&dvi->hpd_work);
 	}
 }
@@ -362,10 +361,10 @@ static int tfp410_init(struct device *dev, bool i2c)
 	if (!node)
 		return -ENODEV;
 
-	dvi->next_bridge = of_drm_find_bridge(node);
+	dvi->bridge.next_bridge = of_drm_find_and_get_bridge(node);
 	of_node_put(node);
 
-	if (!dvi->next_bridge)
+	if (!dvi->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	/* Get the powerdown GPIO. */

-- 
2.52.0

