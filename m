Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DC91275D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAC210F1A7;
	Fri, 21 Jun 2024 14:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gWVTQxXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032B10F1A7;
 Fri, 21 Jun 2024 14:17:00 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6fc36865561so1006831a34.3; 
 Fri, 21 Jun 2024 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718979420; x=1719584220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Esapyh4sEYZ9iUxizwPARzP2FysvGIktBy8oVxqC0Cw=;
 b=gWVTQxXbOYWxhFQUkYTyfNTWm39Smc5wgaSbQV0PzWnXJ9TEesY8eFzusZS2MUuyAk
 5Y6s/MTHzkCuakve+NMCuiIW+yqEQOwpXGShZhd8VqQPwlK1T7ibktUlcUyCWQLU6TzV
 kIyzKL0Tkh7g/ccP3z2dZvKqp5MXKrUNCwvnB4jBzui7aKV0jyKEspGguWSilmUv8C3B
 BJ4ODiwR26jhtAPy0er34X5THhpFcyLnqsRun8sWf/PMkiC5cWESHCfmbgR6FCFtz6Qb
 XhEgkFLOOLRGrM8GC/cfEIqqUkAnUy0iZu5wH/UzaiBigQVtdoFj8nsptN5EhHZvmAd/
 1ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718979420; x=1719584220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Esapyh4sEYZ9iUxizwPARzP2FysvGIktBy8oVxqC0Cw=;
 b=T3y4Q7676O2cF/dyLr7crSZnqBjhcC0senRxTMsacQQJwKxjtSMWPHfScHuD25I0G2
 R7qExVn5bfNVgI0ieptW1x/FUYseCZnkpcalyXFlNOZdRiLBvSa61QHaAflMZt5tJMiQ
 J0S3RIjic0FVfoxRh1XK1cYPrNYK6yT4z0ft/AphhywtcNCFGlA9x9NoN8sIZZ0BeOiX
 sK8QDebyJm8WQItIuxnz/AOI9bTIvwf9G7YyPKlXQymRYjvKx9m4alq2yZIgITZDWIR+
 WZUmVTb5d4PBWHinsMeFeQt1zcupGQUCAGA1P3pC6iPpw2KJjqrAouCdQfb70Vt2uQ3p
 WMJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+p0dEDY/jwqhgxqL+1OZSzSS3XVhi9U0BHlohtJfrMXP6xCy+T5ty0r+0aTptmA0hWIbR3FUtXJM2WJcpFygu6+XZFnMtGYUeHmvy6BG0dR4TrxszbH/hUBnzAKY1U5Cz+icTX21u+6Yo4k4fzA==
X-Gm-Message-State: AOJu0YxQV4ofGwEcnBweXimUI/Rnj/I/ZZiBcgYICvXdPsDXFMwle0ZV
 tN9QlXwFEvKw7EbCLy2gJc3MNsMVOhuKchnInVYO7cbuETcLAX2M3X9cMkv3
X-Google-Smtp-Source: AGHT+IHB9Q1J37kAuSt0w6qEbVtcrjIXCCwTuAGNeZVLBZz8uneDHbm725GPvvSy6CUL/a7gavHGOg==
X-Received: by 2002:a05:6830:20cb:b0:6f9:edf5:6374 with SMTP id
 46e09a7af769-7007682cc4amr9214565a34.34.1718979419623; 
 Fri, 21 Jun 2024 07:16:59 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ed4aa5asm9090346d6.55.2024.06.21.07.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:16:59 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/7] drm/radeon: remove load callback
Date: Fri, 21 Jun 2024 10:15:37 -0400
Message-ID: <20240621141544.19817-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is "drm/radeon: remove load callback" v2, the only changes
were made are adding "ddev->dev_private = rdev;", right after
the allocation of "struct radeon_device". Patch v2 2-7 mostly
describes simple "rdev->ddev" to "rdev_to_drm(rdev)" to suit
Patch v2 1/7.

Please be aware that these 7 patches depends on each other.

Thank you.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon.h     | 11 ++++++++---
 drivers/gpu/drm/radeon/radeon_drv.c | 27 ++++++++++++++++++---------
 drivers/gpu/drm/radeon/radeon_drv.h |  1 -
 drivers/gpu/drm/radeon/radeon_kms.c | 18 ++++++------------
 4 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 0999c8eaae94..69bb30ced189 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_device*, uint32_t, uint32_t);
 
 struct radeon_device {
 	struct device			*dev;
-	struct drm_device		*ddev;
+	struct drm_device		ddev;
 	struct pci_dev			*pdev;
 #ifdef __alpha__
 	struct pci_controller		*hose;
@@ -2440,10 +2440,13 @@ struct radeon_device {
 	u64 gart_pin_size;
 };
 
+static inline struct drm_device *rdev_to_drm(struct radeon_device *rdev)
+{
+	return &rdev->ddev;
+}
+
 bool radeon_is_px(struct drm_device *dev);
 int radeon_device_init(struct radeon_device *rdev,
-		       struct drm_device *ddev,
-		       struct pci_dev *pdev,
 		       uint32_t flags);
 void radeon_device_fini(struct radeon_device *rdev);
 int radeon_gpu_wait_for_idle(struct radeon_device *rdev);
@@ -2818,6 +2821,8 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev);
 
 /* KMS */
 
+int radeon_driver_load_kms(struct radeon_device *dev, unsigned long flags);
+
 u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
 int radeon_enable_vblank_kms(struct drm_crtc *crtc);
 void radeon_disable_vblank_kms(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..ae9cadceba83 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -259,7 +259,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
 	unsigned long flags = 0;
-	struct drm_device *dev;
+	struct drm_device *ddev;
+	struct radeon_device *rdev;
 	int ret;
 
 	if (!ent)
@@ -300,28 +301,37 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&kms_driver, &pdev->dev);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
+	rdev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev), ddev);
+	if (IS_ERR(rdev))
+		return PTR_ERR(rdev);
+
+	rdev->dev  = &pdev->dev;
+	rdev->pdev = pdev;
+	ddev = rdev_to_drm(rdev);
+	ddev->dev_private = rdev;
 
 	ret = pci_enable_device(pdev);
 	if (ret)
 		goto err_free;
 
-	pci_set_drvdata(pdev, dev);
+	pci_set_drvdata(pdev, ddev);
+
+	ret = radeon_driver_load_kms(rdev, flags);
+	if (ret)
+		goto err_agp;
 
-	ret = drm_dev_register(dev, ent->driver_data);
+	ret = drm_dev_register(ddev, flags);
 	if (ret)
 		goto err_agp;
 
-	radeon_fbdev_setup(dev->dev_private);
+	radeon_fbdev_setup(ddev->dev_private);
 
 	return 0;
 
 err_agp:
 	pci_disable_device(pdev);
 err_free:
-	drm_dev_put(dev);
+	drm_dev_put(ddev);
 	return ret;
 }
 
@@ -569,7 +579,6 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
 static const struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
-	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
 	.unload = radeon_driver_unload_kms,
diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
index 02a65971d140..6c1eb75a951b 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.h
+++ b/drivers/gpu/drm/radeon/radeon_drv.h
@@ -117,7 +117,6 @@
 long radeon_drm_ioctl(struct file *filp,
 		      unsigned int cmd, unsigned long arg);
 
-int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
 void radeon_driver_unload_kms(struct drm_device *dev);
 int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void radeon_driver_postclose_kms(struct drm_device *dev,
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index a16590c6247f..d2df194393af 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -91,7 +91,7 @@ void radeon_driver_unload_kms(struct drm_device *dev)
 /**
  * radeon_driver_load_kms - Main load function for KMS.
  *
- * @dev: drm dev pointer
+ * @rdev: radeon dev pointer
  * @flags: device flags
  *
  * This is the main load function for KMS (all asics).
@@ -101,24 +101,18 @@ void radeon_driver_unload_kms(struct drm_device *dev)
  * (crtcs, encoders, hotplug detect, etc.).
  * Returns 0 on success, error on failure.
  */
-int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
+int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long flags)
 {
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct radeon_device *rdev;
+	struct pci_dev *pdev = rdev->pdev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	int r, acpi_status;
 
-	rdev = kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
-	if (rdev == NULL) {
-		return -ENOMEM;
-	}
-	dev->dev_private = (void *)rdev;
-
 #ifdef __alpha__
 	rdev->hose = pdev->sysdata;
 #endif
 
 	if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
-		rdev->agp = radeon_agp_head_init(dev);
+		rdev->agp = radeon_agp_head_init(rdev_to_drm(rdev));
 	if (rdev->agp) {
 		rdev->agp->agp_mtrr = arch_phys_wc_add(
 			rdev->agp->agp_info.aper_base,
@@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	 * properly initialize the GPU MC controller and permit
 	 * VRAM allocation
 	 */
-	r = radeon_device_init(rdev, dev, pdev, flags);
+	r = radeon_device_init(rdev, flags);
 	if (r) {
 		dev_err(dev->dev, "Fatal error during GPU init\n");
 		goto out;
-- 
2.45.2

