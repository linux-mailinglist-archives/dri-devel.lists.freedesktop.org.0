Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2969F6E60
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 20:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1309310E338;
	Wed, 18 Dec 2024 19:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074510E338
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 19:45:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1tNzyo-0006vF-KF; Wed, 18 Dec 2024 20:45:10 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <a.fatoum@pengutronix.de>) id 1tNzym-0045Eb-0o;
 Wed, 18 Dec 2024 20:45:09 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
 by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <a.fatoum@pengutronix.de>) id 1tNzym-00DT63-31;
 Wed, 18 Dec 2024 20:45:08 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 18 Dec 2024 20:45:00 +0100
Subject: [PATCH 3/3] drm: panel-simple: support TOPLAND TIAN G07017 LCD panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241218-topland-tian-g07017-v1-3-d5e411c199e3@pengutronix.de>
References: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
In-Reply-To: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

The TIAN-G07017-01 is a 7" TFT-LCD module by TOPLAND ELECTRONICS (H.K).
The panel features 1024x600 24-bit RGB pixels driven over LVDS as well
as a PWM backlight and I2C-connected ft5506-compatible capacitive touch.

The panel description is taken from the Datasheet V0 (2024.5.23), but
it lists no timings and these were provided by the vendor separately.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 222c170dde8be261e98ff41168ef8a3a42c167c8..626cbc6858215f6fdc72063e38564e2dc1deb52c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4361,6 +4361,37 @@ static const struct panel_desc ti_nspire_classic_lcd_panel = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct display_timing topland_tian_g07017_01_timing = {
+	.pixelclock = { 44900000, 51200000, 63000000 },
+	.hactive = { 1024, 1024, 1024 },
+	.hfront_porch = { 16, 160, 216 },
+	.hback_porch = { 160, 160, 160 },
+	.hsync_len = { 1, 1, 140 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 1, 12, 127 },
+	.vback_porch = { 23, 23, 23 },
+	.vsync_len = { 1, 1, 20 },
+};
+
+static const struct panel_desc topland_tian_g07017_01 = {
+	.timings = &topland_tian_g07017_01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.delay = {
+		.prepare = 1, /* 6.5 - 150µs PLL wake-up time */
+		.enable = 100,  /* 6.4 - Power on: 6 VSyncs */
+		.disable = 84, /* 6.4 - Power off: 5 Vsyncs */
+		.unprepare = 50, /* 6.4 - Power off: 3 Vsyncs */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct drm_display_mode toshiba_lt089ac29000_mode = {
 	.clock = 79500,
 	.hdisplay = 1280,
@@ -5037,6 +5068,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "toshiba,lt089ac29000",
 		.data = &toshiba_lt089ac29000,
+	}, {
+		.compatible = "topland,tian-g07017-01",
+		.data = &topland_tian_g07017_01,
 	}, {
 		.compatible = "tpk,f07a-0102",
 		.data = &tpk_f07a_0102,

-- 
2.39.5

