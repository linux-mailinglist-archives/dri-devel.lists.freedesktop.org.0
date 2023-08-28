Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E178B4F2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A78E10E30B;
	Mon, 28 Aug 2023 15:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B2F10E309
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:59:14 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qaee0-0005pk-N8; Mon, 28 Aug 2023 17:59:12 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 28 Aug 2023 17:59:09 +0200
Subject: [PATCH 4/5] drm/bridge: samsung-dsim: adjust porches by rounding
 up
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230818-samsung-dsim-v1-4-b39716db6b7a@pengutronix.de>
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

The porches must be rounded up to make the samsung-dsim work.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4de6e4f116db..459be953be55 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -974,9 +974,9 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		int byte_clk_khz = dsi->hs_clock / 1000 / 8;
-		int hfp = (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
-		int hbp = (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
-		int hsa = (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
+		int hfp = DIV_ROUND_UP((m->hsync_start - m->hdisplay) * byte_clk_khz, m->clock);
+		int hbp = DIV_ROUND_UP((m->htotal - m->hsync_end) * byte_clk_khz, m->clock);
+		int hsa = DIV_ROUND_UP((m->hsync_end - m->hsync_start) * byte_clk_khz, m->clock);
 
 		/* remove packet overhead when possible */
 		hfp = max(hfp - 6, 0);

-- 
2.39.2

