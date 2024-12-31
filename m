Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170159FF185
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 20:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907F310E185;
	Tue, 31 Dec 2024 19:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="SSSiv3ir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B092E10E189
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 19:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9802E104855B1; Tue, 31 Dec 2024 20:29:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735673388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MZEWmN4GN5G1sABY/mv4D6+HIYv/6uOJhfv6635kFT8=;
 b=SSSiv3irUUXzx7nqQ6tWRryfPL3RUPx2U1XYOP5k8dgpHW9tWjWQWbYGFWKoyBI/lVWaPT
 291ngQmHU1jh3qYi6pXY7hpznxcKYrW/ToN7VKNE2nGq+uS5/N2c537QG2zprE7qhSquMZ
 0WHaNs5fSUrertBEKOltLXIoP+Mm24e/5mdu10VcfREEck46vybCD6tB/ZVQcrfHOBaX5j
 Kf2qAbgWJk/wrg52rumZ819AUsFbUv9Sjp781z25UxkfAa9E7GAp1qGqR1HE83OQO9p3b3
 VVZKVBOCGLHoA3nWYIIC03N1swSdWXafVV3Glykw5lSnI9NcmhOYFpZP+A1CWQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output port
 is optional
Date: Tue, 31 Dec 2024 20:28:48 +0100
Message-ID: <20241231192925.97614-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a flag meant purely to work around broken i.MX8MP DTs which enable
HDMI but do not contain the HDMI connector node. This flag allows such
DTs to work by creating the connector in the HDMI bridge driver. Do not
use this flag, do not proliferate this flag, please fix your DTs.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V3: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++----
 include/drm/bridge/dw_hdmi.h              |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 996733ed2c004..852e73c0f686f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
-					 bridge, flags);
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		if (hdmi->plat_data->output_port_optional && !hdmi->next_bridge)
+			return dw_hdmi_connector_create(hdmi);
+		else
+			return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+						 bridge, flags);
+	}
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
 					  hdmi->plat_data->output_port,
 					  -1);
 	if (!remote)
-		return -ENODEV;
+		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;
 
 	hdmi->next_bridge = of_drm_find_bridge(remote);
 	of_node_put(remote);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a46baa0737cd..3bb6e633424a8 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
 	struct regmap *regm;
 
 	unsigned int output_port;
+	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
+	bool output_port_optional;
 
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
-- 
2.45.2

