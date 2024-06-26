Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52582918720
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315710E92C;
	Wed, 26 Jun 2024 16:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5F810E948
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:17:50 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.felsch@pengutronix.de>)
 id 1sMVL5-0008Im-L7; Wed, 26 Jun 2024 18:17:43 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: kernel@pengutronix.de, Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: simple: Add Jiangsu Smartwin
 SMMT043480272A-A19 panel
Date: Wed, 26 Jun 2024 18:17:13 +0200
Message-Id: <20240626161714.4057983-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626161714.4057983-1-m.felsch@pengutronix.de>
References: <20240626161714.4057983-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
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

From: Rouven Czerwinski <r.czerwinski@pengutronix.de>

Add support for the Jiangsu Smartwin SMMT043480272A-A19 4.3" 480x272
TFT-LCD panel. The timings are based on the ILI6485 controller IC
datasheet.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dcb6d0b6ced0..a06ad2cd76f0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2719,6 +2719,35 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
+static const struct display_timing jiangsu_smartwin_smmt043480272a_a19_timing = {
+	.pixelclock = { 8000000, 9000000, 12000000 },
+	.hactive = { 480, 480, 480 },
+	.hback_porch = { 1, 43, 43 },
+	.hfront_porch = { 4, 8, 75 },
+	.hsync_len = { 2, 4, 75 },
+	.vactive = { 272, 272, 272 },
+	.vback_porch = { 2, 12, 12 },
+	.vfront_porch = { 2, 8, 37 },
+	.vsync_len = { 2, 4, 37 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc jiangsu_smartwin_smmt043480272a_a19 = {
+	.timings = &jiangsu_smartwin_smmt043480272a_a19_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+};
+
 static const struct display_timing koe_tx14d24vm1bpa_timing = {
 	.pixelclock = { 5580000, 5850000, 6200000 },
 	.hactive = { 320, 320, 320 },
@@ -4626,6 +4655,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
+	}, {
+		.compatible = "jianda,smmt043480272a-a19",
+		.data = &jiangsu_smartwin_smmt043480272a_a19,
 	}, {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,
-- 
2.39.2

