Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D44AEE82
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D9310E5CA;
	Wed,  9 Feb 2022 09:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAEA10E6A6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:54:01 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nHjfj-0002Op-EX; Wed, 09 Feb 2022 10:53:59 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nHjff-008qaW-Tx; Wed, 09 Feb 2022 10:53:55 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/23] drm/rockchip: dw_hdmi: rename vpll clock to
 reference clock
Date: Wed,  9 Feb 2022 10:53:30 +0100
Message-Id: <20220209095350.2104049-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209095350.2104049-1-s.hauer@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
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

"vpll" is a misnomer. A clock input to a device should be named after
the usage in the device, not after the clock that drives it. On the
rk3568 the same clock is driven by the HPLL.
To fix that, this patch renames the vpll clock to ref clock. The clock
name "vpll" is left for compatibility to old device trees.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 29 ++++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 8677c8271678..e352e0404f77 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -69,7 +69,7 @@ struct rockchip_hdmi {
 	struct regmap *regmap;
 	struct drm_encoder encoder;
 	const struct rockchip_hdmi_chip_data *chip_data;
-	struct clk *vpll_clk;
+	struct clk *ref_clk;
 	struct clk *grf_clk;
 	struct dw_hdmi *hdmi;
 	struct phy *phy;
@@ -196,14 +196,17 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 		return PTR_ERR(hdmi->regmap);
 	}
 
-	hdmi->vpll_clk = devm_clk_get(hdmi->dev, "vpll");
-	if (PTR_ERR(hdmi->vpll_clk) == -ENOENT) {
-		hdmi->vpll_clk = NULL;
-	} else if (PTR_ERR(hdmi->vpll_clk) == -EPROBE_DEFER) {
+	hdmi->ref_clk = devm_clk_get(hdmi->dev, "ref");
+	if (PTR_ERR(hdmi->ref_clk) == -ENOENT)
+		hdmi->ref_clk = devm_clk_get(hdmi->dev, "vpll");
+
+	if (PTR_ERR(hdmi->ref_clk) == -ENOENT) {
+		hdmi->ref_clk = NULL;
+	} else if (PTR_ERR(hdmi->ref_clk) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
-	} else if (IS_ERR(hdmi->vpll_clk)) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to get vpll clock\n");
-		return PTR_ERR(hdmi->vpll_clk);
+	} else if (IS_ERR(hdmi->ref_clk)) {
+		DRM_DEV_ERROR(hdmi->dev, "failed to get reference clock\n");
+		return PTR_ERR(hdmi->ref_clk);
 	}
 
 	hdmi->grf_clk = devm_clk_get(hdmi->dev, "grf");
@@ -257,7 +260,7 @@ static void dw_hdmi_rockchip_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
 
-	clk_set_rate(hdmi->vpll_clk, adj_mode->clock * 1000);
+	clk_set_rate(hdmi->ref_clk, adj_mode->clock * 1000);
 }
 
 static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
@@ -537,9 +540,9 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	ret = clk_prepare_enable(hdmi->vpll_clk);
+	ret = clk_prepare_enable(hdmi->ref_clk);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI vpll: %d\n",
+		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI reference clock: %d\n",
 			      ret);
 		return ret;
 	}
@@ -558,7 +561,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
 		drm_encoder_cleanup(encoder);
-		clk_disable_unprepare(hdmi->vpll_clk);
+		clk_disable_unprepare(hdmi->ref_clk);
 	}
 
 	return ret;
@@ -570,7 +573,7 @@ static void dw_hdmi_rockchip_unbind(struct device *dev, struct device *master,
 	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
 
 	dw_hdmi_unbind(hdmi->hdmi);
-	clk_disable_unprepare(hdmi->vpll_clk);
+	clk_disable_unprepare(hdmi->ref_clk);
 }
 
 static const struct component_ops dw_hdmi_rockchip_ops = {
-- 
2.30.2

