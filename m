Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBB78D685
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7334A10E53F;
	Wed, 30 Aug 2023 14:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id D802E10E536
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:24:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; d="scan'208";a="174486550"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E73842170F5;
 Wed, 30 Aug 2023 23:24:41 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 6/8] drm: adv7511: Add has_dsi variable to struct
 adv7511_chip_info
Date: Wed, 30 Aug 2023 15:23:56 +0100
Message-Id: <20230830142358.275459-7-biju.das.jz@bp.renesas.com>
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

The ADV7533 and ADV7535 have DSI support. Add a variable has_dsi to
struct adv7511_chip_info for handling configuration related to DSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced variable type from unsigned->bool.
 * Restored check using type for low_refresh_rate and
   regmap_register_patch().
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index a728bfb33d03..0dd56e311039 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -340,6 +340,7 @@ struct adv7511_chip_info {
 	const char * const *supply_names;
 	unsigned int num_supplies;
 	unsigned int reg_cec_offset;
+	bool has_dsi;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index d806c870bf76..9d88c29b6f59 100644
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
@@ -921,7 +921,7 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	if (adv->info->type == ADV7533 || adv->info->type == ADV7535)
+	if (adv->info->has_dsi)
 		return adv7533_mode_valid(adv, mode);
 	else
 		return adv7511_mode_valid(adv, mode);
@@ -1311,7 +1311,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511_audio_init(dev, adv7511);
 
-	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535) {
+	if (adv7511->info->has_dsi) {
 		ret = adv7533_attach_dsi(adv7511);
 		if (ret)
 			goto err_unregister_audio;
@@ -1367,6 +1367,7 @@ static const struct adv7511_chip_info adv7533_chip_info = {
 	.supply_names = adv7533_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
 	.reg_cec_offset = ADV7533_REG_CEC_OFFSET,
+	.has_dsi = true,
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
@@ -1376,6 +1377,7 @@ static const struct adv7511_chip_info adv7535_chip_info = {
 	.supply_names = adv7533_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
 	.reg_cec_offset = ADV7533_REG_CEC_OFFSET,
+	.has_dsi = true,
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

