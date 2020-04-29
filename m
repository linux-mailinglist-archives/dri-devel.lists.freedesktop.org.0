Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69811BF18C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7089C6EB77;
	Thu, 30 Apr 2020 07:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5426EDAC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:45:13 +0000 (UTC)
Received: from localhost.localdomain ([92.148.159.11]) by mwinf5d03 with ME
 id YYl72200G0F2omL03Yl75P; Wed, 29 Apr 2020 10:45:11 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 29 Apr 2020 10:45:11 +0200
X-ME-IP: 92.148.159.11
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: b.zolnierkie@samsung.com, sumit.semwal@linaro.org,
 rafael.j.wysocki@intel.com, corbet@lwn.net, viresh.kumar@linaro.org,
 jani.nikula@intel.com, mchehab+samsung@kernel.org, eric.miao@marvell.com
Subject: [PATCH] video: pxafb: Fix the function used to balance a
 'dma_alloc_coherent()' call
Date: Wed, 29 Apr 2020 10:45:05 +0200
Message-Id: <20200429084505.108897-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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

'dma_alloc_coherent()' must be balanced by a call to 'dma_free_coherent()'
not 'dma_free_wc()'.
The correct dma_free_ function is already used in the error handling path
of the probe function.

Fixes: 77e196752bdd ("[ARM] pxafb: allow video memory size to be configurable")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/pxafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 00b96a78676e..6f972bed410a 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2417,8 +2417,8 @@ static int pxafb_remove(struct platform_device *dev)
 
 	free_pages_exact(fbi->video_mem, fbi->video_mem_size);
 
-	dma_free_wc(&dev->dev, fbi->dma_buff_size, fbi->dma_buff,
-		    fbi->dma_buff_phys);
+	dma_free_coherent(&dev->dev, fbi->dma_buff_size, fbi->dma_buff,
+			  fbi->dma_buff_phys);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
