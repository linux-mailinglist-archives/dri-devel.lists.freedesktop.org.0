Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EECAFF372
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 23:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E4110E863;
	Wed,  9 Jul 2025 21:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rz4faA4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FEB10E863
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752094895;
 bh=WdXIZNuTvyx1CD2BBHBXvl+8DQ7UTjvdIVCL2zLA3i8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Rz4faA4TVP2f7mHCpwUiBHFd9/1gTQTfZophWgVvr6WTKML+gq+3oJC19LFr9S1ah
 QvOjPj+6bX3gWq8KuzHSJ6zp07Z/sIV4WIJbX/n5cV0Aw+VmrOf+mQCJwFyKMMLD6z
 s7l3y5J1Yx7B24m6fgguLoHzry4DdpgqoTFBWjRrwXXTH9pngcjqhk0DftKrHwXEx9
 1bhPH4TKxGPXR7C/+KL8fQ5LhyMKy94mK0YLZcM5XuhQSzUs+bS6IycPppi2q9XiZQ
 wvcGVF7z6slHp4aDKpnYnTNMWkXFYUQu90DgQerSjoplF5W7fLB+zjjRCOWoO73rEt
 761gy+Xg7uHFg==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 8C45C17E0456;
 Wed,  9 Jul 2025 23:01:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 10 Jul 2025 00:01:14 +0300
Subject: [PATCH v2 3/6] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rk3588-hdmi-cec-v2-3-f5884be34bc1@collabora.com>
References: <20250710-rk3588-hdmi-cec-v2-0-f5884be34bc1@collabora.com>
In-Reply-To: <20250710-rk3588-hdmi-cec-v2-0-f5884be34bc1@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
i.e. in some cases the error code is not included in the message, while
in some other cases there is no check for -EPROBE_DEFER.

Since this is part of the probe path, address the aforementioned issues
by switching to dev_err_probe(), which also reduces the code a bit.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 62 ++++++++++----------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7d531b6f4c098c6c548788dad487ce4613a2f32b..4e7794aa2dded4c124963eaa7f5158bde9bbbdb6 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return -ENODEV;
 
 	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
-	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
-		dev_err(dev, "Missing platform ctrl ops\n");
-		return -ENODEV;
-	}
+	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
+		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
 
 	hdmi->ctrl_ops = cfg->ctrl_ops;
 	hdmi->dev = &pdev->dev;
@@ -473,10 +471,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 			break;
 		}
 	}
-	if (hdmi->port_id < 0) {
-		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
-		return hdmi->port_id;
-	}
+	if (hdmi->port_id < 0)
+		return dev_err_probe(hdmi->dev, hdmi->port_id,
+				     "Failed to match HDMI port ID\n");
 
 	plat_data.phy_ops = cfg->phy_ops;
 	plat_data.phy_data = hdmi;
@@ -497,39 +494,30 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 						       "rockchip,grf");
-	if (IS_ERR(hdmi->regmap)) {
-		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
-		return PTR_ERR(hdmi->regmap);
-	}
+	if (IS_ERR(hdmi->regmap))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->regmap),
+				     "Unable to get rockchip,grf\n");
 
 	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 							  "rockchip,vo-grf");
-	if (IS_ERR(hdmi->vo_regmap)) {
-		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
-		return PTR_ERR(hdmi->vo_regmap);
-	}
+	if (IS_ERR(hdmi->vo_regmap))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->vo_regmap),
+				     "Unable to get rockchip,vo-grf\n");
 
 	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
-	if (ret < 0) {
-		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
 
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(hdmi->enable_gpio)) {
-		ret = PTR_ERR(hdmi->enable_gpio);
-		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(hdmi->enable_gpio))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->enable_gpio),
+				     "Failed to request enable GPIO\n");
 
 	hdmi->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
-	if (IS_ERR(hdmi->phy)) {
-		ret = PTR_ERR(hdmi->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(hdmi->phy))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->phy),
+				     "Failed to get phy\n");
 
 	cfg->ctrl_ops->io_init(hdmi);
 
@@ -558,17 +546,15 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi)) {
-		ret = PTR_ERR(hdmi->hdmi);
 		drm_encoder_cleanup(encoder);
-		return ret;
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
+				     "Failed to bind dw-hdmi-qp");
 	}
 
 	connector = drm_bridge_connector_init(drm, encoder);
-	if (IS_ERR(connector)) {
-		ret = PTR_ERR(connector);
-		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(connector))
+		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
+				     "Failed to init bridge connector\n");
 
 	return drm_connector_attach_encoder(connector, encoder);
 }

-- 
2.50.0

