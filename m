Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177C6EBF3B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 14:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6210E38F;
	Sun, 23 Apr 2023 12:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C546810E3B9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 12:13:00 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-329627dabfbso35779015ab.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682251979; x=1684843979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6CFEB27xnVdVzEI62Flt6e1TPcC5Y7Hj3J4O8a2oNs=;
 b=HPz5zGuQZjGTlD9yDmRFg5osb0SdqVkhFRdAZeSXK3qdl6WHUVTmDNlROtS8eNFTQs
 EIcytRZzFR3srIcZQvhU7qdDC1fybmSrsjcIu6V0wXQE+YHfSQ8FuhKFdfxc+7bB+SLw
 QvG5oYV+oR10Sg3bObZFSw1eLZV+cHTUZfWaUGMmWGPJCY/dUzaZUrCgY/bMdyy4uDdq
 dkgI5WeG9TzCv1Xfi8hO7mUvKqpD/OB/5ucQ60/lcDZt8eXYultn1MRTl39ZaGupVV87
 B3bM/sXNp2wV9QhzRvdSsDjvZaGwy0Gs5PY/jQXXj6ZN7L/heWci4OFbJ1AAQ4Iv6mYh
 vIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682251979; x=1684843979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6CFEB27xnVdVzEI62Flt6e1TPcC5Y7Hj3J4O8a2oNs=;
 b=SkjXqh9RlCTauHxgRq5n2tkmuWvnD655tEGRKIKPFEh+x+xWdpIXc8GLPycNjyr0zN
 tvVWWoYtdzummOrrAEUsbSoaj0wmIfyDmf3GjoI1fEsX48u0LkD9vNVfeiJ8ptaRUHRY
 u0UINmVLrN37bD3OCfOyt7N3/jaMWXyveQfCP3i1lMvFZ6BjWxkEddCw7dSbOyw1c1Xb
 ZOHdIyRLfl8CiKouv7M592rm4HNqVH1Y450UESvU4ujBSvzZ9XeM5p0L/XIh7ssoiWc4
 QU4axXHYuN1QURBw/Vvh+2BZ5slxdG4CZ0ddL6zwXJPTlOIk5GvzsdlUKHclX6+aephZ
 yjxw==
X-Gm-Message-State: AAQBX9dF87brJi+SMzJ4THL1SO2jx5vB158WiZpzTAn/aWGrSEtfh8Dw
 osfL5LpEC0HOKxy4hrhw3EaQ1idw9RQ=
X-Google-Smtp-Source: AKy350aV7Y3qxojQ8ut07O12d1kdEL+nfMyl42N9PB2EuYGoAfF2NGj/nUuy9peWZ/5OXSCH30XvqQ==
X-Received: by 2002:a05:6e02:34a0:b0:326:5b1b:3cc5 with SMTP id
 bp32-20020a056e0234a000b003265b1b3cc5mr3119124ilb.15.1682251978999; 
 Sun, 23 Apr 2023 05:12:58 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:b473:5d7c:4c2:75d7])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a02230b000000b00411a1373aa5sm1612155jau.155.2023.04.23.05.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 05:12:58 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 4/6] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
Date: Sun, 23 Apr 2023 07:12:30 -0500
Message-Id: <20230423121232.1345909-5-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423121232.1345909-1-aford173@gmail.com>
References: <20230423121232.1345909-1-aford173@gmail.com>
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
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 dario.binacchi@amarulasolutions.com, Adam Ford <aford173@gmail.com>
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
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5b6e7825b92f..f165483d5044 100644
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
 	.vco_min = 1050,
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
index a088d84579bc..25475d78adb3 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
 	u16 m_min;
 	u16 m_max;
 	u64 vco_min;
+	bool dynamic_dphy;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.39.2

