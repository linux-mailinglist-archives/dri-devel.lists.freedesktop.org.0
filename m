Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893A140500
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C486F417;
	Fri, 17 Jan 2020 08:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61406F386
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 03:23:01 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 37089E421B1FB973F35D;
 Fri, 17 Jan 2020 11:22:58 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 11:22:48 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <b.zolnierkie@samsung.com>, <yuehaibing@huawei.com>, <arnd@arndb.de>,
 <daniel.vetter@ffwll.ch>, <christophe.jaillet@wanadoo.fr>,
 <jani.nikula@intel.com>, <hslester96@gmail.com>
Subject: [PATCH -next] video: fbdev: pxa168fb: remove unnecessary
 platform_get_irq
Date: Fri, 17 Jan 2020 11:22:41 +0800
Message-ID: <20200117032241.59148-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 640ba2444fa9 ("drivers/video/pxa168fb.c: use devm_ functions")
left behind this, it can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/video/fbdev/pxa168fb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index 706c6943..aef8a30 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -779,7 +779,6 @@ static int pxa168fb_remove(struct platform_device *pdev)
 {
 	struct pxa168fb_info *fbi = platform_get_drvdata(pdev);
 	struct fb_info *info;
-	int irq;
 	unsigned int data;
 
 	if (!fbi)
@@ -799,8 +798,6 @@ static int pxa168fb_remove(struct platform_device *pdev)
 	if (info->cmap.len)
 		fb_dealloc_cmap(&info->cmap);
 
-	irq = platform_get_irq(pdev, 0);
-
 	dma_free_wc(fbi->dev, info->fix.smem_len,
 		    info->screen_base, info->fix.smem_start);
 
-- 
2.7.4


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
