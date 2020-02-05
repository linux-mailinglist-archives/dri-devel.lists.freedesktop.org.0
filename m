Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB26815256E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53796F472;
	Wed,  5 Feb 2020 03:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEFF6F471;
 Wed,  5 Feb 2020 03:49:23 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id q39so372965pjc.0;
 Tue, 04 Feb 2020 19:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=39oCmI9qUkdyhIwqFqQP7H02Tg7cpRynqVrB8dE2OhI=;
 b=CurJJeQNPQ3DijC47bbIMk/vc6quEYqfcyW34asMXURKXN7o/exru7iFr1vT6HzQ/C
 z6YI5uybNae9IUf4DjmODLLIrGnCRzFd1AnJM46G9aTfmgXH106aOcJAeHxHcGqKw6p6
 WX3wRaIeUz07d1rRajFeFZXhNTFpsepQpP6Jv2D/x6KYbFNorYa7cqX3Oj3CWUDT3vRt
 zR6SF6tJvLVYPscqj4QNeQykZngdNqdXrEZrBLY0Ioxim8lffsxMlwBsqh5MjOx6Ebt0
 j6X5JsM5QxHlz9dHqXhSm5ybR2TGiFbifBzaHIEv50gmsndVjXdVB8F2ZuBttzJsM/rm
 5Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=39oCmI9qUkdyhIwqFqQP7H02Tg7cpRynqVrB8dE2OhI=;
 b=gfO6dvrO88QGSpLegAYwLahHl2wuxhvC3RlPnGcHGNGPpQRQ/nbqe06VLjPEim3MRZ
 FMo+yIGEjvf3YMgroZ3SCu3RkD8fWoaB8LlsUBd6n1D8Uy/4FlCuHqWJ/rFc/EwRR851
 eewws+3dGxLig0uWUoXKwBYi64D0oToqIipsh8ZytvXeq6C450FwGu1EBHQxCgVF+6UA
 odBerpETB9mnf0wG38h52L9CSdN2wQi8qOh3/tL0XlzhV6uBaSniohRbuNSj9+//4RKD
 0fcpqPSC8oKDXPNy3n1jhA8WoW0fM4flUddDUreGTmUFIX28/EuqBXtd4dulen46tN0n
 HvHA==
X-Gm-Message-State: APjAAAWeoLdHQK9cI1Q2Me7exG2NJGUcR/p5S3Ofv80Hckp/t74Y/3jC
 QRj/TwFz8uRsNzjT2F7aSLuMv6vu
X-Google-Smtp-Source: APXvYqxAnGtTgaSwKYi4u9jDzQVmhd4bZE+CtETrn27bc51pwAP45NNDH08SNa8pseMlWXrvcLwfdA==
X-Received: by 2002:a17:902:124:: with SMTP id
 33mr33835303plb.128.1580874562719; 
 Tue, 04 Feb 2020 19:49:22 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:22 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/14] drm/amdgpu: drop legacy drm load and unload callbacks
Date: Tue,  4 Feb 2020 22:48:52 -0500
Message-Id: <20200205034852.4157-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
References: <20200205034852.4157-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've moved the debugfs handling into a centralized place
so we can remove the legacy load an unload callbacks.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  5 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 13 +++++++++++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4dc7145368fc..12aab522f459 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3091,10 +3091,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	} else
 		adev->ucode_sysfs_en = true;
 
-	r = amdgpu_debugfs_init(adev);
-	if (r)
-		DRM_ERROR("Creating debugfs files failed (%d).\n", r);
-
 	if ((amdgpu_testing & 1)) {
 		if (adev->accel_working)
 			amdgpu_test_moves(adev);
@@ -3216,7 +3212,6 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 		amdgpu_ucode_sysfs_fini(adev);
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
-	amdgpu_debugfs_fini(adev);
 	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
 		amdgpu_discovery_fini(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f26532998781..9753c55b317d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1031,6 +1031,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
 	struct drm_device *dev;
+	struct amdgpu_device *adev;
 	unsigned long flags = ent->driver_data;
 	int ret, retry = 0;
 	bool supports_atomic = false;
@@ -1100,6 +1101,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, dev);
 
+	amdgpu_driver_load_kms(dev, ent->driver_data);
+
 retry_init:
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret == -EAGAIN && ++retry <= 3) {
@@ -1110,6 +1113,11 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	} else if (ret)
 		goto err_pci;
 
+	adev = dev->dev_private;
+	ret = amdgpu_debugfs_init(adev);
+	if (ret)
+		DRM_ERROR("Creating debugfs files failed (%d).\n", ret);
+
 	return 0;
 
 err_pci:
@@ -1123,6 +1131,7 @@ static void
 amdgpu_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = dev->dev_private;
 
 #ifdef MODULE
 	if (THIS_MODULE->state != MODULE_STATE_GOING)
@@ -1130,6 +1139,8 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 		DRM_ERROR("Hotplug removal is not supported\n");
 	drm_dev_unplug(dev);
 	drm_dev_put(dev);
+	amdgpu_debugfs_fini(adev);
+	amdgpu_driver_unload_kms(dev);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
@@ -1434,11 +1445,9 @@ static struct drm_driver kms_driver = {
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE,
-	.load = amdgpu_driver_load_kms,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
-	.unload = amdgpu_driver_unload_kms,
 	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
 	.enable_vblank = amdgpu_enable_vblank_kms,
 	.disable_vblank = amdgpu_disable_vblank_kms,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
