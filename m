Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DBA78D682
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9381E10E533;
	Wed, 30 Aug 2023 14:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4EDF10E533
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:24:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; d="scan'208";a="178194107"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2ED6142170F5;
 Wed, 30 Aug 2023 23:24:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/8] drm: adv7511: Add supply_names and num_supplies
 variables to struct adv7511_chip_info
Date: Wed, 30 Aug 2023 15:23:54 +0100
Message-Id: <20230830142358.275459-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
 * Added Rb tag from Laurent.
 * Added trailing commas for num_supplies in adv753{3,5}_chip_info.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 27 ++++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index f8d61f2fa30e..edf7be9c21d3 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -337,6 +337,8 @@ struct adv7511_chip_info {
 	enum adv7511_type type;
 	unsigned int max_mode_clock_khz;
 	unsigned int max_lane_freq_khz;
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
index 1c76aa5a5d5b..2bcd17953221 100644
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
@@ -1365,18 +1358,24 @@ static void adv7511_remove(struct i2c_client *i2c)
 
 static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
+	.supply_names = adv7511_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
 };
 
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
 	.max_mode_clock_khz = 80000,
 	.max_lane_freq_khz = 800000,
+	.supply_names = adv7533_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
 	.max_mode_clock_khz = 148500,
 	.max_lane_freq_khz = 891000,
+	.supply_names = adv7533_supply_names,
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

