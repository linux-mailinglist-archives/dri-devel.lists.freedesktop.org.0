Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6F465D02
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 04:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAE66E9B1;
	Thu,  2 Dec 2021 03:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD196E9B0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 03:46:17 +0000 (UTC)
X-UUID: c918878f6feb4397b57539933540383b-20211202
X-UUID: c918878f6feb4397b57539933540383b-20211202
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 515891690; Thu, 02 Dec 2021 11:46:15 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 2 Dec 2021 11:46:14 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Dec 2021 11:46:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 2 Dec 2021 11:46:12 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v12, 18/19] media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
Date: Thu, 2 Dec 2021 11:45:43 +0800
Message-ID: <20211202034544.2750-19-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202034544.2750-1-yunfei.dong@mediatek.com>
References: <20211202034544.2750-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Steve
 Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are only two lines in mtk_vcodec_release_dec_pm, using
pm_runtime_disable and put_device instead directly.

Move pm_runtime_enable outside mtk_vcodec_init_dec_pm to symmetry with
pm_runtime_disable, after that, rename mtk_vcodec_init_dec_pm to *_clk since
it only has clock operations now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Yong Wu <yong.wu@mediatek.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c   | 10 +++++++---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c    |  7 +++++--
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 12 ++----------
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h    |  3 +--
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index cdbe5ffeae26..512ab5084041 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
@@ -156,12 +157,13 @@ static int mtk_vcodec_init_dec_resources(struct mtk_vcodec_dev *dev)
 		return ret;
 	}
 
-	ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+	ret = mtk_vcodec_init_dec_clk(pdev, &dev->pm);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to get mt vcodec clock source");
 		return ret;
 	}
 
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
@@ -473,7 +475,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
 		destroy_workqueue(dev->core_workqueue);
 err_res:
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -517,7 +520,8 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 389a17eb4085..34dd178e07d7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "mtk_vcodec_drv.h"
@@ -117,9 +118,10 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	subdev_dev->plat_dev = pdev;
-	ret = mtk_vcodec_init_dec_pm(pdev, &subdev_dev->pm);
+	ret = mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
 	if (ret)
 		return ret;
+	pm_runtime_enable(&pdev->dev);
 
 	subdev_dev->reg_base[VDEC_HW_MISC] =
 		devm_platform_ioremap_resource(pdev, 0);
@@ -155,7 +157,8 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, subdev_dev);
 	return 0;
 err:
-	mtk_vcodec_release_dec_pm(&subdev_dev->pm);
+	pm_runtime_disable(subdev_dev->pm.dev);
+	put_device(subdev_dev->pm.larbvdec);
 	return ret;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 4cf03d38d141..b9f5ef979c69 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -15,7 +15,7 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
@@ -73,20 +73,12 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 		}
 	}
 
-	pm_runtime_enable(&pdev->dev);
 	return 0;
 put_device:
 	put_device(pm->larbvdec);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
-
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
-{
-	pm_runtime_disable(pm->dev);
-	put_device(pm->larbvdec);
-}
-EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
+EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_clk);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 6ae29fea4e7f..c4121df9764f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -9,9 +9,8 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-- 
2.25.1

