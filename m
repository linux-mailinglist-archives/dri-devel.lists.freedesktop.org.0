Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC6D4B6AC2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 12:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91FB10E449;
	Tue, 15 Feb 2022 11:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 15 Feb 2022 11:26:37 UTC
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619F310E448
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 11:26:37 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8c73:faf1:1d11:4a47])
 by laurent.telenet-ops.be with bizsmtp
 id vPMZ2600A3BmCM301PMZ7K; Tue, 15 Feb 2022 12:21:33 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nJvtk-000rqf-KT; Tue, 15 Feb 2022 12:21:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nJvtk-00B351-6e; Tue, 15 Feb 2022 12:21:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 3/3] video: fbdev: atari: Remove unused atafb_setcolreg()
Date: Tue, 15 Feb 2022 12:21:26 +0100
Message-Id: <20220215112126.2633383-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215112126.2633383-1-geert@linux-m68k.org>
References: <20220215112126.2633383-1-geert@linux-m68k.org>
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
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

atafb_probe() overrides the atafb_ops.fb_setcolreg() method to match the
actual graphics hardware.  Besides, the shifts by 8 were bogus, as the
individual .fb_setcolreg() implementations already take care of that.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/atafb.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index b9d6aaaeae43f2f1..e95333e004744bf5 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2404,16 +2404,6 @@ static void atafb_set_disp(struct fb_info *info)
 				atari_stram_to_virt(info->fix.smem_start));
 }
 
-static int atafb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
-			   u_int transp, struct fb_info *info)
-{
-	red >>= 8;
-	green >>= 8;
-	blue >>= 8;
-
-	return info->fbops->fb_setcolreg(regno, red, green, blue, transp, info);
-}
-
 static int
 atafb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 {
@@ -2724,7 +2714,6 @@ static struct fb_ops atafb_ops = {
 	.owner =	THIS_MODULE,
 	.fb_check_var	= atafb_check_var,
 	.fb_set_par	= atafb_set_par,
-	.fb_setcolreg	= atafb_setcolreg,
 	.fb_blank =	atafb_blank,
 	.fb_pan_display	= atafb_pan_display,
 	.fb_fillrect	= atafb_fillrect,
-- 
2.25.1

