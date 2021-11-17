Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A9245558C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB426EAAB;
	Thu, 18 Nov 2021 07:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BCD6E334
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:34:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0e-0005td-FR; Wed, 17 Nov 2021 15:34:00 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0b-001P6H-2C; Wed, 17 Nov 2021 15:33:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] drm/rockchip: dw_hdmi: add regulator support
Date: Wed, 17 Nov 2021 15:33:39 +0100
Message-Id: <20211117143347.314294-5-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117143347.314294-1-s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RK3568 has HDMI_TX_AVDD0V9 and HDMI_TX_AVDD_1V8 supply inputs needed
for the HDMI port. add support for these to the driver for boards which
have them supplied by switchable regulators.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../display/rockchip/rockchip,dw-hdmi.yaml    |  6 ++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   | 58 ++++++++++++++++++-
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 53fa42479d5b7..293b2cfbf739f 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -28,6 +28,12 @@ properties:
   reg-io-width:
     const: 4
 
+  avdd-0v9-supply:
+    description: A 0.9V supply that powers up the SoC internal circuitry.
+
+  avdd-1v8-supply:
+    description: A 0.9V supply that powers up the SoC internal circuitry.
+
   clocks:
     minItems: 2
     items:
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 29608c25e2d0e..b8fe56c89cdc9 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_edid.h>
@@ -83,6 +84,8 @@ struct rockchip_hdmi {
 	struct clk *vpll_clk;
 	struct clk *grf_clk;
 	struct dw_hdmi *hdmi;
+	struct regulator *avdd_0v9;
+	struct regulator *avdd_1v8;
 	struct phy *phy;
 };
 
@@ -222,6 +225,22 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	hdmi->vpll_clk = hdmi->clks[RK_HDMI_CLK_VPLL].clk;
 	hdmi->grf_clk = hdmi->clks[RK_HDMI_CLK_GRF].clk;
 
+	hdmi->avdd_0v9 = devm_regulator_get_optional(hdmi->dev, "avdd-0v9");
+	if (IS_ERR(hdmi->avdd_0v9)) {
+		if (PTR_ERR(hdmi->avdd_0v9) != -ENODEV)
+			return PTR_ERR(hdmi->avdd_0v9);
+
+		hdmi->avdd_0v9 = NULL;
+	}
+
+	hdmi->avdd_1v8 = devm_regulator_get_optional(hdmi->dev, "avdd-1v8");
+	if (IS_ERR(hdmi->avdd_1v8)) {
+		if (PTR_ERR(hdmi->avdd_1v8) != -ENODEV)
+			return PTR_ERR(hdmi->avdd_1v8);
+
+		hdmi->avdd_1v8 = NULL;
+	}
+
 	return 0;
 }
 
@@ -559,11 +578,27 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
+	if (hdmi->avdd_0v9) {
+		ret = regulator_enable(hdmi->avdd_0v9);
+		if (ret) {
+			DRM_DEV_ERROR(hdmi->dev, "failed to enable avdd0v9: %d\n", ret);
+			goto err_avdd_0v9;
+		}
+	}
+
+	if (hdmi->avdd_1v8) {
+		ret = regulator_enable(hdmi->avdd_1v8);
+		if (ret) {
+			DRM_DEV_ERROR(hdmi->dev, "failed to enable avdd1v8: %d\n", ret);
+			goto err_avdd_1v8;
+		}
+	}
+
 	ret = clk_bulk_prepare_enable(RK_HDMI_NCLOCKS_HDMI, hdmi->clks);
 	if (ret) {
 		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI vpll: %d\n",
 			      ret);
-		return ret;
+		goto err_clk;
 	}
 
 	if (hdmi->chip_data == &rk3568_chip_data) {
@@ -587,10 +622,21 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	 */
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
-		drm_encoder_cleanup(encoder);
-		clk_bulk_disable_unprepare(RK_HDMI_NCLOCKS_HDMI, hdmi->clks);
+		goto err_bind;
 	}
 
+	return 0;
+
+err_bind:
+	clk_bulk_disable_unprepare(RK_HDMI_NCLOCKS_HDMI, hdmi->clks);
+	drm_encoder_cleanup(encoder);
+err_clk:
+	if (hdmi->avdd_1v8)
+		regulator_disable(hdmi->avdd_1v8);
+err_avdd_1v8:
+	if (hdmi->avdd_0v9)
+		regulator_disable(hdmi->avdd_0v9);
+err_avdd_0v9:
 	return ret;
 }
 
@@ -601,6 +647,12 @@ static void dw_hdmi_rockchip_unbind(struct device *dev, struct device *master,
 
 	dw_hdmi_unbind(hdmi->hdmi);
 	clk_bulk_disable_unprepare(RK_HDMI_NCLOCKS_HDMI, hdmi->clks);
+
+	if (hdmi->avdd_1v8)
+		regulator_disable(hdmi->avdd_1v8);
+
+	if (hdmi->avdd_0v9)
+		regulator_disable(hdmi->avdd_0v9);
 }
 
 static const struct component_ops dw_hdmi_rockchip_ops = {
-- 
2.30.2

