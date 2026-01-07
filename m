Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1CCFDDF6
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06AA10E5C6;
	Wed,  7 Jan 2026 13:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VPL/1gSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ECA10E5C6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:14:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5B2754E41FDE;
 Wed,  7 Jan 2026 13:14:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2DFA7606F8;
 Wed,  7 Jan 2026 13:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40055103C821A; Wed,  7 Jan 2026 14:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767791658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=z8r3jhEkERM/j9025rqzIp7DIcuzLrYHrvr0V9IN768=;
 b=VPL/1gShHDsKx9jMEWgIqLrVVM7kCFpCsvxC4qNSIJb3iL6T3s56oIpAjStpykLoAUSHAS
 d7vvs+y0WliMB/fzjw+qOpFrV+zPFwUHp3YLtBXTfZ9Uts98xj6KWgMb7I8xU9Simjifig
 OIIx3UrO38SoY3MESGgwWiPhD5K9Ez9db6UGwyiVa80VMW0G4k9zN4SzdeEcZi6OROnUM7
 434KVNJYaz8Ib/K303k1qdCQlKQ+YpXc54zgN5s2V/jDr1s5rp8tf2sGOWIso0oesLN2qo
 wb1ZtWfQKj3Iy2amidNZTo2v9ndsRzBt3FV80e+FsBD3rbXJMV7IRHP1E8eadw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:13:03 +0100
Subject: [PATCH 12/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach:
 convert to of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-12-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done. Also switch to the drm_bridge::next_bridge pointer.

This needs to handle both cases: when of_drm_find_panel() succeeds and when
it fails.

In the 'else' case (i.e. when of_drm_find_panel() fails), just switch to
of_drm_find_and_get_bridge() to ensure the bridge is not freed while in use
in the function tail, when it is stored in dsi->bridge.next_bridge.

In the 'then' case (i.e. when of_drm_find_panel() succeeds),
devm_drm_panel_bridge_add() already increments the refcount using devres
which ties the bridge allocation lifetime to the device lifetime, so we
would not need to do anything. However to have the same behaviour in both
branches take an additional reference here, so that the bridge needs to be
put whichever branch is taken without more complicated logic. Ensure to
clear the bridge pointer however, to avoid calling drm_bridge_put() on an
ERR_PTR.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 19 ++++++++++++-------
 include/drm/bridge/samsung-dsim.h     |  1 -
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index d6ef64e68623..e10c01672efd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1828,7 +1828,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(encoder, dsi->out_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }
 
@@ -1886,7 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 {
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
-	struct drm_bridge *next_bridge;
+	struct drm_bridge *next_bridge __free(drm_bridge_put) = NULL;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
@@ -1926,10 +1926,14 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(next_bridge))
+		if (IS_ERR(next_bridge)) {
 			ret = PTR_ERR(next_bridge);
+			next_bridge = NULL; // Inhibit the cleanup action on an ERR_PTR
+		} else {
+			drm_bridge_get(next_bridge);
+		}
 	} else {
-		next_bridge = of_drm_find_bridge(remote);
+		next_bridge = of_drm_find_and_get_bridge(remote);
 		if (!next_bridge)
 			ret = -EINVAL;
 	}
@@ -1969,7 +1973,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
-	dsi->out_bridge = next_bridge;
+	dsi->bridge.next_bridge = drm_bridge_get(next_bridge);
 
 	return 0;
 }
@@ -1988,8 +1992,6 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 
-	dsi->out_bridge = NULL;
-
 	if (pdata->host_ops && pdata->host_ops->detach)
 		pdata->host_ops->detach(dsi, device);
 
@@ -1997,6 +1999,9 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 
 	drm_bridge_remove(&dsi->bridge);
 
+	drm_bridge_put(dsi->bridge.next_bridge);
+	dsi->bridge.next_bridge = NULL;
+
 	return 0;
 }
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 31d7ed589233..03005e474704 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -100,7 +100,6 @@ struct samsung_dsim_plat_data {
 struct samsung_dsim {
 	struct mipi_dsi_host dsi_host;
 	struct drm_bridge bridge;
-	struct drm_bridge *out_bridge;
 	struct device *dev;
 	struct drm_display_mode mode;
 

-- 
2.52.0

