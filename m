Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9B13A2D2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2246E30E;
	Tue, 14 Jan 2020 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5C6898AA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1578932279; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3z5w0J/a8B4Msjz2/v9/hSWCfiswHbHO7q2kYy3wcw=;
 b=VRPmxcaq+6MT/1QPjnKaN9/+z0YjS0d2UkhZUi+SaKGEkV18eLuWFZXzrtchY6Ur7/0npu
 IrXkZZIm6N8m9KmLFpYYFWZV+2YqVgohVNFWNGcacQigy+05D9fdyDQ0jSJFnQEDCMYtCv
 ApSsDd8ng69OQYVuf03J6oWL6bNJPbI=
From: Paul Cercueil <paul@crapouillou.net>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 3/3] drm/panel: simple: Add support for the Frida
 FRD350H54004 panel
Date: Mon, 13 Jan 2020 13:17:41 -0300
Message-Id: <20200113161741.32061-3-paul@crapouillou.net>
In-Reply-To: <20200113161741.32061-1-paul@crapouillou.net>
References: <20200113161741.32061-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The FRD350H54004 is a simple 3.5" 320x240 24-bit TFT panel, found for
instance inside the Anbernic RG-350 handheld gaming console.

v2: Order alphabetically
v3: Add connector_type, and update timings according to the constraints
    listed in the datasheet

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e14c14ac62b5..d6f77bc494c7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1440,6 +1440,33 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode frida_frd350h54004_mode = {
+	.clock = 6000,
+	.hdisplay = 320,
+	.hsync_start = 320 + 44,
+	.hsync_end = 320 + 44 + 16,
+	.htotal = 320 + 44 + 16 + 20,
+	.vdisplay = 240,
+	.vsync_start = 240 + 2,
+	.vsync_end = 240 + 2 + 6,
+	.vtotal = 240 + 2 + 6 + 2,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc frida_frd350h54004 = {
+	.modes = &frida_frd350h54004_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 77,
+		.height = 64,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode friendlyarm_hd702e_mode = {
 	.clock		= 67185,
 	.hdisplay	= 800,
@@ -3309,6 +3336,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "foxlink,fl500wvr00-a0t",
 		.data = &foxlink_fl500wvr00_a0t,
+	}, {
+		.compatible = "frida,frd350h54004",
+		.data = &frida_frd350h54004,
 	}, {
 		.compatible = "friendlyarm,hd702e",
 		.data = &friendlyarm_hd702e,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
