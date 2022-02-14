Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4104B4199
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D792210E301;
	Mon, 14 Feb 2022 06:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275BA10E327
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 06:09:34 +0000 (UTC)
X-UUID: ece4d621506a47b3ac8bd912a6824901-20220214
X-UUID: ece4d621506a47b3ac8bd912a6824901-20220214
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 200696795; Mon, 14 Feb 2022 14:09:29 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 14:09:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:09:26 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/23] drm/armada: Make use of the helper
 component_compare_of/dev_name
Date: Mon, 14 Feb 2022 14:07:59 +0800
Message-ID: <20220214060819.7334-4-yong.wu@mediatek.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Russell
 King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 James Wang <james.qian.wang@arm.com>, Yong Wu <yong.wu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the common compare helpers from component.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/gpu/drm/armada/armada_drv.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..224607a6ae16 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -177,17 +177,6 @@ static void armada_drm_unbind(struct device *dev)
 	drm_mm_takedown(&priv->linear);
 }
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
-static int compare_dev_name(struct device *dev, void *data)
-{
-	const char *name = data;
-	return !strcmp(dev_name(dev), name);
-}
-
 static void armada_add_endpoints(struct device *dev,
 	struct component_match **match, struct device_node *dev_node)
 {
@@ -196,7 +185,7 @@ static void armada_add_endpoints(struct device *dev,
 	for_each_endpoint_of_node(dev_node, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
 		if (remote && of_device_is_available(remote))
-			drm_of_component_match_add(dev, match, compare_of,
+			drm_of_component_match_add(dev, match, component_compare_of,
 						   remote);
 		of_node_put(remote);
 	}
@@ -213,7 +202,7 @@ static int armada_drm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	ret = drm_of_component_probe(dev, compare_dev_name, &armada_master_ops);
+	ret = drm_of_component_probe(dev, component_compare_dev_name, &armada_master_ops);
 	if (ret != -EINVAL)
 		return ret;
 
@@ -223,7 +212,7 @@ static int armada_drm_probe(struct platform_device *pdev)
 		int i;
 
 		for (i = 0; devices[i]; i++)
-			component_match_add(dev, &match, compare_dev_name,
+			component_match_add(dev, &match, component_compare_dev_name,
 					    devices[i]);
 
 		if (i == 0) {
-- 
2.18.0

