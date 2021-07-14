Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C40B3C7F89
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114766E185;
	Wed, 14 Jul 2021 07:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F1A6E155
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 03:02:28 +0000 (UTC)
X-UUID: 46b42201769e4f2bbe750d1bcc5171a8-20210714
X-UUID: 46b42201769e4f2bbe750d1bcc5171a8-20210714
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1248757175; Wed, 14 Jul 2021 10:57:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 10:57:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 10:57:21 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v6 04/11] media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
Date: Wed, 14 Jul 2021 10:56:19 +0800
Message-ID: <20210714025626.5528-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210714025626.5528-1-yong.wu@mediatek.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Wed, 14 Jul 2021 07:44:22 +0000
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
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, anthony.huang@mediatek.com,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Rick Chang <rick.chang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 yong.wu@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 acourbot@chromium.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MediaTek IOMMU has already added device_link between the consumer
and smi-larb device. If the jpg device call the pm_runtime_get_sync,
the smi-larb's pm_runtime_get_sync also be called automatically.

After removing the larb_get operations, then mtk_jpeg_clk_init is
also unnecessary. Remove it too.

CC: Rick Chang <rick.chang@mediatek.com>
CC: Xia Jiang <xia.jiang@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Acked-by: Rick Chang <rick.chang@mediatek.com>
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +------------------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
 2 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index a89c7b206eef..4fea2c512434 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -22,7 +22,6 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_jpeg_enc_hw.h"
 #include "mtk_jpeg_dec_hw.h"
@@ -1055,10 +1054,6 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 {
 	int ret;
 
-	ret = mtk_smi_larb_get(jpeg->larb);
-	if (ret)
-		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
-
 	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
 				      jpeg->variant->clks);
 	if (ret)
@@ -1069,7 +1064,6 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
 	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
 				   jpeg->variant->clks);
-	mtk_smi_larb_put(jpeg->larb);
 }
 
 static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
@@ -1284,35 +1278,6 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
 	{ .id = "jpgenc" },
 };
 
-static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
-{
-	struct device_node *node;
-	struct platform_device *pdev;
-	int ret;
-
-	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
-	if (!node)
-		return -EINVAL;
-	pdev = of_find_device_by_node(node);
-	if (WARN_ON(!pdev)) {
-		of_node_put(node);
-		return -EINVAL;
-	}
-	of_node_put(node);
-
-	jpeg->larb = &pdev->dev;
-
-	ret = devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks,
-				jpeg->variant->clks);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get jpeg clock:%d\n", ret);
-		put_device(&pdev->dev);
-		return ret;
-	}
-
-	return 0;
-}
-
 static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 {
 	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
@@ -1333,11 +1298,6 @@ static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
-static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
-{
-	put_device(jpeg->larb);
-}
-
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
@@ -1376,7 +1336,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		goto err_req_irq;
 	}
 
-	ret = mtk_jpeg_clk_init(jpeg);
+	ret = devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks,
+				jpeg->variant->clks);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init clk, err %d\n", ret);
 		goto err_clk_init;
@@ -1442,7 +1403,6 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 
 err_dev_register:
-	mtk_jpeg_clk_release(jpeg);
 
 err_clk_init:
 
@@ -1460,7 +1420,6 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 	video_device_release(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
-	mtk_jpeg_clk_release(jpeg);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 595f7f10c9fd..3e4811a41ba2 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -85,7 +85,6 @@ struct mtk_jpeg_variant {
  * @alloc_ctx:		videobuf2 memory allocator's context
  * @vdev:		video device node for jpeg mem2mem mode
  * @reg_base:		JPEG registers mapping
- * @larb:		SMI device
  * @job_timeout_work:	IRQ timeout structure
  * @variant:		driver variant to be used
  */
@@ -99,7 +98,6 @@ struct mtk_jpeg_dev {
 	void			*alloc_ctx;
 	struct video_device	*vdev;
 	void __iomem		*reg_base;
-	struct device		*larb;
 	struct delayed_work job_timeout_work;
 	const struct mtk_jpeg_variant *variant;
 };
-- 
2.18.0

