Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59195FF65
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 04:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B20010E042;
	Tue, 27 Aug 2024 02:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EDA10E042
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 02:56:11 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WtBx23VytzyQT3;
 Tue, 27 Aug 2024 10:55:18 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 32148140257;
 Tue, 27 Aug 2024 10:56:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 10:56:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 1/3] drm/rockchip: Use for_each_child_of_node_scoped()
Date: Tue, 27 Aug 2024 11:03:55 +0800
Message-ID: <20240827030357.1006220-2-ruanjinjie@huawei.com>
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

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 9a01aa450741..f5b3f18794dd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -548,7 +548,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	struct device_node *remote = NULL;
-	struct device_node  *port, *endpoint;
+	struct device_node  *port;
 	int ret = 0, child_count = 0;
 	const char *name;
 	u32 endpoint_id = 0;
@@ -560,15 +560,13 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 			      "can't found port point, please init lvds panel port!\n");
 		return -EINVAL;
 	}
-	for_each_child_of_node(port, endpoint) {
+	for_each_child_of_node_scoped(port, endpoint) {
 		child_count++;
 		of_property_read_u32(endpoint, "reg", &endpoint_id);
 		ret = drm_of_find_panel_or_bridge(dev->of_node, 1, endpoint_id,
 						  &lvds->panel, &lvds->bridge);
-		if (!ret) {
-			of_node_put(endpoint);
+		if (!ret)
 			break;
-		}
 	}
 	if (!child_count) {
 		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
-- 
2.34.1

