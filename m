Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0E8C955D
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 18:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E56A10E2D5;
	Sun, 19 May 2024 16:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="OvtOrBIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849C110E2D5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 16:56:14 +0000 (UTC)
X-Envelope-To: l.stach@pengutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716137770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXBVcpMLvTTn2V6PI5Jk17nPGWaXsqbtzsGA2rLsFpo=;
 b=OvtOrBIapWAMCIxGKinBz4phnHIumhUQ6rpUPbfYbaPfpTipfVP2gtdc8F7jN1baR5EnZs
 dcEPVXVSARixMmx0rzJtLIoxC4JvhwPtroE198OXOZ2i1dlQDdEJRCcx0M8gobnaYW8R53
 OJhi0aMJ+0kLK8evqB3w0ww7anyU38s=
X-Envelope-To: linux+etnaviv@armlinux.org.uk
X-Envelope-To: christian.gmeiner@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: etnaviv@lists.freedesktop.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v14 7/8] drm/etnaviv: Allow creating subdevices and
 pass platform specific data
Date: Mon, 20 May 2024 00:53:20 +0800
Message-Id: <20240519165321.2123356-8-sui.jingfeng@linux.dev>
In-Reply-To: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Because some hardware are too complex to be managed by a monolithic driver,
a split of the functionality into child devices can helps to achieve better
modularity.

We will use this function to create subdevice as a repensentation of a
single hardware ip block, so that the same modular approach that works
for ARM-SoC can also works for PCIe cards.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 33 +++++++++++++++++++++++----
 drivers/gpu/drm/etnaviv/etnaviv_drv.h |  9 ++++++++
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 863faac2ea19..dc3556aad134 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -670,16 +670,36 @@ static struct platform_driver etnaviv_platform_driver = {
 	},
 };
 
-static int etnaviv_create_platform_device(const char *name,
-					  struct platform_device **ppdev)
+int etnaviv_create_platform_device(struct device *parent,
+				   const char *name, int id,
+				   struct resource *pres,
+				   void *data,
+				   struct platform_device **ppdev)
 {
 	struct platform_device *pdev;
 	int ret;
 
-	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+	pdev = platform_device_alloc(name, id);
 	if (!pdev)
 		return -ENOMEM;
 
+	pdev->dev.parent = parent;
+
+	if (pres) {
+		ret = platform_device_add_resources(pdev, pres, 1);
+		if (ret) {
+			platform_device_put(pdev);
+			return ret;
+		}
+	}
+
+	if (data) {
+		void *pdata = kmalloc(sizeof(void *), GFP_KERNEL);
+
+		*(void **)pdata = data;
+		pdev->dev.platform_data = pdata;
+	}
+
 	ret = platform_device_add(pdev);
 	if (ret) {
 		platform_device_put(pdev);
@@ -691,7 +711,7 @@ static int etnaviv_create_platform_device(const char *name,
 	return 0;
 }
 
-static void etnaviv_destroy_platform_device(struct platform_device **ppdev)
+void etnaviv_destroy_platform_device(struct platform_device **ppdev)
 {
 	struct platform_device *pdev = *ppdev;
 
@@ -728,7 +748,10 @@ static int __init etnaviv_init(void)
 	if (np) {
 		of_node_put(np);
 
-		ret = etnaviv_create_platform_device("etnaviv", &etnaviv_drm);
+		ret = etnaviv_create_platform_device(NULL, "etnaviv",
+						     PLATFORM_DEVID_NONE,
+						     NULL, NULL,
+						     &etnaviv_drm);
 		if (ret)
 			goto unregister_platform_driver;
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 4b59fdb457b7..4612843ff9f6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mm_types.h>
+#include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/time64.h>
 #include <linux/types.h>
@@ -98,6 +99,14 @@ bool etnaviv_cmd_validate_one(struct etnaviv_gpu *gpu,
 	u32 *stream, unsigned int size,
 	struct drm_etnaviv_gem_submit_reloc *relocs, unsigned int reloc_size);
 
+int etnaviv_create_platform_device(struct device *parent,
+				   const char *name, int id,
+				   struct resource *pres,
+				   void *data,
+				   struct platform_device **ppdev);
+
+void etnaviv_destroy_platform_device(struct platform_device **ppdev);
+
 #ifdef CONFIG_DEBUG_FS
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 	struct seq_file *m);
-- 
2.34.1

