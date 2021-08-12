Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3633EA61F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 16:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13AB6E03C;
	Thu, 12 Aug 2021 14:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 40E3F6E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 14:03:43 +0000 (UTC)
Received: from BC-Mail-Ex03.internal.baidu.com (unknown [172.31.51.43])
 by Forcepoint Email with ESMTPS id 3682D7A95E85EEDD6734;
 Thu, 12 Aug 2021 22:03:40 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex03.internal.baidu.com (172.31.51.43) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 12 Aug 2021 22:03:40 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 12 Aug 2021 22:03:39 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: au1200fb: Make use of dma_mmap_coherent()
Date: Thu, 12 Aug 2021 22:03:32 +0800
Message-ID: <20210812140332.506-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

replace dma_mmap_attrs() with dma_mmap_coherent() kindly.
BTW, fix indentation.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/video/fbdev/au1200fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index c00e01a17368..81c315454428 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1233,8 +1233,8 @@ static int au1200fb_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct au1200fb_device *fbdev = info->par;
 
-	return dma_mmap_attrs(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
-			fbdev->fb_len, 0);
+	return dma_mmap_coherent(fbdev->dev, vma,
+				 fbdev->fb_mem, fbdev->fb_phys, fbdev->fb_len);
 }
 
 static void set_global(u_int cmd, struct au1200_lcd_global_regs_t *pdata)
-- 
2.25.1

