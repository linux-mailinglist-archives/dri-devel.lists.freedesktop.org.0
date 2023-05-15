Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D070418F
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDEB10E2C7;
	Mon, 15 May 2023 23:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A58510E162
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:57:36 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3352b8b9b70so3415445ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684195055; x=1686787055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovbw8AumwPiLWq+zBHYUpvMjo6L0EGPwO8D40xqglMs=;
 b=Y/xVZWoMeKLvaUjKKOlqlLtSuFhyOzZV5XSuVhc7tkwffp5mveZCk7b3wFNbZcNRN0
 1nMBv4WAGKD0CCENHTpSxL6+4gV0IiwsETt6cZAlIe1SWqvhqj0GQacc4k9CSiUJofuS
 LTg+y/GiaOkdfXIoinq4FJBL9eY78l0EgFZffNCDYdpxzB7Z+KVHrtPRAPhkCXgHuoB5
 c/Jh9q0a7+hxYI5sxqKtIuHvXt6LAhTY2IVGTLqAImd9ET4uU8qVDybAWYB+CNuhu/wj
 jyzNg6t2oS02XdyK5Ziv+hyqSSm8//FAmHHCBs73sVAbaRCCK6DqR8oOHdrVKj5Cwbc1
 yAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684195055; x=1686787055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovbw8AumwPiLWq+zBHYUpvMjo6L0EGPwO8D40xqglMs=;
 b=e/zUoTU6Wt8ve3QWFVx0HG5oK5CR37IZpSKZMCvOMtoJSmYz4QM1IvTDiGkDutYfrN
 EbKZolsOsB8IyLszUkYm9nBaaiWIEshah1K1WASs4ZTE9oJsjTlvVAUjp7oWptp2Ad2d
 WJG7iuKHnibSCHdZSog66lX5P2q85lnx/XLyuIZ6T7O0Er+q//E8jY1N1RR0MNNvxOst
 q/Iy8V+PVCGEh0jkKgGUiEecK9y4Egz9xwqWymTTZdnt4IrTYFMMRSAVhH9qElR2rUae
 WhgJzMV+NoWCKgWHS5evHX1fuwnkj2F+wxfjsgwDroF8QA0WlNAubAvyuMQ50oXCBItE
 FPEw==
X-Gm-Message-State: AC+VfDx0HgQ+Pb5Stbu58kiyv91jTzYkUl+yzc5PzJswsqkKXEZlCGVI
 zyn+rQc9+Vt3FBtrQwYzvhbOlIer7m0=
X-Google-Smtp-Source: ACHHUZ45lCBw9rFJYhG42QxG/AJhVx4fpB6psZfhjY8kqb4BMP082fH/sIZMTiis4dIyLlyJuvneLA==
X-Received: by 2002:a92:c548:0:b0:337:6d3b:d42f with SMTP id
 a8-20020a92c548000000b003376d3bd42fmr5190345ilj.13.1684195055527; 
 Mon, 15 May 2023 16:57:35 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:61e0:9fee:1bca:ea3c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056638112600b00411b5ea8576sm7427851jar.108.2023.05.15.16.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 16:57:35 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 6/6] drm: bridge: samsung-dsim: Support non-burst mode
Date: Mon, 15 May 2023 18:57:13 -0500
Message-Id: <20230515235713.232939-7-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515235713.232939-1-aford173@gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The high-speed clock is hard-coded to the burst-clock
frequency specified in the device tree.  However, when
using devices like certain bridge chips without burst mode
and varying resolutions and refresh rates, it may be
necessary to set the high-speed clock dynamically based
on the desired pixel clock for the connected device.

This also removes the need to set a clock speed from
the device tree for non-burst mode operation, since the
pixel clock rate is the rate requested from the attached
device like a bridge chip.  This should have no impact
for people using burst-mode and setting the burst clock
rate is still required for those users.  If the burst
clock is not present, change the error message to
dev_info indicating the clock use the pixel clock.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 3944b7cfbbdf..03b21d13f067 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -655,16 +655,28 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	dsi->hs_clock = fout;
 
+	dsi->hs_clock = fout;
+
 	return fout;
 }
 
 static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 {
-	unsigned long hs_clk, byte_clk, esc_clk;
+	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
 	unsigned long esc_div;
 	u32 reg;
+	struct drm_display_mode *m = &dsi->mode;
+	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+
+	/* m->clock is in KHz */
+	pix_clk = m->clock * 1000;
+
+	/* Use burst_clk_rate if available, otherwise use the pix_clk */
+	if (dsi->burst_clk_rate)
+		hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
+	else
+		hs_clk = samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk * bpp, dsi->lanes));
 
-	hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
 	if (!hs_clk) {
 		dev_err(dsi->dev, "failed to configure DSI PLL\n");
 		return -EFAULT;
@@ -935,7 +947,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		int byte_clk_khz = dsi->burst_clk_rate / 1000 / 8;
+		int byte_clk_khz = dsi->hs_clock / 1000 / 8;
 		int hfp = (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
 		int hbp = (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
 		int hsa = (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
@@ -1785,10 +1797,13 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 			return PTR_ERR(pll_clk);
 	}
 
+	/* If it doesn't exist, use pixel clock instead of failing */
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
-				       &dsi->burst_clk_rate, 0);
-	if (ret < 0)
-		return ret;
+				       &dsi->burst_clk_rate, 1);
+	if (ret < 0) {
+		dev_info(dev, "Using pixel clock for HS clock frequency\n");
+		dsi->burst_clk_rate = 0;
+	}
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
 				       &dsi->esc_clk_rate, 0);
-- 
2.39.2

