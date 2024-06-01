Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205BF8D7008
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AEB10E16E;
	Sat,  1 Jun 2024 13:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Os3q0+lD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDE110E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247589;
 bh=tXGwQEVKG8owzD+nYaF701LCWcYEFXnuWBAl5qoYJi8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Os3q0+lDVQX8Rhs8/d7vfoUoZWSWhiY862C5DsyO4LFn0i3Kd0VNcmr79HXiwJQ/E
 6jWegpovnwjF8/2eR7vnHvVn5XTMsR5yvytNx6XxV8o5+FgFY4RDwYzSFSbLwYDF54
 JTYYqQPfeA4hlJv3xhpKuLEbQFZBshRL3uU0flPxSFQTJOTsIJLTl0zcQcoEsJS7ZU
 i1rufQaauND0aFv0ktknWd0An0ZbbYnbpolqaJbADBwtS6Q7XfYCD0i7d5ROly8ZRF
 xaiamkB/FM/OlXrrKqcqK79jDF+cmp4YvpkGLY4kBfZECA2ryI8aKgqgMfmY9Mh9fY
 JLnYH6ZMOKMew==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 672C037821F1;
 Sat,  1 Jun 2024 13:13:09 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:31 +0300
Subject: [PATCH 09/14] drm/rockchip: dw_hdmi: Simplify clock handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-9-f6203753232b@collabora.com>
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
2.45.0

