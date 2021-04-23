Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217136922B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D06F6E114;
	Fri, 23 Apr 2021 12:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Fri, 23 Apr 2021 08:57:57 UTC
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF356EB53
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=OZm9k
 Dl6iBZXozcJeRVw3q8Ozl61aoipUtEec09/+do=; b=edKvS6w3ThB+Sv6NdjmMh
 4gfLj/9xNuD6AvxRPTQECTxUknH54wFkA3YMu2KKKFD1wSP3DHpqaIjn955SybGj
 fSV1jTznSuVuYX3RwHicWsSHy9j/eqHAAVosPI5RtjOaUOxSHJN1krDgES/tzFwp
 0Ic5hcHORemfaH4h53uF7U=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowAAXGpJsiIJgH_Lyww--.55156S2;
 Fri, 23 Apr 2021 16:42:22 +0800 (CST)
From: dingsenjie@163.com
To: shawnguo@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] gpu: drm: Use devm_platform_ioremap_resource_byname
Date: Fri, 23 Apr 2021 16:41:39 +0800
Message-Id: <20210423084139.1240-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowAAXGpJsiIJgH_Lyww--.55156S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw4rZrWfGF4DZr13AF1DZFb_yoW5Ww45pr
 WxGa1UCr4rJF4vg39xJF4DZF9xAw1YyayrCrs7Wwnaka98AFyDAFy5Za40v343Jas8Cr17
 tFWayFWUZa4DXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUCztUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbipQ59yFUMdnUbNwAAso
X-Mailman-Approved-At: Fri, 23 Apr 2021 12:32:45 +0000
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
Cc: dingsenjie <dingsenjie@yulong.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dingsenjie <dingsenjie@yulong.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/gpu/drm/zte/zx_vou.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_vou.c b/drivers/gpu/drm/zte/zx_vou.c
index 904f62f..ba50ddf 100644
--- a/drivers/gpu/drm/zte/zx_vou.c
+++ b/drivers/gpu/drm/zte/zx_vou.c
@@ -764,7 +764,6 @@ static int zx_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = data;
 	struct zx_vou_hw *vou;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -772,16 +771,14 @@ static int zx_crtc_bind(struct device *dev, struct device *master, void *data)
 	if (!vou)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "osd");
-	vou->osd = devm_ioremap_resource(dev, res);
+	vou->osd = devm_platform_ioremap_resource_byname(pdev, "osd");
 	if (IS_ERR(vou->osd)) {
 		ret = PTR_ERR(vou->osd);
 		DRM_DEV_ERROR(dev, "failed to remap osd region: %d\n", ret);
 		return ret;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "timing_ctrl");
-	vou->timing = devm_ioremap_resource(dev, res);
+	vou->timing = devm_platform_ioremap_resource_byname(pdev, "timing_ctrl");
 	if (IS_ERR(vou->timing)) {
 		ret = PTR_ERR(vou->timing);
 		DRM_DEV_ERROR(dev, "failed to remap timing_ctrl region: %d\n",
@@ -789,16 +786,14 @@ static int zx_crtc_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dtrc");
-	vou->dtrc = devm_ioremap_resource(dev, res);
+	vou->dtrc = devm_platform_ioremap_resource_byname(pdev, "dtrc");
 	if (IS_ERR(vou->dtrc)) {
 		ret = PTR_ERR(vou->dtrc);
 		DRM_DEV_ERROR(dev, "failed to remap dtrc region: %d\n", ret);
 		return ret;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vou_ctrl");
-	vou->vouctl = devm_ioremap_resource(dev, res);
+	vou->vouctl = devm_platform_ioremap_resource_byname(pdev, "vou_ctrl");
 	if (IS_ERR(vou->vouctl)) {
 		ret = PTR_ERR(vou->vouctl);
 		DRM_DEV_ERROR(dev, "failed to remap vou_ctrl region: %d\n",
@@ -806,8 +801,7 @@ static int zx_crtc_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "otfppu");
-	vou->otfppu = devm_ioremap_resource(dev, res);
+	vou->otfppu = devm_platform_ioremap_resource_byname(pdev, "otfppu");
 	if (IS_ERR(vou->otfppu)) {
 		ret = PTR_ERR(vou->otfppu);
 		DRM_DEV_ERROR(dev, "failed to remap otfppu region: %d\n", ret);
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
