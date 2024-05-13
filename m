Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56FE8C3A1A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 04:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEDD10E0E0;
	Mon, 13 May 2024 02:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="hrjmOMks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010F510E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 02:16:24 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8A8E2882B4;
 Mon, 13 May 2024 04:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715566583;
 bh=w/+/XlJv4789+wWI5bO1oX5fy4cOISLUA0D3f37T2Hk=;
 h=From:To:Cc:Subject:Date:From;
 b=hrjmOMkspvnPJGj/u8t392ssjddmlA/SJnhOA/i3dPrqeAMyXgDxg7CZ8QI0MX/5a
 nIMFeVXNJ+f6lrtTAt+3oTQ4I1NcX5YVuiZ1ZWb3hACwRt8sijbas3CaH+d4eUi5z8
 U8L6BV27ZO9jfW9uOvb/AdDGV4Es3MCYYC+dOll8i6inuJoXEkigPD/IHX9u/0X98Y
 2HHy7qX6Ns7BjNZuXkUiJ+8HSKycWK28SiZlqBx0B0CzDg/f+qBaygKH4xbIaY31/+
 9cKtyydYchfBCtkzqHaphtvtckgu1eJiXMcc894kqtz19xtvwpjvtEPYpsPGYPeV7x
 tYrvLKP2fYv2Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH] drm/bridge: tc358767: Enable FRMSYNC timing generator
Date: Mon, 13 May 2024 04:16:04 +0200
Message-ID: <20240513021607.129111-1-marex@denx.de>
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
 drivers/gpu/drm/bridge/tc358767.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 166f9a3e9622d..fe2b93546eaef 100644
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
@@ -577,6 +580,11 @@ static int tc_pllupdate(struct tc_data *tc, unsigned int pllctrl)
 	return 0;
 }
 
+static u32 div64_round_up(u64 v, u32 d)
+{
+	return div_u64(v + d - 1, d);
+}
+
 static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
 {
 	int ret;
@@ -658,8 +666,11 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
 		return -EINVAL;
 	}
 
-	dev_dbg(tc->dev, "PLL: got %d, delta %d\n", best_pixelclock,
-		best_delta);
+	tc->line_pixel_subtract = tc->mode.htotal -
+		div64_round_up(tc->mode.htotal * (u64)best_pixelclock, pixelclock);
+
+	dev_dbg(tc->dev, "PLL: got %d, delta %d (subtract %d px)\n", best_pixelclock,
+		best_delta, tc->line_pixel_subtract);
 	dev_dbg(tc->dev, "PLL: %d / %d / %d * %d / %d\n", refclk,
 		ext_div[best_pre], best_div, best_mul, ext_div[best_post]);
 
@@ -885,6 +896,12 @@ static int tc_set_common_video_mode(struct tc_data *tc,
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
@@ -894,7 +911,7 @@ static int tc_set_common_video_mode(struct tc_data *tc,
 	 */
 	ret = regmap_write(tc->regmap, VPCTRL0,
 			   FIELD_PREP(VSDELAY, right_margin + 10) |
-			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
+			   OPXLFMT_RGB888 | FRMSYNC_ENABLED | MSF_DISABLED);
 	if (ret)
 		return ret;
 
-- 
2.43.0

