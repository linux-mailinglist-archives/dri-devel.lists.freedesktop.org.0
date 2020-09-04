Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BA25DBF5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498EC6EC04;
	Fri,  4 Sep 2020 14:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1069E6EBB7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:39:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e16so7015444wrm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mmp2YddBxU3SpyfXCINIYmjt0mZ2lhKSiW8oJoAH7bE=;
 b=Wj6k2TACn1+LuYNJTiDIkAUKHf/PpNYxuNcArqBXSAulYPcYXGwg4eJyVfl4Jvk6il
 pHHw6dZVoNor0wqdlOJfkn3Bbux67TkCEEVBvWkYMXmYaF3q/6JIgj2fQu7BhcR7jmC3
 nRjoeEgJs3XD2E4pr3+pFoKE7gNKWPngMfHRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mmp2YddBxU3SpyfXCINIYmjt0mZ2lhKSiW8oJoAH7bE=;
 b=DRkOiF4dz/l6NNEbbLE8sYeCgi6bJ3wXu+4xp2XWHV1Pv7F3FzPtWA08enXyYmzyXg
 9JBjIuTkLVfDQj6kyz5qZSnKpVKonyhrW0Emy0n8zdg7BBvGiDyw22D/+8Xbz3rPSNOa
 6MGX8975iwmn/+9SIAFNc8hUcDB18a9mDAwb991Zfo2Mdsjhp5vLl/3xa4GIYm9052ad
 p4e2mOXaOPnKt527xY0nxQSjUTxCH52Y176WUc2ZcCqK6KKXi7Qxm9KwzUqShzs5EZqa
 g+LkWf2XcIyE5s/SCE6pZ8LUgB5539qHvwWY8/Zzg0+G+K4yMEz1U3QqIbuR3CW50fCV
 2XxQ==
X-Gm-Message-State: AOAM530cnQrMEfej5uQDp2BxOS0DFFVAAIFsa6vskZRHa1j30iWl/oLj
 ThaaOKzcV48a5B8bMMRBuqv7Jvo/s4JA9+fB
X-Google-Smtp-Source: ABdhPJwsgeMgc+H+IGuIfVePmmxMjg2zrT9uHe9f+P9050U1uBAI/sXCfVwPSb6cnY2JQ0zU1rVhjQ==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr8657833wrt.276.1599230395375; 
 Fri, 04 Sep 2020 07:39:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:39:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/24] drm/vgem: Use devm_drm_dev_alloc
Date: Fri,  4 Sep 2020 16:39:21 +0200
Message-Id: <20200904143941.110665-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This means we also need to slightly restructure the exit code, so that
final cleanup of the drm_device is triggered by unregistering the
platform device. Note that devres is both clean up when the driver is
unbound (not the case for vgem, we don't bind), and also when unregistering
the device (very much the case for vgem). Therefore we can rely on devres
even though vgem isn't a proper platform device driver.

This also somewhat untangles the load code, since the drm and platform device
setup are no longer interleaved, but two distinct steps.

v2: use devres_open/release_group so we can use devm without real
hacks in the driver core or having to create an entire fake bus for
testing drivers. Might want to extract this into helpers eventually,
maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 55 ++++++++++++++-------------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 313339bbff90..f95537627463 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -401,16 +401,8 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
 	return 0;
 }
 
-static void vgem_release(struct drm_device *dev)
-{
-	struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
-
-	platform_device_unregister(vgem->platform);
-}
-
 static struct drm_driver vgem_driver = {
 	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
-	.release			= vgem_release,
 	.open				= vgem_open,
 	.postclose			= vgem_postclose,
 	.gem_free_object_unlocked	= vgem_gem_free_object,
@@ -442,48 +434,49 @@ static struct drm_driver vgem_driver = {
 static int __init vgem_init(void)
 {
 	int ret;
+	struct platform_device *pdev;
 
-	vgem_device = kzalloc(sizeof(*vgem_device), GFP_KERNEL);
-	if (!vgem_device)
-		return -ENOMEM;
+	pdev = platform_device_register_simple("vgem", -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(vgem_device->platform);
 
-	vgem_device->platform =
-		platform_device_register_simple("vgem", -1, NULL, 0);
-	if (IS_ERR(vgem_device->platform)) {
-		ret = PTR_ERR(vgem_device->platform);
-		goto out_free;
+	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto out_unregister;
 	}
 
-	dma_coerce_mask_and_coherent(&vgem_device->platform->dev,
+	dma_coerce_mask_and_coherent(&pdev->dev,
 				     DMA_BIT_MASK(64));
-	ret = drm_dev_init(&vgem_device->drm, &vgem_driver,
-			   &vgem_device->platform->dev);
-	if (ret)
-		goto out_unregister;
-	drmm_add_final_kfree(&vgem_device->drm, vgem_device);
+
+	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
+					 struct vgem_device, drm);
+	if (IS_ERR(vgem_device)) {
+		ret = PTR_ERR(vgem_device);
+		goto out_devres;
+	}
+	vgem_device->platform = pdev;
 
 	/* Final step: expose the device/driver to userspace */
 	ret = drm_dev_register(&vgem_device->drm, 0);
 	if (ret)
-		goto out_put;
+		goto out_devres;
 
 	return 0;
 
-out_put:
-	drm_dev_put(&vgem_device->drm);
-	platform_device_unregister(vgem_device->platform);
-	return ret;
+out_devres:
+	devres_release_group(&pdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(vgem_device->platform);
-out_free:
-	kfree(vgem_device);
+	platform_device_unregister(pdev);
 	return ret;
 }
 
 static void __exit vgem_exit(void)
 {
+	struct platform_device *pdev = vgem_device->platform;
+
 	drm_dev_unregister(&vgem_device->drm);
-	drm_dev_put(&vgem_device->drm);
+	devres_release_group(&pdev->dev, NULL);
+	platform_device_unregister(pdev);
 }
 
 module_init(vgem_init);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
