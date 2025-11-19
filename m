Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2AC6F389
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A7810E637;
	Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eNEBUWlj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC0A10E62A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 88E664374D;
 Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2189C4AF0B;
 Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763562101;
 bh=W8AFvq4nPlynSNPii3uZ58RgvdVO7lLIvRxVluTsVZY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=eNEBUWlj7cKXQAmn6BRhEPvy9hmojwCXj/jDVUxxAyYNLHsyRsQsakGIYxKnwyc8M
 ntRWMC+vUQqmA95q1IFeFwq+EIMvs2wCDTssWJP72Mv9lW/GL1Dq3b0uVnjS1M6fVD
 EbmpE5+YJ3bPxgBGksDwKN6skDEsNQPPa+LjscRjDx+z2PeY2mIFDZrtFq6ftMCHGp
 8eMwBt5RQ4DKsGS7PuqCR16NYo9voijVAO8Ube4BDShWNvxxYYGGMNWLechEs50qI2
 h14OFKgT+YdxKcYvLbcINmHF3+0j1kQWVJ1XHqNPqmpcraV3SmsRmr5g62bq0Iktwy
 ZE/cyKthJtEkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A1D85CF34BA;
 Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:29 +0100
Subject: [PATCH v3 04/12] drm/panel: sofef00: Handle all regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-4-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mwo54CYnw7MO3Xycn85wubPyOShFMxI9iCM2JhaFHcY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyykQQjBPv/D6e3UV4rkYUeeOAS1ybhrMlJ
 37M8wKsmZaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 cp3SD/4kVvwnsf4KPZEdZ0I+Tq4vfMsljqvPEQkD7U6imv9aaIBzs1GLrLqdDvaEHhaNfkNUEv5
 pW9Y8V1Z05iFkRt74VKl8sD5vSL8hK6/WQLzElQAjBYc7PFihMmbS8JntFa8XVVqlfS71JNo6p5
 kn4+3OOKOcy+HIVqHEq62tFVZ9v2x9eZxCmZNsGTZq9IZ5EiC6zJ8gwjFkTFCaacq6B0e1J1My6
 y63S1QliRT5eHgdyZd5TwPI/oLzWIJCtCjPpfcdc/LQoWh9fOI05gT05XzvyjVgRuuMEPk9NJj1
 wRq0qo64isIAp4GCRV2q8mgIFqTWMKu8a2tjjwA+r1LAYhnnX6UD5xvHNZTelA2IbSTH7Uadycg
 Q8BRg78HK17Ss1JIE7HYDtDVhjnb5SkpfCE4qjgI3WW3erLazI5y7wszT0PrC0qBgiTEy44lmFW
 7gGG8Xr+t6vZD8V14EotaUZg+9/cFs25Ht4v3PJXaV3GdwzJutPDZqiYLaeVEDRQO2iGSbDyOBI
 xLjmnW23s/8phTns4YhhA2uGtUmAu1ZtOhHlevTx08jBmNXgbWW0kiC/GBQBo4B/gPv1agaBM4x
 yglKS5Wldkms26ex6fjW0JkoVAoWyPM1340zxemoAx6eZyFnvfgZQ+3qaYIdkaShtbEmvfGZOyO
 SwmQSo9Ozwj+PZQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Recently we documented, there is more than vddio regulator, adapt the
driver to work with VCI and POC regulator.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index c88574ea66e1c..3097040e6bfa0 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -20,10 +20,16 @@
 struct sofef00_panel {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
-	struct regulator *supply;
+	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
 };
 
+static const struct regulator_bulk_data sofef00_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vci" },
+	{ .supply = "poc" },
+};
+
 static inline
 struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
 {
@@ -86,20 +92,18 @@ static int sofef00_panel_off(struct sofef00_panel *ctx)
 static int sofef00_panel_prepare(struct drm_panel *panel)
 {
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	ret = regulator_enable(ctx->supply);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+	ret = regulator_bulk_enable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
+	if (ret < 0)
 		return ret;
-	}
 
 	sofef00_panel_reset(ctx);
 
 	ret = sofef00_panel_on(ctx);
 	if (ret < 0) {
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
 		return ret;
 	}
 
@@ -111,7 +115,7 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
 
 	sofef00_panel_off(ctx);
-	regulator_disable(ctx->supply);
+	regulator_bulk_disable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
 
 	return 0;
 }
@@ -197,10 +201,12 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
-	ctx->supply = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(ctx->supply))
-		return dev_err_probe(dev, PTR_ERR(ctx->supply),
-				     "Failed to get vddio regulator\n");
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(sofef00_supplies),
+					    sofef00_supplies,
+					    &ctx->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))

-- 
2.51.0


