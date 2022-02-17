Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452BE4B9B13
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEAF10EAF3;
	Thu, 17 Feb 2022 08:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D245610EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:30:08 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKcAw-0002E7-8Q; Thu, 17 Feb 2022 09:30:06 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nKcAp-00ClT7-S9; Thu, 17 Feb 2022 09:29:59 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 09/23] drm/rockchip: dw_hdmi: Add support for hclk
Date: Thu, 17 Feb 2022 09:29:40 +0100
Message-Id: <20220217082954.2967889-10-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217082954.2967889-1-s.hauer@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
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

The rk3568 HDMI has an additional clock that needs to be enabled for the
HDMI controller to work. The purpose of that clock is not clear. It is
named "hclk" in the downstream driver, so use the same name.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v5:
    - Use devm_clk_get_optional rather than devm_clk_get

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 11acd4668ebef..45f66fd613a6d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -76,6 +76,7 @@ struct rockchip_hdmi {
 	const struct rockchip_hdmi_chip_data *chip_data;
 	struct clk *ref_clk;
 	struct clk *grf_clk;
+	struct clk *hclk_clk;
 	struct dw_hdmi *hdmi;
 	struct regulator *avdd_0v9;
 	struct regulator *avdd_1v8;
@@ -231,6 +232,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 		return PTR_ERR(hdmi->grf_clk);
 	}
 
+	hdmi->hclk_clk = devm_clk_get_optional(hdmi->dev, "hclk");
+	if (PTR_ERR(hdmi->hclk_clk) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(hdmi->hclk_clk)) {
+		DRM_DEV_ERROR(hdmi->dev, "failed to get hclk_clk clock\n");
+		return PTR_ERR(hdmi->hclk_clk);
+	}
+
 	hdmi->avdd_0v9 = devm_regulator_get(hdmi->dev, "avdd-0v9");
 	if (IS_ERR(hdmi->avdd_0v9))
 		return PTR_ERR(hdmi->avdd_0v9);
@@ -598,6 +607,13 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		goto err_clk;
 	}
 
+	ret = clk_prepare_enable(hdmi->hclk_clk);
+	if (ret) {
+		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI hclk clock: %d\n",
+			      ret);
+		goto err_clk;
+	}
+
 	if (hdmi->chip_data == &rk3568_chip_data) {
 		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
 			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
-- 
2.30.2

