Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D635BC6EBA8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339EB10E5DC;
	Wed, 19 Nov 2025 13:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OlX/PF+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C2110E5DC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:09:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5E7214E4179C;
 Wed, 19 Nov 2025 13:09:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F04860699;
 Wed, 19 Nov 2025 13:09:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2F8810371A53; Wed, 19 Nov 2025 14:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763557790; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=axXT5p39UcLgfeXlnv3r+PQb3eCsVz2C9lrKQC2f4Uk=;
 b=OlX/PF+dhNGJG27mrsK1i4MNguYEVaaiKq83NP0yOr041d9TgIxWfbA2GyldpQEAfPLd3J
 wNbvXQz9oBqELh/fqHBdK3mPbEJ3JKZLLabdZdqhqGE7GiQMZKWviSVNIdzuN1DuSJ9D6O
 ji63oyId+HMuMeLvrrbb9/FhGf8/Vn2JH5T3bED5Ab473KCMMc1GmDK6PMlKKy03bJn35W
 CR9esGIgCRwjBUdDQ8G/Q3ByDThJhNj95m+NHds8C3IrJVQlptjCCcIy0X+k2qNcCYxnYs
 7W0XT05zHAApmNT3EVv8sRDwLVGvyuBhAK9DAMINTmHuHkuNsVeo/QElxQso7A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:57 +0100
Subject: [PATCH 26/26] drm/bridge: imx8qxp-pixel-link: convert to
 drm_of_find_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-26-0db98a7fe474@bootlin.com>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
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
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
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
drm_of_find_bridge() which gets a bridge reference, and put it when done.

This needs to be handled in various steps:

 * the bridge returned drm_of_find_bridge() is stored in next_bridge whose
   scope is the for loop, so a cleanup action is enough
 * the value of next_bridge is copied into selected_bridge, potentially
   more than once, so a cleanup action at function scope is useful here too
 * however on successful return selected_bridge must be returned and
   ultimately stored, so it should not be put in that case: use
   return_ptr() to defuse the cleanup action on successful return
 * finally, put the bridge reference on device remove

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 2ecc3c1051e5..9818239cf6e7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -256,12 +256,13 @@ static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl
 	return imx8qxp_pixel_link_disable_sync(pl);
 }
 
+/* The returned bridge has its refcount incremented */
 static struct drm_bridge *
 imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
-	struct drm_bridge *selected_bridge = NULL;
+	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
 	u32 port_id;
 	bool found_port = false;
 	int reg;
@@ -298,7 +299,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		struct drm_bridge *next_bridge __free(drm_bridge_put) = drm_of_find_bridge(remote);
 		if (!next_bridge)
 			return ERR_PTR(-EPROBE_DEFER);
 
@@ -306,13 +307,15 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 * Select the next bridge with companion PXL2DPI if
 		 * present, otherwise default to the first bridge
 		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			drm_bridge_put(selected_bridge);
+			selected_bridge = drm_bridge_get(next_bridge);
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
 
-	return selected_bridge;
+	return_ptr(selected_bridge);
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
@@ -392,6 +395,7 @@ static void imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
 	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&pl->bridge);
+	drm_bridge_put(pl->next_bridge);
 }
 
 static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {

-- 
2.51.1

