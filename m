Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA2C7EA16C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 17:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF15410E3C2;
	Mon, 13 Nov 2023 16:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D07110E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 16:44:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 560E8CE1710;
 Mon, 13 Nov 2023 16:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF6FC433C8;
 Mon, 13 Nov 2023 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699893836;
 bh=RlU79UoJoYw5u+/7L0jkhh1x9IUQoSb9+SIzJtrRGT0=;
 h=From:To:Cc:Subject:Date:From;
 b=W/VU9kEfDnI64dPMSeIJrgX7Jgz8wdAmXGv4AgpSLPeX0ShchR0icbptMTPSHq8ZE
 mBrt2R8ghk6s8ZnDGECLomg9t+i2yGj+1UUpZbJ+DyaUxAAmdtPB/Ugt8uQ7yhI7m1
 3Pp2KB2uLGBFe5Kw7IxchyXGEOj9+0VxTv4+6glbLauPGcOnLe7w/heE8ghyxTlTP6
 GEftJIDPtehfjc/CyEpm4H58/L6VFZHKDZGD7zX0QauaNYgTi76QbzO3JZ7vSDKwCj
 SlFeocSTS0Xcje57aOiLoJSz92R18TVWJhiRjN3uzAHs3abon/eog+8C/lQIBsxFFT
 oiBEQ2FIWgbTw==
From: Michael Walle <mwalle@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
Date: Mon, 13 Nov 2023 17:43:44 +0100
Message-Id: <20231113164344.1612602-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The FORCE_STOP_STATE bit is unsuitable to force the DSI link into LP-11
mode. It seems the bridge internally queues DSI packets and when the
FORCE_STOP_STATE bit is cleared, they are sent in close succession
without any useful timing (this also means that the DSI lanes won't go
into LP-11 mode). The length of this gibberish varies between 1ms and
5ms. This sometimes breaks an attached bridge (TI SN65DSI84 in this
case). In our case, the bridge will fail in about 1 per 500 reboots.

The FORCE_STOP_STATE handling was introduced to have the DSI lanes in
LP-11 state during the .pre_enable phase. But as it turns out, none of
this is needed at all. Between samsung_dsim_init() and
samsung_dsim_set_display_enable() the lanes are already in LP-11 mode.
The code as it was before commit 20c827683de0 ("drm: bridge:
samsung-dsim: Fix init during host transfer") and 0c14d3130654 ("drm:
bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec") was correct
in this regard.

This patch basically reverts both commits. It was tested on an i.MX8M
SoC with an SN65DSI84 bridge. The signals were probed and the DSI
packets were decoded during initialization and link start-up. After this
patch the first DSI packet on the link is a VSYNC packet and the timing
is correct.

Command mode between .pre_enable and .enable was also briefly tested by
a quick hack. There was no DSI link partner which would have responded,
but it was made sure the DSI packet was send on the link. As a side
note, the command mode seems to just work in HS mode. I couldn't find
that the bridge will handle commands in LP mode.

Fixes: 20c827683de0 ("drm: bridge: samsung-dsim: Fix init during host transfer")
Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
Let me know wether this should be two commits each reverting one, but both
commits appeared first in kernel 6.5.

 drivers/gpu/drm/bridge/samsung-dsim.c | 32 ++-------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index cf777bdb25d2..4233a50baac7 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -939,10 +939,6 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 	reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
 	reg &= ~DSIM_STOP_STATE_CNT_MASK;
 	reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
-
-	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
-		reg |= DSIM_FORCE_STOP_STATE;
-
 	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
 
 	reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
@@ -1387,18 +1383,6 @@ static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
 	disable_irq(dsi->irq);
 }
 
-static void samsung_dsim_set_stop_state(struct samsung_dsim *dsi, bool enable)
-{
-	u32 reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
-
-	if (enable)
-		reg |= DSIM_FORCE_STOP_STATE;
-	else
-		reg &= ~DSIM_FORCE_STOP_STATE;
-
-	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
-}
-
 static int samsung_dsim_init(struct samsung_dsim *dsi)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
@@ -1448,9 +1432,6 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 		ret = samsung_dsim_init(dsi);
 		if (ret)
 			return;
-
-		samsung_dsim_set_display_mode(dsi);
-		samsung_dsim_set_display_enable(dsi, true);
 	}
 }
 
@@ -1459,12 +1440,8 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
-	if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
-		samsung_dsim_set_display_mode(dsi);
-		samsung_dsim_set_display_enable(dsi, true);
-	} else {
-		samsung_dsim_set_stop_state(dsi, false);
-	}
+	samsung_dsim_set_display_mode(dsi);
+	samsung_dsim_set_display_enable(dsi, true);
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 }
@@ -1477,9 +1454,6 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
-	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
-		samsung_dsim_set_stop_state(dsi, true);
-
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
@@ -1781,8 +1755,6 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (ret)
 		return ret;
 
-	samsung_dsim_set_stop_state(dsi, false);
-
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
 		return ret;
-- 
2.39.2

