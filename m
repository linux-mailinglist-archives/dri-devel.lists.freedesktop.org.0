Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34F2D715D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD4A6ECA8;
	Fri, 11 Dec 2020 08:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126836EAC8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:48:53 +0000 (UTC)
Received: from localhost.localdomain ([92.131.12.169]) by mwinf5d15 with ME
 id 2eoj2400H3eqQsk03eokPw; Thu, 10 Dec 2020 15:48:48 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 10 Dec 2020 15:48:48 +0100
X-ME-IP: 92.131.12.169
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: daniel.vetter@ffwll.ch,
	grandmaster@al2klimov.de
Subject: [PATCH 1/2] video: fbdev: Use framebuffer_release instead of kfree to
 free a frame buffer
Date: Thu, 10 Dec 2020 15:48:08 +0100
Message-Id: <20201210144808.64384-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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

Use 'framebuffer_release()' instead of 'kfree()' to undo a
'framebuffer_alloc()' call, both in the error handling path of the probe
function and in remove function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/ep93xx-fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index ba33b4dce0df..80a70e5796b8 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -566,7 +566,7 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 failed_videomem:
 	fb_dealloc_cmap(&info->cmap);
 failed_cmap:
-	kfree(info);
+	framebuffer_release(info);
 
 	return err;
 }
@@ -584,7 +584,7 @@ static int ep93xxfb_remove(struct platform_device *pdev)
 	if (fbi->mach_info->teardown)
 		fbi->mach_info->teardown(pdev);
 
-	kfree(info);
+	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
