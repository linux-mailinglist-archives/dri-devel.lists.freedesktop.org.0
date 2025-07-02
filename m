Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C396AF0DD1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 10:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CB510E2E2;
	Wed,  2 Jul 2025 08:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A92810E2E2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 08:23:41 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 9FFB51F0003D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 08:23:39 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 1E130AC98C5; Wed,  2 Jul 2025 08:23:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
 autolearn_force=no version=4.0.0
Received: from localhost.localdomain (unknown [192.168.1.64])
 by laika.paulk.fr (Postfix) with ESMTP id 104AFAC98BE;
 Wed,  2 Jul 2025 08:22:33 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 2/2] drm/panel: simple: Add Olimex LCD-OLinuXino-5CTS
 support
Date: Wed,  2 Jul 2025 10:22:30 +0200
Message-ID: <20250702082230.1291953-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702082230.1291953-1-paulk@sys-base.io>
References: <20250702082230.1291953-1-paulk@sys-base.io>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel
with a mode operating at 33.3 MHz.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0a3b26bb4d73..b3d7a0eeabd5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3655,6 +3655,29 @@ static const struct panel_desc olimex_lcd_olinuxino_43ts = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode olimex_lcd_olinuxino_5cts_mode = {
+	.clock = 33300,
+	.hdisplay = 800,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 20,
+	.htotal = 800 + 210 + 20 + 26,
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 10,
+	.vtotal = 480 + 22 + 10 + 13,
+};
+
+static const struct panel_desc olimex_lcd_olinuxino_5cts = {
+	.modes = &olimex_lcd_olinuxino_5cts_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+
 static const struct display_timing ontat_kd50g21_40nt_a1_timing = {
 	.pixelclock = { 30000000, 30000000, 50000000 },
 	.hactive = { 800, 800, 800 },
@@ -5214,6 +5237,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "olimex,lcd-olinuxino-43-ts",
 		.data = &olimex_lcd_olinuxino_43ts,
+	}, {
+		.compatible = "olimex,lcd-olinuxino-5-cts",
+		.data = &olimex_lcd_olinuxino_5cts,
 	}, {
 		.compatible = "ontat,kd50g21-40nt-a1",
 		.data = &ontat_kd50g21_40nt_a1,
-- 
2.49.0

