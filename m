Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD23495C8F4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 11:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64210E06A;
	Fri, 23 Aug 2024 09:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745F10E059
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 09:13:25 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WqvSs3FRlz1xvwW;
 Fri, 23 Aug 2024 17:11:25 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id CDDF914013B;
 Fri, 23 Aug 2024 17:13:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 17:13:20 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 4/5] drm/nouveau: Use for_each_child_of_node_scoped()
Date: Fri, 23 Aug 2024 17:20:52 +0800
Message-ID: <20240823092053.3170445-5-ruanjinjie@huawei.com>
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

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b06aa473102b..8d5c9c74cbb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -477,14 +477,14 @@ nouveau_connector_of_detect(struct drm_connector *connector)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct device_node *cn, *dn = pci_device_to_OF_node(pdev);
+	struct device_node *dn = pci_device_to_OF_node(pdev);
 
 	if (!dn ||
 	    !((nv_encoder = find_encoder(connector, DCB_OUTPUT_TMDS)) ||
 	      (nv_encoder = find_encoder(connector, DCB_OUTPUT_ANALOG))))
 		return NULL;
 
-	for_each_child_of_node(dn, cn) {
+	for_each_child_of_node_scoped(dn, cn) {
 		const char *name = of_get_property(cn, "name", NULL);
 		const void *edid = of_get_property(cn, "EDID", NULL);
 		int idx = name ? name[strlen(name) - 1] - 'A' : 0;
@@ -492,7 +492,6 @@ nouveau_connector_of_detect(struct drm_connector *connector)
 		if (nv_encoder->dcb->i2c_index == idx && edid) {
 			nv_connector->edid =
 				kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
-			of_node_put(cn);
 			return nv_encoder;
 		}
 	}
-- 
2.34.1

