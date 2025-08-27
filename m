Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB2B38ACF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E6210E8B4;
	Wed, 27 Aug 2025 20:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wdwYH5Nz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433A010E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 20:24:07 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RKNwGw1825113;
 Wed, 27 Aug 2025 15:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756326238;
 bh=2873eYRFeI8OBe5rr1gNX2FrwM/fq0m7az5Za+99iDY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wdwYH5NzbPl5DdE0TGuqrncAImfaEvMk1HAFzG0hFoRMPlZARoXS8dTARTqIUf5nv
 tnp0DCmRwaC7vgmLHiwBng3bix0/blc71kGagAOjHv2t+nJ40eC6WQsLoAnoYSX2f3
 GPIZqLV0/GnjJM0D2f8G2hfgzhE1fvFEFZP/j8Pw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RKNwa12950691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 27 Aug 2025 15:23:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 15:23:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 15:23:57 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RKNvc93643392;
 Wed, 27 Aug 2025 15:23:57 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, <afd@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH V5 4/5] drm/bridge: it66121: Use vid/pid to detect the type of
 chip
Date: Wed, 27 Aug 2025 15:23:53 -0500
Message-ID: <20250827202354.2017972-5-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250827202354.2017972-1-nm@ti.com>
References: <20250827202354.2017972-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

The driver knows exactly which version of the chip is present since
the vid/pid is used to enforce a compatibility. Given that some
devices like IT66121 has potentially been replaced with IT66122 mid
production for many platforms, it makes no sense to use the vid/pid
as an enforcement for compatibility. Instead, detect the ID of the
actual chip in use by matching the corresponding vid/pid and drop the
compatible specific lookup table.

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
Changes since V4:
- Switched to ARRAY_SIZE, Dropped the null entry
- Picked up Andrew's Reviewed-by

V4: https://lore.kernel.org/all/20250819130807.3322536-5-nm@ti.com/
V3: https://lore.kernel.org/all/20250815034105.1276548-4-nm@ti.com/
V2: https://lore.kernel.org/all/20250813204106.580141-3-nm@ti.com/

 drivers/gpu/drm/bridge/ite-it66121.c | 58 ++++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index cd74f3966560..1b2ef774c770 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -312,7 +312,7 @@ struct it66121_ctx {
 		u8 swl;
 		bool auto_cts;
 	} audio;
-	const struct it66121_chip_info *info;
+	enum chip_id id;
 };
 
 static const struct regmap_range_cfg it66121_regmap_banks[] = {
@@ -402,7 +402,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 		if (ret)
 			return ret;
 
-		if (ctx->info->id == ID_IT66121) {
+		if (ctx->id == ID_IT66121) {
 			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
 						IT66121_AFE_IP_EC1, 0);
 			if (ret)
@@ -428,7 +428,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 		if (ret)
 			return ret;
 
-		if (ctx->info->id == ID_IT66121) {
+		if (ctx->id == ID_IT66121) {
 			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
 						IT66121_AFE_IP_EC1,
 						IT66121_AFE_IP_EC1);
@@ -449,7 +449,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 	if (ret)
 		return ret;
 
-	if (ctx->info->id == ID_IT6610) {
+	if (ctx->id == ID_IT6610) {
 		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
 					IT6610_AFE_XP_BYPASS,
 					IT6610_AFE_XP_BYPASS);
@@ -599,7 +599,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
 	if (ret)
 		return ret;
 
-	if (ctx->info->id == ID_IT66121) {
+	if (ctx->id == ID_IT66121) {
 		ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 					IT66121_CLK_BANK_PWROFF_RCLK, 0);
 		if (ret)
@@ -748,7 +748,7 @@ static int it66121_bridge_check(struct drm_bridge *bridge,
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
 
-	if (ctx->info->id == ID_IT6610) {
+	if (ctx->id == ID_IT6610) {
 		/* The IT6610 only supports these settings */
 		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_HIGH |
 			DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
@@ -802,7 +802,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 	if (regmap_write(ctx->regmap, IT66121_HDMI_MODE_REG, IT66121_HDMI_MODE_HDMI))
 		goto unlock;
 
-	if (ctx->info->id == ID_IT66121 &&
+	if (ctx->id == ID_IT66121 &&
 	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 			      IT66121_CLK_BANK_PWROFF_TXCLK,
 			      IT66121_CLK_BANK_PWROFF_TXCLK)) {
@@ -815,7 +815,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 	if (it66121_configure_afe(ctx, adjusted_mode))
 		goto unlock;
 
-	if (ctx->info->id == ID_IT66121 &&
+	if (ctx->id == ID_IT66121 &&
 	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 			      IT66121_CLK_BANK_PWROFF_TXCLK, 0)) {
 		goto unlock;
@@ -1498,13 +1498,19 @@ static const char * const it66121_supplies[] = {
 	"vcn33", "vcn18", "vrf12"
 };
 
+static const struct it66121_chip_info it66xx_chip_info[] = {
+	{.id = ID_IT6610, .vid = 0xca00, .pid = 0x0611 },
+	{.id = ID_IT66121, .vid = 0x4954, .pid = 0x0612 },
+};
+
 static int it66121_probe(struct i2c_client *client)
 {
 	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
 	struct device_node *ep;
-	int ret;
+	int ret, i;
 	struct it66121_ctx *ctx;
 	struct device *dev = &client->dev;
+	const struct it66121_chip_info *chip_info;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(dev, "I2C check functionality failed.\n");
@@ -1522,7 +1528,6 @@ static int it66121_probe(struct i2c_client *client)
 
 	ctx->dev = dev;
 	ctx->client = client;
-	ctx->info = i2c_get_match_data(client);
 
 	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
 	of_node_put(ep);
@@ -1568,11 +1573,18 @@ static int it66121_probe(struct i2c_client *client)
 	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
 	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
 
-	if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
-	    (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
-		return -ENODEV;
+	for (i = 0; i < ARRAY_SIZE(it66xx_chip_info); i++) {
+		chip_info = &it66xx_chip_info[i];
+		if ((vendor_ids[1] << 8 | vendor_ids[0]) == chip_info->vid &&
+		    (device_ids[1] << 8 | device_ids[0]) == chip_info->pid) {
+			ctx->id = chip_info->id;
+			break;
+		}
 	}
 
+	if (i == ARRAY_SIZE(it66xx_chip_info))
+		return -ENODEV;
+
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
@@ -1606,28 +1618,16 @@ static void it66121_remove(struct i2c_client *client)
 	mutex_destroy(&ctx->lock);
 }
 
-static const struct it66121_chip_info it66121_chip_info = {
-	.id = ID_IT66121,
-	.vid = 0x4954,
-	.pid = 0x0612,
-};
-
-static const struct it66121_chip_info it6610_chip_info = {
-	.id = ID_IT6610,
-	.vid = 0xca00,
-	.pid = 0x0611,
-};
-
 static const struct of_device_id it66121_dt_match[] = {
-	{ .compatible = "ite,it6610", &it6610_chip_info },
-	{ .compatible = "ite,it66121", &it66121_chip_info },
+	{ .compatible = "ite,it6610" },
+	{ .compatible = "ite,it66121" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, it66121_dt_match);
 
 static const struct i2c_device_id it66121_id[] = {
-	{ "it6610", (kernel_ulong_t)&it6610_chip_info },
-	{ "it66121", (kernel_ulong_t)&it66121_chip_info },
+	{ .name = "it6610" },
+	{ .name = "it66121" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, it66121_id);
-- 
2.47.0

