Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB8D0794E
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 08:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB96810E802;
	Fri,  9 Jan 2026 07:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T3zepkq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74510E802
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 07:32:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EA0C74E4201B;
 Fri,  9 Jan 2026 07:32:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8A6F60734;
 Fri,  9 Jan 2026 07:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B3AB103C881F; Fri,  9 Jan 2026 08:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767943947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0r3rD4W5ezQ0xu0xO1qKH5iyRy5OL3+U0stR4Z3O8ig=;
 b=T3zepkq5Q3grgigK4K0Sj9+UHJaN6C38rikLE0qRHsqh0jPLlAiUxN3wII9sFO8ZY0NeEt
 Up4k/h0NdXHy2Y3LgY3myRMF/TSOmw+zadFHqWuHRgeVJQyjUAtmnoEj5g2YHQ4uJFjT0+
 h4Mj8cOiuhr6yRC/jTg3yvmXVVx95g6REKcZ2Syw2eNOv2v50oZoVewM+vxFq8lMRs9B7I
 CqbTcCEGuhdNsDuVKA6iVWYSnS2/WNatw99qcK6DJpqdVl2TlMpVkDVQbDUagWhgnctjPR
 qvMtyIL3l+mrIqzXa+SWj4UUDKg7vTV0sWOa2Qa+czBxdX7OSdRDIOoopBv+2A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:42 +0100
Subject: [PATCH v2 11/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: don't use the bridge pointer as an error
 indicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-11-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
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

In preparation to handle refcounting of the out_bridge, we need to ensure
the out_bridge pointer contains either a valid bridge pointer or NULL, not
an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
redeference an ERR_PTR.

Stop using IS_ERR(next_bridge) as an indication of an error, and instead
use the 'ret' integer.

No functional change.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8dd058124e93..afaa63c4d3f7 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1891,7 +1891,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
 	struct drm_panel *panel;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Devices can also be child nodes when we also control that device
@@ -1926,16 +1926,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		next_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(next_bridge))
+			ret = PTR_ERR(next_bridge);
 	} else {
 		next_bridge = of_drm_find_bridge(remote);
 		if (!next_bridge)
-			next_bridge = ERR_PTR(-EINVAL);
+			ret = -EINVAL;
 	}
 
 	of_node_put(remote);
 
-	if (IS_ERR(next_bridge)) {
-		ret = PTR_ERR(next_bridge);
+	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
 		return ret;
 	}

-- 
2.52.0

