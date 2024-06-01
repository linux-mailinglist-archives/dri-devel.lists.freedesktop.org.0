Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06D8D7001
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF40710E146;
	Sat,  1 Jun 2024 13:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cf/VMEc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B5710E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247588;
 bh=0mW6zv2jpAmRuypZFslsUiSyUNREn50t/X59nw2jtlk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cf/VMEc21qNfU/WJBTBmLHBqbcmqRVYS3RqH/qBXMu/Jd0qvqOzr6B4CR/J60+wqo
 a1iMFSndDV25HVl8B1DS0yV6D450GHob8ZEy/zlWCJBOQDkPAo+26fDQV/iVlFwVmc
 8iHoW2KwxhZb/rSET3hnj5mC3xliStZ5NwcT9R+9YLj9uDfUd8bzctJjIYCr1j5wda
 EdmjQ8Y1JF88WJtLC+ZMwj4HZYkR0C6WW67L6OHirk1+Elp2buheqDSdl4ZcztUIY2
 92Hu+CBXNxDUve2tBZseTjUCwFtc1e10LSGTddV1tuhUAsIKUlNYXW8s0GWAUpC6By
 iav1evuE2BqNQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E73637821F0;
 Sat,  1 Jun 2024 13:13:08 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:30 +0300
Subject: [PATCH 08/14] drm/rockchip: dw_hdmi: Use modern drm_device based
 logging
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-8-f6203753232b@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14-dev-f7c49
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

Prefer drm_{err|info|dbg}() over deprecated DRM_DEV_{ERROR|INFO|DEBUG}()
logging macros.

Conversion done with the help of the following semantic patch, followed
by a few minor indentation adjustments:

@@
identifier T;
@@

(
-DRM_DEV_ERROR(T->dev,
+drm_err(T,
...)
|
-DRM_DEV_INFO(T->dev,
+drm_info(T,
...)
|
-DRM_DEV_DEBUG(T->dev,
+drm_dbg(T,
...)
)

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index fe33092abbe7..2509ce19313f 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -212,7 +212,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get rockchip,grf\n");
+		drm_err(hdmi, "Unable to get rockchip,grf\n");
 		return PTR_ERR(hdmi->regmap);
 	}
 
@@ -223,7 +223,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	if (PTR_ERR(hdmi->ref_clk) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
 	} else if (IS_ERR(hdmi->ref_clk)) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to get reference clock\n");
+		drm_err(hdmi, "failed to get reference clock\n");
 		return PTR_ERR(hdmi->ref_clk);
 	}
 
@@ -233,7 +233,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	} else if (PTR_ERR(hdmi->grf_clk) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
 	} else if (IS_ERR(hdmi->grf_clk)) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to get grf clock\n");
+		drm_err(hdmi, "failed to get grf clock\n");
 		return PTR_ERR(hdmi->grf_clk);
 	}
 
@@ -322,17 +322,16 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
 
 	ret = clk_prepare_enable(hdmi->grf_clk);
 	if (ret < 0) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to enable grfclk %d\n", ret);
+		drm_err(hdmi, "failed to enable grfclk %d\n", ret);
 		return;
 	}
 
 	ret = regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val);
 	if (ret != 0)
-		DRM_DEV_ERROR(hdmi->dev, "Could not write to GRF: %d\n", ret);
+		drm_err(hdmi, "Could not write to GRF: %d\n", ret);
 
 	clk_disable_unprepare(hdmi->grf_clk);
-	DRM_DEV_DEBUG(hdmi->dev, "vop %s output to hdmi\n",
-		      ret ? "LIT" : "BIG");
+	drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
 }
 
 static int
@@ -592,7 +591,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	ret = rockchip_hdmi_parse_dt(hdmi);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(hdmi->dev, "Unable to parse OF data\n");
+			drm_err(hdmi, "Unable to parse OF data\n");
 		return ret;
 	}
 
@@ -600,26 +599,25 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
 		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(hdmi->dev, "failed to get phy\n");
+			drm_err(hdmi, "failed to get phy\n");
 		return ret;
 	}
 
 	ret = regulator_enable(hdmi->avdd_0v9);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to enable avdd0v9: %d\n", ret);
+		drm_err(hdmi, "failed to enable avdd0v9: %d\n", ret);
 		goto err_avdd_0v9;
 	}
 
 	ret = regulator_enable(hdmi->avdd_1v8);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to enable avdd1v8: %d\n", ret);
+		drm_err(hdmi, "failed to enable avdd1v8: %d\n", ret);
 		goto err_avdd_1v8;
 	}
 
 	ret = clk_prepare_enable(hdmi->ref_clk);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI reference clock: %d\n",
-			      ret);
+		drm_err(hdmi, "Failed to enable HDMI reference clock: %d\n", ret);
 		goto err_clk;
 	}
 

-- 
2.45.0

