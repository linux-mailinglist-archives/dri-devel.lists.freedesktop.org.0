Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8D262B9D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 11:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289DE6ED8F;
	Wed,  9 Sep 2020 09:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3996ED8F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:18:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so2132010wrt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RK9xZ0VugvitNWCHNnZgtPdpIu97bwsvFKF4AIlshdA=;
 b=ll5oQR2uoBDhsWjWSIEt3xMl+fnpIyK8ItpEKG2X9+lHKG8/1fKoVTF7ICHRZhcZ24
 Dtd8JK4Sft1uhWDLaBhY+yMN1qVhh2I10Mscxhch1oVVonoIcpJIrJl+2zRNzu08dp0n
 b0CRWU4dgF+Ko4QLiHkOjkNqITeClLMCyBM3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RK9xZ0VugvitNWCHNnZgtPdpIu97bwsvFKF4AIlshdA=;
 b=c3RkhMd7jNQKT+U6dvQmD2V/JJVuP9pD0KDbmD0moemSRX50BJ7h3moBiyuPJsL0bu
 Po0Tl79l5H1XF9Yo7uyjj5PZLofbaLHk7IBiu52X1BRYCKO2RURUs5RnupE89JGnUqs4
 Yj7n08wSid881X9wHq8edrOR4uwzKnuXKMVkMhI4OO4KSVoL9EXzp6KDa+M+y89YobTo
 Le4g/A06udw7Wa/pKx7B4GuZghpaKle3oqpjs3ki0n4OLNsBFJ2lYtr74Pm3gMhl7gyb
 01aN/qrvKMTcraZ819XfGhilMksZE58QyO2osYfrgRiXRgi7Par4l4weORy9EUncB3sZ
 Uw3g==
X-Gm-Message-State: AOAM533z0yMAqIRA7UY1HvqHoqtYPKZwaM50GYwFkalY9p8L7EFaOEGC
 BxgdFG05HugCoUqVXxabfxUt4caXAWg75MBc
X-Google-Smtp-Source: ABdhPJxbCKRzh5HOdctF0iQ3ml3KGL/rMLOpe4DmVBLnWzl3s4Q19u9XnxkQZU1ORW/zR+Z8w10nOw==
X-Received: by 2002:adf:f890:: with SMTP id u16mr2732149wrp.183.1599643118833; 
 Wed, 09 Sep 2020 02:18:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c205sm2992024wmd.33.2020.09.09.02.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:18:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vkms: Use devm_drm_dev_alloc
Date: Wed,  9 Sep 2020 11:18:33 +0200
Message-Id: <20200909091833.440548-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-6-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-6-daniel.vetter@ffwll.ch>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This means we also need to slightly restructure the exit code, so that
final cleanup of the drm_device is triggered by unregistering the
platform device. Note that devres is both clean up when the driver is
unbound (not the case for vkms, we don't bind), and also when unregistering
the device (very much the case for vkms). Therefore we can rely on devres
even though vkms isn't a proper platform device driver.

This also somewhat untangles the load code, since the drm and platform device
setup are no longer interleaved, but two distinct steps.

v2: use devres_open/release_group so we can use devm without real
hacks in the driver core or having to create an entire fake bus for
testing drivers. Might want to extract this into helpers eventually,
maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.

v3: Only deref vkms_device after checking it (Melissa)

Cc: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 83dd5567de8b..cb0b6230c22c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -61,9 +61,6 @@ static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
 
-	platform_device_unregister(vkms->platform);
-	drm_atomic_helper_shutdown(&vkms->drm);
-	drm_mode_config_cleanup(&vkms->drm);
 	destroy_workqueue(vkms->output.composer_workq);
 }
 
@@ -144,30 +141,31 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 static int __init vkms_init(void)
 {
 	int ret;
+	struct platform_device *pdev;
 
-	vkms_device = kzalloc(sizeof(*vkms_device), GFP_KERNEL);
-	if (!vkms_device)
-		return -ENOMEM;
+	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	vkms_device->platform =
-		platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
-	if (IS_ERR(vkms_device->platform)) {
-		ret = PTR_ERR(vkms_device->platform);
-		goto out_free;
+	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto out_unregister;
 	}
 
-	ret = drm_dev_init(&vkms_device->drm, &vkms_driver,
-			   &vkms_device->platform->dev);
-	if (ret)
-		goto out_unregister;
-	drmm_add_final_kfree(&vkms_device->drm, vkms_device);
+	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
+					 struct vkms_device, drm);
+	if (IS_ERR(vkms_device)) {
+		ret = PTR_ERR(vkms_device);
+		goto out_devres;
+	}
+	vkms_device->platform = pdev;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
 
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_put;
+		goto out_devres;
 	}
 
 	vkms_device->drm.irq_enabled = true;
@@ -175,39 +173,41 @@ static int __init vkms_init(void)
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_put;
+		goto out_devres;
 	}
 
 	ret = vkms_modeset_init(vkms_device);
 	if (ret)
-		goto out_put;
+		goto out_devres;
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
-		goto out_put;
+		goto out_devres;
 
 	return 0;
 
-out_put:
-	drm_dev_put(&vkms_device->drm);
-	platform_device_unregister(vkms_device->platform);
-	return ret;
+out_devres:
+	devres_release_group(&pdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(vkms_device->platform);
-out_free:
-	kfree(vkms_device);
+	platform_device_unregister(pdev);
 	return ret;
 }
 
 static void __exit vkms_exit(void)
 {
+	struct platform_device *pdev;
+
 	if (!vkms_device) {
 		DRM_INFO("vkms_device is NULL.\n");
 		return;
 	}
 
+	pdev = vkms_device->platform;
+
 	drm_dev_unregister(&vkms_device->drm);
-	drm_dev_put(&vkms_device->drm);
+	drm_atomic_helper_shutdown(&vkms_device->drm);
+	devres_release_group(&pdev->dev, NULL);
+	platform_device_unregister(pdev);
 }
 
 module_init(vkms_init);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
