Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715C6DEC0C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 08:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8058410E70F;
	Wed, 12 Apr 2023 06:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7776C10E70F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:46:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R951e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0Vfv9Pbn_1681281998; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vfv9Pbn_1681281998) by smtp.aliyun-inc.com;
 Wed, 12 Apr 2023 14:46:38 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com
Subject: [PATCH -next 2/3] drm/mediatek: Use devm_platform_ioremap_resource()
Date: Wed, 12 Apr 2023 14:46:34 +0800
Message-Id: <20230412064635.41315-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
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
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 434e8a9ce8ab..391fa0ece22c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -104,7 +104,6 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_aal *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -117,8 +116,7 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap aal\n");
 		return PTR_ERR(priv->regs);
-- 
2.20.1.7.g153144c

