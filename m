Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B42235BE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD006ED2D;
	Fri, 17 Jul 2020 07:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E647F6EC5D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594904216; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXVJEzr99w/7orElqKOLhLQwbYcOBGYdsx3Qi8Km2b8=;
 b=Ftr2O4KfjMmYkxroaUSB6tD55JtcuDXjyNzz2kF/PyEnFKiERZafbni/CQ7VWtdhbqEvxr
 U5KYRzNF7AOLDhQXrc/8uuc6Sgfn5hCpwiCGmAnyl3xQK2HDnyQxFzP867mPZHByHl84BS
 rFoYjWKbVkuJTx6qKkVKIOw6VY3BzI0=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/2] drm/panel-simple: Add 50 Hz mode to the Frida
 FRD350H54004 panel
Date: Thu, 16 Jul 2020 14:56:47 +0200
Message-Id: <20200716125647.10964-2-paul@crapouillou.net>
In-Reply-To: <20200716125647.10964-1-paul@crapouillou.net>
References: <20200716125647.10964-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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

v2: Rebase on drm-misc-next

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-simple.c | 40 +++++++++++++++++++---------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8b0bab9dd075..88493538a147 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1753,22 +1753,36 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
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
