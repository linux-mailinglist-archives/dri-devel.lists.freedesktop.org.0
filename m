Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957806DEC0A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 08:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374D310E272;
	Wed, 12 Apr 2023 06:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A3010E272
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:46:43 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0Vfv7ahI_1681281995; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vfv7ahI_1681281995) by smtp.aliyun-inc.com;
 Wed, 12 Apr 2023 14:46:36 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com
Subject: [PATCH -next 1/3] drm/mediatek: Use devm_platform_ioremap_resource()
Date: Wed, 12 Apr 2023 14:46:33 +0800
Message-Id: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Yang Li <yang.lee@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove variable 'res' and convert platform_get_resource(),
devm_ioremap_resource() to a single call to
devm_platform_ioremap_resource(), as this is exactly what this function
does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b640bc0559e7..03aae9f95606 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -185,7 +185,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_cec *cec;
-	struct resource *res;
 	int ret;
 
 	cec = devm_kzalloc(dev, sizeof(*cec), GFP_KERNEL);
@@ -195,8 +194,7 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cec);
 	spin_lock_init(&cec->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cec->regs = devm_ioremap_resource(dev, res);
+	cec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cec->regs)) {
 		ret = PTR_ERR(cec->regs);
 		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
-- 
2.20.1.7.g153144c

