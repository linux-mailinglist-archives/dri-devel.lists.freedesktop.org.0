Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC6464C977
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8FA10E3DD;
	Wed, 14 Dec 2022 12:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F138210E3D9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671022716; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALeT/K979z4FbQL+GNOo8bkN3uAPgFKLruh1Ib4LZ7c=;
 b=y/G2f0lwEhHr1QeY4WnxJSj3DBBbi3DV0qCBXdArfDRsVjYlFiMwQ7DuUmnHqCP7ldCCef
 wu38teVetlFGMA2UT8Fon5UCjaGzZ+JS+Aro4vVTv81biu83EG2e7abMSpVdulHGkvR/lp
 ZIu+loFyFKh9NDzn4cGp5BrXrLWEO+0=
From: Paul Cercueil <paul@crapouillou.net>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 02/10] drm: bridge: it66121: Use
 devm_regulator_bulk_get_enable()
Date: Wed, 14 Dec 2022 13:58:13 +0100
Message-Id: <20221214125821.12489-3-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-1-paul@crapouillou.net>
References: <20221214125821.12489-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 list@opendingux.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the code of the driver by using
devm_regulator_bulk_get_enable(), which will handle powering up the
regulators, and disabling them on probe error or module removal.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 34 +++++++---------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 7476cfbf9585..a698eec8f250 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -301,7 +301,6 @@ struct it66121_ctx {
 	struct device *dev;
 	struct gpio_desc *gpio_reset;
 	struct i2c_client *client;
-	struct regulator_bulk_data supplies[3];
 	u32 bus_width;
 	struct mutex lock; /* Protects fields below and device registers */
 	struct hdmi_avi_infoframe hdmi_avi_infoframe;
@@ -342,16 +341,6 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
 	gpiod_set_value(ctx->gpio_reset, 0);
 }
 
-static inline int ite66121_power_on(struct it66121_ctx *ctx)
-{
-	return regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-}
-
-static inline int ite66121_power_off(struct it66121_ctx *ctx)
-{
-	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-}
-
 static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)
 {
 	return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG, IT66121_MASTER_SEL_HOST);
@@ -1512,6 +1501,10 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 	return PTR_ERR_OR_ZERO(ctx->audio.pdev);
 }
 
+static const char * const it66121_supplies[] = {
+	"vcn33", "vcn18", "vrf12"
+};
+
 static int it66121_probe(struct i2c_client *client)
 {
 	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
@@ -1564,26 +1557,18 @@ static int it66121_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 	mutex_init(&ctx->lock);
 
-	ctx->supplies[0].supply = "vcn33";
-	ctx->supplies[1].supply = "vcn18";
-	ctx->supplies[2].supply = "vrf12";
-	ret = devm_regulator_bulk_get(ctx->dev, 3, ctx->supplies);
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it66121_supplies),
+					     it66121_supplies);
 	if (ret) {
-		dev_err(ctx->dev, "regulator_bulk failed\n");
+		dev_err(dev, "Failed to enable power supplies\n");
 		return ret;
 	}
 
-	ret = ite66121_power_on(ctx);
-	if (ret)
-		return ret;
-
 	it66121_hw_reset(ctx);
 
 	ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
-	if (IS_ERR(ctx->regmap)) {
-		ite66121_power_off(ctx);
+	if (IS_ERR(ctx->regmap))
 		return PTR_ERR(ctx->regmap);
-	}
 
 	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
 	regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
@@ -1596,7 +1581,6 @@ static int it66121_probe(struct i2c_client *client)
 
 	if (vendor_ids[0] != IT66121_VENDOR_ID0 || vendor_ids[1] != IT66121_VENDOR_ID1 ||
 	    device_ids[0] != IT66121_DEVICE_ID0 || device_ids[1] != IT66121_DEVICE_ID1) {
-		ite66121_power_off(ctx);
 		return -ENODEV;
 	}
 
@@ -1609,7 +1593,6 @@ static int it66121_probe(struct i2c_client *client)
 					IRQF_ONESHOT, dev_name(dev), ctx);
 	if (ret < 0) {
 		dev_err(dev, "Failed to request irq %d:%d\n", client->irq, ret);
-		ite66121_power_off(ctx);
 		return ret;
 	}
 
@@ -1626,7 +1609,6 @@ static void it66121_remove(struct i2c_client *client)
 {
 	struct it66121_ctx *ctx = i2c_get_clientdata(client);
 
-	ite66121_power_off(ctx);
 	drm_bridge_remove(&ctx->bridge);
 	mutex_destroy(&ctx->lock);
 }
-- 
2.35.1

