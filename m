Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393578B4F4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF910E30E;
	Mon, 28 Aug 2023 15:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0C710E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:59:15 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qaee1-0005pk-FX; Mon, 28 Aug 2023 17:59:13 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 28 Aug 2023 17:59:10 +0200
Subject: [PATCH 5/5] drm/bridge: samsung-dsim: calculate porches in Hz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230818-samsung-dsim-v1-5-b39716db6b7a@pengutronix.de>
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

Calculating the byte_clk in kHz is imprecise for a hs_clock of 55687500
Hz, which may be used with a pixel clock of 74.25 MHz with mode
1920x1080-30.

Fix the calculation by using HZ instead of kHZ.

This requires to change the type to u64 to prevent overflows of the
integer type.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 459be953be55..eb7aca2b9ab7 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -973,10 +973,12 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		int byte_clk_khz = dsi->hs_clock / 1000 / 8;
-		int hfp = DIV_ROUND_UP((m->hsync_start - m->hdisplay) * byte_clk_khz, m->clock);
-		int hbp = DIV_ROUND_UP((m->htotal - m->hsync_end) * byte_clk_khz, m->clock);
-		int hsa = DIV_ROUND_UP((m->hsync_end - m->hsync_start) * byte_clk_khz, m->clock);
+		u64 byte_clk = dsi->hs_clock / 8;
+		u64 pix_clk = m->clock * 1000;
+
+		int hfp = DIV64_U64_ROUND_UP((m->hsync_start - m->hdisplay) * byte_clk, pix_clk);
+		int hbp = DIV64_U64_ROUND_UP((m->htotal - m->hsync_end) * byte_clk, pix_clk);
+		int hsa = DIV64_U64_ROUND_UP((m->hsync_end - m->hsync_start) * byte_clk, pix_clk);
 
 		/* remove packet overhead when possible */
 		hfp = max(hfp - 6, 0);

-- 
2.39.2

