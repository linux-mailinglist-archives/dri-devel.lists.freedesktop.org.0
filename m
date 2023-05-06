Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12F6F8D5F
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 03:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9623410E630;
	Sat,  6 May 2023 01:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C47E10E630
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 01:09:52 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-763ae160c47so177597739f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683335391; x=1685927391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cFA3Um2lIdvmaDIYnJ1SJljeFjsoyn/PLEYyBBm4Zo=;
 b=hGXrvyNo6Q/h4FDvN/Im3VWcgJh0f8K9Zwpp77Jqy/zw4wNxxA+O9ldY61gewakOk/
 arM9ZJIECobX4YqhP7NM+I5JgBdxTZUb6gvfAzDoOtWaLJ3rDEPMTOdQ/TOl+YUimeOd
 G9albcJd01HiaiWv5fAFuIqseHQ4T0nQmRqXNUlc1qFEAx3Gz5qGD7uPq4FC7JnxsXvi
 dud8BhsjyRLSxmkzTumaS0nZQ6I9kxr4lheNi5qULfAE4P7rrhe7nxHJVZQquaMLMkEz
 U/gF54me+XJrxW2zBqTXLaTIzop9CA9855Z4rzF3LWvWuls7T7d3UzHg8atyBJ0uq6Jn
 06hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683335391; x=1685927391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cFA3Um2lIdvmaDIYnJ1SJljeFjsoyn/PLEYyBBm4Zo=;
 b=JZ8Q1L0Lso+UlxG5lAiu5a4qHTW7AjiL7AxbqS9X3zaIC7tC5wSR2PNWlpHYv1raXI
 pQS786rAdh0nPYvvjZ69rigaJGzy5NKE+vMKrgTwLKIqdhck2D4Q4IM8CteKVd1dh6kW
 c66DSAkssNY7/4wUvuLFWdoIjx/mUITHhUcNF3egIVVN4RLjj7thP/2bDf9QfZ1Q69Ax
 0l7gmopIMBzeSh/v0V61OWLU6GLaiKaWFkY9DOlUEVqfyfqubpy+uWbv8Ulb6DnFG4Ui
 QWpeog4BhRtg1fTWtJ6NbGWHLQdz2tns/S7MEpb2/hyKFer/Wtogfh2AQm1YEyyC/z3U
 VVPA==
X-Gm-Message-State: AC+VfDxyLYU6G8Se48kkddfNlFb933ABOV4KbxZF5IU2t7BFAlQ567Pr
 C/0fuFaZHmYl5JR3Kg3Y+vrWBlXZQDNFyQ==
X-Google-Smtp-Source: ACHHUZ65ExZlME3j2nFJmuLKcP9QlBrZyQ0Q8lgIuopACIQsTo53d4ciEfViSfJY1EtramnsVptGog==
X-Received: by 2002:a5d:9301:0:b0:752:ee32:322d with SMTP id
 l1-20020a5d9301000000b00752ee32322dmr1834930ion.18.1683335390713; 
 Fri, 05 May 2023 18:09:50 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:34a2:3894:45cc:c002])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5e950b000000b00760ed929d0bsm335735ioj.2.2023.05.05.18.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 18:09:50 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 5/6] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
Date: Fri,  5 May 2023 20:09:32 -0500
Message-Id: <20230506010933.170939-6-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506010933.170939-1-aford173@gmail.com>
References: <20230506010933.170939-1-aford173@gmail.com>
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
 Michael Walle <michael@walle.cc>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPHY timings are currently hard coded. Since the input
clock can be variable, the phy timings need to be variable
too.  Add an additional variable to the driver data to enable
this feature to prevent breaking boards that don't support it.

The phy_mipi_dphy_get_default_config function configures the
DPHY timings in pico-seconds, and a small macro converts those
timings into clock cycles based on the pixel clock rate.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 74 ++++++++++++++++++++++++---
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2dc02a9e37c0..1b98c4e040b0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -218,6 +218,8 @@
 
 #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
 
+#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 1000000000000ULL)
+
 static const char *const clk_names[5] = {
 	"bus_clk",
 	"sclk_mipi",
@@ -487,6 +489,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.m_min = 64,
 	.m_max = 1023,
 	.min_freq = 1050,
+	.dynamic_dphy = 1,
 };
 
 static const struct samsung_dsim_driver_data *
@@ -698,13 +701,50 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	const unsigned int *reg_values = driver_data->reg_values;
 	u32 reg;
+	struct drm_display_mode *m = &dsi->mode;
+	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	struct phy_configure_opts_mipi_dphy cfg;
+	int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
+	int hs_exit, hs_prepare, hs_zero, hs_trail;
+	unsigned long long clock_in_hz = m->clock * 1000;
 
 	if (driver_data->has_freqband)
 		return;
 
+	/* The dynamic_phy has the ability to adjust PHY Timing settings */
+	if (driver_data->dynamic_dphy) {
+		phy_mipi_dphy_get_default_config(clock_in_hz, bpp, dsi->lanes, &cfg);
+
+		/*
+		 * TODO:
+		 * The tech reference manual for i.MX8M Mini/Nano/Plus
+		 * doesn't state what the definition of the PHYTIMING
+		 * bits are beyond their address and bit position.
+		 * After reviewing NXP's downstream code, it appears
+		 * that the various PHYTIMING registers take the number
+		 * of cycles and use various dividers on them.  This
+		 * calculation does not result in an exact match to the
+		 * downstream code, but it is very close, and it appears
+		 * to sync at a variety of resolutions. If someone
+		 * can get a more accurate mathematical equation needed
+		 * for these registers, this should be updated.
+		 */
+
+		lpx = PS_TO_CYCLE(cfg.lpx, clock_in_hz);
+		hs_exit = PS_TO_CYCLE(cfg.hs_exit, clock_in_hz);
+		clk_prepare = PS_TO_CYCLE(cfg.clk_prepare, clock_in_hz);
+		clk_zero = PS_TO_CYCLE(cfg.clk_zero, clock_in_hz);
+		clk_post = PS_TO_CYCLE(cfg.clk_post, clock_in_hz);
+		clk_trail = PS_TO_CYCLE(cfg.clk_trail, clock_in_hz);
+		hs_prepare = PS_TO_CYCLE(cfg.hs_prepare, clock_in_hz);
+		hs_zero = PS_TO_CYCLE(cfg.hs_zero, clock_in_hz);
+		hs_trail = PS_TO_CYCLE(cfg.hs_trail, clock_in_hz);
+	}
+
 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
 	reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
 		reg_values[PHYCTRL_SLEW_UP];
+
 	samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
 
 	/*
@@ -712,7 +752,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
 	 *	burst
 	 */
-	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
+	if (driver_data->dynamic_dphy)
+		reg  = DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT(hs_exit);
+	else
+		reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
+
 	samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
 
 	/*
@@ -728,10 +772,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
 	 *	the last payload clock bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_CLK_PREPARE] |
-		reg_values[PHYTIMING_CLK_ZERO] |
-		reg_values[PHYTIMING_CLK_POST] |
-		reg_values[PHYTIMING_CLK_TRAIL];
+	if (driver_data->dynamic_dphy) {
+		reg = DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)	|
+		      DSIM_PHYTIMING1_CLK_ZERO(clk_zero)	|
+		      DSIM_PHYTIMING1_CLK_POST(clk_post)	|
+		      DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
+	} else {
+		reg = reg_values[PHYTIMING_CLK_PREPARE] |
+		      reg_values[PHYTIMING_CLK_ZERO] |
+		      reg_values[PHYTIMING_CLK_POST] |
+		      reg_values[PHYTIMING_CLK_TRAIL];
+	}
 
 	samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
 
@@ -744,8 +795,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
 	 *	state after last payload data bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
-		reg_values[PHYTIMING_HS_TRAIL];
+
+	if (driver_data->dynamic_dphy) {
+		reg = DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
+		      DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
+		      DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
+	} else {
+		reg = reg_values[PHYTIMING_HS_PREPARE] |
+		      reg_values[PHYTIMING_HS_ZERO] |
+		      reg_values[PHYTIMING_HS_TRAIL];
+	}
+
 	samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
 }
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index a1a5b2b89a7a..76ea8a1720cc 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
 	const unsigned int *reg_values;
 	u16 m_min;
 	u16 m_max;
+	bool dynamic_dphy;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.39.2

