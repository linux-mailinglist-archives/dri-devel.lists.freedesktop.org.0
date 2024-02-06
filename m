Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF484BBDF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04252112D04;
	Tue,  6 Feb 2024 17:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="bj9f6nPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79357112D03
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:28:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1707240516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmVPFCNKCEoxyfP5fWPRoMeSPbEbmBVNboqHaLmwopU=;
 b=bj9f6nPNUnvNreGxSEJL4GRanUU7epVcP9jtGuoNULXnMXPcYRC8wNMLn1F/9NdkMVaYxx
 rsABrTZTT8ee69ohJDd7pIwPlD9xmEuQnkNVKaOW4GFfph5FtQCL9dcx2Rc6ilrBkL+lc7
 W6tnQifptQj4MMRWcdDpGe/xKyH8moI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v13 6/7] drm/etnaviv: Update the implement of
 etnaviv_create_platform_device()
Date: Wed,  7 Feb 2024 01:27:58 +0800
Message-Id: <20240206172759.421737-7-sui.jingfeng@linux.dev>
In-Reply-To: <20240206172759.421737-1-sui.jingfeng@linux.dev>
References: <20240206172759.421737-1-sui.jingfeng@linux.dev>
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

Because we need this function to create virtial child.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 33 +++++++++++++++++++++++----
 drivers/gpu/drm/etnaviv/etnaviv_drv.h |  9 ++++++++
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index d5a5fcc30341..5f65f2dead44 100644
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
index 9c05f503747a..bd8ac64dbaf3 100644
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
@@ -97,6 +98,14 @@ bool etnaviv_cmd_validate_one(struct etnaviv_gpu *gpu,
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

