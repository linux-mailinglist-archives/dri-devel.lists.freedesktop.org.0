Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3078B4F3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A659610E30C;
	Mon, 28 Aug 2023 15:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9F010E309
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:59:14 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qaee0-0005pk-3q; Mon, 28 Aug 2023 17:59:12 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 28 Aug 2023 17:59:08 +0200
Subject: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230818-samsung-dsim-v1-3-b39716db6b7a@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michael Tretter <m.tretter@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PLL requires a clock between 2 MHz and 30 MHz after the pre-divider.
The reference clock for the PLL may change due to changes to it's parent
clock. Thus, the frequency may be out of range or unsuited for
generating the high speed clock for MIPI DSI.

Try to keep the pre-devider small, and set the reference clock close to
30 MHz before recalculating the PLL configuration. Use a divider with a
power of two for the reference clock as this seems to work best in
my tests.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index da90c2038042..4de6e4f116db 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -611,10 +611,21 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	u16 m;
 	u32 reg;
 
-	if (dsi->pll_clk)
+	if (dsi->pll_clk) {
+		/*
+		 * Ensure that the reference clock is generated with a power of
+		 * two divider from its parent, but close to the PLLs upper
+		 * limit of the valid range of 2 MHz to 30 MHz.
+		 */
+		fin = clk_get_rate(clk_get_parent(dsi->pll_clk));
+		while (fin > 30 * MHZ)
+			fin = fin / 2;
+		clk_set_rate(dsi->pll_clk, fin);
+
 		fin = clk_get_rate(dsi->pll_clk);
-	else
+	} else {
 		fin = dsi->pll_clk_rate;
+	}
 	dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
 
 	fout = samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);

-- 
2.39.2

