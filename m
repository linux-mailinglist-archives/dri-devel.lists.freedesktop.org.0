Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6671412E526
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC7189349;
	Thu,  2 Jan 2020 10:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC189B30
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 18:26:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="334542274"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 19:26:24 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [PATCH 03/10] fbdev: s1d13xxxfb: use resource_size
Date: Wed,  1 Jan 2020 18:49:43 +0100
Message-Id: <1577900990-8588-4-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end - ptr.start + 1)
+ resource_size(&ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/video/fbdev/s1d13xxxfb.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index 8048499e398d..eaea8c373753 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -746,9 +746,9 @@ s1d13xxxfb_remove(struct platform_device *pdev)
 	}
 
 	release_mem_region(pdev->resource[0].start,
-			pdev->resource[0].end - pdev->resource[0].start +1);
+			   resource_size(&pdev->resource[0]));
 	release_mem_region(pdev->resource[1].start,
-			pdev->resource[1].end - pdev->resource[1].start +1);
+			   resource_size(&pdev->resource[1]));
 	return 0;
 }
 
@@ -788,14 +788,14 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 	}
 
 	if (!request_mem_region(pdev->resource[0].start,
-		pdev->resource[0].end - pdev->resource[0].start +1, "s1d13xxxfb mem")) {
+		resource_size(&pdev->resource[0]), "s1d13xxxfb mem")) {
 		dev_dbg(&pdev->dev, "request_mem_region failed\n");
 		ret = -EBUSY;
 		goto bail;
 	}
 
 	if (!request_mem_region(pdev->resource[1].start,
-		pdev->resource[1].end - pdev->resource[1].start +1, "s1d13xxxfb regs")) {
+		resource_size(&pdev->resource[1]), "s1d13xxxfb regs")) {
 		dev_dbg(&pdev->dev, "request_mem_region failed\n");
 		ret = -EBUSY;
 		goto bail;
@@ -810,7 +810,7 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	default_par = info->par;
 	default_par->regs = ioremap(pdev->resource[1].start,
-			pdev->resource[1].end - pdev->resource[1].start +1);
+				    resource_size(&pdev->resource[1]));
 	if (!default_par->regs) {
 		printk(KERN_ERR PFX "unable to map registers\n");
 		ret = -ENOMEM;
@@ -819,7 +819,7 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 	info->pseudo_palette = default_par->pseudo_palette;
 
 	info->screen_base = ioremap(pdev->resource[0].start,
-			pdev->resource[0].end - pdev->resource[0].start +1);
+				    resource_size(&pdev->resource[0]));
 
 	if (!info->screen_base) {
 		printk(KERN_ERR PFX "unable to map framebuffer\n");
@@ -857,9 +857,9 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 
 	info->fix = s1d13xxxfb_fix;
 	info->fix.mmio_start = pdev->resource[1].start;
-	info->fix.mmio_len = pdev->resource[1].end - pdev->resource[1].start + 1;
+	info->fix.mmio_len = resource_size(&pdev->resource[1]);
 	info->fix.smem_start = pdev->resource[0].start;
-	info->fix.smem_len = pdev->resource[0].end - pdev->resource[0].start + 1;
+	info->fix.smem_len = resource_size(&pdev->resource[0]);
 
 	printk(KERN_INFO PFX "regs mapped at 0x%p, fb %d KiB mapped at 0x%p\n",
 	       default_par->regs, info->fix.smem_len / 1024, info->screen_base);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
