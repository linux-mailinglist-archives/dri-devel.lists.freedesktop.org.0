Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755F49CD21
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE3710E761;
	Wed, 26 Jan 2022 14:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27510E676
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:58:24 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nCjkc-0005fZ-An; Wed, 26 Jan 2022 15:58:22 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nCjka-002l7I-SX; Wed, 26 Jan 2022 15:58:20 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/27] clk: rk3568: Add CLK_SET_RATE_PARENT to the HDMI
 reference clock
Date: Wed, 26 Jan 2022 15:55:47 +0100
Message-Id: <20220126145549.617165-26-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220126145549.617165-1-s.hauer@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the rk3568 we have this (simplified) situation:

 .--------.     .-----.    .---------.
-| hpll   |--.--| /n  |----|dclk_vop0|-
 `--------´  |  `-----´    `---------´
             |  .-----.    .---------.
             `--| /m  |----|dclk_vop1|-
             |  `-----´    `---------´
             |             .---------.
             `-------------|hdmi_ref |-
                           `---------´

For the HDMI to work the HDMI reference clock needs to be the same as the
pixel clock which means the dividers have be set to one. The last patch removed
the CLK_SET_RATE_PARENT flag from the pixel clocks which means the hpll is not
changed on pixel clock changes. In order to allow the HDMI controller to
set a suitable PLL rate we now add the CLK_SET_RATE_PARENT flag to the
HDMI reference clock. With this the flow becomes:

1) HDMI controller driver sets the rate to its pixel clock which means
   hpll is set to the pixel clock
2) VOP2 driver sets dclk_vop[012] to the pixel clock. As this can't change
   the hpll clock anymore this means only the divider is adjusted to the
   desired value of dividing by one.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/rockchip/clk-rk3568.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 7687c62d1fa8..63dfbeeeb06d 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1568,7 +1568,7 @@ static struct rockchip_clk_branch rk3568_clk_pmu_branches[] __initdata = {
 			RK3568_PMU_CLKGATE_CON(2), 14, GFLAGS),
 	GATE(XIN_OSC0_EDPPHY_G, "xin_osc0_edpphy_g", "xin24m", 0,
 			RK3568_PMU_CLKGATE_CON(2), 15, GFLAGS),
-	MUX(CLK_HDMI_REF, "clk_hdmi_ref", clk_hdmi_ref_p, 0,
+	MUX(CLK_HDMI_REF, "clk_hdmi_ref", clk_hdmi_ref_p, CLK_SET_RATE_PARENT,
 			RK3568_PMU_CLKSEL_CON(8), 7, 1, MFLAGS),
 };
 
-- 
2.30.2

