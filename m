Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAD6B8C5B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33110E719;
	Tue, 14 Mar 2023 08:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3D510E715
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:02:38 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VdrLTsb_1678780954; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VdrLTsb_1678780954) by smtp.aliyun-inc.com;
 Tue, 14 Mar 2023 16:02:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com
Subject: [PATCH -next 1/2] drm/arm/malidp: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 14 Mar 2023 16:02:31 +0800
Message-Id: <20230314080231.20212-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230314080231.20212-1-yang.lee@linux.alibaba.com>
References: <20230314080231.20212-1-yang.lee@linux.alibaba.com>
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
Cc: liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to commit 890cc39a8799 ("drivers: provide
devm_platform_get_and_ioremap_resource()"), convert
platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Since 'struct platform_device *pdev = to_platform_device(dev)',
'pdev->dev' is equivalent to 'dev'.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index cf040e2e9efe..e220bfc85b2e 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -724,8 +724,7 @@ static int malidp_bind(struct device *dev)
 	hwdev->hw = (struct malidp_hw *)of_device_get_match_data(dev);
 	malidp->dev = hwdev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hwdev->regs = devm_ioremap_resource(dev, res);
+	hwdev->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(hwdev->regs))
 		return PTR_ERR(hwdev->regs);
 
-- 
2.20.1.7.g153144c

