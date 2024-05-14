Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553DF8C4A94
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 02:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7077F10E0EB;
	Tue, 14 May 2024 00:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="ydYI7EQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BC710E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 00:48:28 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 85A2487CDA;
 Tue, 14 May 2024 02:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715647706;
 bh=2V5RYE+SaZ6LWp2Ne9zWNdriJaa9olfziPUvqiVwQts=;
 h=From:To:Cc:Subject:Date:From;
 b=ydYI7EQaMrxombIpQ9+CB/SV2Ask5OVnuTaChCi24WT3+EJNyckrphclCIX6wPYPq
 gATyzrjHFo6Ajup5GgcunWFpVWocx5UR5nXtbkOdxRW/IPyXnMgSRkhCYIGRZwK2Te
 gLHir0xJgEhibKFw9S++GM/MDA+I7gPG7XYPd/K2hSraGHo73u7j0cfyFJU+ZcMXyi
 ubL8+dsX3D59zdJRbCmgjqT3BKWwgEYop5TfJG2H68F6wH/iL1afKfqoH1lIVeuqoO
 v6uLIY/eZk50fh/WmunrsAjIp7v+4cjJro2YJUMOPx0Li0kiUtrUHBgVh63/ydrBpL
 GBjCFvQ9nZh8Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH v2] drm/bridge: tc358767: Enable FRMSYNC timing generator
Date: Tue, 14 May 2024 02:47:24 +0200
Message-ID: <20240514004759.230431-1-marex@denx.de>
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

TC9595 datasheet Video Path0 Control (VPCTRL0) Register bit FRMSYNC description
says "This bit should be disabled only in video mode transmission where Host
transmits video timing together with video data and where pixel clock source
is from DSI clock." . This driver always sources pixel clock from external xtal,
therefore the FRMSYNC bit must always be enabled, enable it.

This fixes an actual issue with DSI-to-DPI mode, where the display would
randomly show subtle pixel flickering, or wobble, or shimmering. This is
visible on solid gray color, but the degree of the shimmering differs
between boots, which makes it hard to debug.

There is a caveat to the FRMSYNC and this bridge pixel PLL, which can only
generate pixel clock with limited accuracy, it may therefore be necessary
to reduce the HFP to fit into line length of input pixel data, to avoid any
possible overflows, which make the output video look striped horizontally.

Reviewed-by: Robert Foss <rfoss@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: - Use plain DIV_ROUND_UP() instead of custom local one
    - Add RB from Robert
---
 drivers/gpu/drm/bridge/tc358767.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 166f9a3e9622d..a4d4deff7085d 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -382,6 +382,9 @@ struct tc_data {
 
 	/* HPD pin number (0 or 1) or -ENODEV */
 	int			hpd_pin;
+
+	/* Number of pixels to subtract from a line due to pixel clock delta */
+	u32			line_pixel_subtract;
 };
 
 static inline struct tc_data *aux_to_tc(struct drm_dp_aux *a)
@@ -658,8 +661,11 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
 		return -EINVAL;
 	}
 
-	dev_dbg(tc->dev, "PLL: got %d, delta %d\n", best_pixelclock,
-		best_delta);
+	tc->line_pixel_subtract = tc->mode.htotal -
+		DIV_ROUND_UP(tc->mode.htotal * (u64)best_pixelclock, (u64)pixelclock);
+
+	dev_dbg(tc->dev, "PLL: got %d, delta %d (subtract %d px)\n", best_pixelclock,
+		best_delta, tc->line_pixel_subtract);
 	dev_dbg(tc->dev, "PLL: %d / %d / %d * %d / %d\n", refclk,
 		ext_div[best_pre], best_div, best_mul, ext_div[best_post]);
 
@@ -885,6 +891,12 @@ static int tc_set_common_video_mode(struct tc_data *tc,
 		upper_margin, lower_margin, vsync_len);
 	dev_dbg(tc->dev, "total: %dx%d\n", mode->htotal, mode->vtotal);
 
+	if (right_margin > tc->line_pixel_subtract) {
+		right_margin -= tc->line_pixel_subtract;
+	} else {
+		dev_err(tc->dev, "Bridge pixel clock too slow for mode\n");
+		right_margin = 0;
+	}
 
 	/*
 	 * LCD Ctl Frame Size
@@ -894,7 +906,7 @@ static int tc_set_common_video_mode(struct tc_data *tc,
 	 */
 	ret = regmap_write(tc->regmap, VPCTRL0,
 			   FIELD_PREP(VSDELAY, right_margin + 10) |
-			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
+			   OPXLFMT_RGB888 | FRMSYNC_ENABLED | MSF_DISABLED);
 	if (ret)
 		return ret;
 
-- 
2.43.0

