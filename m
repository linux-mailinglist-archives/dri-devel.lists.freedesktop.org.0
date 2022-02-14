Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315544B41A6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185E610E45E;
	Mon, 14 Feb 2022 06:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2449310E475;
 Mon, 14 Feb 2022 06:10:25 +0000 (UTC)
X-UUID: 862b7b1f808d4b5a84f85ecfb3e4bcde-20220214
X-UUID: 862b7b1f808d4b5a84f85ecfb3e4bcde-20220214
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 853127056; Mon, 14 Feb 2022 14:10:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 14:10:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:10:19 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/23] drm/msm: Make use of the helper component_compare_of
Date: Mon, 14 Feb 2022 14:08:05 +0800
Message-ID: <20220214060819.7334-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 James Wang <james.qian.wang@arm.com>, Yong Wu <yong.wu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, freedreno@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the common compare helper from component.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ad35a5d94053..50e5a6ff6487 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1173,15 +1173,6 @@ static const struct dev_pm_ops msm_pm_ops = {
  * Componentized driver support:
  */
 
-/*
- * NOTE: duplication of the same code as exynos or imx (or probably any other).
- * so probably some room for some helpers
- */
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 /*
  * Identify what components need to be added by parsing what remote-endpoints
  * our MDP output ports are connected to. In the case of LVDS on MDP4, there
@@ -1239,7 +1230,7 @@ static int add_components_mdp(struct device *mdp_dev,
 
 		if (of_device_is_available(intf))
 			drm_of_component_match_add(master_dev, matchptr,
-						   compare_of, intf);
+						   component_compare_of, intf);
 
 		of_node_put(intf);
 	}
@@ -1285,7 +1276,7 @@ static int add_display_components(struct platform_device *pdev,
 		put_device(mdp_dev);
 
 		/* add the MDP component itself */
-		drm_of_component_match_add(dev, matchptr, compare_of,
+		drm_of_component_match_add(dev, matchptr, component_compare_of,
 					   mdp_dev->of_node);
 		break;
 	case KMS_MDP4:
@@ -1324,7 +1315,7 @@ static int add_gpu_components(struct device *dev,
 		return 0;
 
 	if (of_device_is_available(np))
-		drm_of_component_match_add(dev, matchptr, compare_of, np);
+		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
 	of_node_put(np);
 
-- 
2.18.0

