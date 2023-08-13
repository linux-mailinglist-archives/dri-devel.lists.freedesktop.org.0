Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C477AA73
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 20:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E68710E0E4;
	Sun, 13 Aug 2023 18:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48B6210E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 18:05:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; d="scan'208";a="176521194"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2023 03:05:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 80BB3405D103;
 Mon, 14 Aug 2023 03:05:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/7] drm: adv7511: Add struct adv7511_chip_info and use
 i2c_get_match_data()
Date: Sun, 13 Aug 2023 19:05:06 +0100
Message-Id: <20230813180512.307418-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
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
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>, Adam Ford <aford173@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add struct adv7511_chip_info to handle hw differences between various
chips rather checking against the 'type' variable in various places.
Replace 'adv->type'->'info->type' by moving variable 'type' from
struct adv7511 to struct adv7511_chip_info.

Replace of_device_get_match_data() and ID lookup for retrieving match data
with i2c_get_match_data() by adding adv7511_chip_info as device data for
both OF and ID tables.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  6 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 68 +++++++++++---------
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |  4 +-
 3 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 17445800248d..59e8ef10d72e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -333,6 +333,10 @@ enum adv7511_type {
 
 #define ADV7511_MAX_ADDRS 3
 
+struct adv7511_chip_info {
+	enum adv7511_type type;
+};
+
 struct adv7511 {
 	struct i2c_client *i2c_main;
 	struct i2c_client *i2c_edid;
@@ -377,7 +381,7 @@ struct adv7511 {
 	u8 num_dsi_lanes;
 	bool use_timing_gen;
 
-	enum adv7511_type type;
+	const struct adv7511_chip_info *info;
 	struct platform_device *audio_pdev;
 
 	struct cec_adapter *cec_adap;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 2611afd2c1c1..013d8d640ef4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511 *adv7511)
 	 * first few seconds after enabling the output. On the other hand
 	 * adv7535 require to enable HPD Override bit for proper HPD.
 	 */
-	if (adv7511->type == ADV7535)
+	if (adv7511->info->type == ADV7535)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE);
@@ -373,7 +373,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
 	 */
 	regcache_sync(adv7511->regmap);
 
-	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
+	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
 		adv7533_dsi_power_on(adv7511);
 	adv7511->powered = true;
 }
@@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
 static void __adv7511_power_off(struct adv7511 *adv7511)
 {
 	/* TODO: setup additional power down modes */
-	if (adv7511->type == ADV7535)
+	if (adv7511->info->type == ADV7535)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
 
@@ -397,7 +397,7 @@ static void __adv7511_power_off(struct adv7511 *adv7511)
 static void adv7511_power_off(struct adv7511 *adv7511)
 {
 	__adv7511_power_off(adv7511);
-	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
+	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
 		adv7533_dsi_power_off(adv7511);
 	adv7511->powered = false;
 }
@@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 			status = connector_status_disconnected;
 	} else {
 		/* Renable HPD sensing */
-		if (adv7511->type == ADV7535)
+		if (adv7511->info->type == ADV7535)
 			regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 					   ADV7535_REG_POWER2_HPD_OVERRIDE,
 					   ADV7535_REG_POWER2_HPD_OVERRIDE);
@@ -786,7 +786,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
 
-	if (adv7511->type == ADV7511)
+	if (adv7511->info->type == ADV7511)
 		regmap_update_bits(adv7511->regmap, 0xfb,
 				   0x6, low_refresh_rate << 1);
 	else
@@ -921,7 +921,7 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	if (adv->type == ADV7533 || adv->type == ADV7535)
+	if (adv->info->type == ADV7533 || adv->info->type == ADV7535)
 		return adv7533_mode_valid(adv, mode);
 	else
 		return adv7511_mode_valid(adv, mode);
@@ -1009,7 +1009,7 @@ static int adv7511_init_regulators(struct adv7511 *adv)
 	unsigned int i;
 	int ret;
 
-	if (adv->type == ADV7511) {
+	if (adv->info->type == ADV7511) {
 		supply_names = adv7511_supply_names;
 		adv->num_supplies = ARRAY_SIZE(adv7511_supply_names);
 	} else {
@@ -1093,7 +1093,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
 		goto err;
 	}
 
-	if (adv->type == ADV7533 || adv->type == ADV7535) {
+	if (adv->info->type == ADV7533 || adv->info->type == ADV7535) {
 		ret = adv7533_patch_cec_registers(adv);
 		if (ret)
 			goto err;
@@ -1192,7 +1192,7 @@ static int adv7511_parse_dt(struct device_node *np,
 
 static int adv7511_probe(struct i2c_client *i2c)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
+	static const struct adv7511_chip_info *info;
 	struct adv7511_link_config link_config;
 	struct adv7511 *adv7511;
 	struct device *dev = &i2c->dev;
@@ -1206,18 +1206,16 @@ static int adv7511_probe(struct i2c_client *i2c)
 	if (!adv7511)
 		return -ENOMEM;
 
+	info = i2c_get_match_data(i2c);
+
 	adv7511->i2c_main = i2c;
 	adv7511->powered = false;
 	adv7511->status = connector_status_disconnected;
-
-	if (dev->of_node)
-		adv7511->type = (enum adv7511_type)of_device_get_match_data(dev);
-	else
-		adv7511->type = id->driver_data;
+	adv7511->info = info;
 
 	memset(&link_config, 0, sizeof(link_config));
 
-	if (adv7511->type == ADV7511)
+	if (adv7511->info->type == ADV7511)
 		ret = adv7511_parse_dt(dev->of_node, &link_config);
 	else
 		ret = adv7533_parse_dt(dev->of_node, adv7511);
@@ -1254,7 +1252,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 		goto uninit_regulators;
 	dev_dbg(dev, "Rev. %d\n", val);
 
-	if (adv7511->type == ADV7511)
+	if (info->type == ADV7511)
 		ret = regmap_register_patch(adv7511->regmap,
 					    adv7511_fixed_registers,
 					    ARRAY_SIZE(adv7511_fixed_registers));
@@ -1306,7 +1304,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, adv7511);
 
-	if (adv7511->type == ADV7511)
+	if (info->type == ADV7511)
 		adv7511_set_link_config(adv7511, &link_config);
 
 	ret = adv7511_cec_init(dev, adv7511);
@@ -1325,7 +1323,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511_audio_init(dev, adv7511);
 
-	if (adv7511->type == ADV7533 || adv7511->type == ADV7535) {
+	if (info->type == ADV7533 || info->type == ADV7535) {
 		ret = adv7533_attach_dsi(adv7511);
 		if (ret)
 			goto err_unregister_audio;
@@ -1368,22 +1366,34 @@ static void adv7511_remove(struct i2c_client *i2c)
 	i2c_unregister_device(adv7511->i2c_edid);
 }
 
+static const struct adv7511_chip_info adv7511_chip_info = {
+	.type = ADV7511
+};
+
+static const struct adv7511_chip_info adv7533_chip_info = {
+	.type = ADV7533
+};
+
+static const struct adv7511_chip_info adv7535_chip_info = {
+	.type = ADV7535
+};
+
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-	{ "adv7511", ADV7511 },
-	{ "adv7511w", ADV7511 },
-	{ "adv7513", ADV7511 },
-	{ "adv7533", ADV7533 },
-	{ "adv7535", ADV7535 },
+	{ "adv7511", (kernel_ulong_t)&adv7511_chip_info },
+	{ "adv7511w", (kernel_ulong_t)&adv7511_chip_info },
+	{ "adv7513", (kernel_ulong_t)&adv7511_chip_info },
+	{ "adv7533", (kernel_ulong_t)&adv7533_chip_info },
+	{ "adv7535", (kernel_ulong_t)&adv7535_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
 
 static const struct of_device_id adv7511_of_ids[] = {
-	{ .compatible = "adi,adv7511", .data = (void *)ADV7511 },
-	{ .compatible = "adi,adv7511w", .data = (void *)ADV7511 },
-	{ .compatible = "adi,adv7513", .data = (void *)ADV7511 },
-	{ .compatible = "adi,adv7533", .data = (void *)ADV7533 },
-	{ .compatible = "adi,adv7535", .data = (void *)ADV7535 },
+	{ .compatible = "adi,adv7511", .data = &adv7511_chip_info },
+	{ .compatible = "adi,adv7511w", .data = &adv7511_chip_info },
+	{ .compatible = "adi,adv7513", .data = &adv7511_chip_info },
+	{ .compatible = "adi,adv7533", .data = &adv7533_chip_info },
+	{ .compatible = "adi,adv7535", .data = &adv7535_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adv7511_of_ids);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 7e3e56441aed..c452c4dc1c3f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -108,11 +108,11 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
 	/* Check max clock for either 7533 or 7535 */
-	if (mode->clock > (adv->type == ADV7533 ? 80000 : 148500))
+	if (mode->clock > (adv->info->type == ADV7533 ? 80000 : 148500))
 		return MODE_CLOCK_HIGH;
 
 	/* Check max clock for each lane */
-	max_lane_freq = (adv->type == ADV7533 ? 800000 : 891000);
+	max_lane_freq = (adv->info->type == ADV7533 ? 800000 : 891000);
 
 	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
 		return MODE_CLOCK_HIGH;
-- 
2.25.1

