Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5075FA7F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 17:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AA810E331;
	Mon, 24 Jul 2023 15:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jul 2023 15:14:39 UTC
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B420110E331
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 15:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7DE21C00F4; Mon, 24 Jul 2023 17:08:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
 t=1690211307; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=+Oq42VHLt9WI5LMY6xBEFPI3JfgTSegkWwKVtR1Zjh4=;
 b=tjjWmyPLkeRE7G950imIX1wsfh9Mijw+PuJebrWHS6rh2+VuRM+89tQ39Nucm7QN6njm8v
 6+GVI7LPNZI5WlevhtLPivM0PpGgJhuK1QfAyV4k/55/SeRgbgaaZCjkV6rLPVmzuOpUgH
 czr0LcoU5qIQqmg8nvc/pKS/Q7AcFu/oBC0lXonlyP2yCHbE/VOnuNjTVewMWcxTr7lF3/
 tgy2p6v9WTcc0kvOWgQ/sxo5/NPy0Dq2wVN/tETIcBxQmQ6wtz/gLC7TISIcotq8LnIelb
 3R/NWaxPvUGaioyt11Ih1Rj88GNgUOYBgegmMv3eoCgW975x6x3hRSHtcq2wrQ==
From: Frieder Schrempf <frieder@fris.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH] drm: bridge: samsung-dsim: Fix init during host transfer
Date: Mon, 24 Jul 2023 17:08:03 +0200
Message-ID: <20230724150812.553044-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frieder Schrempf <frieder.schrempf@kontron.de>

In case the downstream bridge or panel uses DSI transfers before the
DSI host was actually initialized through samsung_dsim_atomic_enable()
which clears the stop state (LP11) mode, all transfers will fail.

This happens with downstream bridges that are controlled by DSI
commands such as the tc358762.

As documented in [1] DSI hosts are expected to allow transfers
outside the normal bridge enable/disable flow.

To fix this make sure that stop state is cleared in
samsung_dsim_host_transfer() which restores the previous
behavior.

We also factor out the common code to enable/disable stop state
to samsung_dsim_set_stop_state().

[1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation

Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec")
Reported-by: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Hi Tim, could you please give this patch a try and report back if
it fixes your problem? Thanks!
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 043b8109e64a..92ea60e0fbf1 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1386,6 +1386,18 @@ static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
 	disable_irq(dsi->irq);
 }
 
+static void samsung_dsim_set_stop_state(struct samsung_dsim *dsi, bool enable)
+{
+	u32 reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
+
+	if (enable)
+		reg &= ~DSIM_FORCE_STOP_STATE;
+	else
+		reg |= DSIM_FORCE_STOP_STATE;
+
+	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
+}
+
 static int samsung_dsim_init(struct samsung_dsim *dsi)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
@@ -1445,15 +1457,12 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
 				       struct drm_bridge_state *old_bridge_state)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
-	u32 reg;
 
 	if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
 		samsung_dsim_set_display_mode(dsi);
 		samsung_dsim_set_display_enable(dsi, true);
 	} else {
-		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
-		reg &= ~DSIM_FORCE_STOP_STATE;
-		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
+		samsung_dsim_set_stop_state(dsi, false);
 	}
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
@@ -1463,16 +1472,12 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
 					struct drm_bridge_state *old_bridge_state)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
-	u32 reg;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
-	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
-		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
-		reg |= DSIM_FORCE_STOP_STATE;
-		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
-	}
+	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
+		samsung_dsim_set_stop_state(dsi, true);
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 }
@@ -1775,6 +1780,8 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (ret)
 		return ret;
 
+	samsung_dsim_set_stop_state(dsi, false);
+
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
 		return ret;
-- 
2.41.0

