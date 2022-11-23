Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C6635643
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C13310E532;
	Wed, 23 Nov 2022 09:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C086610E532
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:29:46 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NHG6C2QY1zHw5Q;
 Wed, 23 Nov 2022 17:29:07 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 17:29:43 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <deller@gmx.de>, <cuigaosheng1@huawei.com>,
 <alexander.sverdlin@gmail.com>, <sam@ravnborg.org>,
 <nikita.shubin@maquefel.me>
Subject: [PATCH] video: ep93xx: Add missing clk_disable_unprepare in
 ep93xxfb_probe()
Date: Wed, 23 Nov 2022 17:29:43 +0800
Message-ID: <20221123092943.2259585-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clk_disable_unprepare() should be called in the error handling
of register_framebuffer(), fix it.

Fixes: 0937a7b3625d ("video: ep93xx: Prepare clock before using it")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/video/fbdev/ep93xx-fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 2398b3d48fed..305f1587bd89 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -552,12 +552,14 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 
 	err = register_framebuffer(info);
 	if (err)
-		goto failed_check;
+		goto failed_framebuffer;
 
 	dev_info(info->dev, "registered. Mode = %dx%d-%d\n",
 		 info->var.xres, info->var.yres, info->var.bits_per_pixel);
 	return 0;
 
+failed_framebuffer:
+	clk_disable_unprepare(fbi->clk);
 failed_check:
 	if (fbi->mach_info->teardown)
 		fbi->mach_info->teardown(pdev);
-- 
2.25.1

