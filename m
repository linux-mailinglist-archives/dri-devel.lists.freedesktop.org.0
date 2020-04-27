Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34201BBDE8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2775A89E01;
	Tue, 28 Apr 2020 12:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp13.smtpout.orange.fr
 [80.12.242.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBC76E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 09:20:14 +0000 (UTC)
Received: from localhost.localdomain ([92.148.159.11]) by mwinf5d75 with ME
 id XlL5220090F2omL03lL5VT; Mon, 27 Apr 2020 11:20:12 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 27 Apr 2020 11:20:12 +0200
X-ME-IP: 92.148.159.11
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
 kstewart@linuxfoundation.org, tglx@linutronix.de, arnd@arndb.de,
 jani.nikula@intel.com, akpm@osdl.org, adaplas@pol.net, rpurdie@rpsys.net
Subject: [PATCH] video: fbdev: w100fb: Fix a potential double free.
Date: Mon, 27 Apr 2020 11:19:45 +0200
Message-Id: <20200427091945.57534-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some memory is vmalloc'ed in the 'suspend' function and freed in the
'resume' function.
However, it is also freed in the remove function.

In order to avoid a potential double free, set the corresponding pointer
to NULL once freed in the 'resume' function.

Fixes: aac51f09d96a ("[PATCH] w100fb: Rewrite for platform independence")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/w100fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/w100fb.c b/drivers/video/fbdev/w100fb.c
index 2d6e2738b792..d96ab28f8ce4 100644
--- a/drivers/video/fbdev/w100fb.c
+++ b/drivers/video/fbdev/w100fb.c
@@ -588,6 +588,7 @@ static void w100fb_restore_vidmem(struct w100fb_par *par)
 		memsize=par->mach->mem->size;
 		memcpy_toio(remapped_fbuf + (W100_FB_BASE-MEM_WINDOW_BASE), par->saved_extmem, memsize);
 		vfree(par->saved_extmem);
+		par->saved_extmem = NULL;
 	}
 	if (par->saved_intmem) {
 		memsize=MEM_INT_SIZE;
@@ -596,6 +597,7 @@ static void w100fb_restore_vidmem(struct w100fb_par *par)
 		else
 			memcpy_toio(remapped_fbuf + (W100_FB_BASE-MEM_WINDOW_BASE), par->saved_intmem, memsize);
 		vfree(par->saved_intmem);
+		par->saved_intmem = NULL;
 	}
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
