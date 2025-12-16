Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA56CC4C7B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 19:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2B710E851;
	Tue, 16 Dec 2025 18:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yR5sfELE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDEF10E851
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 18:00:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4C24F1A2254;
 Tue, 16 Dec 2025 18:00:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 10E286071C;
 Tue, 16 Dec 2025 18:00:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FECC119A97F1; Tue, 16 Dec 2025 19:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765908044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E3venDDom+DGFVL2bgaoBeY8hl48k7Az+c/QW6Kq99o=;
 b=yR5sfELEKiDsl6homJx8wSE/k1REIQEFf5NXXHzizUBK3BAAa2Y0fcoFe6RQ7WxKJSXkDg
 0Cy/3b46ZAqF6OmFmbHfe4CGoK7+ni1KnwlWwKmer5zc15o5unWt58yBwkhmgDyRVwxMMf
 F+Tp/d/qlCVqWAwJqziid9YCm+rVJh07PMgZzGgJmFh0CnEGbc4Brp8POrKw6ZKuKH7XDT
 gcYMAWBTcCtA7ZJFa1lgkMyOf2VI19Bv/w1bQHAf2jQqieWKxr6WNV4LPkd+xU6Zz4tPY9
 zTb2K5wpbZ6He0CLEhK5/IXHbpoJhn3O4wTzbHurzwg+Xmz/1jyARlwuLNQTdQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:50 +0100
Subject: [PATCH v3 17/22] drm/bridge: imx8qxp-pxl2dpi: get/put the
 companion bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-17-b5165fab8058@bootlin.com>
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use the destroy hook to put the reference on deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 556aec3b3734..2c40ca86e319 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -63,6 +63,13 @@ static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
+static void imx8qxp_pxl2dpi_bridge_destroy(struct drm_bridge *bridge)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+
+	drm_bridge_put(p2d->companion);
+}
+
 static int
 imx8qxp_pxl2dpi_bridge_atomic_check(struct drm_bridge *bridge,
 				    struct drm_bridge_state *bridge_state,
@@ -205,6 +212,7 @@ static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.attach			= imx8qxp_pxl2dpi_bridge_attach,
+	.destroy		= imx8qxp_pxl2dpi_bridge_destroy,
 	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
 	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,
@@ -333,7 +341,7 @@ static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
 		goto out;
 	}
 
-	p2d->companion = of_drm_find_bridge(companion);
+	p2d->companion = of_drm_find_and_get_bridge(companion);
 	if (!p2d->companion) {
 		ret = -EPROBE_DEFER;
 		DRM_DEV_DEBUG_DRIVER(p2d->dev,

-- 
2.52.0

