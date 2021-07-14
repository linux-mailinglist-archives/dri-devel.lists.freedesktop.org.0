Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E93C7F8C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DEC6E192;
	Wed, 14 Jul 2021 07:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C66A6E156
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 03:02:40 +0000 (UTC)
X-UUID: babdff2115ae4c0f93405f1b2d0868a3-20210714
X-UUID: babdff2115ae4c0f93405f1b2d0868a3-20210714
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 317960336; Wed, 14 Jul 2021 10:57:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 10:57:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 10:57:31 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v6 05/11] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
Date: Wed, 14 Jul 2021 10:56:20 +0800
Message-ID: <20210714025626.5528-6-yong.wu@mediatek.com>
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
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 yong.wu@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 acourbot@chromium.org, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MediaTek IOMMU has already added the device_link between the consumer
and smi-larb device. If the mdp device call the pm_runtime_get_sync,
the smi-larb's pm_runtime_get_sync also be called automatically.

CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
CC: Houlong Wei <houlong.wei@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 3 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index de2d425efdd1..5e0ea83a9f7f 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-#include <soc/mediatek/smi.h>
 #include <linux/pm_runtime.h>
 
 #include "mtk_mdp_comp.h"
@@ -57,13 +56,6 @@ int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
 	int status, err;
 
-	if (comp->larb_dev) {
-		err = mtk_smi_larb_get(comp->larb_dev);
-		if (err)
-			dev_err(comp->dev,
-				"failed to get larb, err %d.\n", err);
-	}
-
 	err = pm_runtime_get_sync(comp->dev);
 	if (err < 0) {
 		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
@@ -146,9 +138,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
-
-	if (comp->larb_dev)
-		mtk_smi_larb_put(comp->larb_dev);
 }
 
 /*
@@ -236,9 +225,6 @@ static const struct component_ops mtk_mdp_component_ops = {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 {
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
-	int ret;
 	int i;
 	struct device_node *node = dev->of_node;
 	enum mtk_mdp_comp_type comp_type =
@@ -252,8 +238,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 		if (IS_ERR(comp->clk[i])) {
 			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clock\n");
-			ret = PTR_ERR(comp->clk[i]);
-			goto err;
+			return PTR_ERR(comp->clk[i]);
 		}
 
 		/* Only RDMA needs two clocks */
@@ -261,36 +246,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 			break;
 	}
 
-	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
-	if (comp_type != MTK_MDP_RDMA &&
-	    comp_type != MTK_MDP_WDMA &&
-	    comp_type != MTK_MDP_WROT)
-		return 0;
-
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev,
-			"Missing mediadek,larb phandle in %pOF node\n", node);
-		ret = -EINVAL;
-		goto err;
-	}
-
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		ret = -EPROBE_DEFER;
-		goto err;
-	}
-	of_node_put(larb_node);
-
-	comp->larb_dev = &larb_pdev->dev;
-
 	return 0;
-
-err:
-	return ret;
 }
 
 static int mtk_mdp_comp_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 5201c47f7baa..2bd229cc7eae 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -11,13 +11,11 @@
  * struct mtk_mdp_comp - the MDP's function component data
  * @node:	list node to track sibing MDP components
  * @clk:	clocks required for component
- * @larb_dev:	SMI device required for component
  * @dev:	component's device
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
 	struct clk		*clk[2];
-	struct device           *larb_dev;
 	struct device		*dev;
 };
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index e1fb39231248..be7d35b3e3ff 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
-- 
2.18.0

