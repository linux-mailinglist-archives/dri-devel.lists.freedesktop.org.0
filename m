Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C4211CDE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905276EA51;
	Thu,  2 Jul 2020 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAC26E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593599492; bh=io8IIDWW5fH3zfZMutivNOdZXhTkjY8qZHk7MdbKacI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=gy45UMG7npGE5n3k3wmTIWyxBRnS3RNnq0zN/QhbfTZmzOZWPdJVXclVZhxc62Mfg
 z5y2m6G1YbAGjR3ctVxjMOrpB/CG2my9Ihja8LqpIP3zJOnDb2B6YGd5EMERsJ6trQ
 0jvtNZsoedRGwUBKixGUQ2eaYfGGyRFi9JGH+XN4=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v6 07/13] drm/panel: st7703: Move code specific to jh057n
 closer together
Date: Wed,  1 Jul 2020 12:31:20 +0200
Message-Id: <20200701103126.1512615-8-megous@megous.com>
In-Reply-To: <20200701103126.1512615-1-megous@megous.com>
References: <20200701103126.1512615-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's better than having it spread around the driver.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 08cbc316266c..d03aab10cfef 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -153,6 +153,31 @@ static int jh057n_init_sequence(struct st7703 *ctx)
 	return 0;
 }
 
+static const struct drm_display_mode jh057n00900_mode = {
+	.hdisplay    = 720,
+	.hsync_start = 720 + 90,
+	.hsync_end   = 720 + 90 + 20,
+	.htotal	     = 720 + 90 + 20 + 20,
+	.vdisplay    = 1440,
+	.vsync_start = 1440 + 20,
+	.vsync_end   = 1440 + 20 + 4,
+	.vtotal	     = 1440 + 20 + 4 + 12,
+	.vrefresh    = 60,
+	.clock	     = 75276,
+	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm    = 65,
+	.height_mm   = 130,
+};
+
+struct st7703_panel_desc jh057n00900_panel_desc = {
+	.mode = &jh057n00900_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO |
+		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = jh057n_init_sequence,
+};
+
 static int st7703_enable(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
@@ -226,31 +251,6 @@ static int st7703_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode jh057n00900_mode = {
-	.hdisplay    = 720,
-	.hsync_start = 720 + 90,
-	.hsync_end   = 720 + 90 + 20,
-	.htotal	     = 720 + 90 + 20 + 20,
-	.vdisplay    = 1440,
-	.vsync_start = 1440 + 20,
-	.vsync_end   = 1440 + 20 + 4,
-	.vtotal	     = 1440 + 20 + 4 + 12,
-	.vrefresh    = 60,
-	.clock	     = 75276,
-	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-	.width_mm    = 65,
-	.height_mm   = 130,
-};
-
-struct st7703_panel_desc jh057n00900_panel_desc = {
-	.mode = &jh057n00900_mode,
-	.lanes = 4,
-	.mode_flags = MIPI_DSI_MODE_VIDEO |
-		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
-	.format = MIPI_DSI_FMT_RGB888,
-	.init_sequence = jh057n_init_sequence,
-};
-
 static int st7703_get_modes(struct drm_panel *panel,
 			    struct drm_connector *connector)
 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
