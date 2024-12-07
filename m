Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB19E8241
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 22:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF5A10E2E9;
	Sat,  7 Dec 2024 21:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZqFw/Mly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0E10E1DE
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 21:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733607172;
 bh=3vdTlN4cRw+aqmcuxQVAud96wTtNxo35Ghla9Zs1JVY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZqFw/Mlyp8xBLibspk69VS/PCUHouxZCE/U0IGOuUxCBGks4fLVlISBoGtUlEuA3T
 vbCIl3lMpnrb0OxsN8gguehxXbQybSd0MGezGp7JKqXt0upiZCmzRyR6ngj2OLCosE
 oW96fk9cZYt8c2Z7ulahCOf/c493NIBe/JgaU4vRjakeMmGpUnvy6NEcs2uIRjhHZL
 CZpf6UHtTpwz5bwEgK3VDtzg+taOwisvNt1zbk7wWW0k6vm1UA0cScv4VIZwndtDXj
 +8oCj1wB+sYzkfY2kdTXSk3za9V2i7hYuH7TWR1i3hPEz/juu5rlR1ogZOGv2/WYip
 y9HiZNXcM5YDg==
Received: from localhost (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 59BB417E3801;
 Sat,  7 Dec 2024 22:32:52 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 07 Dec 2024 23:32:24 +0200
Subject: [PATCH 1/4] drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1
 output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241207-rk3588-hdmi1-v1-1-ca3a99b46a40@collabora.com>
References: <20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com>
In-Reply-To: <20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide the basic support required to enable the second HDMI TX port
found on RK3588 SoC.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 119 ++++++++++++++++++++-----
 1 file changed, 96 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c8b362cc2b95fd490029a9c0552ad9fbc5631d17..c36fc130b73440c9e3f2098f408a5cdd2f58e8ef 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -28,20 +28,26 @@
 #define RK3588_GRF_SOC_CON2		0x0308
 #define RK3588_HDMI0_HPD_INT_MSK	BIT(13)
 #define RK3588_HDMI0_HPD_INT_CLR	BIT(12)
+#define RK3588_HDMI1_HPD_INT_MSK	BIT(15)
+#define RK3588_HDMI1_HPD_INT_CLR	BIT(14)
 #define RK3588_GRF_SOC_CON7		0x031c
 #define RK3588_SET_HPD_PATH_MASK	GENMASK(13, 12)
 #define RK3588_GRF_SOC_STATUS1		0x0384
 #define RK3588_HDMI0_LEVEL_INT		BIT(16)
+#define RK3588_HDMI1_LEVEL_INT		BIT(24)
 #define RK3588_GRF_VO1_CON3		0x000c
+#define RK3588_GRF_VO1_CON6		0x0018
 #define RK3588_SCLIN_MASK		BIT(9)
 #define RK3588_SDAIN_MASK		BIT(10)
 #define RK3588_MODE_MASK		BIT(11)
 #define RK3588_I2S_SEL_MASK		BIT(13)
 #define RK3588_GRF_VO1_CON9		0x0024
 #define RK3588_HDMI0_GRANT_SEL		BIT(10)
+#define RK3588_HDMI1_GRANT_SEL		BIT(12)
 
 #define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
 #define HOTPLUG_DEBOUNCE_MS		150
+#define MAX_HDMI_PORT_NUM		2
 
 struct rockchip_hdmi_qp {
 	struct device *dev;
@@ -53,6 +59,7 @@ struct rockchip_hdmi_qp {
 	struct phy *phy;
 	struct gpio_desc *enable_gpio;
 	struct delayed_work hpd_work;
+	int port_id;
 };
 
 static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
@@ -127,20 +134,24 @@ dw_hdmi_qp_rk3588_read_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	u32 val;
 
 	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &val);
+	val &= hdmi->port_id ? RK3588_HDMI1_LEVEL_INT : RK3588_HDMI0_LEVEL_INT;
 
-	return val & RK3588_HDMI0_LEVEL_INT ?
-		connector_status_connected : connector_status_disconnected;
+	return val ? connector_status_connected : connector_status_disconnected;
 }
 
 static void dw_hdmi_qp_rk3588_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
+	u32 val;
+
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_CLR,
+				    RK3588_HDMI1_HPD_INT_CLR | RK3588_HDMI1_HPD_INT_MSK);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR,
+				    RK3588_HDMI0_HPD_INT_CLR | RK3588_HDMI0_HPD_INT_MSK);
 
-	regmap_write(hdmi->regmap,
-		     RK3588_GRF_SOC_CON2,
-		     HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR,
-				   RK3588_HDMI0_HPD_INT_CLR |
-				   RK3588_HDMI0_HPD_INT_MSK));
+	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 }
 
 static const struct dw_hdmi_qp_phy_ops rk3588_hdmi_phy_ops = {
@@ -173,8 +184,12 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
 
 	if (intr_stat) {
-		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK,
-				    RK3588_HDMI0_HPD_INT_MSK);
+		if (hdmi->port_id)
+			val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK,
+					    RK3588_HDMI1_HPD_INT_MSK);
+		else
+			val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK,
+					    RK3588_HDMI0_HPD_INT_MSK);
 		regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 		return IRQ_WAKE_THREAD;
 	}
@@ -191,22 +206,44 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 	if (!intr_stat)
 		return IRQ_NONE;
 
-	val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR,
-			    RK3588_HDMI0_HPD_INT_CLR);
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_CLR,
+				    RK3588_HDMI1_HPD_INT_CLR);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR,
+				    RK3588_HDMI0_HPD_INT_CLR);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
 	mod_delayed_work(system_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
-	val |= HIWORD_UPDATE(0, RK3588_HDMI0_HPD_INT_MSK);
+	if (hdmi->port_id)
+		val |= HIWORD_UPDATE(0, RK3588_HDMI1_HPD_INT_MSK);
+	else
+		val |= HIWORD_UPDATE(0, RK3588_HDMI0_HPD_INT_MSK);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
 	return IRQ_HANDLED;
 }
 
+struct rockchip_hdmi_qp_cfg {
+	unsigned int num_ports;
+	unsigned int port_ids[MAX_HDMI_PORT_NUM];
+	const struct dw_hdmi_qp_phy_ops *phy_ops;
+};
+
+static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
+	.num_ports = 2,
+	.port_ids = {
+		0xfde80000,
+		0xfdea0000,
+	},
+	.phy_ops = &rk3588_hdmi_phy_ops,
+};
+
 static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
 	{ .compatible = "rockchip,rk3588-dw-hdmi-qp",
-	  .data = &rk3588_hdmi_phy_ops },
+	  .data = &rk3588_hdmi_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
@@ -219,11 +256,13 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		"ref" /* keep "ref" last */
 	};
 	struct platform_device *pdev = to_platform_device(dev);
+	const struct rockchip_hdmi_qp_cfg *cfg;
 	struct dw_hdmi_qp_plat_data plat_data;
 	struct drm_device *drm = data;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
+	struct resource *res;
 	struct clk *clk;
 	int ret, irq, i;
 	u32 val;
@@ -235,12 +274,31 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (!hdmi)
 		return -ENOMEM;
 
-	plat_data.phy_ops = of_device_get_match_data(dev);
-	if (!plat_data.phy_ops)
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
 		return -ENODEV;
 
-	plat_data.phy_data = hdmi;
 	hdmi->dev = &pdev->dev;
+	hdmi->port_id = -ENODEV;
+
+	/* Identify port ID by matching base IO address */
+	for (i = 0; i < cfg->num_ports; i++) {
+		if (res->start == cfg->port_ids[i]) {
+			hdmi->port_id = i;
+			break;
+		}
+	}
+	if (hdmi->port_id < 0) {
+		drm_err(hdmi, "Failed to match HDMI port ID\n");
+		return hdmi->port_id;
+	}
+
+	plat_data.phy_ops = cfg->phy_ops;
+	plat_data.phy_data = hdmi;
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
@@ -303,17 +361,26 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
 	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
 	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
-	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON3, val);
+	regmap_write(hdmi->vo_regmap,
+		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
+		     val);
 
 	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK,
 			    RK3588_SET_HPD_PATH_MASK);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
 
-	val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
-			    RK3588_HDMI0_GRANT_SEL);
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
+				    RK3588_HDMI1_GRANT_SEL);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
+				    RK3588_HDMI0_GRANT_SEL);
 	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
 
-	val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, RK3588_HDMI1_HPD_INT_MSK);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
 	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_qp_rk3588_hpd_work);
@@ -391,14 +458,20 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
 	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
 	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
-	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON3, val);
+	regmap_write(hdmi->vo_regmap,
+		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
+		     val);
 
 	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK,
 			    RK3588_SET_HPD_PATH_MASK);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
 
-	val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
-			    RK3588_HDMI0_GRANT_SEL);
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
+				    RK3588_HDMI1_GRANT_SEL);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
+				    RK3588_HDMI0_GRANT_SEL);
 	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);

-- 
2.47.0

