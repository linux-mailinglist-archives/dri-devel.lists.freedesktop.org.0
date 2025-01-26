Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57208A1CE03
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 20:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FB410E202;
	Sun, 26 Jan 2025 19:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Y1WOWEDF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18C10E202
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 19:16:15 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1737918969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PItqxAwYwkayk7bfYlkSjBJzxHJLNqrKMo5mzEUqZVs=;
 b=Y1WOWEDFXO3F2VDC1ZlFdl2KuGIjt4NxFBS5EjIKaXdQp0WEIKRW2Ydx9MlyEuxl0VxgXl
 iB9ak5630cx35GUsiQ4pZLcuahH996PLsoAPiiWbbe6isMrloViWTHTKSd/VV5k7u4BU6J
 x1YWM1RAWHb/JRsL2hLpXjWO5aSO5UA=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Stable List <stable@vger.kernel.org>
Subject: [PATCH v8 01/13] drm/bridge: cdns-dsi: Fix connecting to next bridge
Date: Mon, 27 Jan 2025 00:45:39 +0530
Message-Id: <20250126191551.741957-2-aradhya.bhatia@linux.dev>
In-Reply-To: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

Fix the OF node pointer passed to the of_drm_find_bridge() call to find
the next bridge in the display chain.

The code to find the next panel (and create its panel-bridge) works
fine, but to find the next (non-panel) bridge does not.

To find the next bridge in the pipeline, we need to pass "np" - the OF
node pointer of the next entity in the devicetree chain. Passing
"of_node" to of_drm_find_bridge (which is what the code does currently)
will fetch the bridge for the cdns-dsi which is not what's required.

Fix that.

Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
Cc: Stable List <stable@vger.kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index c7a0247e06ad..2f897ea5e80a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -952,7 +952,7 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_DSI);
 	} else {
-		bridge = of_drm_find_bridge(dev->dev.of_node);
+		bridge = of_drm_find_bridge(np);
 		if (!bridge)
 			bridge = ERR_PTR(-EINVAL);
 	}
-- 
2.34.1

