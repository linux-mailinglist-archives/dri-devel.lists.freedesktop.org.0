Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BB972F2C1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 04:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F86F10E40F;
	Wed, 14 Jun 2023 02:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED59310E403;
 Wed, 14 Jun 2023 02:47:57 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:39796.1729481184
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 819B5102A42;
 Wed, 14 Jun 2023 10:47:56 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 39b79d1d098c4910a97066329ad02cb9 for l.stach@pengutronix.de; 
 Wed, 14 Jun 2023 10:47:57 CST
X-Transaction-ID: 39b79d1d098c4910a97066329ad02cb9
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v9 8/9] drm/etnaviv: Add a dedicated function to create the
 virtual master
Date: Wed, 14 Jun 2023 10:47:44 +0800
Message-Id: <20230614024745.865129-9-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614024745.865129-1-15330273260@189.cn>
References: <20230614024745.865129-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

After introducing the etnaviv_of_first_available_node() helper, the
creation of the virtual master platform device can also be simplified.
So, switch to etnaviv_create_virtual_master() function.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 43 ++++++++++++++++-----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1c9386e5a1b0..0ee7f641cee3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -766,10 +766,32 @@ static void etnaviv_destroy_platform_device(struct platform_device **ppdev)
 	*ppdev = NULL;
 }
 
+static int etnaviv_create_virtual_master(void)
+{
+	struct platform_device **master = &etnaviv_platform_device;
+	struct device_node *np;
+
+	/*
+	 * If the DT contains at least one available GPU device, instantiate
+	 * the DRM platform device.
+	 */
+	np = etnaviv_of_first_available_node();
+	if (np) {
+		int ret;
+
+		of_node_put(np);
+
+		ret = etnaviv_create_platform_device("etnaviv", master);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int __init etnaviv_init(void)
 {
 	int ret;
-	struct device_node *np;
 
 	etnaviv_validate_init();
 
@@ -785,22 +807,9 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_platform_driver;
 
-	/*
-	 * If the DT contains at least one available GPU device, instantiate
-	 * the DRM platform device.
-	 */
-	for_each_compatible_node(np, NULL, "vivante,gc") {
-		if (!of_device_is_available(np))
-			continue;
-		of_node_put(np);
-
-		ret = etnaviv_create_platform_device("etnaviv",
-						     &etnaviv_platform_device);
-		if (ret)
-			goto unregister_platform_driver;
-
-		break;
-	}
+	ret = etnaviv_create_virtual_master();
+	if (ret)
+		goto unregister_platform_driver;
 
 	return ret;
 
-- 
2.25.1

