Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE568CC4C54
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 19:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45110E861;
	Tue, 16 Dec 2025 18:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NiFXJ3Lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F3E10E857
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 18:00:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7D0AD1A2214;
 Tue, 16 Dec 2025 18:00:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E54D6071C;
 Tue, 16 Dec 2025 18:00:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F02F119A97F2; Tue, 16 Dec 2025 18:59:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765908000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=onXsky4iYh8qdHLUFksOwNzxyXs/762w685miz/sGuY=;
 b=NiFXJ3LvVlVlbQaR1ydTw0y0QHcb5WH2n9zoyKRRhiY/o+/5yadBMruygMhNKX3cG8sS74
 qTQ9/vcQQ5iMSyhfcWoDxsd8Xd0YdXbWNx1FWQASh92BtxgRf97wau3Y0mq929Q14jtWH+
 VP+bI09BKzTrUbHTzC7MliSvGoYESQZuDz1YA/BKz0dY9JImbFFqPb+E5nrCEVFefscvxP
 N/UP3FEi3RqXvFJI2VOysnqQ6Q7yygBN3d+mQr0f0j6FRs/CsZ2/b3PYZcx4VCZWT5/0ax
 owZh2mNsjtwvgrmV4KGkH6ZTeBqLf8/eax+bN2nPySdFW/0exZRg5jZ4KVM5cQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:42 +0100
Subject: [PATCH v3 09/22] drm/bridge: simple-bridge: get/put the next
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-9-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 2cd1847ba776..873b32cfb508 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -31,7 +31,6 @@ struct simple_bridge {
 
 	const struct simple_bridge_info *info;
 
-	struct drm_bridge	*next_bridge;
 	struct regulator	*vdd;
 	struct gpio_desc	*enable;
 };
@@ -54,8 +53,8 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	if (sbridge->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
-		drm_edid = drm_bridge_edid_read(sbridge->next_bridge, connector);
+	if (sbridge->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID) {
+		drm_edid = drm_bridge_edid_read(sbridge->bridge.next_bridge, connector);
 		if (!drm_edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 	} else {
@@ -90,7 +89,7 @@ simple_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
 
-	return drm_bridge_detect(sbridge->next_bridge, connector);
+	return drm_bridge_detect(sbridge->bridge.next_bridge, connector);
 }
 
 static const struct drm_connector_funcs simple_bridge_con_funcs = {
@@ -109,7 +108,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, sbridge->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, sbridge->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
@@ -122,7 +121,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
 					  &simple_bridge_con_funcs,
 					  sbridge->info->connector_type,
-					  sbridge->next_bridge->ddc);
+					  sbridge->bridge.next_bridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -180,10 +179,10 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	if (!remote)
 		return -EINVAL;
 
-	sbridge->next_bridge = of_drm_find_bridge(remote);
+	sbridge->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
 
-	if (!sbridge->next_bridge) {
+	if (!sbridge->bridge.next_bridge) {
 		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
 		return -EPROBE_DEFER;
 	}

-- 
2.52.0

