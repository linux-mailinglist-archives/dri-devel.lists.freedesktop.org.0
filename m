Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D150A2B029
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508FB10E903;
	Thu,  6 Feb 2025 18:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="alWZYw5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD50C10E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:15:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40FB8442D4;
 Thu,  6 Feb 2025 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHGKRRwUFJ1hKE8GkVs2Ez/vUs0X0HmXOnbYhe5x4PU=;
 b=alWZYw5+dkL1Byea1MLItdJnR6sEkiLtF/qRlFzH1fH1o4wc/B4cVix0giMXpxuxotAKXa
 NUxXCTo2oIqOHWXSlduliLid5Crv24bFILYvn1IbnSK27Whtmcb/TBmea6vTn7FN2YQYXE
 mJra3HiBro5kWZ8s/BtEmjYo0TNah5iAwh/NBNB2dDz/+lIc2p+veWwuQ3AwsXn361k+oo
 yooIP1PA4lKDQRWoZF797UY8kLWybJI8TgpEQ1QVjmtKuxqkpQ7jk7QOrPlhyRwiXFN6pc
 pcJD+hz+3tEYSBdhayBdlJKDSXWdzIRwxeLILbi0VeHKoHLZzVp8olo3WUcW2Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:26 +0100
Subject: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
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
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

In order to support panels described either via graph links or via a
subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
to find the next bridge. The resulting logic is complex and duplicates code
already present in the DRM bridge core. Switch to the new APIs in DRM
bridge core that allow to do the same in a much cleaner way.

Note there are two slight changes in the new logic intended to improve the
final result:

 * the old code looks for a subnode with any name except "port" or "ports",
   while the new code uses the node passed as a parameter

 * the old code looks for a subnode first and falls back to a graph link,
   while the new code uses the reverse order because graph links are the
   recommended device tree representation now

The first change makes the code more robust by avoiding the risk of using
an unrelated node which is not describing a panel and not names "port" or
"ports".

The second change is not expected to expose regressions because, in the
cases where both a subnode and a graph link are used to describe a panel,
the graph link should point to the subnode itself, such as in
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts

As a further cleanup, use a temporary variable to assign dsi->out_bridge
only on success. This avoids the risk of leaving a non-NULL value in
dsi->out_bridge when samsung_dsim_host_attach() fails.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
 1 file changed, 9 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *remote;
-	struct drm_panel *panel;
+	struct drm_bridge *out_bridge;
 	int ret;
 
-	/*
-	 * Devices can also be child nodes when we also control that device
-	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
-	 *
-	 * Lookup for a child node of the given parent that isn't either port
-	 * or ports.
-	 */
-	for_each_available_child_of_node(np, remote) {
-		if (of_node_name_eq(remote, "port") ||
-		    of_node_name_eq(remote, "ports"))
-			continue;
+	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)
+		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
 
-		goto of_find_panel_or_bridge;
-	}
-
-	/*
-	 * of_graph_get_remote_node() produces a noisy error message if port
-	 * node isn't found and the absence of the port is a legit case here,
-	 * so at first we silently check whether graph presents in the
-	 * device-tree node.
-	 */
-	if (!of_graph_is_present(np))
-		return -ENODEV;
-
-	remote = of_graph_get_remote_node(np, 1, 0);
-
-of_find_panel_or_bridge:
-	if (!remote)
-		return -ENODEV;
-
-	panel = of_drm_find_panel(remote);
-	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
-	} else {
-		dsi->out_bridge = of_drm_find_bridge(remote);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
-	}
-
-	of_node_put(remote);
-
-	if (IS_ERR(dsi->out_bridge)) {
-		ret = PTR_ERR(dsi->out_bridge);
-		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
-		return ret;
+	if (IS_ERR(out_bridge)) {
+		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
+		return PTR_ERR(out_bridge);
 	}
 
 	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
@@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
+	dsi->out_bridge = out_bridge;
+
 	return 0;
 }
 

-- 
2.34.1

