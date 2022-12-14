Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A764C97A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0017710E3E2;
	Wed, 14 Dec 2022 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD81810E3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671022719; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ws6li5dO3CpsHCt9CPPSqXKDyNgVlYNQcMTzRYtTc0=;
 b=Yx3CR7S3q+zwFupKXU6o/dNqmCYY3D4AMyXhhL28ejrgEsIzv3C6TPiVBDzDgwJZghnKgG
 JZoBP+8kMeS2Cx2uZaW9f1duXF5NOiwlV8P6ilIqiMeJoffvvJUUwmCpi383rLQuXCWwto
 NRTlkEGFNsFbqpMJ/Q4Gwl8GMDeX+g8=
From: Paul Cercueil <paul@crapouillou.net>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 06/10] drm: bridge: it66121: Don't use DDC error IRQs
Date: Wed, 14 Dec 2022 13:58:17 +0100
Message-Id: <20221214125821.12489-7-paul@crapouillou.net>
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

The DDC error IRQs will fire on the IT6610 every time the FIFO is empty,
which is not very helpful. To resolve this, we can simply disable them,
and handle DDC errors in it66121_wait_ddc_ready().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 49 ++++++----------------------
 1 file changed, 10 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index bfb9c87a7019..06fa59ae5ffc 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -515,16 +515,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
 	offset = (block % 2) * len;
 	block = block / 2;
 
-	ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
-	if (ret)
-		return ret;
-
-	if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
-		ret = it66121_abort_ddc_ops(ctx);
-		if (ret)
-			return ret;
-	}
-
 	ret = it66121_clear_ddc_fifo(ctx);
 	if (ret)
 		return ret;
@@ -545,16 +535,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
 		if (ret)
 			return ret;
 
-		ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
-		if (ret)
-			return ret;
-
-		if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
-			ret = it66121_abort_ddc_ops(ctx);
-			if (ret)
-				return ret;
-		}
-
 		ret = it66121_preamble_ddc(ctx);
 		if (ret)
 			return ret;
@@ -585,8 +565,10 @@ static int it66121_get_edid_block(void *context, u8 *buf,
 		remain -= cnt;
 
 		ret = it66121_wait_ddc_ready(ctx);
-		if (ret)
+		if (ret) {
+			it66121_abort_ddc_ops(ctx);
 			return ret;
+		}
 
 		ret = regmap_noinc_read(ctx->regmap, IT66121_DDC_RD_FIFO_REG,
 					buf, cnt);
@@ -671,11 +653,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
 	/* Per programming manual, sleep here for bridge to settle */
 	msleep(50);
 
-	/* Start interrupts */
-	return regmap_write_bits(ctx->regmap, IT66121_INT_MASK1_REG,
-				 IT66121_INT_MASK1_DDC_NOACK |
-				 IT66121_INT_MASK1_DDC_FIFOERR |
-				 IT66121_INT_MASK1_DDC_BUSHANG, 0);
+	return 0;
 }
 
 static int it66121_set_mute(struct it66121_ctx *ctx, bool mute)
@@ -926,21 +904,14 @@ static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
 	ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
 	if (ret) {
 		dev_err(dev, "Cannot read STATUS1_REG %d\n", ret);
-	} else {
-		if (val & IT66121_INT_STATUS1_DDC_FIFOERR)
-			it66121_clear_ddc_fifo(ctx);
-		if (val & (IT66121_INT_STATUS1_DDC_BUSHANG |
-			   IT66121_INT_STATUS1_DDC_NOACK))
-			it66121_abort_ddc_ops(ctx);
-		if (val & IT66121_INT_STATUS1_HPD_STATUS) {
-			regmap_write_bits(ctx->regmap, IT66121_INT_CLR1_REG,
-					  IT66121_INT_CLR1_HPD, IT66121_INT_CLR1_HPD);
+	} else if (val & IT66121_INT_STATUS1_HPD_STATUS) {
+		regmap_write_bits(ctx->regmap, IT66121_INT_CLR1_REG,
+				  IT66121_INT_CLR1_HPD, IT66121_INT_CLR1_HPD);
 
-			status = it66121_is_hpd_detect(ctx) ? connector_status_connected
-							    : connector_status_disconnected;
+		status = it66121_is_hpd_detect(ctx) ? connector_status_connected
+			: connector_status_disconnected;
 
-			event = true;
-		}
+		event = true;
 	}
 
 	regmap_write_bits(ctx->regmap, IT66121_SYS_STATUS_REG,
-- 
2.35.1

