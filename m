Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB46D00F4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49E110ED9C;
	Thu, 30 Mar 2023 10:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA6C10ED97
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:18:04 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 147B120F4D;
 Thu, 30 Mar 2023 12:18:03 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Subject: [PATCH v1 2/2] drm/bridge: ti-sn65dsi83: Add DSI video mode
 configuration
Date: Thu, 30 Mar 2023 12:17:52 +0200
Message-Id: <20230330101752.429804-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330101752.429804-1-francesco@dolcini.it>
References: <20230330101752.429804-1-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Enable configuration of the DSI video mode instead of hard-coding
MIPI_DSI_MODE_VIDEO_BURST. The bridge support any of burst-mode,
non-burst with sync event or non-burst with sync pulse

With this change is possible to use the bridge with host DSI
that do not support burst mode.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 91ecfbe45bf9..144d0de0d278 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -145,6 +145,7 @@ struct sn65dsi83 {
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
+	u32				dsi_video_mode;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
 };
@@ -603,6 +604,9 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
 				     "Failed to get supply 'vcc'\n");
 
+	ctx->dsi_video_mode = 0;
+	of_property_read_u32(dev->of_node, "dsi-video-mode", &ctx->dsi_video_mode);
+
 	return 0;
 }
 
@@ -642,7 +646,25 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 
 	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
+
+	switch (ctx->dsi_video_mode) {
+	case 0:
+		/* burst mode */
+		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_BURST;
+		break;
+	case 1:
+		/* non-burst mode with sync event */
+		break;
+	case 2:
+		/* non-burst mode with sync pulse */
+		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+		break;
+	default:
+		dev_warn(dev, "invalid video mode %d\n", ctx->dsi_video_mode);
+		break;
+	}
+
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.25.1

