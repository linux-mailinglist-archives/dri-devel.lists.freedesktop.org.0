Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436551A3033
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022106EB89;
	Thu,  9 Apr 2020 07:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AE46EA05
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1586339919; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSR9nQkyF4DBPaExFU5zaml0Mvv3jyWL8K6syxRKung=;
 b=r0KMX/oHKchaVf2qeMt8+U0VrIObQxTS/8l8eRllJ0Hgu6b5Mw5W5GPfR2B9/IzE9xcajM
 tk3U1sTjNeMrNN37j+IMgaU74Xl6PcAW/cWuwWAYEfw5YcN5tIFtxOZ3itEXhoPQKE8ceU
 w91Ilqg3ypxGcVjqyF6O//9sX2E1BTs=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/2] drm/panel: NT39016: Add support for 50 Hz refresh rate
Date: Wed,  8 Apr 2020 11:58:30 +0200
Message-Id: <20200408095830.8131-2-paul@crapouillou.net>
In-Reply-To: <20200408095830.8131-1-paul@crapouillou.net>
References: <20200408095830.8131-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By changing the pixel clock and the length of the back porch, it is
possible to obtain a perfect 50 Hz refresh rate.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index f1286cf6528b..05cae8d62d56 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -325,7 +325,7 @@ static int nt39016_remove(struct spi_device *spi)
 }
 
 static const struct drm_display_mode kd035g6_display_modes[] = {
-	{
+	{	/* 60 Hz */
 		.clock = 6000,
 		.hdisplay = 320,
 		.hsync_start = 320 + 10,
@@ -338,6 +338,19 @@ static const struct drm_display_mode kd035g6_display_modes[] = {
 		.vrefresh = 60,
 		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	},
+	{	/* 50 Hz */
+		.clock = 5400,
+		.hdisplay = 320,
+		.hsync_start = 320 + 42,
+		.hsync_end = 320 + 42 + 50,
+		.htotal = 320 + 42 + 50 + 20,
+		.vdisplay = 240,
+		.vsync_start = 240 + 5,
+		.vsync_end = 240 + 5 + 1,
+		.vtotal = 240 + 5 + 1 + 4,
+		.vrefresh = 50,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
 };
 
 static const struct nt39016_panel_info kd035g6_info = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
