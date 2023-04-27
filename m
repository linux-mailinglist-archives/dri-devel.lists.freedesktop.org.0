Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13766EFF78
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 05:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880A710E347;
	Thu, 27 Apr 2023 03:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
 by gabe.freedesktop.org (Postfix) with ESMTP id C49C310E347
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 03:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Oz51J
 k6YUdX9xqityJ6AuFrqweYlAXeUQMqAYe93B1k=; b=fDzhYnwGt4S7mcuGlYphK
 xBCfNn/3BYbjbeC5idZbuTUiWgLPnqZDBq/nIE34DY6zWIAKLPpiaLr/4xicQ8qq
 c7g3iwxa2rnVIcCj6iDVabnsCs+V4Njq4KW4ootAgHYfN2EkkPJxNMirky/jg12Z
 VlYKe8nSe3stgmQzZ1HKB4=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wBnn3ct5klkwL3sAA--.55775S2;
 Thu, 27 Apr 2023 11:04:13 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: deller@gmx.de
Subject: [PATCH] video: imsttfb: Fix use after free bug in imsttfb_probe due
 to lack of error-handling of init_imstt
Date: Thu, 27 Apr 2023 11:04:11 +0800
Message-Id: <20230427030411.2375978-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnn3ct5klkwL3sAA--.55775S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxKr18uF1kur4rJr4ruFg_yoW8AFWDpF
 45A3Z8JrZrJF48Gw4kAF4UAF43K3Z7Kr9IgrW7K3sayF15CFWFgr1xJa42yrZ3JrZ7Jr13
 XF4kt34UC3WUuFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi-eOJUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXRFeU1WBpY8fjAAAss
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
Cc: alex000young@gmail.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, 1395428693sheep@gmail.com,
 tzimmermann@suse.de, Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A use-after-free bug may occur if init_imstt invokes framebuffer_release
and free the info ptr. The caller, imsttfb_probe didn't notice that and
still keeps the ptr as private data in pdev.

If we remove the driver which will call imsttfb_remove to make cleanup,
UAF happens.

Fix it by return error code if bad case happens in init_imstt.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
 drivers/video/fbdev/imsttfb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index bea45647184e..92b0c5833bda 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1347,7 +1347,7 @@ static const struct fb_ops imsttfb_ops = {
 	.fb_ioctl 	= imsttfb_ioctl,
 };
 
-static void init_imstt(struct fb_info *info)
+static int init_imstt(struct fb_info *info)
 {
 	struct imstt_par *par = info->par;
 	__u32 i, tmp, *ip, *end;
@@ -1420,7 +1420,7 @@ static void init_imstt(struct fb_info *info)
 	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
 		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.yres, info->var.bits_per_pixel);
 		framebuffer_release(info);
-		return;
+		return -ENODEV;
 	}
 
 	sprintf(info->fix.id, "IMS TT (%s)", par->ramdac == IBM ? "IBM" : "TVP");
@@ -1529,10 +1529,10 @@ static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!par->cmap_regs)
 		goto error;
 	info->pseudo_palette = par->palette;
-	init_imstt(info);
-
-	pci_set_drvdata(pdev, info);
-	return 0;
+	ret = init_imstt(info);
+	if (!ret)
+		pci_set_drvdata(pdev, info);
+	return ret;
 
 error:
 	if (par->dc_regs)
-- 
2.25.1

