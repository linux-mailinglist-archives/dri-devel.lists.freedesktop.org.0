Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA852E615
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73E711B586;
	Fri, 20 May 2022 07:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0C1011B586
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 07:20:45 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0B96320F9C0D;
 Fri, 20 May 2022 00:20:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0B96320F9C0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1653031245;
 bh=l3C4NInvgKvz4oi7EOLCuKiDCvtT7GIwKr04BZ3Yohk=;
 h=From:To:Subject:Date:From;
 b=WOzpWrc1VnMzae6Ns5L09zG0PwZGswch3brRhEKx3VaK3VEAJJYxiLLdzrFpkLY03
 oigcapwqqaPR67ezwnSJ3jtrV1pZntK7/1PT+LaFHbFcAD8fM47nMhhxlq+d77BxC/
 Oo9b+nTyDzatXyR959qwn0noqBErS3AREqQRoT6Y=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: ssengar@microsoft.com, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 decui@microsoft.com, haiyangz@microsoft.com
Subject: [PATCH] drm/hyperv : Removing the restruction of VRAM allocation with
 PCI bar size
Date: Fri, 20 May 2022 00:20:40 -0700
Message-Id: <1653031240-13623-1-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
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

There were two different approaches getting used in this driver to
allocate vram:
	1. VRAM allocation from PCI region for Gen1
	2. VRAM alloaction from MMIO region for Gen2
First approach limilts the vram to PCI BAR size, which is 64 MB in most
legacy systems. This limits the maximum resolution to be restricted to
64 MB size, and with recent conclusion on fbdev issue its concluded to have
similar allocation strategy for both Gen1 and Gen2. This patch unifies
the Gen1 and Gen2 vram allocation strategy.

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
FBdev patch Ref :
https://lore.kernel.org/lkml/20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2/T/

 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 76 ++-----------------------
 1 file changed, 4 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 4a8941fa0815..a32afd84f361 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -69,57 +69,8 @@ static struct pci_driver hyperv_pci_driver = {
 	.remove =	hyperv_pci_remove,
 };
 
-static int hyperv_setup_gen1(struct hyperv_drm_device *hv)
-{
-	struct drm_device *dev = &hv->dev;
-	struct pci_dev *pdev;
-	int ret;
-
-	pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
-			      PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
-	if (!pdev) {
-		drm_err(dev, "Unable to find PCI Hyper-V video\n");
-		return -ENODEV;
-	}
-
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv_driver);
-	if (ret) {
-		drm_err(dev, "Not able to remove boot fb\n");
-		return ret;
-	}
-
-	if (pci_request_region(pdev, 0, DRIVER_NAME) != 0)
-		drm_warn(dev, "Cannot request framebuffer, boot fb still active?\n");
-
-	if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0) {
-		drm_err(dev, "Resource at bar 0 is not IORESOURCE_MEM\n");
-		ret = -ENODEV;
-		goto error;
-	}
-
-	hv->fb_base = pci_resource_start(pdev, 0);
-	hv->fb_size = pci_resource_len(pdev, 0);
-	if (!hv->fb_base) {
-		drm_err(dev, "Resource not available\n");
-		ret = -ENODEV;
-		goto error;
-	}
-
-	hv->fb_size = min(hv->fb_size,
-			  (unsigned long)(hv->mmio_megabytes * 1024 * 1024));
-	hv->vram = devm_ioremap(&pdev->dev, hv->fb_base, hv->fb_size);
-	if (!hv->vram) {
-		drm_err(dev, "Failed to map vram\n");
-		ret = -ENOMEM;
-	}
-
-error:
-	pci_dev_put(pdev);
-	return ret;
-}
-
-static int hyperv_setup_gen2(struct hyperv_drm_device *hv,
-			     struct hv_device *hdev)
+static int hyperv_setup_gen(struct hyperv_drm_device *hv,
+			    struct hv_device *hdev)
 {
 	struct drm_device *dev = &hv->dev;
 	int ret;
@@ -181,10 +132,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 		goto err_hv_set_drv_data;
 	}
 
-	if (efi_enabled(EFI_BOOT))
-		ret = hyperv_setup_gen2(hv, hdev);
-	else
-		ret = hyperv_setup_gen1(hv);
+	ret = hyperv_setup_gen(hv, hdev);
 
 	if (ret)
 		goto err_vmbus_close;
@@ -225,29 +173,13 @@ static int hyperv_vmbus_remove(struct hv_device *hdev)
 {
 	struct drm_device *dev = hv_get_drvdata(hdev);
 	struct hyperv_drm_device *hv = to_hv(dev);
-	struct pci_dev *pdev;
 
 	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
 	vmbus_close(hdev->channel);
 	hv_set_drvdata(hdev, NULL);
 
-	/*
-	 * Free allocated MMIO memory only on Gen2 VMs.
-	 * On Gen1 VMs, release the PCI device
-	 */
-	if (efi_enabled(EFI_BOOT)) {
-		vmbus_free_mmio(hv->mem->start, hv->fb_size);
-	} else {
-		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
-				      PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
-		if (!pdev) {
-			drm_err(dev, "Unable to find PCI Hyper-V video\n");
-			return -ENODEV;
-		}
-		pci_release_region(pdev, 0);
-		pci_dev_put(pdev);
-	}
+	vmbus_free_mmio(hv->mem->start, hv->fb_size);
 
 	return 0;
 }
-- 
2.25.1

