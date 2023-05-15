Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA5470418E
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A9910E2C5;
	Mon, 15 May 2023 23:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520B410E162
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:57:35 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-76efc56e1cfso220061839f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684195054; x=1686787054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTlvZRtjqJ4RiQO6GT2A0vqR1tGkbMy9z6E7MumB9ME=;
 b=gj6pzDw8b/0S9AQZXm4IyzrQtiSC0UbHtBq1afEExH4ElHAptQwmobhd6yPREI9fNy
 PkdmB067g+jx+Rn+knIPAiWh9fazkWzfuHYWSQeslSMRQZZeCyMp47ioCDXQnY682mN7
 0hbfcLTZf1D/l6eLrAn5GEiW18AIPMbZDqtDhv2Upwnse3Qw1GJTpXXfi2Tcy82TZklZ
 Tr5oV0vTpLth1YZjyPyzgjTS9WC/lvcOV+FY3Sww7iBKLjPqTddnAIA45H74ARMAN3el
 gi7UAm/3wEoM6GLeGJW/c/Lik716MEhyJWUYLcRL03o7LxT5i/jJKjcRyqxbMEq4MQET
 FoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684195054; x=1686787054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTlvZRtjqJ4RiQO6GT2A0vqR1tGkbMy9z6E7MumB9ME=;
 b=R13O2dz/L1qf0FYQ51n/Tiwz1fF7Micy8HHKEWhiJbTKNjaz6xkRAQHN35EedexEkM
 6FHbit27D1xM9HtKf3Ly2nl+22NvGlcwPX7bNkQCT2e2k/LF55YBas1hxcy9t6RcCQpM
 6hpk+ru3WFAaVJ67k+fxxdUFWWoE+99z/9VKGmGmQJ9I8cjzAaxGhasJzX/fgEf579YC
 S+3wLWzGP7CvXzqgiSztQZ50oEY1p9cBT8/Vkf5gtlGM+SCDvWlHXb4q+pU7TaEjTfbf
 5aMkwZE6eML8QTt4YXgUhzn28BeQCpS1EwTx6HXK+qLXZo8T2OBQBr9iUeDvezVl9XtN
 4w5w==
X-Gm-Message-State: AC+VfDxjsR52yV04X2YX9TmrCWgUP0EaZHDt/QsaI1SQCsgasDaPQpMi
 /Q1mN3VtmUNSRQARrUVO6nnBFRZkqUo=
X-Google-Smtp-Source: ACHHUZ6IzAlVq2AuTaceDKzB7cDava2bGBw25HhaUcC1vSxeQEeDdXdktUKadX5vNcWJCj5/QN4bkw==
X-Received: by 2002:a6b:917:0:b0:76c:779c:7ebe with SMTP id
 t23-20020a6b0917000000b0076c779c7ebemr831545ioi.14.1684195053878; 
 Mon, 15 May 2023 16:57:33 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:61e0:9fee:1bca:ea3c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056638112600b00411b5ea8576sm7427851jar.108.2023.05.15.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 16:57:33 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 5/6] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
Date: Mon, 15 May 2023 18:57:12 -0500
Message-Id: <20230515235713.232939-6-aford173@gmail.com>
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
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>
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
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 57 +++++++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 08266303c261..3944b7cfbbdf 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -218,6 +218,8 @@
 
 #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
 
+#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 1000000000000ULL)
+
 static const char *const clk_names[5] = {
 	"bus_clk",
 	"sclk_mipi",
@@ -651,6 +653,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
+	dsi->hs_clock = fout;
+
 	return fout;
 }
 
@@ -698,13 +702,46 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
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
+	 * The tech reference manual for i.MX8M Mini/Nano/Plus
+	 * doesn't state what the definition of the PHYTIMING
+	 * bits are beyond their address and bit position.
+	 * After reviewing NXP's downstream code, it appears
+	 * that the various PHYTIMING registers take the number
+	 * of cycles and use various dividers on them.  This
+	 * calculation does not result in an exact match to the
+	 * downstream code, but it is very close, and it appears
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
@@ -712,7 +749,9 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
 	 *	burst
 	 */
-	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
+
+	reg  = DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT(hs_exit);
+
 	samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
 
 	/*
@@ -728,10 +767,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
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
 
@@ -744,8 +784,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
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
index a1a5b2b89a7a..d9d431e3b65a 100644
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

