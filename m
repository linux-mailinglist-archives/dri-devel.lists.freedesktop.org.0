Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFB8C3206
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 17:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5DD10E41E;
	Sat, 11 May 2024 15:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="KbRZWvpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A067C10E1E9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 15:08:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715440107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BrwfjmHQzRbVwVRIA4mdb2bxyIDiwh21dDndDJSDjI4=;
 b=KbRZWvpcq2OrkrvxekTl+Uh8I+6BKMZ1Ekcu1hlSayRkYu0rdB2Q1Xf5nKS+eU1mI/hbw0
 d2nb9H6HZf+Ij4W+t/apgT8Gj1889aDvLXsNJySANuA+5G3hzkCDlH1hyulxbmzkwBh5BM
 ro5xjYtalztTMVOMVjULykhw3L6jMO8=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/bridge: imx: Remove redundant checks on existence of
 bridge->encoder
Date: Sat, 11 May 2024 23:08:16 +0800
Message-ID: <20240511150816.326846-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The check on the existence of bridge->encoder on the implementation layer
of drm bridge driver is not necessary, as it has already been done in the
drm_bridge_attach() function. It is guaranteed that the .encoder member
of the drm_bridge instance is not NULL when various imx_xxx_bridge_attach()
function gets called.

Remove the redundant checking codes "if (!bridge->encoder) { ... }".

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c         | 5 -----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 5 -----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 5 -----
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 5 -----
 4 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 6967325cd8ee..9b5bebbe357d 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -116,11 +116,6 @@ int ldb_bridge_attach_helper(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
-		return -ENODEV;
-	}
-
 	return drm_bridge_attach(bridge->encoder,
 				ldb_ch->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index d0868a6ac6c9..e6dbbdc87ce2 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -119,11 +119,6 @@ static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_DEV_ERROR(pc->dev, "missing encoder\n");
-		return -ENODEV;
-	}
-
 	return drm_bridge_attach(bridge->encoder,
 				 ch->next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index ed8b7a4e0e11..1d11cc1df43c 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -138,11 +138,6 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
-		return -ENODEV;
-	}
-
 	return drm_bridge_attach(bridge->encoder,
 				 pl->next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 4a886cb808ca..fb7cf4369bb8 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -58,11 +58,6 @@ static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_DEV_ERROR(p2d->dev, "missing encoder\n");
-		return -ENODEV;
-	}
-
 	return drm_bridge_attach(bridge->encoder,
 				 p2d->next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-- 
2.43.0

