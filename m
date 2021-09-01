Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671143FD574
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 10:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888436E147;
	Wed,  1 Sep 2021 08:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB946E134
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 08:32:27 +0000 (UTC)
X-UUID: f5a50243597146b98b5591468245e327-20210901
X-UUID: f5a50243597146b98b5591468245e327-20210901
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 137388643; Wed, 01 Sep 2021 16:32:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 16:32:23 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:32:21 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6, 03/15] media: mtk-vcodec: Refactor vcodec pm interface
Date: Wed, 1 Sep 2021 16:32:03 +0800
Message-ID: <20210901083215.25984-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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

Using the needed param for pm init/release function and remove unused
param mtkdev in 'struct mtk_vcodec_pm'.

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 22 ++++++++-----------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 +++--
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
 5 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 8db9cdc66043..dd749d41c75a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -249,7 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
-	ret = mtk_vcodec_init_dec_pm(dev);
+	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
 		goto err_dec_pm;
@@ -379,7 +379,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_dec_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
-	mtk_vcodec_release_dec_pm(dev);
+	mtk_vcodec_release_dec_pm(&dev->pm);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -422,7 +422,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_dec_pm(dev);
+	mtk_vcodec_release_dec_pm(&dev->pm);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 6038db96f71c..20bd157a855c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -13,18 +13,15 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
+int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+	struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
-	struct platform_device *pdev;
-	struct mtk_vcodec_pm *pm;
+	struct platform_device *larb_pdev;
 	struct mtk_vcodec_clk *dec_clk;
 	struct mtk_vcodec_clk_info *clk_info;
 	int i = 0, ret = 0;
 
-	pdev = mtkdev->plat_dev;
-	pm = &mtkdev->pm;
-	pm->mtkdev = mtkdev;
 	dec_clk = &pm->vdec_clk;
 	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
 	if (!node) {
@@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 		return -1;
 	}
 
-	pdev = of_find_device_by_node(node);
+	larb_pdev = of_find_device_by_node(node);
 	of_node_put(node);
-	if (WARN_ON(!pdev)) {
+	if (WARN_ON(!larb_pdev)) {
 		return -1;
 	}
-	pm->larbvdec = &pdev->dev;
-	pdev = mtkdev->plat_dev;
+	pm->larbvdec = &larb_pdev->dev;
 	pm->dev = &pdev->dev;
 
 	dec_clk->clk_num =
@@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 	return ret;
 }
 
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
+void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 {
-	pm_runtime_disable(dev->pm.dev);
-	put_device(dev->pm.larbvdec);
+	pm_runtime_disable(pm->dev);
+	put_device(pm->larbvdec);
 }
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 280aeaefdb65..a3df6aef6cb9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -9,8 +9,9 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+	struct mtk_vcodec_pm *pm);
+void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 3b1e5e3a450e..973b0b3649c6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
 	struct mtk_vcodec_clk	venc_clk;
 	struct device	*larbvenc;
 	struct device	*dev;
-	struct mtk_vcodec_dev	*mtkdev;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1b2e4930ed27..0c8c8f86788c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	pdev = mtkdev->plat_dev;
 	pm = &mtkdev->pm;
 	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
-	pm->mtkdev = mtkdev;
 	pm->dev = &pdev->dev;
 	dev = &pdev->dev;
 	enc_clk = &pm->venc_clk;
-- 
2.25.1

