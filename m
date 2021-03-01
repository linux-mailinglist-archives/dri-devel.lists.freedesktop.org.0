Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC7327906
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CC189C8D;
	Mon,  1 Mar 2021 08:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F85B89C0A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 04:07:31 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dpmrq0xQxz7rVY;
 Mon,  1 Mar 2021 12:05:47 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 12:07:22 +0800
From: Hui Tang <tanghui20@huawei.com>
To: <daniel.vetter@ffwll.ch>, <grandmaster@al2klimov.de>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] video: fbdev: fix use of 'dma_map_single'
Date: Mon, 1 Mar 2021 12:05:09 +0800
Message-ID: <1614571509-40078-1-git-send-email-tanghui20@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 01 Mar 2021 08:17:25 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DMA_TO_DEVICE synchronisation must be done after the last modification
of the memory region by the software and before it is handed off to
the device.

Signed-off-by: Hui Tang <tanghui20@huawei.com>
---
 drivers/video/fbdev/grvga.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 24818b2..25ae9ef 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -435,6 +435,8 @@ static int grvga_probe(struct platform_device *dev)
 			retval = -ENOMEM;
 			goto dealloc_cmap;
 		}
+
+		memset((unsigned long *) virtual_start, 0, grvga_mem_size);
 	} else {	/* Allocate frambuffer memory */
 
 		unsigned long page;
@@ -449,6 +451,7 @@ static int grvga_probe(struct platform_device *dev)
 			goto dealloc_cmap;
 		}
 
+		memset((unsigned long *) virtual_start, 0, grvga_mem_size);
 		physical_start = dma_map_single(&dev->dev, (void *)virtual_start, grvga_mem_size, DMA_TO_DEVICE);
 
 		/* Set page reserved so that mmap will work. This is necessary
@@ -463,8 +466,6 @@ static int grvga_probe(struct platform_device *dev)
 		par->fb_alloced = 1;
 	}
 
-	memset((unsigned long *) virtual_start, 0, grvga_mem_size);
-
 	info->screen_base = (char __iomem *) virtual_start;
 	info->fix.smem_start = physical_start;
 	info->fix.smem_len   = grvga_mem_size;
-- 
2.8.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
