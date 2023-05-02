Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2A6F3BAF
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502710E0E3;
	Tue,  2 May 2023 01:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A8610E2E9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:16 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-760f8ffb27fso54744939f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989696; x=1685581696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFK1TzRb+WofFBaYOMfgaKdiEVNH7eD9PTVjCEw9DwY=;
 b=sbCNxbaHm/4Ns0b0+O4D6S3b909ab9R4JIc6mVPhYCgppojoxTQL7UP4ZdTQQmUkXQ
 sRiuw1/O0tTB8WXfVTSY6wDQNqDNyU0vPEAtj0MUol5REjp1p3g9jvevBpH7myCb7bw1
 bkCUbqR4rr7iO1M4261UGgcsLE8DfPC0fKBiH7UjDdfBnqSGyGdaUHay2LlZ+sbMOEyy
 ousGnAP0NOZxqdI37sY9Yf9L3EMGFkrNTwSLKZHfJ4rRMTtdzHrAvaeaqnsjIyipWL9i
 3qan6Q4Px653UIgZJAZanEyY6kbRIaqm5mvqUEJP2tP7jKQg2KjkFbSR9x3sTkHSf656
 5CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989696; x=1685581696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFK1TzRb+WofFBaYOMfgaKdiEVNH7eD9PTVjCEw9DwY=;
 b=Aeql6/Hx2mKn1RC9Ft5yYqRf+y6y6mKMrEnBUqqlblSeWDXNVPd+5zmIvBGyEkTDSr
 3Mncs37BJST/5Zp+lsvWAeIcZBjWeFUW5JvvIiqOPoLXQ10tYQOXlagAOqr+ZyRGuPmd
 6dkb+5KbpSFWJvln3wW67Z7IjnFQR8uZO2h8IAhm6V5vQge7/pdFVu4FATI/VoXoF2JL
 pQW30rUfMg1mUVP2qBdNwU2MuEAf2EvHMKIvHbN9F87Vwry87mWwZnsBdwsPRdVmkb+X
 kGmhIAz4zBmXfx2M71e3D132QDutfZDqAHcOELquSnC9T+iviTqg2qHAXcLvIASZtw5V
 wWbw==
X-Gm-Message-State: AC+VfDxyxolyEGyPmOLlihE2rc0Skbf0M2ggHVPqlwNqWH/rSR7KQh/4
 NqHWytw8dkZwTWoxu42LL3hXmzW2Bpr56Q==
X-Google-Smtp-Source: ACHHUZ6oXvc/Tm8pSKJtWxjgaQbf1O1pDYMnUGAp/ExDVDOTTgZfVeMUcAIVcCB70gmFKzggiizX+Q==
X-Received: by 2002:a92:c711:0:b0:331:250a:a61b with SMTP id
 a17-20020a92c711000000b00331250aa61bmr248226ilp.8.1682989696008; 
 Mon, 01 May 2023 18:08:16 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:15 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 5/7] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
Date: Mon,  1 May 2023 20:07:57 -0500
Message-Id: <20230502010759.17282-6-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
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
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2dc02a9e37c0..99642230a54a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -18,9 +18,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
-
 #include <video/mipi_display.h>
-
 #include <drm/bridge/samsung-dsim.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
@@ -218,6 +216,8 @@
 
 #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
 
+#define PS_TO_CYCLE(PS, MHz) DIV64_U64_ROUND_CLOSEST(((PS) * (MHz)), 1000000000000ULL)
+
 static const char *const clk_names[5] = {
 	"bus_clk",
 	"sclk_mipi",
@@ -487,6 +487,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.m_min = 64,
 	.m_max = 1023,
 	.min_freq = 1050,
+	.dynamic_dphy = 1,
 };
 
 static const struct samsung_dsim_driver_data *
@@ -698,13 +699,50 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
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
@@ -712,7 +750,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
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
@@ -728,10 +770,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
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
 
@@ -744,8 +793,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
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
 
@@ -1337,7 +1395,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	samsung_dsim_enable_clock(dsi);
 	if (driver_data->wait_for_reset)
 		samsung_dsim_wait_for_reset(dsi);
-	samsung_dsim_set_phy_ctrl(dsi);
+	if (!driver_data->has_freqband)
+		samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
 	dsi->state |= DSIM_STATE_INITIALIZED;
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

