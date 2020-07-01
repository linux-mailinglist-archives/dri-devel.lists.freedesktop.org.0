Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616A211CD2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA686EA6B;
	Thu,  2 Jul 2020 07:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39EB6E954
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593620974; bh=zkODNCMULY1qflHx9pXN2q3BlZBV4YZQDDm3YdTOqMc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=VlBBBRxm4dDrG8c8iIovoYlpXJu+hCvaSfB9J6AdHQbVWWGBO2bvdhfMmVvMC2EHw
 Uqy0FqKroZVhout9bEXq4bvkuOj9owK0wfJTFenzrZhxZmPKIu0T/8a8tfsnZ2fgcs
 +olWZv1pbU3QzvCoNqACDfZVI1nXZ+nC6PQW9wBo=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v7 08/13] drm/panel: st7703: Move generic part of init
 sequence to enable callback
Date: Wed,  1 Jul 2020 18:29:23 +0200
Message-Id: <20200701162928.1638874-9-megous@megous.com>
In-Reply-To: <20200701162928.1638874-1-megous@megous.com>
References: <20200701162928.1638874-1-megous@megous.com>
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

Calling sleep out and display on is a controller specific part
of the initialization process. Move it out of the panel specific
initialization function to the enable callback.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 61872f623fff..96e39ec94900 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -84,8 +84,6 @@ static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
 static int jh057n_init_sequence(struct st7703 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	struct device *dev = ctx->dev;
-	int ret;
 
 	/*
 	 * Init sequence was supplied by the panel vendor. Most of the commands
@@ -136,20 +134,7 @@ static int jh057n_init_sequence(struct st7703 *ctx)
 			      0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
 			      0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
 			      0x11, 0x18);
-	msleep(20);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	/* Panel is operational 120 msec after reset */
-	msleep(60);
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
 	return 0;
 }
 
@@ -180,6 +165,7 @@ struct st7703_panel_desc jh057n00900_panel_desc = {
 static int st7703_enable(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
 	ret = ctx->desc->init_sequence(ctx);
@@ -189,6 +175,23 @@ static int st7703_enable(struct drm_panel *panel)
 		return ret;
 	}
 
+	msleep(20);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	/* Panel is operational 120 msec after reset */
+	msleep(60);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret)
+		return ret;
+
+	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Panel init sequence done\n");
+
 	return 0;
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
