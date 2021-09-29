Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB541BC56
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 03:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006AB6E13C;
	Wed, 29 Sep 2021 01:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D5A6E13C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 01:38:31 +0000 (UTC)
X-UUID: 06f58a5907354dd7abbd40ca7aff1750-20210929
X-UUID: 06f58a5907354dd7abbd40ca7aff1750-20210929
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2038775087; Wed, 29 Sep 2021 09:38:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 29 Sep 2021 09:38:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 09:38:24 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Matthias Kaehlcke
 <mka@chromium.org>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei
 <houlong.wei@mediatek.com>
Subject: [PATCH v8 06/12] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
Date: Wed, 29 Sep 2021 09:37:13 +0800
Message-ID: <20210929013719.25120-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210929013719.25120-1-yong.wu@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
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

MediaTek IOMMU has already added the device_link between the consumer
and smi-larb device. If the mdp device call the pm_runtime_get_sync,
the smi-larb's pm_runtime_get_sync also be called automatically.

CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
CC: Houlong Wei <houlong.wei@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 -------------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 3 files changed, 43 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index b3426a551bea..1e3833f1c9ae 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -9,7 +9,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_mdp_comp.h"
 
@@ -18,14 +17,6 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 {
 	int i, err;
 
-	if (comp->larb_dev) {
-		err = mtk_smi_larb_get(comp->larb_dev);
-		if (err)
-			dev_err(dev,
-				"failed to get larb, err %d. type:%d\n",
-				err, comp->type);
-	}
-
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
 			continue;
@@ -46,17 +37,12 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
-
-	if (comp->larb_dev)
-		mtk_smi_larb_put(comp->larb_dev);
 }
 
 int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_mdp_comp *comp,
 		      enum mtk_mdp_comp_type comp_type)
 {
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
 	int ret;
 	int i;
 
@@ -77,32 +63,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 			break;
 	}
 
-	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
-	if (comp->type != MTK_MDP_RDMA &&
-	    comp->type != MTK_MDP_WDMA &&
-	    comp->type != MTK_MDP_WROT)
-		return 0;
-
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev,
-			"Missing mediadek,larb phandle in %pOF node\n", node);
-		ret = -EINVAL;
-		goto put_dev;
-	}
-
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		ret = -EPROBE_DEFER;
-		goto put_dev;
-	}
-	of_node_put(larb_node);
-
-	comp->larb_dev = &larb_pdev->dev;
-
 	return 0;
 
 put_dev:
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 7897766c96bb..ae41dd3cd72a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -26,14 +26,12 @@ enum mtk_mdp_comp_type {
  * @node:	list node to track sibing MDP components
  * @dev_node:	component device node
  * @clk:	clocks required for component
- * @larb_dev:	SMI device required for component
  * @type:	component type
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
 	struct device_node	*dev_node;
 	struct clk		*clk[2];
-	struct device		*larb_dev;
 	enum mtk_mdp_comp_type	type;
 };
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 976aa1f4829b..70a8eab16863 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -17,7 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_mdp_core.h"
 #include "mtk_mdp_m2m.h"
-- 
2.18.0

