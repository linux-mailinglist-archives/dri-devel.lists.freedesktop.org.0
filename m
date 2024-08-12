Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824A94F8C8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 23:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549010E0CD;
	Mon, 12 Aug 2024 21:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="JbZ4MY2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5EB10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 21:15:55 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723497344; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=b68lUKwpnjB/+7YqIHIz5YzlCpeCV9JHwdHmlKNmW5XOVH/5TAgLADPvCtsKyV5IdEIZ53XOWStXLJlPunPyUNtAT5PuRi01gXs+iZYT52z6BUUiVR/wWUo6QLRTbOyrv8sxw/n055dlZivmDS+BOou01bwsW4r17GCy48rMEKI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723497344;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IXtCWW++4oKOuR0XGctguunjoFu5Fw/5NafoAGB0Owg=; 
 b=XlcYPI9Jdi6o9OcOSdlixeuMzNQF+PGelN1M1S0m/xOU+tzg705Ek+X6KJ5jWcnLyjQa8qpM0bjKjpgYf5PvhRY6j4KNaMxzBpTM6eatzlgJg/tGwFv6sYKjtcmfZfm1nPS9kzg0CYuejkg6r7PR6y38u4wGfgA3Pqi2wgCYvB0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723497344; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=IXtCWW++4oKOuR0XGctguunjoFu5Fw/5NafoAGB0Owg=;
 b=JbZ4MY2xa/NXZ/w497R+qYaoPAua9F3a+mjjfAYO0cClZV92QR6S0nWwyb2Kiu4q
 IX0L41+8XtT6hNlak4+RCdr9vNk7RWmx3b8FotBn4E5HBNSOjInJR7AnrZWhD1o/WER
 rlOnmWj8AhjDzHx3Zn5wbQJ8C3Hs++1NIhKajYas=
Received: by mx.zohomail.com with SMTPS id 1723497343350386.70115570233713;
 Mon, 12 Aug 2024 14:15:43 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Aug 2024 00:15:08 +0300
Subject: [PATCH 1/4] drm/rockchip: dw_hdmi: Use modern drm_device based logging
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-dw-hdmi-rockchip-cleanup-v1-1-b3e73b5f4fd6@collabora.com>
References: <20240813-dw-hdmi-rockchip-cleanup-v1-0-b3e73b5f4fd6@collabora.com>
In-Reply-To: <20240813-dw-hdmi-rockchip-cleanup-v1-0-b3e73b5f4fd6@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
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
2.46.0

