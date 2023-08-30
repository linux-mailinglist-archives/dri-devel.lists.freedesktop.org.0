Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FE78D681
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5E110E532;
	Wed, 30 Aug 2023 14:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1ADD10E532
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:24:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; d="scan'208";a="178194102"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5805F42170F5;
 Wed, 30 Aug 2023 23:24:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/8] drm: adv7511: Add max_lane_freq_khz variable to struct
 adv7511_chip_info
Date: Wed, 30 Aug 2023 15:23:53 +0100
Message-Id: <20230830142358.275459-4-biju.das.jz@bp.renesas.com>
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

The ADV7533 supports a maximum lane clock of 800MHz whereas it is 891MHz
for ADV7535. Add max_lane_freq_khz variable to struct adv7511_chip_info to
handle this difference.

While at it, drop the unused local variable max_lane_freq.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
 * Added Rb tag from Laurent.
 * Replaced max_lane_freq->max_lane_freq_khz in struct adv7511_chip_info.
 * Replaced variable type from unsigned long->unsigned int.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 ++
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index b9c6c1e8a353..f8d61f2fa30e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -336,6 +336,7 @@ enum adv7511_type {
 struct adv7511_chip_info {
 	enum adv7511_type type;
 	unsigned int max_mode_clock_khz;
+	unsigned int max_lane_freq_khz;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 12ceffd6a9eb..1c76aa5a5d5b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1370,11 +1370,13 @@ static const struct adv7511_chip_info adv7511_chip_info = {
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
 	.max_mode_clock_khz = 80000,
+	.max_lane_freq_khz = 800000,
 };
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
 	.max_mode_clock_khz = 148500,
+	.max_lane_freq_khz = 891000,
 };
 
 static const struct i2c_device_id adv7511_i2c_ids[] = {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 1d113489754c..4481489aaf5e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -103,7 +103,6 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
 enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 					const struct drm_display_mode *mode)
 {
-	unsigned long max_lane_freq;
 	struct mipi_dsi_device *dsi = adv->dsi;
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
@@ -112,9 +111,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 		return MODE_CLOCK_HIGH;
 
 	/* Check max clock for each lane */
-	max_lane_freq = (adv->info->type == ADV7533 ? 800000 : 891000);
-
-	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
+	if (mode->clock * bpp > adv->info->max_lane_freq_khz * adv->num_dsi_lanes)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
-- 
2.25.1

