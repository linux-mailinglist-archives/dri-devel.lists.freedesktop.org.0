Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362ACAC50C0
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627D210E3D9;
	Tue, 27 May 2025 14:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B616D10E2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:22:15 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uJvBp-00048s-5N; Tue, 27 May 2025 16:22:01 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 27 May 2025 16:21:47 +0200
Subject: [PATCH 1/2] drm/bridge: samsung-dsim: use while loop in
 samsung_dsim_transfer_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-samsung-dsim-v1-1-5be520d84fbb@pengutronix.de>
References: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
In-Reply-To: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Turn the open-coded goto-again construct into a while loop, to make
samsung_dsim_transfer_start() a bit shorter and easier to read.

Hold the spinlock when looping back around and avoid the duplicated
list_empty() check.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 51 +++++++++++++++--------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..1dfc9710bee5134e0e0114ce52f673c21564b11b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1235,43 +1235,34 @@ static void samsung_dsim_transfer_start(struct samsung_dsim *dsi)
 {
 	unsigned long flags;
 	struct samsung_dsim_transfer *xfer;
-	bool start = false;
 
-again:
 	spin_lock_irqsave(&dsi->transfer_lock, flags);
 
-	if (list_empty(&dsi->transfer_list)) {
+	while (!list_empty(&dsi->transfer_list)) {
+		xfer = list_first_entry(&dsi->transfer_list,
+					struct samsung_dsim_transfer, list);
+
 		spin_unlock_irqrestore(&dsi->transfer_lock, flags);
-		return;
+
+		if (xfer->packet.payload_length &&
+		    xfer->tx_done == xfer->packet.payload_length)
+			/* waiting for RX */
+			return;
+
+		samsung_dsim_send_to_fifo(dsi, xfer);
+
+		if (xfer->packet.payload_length || xfer->rx_len)
+			return;
+
+		xfer->result = 0;
+		complete(&xfer->completed);
+
+		spin_lock_irqsave(&dsi->transfer_lock, flags);
+
+		list_del_init(&xfer->list);
 	}
 
-	xfer = list_first_entry(&dsi->transfer_list,
-				struct samsung_dsim_transfer, list);
-
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
-
-	if (xfer->packet.payload_length &&
-	    xfer->tx_done == xfer->packet.payload_length)
-		/* waiting for RX */
-		return;
-
-	samsung_dsim_send_to_fifo(dsi, xfer);
-
-	if (xfer->packet.payload_length || xfer->rx_len)
-		return;
-
-	xfer->result = 0;
-	complete(&xfer->completed);
-
-	spin_lock_irqsave(&dsi->transfer_lock, flags);
-
-	list_del_init(&xfer->list);
-	start = !list_empty(&dsi->transfer_list);
-
-	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
-
-	if (start)
-		goto again;
 }
 
 static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)

-- 
2.39.5

