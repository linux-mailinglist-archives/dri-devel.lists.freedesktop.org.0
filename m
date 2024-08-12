Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D408C94F8C9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 23:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527FF10E166;
	Mon, 12 Aug 2024 21:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="Jm+doih0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D87B10E17E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 21:16:01 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723497351; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZENgrDfRRit9IQxAEMfVMa6bDv/wTIYlWMCQsPEZjG973Yx9u/bq8juoX8YsjaGpbDt+9Ftw2bFVv6d4yyHRg5NIGWmow85qJLqA78ct8dIJrHFMUcUCQi6z0G/J+j78/RwevoiJMz2st2iMN2EQ1CLbPVgY+PRg5bOzmNzdWRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723497351;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=t7LSjs0y2/n2vSDcJx5q3oVW1Lohb2y98XURfhfwEkk=; 
 b=g2Grh9+dv+ii6xGaFeCpVRA17I45GgQ2ecnTY8n4Ud+QAvGgKw1YGA90y5oEJag30odC+lKdJ/LsPjSJxgYpyC9+YKE/ux6TmtvedNkzFkpfHUq6QZ9VLXiu/FArf2OWS0SYUxU93BRbNGAhbm6a3fGr+sAU7X9cMgK5OP+M/i0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723497351; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=t7LSjs0y2/n2vSDcJx5q3oVW1Lohb2y98XURfhfwEkk=;
 b=Jm+doih0I4KprAGJFywvLeNqLhRxmmK74USvQK4nY1LvLt32q6ZwxH8l/RoL5UDa
 KnA5ewH+djkxZuc5zeZnVA90V8+tGglO6xr3hnTlNIqXaqTKzdmtN6NNcJTDZV6MV6h
 9+NcV2EcfSR+PMCT+PMnUujnMwT1W6KYuCXGlx0Y=
Received: by mx.zohomail.com with SMTPS id 1723497348303297.7403591581841;
 Mon, 12 Aug 2024 14:15:48 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Aug 2024 00:15:09 +0300
Subject: [PATCH 2/4] drm/rockchip: dw_hdmi: Simplify clock handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-dw-hdmi-rockchip-cleanup-v1-2-b3e73b5f4fd6@collabora.com>
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

Make use of devm_clk_get_optional_enabled() to replace devm_clk_get()
and clk_prepare_enable() for ref_clk and drop the now unnecessary calls
to clk_disable_unprepare().

Additionally, use devm_clk_get_optional() helper for grf_clk to replace
the open coding call to devm_clk_get() followed by the -ENOENT test.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 38 +++++++++++------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 2509ce19313f..7d07039ef096 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -209,6 +209,7 @@ static const struct dw_hdmi_phy_config rockchip_phy_config[] = {
 static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 {
 	struct device_node *np = hdmi->dev->of_node;
+	int ret;
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
@@ -216,25 +217,23 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 		return PTR_ERR(hdmi->regmap);
 	}
 
-	hdmi->ref_clk = devm_clk_get_optional(hdmi->dev, "ref");
+	hdmi->ref_clk = devm_clk_get_optional_enabled(hdmi->dev, "ref");
 	if (!hdmi->ref_clk)
-		hdmi->ref_clk = devm_clk_get_optional(hdmi->dev, "vpll");
+		hdmi->ref_clk = devm_clk_get_optional_enabled(hdmi->dev, "vpll");
 
-	if (PTR_ERR(hdmi->ref_clk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (IS_ERR(hdmi->ref_clk)) {
-		drm_err(hdmi, "failed to get reference clock\n");
-		return PTR_ERR(hdmi->ref_clk);
+	if (IS_ERR(hdmi->ref_clk)) {
+		ret = PTR_ERR(hdmi->ref_clk);
+		if (ret != -EPROBE_DEFER)
+			drm_err(hdmi, "failed to get reference clock\n");
+		return ret;
 	}
 
-	hdmi->grf_clk = devm_clk_get(hdmi->dev, "grf");
-	if (PTR_ERR(hdmi->grf_clk) == -ENOENT) {
-		hdmi->grf_clk = NULL;
-	} else if (PTR_ERR(hdmi->grf_clk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (IS_ERR(hdmi->grf_clk)) {
-		drm_err(hdmi, "failed to get grf clock\n");
-		return PTR_ERR(hdmi->grf_clk);
+	hdmi->grf_clk = devm_clk_get_optional(hdmi->dev, "grf");
+	if (IS_ERR(hdmi->grf_clk)) {
+		ret = PTR_ERR(hdmi->grf_clk);
+		if (ret != -EPROBE_DEFER)
+			drm_err(hdmi, "failed to get grf clock\n");
+		return ret;
 	}
 
 	hdmi->avdd_0v9 = devm_regulator_get(hdmi->dev, "avdd-0v9");
@@ -615,12 +614,6 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		goto err_avdd_1v8;
 	}
 
-	ret = clk_prepare_enable(hdmi->ref_clk);
-	if (ret) {
-		drm_err(hdmi, "Failed to enable HDMI reference clock: %d\n", ret);
-		goto err_clk;
-	}
-
 	if (hdmi->chip_data == &rk3568_chip_data) {
 		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
 			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
@@ -649,8 +642,6 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 err_bind:
 	drm_encoder_cleanup(encoder);
-	clk_disable_unprepare(hdmi->ref_clk);
-err_clk:
 	regulator_disable(hdmi->avdd_1v8);
 err_avdd_1v8:
 	regulator_disable(hdmi->avdd_0v9);
@@ -665,7 +656,6 @@ static void dw_hdmi_rockchip_unbind(struct device *dev, struct device *master,
 
 	dw_hdmi_unbind(hdmi->hdmi);
 	drm_encoder_cleanup(&hdmi->encoder.encoder);
-	clk_disable_unprepare(hdmi->ref_clk);
 
 	regulator_disable(hdmi->avdd_1v8);
 	regulator_disable(hdmi->avdd_0v9);

-- 
2.46.0

