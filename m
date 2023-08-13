Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC29377AA7D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 20:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DBB10E0F0;
	Sun, 13 Aug 2023 18:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CACFE10E0F0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 18:05:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; d="scan'208";a="176521226"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2023 03:05:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 557A9405E63A;
 Mon, 14 Aug 2023 03:05:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct
 adv7511_chip_info
Date: Sun, 13 Aug 2023 19:05:10 +0100
Message-Id: <20230813180512.307418-6-biju.das.jz@bp.renesas.com>
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

The ADV7533 and ADV7535 have DSI support. Add a feature bit has_dsi to
struct adv7511_chip_info for handling configuration related to DSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index b29d11cae932..2a017bb31a14 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -339,6 +339,7 @@ struct adv7511_chip_info {
 	unsigned long max_lane_freq;
 	const char * const *supply_names;
 	unsigned int num_supplies;
+	unsigned has_dsi:1;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f6f15c1b0882..66b3f8fcf67d 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -373,7 +373,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
 	 */
 	regcache_sync(adv7511->regmap);
 
-	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
+	if (adv7511->info->has_dsi)
 		adv7533_dsi_power_on(adv7511);
 	adv7511->powered = true;
 }
@@ -397,7 +397,7 @@ static void __adv7511_power_off(struct adv7511 *adv7511)
 static void adv7511_power_off(struct adv7511 *adv7511)
 {
 	__adv7511_power_off(adv7511);
-	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
+	if (adv7511->info->has_dsi)
 		adv7533_dsi_power_off(adv7511);
 	adv7511->powered = false;
 }
@@ -786,7 +786,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
 
-	if (adv7511->info->type == ADV7511)
+	if (!adv7511->info->has_dsi)
 		regmap_update_bits(adv7511->regmap, 0xfb,
 				   0x6, low_refresh_rate << 1);
 	else
@@ -921,7 +921,7 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	if (adv->info->type == ADV7533 || adv->info->type == ADV7535)
+	if (adv->info->has_dsi)
 		return adv7533_mode_valid(adv, mode);
 	else
 		return adv7511_mode_valid(adv, mode);
@@ -1086,7 +1086,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
 		goto err;
 	}
 
-	if (adv->info->type == ADV7533 || adv->info->type == ADV7535) {
+	if (adv->info->has_dsi) {
 		ret = adv7533_patch_cec_registers(adv);
 		if (ret)
 			goto err;
@@ -1245,7 +1245,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 		goto uninit_regulators;
 	dev_dbg(dev, "Rev. %d\n", val);
 
-	if (info->type == ADV7511)
+	if (!info->has_dsi)
 		ret = regmap_register_patch(adv7511->regmap,
 					    adv7511_fixed_registers,
 					    ARRAY_SIZE(adv7511_fixed_registers));
@@ -1316,7 +1316,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511_audio_init(dev, adv7511);
 
-	if (info->type == ADV7533 || info->type == ADV7535) {
+	if (info->has_dsi) {
 		ret = adv7533_attach_dsi(adv7511);
 		if (ret)
 			goto err_unregister_audio;
@@ -1370,7 +1370,8 @@ static const struct adv7511_chip_info adv7533_chip_info = {
 	.max_mode_clock = 80000,
 	.max_lane_freq = 800000,
 	.supply_names = adv7533_supply_names,
-	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
+	.has_dsi = 1
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
@@ -1378,7 +1379,8 @@ static const struct adv7511_chip_info adv7535_chip_info = {
 	.max_mode_clock = 148500,
 	.max_lane_freq = 891000,
 	.supply_names = adv7533_supply_names,
-	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
+	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
+	.has_dsi = 1
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

