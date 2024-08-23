Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E995C8F6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 11:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D59310E118;
	Fri, 23 Aug 2024 09:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE8D10E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 09:13:25 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WqvVz08Fbz1j6rK;
 Fri, 23 Aug 2024 17:13:15 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 9A1921402C7;
 Fri, 23 Aug 2024 17:13:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 17:13:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/5] drm/mediatek: Fix missing of_node_put() for
 mtk_drm_get_all_drm_priv()
Date: Fri, 23 Aug 2024 17:20:50 +0800
Message-ID: <20240823092053.3170445-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823092053.3170445-1-ruanjinjie@huawei.com>
References: <20240823092053.3170445-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

In mtk_drm_get_all_drm_priv(), break in for_each_child_of_node() should
call of_node_put() to avoid child node resource leak, use
for_each_child_of_node_scoped() to fix it.

And avoid the need for manual cleanup of_node_put() in early exits
from the loop for another one.

Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 77b50c56c124..41aff0183cbd 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -371,12 +371,11 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
-	struct device_node *node;
 	struct device *drm_dev;
 	unsigned int cnt = 0;
 	int i, j;
 
-	for_each_child_of_node(phandle->parent, node) {
+	for_each_child_of_node_scoped(phandle->parent, node) {
 		struct platform_device *pdev;
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
@@ -828,7 +827,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
 	struct mtk_drm_private *private;
-	struct device_node *node;
 	struct component_match *match = NULL;
 	struct platform_device *ovl_adaptor;
 	int ret;
@@ -869,7 +867,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	}
 
 	/* Iterate over sibling DISP function blocks */
-	for_each_child_of_node(phandle->parent, node) {
+	for_each_child_of_node_scoped(phandle->parent, node) {
 		const struct of_device_id *of_id;
 		enum mtk_ddp_comp_type comp_type;
 		int comp_id;
@@ -933,10 +931,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		}
 
 		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
-		if (ret) {
-			of_node_put(node);
+		if (ret)
 			goto err_node;
-		}
 	}
 
 	if (!private->mutex_node) {
-- 
2.34.1

