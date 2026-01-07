Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C3CFD07D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7010E584;
	Wed,  7 Jan 2026 09:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DpVvpTUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C4A10E584
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:57:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7F1D44E41FD3;
 Wed,  7 Jan 2026 09:57:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5425D6072B;
 Wed,  7 Jan 2026 09:57:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA497103C870F; Wed,  7 Jan 2026 10:56:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767779820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=meGA74IEurNMdTL93yq5uF40iG29aU1P+OGqYX95yp0=;
 b=DpVvpTUMGI1H+WF4rLxhW4WmbWWWhZYaH2l8fi50mG7e6701lqvv+3FfoLslJT/KA5SKaE
 w2bNvavMNp4i/+arZ0LtgZHPZ/K16Zc8JdBc2W4a8IeLUgw+tIlcSzvWOknbfkpbFw2bCB
 TSCABfIooB/fVmgevekCa6uJWaZZqd/GcXZJx0ujsreDq/hP/8+vo4jiEXMux+B1IHhmqb
 zP+tB7C8QDvrHOs6qgjJGhd8wPzVMN/iPTpTCVoTisxLRHwdcMeNL5jl8QKlG0tULy4g/f
 0Q0SiWFCo5gNKUvWtATnzco92M4W0Xdr9Xh3kEeq98sWAq2VuCV59k0c55aJpg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 10:56:27 +0100
Subject: [PATCH v4 2/4] drm/bridge: imx8qxp-pixel-link: simplify freeing of
 the remote device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-2-a62b4399a6bf@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
of_node_put() in multiple places, complicating code flow. Simplify it by
using a cleanup action and making the 'remote' variable scope local to the
loop.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 4f84825fddca..0c5ed06eee1b 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -260,7 +260,7 @@ static struct drm_bridge *
 imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
-	struct device_node *port, *remote;
+	struct device_node *port;
 	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
@@ -286,7 +286,8 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 	}
 
 	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
-		remote = of_graph_get_remote_node(np, port_id, reg);
+		struct device_node *remote __free(device_node) =
+			of_graph_get_remote_node(np, port_id, reg);
 		if (!remote)
 			continue;
 
@@ -294,15 +295,12 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			DRM_DEV_DEBUG(pl->dev,
 				      "port%u endpoint%u remote parent is not available\n",
 				      port_id, reg);
-			of_node_put(remote);
 			continue;
 		}
 
 		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
-		if (!next_bridge) {
-			of_node_put(remote);
+		if (!next_bridge)
 			return ERR_PTR(-EPROBE_DEFER);
-		}
 
 		/*
 		 * Select the next bridge with companion PXL2DPI if
@@ -310,8 +308,6 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 */
 		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
 			selected_bridge = next_bridge;
-
-		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;

-- 
2.52.0

