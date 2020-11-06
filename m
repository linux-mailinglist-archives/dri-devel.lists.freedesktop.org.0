Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D02A8C97
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 03:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AED6EA11;
	Fri,  6 Nov 2020 02:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF766EA11
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 02:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604629060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hkWonUI6QAjKhs8ezdt4KReWYH2K8M+YMQvYNsUkFyw=;
 b=NRwHP4bsTvIW8tnvFAVAeaN4V1CgMinZ4A/4TrXbsDX05uThs1aOTg7Qbbiy3iEZreZioi
 odH175Qwu1IRt9iRFKSydXeA4NtQ08GtDSgwuABY8/Ti0GC6HjlWxs7gnk10YbEMfuIKGB
 2+2hDII2jZ/en51UBQjtgCBVaJHaGo0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-cBqXVVPjOKmzoe4b3EQDVg-1; Thu, 05 Nov 2020 21:17:38 -0500
X-MC-Unique: cBqXVVPjOKmzoe4b3EQDVg-1
Received: by mail-qt1-f199.google.com with SMTP id e19so2168032qtq.17
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 18:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hkWonUI6QAjKhs8ezdt4KReWYH2K8M+YMQvYNsUkFyw=;
 b=GQH0avEj4VJ0F3Ny+5CT89RnSIk2LLLx5iQGlbmlqLzTWTcdrMm57X1ufhU0/61BpN
 J4uhbByEYTtb3/XkC8ToaiMzFUJqcerYQ+bBch9UqGjJ8sYWbQohkHB8K8e0fLVeZ2ha
 s04/O7hXVVInA1JPg9B86D2WzAYkLK/DfY9IvUB5bjbrbL/FgkLnY9lKib5miyFeHPP/
 ni16IP+Zw5BWZCy55RjTtX3Q4R0wN6wVM4OvS1mwLM5RJwXB8Lpj3Epr4qH/B5NLd1yF
 OGPMXnF1s6TmMHU1qgNJ8qEE05WTSzM/bFtZHLyiXCGyWUpj/J7Rt82TwJEZODnWp6SK
 +lbg==
X-Gm-Message-State: AOAM5332YNKPxWeXvjVnqAN6Ht2dhCYgZU9yiCV68cWO7e+r3OkhRDni
 NV60ZmO2pnJI5VBkQZuNuUxJqpNWN++UP05vZ4GDf8vL1UdWK5EieQEzO5LHvxivK5xwgMTYsQS
 fbOgmNJttoT98CTEFgodPgRHZq1VW
X-Received: by 2002:ae9:e314:: with SMTP id v20mr5187252qkf.93.1604629057899; 
 Thu, 05 Nov 2020 18:17:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8M7KpBAxVH3k8YS1rDYfBDUKEgiThQTDSvQEAS/ETRQKa8aqj2ZMhpXAtrrp+lppynHmz6w==
X-Received: by 2002:ae9:e314:: with SMTP id v20mr5187242qkf.93.1604629057714; 
 Thu, 05 Nov 2020 18:17:37 -0800 (PST)
Received: from xps13.jcline.org ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id q20sm2195301qtn.80.2020.11.05.18.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 18:17:37 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 2/3] drm/nouveau: manage nouveau_drm lifetime with devres
Date: Thu,  5 Nov 2020 21:16:55 -0500
Message-Id: <20201106021656.40743-3-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106021656.40743-1-jcline@redhat.com>
References: <20201106021656.40743-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make use of the devm_drm_dev_alloc() API to bind the lifetime of
nouveau_drm structure to the drm_device. This is important because a
reference to nouveau_drm is accessible from drm_device, which is
provided to a number of DRM layer callbacks that can run after the
deallocation of nouveau_drm currently occurs.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 44 ++++++++++++---------------
 drivers/gpu/drm/nouveau/nouveau_drv.h | 10 ++++--
 2 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index bc6f51bf23b7..f750c25e92f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -30,9 +30,11 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/mmu_notifier.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include <core/gpuobj.h>
 #include <core/option.h>
@@ -532,13 +534,8 @@ nouveau_parent = {
 static int
 nouveau_drm_device_init(struct drm_device *dev)
 {
-	struct nouveau_drm *drm;
 	int ret;
-
-	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
-		return -ENOMEM;
-	dev->dev_private = drm;
-	drm->dev = dev;
+	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 	drm->master.base.object.parent = &drm->parent;
@@ -620,7 +617,6 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_cli_fini(&drm->master);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
-	kfree(drm);
 	return ret;
 }
 
@@ -654,7 +650,6 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	nvif_parent_dtor(&drm->parent);
-	kfree(drm);
 }
 
 /*
@@ -720,6 +715,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 {
 	struct nvkm_device *device;
 	struct drm_device *drm_dev;
+	struct nouveau_drm *nv_dev;
 	int ret;
 
 	if (vga_switcheroo_client_probe_defer(pdev))
@@ -750,15 +746,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	if (nouveau_atomic)
 		driver_pci.driver_features |= DRIVER_ATOMIC;
 
-	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
-	if (IS_ERR(drm_dev)) {
-		ret = PTR_ERR(drm_dev);
+	nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_stub, typeof(*nv_dev), drm_dev);
+	if (IS_ERR(nv_dev)) {
+		ret = PTR_ERR(nv_dev);
 		goto fail_nvkm;
 	}
+	drm_dev = nouveau_to_drm_dev(nv_dev);
 
 	ret = pci_enable_device(pdev);
 	if (ret)
-		goto fail_drm;
+		goto fail_nvkm;
 
 	drm_dev->pdev = pdev;
 	pci_set_drvdata(pdev, drm_dev);
@@ -778,8 +775,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	nouveau_drm_device_fini(drm_dev);
 fail_pci:
 	pci_disable_device(pdev);
-fail_drm:
-	drm_dev_put(drm_dev);
 fail_nvkm:
 	nvkm_device_del(&device);
 	return ret;
@@ -799,7 +794,6 @@ nouveau_drm_device_remove(struct drm_device *dev)
 	device = nvkm_device_find(client->device);
 
 	nouveau_drm_device_fini(dev);
-	drm_dev_put(dev);
 	nvkm_device_del(&device);
 }
 
@@ -1285,7 +1279,8 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 			       struct platform_device *pdev,
 			       struct nvkm_device **pdevice)
 {
-	struct drm_device *drm;
+	struct nouveau_drm *nv_dev;
+	struct drm_device *drm_dev;
 	int err;
 
 	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
@@ -1293,22 +1288,21 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	if (err)
 		goto err_free;
 
-	drm = drm_dev_alloc(&driver_platform, &pdev->dev);
-	if (IS_ERR(drm)) {
-		err = PTR_ERR(drm);
+	nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_platform, typeof(*nv_dev), drm_dev);
+	if (IS_ERR(nv_dev)) {
+		err = PTR_ERR(nv_dev);
 		goto err_free;
 	}
+	drm_dev = nouveau_to_drm_dev(nv_dev);
 
-	err = nouveau_drm_device_init(drm);
+	err = nouveau_drm_device_init(drm_dev);
 	if (err)
-		goto err_put;
+		goto err_free;
 
-	platform_set_drvdata(pdev, drm);
+	platform_set_drvdata(pdev, drm_dev);
 
-	return drm;
+	return drm_dev;
 
-err_put:
-	drm_dev_put(drm);
 err_free:
 	nvkm_device_del(pdevice);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3e2920a10099..cf6c33e52a5c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -137,7 +137,11 @@ struct nouveau_drm {
 	struct nvif_parent parent;
 	struct nouveau_cli master;
 	struct nouveau_cli client;
-	struct drm_device *dev;
+
+	/**
+	 * @drm_dev: The parent DRM device object.
+	 */
+	struct drm_device drm_dev;
 
 	struct list_head clients;
 
@@ -237,7 +241,7 @@ struct nouveau_drm {
 static inline struct nouveau_drm *
 nouveau_drm(struct drm_device *dev)
 {
-	return dev->dev_private;
+	return container_of(dev, struct nouveau_drm, drm_dev);
 }
 
 /**
@@ -251,7 +255,7 @@ nouveau_drm(struct drm_device *dev)
  */
 static inline struct drm_device *
 nouveau_to_drm_dev(struct nouveau_drm *nv_dev) {
-	return nv_dev->dev;
+	return &nv_dev->drm_dev;
 }
 
 /**
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
