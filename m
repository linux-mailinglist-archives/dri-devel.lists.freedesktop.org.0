Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E246B21806A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990FA6E883;
	Wed,  8 Jul 2020 07:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1062F89AA7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594127240; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjUN5iHsuoX3i3c10PKFGKRySNFxu1qtYOPInkkgVzM=;
 b=RS5Z4PVVeEE7Cgt3y1X3NbDmFYU5FoyMgJGnNHJdGUWE3OcYWpyusZ2g0/UkBY6cyMr7vD
 +DZ3qzooRvYao2dY23C4RXNVdpFrTlUWcMJuw4q5lphm8ZQzoyGv/N7/R+QaSdxE04Vm9I
 DwYE1ozQrW0bJKMWbHsBP7QkwfUGL8Q=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/2] drm/panel-simple: Add 50 Hz mode to the Frida
 FRD350H54004 panel
Date: Tue,  7 Jul 2020 15:07:07 +0200
Message-Id: <20200707130707.51843-2-paul@crapouillou.net>
In-Reply-To: <20200707130707.51843-1-paul@crapouillou.net>
References: <20200707130707.51843-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By changing the pixel clock and the length of the back porch, it is
possible to obtain a perfect 50 Hz refresh rate.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-simple.c | 43 +++++++++++++++++++---------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 1188d191076b..bebcc31e2484 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1692,23 +1692,38 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
-static const struct drm_display_mode frida_frd350h54004_mode = {
-	.clock = 6000,
-	.hdisplay = 320,
-	.hsync_start = 320 + 44,
-	.hsync_end = 320 + 44 + 16,
-	.htotal = 320 + 44 + 16 + 20,
-	.vdisplay = 240,
-	.vsync_start = 240 + 2,
-	.vsync_end = 240 + 2 + 6,
-	.vtotal = 240 + 2 + 6 + 2,
-	.vrefresh = 60,
-	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+static const struct drm_display_mode frida_frd350h54004_modes[] = {
+	{ /* 60 Hz */
+		.clock = 6000,
+		.hdisplay = 320,
+		.hsync_start = 320 + 44,
+		.hsync_end = 320 + 44 + 16,
+		.htotal = 320 + 44 + 16 + 20,
+		.vdisplay = 240,
+		.vsync_start = 240 + 2,
+		.vsync_end = 240 + 2 + 6,
+		.vtotal = 240 + 2 + 6 + 2,
+		.vrefresh = 60,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+	{ /* 50 Hz */
+		.clock = 5400,
+		.hdisplay = 320,
+		.hsync_start = 320 + 56,
+		.hsync_end = 320 + 56 + 16,
+		.htotal = 320 + 56 + 16 + 40,
+		.vdisplay = 240,
+		.vsync_start = 240 + 2,
+		.vsync_end = 240 + 2 + 6,
+		.vtotal = 240 + 2 + 6 + 2,
+		.vrefresh = 50,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
 };
 
 static const struct panel_desc frida_frd350h54004 = {
-	.modes = &frida_frd350h54004_mode,
-	.num_modes = 1,
+	.modes = frida_frd350h54004_modes,
+	.num_modes = ARRAY_SIZE(frida_frd350h54004_modes),
 	.bpc = 8,
 	.size = {
 		.width = 77,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
