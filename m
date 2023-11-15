Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D47EB30A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AD210E206;
	Tue, 14 Nov 2023 15:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 454 seconds by postgrey-1.36 at gabe;
 Tue, 14 Nov 2023 15:09:31 UTC
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033FB10E206
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:09:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699974138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjLEQ2aBUBcn+Sqc95rmrPoW3NH5ZZ26cu6iyzwpGc0=;
 b=kuURKlYbDIZkkE2VlZVqW0eLF4/yKYOCNNFEuflSWrkD8XOv6U9BWn3iVZmIUtoJqSidkD
 tHAtBcRbv/f+SkUPe+gNkccy0E/Nv7Yd/65IhYW7jtAtFcDG5baoSGFxCLWjC+195kewFe
 Ihq1rL5hTg0Go/FFQ+xyAE9m8Z5jvmw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 5/8] drm/bridge: it66121: Add a helper function to read chip id
Date: Tue, 14 Nov 2023 23:01:27 +0800
Message-Id: <20231114150130.497915-6-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-1-sui.jingfeng@linux.dev>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Read the required chip id data back by calling regmap_bulk_read() once,
reduce the number of local variables needed in it66121_probe() function.
And store its values into struct it66121_ctx, as it will be used latter.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 47 ++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 7e473beefc79..f36d05331f25 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -313,6 +313,9 @@ struct it66121_ctx {
 		bool auto_cts;
 	} audio;
 	const struct it66121_chip_info *info;
+	u16 vender_id;
+	u16 device_id;
+	u8 revision;
 };
 
 static inline struct it66121_ctx *bridge_to_it66121(struct drm_bridge *bridge)
@@ -399,6 +402,30 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
 	gpiod_set_value(ctx->gpio_reset, 0);
 }
 
+static int it66121_read_chip_id(struct it66121_ctx *ctx, bool verbose)
+{
+	u8 id[4];
+	int ret;
+
+	ret = regmap_bulk_read(ctx->regmap, IT66121_VENDOR_ID0_REG, id, 4);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to read chip ID: %d\n", ret);
+		return ret;
+	}
+
+	ctx->vender_id = (u16)id[1] << 8 | id[0];
+	ctx->device_id = ((u16)(id[3] & IT66121_DEVICE_ID1_MASK) << 8 | id[2]);
+	/* Revision is shared with DEVICE_ID1 */
+	ctx->revision = FIELD_GET(IT66121_REVISION_MASK, id[3]);
+
+	if (verbose) {
+		dev_info(ctx->dev, "Found ITE66121: 0x%x%x, revision: %u\n",
+			 ctx->vender_id, ctx->device_id, ctx->revision);
+	}
+
+	return 0;
+}
+
 static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)
 {
 	return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG, IT66121_MASTER_SEL_HOST);
@@ -1561,7 +1588,6 @@ static const char * const it66121_supplies[] = {
 
 static int it66121_probe(struct i2c_client *client)
 {
-	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
 	int ret;
 	struct it66121_ctx *ctx;
 	struct device *dev = &client->dev;
@@ -1603,19 +1629,13 @@ static int it66121_probe(struct i2c_client *client)
 	if (IS_ERR(ctx->regmap))
 		return PTR_ERR(ctx->regmap);
 
-	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
-	regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
-	regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
-	regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
-
-	/* Revision is shared with DEVICE_ID1 */
-	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
-	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
+	ret = it66121_read_chip_id(ctx, false);
+	if (ret)
+		return ret;
 
-	if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
-	    (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
+	if (ctx->vender_id != ctx->info->vid ||
+	    ctx->device_id != ctx->info->pid)
 		return -ENODEV;
-	}
 
 	ctx->bridge.funcs = &it66121_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
@@ -1633,7 +1653,8 @@ static int it66121_probe(struct i2c_client *client)
 
 	drm_bridge_add(&ctx->bridge);
 
-	dev_info(dev, "IT66121 revision %d probed\n", revision_id);
+	dev_info(dev, "IT66121 probed, chip id: 0x%x:0x%x, revision: %u\n",
+		 ctx->vender_id, ctx->device_id, ctx->revision);
 
 	return 0;
 }
-- 
2.34.1

