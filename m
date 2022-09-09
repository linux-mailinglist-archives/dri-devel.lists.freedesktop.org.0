Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539F5B3AEF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A6310EDE9;
	Fri,  9 Sep 2022 14:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E3F810EDE9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 14:44:06 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id A06C0204A5BC;
 Fri,  9 Sep 2022 07:44:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A06C0204A5BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1662734645;
 bh=+jd4U7/A0qtxB/62Y20V/gk1Y4XdI3jkHh2RaPiXZ/I=;
 h=From:To:Subject:Date:From;
 b=eGTMRMp8N6BQf1LZnHUksGbEsFeDg2LsXJlo2WWvaGu0g6eym7kXlAd3Nqs+Si5co
 JK4nZmY4L9WvZAVGFMaVHUfvRU2TYVnjYMhre2OLj8GcgfWC14dO2TbD4FJJn+zo1B
 DaKBbAZqGbYZYmLirrHUdVQ0Kmkd/BzmwHVXU3cM=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: ssengar@microsoft.com, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mikelley@microsoft.com
Subject: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1 VMs
Date: Fri,  9 Sep 2022 07:43:59 -0700
Message-Id: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
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

hyperv_setup_vram tries to remove conflicting framebuffer based on
'screen_info'. As observed in past due to some bug or wrong setting
in grub, the 'screen_info' fields may not be set for Gen1, and in such
cases drm_aperture_remove_conflicting_framebuffers will not do anything
useful.
For Gen1 VMs, it should always be possible to get framebuffer
conflict removed using PCI device instead.

Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM allocation with PCI bar size")
Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 6d11e7938c83..b0cc974efa45 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -73,12 +73,28 @@ static int hyperv_setup_vram(struct hyperv_drm_device *hv,
 			     struct hv_device *hdev)
 {
 	struct drm_device *dev = &hv->dev;
+	struct pci_dev *pdev;
 	int ret;
 
-	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
-						     screen_info.lfb_size,
-						     false,
-						     &hyperv_driver);
+	if (efi_enabled(EFI_BOOT)) {
+		drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
+							     screen_info.lfb_size,
+							     false,
+							     &hyperv_driver);
+	} else {
+		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
+		if (!pdev) {
+			drm_err(dev, "Unable to find PCI Hyper-V video\n");
+			return -ENODEV;
+		}
+
+		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv_driver);
+		pci_dev_put(pdev);
+		if (ret) {
+			drm_err(dev, "Not able to remove boot fb\n");
+			return ret;
+		}
+	}
 
 	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
 
-- 
2.34.1

