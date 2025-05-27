Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72208AC509A
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A856C10E427;
	Tue, 27 May 2025 14:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134B610E4F2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:14:54 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uJv4f-0002Ne-JG; Tue, 27 May 2025 16:14:37 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 27 May 2025 16:14:31 +0200
Subject: [PATCH RFC 1/4] drm/bridge: samsung-dsim: Always flush display
 FIFO on vsync pulse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-dsi-vsync-flush-v1-1-9b4ea4578729@pengutronix.de>
References: <20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>
In-Reply-To: <20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Always flush the display FIFO on vsync pulse, even if not explicitly
requested by the panel via MIPI_DSI_MODE_VSYNC_FLUSH mode_flag.

The display FIFO should be empty at vsync. Flushing it at vsync pulses
helps to remove garbage that may have entered the FIFO during startup
(if synchronisation between upstream display controller and Samsung DSIM
is lacking) and that may persist in form of last frame's leftovers on
subsequent frames. Flushing the display FIFO if it is already empty
should have no effect.

This will allow to remove the MIPI_DSI_MODE_VSYNC_FLUSH flag, which is
only used by the Samsung DSIM bridge driver. Arguably this flag doesn't
belong in the panel configuration at all: flushing the display FIFO on
vsync is a workaround for issues with the integration between display
controller and DSI bridge, not a property of the DSI link between bridge
and panel. No panel actually has a requirement to receive garbage or old
frame content after vsync.

I wonder if host controller FIFO resets are mentioned by the MIPI DSI
specification at all. This patch is based on the assumption that the
MIPI_DSI_MODE_VSYNC_FLUSH flag only exists because the DSIM_MFLUSH_VS
bit happens to be located in the same register as the bits controlling
the DSI mode.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..f5561a702c711dcdcddfc5262b8d675f0216169e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -898,8 +898,6 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 		 * The user manual describes that following bits are ignored in
 		 * command mode.
 		 */
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VSYNC_FLUSH))
-			reg |= DSIM_MFLUSH_VS;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 			reg |= DSIM_SYNC_INFORM;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)

-- 
2.39.5

