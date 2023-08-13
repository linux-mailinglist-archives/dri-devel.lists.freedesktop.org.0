Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9477AA7B
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 20:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0635A10E0EA;
	Sun, 13 Aug 2023 18:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5ED4F10E0EA
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 18:05:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; d="scan'208";a="176521216"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2023 03:05:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id DADE3405D103;
 Mon, 14 Aug 2023 03:05:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/7] drm: adv7511: Add supply_names and num_supplies variables
 to struct adv7511_chip_info
Date: Sun, 13 Aug 2023 19:05:09 +0100
Message-Id: <20230813180512.307418-5-biju.das.jz@bp.renesas.com>
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

The ADV7511 has 5 power supplies compared to 7 that of ADV75{33,35}. Add
supply_names and num_supplies variables to struct adv7511_chip_info to
handle this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 29 ++++++++++----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 0e2c721a856f..b29d11cae932 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -337,6 +337,8 @@ struct adv7511_chip_info {
 	enum adv7511_type type;
 	unsigned long max_mode_clock;
 	unsigned long max_lane_freq;
+	const char * const *supply_names;
+	unsigned int num_supplies;
 };
 
 struct adv7511 {
@@ -375,7 +377,6 @@ struct adv7511 {
 	struct gpio_desc *gpio_pd;
 
 	struct regulator_bulk_data *supplies;
-	unsigned int num_supplies;
 
 	/* ADV7533 DSI RX related params */
 	struct device_node *host_node;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 29e087e6d721..f6f15c1b0882 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1004,37 +1004,30 @@ static const char * const adv7533_supply_names[] = {
 
 static int adv7511_init_regulators(struct adv7511 *adv)
 {
+	const char * const *supply_names = adv->info->supply_names;
+	unsigned int num_supplies = adv->info->num_supplies;
 	struct device *dev = &adv->i2c_main->dev;
-	const char * const *supply_names;
 	unsigned int i;
 	int ret;
 
-	if (adv->info->type == ADV7511) {
-		supply_names = adv7511_supply_names;
-		adv->num_supplies = ARRAY_SIZE(adv7511_supply_names);
-	} else {
-		supply_names = adv7533_supply_names;
-		adv->num_supplies = ARRAY_SIZE(adv7533_supply_names);
-	}
-
-	adv->supplies = devm_kcalloc(dev, adv->num_supplies,
+	adv->supplies = devm_kcalloc(dev, num_supplies,
 				     sizeof(*adv->supplies), GFP_KERNEL);
 	if (!adv->supplies)
 		return -ENOMEM;
 
-	for (i = 0; i < adv->num_supplies; i++)
+	for (i = 0; i < num_supplies; i++)
 		adv->supplies[i].supply = supply_names[i];
 
-	ret = devm_regulator_bulk_get(dev, adv->num_supplies, adv->supplies);
+	ret = devm_regulator_bulk_get(dev, num_supplies, adv->supplies);
 	if (ret)
 		return ret;
 
-	return regulator_bulk_enable(adv->num_supplies, adv->supplies);
+	return regulator_bulk_enable(num_supplies, adv->supplies);
 }
 
 static void adv7511_uninit_regulators(struct adv7511 *adv)
 {
-	regulator_bulk_disable(adv->num_supplies, adv->supplies);
+	regulator_bulk_disable(adv->info->num_supplies, adv->supplies);
 }
 
 static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
@@ -1367,19 +1360,25 @@ static void adv7511_remove(struct i2c_client *i2c)
 }
 
 static const struct adv7511_chip_info adv7511_chip_info = {
-	.type = ADV7511
+	.type = ADV7511,
+	.supply_names = adv7511_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7511_supply_names)
 };
 
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
 	.max_mode_clock = 80000,
 	.max_lane_freq = 800000,
+	.supply_names = adv7533_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
 	.max_mode_clock = 148500,
 	.max_lane_freq = 891000,
+	.supply_names = adv7533_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

