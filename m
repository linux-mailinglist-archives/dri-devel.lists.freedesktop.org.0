Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FD676E0F7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B510E5A4;
	Thu,  3 Aug 2023 07:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF8810E5A4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 07:10:38 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RGg1Y6g8CzVjnf;
 Thu,  3 Aug 2023 15:08:49 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 15:10:35 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <deller@gmx.de>, <u.kleine-koenig@pengutronix.de>, <tzimmermann@suse.de>, 
 <sam@ravnborg.org>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] video: fbdev: goldfishfb: Do not check 0 for
 platform_get_irq()
Date: Thu, 3 Aug 2023 15:10:06 +0800
Message-ID: <20230803071006.87235-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
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
Cc: wangzhu9@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since platform_get_irq() never returned zero, so it need not to check
whether it returned zero, and we use the return error code of
platform_get_irq() to replace the current return error code.

Please refer to the commit a85a6c86c25b ("driver core: platform: Clarify
that IRQ 0 is invalid") to get that platform_get_irq() never returned
zero.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/video/fbdev/goldfishfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index ef2528c3faa9..c3091ce26e5c 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -203,8 +203,8 @@ static int goldfish_fb_probe(struct platform_device *pdev)
 	}
 
 	fb->irq = platform_get_irq(pdev, 0);
-	if (fb->irq <= 0) {
-		ret = -ENODEV;
+	if (fb->irq < 0) {
+		ret = fb->irq;
 		goto err_no_irq;
 	}
 
-- 
2.17.1

