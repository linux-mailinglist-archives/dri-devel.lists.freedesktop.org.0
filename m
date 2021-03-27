Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C034B33A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 01:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87A26F509;
	Sat, 27 Mar 2021 00:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399586F504
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616803836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rjA29zoNSz0bxCMfRwAfFBZikJAocJNz2pOBHbe3Ig=;
 b=FbJjsaSO2AcoIPJ8Uz36Ni6hFlgP1BToZxzlYA2b7d//M3/ZH3TWgD+eFOIlbB4N4b15lb
 zg7ca65SgcmHDnSfcM0li24nRalIfs1pfKs0W6poAmIm5yOIJ+WD0gQ9xj49//i6Ooyon9
 LpVA6x8kFAanB1bfRY0gdQWp7dE9PMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-SsyU6mQZOJiWRRS3m8mXhA-1; Fri, 26 Mar 2021 20:10:34 -0400
X-MC-Unique: SsyU6mQZOJiWRRS3m8mXhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AAFE180FCA9;
 Sat, 27 Mar 2021 00:10:33 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EAA71972B;
 Sat, 27 Mar 2021 00:10:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/nouveau: manage nouveau_drm lifetime with devres
Date: Fri, 26 Mar 2021 20:10:00 -0400
Message-Id: <20210327001001.229093-3-lyude@redhat.com>
In-Reply-To: <20210327001001.229093-1-lyude@redhat.com>
References: <20210327001001.229093-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jeremy Cline <jcline@redhat.com>

Make use of the devm_drm_dev_alloc() API to bind the lifetime of
nouveau_drm structure to the drm_device. This is important because a
reference to nouveau_drm is accessible from drm_device, which is
provided to a number of DRM layer callbacks that can run after the
deallocation of nouveau_drm currently occurs.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 44 ++++++++++++---------------
 drivers/gpu/drm/nouveau/nouveau_drv.h | 10 ++++--
 2 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index bce1abea0d58..1285631c6797 100644
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
 
 	pci_set_drvdata(pdev, drm_dev);
 
@@ -777,8 +774,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	nouveau_drm_device_fini(drm_dev);
 fail_pci:
 	pci_disable_device(pdev);
-fail_drm:
-	drm_dev_put(drm_dev);
 fail_nvkm:
 	nvkm_device_del(&device);
 	return ret;
@@ -798,7 +793,6 @@ nouveau_drm_device_remove(struct drm_device *dev)
 	device = nvkm_device_find(client->device);
 
 	nouveau_drm_device_fini(dev);
-	drm_dev_put(dev);
 	nvkm_device_del(&device);
 }
 
@@ -1284,7 +1278,8 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 			       struct platform_device *pdev,
 			       struct nvkm_device **pdevice)
 {
-	struct drm_device *drm;
+	struct nouveau_drm *nv_dev;
+	struct drm_device *drm_dev;
 	int err;
 
 	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
@@ -1292,22 +1287,21 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
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
index 526e110b52ac..8eb133fd6df0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -135,7 +135,11 @@ struct nouveau_drm {
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
 
@@ -236,7 +240,7 @@ struct nouveau_drm {
 static inline struct nouveau_drm *
 nouveau_drm(struct drm_device *dev)
 {
-	return dev->dev_private;
+	return container_of(dev, struct nouveau_drm, drm_dev);
 }
 
 /**
@@ -250,7 +254,7 @@ nouveau_drm(struct drm_device *dev)
  */
 static inline struct drm_device *
 nouveau_to_drm_dev(struct nouveau_drm *nv_dev) {
-	return nv_dev->dev;
+	return &nv_dev->drm_dev;
 }
 
 /**
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
