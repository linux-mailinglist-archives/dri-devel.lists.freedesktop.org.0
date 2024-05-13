Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9A8C443A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D6610E84A;
	Mon, 13 May 2024 15:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="f1Rtkm23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B3510E84B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:31:50 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715614309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sKe1OXm7dCFpe5iXrNPA4j8NtVh7Vk3MKA9L+jmF7U=;
 b=f1Rtkm23m84bvTk5isa5i8HFrv2NBLfD1VZ4DOeQF3C3SV6nePD4umUszD0aP2H6sc+3DY
 Q/fMSSzb5w5HkaDhhxdkoRQpHJn/lECZ+Z1fKEzaSe/215tKHgh7ArE5q9jHGfvFwUEvIB
 blWGtOJVwsv+ZKCIpAczRr7wxmzNHPI=
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 09/12] drm/bridge: synopsys: dw-mipi-dsi: Remove a
 redundant check on existence of bridge->encoder
Date: Mon, 13 May 2024 23:31:06 +0800
Message-ID: <20240513153109.46786-10-sui.jingfeng@linux.dev>
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

In the dw_mipi_dsi_bridge_attach() function, the check on the existence
of bridge->encoder is not necessary, as it has already been checked in
the drm_bridge_attach() function invocked by previous bridge or KMS driver.
The previous drm_bridge_attach() will quit with a negative error code
returned if it fails for some reasons, hence, it is guaranteed that the
.encoder member of the struct drm_bridge is not NULL when
dw_mipi_dsi_bridge_attach() function gets called.

Remove the redundant checking codes "if (!bridge->encoder) { ... }".

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 824fb3c65742..c4e9d96933dc 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1071,11 +1071,6 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found\n");
-		return -ENODEV;
-	}
-
 	/* Set the encoder type as caller does not know it */
 	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
-- 
2.43.0

