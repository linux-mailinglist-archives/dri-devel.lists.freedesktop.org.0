Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BA3E13B6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAB56E9D7;
	Thu,  5 Aug 2021 11:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8C56E9D8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:19:49 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mBbPf-00080g-Ac; Thu, 05 Aug 2021 13:19:47 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mBbPe-0003XM-Eq; Thu, 05 Aug 2021 13:19:46 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/panel: simple: add Multi-Innotechnology
 MI1010AIT-1CP1
Date: Thu,  5 Aug 2021 13:19:43 +0200
Message-Id: <20210805111944.13533-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805111944.13533-1-o.rempel@pengutronix.de>
References: <20210805111944.13533-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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

From: Sam Ravnborg <sam@ravnborg.org>

The Multi Innotechnology is a 10.1" 1280x800 panel.

The datasheet did not specify specific values for sync, back, front porch.
The values are a best guess based on values for similar panels.

Co-Developed-by: Sam Ravnborg <sam@ravnborg.org>
Co-Developed-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 1b80290c2b53..58ba26dbf852 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3033,6 +3033,37 @@ static const struct panel_desc mitsubishi_aa070mc01 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
+static const struct display_timing multi_inno_mi1010ait_1cp_timing = {
+	.pixelclock = { 68900000, 70000000, 73400000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 30, 60, 71 },
+	.hback_porch = { 30, 60, 71 },
+	.hsync_len = { 10, 10, 48 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 5, 10, 10 },
+	.vback_porch = { 5, 10, 10 },
+	.vsync_len = { 5, 6, 13 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc multi_inno_mi1010ait_1cp = {
+	.timings = &multi_inno_mi1010ait_1cp_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.delay = {
+		.enable = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing nec_nl12880bc20_05_timing = {
 	.pixelclock = { 67000000, 71000000, 75000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -4464,6 +4495,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "mitsubishi,aa070mc01-ca1",
 		.data = &mitsubishi_aa070mc01,
+	}, {
+		.compatible = "multi-inno,mi1010ait-1cp",
+		.data = &multi_inno_mi1010ait_1cp,
 	}, {
 		.compatible = "nec,nl12880bc20-05",
 		.data = &nec_nl12880bc20_05,
-- 
2.30.2

