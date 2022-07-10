Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AE56D11E
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A1618B064;
	Sun, 10 Jul 2022 19:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C077F18B061
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:51 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A522D83A2F;
 Sun, 10 Jul 2022 21:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482289;
 bh=moI3XvzBLj8CsQdy/exx+jLXzWo5+7u+5AySo68g08Y=;
 h=From:To:Cc:Subject:Date:From;
 b=zg8a/ag5wVn/moL19UOHQoBlbPHJgjfHn2vuQXtV9tzai2Tht9BOLAMcEz420PeDa
 8yKG1668Ybx1Y5PxrDl66U54qGuHj8ZWcHDH5NXDL1lPtkIFDPOLaPFufdyNov1cvn
 UhinNJbt0X1goRwrQI7DTgb6CaIWxhyIU1AOd0m+eTJwQxJdzyu6zVqA3oVAkv2zSM
 D6vTgrwKWJpVj53QUrmMui5GctOXocnrH2n8KQgOMJvEE5VBfxp4p0enFDmbQ5MAsD
 1jPQHRa4kEwQ0H7cJXz2tBbwPPWu7gqS4FLPCWMoRofY+Nfxv9p3nZiMCG/Gq59ZSr
 hR6v5Op6EF0aQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/panel/panel-sitronix-st7701: Make DSI mode flags
 common to ST7701
Date: Sun, 10 Jul 2022 21:44:29 +0200
Message-Id: <20220710194437.289042-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ST7701 and ST7701S are TFT matrix drivers with integrated multi
protocol decoder capable of DSI/DPI/SPI input and 480x360...864 line
TFT matrix output. Currently the only supported input is DSI.

The protocol decoder is separate from the TFT matrix driver and is
always capable of handling all of DSI non-burst mode with sync pulses
or sync events as well as DSI burst mode.

Move the DSI mode configuration from TFT matrix driver properties to
common ST7701 code, because this is common to all TFT matrices.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 320a2a8fd459..90b0e90eb6e2 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -89,7 +89,6 @@
 struct st7701_panel_desc {
 	const struct drm_display_mode *mode;
 	unsigned int lanes;
-	unsigned long flags;
 	enum mipi_dsi_pixel_format format;
 	const char *const *supply_names;
 	unsigned int num_supplies;
@@ -318,7 +317,6 @@ static const char * const ts8550b_supply_names[] = {
 static const struct st7701_panel_desc ts8550b_desc = {
 	.mode = &ts8550b_mode,
 	.lanes = 2,
-	.flags = MIPI_DSI_MODE_VIDEO,
 	.format = MIPI_DSI_FMT_RGB888,
 	.supply_names = ts8550b_supply_names,
 	.num_supplies = ARRAY_SIZE(ts8550b_supply_names),
@@ -336,7 +334,7 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 		return -ENOMEM;
 
 	desc = of_device_get_match_data(&dsi->dev);
-	dsi->mode_flags = desc->flags;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
 
-- 
2.35.1

