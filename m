Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FB95FF64
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 04:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A031210E00E;
	Tue, 27 Aug 2024 02:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4296C10E00C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 02:56:08 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WtBx32WTPz16PFX;
 Tue, 27 Aug 2024 10:55:19 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id BC2C718007C;
 Tue, 27 Aug 2024 10:56:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 10:56:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 2/3] drm/rockchip: Simplified with dev_err() and
 __free()
Date: Tue, 27 Aug 2024 11:03:56 +0800
Message-ID: <20240827030357.1006220-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827030357.1006220-1-ruanjinjie@huawei.com>
References: <20240827030357.1006220-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

Avoid need to manually handle of_node_put() by using __free(), and use
dev_err() to replace deprecated() DRM_DEV_ERROR(), which can simplfy
code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 38 ++++++++----------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index f5b3f18794dd..700ac730887d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -548,16 +548,14 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	struct device_node *remote = NULL;
-	struct device_node  *port;
 	int ret = 0, child_count = 0;
 	const char *name;
 	u32 endpoint_id = 0;
 
 	lvds->drm_dev = drm_dev;
-	port = of_graph_get_port_by_id(dev->of_node, 1);
+	struct device_node *port __free(device_node) = of_graph_get_port_by_id(dev->of_node, 1);
 	if (!port) {
-		DRM_DEV_ERROR(dev,
-			      "can't found port point, please init lvds panel port!\n");
+		dev_err(dev, "can't found port point, please init lvds panel port!\n");
 		return -EINVAL;
 	}
 	for_each_child_of_node_scoped(port, endpoint) {
@@ -569,13 +567,10 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 			break;
 	}
 	if (!child_count) {
-		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
-		ret = -EINVAL;
-		goto err_put_port;
-	} else if (ret) {
-		dev_err_probe(dev, ret, "failed to find panel and bridge node\n");
-		goto err_put_port;
-	}
+		dev_err(dev, "lvds port does not have any children\n");
+		return -EINVAL;
+	} else if (ret)
+		return dev_err_probe(dev, ret, "failed to find panel and bridge node\n");
 	if (lvds->panel)
 		remote = lvds->panel->dev->of_node;
 	else
@@ -587,7 +582,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		lvds->output = rockchip_lvds_name_to_output(name);
 
 	if (lvds->output < 0) {
-		DRM_DEV_ERROR(dev, "invalid output type [%s]\n", name);
+		dev_err(dev, "invalid output type [%s]\n", name);
 		ret = lvds->output;
 		goto err_put_remote;
 	}
@@ -599,7 +594,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		lvds->format = rockchip_lvds_name_to_format(name);
 
 	if (lvds->format < 0) {
-		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
+		dev_err(dev, "invalid data-mapping format [%s]\n", name);
 		ret = lvds->format;
 		goto err_put_remote;
 	}
@@ -610,8 +605,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
 	if (ret < 0) {
-		DRM_DEV_ERROR(drm_dev->dev,
-			      "failed to initialize encoder: %d\n", ret);
+		dev_err(drm_dev->dev, "failed to initialize encoder: %d\n", ret);
 		goto err_put_remote;
 	}
 
@@ -624,8 +618,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 					 &rockchip_lvds_connector_funcs,
 					 DRM_MODE_CONNECTOR_LVDS);
 		if (ret < 0) {
-			DRM_DEV_ERROR(drm_dev->dev,
-				      "failed to initialize connector: %d\n", ret);
+			dev_err(drm_dev->dev, "failed to initialize connector: %d\n", ret);
 			goto err_free_encoder;
 		}
 
@@ -639,9 +632,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
 		if (IS_ERR(connector)) {
-			DRM_DEV_ERROR(drm_dev->dev,
-				      "failed to initialize bridge connector: %pe\n",
-				      connector);
+			dev_err(drm_dev->dev, "failed to initialize bridge connector: %pe\n",
+				connector);
 			ret = PTR_ERR(connector);
 			goto err_free_encoder;
 		}
@@ -649,14 +641,12 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
-		DRM_DEV_ERROR(drm_dev->dev,
-			      "failed to attach encoder: %d\n", ret);
+		dev_err(drm_dev->dev, "failed to attach encoder: %d\n", ret);
 		goto err_free_connector;
 	}
 
 	pm_runtime_enable(dev);
 	of_node_put(remote);
-	of_node_put(port);
 
 	return 0;
 
@@ -666,8 +656,6 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	drm_encoder_cleanup(encoder);
 err_put_remote:
 	of_node_put(remote);
-err_put_port:
-	of_node_put(port);
 
 	return ret;
 }
-- 
2.34.1

