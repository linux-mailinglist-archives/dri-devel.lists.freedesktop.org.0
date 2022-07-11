Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D78570730
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219C88F208;
	Mon, 11 Jul 2022 15:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662238F216
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:35:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id trbs2700b4C55Sk01rbsZy; Mon, 11 Jul 2022 17:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvRw-0036pt-Ek; Mon, 11 Jul 2022 17:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvRv-006sIs-K9; Mon, 11 Jul 2022 17:35:51 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: amiga: Simplify amifb_pan_display()
Date: Mon, 11 Jul 2022 17:35:48 +0200
Message-Id: <b803f10a2b3b85386b25a2e25b98fb4e59413ea9.1657553681.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fb_pan_display() function in the core already takes care of
validating most panning parameters before calling the driver's
.fb_pan_display() callback, and of updating the panning state
afterwards, so there is no need to repeat that in the driver.

Remove the duplicate code.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/amifb.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 6e07a97bbd31a1dd..d88265dbebf4cb19 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -2540,27 +2540,16 @@ static int amifb_blank(int blank, struct fb_info *info)
 static int amifb_pan_display(struct fb_var_screeninfo *var,
 			     struct fb_info *info)
 {
-	if (var->vmode & FB_VMODE_YWRAP) {
-		if (var->yoffset < 0 ||
-			var->yoffset >= info->var.yres_virtual || var->xoffset)
-				return -EINVAL;
-	} else {
+	if (!(var->vmode & FB_VMODE_YWRAP)) {
 		/*
 		 * TODO: There will be problems when xpan!=1, so some columns
 		 * on the right side will never be seen
 		 */
 		if (var->xoffset + info->var.xres >
-		    upx(16 << maxfmode, info->var.xres_virtual) ||
-		    var->yoffset + info->var.yres > info->var.yres_virtual)
+		    upx(16 << maxfmode, info->var.xres_virtual))
 			return -EINVAL;
 	}
 	ami_pan_var(var, info);
-	info->var.xoffset = var->xoffset;
-	info->var.yoffset = var->yoffset;
-	if (var->vmode & FB_VMODE_YWRAP)
-		info->var.vmode |= FB_VMODE_YWRAP;
-	else
-		info->var.vmode &= ~FB_VMODE_YWRAP;
 	return 0;
 }
 
-- 
2.25.1

