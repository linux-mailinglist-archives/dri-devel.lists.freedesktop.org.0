Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75015E5C50
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D9210EA54;
	Thu, 22 Sep 2022 07:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B20610EA28
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 01:40:59 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXybL1CvzzpTgW;
 Thu, 22 Sep 2022 09:38:06 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 09:40:55 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <deller@gmx.de>, <zheyuma97@gmail.com>, <javierm@redhat.com>,
 <wsa+renesas@sang-engineering.com>, <tzimmermann@suse.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] video: fbdev: tridentfb: Fix missing
 pci_disable_device() in probe and remove
Date: Thu, 22 Sep 2022 09:37:09 +0800
Message-ID: <20220922013709.3324521-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 22 Sep 2022 07:24:23 +0000
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace pci_enable_device() with pcim_enable_device(),
pci_disable_device() and pci_release_regions() will be
called in release automatically.

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/video/fbdev/tridentfb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index f9c3b1d38fc2..7933e01aacc5 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -1475,7 +1475,7 @@ static int trident_pci_probe(struct pci_dev *dev,
 	if (err)
 		return err;
 
-	err = pci_enable_device(dev);
+	err = pcim_enable_device(dev);
 	if (err)
 		return err;
 
@@ -1715,12 +1715,10 @@ static int trident_pci_probe(struct pci_dev *dev,
 	kfree(info->pixmap.addr);
 	if (info->screen_base)
 		iounmap(info->screen_base);
-	release_mem_region(tridentfb_fix.smem_start, tridentfb_fix.smem_len);
 	disable_mmio(info->par);
 out_unmap1:
 	if (default_par->io_virt)
 		iounmap(default_par->io_virt);
-	release_mem_region(tridentfb_fix.mmio_start, tridentfb_fix.mmio_len);
 	framebuffer_release(info);
 	return err;
 }
@@ -1735,8 +1733,6 @@ static void trident_pci_remove(struct pci_dev *dev)
 		i2c_del_adapter(&par->ddc_adapter);
 	iounmap(par->io_virt);
 	iounmap(info->screen_base);
-	release_mem_region(tridentfb_fix.smem_start, tridentfb_fix.smem_len);
-	release_mem_region(tridentfb_fix.mmio_start, tridentfb_fix.mmio_len);
 	kfree(info->pixmap.addr);
 	fb_dealloc_cmap(&info->cmap);
 	framebuffer_release(info);
-- 
2.25.1

