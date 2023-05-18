Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B961708C0C
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BEE10E57D;
	Thu, 18 May 2023 23:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D4E10E57C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 23:06:49 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3352b8b9b70so640335ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684451208; x=1687043208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecbFuD3QxPryZIrTro3PTU8NirrT9CMhiKMvVewbmus=;
 b=DRlxu1K3ekyZ0+ZqWmJVHzlHiDTU/lo4ajzaQcfzIQ9w1xTidojcidM1YQuCK2BO3F
 tqm+ZiwKQY+HABU4Gtw4HBJqm1lPIhMSRQVWSSfHI0TfIILXKQfiTma7bcZcKU4cpe1T
 b/THWyOPH0DhPnmIn4G7LUBvawe7uAdL0LPUXnLKqFZaCVLBIJSV2og0thMmAsYuxC2P
 3Hyyq5OWSb23+2Sl5QlQpW9fo4ESjElOEK1y0WYt26MJIW1+/sdM+FwA6K7xozxPAY3D
 RqhIyb5DLxH8L94aYNtw9AiqseUpIkFPBmnUqaFcRAM9cna6safTrKkf3sUlV4SoOoj1
 JdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684451208; x=1687043208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecbFuD3QxPryZIrTro3PTU8NirrT9CMhiKMvVewbmus=;
 b=XP0cId4SrpOXP6FpMuoV4ltZlXBm9Pd1uEoPKpgB54vItgn/cXIJ94dRPP5otXAhTr
 KrKv/1B8+Z5wMO7Z4ieUdmRK00DdRYkdNBC9eVoU77hi5MGzL+lnsTDrhijaWAnWSnwq
 sWcCGXVFsT8UwvewDcc0oWKhp29nLp144o7Yuo+du9YGDWgbqNOyZHlcjWnmP2qUHRKd
 M279ucedjZ0PWpqoZF91T+C1qqN+CUV4/oqq0i7vqr08tfo29jL1arFQQR4GlW8u8Mex
 O7uhMOQ1BbGitFLPnwYXKoZkaOWwoMjVWnJSZ3K0CJ42spRQ8lJkO+UeGFQYNUxJspa6
 HrTg==
X-Gm-Message-State: AC+VfDwJTcIFC9EgMpMZSSOtUewTG8kJSMYwSAwflD5XAlT4myV3D4a4
 CKBcE5dZC2ueccSp+6QYZaASJXZidQM=
X-Google-Smtp-Source: ACHHUZ7xxlTDd296VQu9FJNR9Sswd4fc/CWekUdUKsFWsPmNwCOk9oswNovfBbTnLqqMQbRGdIkIRg==
X-Received: by 2002:a92:ac11:0:b0:334:fa57:e670 with SMTP id
 r17-20020a92ac11000000b00334fa57e670mr4397461ilh.0.1684451207938; 
 Thu, 18 May 2023 16:06:47 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:56b8:635c:4c7a:15b1])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a92cd0c000000b003317ebbc426sm635897iln.47.2023.05.18.16.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 16:06:47 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 6/6] drm: bridge: samsung-dsim: Support non-burst mode
Date: Thu, 18 May 2023 18:06:26 -0500
Message-Id: <20230518230626.404068-7-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518230626.404068-1-aford173@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Adam Ford <aford173@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e67e501c9d49..9eda8ecc4151 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -660,11 +660,21 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
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
@@ -936,7 +946,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		int byte_clk_khz = dsi->burst_clk_rate / 1000 / 8;
+		int byte_clk_khz = dsi->hs_clock / 1000 / 8;
 		int hfp = (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
 		int hbp = (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
 		int hsa = (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
@@ -1786,10 +1796,13 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 			return PTR_ERR(pll_clk);
 	}
 
+	/* If it doesn't exist, use pixel clock instead of failing */
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
-				       &dsi->burst_clk_rate, 0);
-	if (ret < 0)
-		return ret;
+				       &dsi->burst_clk_rate, 1);
+	if (ret < 0) {
+		dev_dbg(dev, "Using pixel clock for HS clock frequency\n");
+		dsi->burst_clk_rate = 0;
+	}
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
 				       &dsi->esc_clk_rate, 0);
-- 
2.39.2

