Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84729FEEE2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5A10E64D;
	Tue, 31 Dec 2024 10:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ic7Dg541";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7301910E64D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:40:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05672FF809;
 Tue, 31 Dec 2024 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735641636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTffFfD4VzEYR9vlW/p4V75r3lQ1DwU0EdWChMuyjI8=;
 b=Ic7Dg541QDABb3D67WnsoIwb/53TK87QIFofk4LJvHP7u0eswpPhbtyTAdLVya4AWYhIRT
 3s3SmSHe8eUaKHXxSP1TmIOWFJUm6T344mJNc1HJJGt7IG3bKAQiX37zRHxJpwv4ZhdQeT
 L4UXcApiAdkyRbZ0ic8WWZnQNVRYc1a7PyewO/SLRRBSi00Ld6ENhuDNZpjuJXTKfjbBTp
 S7O3DsTqoiOk/HbzqkuzYrnoZDQnL39cdVCL46Lj6SqngI/BhQm9Qu3FOnL4XtRtm0+YD2
 a+7XV7/Kv28nMA0Z9WxdahVam2ODNOK8jufop+IKcfJG5FJ1Mf9dS/pS/hRCoQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:40:02 +0100
Subject: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting variable
 for out_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
In-Reply-To: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Instead of using dsi->out_bridge during the bridge search process, use a
temporary variable and assign dsi->out_bridge only on successful
completion.

The main goal is to be able to drm_bridge_get() the out_bridge before
setting it in dsi->out_bridge, which is done in a later commit. Setting
dsi->out_bridge as in current code would leave a use-after-free window in
case the bridge is deallocated by some other thread between
'dsi->out_bridge = devm_drm_panel_bridge_add()' and drm_bridge_get().

This change additionally avoids leaving an ERR_PTR value in dsi->out_bridge
on failure. This is not necessarily a problem but it is not clean.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efde523dfc0863be044c05a826 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
+	struct drm_bridge *out_bridge;
 	struct drm_panel *panel;
 	int ret;
 
@@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
+		out_bridge = devm_drm_panel_bridge_add(dev, panel);
 	} else {
-		dsi->out_bridge = of_drm_find_bridge(remote);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
+		out_bridge = of_drm_find_bridge(remote);
+		if (!out_bridge)
+			out_bridge = ERR_PTR(-EINVAL);
 	}
 
 	of_node_put(remote);
 
-	if (IS_ERR(dsi->out_bridge)) {
-		ret = PTR_ERR(dsi->out_bridge);
+	if (IS_ERR(out_bridge)) {
+		ret = PTR_ERR(out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
 		return ret;
 	}
 
+	dsi->out_bridge = out_bridge;
+
 	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
 		     device->name, device->lanes,
 		     mipi_dsi_pixel_format_to_bpp(device->format),

-- 
2.34.1

