Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD094F8CA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 23:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53910E0DC;
	Mon, 12 Aug 2024 21:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="cJTtPUPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2672610E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 21:16:04 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723497354; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fe5ghwtv51cemKxyVgRl/vXMQod2fpTHlKYIKERrxurZ40OzRQ2i1dozxhBnorzV+3CWGGe3lUPlUz3UZ4xYiWJlV3mKATMZ0A/igzbTmTTglzW58Flo/qSxwNB1c75n/KzWmtDL0JgrNnh33JLqcKLRHVpYtxHYaNIuANlIf+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723497354;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aHF9Tj4CypcAqmtUd6j+cQ8jXeZOh8MZ6KG/LdEOBBI=; 
 b=N/m+8J6AsoIV84VpjSuoFqO3XAut/yMuJjL3xpd0063WMl5idiaD1zmZRZxpCYSVmyM15WaxpJ6M+g3IxkYIzNMSMcdfqLjCCewhg6+g8FVchE4szLh0lfoNJG85hwZx+WQ9GjJ9kZx4VsH0sikIxMlViRMtRKxf5/KGO/vrCjI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723497354; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=aHF9Tj4CypcAqmtUd6j+cQ8jXeZOh8MZ6KG/LdEOBBI=;
 b=cJTtPUPnMHFf3/R339ty5HqgZ8C3EuT4TxFeO7Dv9NDG78Sf5szz8LtZrs/3tu17
 3DaOYvz75UzyAqW5FhbYlhO9EvfsTDEj1dz0ILg3a/8SdmUaDunGOdzsZuNp7+qX2Ud
 fZucVdRGwySMbU+8Qn3yDas9hbpX54uZ/ewOx8dM=
Received: by mx.zohomail.com with SMTPS id 1723497352899890.4271470818969;
 Mon, 12 Aug 2024 14:15:52 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Aug 2024 00:15:10 +0300
Subject: [PATCH 3/4] drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-dw-hdmi-rockchip-cleanup-v1-3-b3e73b5f4fd6@collabora.com>
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

The regulators are only enabled at bind() and disabled at unbind(),
hence replace the boilerplate code by making use of
devm_regulator_get_enable() helper.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 34 +++++------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7d07039ef096..edfd877c98fc 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -77,8 +77,6 @@ struct rockchip_hdmi {
 	struct clk *ref_clk;
 	struct clk *grf_clk;
 	struct dw_hdmi *hdmi;
-	struct regulator *avdd_0v9;
-	struct regulator *avdd_1v8;
 	struct phy *phy;
 };
 
@@ -236,15 +234,13 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 		return ret;
 	}
 
-	hdmi->avdd_0v9 = devm_regulator_get(hdmi->dev, "avdd-0v9");
-	if (IS_ERR(hdmi->avdd_0v9))
-		return PTR_ERR(hdmi->avdd_0v9);
+	ret = devm_regulator_get_enable(hdmi->dev, "avdd-0v9");
+	if (ret)
+		return ret;
 
-	hdmi->avdd_1v8 = devm_regulator_get(hdmi->dev, "avdd-1v8");
-	if (IS_ERR(hdmi->avdd_1v8))
-		return PTR_ERR(hdmi->avdd_1v8);
+	ret = devm_regulator_get_enable(hdmi->dev, "avdd-1v8");
 
-	return 0;
+	return ret;
 }
 
 static enum drm_mode_status
@@ -602,18 +598,6 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	ret = regulator_enable(hdmi->avdd_0v9);
-	if (ret) {
-		drm_err(hdmi, "failed to enable avdd0v9: %d\n", ret);
-		goto err_avdd_0v9;
-	}
-
-	ret = regulator_enable(hdmi->avdd_1v8);
-	if (ret) {
-		drm_err(hdmi, "failed to enable avdd1v8: %d\n", ret);
-		goto err_avdd_1v8;
-	}
-
 	if (hdmi->chip_data == &rk3568_chip_data) {
 		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
 			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
@@ -642,10 +626,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 err_bind:
 	drm_encoder_cleanup(encoder);
-	regulator_disable(hdmi->avdd_1v8);
-err_avdd_1v8:
-	regulator_disable(hdmi->avdd_0v9);
-err_avdd_0v9:
+
 	return ret;
 }
 
@@ -656,9 +637,6 @@ static void dw_hdmi_rockchip_unbind(struct device *dev, struct device *master,
 
 	dw_hdmi_unbind(hdmi->hdmi);
 	drm_encoder_cleanup(&hdmi->encoder.encoder);
-
-	regulator_disable(hdmi->avdd_1v8);
-	regulator_disable(hdmi->avdd_0v9);
 }
 
 static const struct component_ops dw_hdmi_rockchip_ops = {

-- 
2.46.0

