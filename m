Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41A2319E3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A22E6E44F;
	Wed, 29 Jul 2020 06:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785C6E3EB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 20:12:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BGSXN21JPz1rt4G;
 Tue, 28 Jul 2020 22:12:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BGSXN1hCcz1qrgD;
 Tue, 28 Jul 2020 22:12:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OHtkq9POG9_6; Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
X-Auth-Info: lGXjcFGVCzYqnYucj7HX8wu5hDVJDesVUOuUk4MBRfo=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: simple: Add Chefree CH101OLHLWH-002 panel
Date: Tue, 28 Jul 2020 22:12:42 +0200
Message-Id: <20200728201242.4336-3-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728201242.4336-1-marex@denx.de>
References: <20200728201242.4336-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Chefree CH101OLHLWH-002 10.1" (1280x800)
color TFT LCD panel, connected over LVDS.

Timings are taken from the datasheet version P0.5.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 298e3a26d9ee..a8e1f6306923 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1414,6 +1414,36 @@ static const struct panel_desc cdtech_s070wv95_ct16 = {
 	},
 };
 
+static const struct display_timing chefree_ch101olhlwh_002_timing = {
+	.pixelclock = { 68900000, 71100000, 73400000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 65, 80, 95 },
+	.hback_porch = { 64, 79, 94 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 7, 11, 14 },
+	.vback_porch = { 7, 11, 14 },
+	.vsync_len = { 1, 1, 1 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc chefree_ch101olhlwh_002 = {
+	.timings = &chefree_ch101olhlwh_002_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 135,
+	},
+	.delay = {
+		.enable = 200,
+		.disable = 200,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode chunghwa_claa070wp03xg_mode = {
 	.clock = 66770,
 	.hdisplay = 800,
@@ -3845,6 +3875,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "cdtech,s070wv95-ct16",
 		.data = &cdtech_s070wv95_ct16,
+	}, {
+		.compatible = "chefree,ch101olhlwh-002",
+		.data = &chefree_ch101olhlwh_002,
 	}, {
 		.compatible = "chunghwa,claa070wp03xg",
 		.data = &chunghwa_claa070wp03xg,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
