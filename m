Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A788C443D
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C1910E851;
	Mon, 13 May 2024 15:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rOpSbqL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6EB10E84B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:31:57 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715614315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJD65cDkBGq+4KCHhX+gz6i6UVlK6CB2GRuKzloyONE=;
 b=rOpSbqL4dMh9y8dqICIcFR6YBE2NzkpmEIsI0+MoDxOUpT74bJID04JhgbWWs+NgYL6zaO
 RU3hOwZmp6gmy9bO1yitBWm+gRJ4Hg8fX7/ltRZD1OiCsevJcoAKX3pKahTvb4jOXE5qjD
 ZbxzSw93+CXlVuCt9yCJlLC4J6Rg4j4=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 11/12] drm/bridge: imx: Remove redundant checks on
 existence of bridge->encoder
Date: Mon, 13 May 2024 23:31:08 +0800
Message-ID: <20240513153109.46786-12-sui.jingfeng@linux.dev>
In-Reply-To: <20240513153109.46786-1-sui.jingfeng@linux.dev>
References: <20240513153109.46786-1-sui.jingfeng@linux.dev>
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

The checks on the existence of bridge->encoder in the implementation of
drm_bridge_funcs::attach() is not necessary, as it has already been checked
in the drm_bridge_attach() function call by previous bridge or KMS driver.
The drm_bridge_attach() will quit with a negative error code returned if
it fails for some reasons, hence, it is guaranteed that the .encoder member
of the drm_bridge instance is not NULL when various i.MX specific bridge
attach functions are called.

Remove the redundant checking codes "if (!bridge->encoder) { ... }".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

