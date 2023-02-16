Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EBE699118
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E31810ED0C;
	Thu, 16 Feb 2023 10:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC22510ED0C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:24:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pSbRd-0001Ql-Od; Thu, 16 Feb 2023 11:24:53 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pSbRY-005Kiz-NN; Thu, 16 Feb 2023 11:24:49 +0100
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pSbRY-002Sfh-QC; Thu, 16 Feb 2023 11:24:48 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/4] drm/rockchip: dw_hdmi: relax mode_valid hook
Date: Thu, 16 Feb 2023 11:24:45 +0100
Message-Id: <20230216102447.582905-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216102447.582905-1-s.hauer@pengutronix.de>
References: <20230216102447.582905-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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
Cc: Dan Johansen <strit@manjaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver checks if the pixel clock of the given mode matches an entry
in the mpll config table. At least for the Synopsys phy the frequencies
in the mpll table are meant as a frequency range up to which the entry
works, not as a frequency that must match the pixel clock. Return
MODE_OK when the pixelclock is smaller than one of the mpll frequencies
to allow for more display resolutions.
Limit this behaviour to the Synopsys phy at the moment and keep the
current behaviour of forcing exact pixelclock rates for the other phys
until it has been sorted out how and if the vendor specific phys work
with non standard clock rates.

Tested-by: Michael Riesch <michael.riesch@wolfvision.net>
Link: https://lore.kernel.org/r/20220926080435.259617-2-s.hauer@pengutronix.de
Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Tested-by: Dan Johansen <strit@manjaro.org>
Link: https://lore.kernel.org/r/20230118132213.2911418-2-s.hauer@pengutronix.de
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 26 +++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 2f4b8f64cbad3..7d8bf292fedce 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -74,6 +74,7 @@ struct rockchip_hdmi {
 	struct regmap *regmap;
 	struct rockchip_encoder encoder;
 	const struct rockchip_hdmi_chip_data *chip_data;
+	const struct dw_hdmi_plat_data *plat_data;
 	struct clk *ref_clk;
 	struct clk *grf_clk;
 	struct dw_hdmi *hdmi;
@@ -241,23 +242,32 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 }
 
 static enum drm_mode_status
-dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
+dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode)
 {
+	struct rockchip_hdmi *hdmi = data;
 	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
 	int pclk = mode->clock * 1000;
-	bool valid = false;
+	bool exact_match = hdmi->plat_data->phy_force_vendor;
 	int i;
 
 	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
-		if (pclk == mpll_cfg[i].mpixelclock) {
-			valid = true;
-			break;
-		}
+		/*
+		 * For vendor specific phys force an exact match of the pixelclock
+		 * to preserve the original behaviour of the driver.
+		 */
+		if (exact_match && pclk == mpll_cfg[i].mpixelclock)
+			return MODE_OK;
+		/*
+		 * The Synopsys phy can work with pixelclocks up to the value given
+		 * in the corresponding mpll_cfg entry.
+		 */
+		if (!exact_match && pclk <= mpll_cfg[i].mpixelclock)
+			return MODE_OK;
 	}
 
-	return (valid) ? MODE_OK : MODE_BAD;
+	return MODE_BAD;
 }
 
 static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
@@ -546,8 +556,10 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 
 	hdmi->dev = &pdev->dev;
+	hdmi->plat_data = plat_data;
 	hdmi->chip_data = plat_data->phy_data;
 	plat_data->phy_data = hdmi;
+	plat_data->priv_data = hdmi;
 	encoder = &hdmi->encoder.encoder;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-- 
2.30.2

