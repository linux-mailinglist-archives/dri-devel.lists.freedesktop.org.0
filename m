Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35911DB0FA
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 13:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3746E13F;
	Wed, 20 May 2020 11:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC0B6E13F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 11:06:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200520110639euoutp01eb5f66c16c290f628e8c438ef631ba16~Qt9ZnhnGx0969909699euoutp013
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 11:06:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200520110639euoutp01eb5f66c16c290f628e8c438ef631ba16~Qt9ZnhnGx0969909699euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589972799;
 bh=XYYLvuirlx2iYlHmL4T+w8ygTONp7ydAWbttHA716H8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=MDzF9iOX3FYUy5AVsZoOSc2dnCGzl7XHajIngaFU7j7StIRCrTTmpbnre58sf0oLv
 ns2GgDBissE5K4gY/93i8/ghfWf0NMt2wFUlMvqONE4/QUQ4BiV1Du6EMuNpftdHdo
 iF0jiK/A5qIp604eUbOH7ll/Vmt7ZKiwSYZXoVeA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200520110639eucas1p2834bfb96b03bcf641a71a1963fcaad0a~Qt9Yys7z62609526095eucas1p2B;
 Wed, 20 May 2020 11:06:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B2.47.60679.E3F05CE5; Wed, 20
 May 2020 12:06:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200520110638eucas1p1d92eb5d669f195d2124ce93d9789850e~Qt9YZ6kz-1950319503eucas1p1f;
 Wed, 20 May 2020 11:06:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200520110638eusmtrp1d65230e218ad13ae5a7c1f38d9e6b407~Qt9YZTmke1958119581eusmtrp1Z;
 Wed, 20 May 2020 11:06:38 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-30-5ec50f3ebc18
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AB.DA.07950.E3F05CE5; Wed, 20
 May 2020 12:06:38 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200520110638eusmtip2bf5f64479691f3d16221df354e7fb320~Qt9YBPsVo1552115521eusmtip2K;
 Wed, 20 May 2020 11:06:38 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Fix dma_parms allocation
Date: Wed, 20 May 2020 13:06:32 +0200
Message-Id: <20200520110632.30780-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djP87p2/EfjDNYfsLa4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
 apG+XQJXxtu9n9gKdglWTPl9mrGB8SZfFyMHh4SAicSDlYVdjFwcQgIrGCV+3T7GCuF8YZTY
 3PgKyvnMKLGo/TVjFyMnWEd/9zM2iMRyRomVm/YzwbVsXbGSCaSKTcBQouttFxuILSLgJtF0
 eCbYKGaB64wS334sYgdJCAuYSvRv+cQIcgiLgKrEnD/MIGFeAVuJYw3bmSG2yUus3nCAGaRX
 QuAEm8TDmxegEi4Se9v/skHYwhKvjm9hh7BlJE5P7mGBaGhmlHh4bi07hNPDKHG5aQbUE9YS
 d879YgPZzCygKbF+lz5E2FHi4bF/TJCQ4ZO48VYQJMwMZE7aNp0ZIswr0dEmBFGtJjHr+Dq4
 tQcvXII6zUOidcZisEVCArESry5eZZrAKDcLYdcCRsZVjOKppcW56anFRnmp5XrFibnFpXnp
 esn5uZsYgZF/+t/xLzsYd/1JOsQowMGoxMNrsOdwnBBrYllxZe4hRgkOZiUR3gkvDsUJ8aYk
 VlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwLjJTCWtacm5E6fq
 rbPXyiY/jQzZmZy/5+lktZWLCjycb5zKb/Eznmc3cZHm+X7+lxxrlbkLm7+m+5o3iFmu/R2z
 T8JXku+vhE114marObfvfFzvyBGTEVDJ6a3ktWWSbdGS2+vFTnq+3/OYlX/JhJ0fsur+XNhu
 pXjjzNxwxaATt7RK2peJuiixFGckGmoxFxUnAgDHz3aD+AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsVy+t/xe7p2/EfjDHa0KVvcWneO1WLjjPWs
 Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+3eT2wFuwQrpvw+
 zdjAeJOvi5GTQ0LARKK/+xlbFyMXh5DAUkaJrvvX2CESMhInpzWwQtjCEn+udUEVfWKU2Py6
 kxEkwSZgKNH1FiTBySEi4CHR/O04O0gRs8BtRomlH+axgCSEBUwl+rd8Amrg4GARUJWY84cZ
 JMwrYCtxrGE7M8QCeYnVGw4wT2DkWcDIsIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMw4LYd
 +7llB2PXu+BDjAIcjEo8vAZ7DscJsSaWFVfmHmKU4GBWEuGd8OJQnBBvSmJlVWpRfnxRaU5q
 8SFGU6DdE5mlRJPzgdGQVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qBcUlP3EFh5XmH2TfdydM/V2cVWWW9v95Ahe3gWocYw9+RzVWyNRl7TYr+7dTx/pQ3cefR
 BweV7LqmLFxpmNrRGrXS1WJa1wyzGZPc9PKfbQ3MjepVEKlk77w/dZELh2Hf+QnH9nLFezec
 eMU4ZV9Yo7n6payrz3Z1J7zv35Av13bV67Bh99MAJZbijERDLeai4kQAfrfDJk4CAAA=
X-CMS-MailID: 20200520110638eucas1p1d92eb5d669f195d2124ce93d9789850e
X-Msg-Generator: CA
X-RootMTR: 20200520110638eucas1p1d92eb5d669f195d2124ce93d9789850e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200520110638eucas1p1d92eb5d669f195d2124ce93d9789850e
References: <CGME20200520110638eucas1p1d92eb5d669f195d2124ce93d9789850e@eucas1p1.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices") driver core handles allocation of the dma_parms
structure for platform device, so there is no need to manually allocate
nor free it.

Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 619f814..3d59800 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -31,23 +31,6 @@
 #define EXYNOS_DEV_ADDR_START	0x20000000
 #define EXYNOS_DEV_ADDR_SIZE	0x40000000
 
-static inline int configure_dma_max_seg_size(struct device *dev)
-{
-	if (!dev->dma_parms)
-		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
-	if (!dev->dma_parms)
-		return -ENOMEM;
-
-	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
-	return 0;
-}
-
-static inline void clear_dma_max_seg_size(struct device *dev)
-{
-	kfree(dev->dma_parms);
-	dev->dma_parms = NULL;
-}
-
 /*
  * drm_iommu_attach_device- attach device to iommu mapping
  *
@@ -69,10 +52,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		return -EINVAL;
 	}
 
-	ret = configure_dma_max_seg_size(subdrv_dev);
-	if (ret)
-		return ret;
-
+	dma_set_max_seg_size(subdrv_dev, DMA_BIT_MASK(32));
 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
 		/*
 		 * Keep the original DMA mapping of the sub-device and
@@ -89,9 +69,6 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		ret = iommu_attach_device(priv->mapping, subdrv_dev);
 	}
 
-	if (ret)
-		clear_dma_max_seg_size(subdrv_dev);
-
 	return 0;
 }
 
@@ -114,8 +91,6 @@ static void drm_iommu_detach_device(struct drm_device *drm_dev,
 		arm_iommu_attach_device(subdrv_dev, *dma_priv);
 	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 		iommu_detach_device(priv->mapping, subdrv_dev);
-
-	clear_dma_max_seg_size(subdrv_dev);
 }
 
 int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
