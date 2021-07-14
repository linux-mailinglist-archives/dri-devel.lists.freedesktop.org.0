Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABD3C7F80
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09C26E174;
	Wed, 14 Jul 2021 07:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4016E155
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 03:02:49 +0000 (UTC)
X-UUID: 778644481eec45e98ff50f36ac4a7b0c-20210714
X-UUID: 778644481eec45e98ff50f36ac4a7b0c-20210714
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 795934441; Wed, 14 Jul 2021 10:57:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 10:57:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 10:57:43 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v6 06/11] drm/mediatek: Add pm runtime support for ovl and rdma
Date: Wed, 14 Jul 2021 10:56:21 +0800
Message-ID: <20210714025626.5528-7-yong.wu@mediatek.com>
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
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 yong.wu@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 acourbot@chromium.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Prepare for smi cleaning up "mediatek,larb".

Display use the dispsys device to call pm_rumtime_get_sync before.
This patch add pm_runtime_xx with ovl and rdma device whose nodes has
"iommus" property, then display could help pm_runtime_get for smi via
ovl or rdma device.

CC: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
(Yong: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync)
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  9 ++++++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  9 ++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 12 +++++++++++-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index fa9d79963cd3..ea5760f856ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
@@ -414,15 +415,21 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_enable(dev);
+
 	ret = component_add(dev, &mtk_disp_ovl_component_ops);
-	if (ret)
+	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "Failed to add component: %d\n", ret);
+	}
 
 	return ret;
 }
 
 static int mtk_disp_ovl_remove(struct platform_device *pdev)
 {
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 705f28ceb4dd..0f31d1c8e37c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -9,6 +9,7 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
@@ -327,9 +328,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	pm_runtime_enable(dev);
+
 	ret = component_add(dev, &mtk_disp_rdma_component_ops);
-	if (ret)
+	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "Failed to add component: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -338,6 +343,8 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..08e3f352377d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -557,9 +557,15 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
+	ret = pm_runtime_resume_and_get(comp->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
+			      ret);
+
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
 	if (ret) {
 		mtk_smi_larb_put(comp->larb_dev);
+		pm_runtime_put(comp->dev);
 		return;
 	}
 
@@ -572,7 +578,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-	int i;
+	int i, ret;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
@@ -596,6 +602,10 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 	mtk_crtc_ddp_hw_fini(mtk_crtc);
 	mtk_smi_larb_put(comp->larb_dev);
+	ret = pm_runtime_put(comp->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
+			      ret);
 
 	mtk_crtc->enabled = false;
 }
-- 
2.18.0

