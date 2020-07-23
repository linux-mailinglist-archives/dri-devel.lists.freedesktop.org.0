Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6D22B40F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 19:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485AE6E1A8;
	Thu, 23 Jul 2020 17:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA26E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 17:02:33 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jyebz-0007Ya-Q9; Thu, 23 Jul 2020 17:02:27 +0000
From: Colin King <colin.king@canonical.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH] video: fbdev: fix setting of pixclock because a pass-by-value
 error
Date: Thu, 23 Jul 2020 18:02:27 +0100
Message-Id: <20200723170227.996229-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The pixclock is being set locally because it is being passed as a
pass-by-value argument rather than pass-by-reference, so the computed
pixclock is never being set in var->pixclock. Fix this by passing
by reference.

[This dates back to 2002, I found the offending commit from the git
history git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git ]

Addresses-Coverity: ("Unused value")
Fixes: 115f4504a64a ("Removed currcon and other console related code. Very little is now left.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/fbdev/vga16fb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index a20eeb8308ff..52f273af6cae 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -243,7 +243,7 @@ static void vga16fb_update_fix(struct fb_info *info)
 }
 
 static void vga16fb_clock_chip(struct vga16fb_par *par,
-			       unsigned int pixclock,
+			       unsigned int *pixclock,
 			       const struct fb_info *info,
 			       int mul, int div)
 {
@@ -259,14 +259,14 @@ static void vga16fb_clock_chip(struct vga16fb_par *par,
 		{     0 /* bad */,    0x00, 0x00}};
 	int err;
 
-	pixclock = (pixclock * mul) / div;
+	*pixclock = (*pixclock * mul) / div;
 	best = vgaclocks;
-	err = pixclock - best->pixclock;
+	err = *pixclock - best->pixclock;
 	if (err < 0) err = -err;
 	for (ptr = vgaclocks + 1; ptr->pixclock; ptr++) {
 		int tmp;
 
-		tmp = pixclock - ptr->pixclock;
+		tmp = *pixclock - ptr->pixclock;
 		if (tmp < 0) tmp = -tmp;
 		if (tmp < err) {
 			err = tmp;
@@ -275,7 +275,7 @@ static void vga16fb_clock_chip(struct vga16fb_par *par,
 	}
 	par->misc |= best->misc;
 	par->clkdiv = best->seq_clock_mode;
-	pixclock = (best->pixclock * div) / mul;		
+	*pixclock = (best->pixclock * div) / mul;
 }
 			       
 #define FAIL(X) return -EINVAL
@@ -497,10 +497,10 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
 
 	if (mode & MODE_8BPP)
 		/* pixel clock == vga clock / 2 */
-		vga16fb_clock_chip(par, var->pixclock, info, 1, 2);
+		vga16fb_clock_chip(par, &var->pixclock, info, 1, 2);
 	else
 		/* pixel clock == vga clock */
-		vga16fb_clock_chip(par, var->pixclock, info, 1, 1);
+		vga16fb_clock_chip(par, &var->pixclock, info, 1, 1);
 	
 	var->red.offset = var->green.offset = var->blue.offset = 
 	var->transp.offset = 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
