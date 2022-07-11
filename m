Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED1570797
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C13C8F45A;
	Mon, 11 Jul 2022 15:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2578F451
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:40 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id trqd2700Z4C55Sk01rqdeL; Mon, 11 Jul 2022 17:50:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-0036wx-8w; Mon, 11 Jul 2022 17:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgC-006sh9-RW; Mon, 11 Jul 2022 17:50:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 01/10] video: fbdev: atari: Simplify atafb_pan_display()
Date: Mon, 11 Jul 2022 17:50:25 +0200
Message-Id: <7b7c1c25309f40d780e25b258f726e6ebcc79ca4.1657554353.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
References: <cover.1657554353.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fb_pan_display() function in the core already takes care of
validating the panning parameters before calling the driver's
.fb_pan_display() callback, and of updating the panning state
afterwards, so there is no need to repeat that in the driver.

Remove the duplicate code.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/atafb.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 102c727cedc0f005..c0683d2a4efaf1e8 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2407,35 +2407,10 @@ static void atafb_set_disp(struct fb_info *info)
 static int
 atafb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 {
-	int xoffset = var->xoffset;
-	int yoffset = var->yoffset;
-	int err;
-
-	if (var->vmode & FB_VMODE_YWRAP) {
-		if (yoffset < 0 || yoffset >= info->var.yres_virtual || xoffset)
-			return -EINVAL;
-	} else {
-		if (xoffset + info->var.xres > info->var.xres_virtual ||
-		    yoffset + info->var.yres > info->var.yres_virtual)
-			return -EINVAL;
-	}
-
-	if (fbhw->pan_display) {
-		err = fbhw->pan_display(var, info);
-		if (err)
-			return err;
-	} else
+	if (!fbhw->pan_display)
 		return -EINVAL;
 
-	info->var.xoffset = xoffset;
-	info->var.yoffset = yoffset;
-
-	if (var->vmode & FB_VMODE_YWRAP)
-		info->var.vmode |= FB_VMODE_YWRAP;
-	else
-		info->var.vmode &= ~FB_VMODE_YWRAP;
-
-	return 0;
+	return fbhw->pan_display(var, info);
 }
 
 /*
-- 
2.25.1

