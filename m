Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DE309BA5
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE116E161;
	Sun, 31 Jan 2021 11:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7816E09A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 18:11:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DSj2P69GRz1qs38;
 Sat, 30 Jan 2021 19:11:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DSj2P5w3Tz1tYTW;
 Sat, 30 Jan 2021 19:11:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id QbQfprgeWiUm; Sat, 30 Jan 2021 19:11:24 +0100 (CET)
X-Auth-Info: 75/lHBaT8xbCLaC9OrnnjV35XGPS4ICpUqxE9NR3rdM=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 30 Jan 2021 19:11:24 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: simple: Add Displaytech DT050TFT-PTS panel
Date: Sat, 30 Jan 2021 19:11:14 +0100
Message-Id: <20210130181114.161515-3-marex@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130181114.161515-1-marex@denx.de>
References: <20210130181114.161515-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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

Add support for the Displaytech DT050TFT-PTS 5.0" (800x480)
color TFT LCD panel, connected over DPI.

Timings are taken from the datasheet Rev 0.0.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 204674fccd64..4e31fe04fe49 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1625,6 +1625,36 @@ static const struct panel_desc dataimage_scf0700c48ggu18 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
+static const struct display_timing displaytech_dt050tft_pts_timing = {
+	.pixelclock = { 30000000, 40000000, 50000000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 1, 40, 255 },
+	.hback_porch = { 88, 88, 88 },
+	.hsync_len = { 1, 48, 255 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 1, 13, 255 },
+	.vback_porch = { 32, 32, 32 },
+	.vsync_len = { 3, 3, 255 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc displaytech_dt050tft_pts = {
+	.timings = &displaytech_dt050tft_pts_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 121,
+		.height = 76,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing dlc_dlc0700yzg_1_timing = {
 	.pixelclock = { 45000000, 51200000, 57000000 },
 	.hactive = { 1024, 1024, 1024 },
@@ -4015,6 +4045,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "dataimage,scf0700c48ggu18",
 		.data = &dataimage_scf0700c48ggu18,
+	}, {
+		.compatible = "displaytech,dt050tft-pts",
+		.data = &displaytech_dt050tft_pts,
 	}, {
 		.compatible = "dlc,dlc0700yzg-1",
 		.data = &dlc_dlc0700yzg_1,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
