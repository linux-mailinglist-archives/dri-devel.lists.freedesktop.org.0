Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E101211CC1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5459B6EA58;
	Thu,  2 Jul 2020 07:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BE56E139
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593620975; bh=xHG5qJNwJythr0yZAk0g86hoDZe3XW6J8JdaM3wh/Nw=;
 h=From:To:Cc:Subject:Date:References:From;
 b=tggq4IapBHxpnVXBDxWfiqOZwMos+DoXidEnSOW9FAAfQ2gfDy0hsC0MadCscT58R
 xXLBhRy/l60FNCcFW33qflNZOnM3XH4AcGO/tNGHUFzcgINoNSzoNHwmuQ6fg1nA0B
 5X/Tn7BuGdydU8bb68mBB+MPR9JrpP5q9yLMzQ6Q=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v7 10/13] drm/panel: st7703: Enter sleep after display off
Date: Wed,  1 Jul 2020 18:29:25 +0200
Message-Id: <20200701162928.1638874-11-megous@megous.com>
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

The datasheet suggests to issue sleep in after display off
as a part of the panel's shutdown sequence.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index dadb482b244d..7750179bca60 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -393,8 +393,19 @@ static int st7703_disable(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->dev,
+			      "Failed to turn off the display: %d\n", ret);
 
-	return mipi_dsi_dcs_set_display_off(dsi);
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->dev,
+			      "Failed to enter sleep mode: %d\n", ret);
+
+	return 0;
 }
 
 static int st7703_unprepare(struct drm_panel *panel)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
