Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642DC913BCC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 16:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCBA899E9;
	Sun, 23 Jun 2024 14:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="DiWDhiVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8B0899E9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:39:11 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EE8118780E;
 Sun, 23 Jun 2024 16:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719153549;
 bh=QyVlLBZARw9UsDr6RuUqfzlyQ/4cRX+l7iPrFNYSZiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DiWDhiVAQknibjE1oMxrd0IQ/2M8/4jHoNJKMWIFM08Wd3QVXlQ4UPmjiIPaNQApO
 vxqlOMRdZE2GLfpFqmV2yHG83JQ0sM+0w6NpwsZE3+6uEQrElgHa1ZUo3DegwWWFOp
 +uHYVOd+Q15H8bD3qa3nBGSXueewLpHeoTIK6N+GxYUOZviNQq9/gGI1h3H1w1iqkX
 vMl06vMCofQMlHXlGyYqOvkq/VCdrQzWgD/mJd1H3w35v4vdrVOZAD+k/3dJzPK/N7
 U6iv9zoC3S+JhtXkLTagMwdk2WtQkRdm1Pe4Pl++uPGqcmCp6XC1ntfUX1gouMsXaJ
 8a08PVKLCAfjA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH v3 3/6] drm/bridge: tc358767: Drop line_pixel_subtract
Date: Sun, 23 Jun 2024 16:38:35 +0200
Message-ID: <20240623143846.12603-3-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623143846.12603-1-marex@denx.de>
References: <20240623143846.12603-1-marex@denx.de>
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

This line_pixel_subtract is no longer needed now that the bridge can
request and obtain specific pixel clock on input to the bridge, with
clock frequency that matches the Pixel PLL frequency.

The line_pixel_subtract is now always 0, so drop it entirely.

The line_pixel_subtract was not reliable as it never worked when the
Pixel PLL and input clock were off just so that the required amount
of pixels to subtract would not be whole integer.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: No change
V3: Fix up rebase artifact
---
 drivers/gpu/drm/bridge/tc358767.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 20be21660ba76..c4e2455ad95e4 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -382,9 +382,6 @@ struct tc_data {
 
 	/* HPD pin number (0 or 1) or -ENODEV */
 	int			hpd_pin;
-
-	/* Number of pixels to subtract from a line due to pixel clock delta */
-	u32			line_pixel_subtract;
 };
 
 static inline struct tc_data *aux_to_tc(struct drm_dp_aux *a)
@@ -661,11 +658,7 @@ static int tc_pxl_pll_calc(struct tc_data *tc, u32 refclk, u32 pixelclock,
 		return -EINVAL;
 	}
 
-	tc->line_pixel_subtract = tc->mode.htotal -
-		div64_round_up(tc->mode.htotal * (u64)best_pixelclock, pixelclock);
-
-	dev_dbg(tc->dev, "PLL: got %d, delta %d (subtract %d px)\n", best_pixelclock,
-		best_delta, tc->line_pixel_subtract);
+	dev_dbg(tc->dev, "PLL: got %d, delta %d\n", best_pixelclock, best_delta);
 	dev_dbg(tc->dev, "PLL: %d / %d / %d * %d / %d\n", refclk,
 		ext_div[best_pre], best_div, best_mul, ext_div[best_post]);
 
@@ -909,13 +902,6 @@ static int tc_set_common_video_mode(struct tc_data *tc,
 		upper_margin, lower_margin, vsync_len);
 	dev_dbg(tc->dev, "total: %dx%d\n", mode->htotal, mode->vtotal);
 
-	if (right_margin > tc->line_pixel_subtract) {
-		right_margin -= tc->line_pixel_subtract;
-	} else {
-		dev_err(tc->dev, "Bridge pixel clock too slow for mode\n");
-		right_margin = 0;
-	}
-
 	/*
 	 * LCD Ctl Frame Size
 	 * datasheet is not clear of vsdelay in case of DPI
-- 
2.43.0

