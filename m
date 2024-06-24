Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77DF91519C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2881A10E4BD;
	Mon, 24 Jun 2024 15:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tm9kVRTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34D410E49C;
 Mon, 24 Jun 2024 15:12:42 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6b50a68b0b3so41979156d6.0; 
 Mon, 24 Jun 2024 08:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719241962; x=1719846762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GABY2nvouUZjfeGwOTIxOkPVykOPUX3bq4LbbVyRoM=;
 b=Tm9kVRTCvcksPnBsaZF0jECrApYW/k318dqoqFu7PBo+kig84+VGaFboOj6RQWrTT1
 qxkcQqEiHuH50kvVu88snCCPtyBk+INJXPI0nnwDGi79Visknl1xHd3a+lMZb3aTydml
 Q90yTd4kW91zedZk+U4gZr6dKfT5Dn24/EAB0UNlL6cQ+pJuihaydQ+cLtLGQbGG4GTD
 7M/a3DLfC5G2rZP/Jn8yk93bxQKOHa6fx3r3ipCUKT+dqo2YxajRd3xiilZsKCq4msZb
 12MR+EPMULDK/ZBbJ4nozqapZUMBxtZFU22Gm8ojAGDu3uvHxEAb7GbmKEG+NGPrKVW8
 pQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719241962; x=1719846762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GABY2nvouUZjfeGwOTIxOkPVykOPUX3bq4LbbVyRoM=;
 b=U33iYG9ONrWuZFzAe4S9QlRAXE0cly5pYP+zTe205GCe3AwixbqixXMYx8Hc2MUdhu
 0Y/o/GTCWx9FTtcSpoVboWnuCtFRjfM7vndFRJs8g65t3So8aLzpCLRn8n6R33QWsS6R
 SsSyFTTJJtXjZv/fVm5bkINvausLaTe/FrtCZazGqN239M+j64fWvFZgpJQfTfl/DSX7
 uaM+BUJBL4Mc61+6HmzKetXYxkTMhqPL5qxYYlvE23FYlRhqz2KgRz3kVn0m6oQEt7QO
 aWjW/USsbIY+6DGDrs8gr3e1U+5LFxl/aUvp+eEEHkLUSvdSzNf4E/VY8aHMYvLNBfgQ
 K/4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC6/7kCGNNHoGM4klDUMo8LlKs7eLTvqqXWcfolfJEH6OTCA/I7qSL3kdXie3h3MkRufxcWurunWY+fL+PAs0L8s3IB63+fec1jEVuO0Kmw9T5TqB9qr0U9gR3ZhEhDZZDH6r2NVjiwgXyVOF8og==
X-Gm-Message-State: AOJu0YxXJjrm2qgrjTBs9w7nK5vYt0iy2dm8baUC1XwHppjXcxB6LvCb
 a8NQGeVTJbNpxf3v4FazkGUYdrn3gsK8TAiM9PsYhb/eALThStDs
X-Google-Smtp-Source: AGHT+IFuVCQIMxGLsEodTOfH3eyC8ePGTJrcOWZgS2npTRXBH4SIi8n4cZ2nFvHwh8J8UOMRC8+4tg==
X-Received: by 2002:ad4:418d:0:b0:6b5:2f57:1a63 with SMTP id
 6a1803df08f44-6b56360996amr12300036d6.21.1719241961650; 
 Mon, 24 Jun 2024 08:12:41 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b529eb3decsm27243976d6.12.2024.06.24.08.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:12:41 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] drm/radeon: remove load callback
Date: Mon, 24 Jun 2024 11:10:45 -0400
Message-ID: <20240624151122.23724-2-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624151122.23724-1-wuhoipok@gmail.com>
References: <20240624151122.23724-1-wuhoipok@gmail.com>
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

Remove ".load" callback form "kms_driver", and move "struct drm_device"
into radeon_device. Patch 2 to 7 follows up with changing the way of
accessing drm_device, from "rdev->ddev" to "rdev_to_drm(rdev)" which is
"&rdev->ddev".

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

