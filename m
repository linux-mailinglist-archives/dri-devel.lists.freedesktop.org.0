Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FCB570738
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C03B10FC04;
	Mon, 11 Jul 2022 15:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715C214A28E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:37:57 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id trdu2700T4C55Sk01rdvwV; Mon, 11 Jul 2022 17:37:55 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvTu-0036qj-JG; Mon, 11 Jul 2022 17:37:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvTt-006sLV-Ib; Mon, 11 Jul 2022 17:37:53 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: sa1100fb: Remove unused sa1100fb_setup()
Date: Mon, 11 Jul 2022 17:37:52 +0200
Message-Id: <9c53722c7e17ed8be4fc5d83dcd97192fb7d7d3e.1657553763.git.geert@linux-m68k.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sa1100fb_setup() has been unused since the beginning of Linux git
history.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/sa1100fb.c | 41 ----------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index e31cf63b0a62d485..017c8efe826703f4 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -1224,47 +1224,6 @@ int __init sa1100fb_init(void)
 	return platform_driver_register(&sa1100fb_driver);
 }
 
-int __init sa1100fb_setup(char *options)
-{
-#if 0
-	char *this_opt;
-
-	if (!options || !*options)
-		return 0;
-
-	while ((this_opt = strsep(&options, ",")) != NULL) {
-
-		if (!strncmp(this_opt, "bpp:", 4))
-			current_par.max_bpp =
-			    simple_strtoul(this_opt + 4, NULL, 0);
-
-		if (!strncmp(this_opt, "lccr0:", 6))
-			lcd_shadow.lccr0 =
-			    simple_strtoul(this_opt + 6, NULL, 0);
-		if (!strncmp(this_opt, "lccr1:", 6)) {
-			lcd_shadow.lccr1 =
-			    simple_strtoul(this_opt + 6, NULL, 0);
-			current_par.max_xres =
-			    (lcd_shadow.lccr1 & 0x3ff) + 16;
-		}
-		if (!strncmp(this_opt, "lccr2:", 6)) {
-			lcd_shadow.lccr2 =
-			    simple_strtoul(this_opt + 6, NULL, 0);
-			current_par.max_yres =
-			    (lcd_shadow.
-			     lccr0 & LCCR0_SDS) ? ((lcd_shadow.
-						    lccr2 & 0x3ff) +
-						   1) *
-			    2 : ((lcd_shadow.lccr2 & 0x3ff) + 1);
-		}
-		if (!strncmp(this_opt, "lccr3:", 6))
-			lcd_shadow.lccr3 =
-			    simple_strtoul(this_opt + 6, NULL, 0);
-	}
-#endif
-	return 0;
-}
-
 module_init(sa1100fb_init);
 MODULE_DESCRIPTION("StrongARM-1100/1110 framebuffer driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1

