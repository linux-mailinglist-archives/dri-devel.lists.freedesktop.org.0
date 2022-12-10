Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC362648E7C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 12:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2231410E055;
	Sat, 10 Dec 2022 11:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC45510E055
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 11:43:05 +0000 (UTC)
Received: from pop-os.home ([86.243.100.34]) by smtp.orange.fr with ESMTPA
 id 3y8gpaJiRNF1W3y8jp0xrl; Sat, 10 Dec 2022 12:35:33 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 10 Dec 2022 12:35:33 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michal Januszewski <spock@gentoo.org>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v2 2/2] video: fbdev: uvesafb: Simplify uvesafb_remove()
Date: Sat, 10 Dec 2022 12:35:23 +0100
Message-Id: <72b61f099e846dbb16c13ffb50c877ed196a308f.1670671944.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0eba6acb70fa1270d8cf798afd11ce342aa7e8e1.1670671944.git.christophe.jaillet@wanadoo.fr>
References: <0eba6acb70fa1270d8cf798afd11ce342aa7e8e1.1670671944.git.christophe.jaillet@wanadoo.fr>
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the remove() function is called, we know that the probe() function has
successfully been executed. So 'info' is known to be not NULL.

Simplify the code accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Change in v2:
  - new patch
---
 drivers/video/fbdev/uvesafb.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 0e3cabbec4b4..2bb95c35ab2a 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1777,25 +1777,23 @@ static int uvesafb_probe(struct platform_device *dev)
 static int uvesafb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
+	struct uvesafb_par *par = info->par;
 
-	if (info) {
-		struct uvesafb_par *par = info->par;
+	sysfs_remove_group(&dev->dev.kobj, &uvesafb_dev_attgrp);
+	unregister_framebuffer(info);
+	release_region(0x3c0, 32);
+	iounmap(info->screen_base);
+	arch_phys_wc_del(par->mtrr_handle);
+	release_mem_region(info->fix.smem_start, info->fix.smem_len);
+	fb_destroy_modedb(info->monspecs.modedb);
+	fb_dealloc_cmap(&info->cmap);
 
-		sysfs_remove_group(&dev->dev.kobj, &uvesafb_dev_attgrp);
-		unregister_framebuffer(info);
-		release_region(0x3c0, 32);
-		iounmap(info->screen_base);
-		arch_phys_wc_del(par->mtrr_handle);
-		release_mem_region(info->fix.smem_start, info->fix.smem_len);
-		fb_destroy_modedb(info->monspecs.modedb);
-		fb_dealloc_cmap(&info->cmap);
+	kfree(par->vbe_modes);
+	kfree(par->vbe_state_orig);
+	kfree(par->vbe_state_saved);
 
-		kfree(par->vbe_modes);
-		kfree(par->vbe_state_orig);
-		kfree(par->vbe_state_saved);
+	framebuffer_release(info);
 
-		framebuffer_release(info);
-	}
 	return 0;
 }
 
-- 
2.34.1

