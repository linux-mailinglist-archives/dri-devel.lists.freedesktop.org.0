Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CD78D688
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F236E10E537;
	Wed, 30 Aug 2023 14:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0480E10E537
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:25:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; d="scan'208";a="178194122"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 30 Aug 2023 23:25:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 83DBE42170F5;
 Wed, 30 Aug 2023 23:24:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 8/8] drm: adv7511: Add hpd_override_enable variable to
 struct adv7511_chip_info
Date: Wed, 30 Aug 2023 15:23:58 +0100
Message-Id: <20230830142358.275459-9-biju.das.jz@bp.renesas.com>
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

As per spec, it is allowed to pulse the HPD signal to indicate that the
EDID information has changed. Some monitors do this when they wake up
from standby or are enabled. When the HPD goes low the adv7511 is
reset and the outputs are disabled which might cause the monitor to
go to standby again. To avoid this we ignore the HPD pin for the
first few seconds after enabling the output. On the other hand,
adv7535 require to enable HPD Override bit for proper HPD.

Add hpd_override_enable variable to struct adv7511_chip_info to handle
this scenario.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Restored enum adv7511_type as there are users.
 * Replaced variable type from unsigned->bool.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 0d39e32b0793..39c9ece373b0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -342,6 +342,7 @@ struct adv7511_chip_info {
 	unsigned int reg_cec_offset;
 	bool has_dsi;
 	bool link_config;
+	bool hpd_override_enable;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index e0ec3c098225..83ff4206b3b7 100644
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
@@ -1379,6 +1379,7 @@ static const struct adv7511_chip_info adv7535_chip_info = {
 	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
 	.reg_cec_offset = ADV7533_REG_CEC_OFFSET,
 	.has_dsi = true,
+	.hpd_override_enable = true,
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
-- 
2.25.1

