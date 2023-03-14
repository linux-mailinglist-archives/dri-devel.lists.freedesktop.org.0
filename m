Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F2D6B8AB3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 06:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C4210E6FB;
	Tue, 14 Mar 2023 05:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AB310E6FB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:42:29 +0000 (UTC)
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VdqljY2_1678772543) by smtp.aliyun-inc.com;
 Tue, 14 Mar 2023 13:42:24 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: deller@gmx.de
Subject: [PATCH -next 3/3] video: fbdev: xilinxfb: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 14 Mar 2023 13:42:19 +0800
Message-Id: <20230314054219.80441-3-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230314054219.80441-1-yang.lee@linux.alibaba.com>
References: <20230314054219.80441-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to commit 890cc39a8799 ("drivers: provide
devm_platform_get_and_ioremap_resource()"), convert
platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/video/fbdev/xilinxfb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index c17cfffd9a84..7911354827dc 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -273,8 +273,7 @@ static int xilinxfb_assign(struct platform_device *pdev,
 	if (drvdata->flags & BUS_ACCESS_FLAG) {
 		struct resource *res;
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		drvdata->regs = devm_ioremap_resource(&pdev->dev, res);
+		drvdata->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 		if (IS_ERR(drvdata->regs))
 			return PTR_ERR(drvdata->regs);
 
-- 
2.20.1.7.g153144c

