Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC86EA5EA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 10:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A213610E29D;
	Fri, 21 Apr 2023 08:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8771310E29D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:34:09 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0Vgc5eZY_1682066043; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vgc5eZY_1682066043) by smtp.aliyun-inc.com;
 Fri, 21 Apr 2023 16:34:04 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: yannick.fertre@foss.st.com
Subject: [PATCH -next] drm/stm: dsi: Use devm_platform_ioremap_resource()
Date: Fri, 21 Apr 2023 16:34:02 +0800
Message-Id: <20230421083402.21364-1-yang.lee@linux.alibaba.com>
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
Cc: raphael.gallais-pou@foss.st.com, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert platform_get_resource(),devm_ioremap_resource() to a single call
to devm_platform_ioremap_resource(), as this is exactly what this function
does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 89897d5f5c72..1750b6a25e87 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -444,15 +444,13 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct dw_mipi_dsi_stm *dsi;
 	struct clk *pclk;
-	struct resource *res;
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->base = devm_ioremap_resource(dev, res);
+	dsi->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->base)) {
 		ret = PTR_ERR(dsi->base);
 		DRM_ERROR("Unable to get dsi registers %d\n", ret);
-- 
2.20.1.7.g153144c

