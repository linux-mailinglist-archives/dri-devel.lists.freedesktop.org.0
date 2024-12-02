Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67EA9E0D01
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 21:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCDD10E1D4;
	Mon,  2 Dec 2024 20:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PkhjGQyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C7710E1D4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733171298;
 bh=rBKYTLNDOW58j3hrrUdo0WdSxf4pv9UIQrcg23u2TeI=;
 h=From:Date:Subject:To:Cc:From;
 b=PkhjGQyJ4/Fevt7ZCrl+pKRnMo03LMwldD/4TjcRFA64a1e+Yanmovbl+JYFnmBEB
 Kcy403oV5TKa8+BiYZk4GjmpZK+9znodpZku2DRXsy7PCG2GDIhvo1ZOw5R5N8w+oj
 nzkes2CoQicHSXlYjx7IY+O7WLgaJkLTQzLqXoT66xwhiy7B5rIwMZhKo+0+aaeyW0
 mLf1wG+dg4PwxWhMCJv3iLBPE8cl2kh3qL+ooG7jwX28NPsHqUCrqJT5L2HLSqHauV
 VKPBCRpeK7r95320h6FmGV0BT3zgvn/a1xNDHNFPFjfVvpm5IemPeSH1JegTYLUxY/
 ywJbbG9T/GmEg==
Received: from localhost (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A3D4D17E37E4;
 Mon,  2 Dec 2024 21:28:18 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 02 Dec 2024 22:27:34 +0200
Subject: [PATCH] drm/rockchip: dw_hdmi_qp: Simplify clock handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dw-hdmi-qp-rk-clk-bulk-v1-1-60a7cc9cd74e@collabora.com>
X-B4-Tracking: v=1; b=H4sIADUYTmcC/x2MSQqAMAwAvyI5G2irgvgV8aBttMG9xQXEvxu8D
 Mxh5oFIgSlClTwQ6OTI6yKi0wSsb5eBkJ04GGVyLUB3oXcz475hGNFOI3aHIHN9q3RhqNQ5SLw
 F6vn+x3Xzvh9C6epiaAAAAA==
X-Change-ID: 20241202-dw-hdmi-qp-rk-clk-bulk-3dfa0152e814
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Make use of the recently introduced devm_clk_bulk_get_all_enabled()
helper to simplify the code a bit.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c8b362cc2b95fd490029a9c0552ad9fbc5631d17..20ecc0729db9f5e321041ae7b3349bff5246a926 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -214,17 +214,13 @@ MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
 static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				    void *data)
 {
-	static const char * const clk_names[] = {
-		"pclk", "earc", "aud", "hdp", "hclk_vo1",
-		"ref" /* keep "ref" last */
-	};
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dw_hdmi_qp_plat_data plat_data;
 	struct drm_device *drm = data;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
-	struct clk *clk;
+	struct clk_bulk_data *clks;
 	int ret, irq, i;
 	u32 val;
 
@@ -270,18 +266,22 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return PTR_ERR(hdmi->vo_regmap);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(clk_names); i++) {
-		clk = devm_clk_get_enabled(hdmi->dev, clk_names[i]);
+	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
+	if (ret < 0) {
+		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
+		return ret;
+	}
 
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			if (ret != -EPROBE_DEFER)
-				drm_err(hdmi, "Failed to get %s clock: %d\n",
-					clk_names[i], ret);
-			return ret;
+	for (i = 0; i < ret; i++) {
+		if (!strcmp(clks[i].id, "ref")) {
+			hdmi->ref_clk = clks[1].clk;
+			break;
 		}
 	}
-	hdmi->ref_clk = clk;
+	if (!hdmi->ref_clk) {
+		drm_err(hdmi, "Missing ref clock\n");
+		return -EINVAL;
+	}
 
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-dw-hdmi-qp-rk-clk-bulk-3dfa0152e814

