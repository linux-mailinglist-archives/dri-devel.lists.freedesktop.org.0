Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789EAEB6C9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08DB10E9FD;
	Fri, 27 Jun 2025 11:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBAA10E9F7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:45:56 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uV7Wi-0004N2-Ip; Fri, 27 Jun 2025 13:45:52 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 27 Jun 2025 13:45:38 +0200
Subject: [PATCH v2 1/4] drm/bridge: samsung-dsim: Always flush display FIFO
 on vsync pulse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dsi-vsync-flush-v2-1-4066899a5608@pengutronix.de>
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
In-Reply-To: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8ec6f4e7952f1f0cc1fc977732d8e457d6eb5012..c4997795db18280903570646b0a5b2c03b666307 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -897,8 +897,6 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
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

