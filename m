Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9844CC4C72
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 19:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EDE10E852;
	Tue, 16 Dec 2025 18:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PHTJXyol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CB410E852
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 18:00:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 876A4C1A582;
 Tue, 16 Dec 2025 18:00:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 042AD6071C;
 Tue, 16 Dec 2025 18:00:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54C0A119A97F1; Tue, 16 Dec 2025 19:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765908036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lUbaxiw2BnN1ox+Yu5GNCuxcygx9alGi1fjrWLi1OF4=;
 b=PHTJXyolQZp12tBjpY2uxdapMynKVx6jw+EgyCgB+lF9hYbgZ3ivqEIb+OLNqItIAE/so6
 36gecuUQJlMv3XaZnQPVCMVvIg0ZHTLrYDdE+m66ZifLMcHjxj9Pm0GfDKUlONqzHmC1yL
 07FLEzDja2dhvcFnCgFl7GD/vS96r0GB/EAvYbn/XNgPnUrZvo9P+knEVR5uftjClXB6q8
 xRhf/gee+/IMuA55jShwQtbF76AT1or4OKzn6Usqbc3VnzlZM1JClQtfL9M5HHH6vDLvI1
 P7XXzww2Fgj6pu2A6eczb/uGtCmHNxrpraxGWZczhmrB2GcqB1WQmvadAJfksA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:48 +0100
Subject: [PATCH v3 15/22] drm/bridge: imx8qxp-pxl2dpi:
 imx8qxp_pxl2dpi_find_next_bridge: return int, not ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
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

In preparation for using bridge->next_bridge, we need to ensure that it
will never contain anything but NULL or a valid bridge pointer. Current
code stores an ERR_PTR when imx8qxp_pxl2dpi_find_next_bridge() errors
out. Instead of fixing that after the facts in the caller, change the
function to internally set the next_pointer and just return an int error
value.

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 30 +++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index e03a411cb9db..2e66b003386e 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -255,33 +255,27 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 	return ep;
 }
 
-static struct drm_bridge *
-imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
+static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct drm_bridge *next_bridge;
-	int ret;
-
 	struct device_node *ep __free(device_node) =
 		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
-	if (IS_ERR(ep)) {
-		ret = PTR_ERR(ep);
-		return ERR_PTR(ret);
-	}
+	if (IS_ERR(ep))
+		return PTR_ERR(ep);
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	} else if (!of_device_is_available(remote->parent)) {
 		DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
-	next_bridge = of_drm_find_bridge(remote);
-	if (!next_bridge)
-		return ERR_PTR(-EPROBE_DEFER);
+	p2d->next_bridge = of_drm_find_bridge(remote);
+	if (!p2d->next_bridge)
+		return -EPROBE_DEFER;
 
-	return next_bridge;
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
@@ -414,9 +408,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge))
-		return PTR_ERR(p2d->next_bridge);
+	ret = imx8qxp_pxl2dpi_find_next_bridge(p2d);
+	if (ret)
+		return ret;
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)

-- 
2.52.0

