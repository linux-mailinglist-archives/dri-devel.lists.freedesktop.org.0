Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA27789C16
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 10:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD9710E190;
	Sun, 27 Aug 2023 08:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 552 seconds by postgrey-1.36 at gabe;
 Sat, 26 Aug 2023 10:04:47 UTC
Received: from mail.mimoja.de (mail.mimoja.de [IPv6:2a00:17d8:100::c31])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAB9F10E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 10:04:47 +0000 (UTC)
Received: from Mimoja-Datenschleuder.. (ip-185-104-138-32.ptr.icomera.net
 [185.104.138.32])
 by mail.mimoja.de (Postfix) with ESMTPSA id CDE1A24C09;
 Sat, 26 Aug 2023 11:55:31 +0200 (CEST)
From: Mimoja <git@mimoja.de>
To: dri-devel@lists.freedesktop.org,
	mimoja@aachen.ccc.de,
	alu@fffuego.com
Subject: [PATCH] drm/panel/panel-sitronix-st7701: Move init sequence from
 prepare() to enable()
Date: Sat, 26 Aug 2023 11:55:16 +0200
Message-Id: <20230826095516.81387-1-git@mimoja.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Aug 2023 08:16:19 +0000
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Mimoja <git@mimoja.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct drm_panel_funcs are offering a prepare() and an enable()
entrypoint for panels. According to drm/panel.h:

"The .prepare() function is typically called before the display controller
starts to transmit video data."
and
"After the display controller has started transmitting video data, it's safe
 to call the .enable() function."

The st7701 driver currently does not respect this, queing DSI control commands
during enable.
While generally fine this can lead to a fillup of the transmission queue before
the transmission is set up on certain dsi bridges.
This issue can also be seen on downstream imx8m* kernels.
By moving the init sequence into the enable function we not only circumvent the issue
but also properly soft-reset the panel on enable().

Signed-off-by: Mimoja <git@mimoja.de>

Cc: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 7eae83aa0ea1..18c5a8d97cc8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -439,6 +439,13 @@ static int st7701_prepare(struct drm_panel *panel)
 	gpiod_set_value(st7701->reset, 1);
 	msleep(150);
 
+	return 0;
+}
+
+static int st7701_enable(struct drm_panel *panel)
+{
+	struct st7701 *st7701 = panel_to_st7701(panel);
+
 	st7701_init_sequence(st7701);
 
 	if (st7701->desc->gip_sequence)
@@ -447,13 +454,6 @@ static int st7701_prepare(struct drm_panel *panel)
 	/* Disable Command2 */
 	st7701_switch_cmd_bkx(st7701, false, 0);
 
-	return 0;
-}
-
-static int st7701_enable(struct drm_panel *panel)
-{
-	struct st7701 *st7701 = panel_to_st7701(panel);
-
 	ST7701_DSI(st7701, MIPI_DCS_SET_DISPLAY_ON, 0x00);
 
 	return 0;
-- 
2.39.2

