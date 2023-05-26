Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BF711E42
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5E910E798;
	Fri, 26 May 2023 03:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEDB10E79A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:06:18 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-776fdba68ecso10647339f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070377; x=1687662377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iOxHSlFkyb4mwah+dyNQcB4nfGc3lfT3QYX6cJG7ar4=;
 b=RgTVQrqsqAkkyPqG7wSBAaksSR/tRYcC5r5KOJz3opH6M1G7Ut3Pigop7ABGikNFoG
 yreUKt1kXcS94DtjgqVj4laiXxCr3UzgGMNvvZK/Kvil7BPjNXpiGDTKNXvh99uMBra7
 8WkB00JFZ8FewLZRjflAnUz0TfwWt2H7frtd39gsb6mW+FsoaAtEYXouh7ERLxU3OZDv
 KHncPCcr1ozUXo52hQpkZyhQOq5oQHJJEq9iLyWCCj74niF0RrEvo6Y5W0XsZa+qyvhZ
 lN10LL8OSekC5ZtYAX+PYYVxMr1zZdXpvUXFJ2F18HGsjZGSDF8XReiq7uUIL19HIKWl
 vqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070377; x=1687662377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOxHSlFkyb4mwah+dyNQcB4nfGc3lfT3QYX6cJG7ar4=;
 b=kHghd7rFyYSRVyEOqNOdQEGw/ADnUmQBX/yh74XJPo8xlzC2VTwsEC/4Jzp9b/xVR6
 01YMQ2rVwwfXtgf7S53lV9eDCe/j05NFnFROWNTwI1iFp0WbPpCOGyooWo2n/rvGvaeS
 NW9KKtSP/Pr9/J5sIw09STsDLEgCIBcl3XmcbHypA6toabZZh4ZLdzcS2McgYAON54rZ
 hxJTTgFah6uzcJfj6i/TGs4OFmnO7k3H0kP6b7ITFk1wibv1yvNGGKFgqRk91SLtITk+
 rO2VDXjdMdkz0OakE/FyNevCdRBuJwjnUh1aGHm+Quc7+AYrb0xvtdhn6UAR0Q0MgPzz
 qYrg==
X-Gm-Message-State: AC+VfDw04CAUlfKWAs6DgVtWULvCZSvgGDH7R5cD/rUYnangTWlApNGh
 +WOQ2iw3o8spxtiWlxp8q5YA9LripeM=
X-Google-Smtp-Source: ACHHUZ7W12qiZWPP5+wNKW3hAJIEv7+NyBUAX5t6V+myy39GQrL7duYXFMxnIYsYmeVXxNu7CkwuNg==
X-Received: by 2002:a6b:7b02:0:b0:76c:5513:8b00 with SMTP id
 l2-20020a6b7b02000000b0076c55138b00mr23791iop.21.1685070377124; 
 Thu, 25 May 2023 20:06:17 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:3dd9:3f6c:9922:6420])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5e8502000000b007702f55116fsm363189ioj.38.2023.05.25.20.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 20:06:16 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V8 5/7] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
Date: Thu, 25 May 2023 22:05:57 -0500
Message-Id: <20230526030559.326566-6-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPHY timings are currently hard coded. Since the input
clock can be variable, the phy timings need to be variable
too.  To facilitate this, we need to cache the hs_clock
based on what is generated from the PLL.

The phy_mipi_dphy_get_default_config_for_hsclk function
configures the DPHY timings in pico-seconds, and a small macro
converts those timings into clock cycles based on the hs_clk.

Signed-off-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Michael Walle <michael@walle.cc>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 58 +++++++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 307f1c20cfb9..41f557fee29a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -220,6 +220,8 @@
 
 #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
 
+#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 1000000000000ULL)
+
 static const char *const clk_names[5] = {
 	"bus_clk",
 	"sclk_mipi",
@@ -658,6 +660,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
+	dsi->hs_clock = fout;
+
 	return fout;
 }
 
@@ -705,13 +709,47 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	const unsigned int *reg_values = driver_data->reg_values;
 	u32 reg;
+	struct phy_configure_opts_mipi_dphy cfg;
+	int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
+	int hs_exit, hs_prepare, hs_zero, hs_trail;
+	unsigned long long byte_clock = dsi->hs_clock / 8;
 
 	if (driver_data->has_freqband)
 		return;
 
+	phy_mipi_dphy_get_default_config_for_hsclk(dsi->hs_clock,
+						   dsi->lanes, &cfg);
+
+	/*
+	 * TODO:
+	 * The tech Applications Processor manuals for i.MX8M Mini, Nano,
+	 * and Plus don't state what the definition of the PHYTIMING
+	 * bits are beyond their address and bit position.
+	 * After reviewing NXP's downstream code, it appears
+	 * that the various PHYTIMING registers take the number
+	 * of cycles and use various dividers on them.  This
+	 * calculation does not result in an exact match to the
+	 * downstream code, but it is very close to the values
+	 * generated by their lookup table, and it appears
+	 * to sync at a variety of resolutions. If someone
+	 * can get a more accurate mathematical equation needed
+	 * for these registers, this should be updated.
+	 */
+
+	lpx = PS_TO_CYCLE(cfg.lpx, byte_clock);
+	hs_exit = PS_TO_CYCLE(cfg.hs_exit, byte_clock);
+	clk_prepare = PS_TO_CYCLE(cfg.clk_prepare, byte_clock);
+	clk_zero = PS_TO_CYCLE(cfg.clk_zero, byte_clock);
+	clk_post = PS_TO_CYCLE(cfg.clk_post, byte_clock);
+	clk_trail = PS_TO_CYCLE(cfg.clk_trail, byte_clock);
+	hs_prepare = PS_TO_CYCLE(cfg.hs_prepare, byte_clock);
+	hs_zero = PS_TO_CYCLE(cfg.hs_zero, byte_clock);
+	hs_trail = PS_TO_CYCLE(cfg.hs_trail, byte_clock);
+
 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
 	reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
 		reg_values[PHYCTRL_SLEW_UP];
+
 	samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
 
 	/*
@@ -719,7 +757,9 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
 	 *	burst
 	 */
-	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
+
+	reg  = DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT(hs_exit);
+
 	samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
 
 	/*
@@ -735,10 +775,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
 	 *	the last payload clock bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_CLK_PREPARE] |
-		reg_values[PHYTIMING_CLK_ZERO] |
-		reg_values[PHYTIMING_CLK_POST] |
-		reg_values[PHYTIMING_CLK_TRAIL];
+
+	reg = DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)	|
+	      DSIM_PHYTIMING1_CLK_ZERO(clk_zero)	|
+	      DSIM_PHYTIMING1_CLK_POST(clk_post)	|
+	      DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
 
 	samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
 
@@ -751,8 +792,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
 	 *	state after last payload data bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
-		reg_values[PHYTIMING_HS_TRAIL];
+
+	reg = DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
+	      DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
+	      DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
+
 	samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
 }
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 2c20b9460c9a..05100e91ecb9 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -93,6 +93,7 @@ struct samsung_dsim {
 
 	u32 pll_clk_rate;
 	u32 burst_clk_rate;
+	u32 hs_clock;
 	u32 esc_clk_rate;
 	u32 lanes;
 	u32 mode_flags;
-- 
2.39.2

