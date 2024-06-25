Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55479167D1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255B110E023;
	Tue, 25 Jun 2024 12:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="U7eu86eS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340C810E023
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:28:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A8E1688496;
 Tue, 25 Jun 2024 14:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719318531;
 bh=erzhIB/LVVGJqDLXZPYIbOZzDujEJ6E/z8Y+IZX34c8=;
 h=From:To:Cc:Subject:Date:From;
 b=U7eu86eScaxWYHe3xqsodaUyTAKT0Iw/odOdCWqwhHnZiVr9+ccII+RWDGWO+ka39
 boiY+7HLYlEaZhemdSJZ+6f73cyQ9EHyiTwAOyOM2yVTOhwZGzxuzEbXOp6RZ4pcX8
 oyMPMZzlldwMmw5M+g5MtYfnpQ3h2ug1L0ngTqPWQlRht0MZwCNlPvj9+/8T6Q/w/f
 +/eWGFxyXbVoYGqbBst4pxdfoqAWHs+9DZaTB5EAVNkcSVKzEU+8pG+k6d3ZQdQS+L
 y9GBlXuoR+96tkdg2754SBgrrhUs/IXAXrmNd/7QFtGAUi7uu/BqoovwUhe3uE+HLp
 DwYCnOZWQ28Sw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on attach
Date: Tue, 25 Jun 2024 14:26:10 +0200
Message-ID: <20240625122824.148163-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

Initialize the bridge on attach already, to force lanes into LP11
state, since attach does trigger attach of downstream bridges which
may trigger (e)DP AUX channel mode read.

This fixes a corner case where DSIM with TC9595 attached to it fails
to operate the DP AUX channel, because the TC9595 enters some debug
mode when it is released from reset without lanes in LP11 mode. By
ensuring the DSIM lanes are in LP11, the TC9595 (tc358767.c driver)
can be reset in its attach callback called from DSIM attach callback,
and recovered out of the debug mode just before TC9595 performs first
AUX channel access later in its attach callback.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: Handle case where mode is not set yet
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 32 ++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e7e53a9e42afb..22d3bbd866d97 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -699,20 +699,24 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 {
-	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
+	unsigned long hs_clk, byte_clk, esc_clk;
 	unsigned long esc_div;
 	u32 reg;
 	struct drm_display_mode *m = &dsi->mode;
 	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
-	/* m->clock is in KHz */
-	pix_clk = m->clock * 1000;
-
-	/* Use burst_clk_rate if available, otherwise use the pix_clk */
+	/*
+	 * Use burst_clk_rate if available, otherwise use the mode clock
+	 * if mode is already set and available, otherwise fall back to
+	 * PLL input clock and operate in 1:1 lowest frequency mode until
+	 * a mode is set.
+	 */
 	if (dsi->burst_clk_rate)
 		hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
+	else if (m)	/* m->clock is in KHz */
+		hs_clk = samsung_dsim_set_pll(dsi, DIV_ROUND_UP(m->clock * 1000 * bpp, dsi->lanes));
 	else
-		hs_clk = samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk * bpp, dsi->lanes));
+		hs_clk = dsi->pll_clk_rate;
 
 	if (!hs_clk) {
 		dev_err(dsi->dev, "failed to configure DSI PLL\n");
@@ -1643,9 +1647,21 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 			       enum drm_bridge_attach_flags flags)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	int ret;
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
-				 flags);
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = samsung_dsim_init(dsi);
+	if (ret < 0)
+		goto err;
+
+	ret = drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				flags);
+err:
+	pm_runtime_put_sync(dsi->dev);
+	return ret;
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
-- 
2.43.0

