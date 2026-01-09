Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E71D0794B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 08:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825AF10E800;
	Fri,  9 Jan 2026 07:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R9lGI9yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CE010E801
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 07:32:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A0EC54E4201A;
 Fri,  9 Jan 2026 07:32:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 755ED60734;
 Fri,  9 Jan 2026 07:32:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C88A103C87E8; Fri,  9 Jan 2026 08:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767943943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=u2y2VqIJAA06H1k3L5bHNZmoiLt8l/HcFcKFwhue0ts=;
 b=R9lGI9yuKuRCVLqejCsbPo6uvVI4QMrNJR7s37pp2V9gRBFkHEVlU9BAS9VH1mH80ED1lq
 CO6/jZ8H6sDZRdxvw0SbYVQ5UfUt0RyCZP0zm9eF58tziBhxZ0HhPu/60A9xdlG5g0YuHE
 MkTfeIERWYHfWDA/rEkBg2h/k+IeO+dHREaoQdRK5hBNZ6VStXYZyYL1MSblClJS8l6ZmX
 arWj+84HshE3IJzyHLeOK+7R7aY0/upR/wMKxuJNPGvQuF9h89AS5xsMJ90y3GK9rpvgny
 bextH8LFCOa8lt0bQCa6xjk76zVCSB1jvVUIDYhw3esXwqhixu0LsfRxrw471Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:41 +0100
Subject: [PATCH v2 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-10-8bad3ef90b9f@bootlin.com>
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

As a preliminary cleanup, add a temporary local 'next_bridge' pointer and
only copy it in dsi->out_bridge as late as possible, i.e. just before
calling pdata->host_ops->attach() which uses it (only in the exynos
driver).

Not strictly needed, but for symmetry move the clearing of dsi->out_bridge
in samsung_dsim_host_detach() to after pdata->host_ops->detach().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- fix "pointer set too late" bug (NULL pointer deref in the exynos case)
- *not* add Acked-by: Maxime as the patch has changed
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eabc4c32f6ab..8dd058124e93 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1886,6 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 {
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
+	struct drm_bridge *next_bridge;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
@@ -1924,17 +1925,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
+		next_bridge = devm_drm_panel_bridge_add(dev, panel);
 	} else {
-		dsi->out_bridge = of_drm_find_bridge(remote);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
+		next_bridge = of_drm_find_bridge(remote);
+		if (!next_bridge)
+			next_bridge = ERR_PTR(-EINVAL);
 	}
 
 	of_node_put(remote);
 
-	if (IS_ERR(dsi->out_bridge)) {
-		ret = PTR_ERR(dsi->out_bridge);
+	if (IS_ERR(next_bridge)) {
+		ret = PTR_ERR(next_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
 		return ret;
 	}
@@ -1958,10 +1959,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
+	// The next bridge can be used by host_ops->attach
+	dsi->out_bridge = next_bridge;
+
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(dsi, device);
 		if (ret)
-			return ret;
+			goto err_release_next_bridge;
 	}
 
 	dsi->lanes = device->lanes;
@@ -1969,6 +1973,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	return 0;
+
+err_release_next_bridge:
+	dsi->out_bridge = NULL;
+	return ret;
 }
 
 static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
@@ -1985,11 +1993,11 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 
-	dsi->out_bridge = NULL;
-
 	if (pdata->host_ops && pdata->host_ops->detach)
 		pdata->host_ops->detach(dsi, device);
 
+	dsi->out_bridge = NULL;
+
 	samsung_dsim_unregister_te_irq(dsi);
 
 	drm_bridge_remove(&dsi->bridge);

-- 
2.52.0

