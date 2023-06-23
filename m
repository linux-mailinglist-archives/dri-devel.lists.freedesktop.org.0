Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793573C8DE
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE8610E123;
	Sat, 24 Jun 2023 08:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-42.mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BDC10E106
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:17:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687514925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cp/dioA/Px4isvqDry6K9lCTQWmXUioxU/Gzve54Hpc=;
 b=vC9134FYF29pSWqPRpQB9uDXrqIMd8A/Jlstt4sPbCM2Truov/UzIMrO/vnZZ7JtKW4oi0
 36rs70bROZZRiiWtgsMADXAY1qkL+niG400xBeXUrFXVkCnnKLjcRgb66C1itM0zOm/9zo
 A2Q5k5aR6o7136tFzuqpR/+hBNcsedw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 7/8] drm/etnaviv: Add dedicated functions to create and
 destroy platform device
Date: Fri, 23 Jun 2023 18:08:21 +0800
Message-Id: <20230623100822.274706-8-sui.jingfeng@linux.dev>
In-Reply-To: <20230623100822.274706-1-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 24 Jun 2023 08:15:48 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Also rename the virtual master device as etnaviv_platform_device,
for better reflection that it is a platform device, not a DRM device.
Another benefit is that we no longer need to call of_node_put() for three
different cases, Instead, we only need to call it once.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 56 +++++++++++++++++++--------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 14c2e9690ce1..7d0eeab3e8b7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -655,12 +655,44 @@ static struct platform_driver etnaviv_platform_driver = {
 	},
 };
 
-static struct platform_device *etnaviv_drm;
+static struct platform_device *etnaviv_platform_device;
 
-static int __init etnaviv_init(void)
+static int etnaviv_create_platform_device(const char *name,
+					  struct platform_device **ppdev)
 {
 	struct platform_device *pdev;
 	int ret;
+
+	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	*ppdev = pdev;
+
+	return 0;
+}
+
+static void etnaviv_destroy_platform_device(struct platform_device **ppdev)
+{
+	struct platform_device *pdev = *ppdev;
+
+	if (!pdev)
+		return;
+
+	platform_device_unregister(pdev);
+
+	*ppdev = NULL;
+}
+
+static int __init etnaviv_init(void)
+{
+	int ret;
 	struct device_node *np;
 
 	etnaviv_validate_init();
@@ -680,23 +712,13 @@ static int __init etnaviv_init(void)
 	for_each_compatible_node(np, NULL, "vivante,gc") {
 		if (!of_device_is_available(np))
 			continue;
+		of_node_put(np);
 
-		pdev = platform_device_alloc("etnaviv", PLATFORM_DEVID_NONE);
-		if (!pdev) {
-			ret = -ENOMEM;
-			of_node_put(np);
-			goto unregister_platform_driver;
-		}
-
-		ret = platform_device_add(pdev);
-		if (ret) {
-			platform_device_put(pdev);
-			of_node_put(np);
+		ret = etnaviv_create_platform_device("etnaviv",
+						     &etnaviv_platform_device);
+		if (ret)
 			goto unregister_platform_driver;
-		}
 
-		etnaviv_drm = pdev;
-		of_node_put(np);
 		break;
 	}
 
@@ -712,7 +734,7 @@ module_init(etnaviv_init);
 
 static void __exit etnaviv_exit(void)
 {
-	platform_device_unregister(etnaviv_drm);
+	etnaviv_destroy_platform_device(&etnaviv_platform_device);
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
 }
-- 
2.25.1

