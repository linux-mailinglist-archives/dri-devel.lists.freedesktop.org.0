Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDFD77AA81
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 20:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAFE10E0F4;
	Sun, 13 Aug 2023 18:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id B083910E0F4
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 18:06:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; d="scan'208";a="172836586"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Aug 2023 03:06:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4109A405E63A;
 Mon, 14 Aug 2023 03:05:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
Date: Sun, 13 Aug 2023 19:05:12 +0100
Message-Id: <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
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

As per spec, it is allowed to pulse the HPD signal to indicate that the
EDID information has changed. Some monitors do this when they wake up
from standby or are enabled. When the HPD goes low the adv7511 is
reset and the outputs are disabled which might cause the monitor to
go to standby again. To avoid this we ignore the HPD pin for the
first few seconds after enabling the output. On the other hand,
adv7535 require to enable HPD Override bit for proper HPD.

Add hpd_override_enable feature bit to struct adv7511_chip_info to handle
this scenario.

While at it, drop the enum adv7511_type as it is unused.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  8 +-------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 +++++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 627531f48f84..c523ac4c9bc8 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -325,22 +325,16 @@ struct adv7511_video_config {
 	struct hdmi_avi_infoframe avi_infoframe;
 };
 
-enum adv7511_type {
-	ADV7511,
-	ADV7533,
-	ADV7535,
-};
-
 #define ADV7511_MAX_ADDRS 3
 
 struct adv7511_chip_info {
-	enum adv7511_type type;
 	unsigned long max_mode_clock;
 	unsigned long max_lane_freq;
 	const char * const *supply_names;
 	unsigned int num_supplies;
 	unsigned has_dsi:1;
 	unsigned link_config:1;
+	unsigned hpd_override_enable:1;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6974c267b1d5..7b06a0a21685 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511 *adv7511)
 	 * first few seconds after enabling the output. On the other hand
 	 * adv7535 require to enable HPD Override bit for proper HPD.
 	 */
-	if (adv7511->info->type == ADV7535)
+	if (adv7511->info->hpd_override_enable)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE);
@@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
 static void __adv7511_power_off(struct adv7511 *adv7511)
 {
 	/* TODO: setup additional power down modes */
-	if (adv7511->info->type == ADV7535)
+	if (adv7511->info->hpd_override_enable)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 				   ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
 
@@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 			status = connector_status_disconnected;
 	} else {
 		/* Renable HPD sensing */
-		if (adv7511->info->type == ADV7535)
+		if (adv7511->info->hpd_override_enable)
 			regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
 					   ADV7535_REG_POWER2_HPD_OVERRIDE,
 					   ADV7535_REG_POWER2_HPD_OVERRIDE);
@@ -1360,14 +1360,12 @@ static void adv7511_remove(struct i2c_client *i2c)
 }
 
 static const struct adv7511_chip_info adv7511_chip_info = {
-	.type = ADV7511,
 	.supply_names = adv7511_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
 	.link_config = 1
 };
 
 static const struct adv7511_chip_info adv7533_chip_info = {
-	.type = ADV7533,
 	.max_mode_clock = 80000,
 	.max_lane_freq = 800000,
 	.supply_names = adv7533_supply_names,
@@ -1376,12 +1374,12 @@ static const struct adv7511_chip_info adv7533_chip_info = {
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
-	.type = ADV7535,
 	.max_mode_clock = 148500,
 	.max_lane_freq = 891000,
 	.supply_names = adv7533_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
-	.has_dsi = 1
+	.has_dsi = 1,
+	.hpd_override_enable = 1
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

