Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65E2660B4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483526EA5C;
	Fri, 11 Sep 2020 13:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4009E6EA57
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:54:22 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kGjVK-0007wT-4G; Fri, 11 Sep 2020 15:54:20 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kGjVH-00FKne-Lw; Fri, 11 Sep 2020 15:54:15 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Fri, 11 Sep 2020 15:54:03 +0200
Message-Id: <20200911135413.3654800-7-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL,UPPERCASE_50_75 autolearn=no
 autolearn_force=no version=3.4.2
Subject: [PATCH v2 06/16] drm/exynos: shift register values to fields on write
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, narmstrong@baylibre.com,
 sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>,
 krzk@kernel.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The phy timings are already shifted to the field position. If the driver
is reused on multiple platforms, this exposes the field positions to the
platform code.

Store only the timing values in the platform data and shift the value to
the field when writing the fields to the registers.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2: none
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 88 +++++++++++++------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 41000214a5fe..0f2cac7ed944 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -399,54 +399,54 @@ static const unsigned int reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
 	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x0af),
+	[PHYCTRL_ULPS_EXIT] = 0x0af,
 	[PHYCTRL_VREG_LP] = 0,
 	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
-	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
-	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
-	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x27),
-	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
-	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
-	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x09),
-	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
-	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
+	[PHYTIMING_LPX] = 0x06,
+	[PHYTIMING_HS_EXIT] = 0x0b,
+	[PHYTIMING_CLK_PREPARE] = 0x07,
+	[PHYTIMING_CLK_ZERO] = 0x27,
+	[PHYTIMING_CLK_POST] = 0x0d,
+	[PHYTIMING_CLK_TRAIL] = 0x08,
+	[PHYTIMING_HS_PREPARE] = 0x09,
+	[PHYTIMING_HS_ZERO] = 0x0d,
+	[PHYTIMING_HS_TRAIL] = 0x0b,
 };
 
 static const unsigned int exynos5422_reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
 	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0xaf),
+	[PHYCTRL_ULPS_EXIT] = 0xaf,
 	[PHYCTRL_VREG_LP] = 0,
 	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x08),
-	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0d),
-	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
-	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x30),
-	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
-	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x0a),
-	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0c),
-	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x11),
-	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0d),
+	[PHYTIMING_LPX] = 0x08,
+	[PHYTIMING_HS_EXIT] = 0x0d,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x30,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x0a,
+	[PHYTIMING_HS_PREPARE] = 0x0c,
+	[PHYTIMING_HS_ZERO] = 0x11,
+	[PHYTIMING_HS_TRAIL] = 0x0d,
 };
 
 static const unsigned int exynos5433_reg_values[] = {
 	[RESET_TYPE] = DSIM_FUNCRST,
 	[PLL_TIMER] = 22200,
 	[STOP_STATE_CNT] = 0xa,
-	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x190),
-	[PHYCTRL_VREG_LP] = DSIM_PHYCTRL_B_DPHYCTL_VREG_LP,
-	[PHYCTRL_SLEW_UP] = DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP,
-	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x07),
-	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0c),
-	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
-	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x2d),
-	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
-	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x09),
-	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0b),
-	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x10),
-	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
+	[PHYCTRL_ULPS_EXIT] = 0x190,
+	[PHYCTRL_VREG_LP] = 1,
+	[PHYCTRL_SLEW_UP] = 1,
+	[PHYTIMING_LPX] = 0x07,
+	[PHYTIMING_HS_EXIT] = 0x0c,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x2d,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x09,
+	[PHYTIMING_HS_PREPARE] = 0x0b,
+	[PHYTIMING_HS_ZERO] = 0x10,
+	[PHYTIMING_HS_TRAIL] = 0x0c,
 };
 
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
@@ -698,8 +698,11 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 		return;
 
 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
-	reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
-		reg_values[PHYCTRL_SLEW_UP];
+	reg = DSIM_PHYCTRL_ULPS_EXIT(reg_values[PHYCTRL_ULPS_EXIT]);
+	if (reg_values[PHYCTRL_VREG_LP])
+		reg |= DSIM_PHYCTRL_B_DPHYCTL_VREG_LP;
+	if (reg_values[PHYCTRL_SLEW_UP])
+		reg |= DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP;
 	exynos_dsi_write(dsi, DSIM_PHYCTRL_REG, reg);
 
 	/*
@@ -707,7 +710,8 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
 	 *	burst
 	 */
-	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
+	reg = DSIM_PHYTIMING_LPX(reg_values[PHYTIMING_LPX]) |
+		DSIM_PHYTIMING_HS_EXIT(reg_values[PHYTIMING_HS_EXIT]);
 	exynos_dsi_write(dsi, DSIM_PHYTIMING_REG, reg);
 
 	/*
@@ -723,11 +727,10 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
 	 *	the last payload clock bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_CLK_PREPARE] |
-		reg_values[PHYTIMING_CLK_ZERO] |
-		reg_values[PHYTIMING_CLK_POST] |
-		reg_values[PHYTIMING_CLK_TRAIL];
-
+	reg = DSIM_PHYTIMING1_CLK_PREPARE(reg_values[PHYTIMING_CLK_PREPARE]) |
+		DSIM_PHYTIMING1_CLK_ZERO(reg_values[PHYTIMING_CLK_ZERO]) |
+		DSIM_PHYTIMING1_CLK_POST(reg_values[PHYTIMING_CLK_POST]) |
+		DSIM_PHYTIMING1_CLK_TRAIL(reg_values[PHYTIMING_CLK_TRAIL]);
 	exynos_dsi_write(dsi, DSIM_PHYTIMING1_REG, reg);
 
 	/*
@@ -739,8 +742,9 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
 	 *	state after last payload data bit of a HS transmission burst
 	 */
-	reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
-		reg_values[PHYTIMING_HS_TRAIL];
+	reg = DSIM_PHYTIMING2_HS_PREPARE(reg_values[PHYTIMING_HS_PREPARE]) |
+		DSIM_PHYTIMING2_HS_ZERO(reg_values[PHYTIMING_HS_ZERO]) |
+		DSIM_PHYTIMING2_HS_TRAIL(reg_values[PHYTIMING_HS_TRAIL]);
 	exynos_dsi_write(dsi, DSIM_PHYTIMING2_REG, reg);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
