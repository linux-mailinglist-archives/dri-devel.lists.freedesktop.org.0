Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249DB2D7146
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACD76EC8D;
	Fri, 11 Dec 2020 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDC96E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:50:12 +0000 (UTC)
Received: from localhost.localdomain ([92.131.12.169]) by mwinf5d15 with ME
 id 2eq8240093eqQsk03eq8ax; Thu, 10 Dec 2020 15:50:09 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 10 Dec 2020 15:50:09 +0100
X-ME-IP: 92.131.12.169
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: daniel.vetter@ffwll.ch,
	grandmaster@al2klimov.de
Subject: [PATCH 2/2] video: fbdev: Fix a dev_err format specifier
Date: Thu, 10 Dec 2020 15:49:32 +0100
Message-Id: <20201210144932.64436-1-christophe.jaillet@wanadoo.fr>
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

'phys_addr' is of type 'dma_addr_t'.
Use '%pad' instead of '%x' to print this variable in an error message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/ep93xx-fb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 80a70e5796b8..6b5a63b80ffa 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -436,9 +436,8 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 	 * least.
 	 */
 	if (check_screenpage_bug && phys_addr & (1 << 27)) {
-		dev_err(info->dev, "ep93xx framebuffer bug. phys addr (0x%x) "
-			"has bit 27 set: cannot init framebuffer\n",
-			phys_addr);
+		dev_err(info->dev, "ep93xx framebuffer bug. phys addr (%pad) has bit 27 set: cannot init framebuffer\n",
+			&phys_addr);
 
 		dma_free_coherent(info->dev, fb_size, virt_addr, phys_addr);
 		return -ENOMEM;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
