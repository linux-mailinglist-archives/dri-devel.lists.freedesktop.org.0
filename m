Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC101EF9BD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA486E8F0;
	Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386A86E8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3DE35ACF0;
 Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 06/14] drm/mgag200: Merge VRAM setup into MM initialization
Date: Fri,  5 Jun 2020 15:57:55 +0200
Message-Id: <20200605135803.19811-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VRAM setup in mgag200_drv.c is part of memory management and
should be done in the same place. Merge the code into the memory
management's init function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_main.c | 75 --------------------------
 drivers/gpu/drm/mgag200/mgag200_mm.c   | 52 ++++++++++++++++++
 2 files changed, 52 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 3298eff7bd1b4..e9ad783c2b44d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -12,77 +12,6 @@
 
 #include "mgag200_drv.h"
 
-static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
-{
-	int offset;
-	int orig;
-	int test1, test2;
-	int orig1, orig2;
-	unsigned int vram_size;
-
-	/* Probe */
-	orig = ioread16(mem);
-	iowrite16(0, mem);
-
-	vram_size = mdev->mc.vram_window;
-
-	if ((mdev->type == G200_EW3) && (vram_size >= 0x1000000)) {
-		vram_size = vram_size - 0x400000;
-	}
-
-	for (offset = 0x100000; offset < vram_size; offset += 0x4000) {
-		orig1 = ioread8(mem + offset);
-		orig2 = ioread8(mem + offset + 0x100);
-
-		iowrite16(0xaa55, mem + offset);
-		iowrite16(0xaa55, mem + offset + 0x100);
-
-		test1 = ioread16(mem + offset);
-		test2 = ioread16(mem);
-
-		iowrite16(orig1, mem + offset);
-		iowrite16(orig2, mem + offset + 0x100);
-
-		if (test1 != 0xaa55) {
-			break;
-		}
-
-		if (test2) {
-			break;
-		}
-	}
-
-	iowrite16(orig, mem);
-	return offset - 65536;
-}
-
-/* Map the framebuffer from the card and configure the core */
-static int mga_vram_init(struct mga_device *mdev)
-{
-	struct drm_device *dev = mdev->dev;
-	void __iomem *mem;
-
-	/* BAR 0 is VRAM */
-	mdev->mc.vram_base = pci_resource_start(dev->pdev, 0);
-	mdev->mc.vram_window = pci_resource_len(dev->pdev, 0);
-
-	if (!devm_request_mem_region(dev->dev, mdev->mc.vram_base,
-				     mdev->mc.vram_window, "mgadrmfb_vram")) {
-		DRM_ERROR("can't reserve VRAM\n");
-		return -ENXIO;
-	}
-
-	mem = pci_iomap(dev->pdev, 0, 0);
-	if (!mem)
-		return -ENOMEM;
-
-	mdev->mc.vram_size = mga_probe_vram(mdev, mem);
-
-	pci_iounmap(dev->pdev, mem);
-
-	return 0;
-}
-
 int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 {
 	struct mga_device *mdev;
@@ -121,10 +50,6 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 			mdev->unique_rev_id);
 	}
 
-	ret = mga_vram_init(mdev);
-	if (ret)
-		return ret;
-
 	ret = mgag200_mm_init(mdev);
 	if (ret)
 		goto err_mm;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index 73e30901e0631..f56b0456994f4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -30,6 +30,49 @@
 
 #include "mgag200_drv.h"
 
+static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
+				 size_t size)
+{
+	int offset;
+	int orig;
+	int test1, test2;
+	int orig1, orig2;
+	size_t vram_size;
+
+	/* Probe */
+	orig = ioread16(mem);
+	iowrite16(0, mem);
+
+	vram_size = size;
+
+	if ((mdev->type == G200_EW3) && (vram_size >= 0x1000000))
+		vram_size = vram_size - 0x400000;
+
+	for (offset = 0x100000; offset < vram_size; offset += 0x4000) {
+		orig1 = ioread8(mem + offset);
+		orig2 = ioread8(mem + offset + 0x100);
+
+		iowrite16(0xaa55, mem + offset);
+		iowrite16(0xaa55, mem + offset + 0x100);
+
+		test1 = ioread16(mem + offset);
+		test2 = ioread16(mem);
+
+		iowrite16(orig1, mem + offset);
+		iowrite16(orig2, mem + offset + 0x100);
+
+		if (test1 != 0xaa55)
+			break;
+
+		if (test2)
+			break;
+	}
+
+	iowrite16(orig, mem);
+
+	return offset - 65536;
+}
+
 int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
@@ -40,6 +83,11 @@ int mgag200_mm_init(struct mga_device *mdev)
 	start = pci_resource_start(dev->pdev, 0);
 	len = pci_resource_len(dev->pdev, 0);
 
+	if (!devm_request_mem_region(dev->dev, start, len, "mgadrmfb_vram")) {
+		drm_err(dev, "can't reserve VRAM\n");
+		return -ENXIO;
+	}
+
 	arch_io_reserve_memtype_wc(start, len);
 
 	mdev->fb_mtrr = arch_phys_wc_add(start, len);
@@ -50,6 +98,10 @@ int mgag200_mm_init(struct mga_device *mdev)
 		goto err_arch_phys_wc_del;
 	}
 
+	mdev->mc.vram_size = mgag200_probe_vram(mdev, mdev->vram, len);
+	mdev->mc.vram_base = start;
+	mdev->mc.vram_window = len;
+
 	mdev->vram_fb_available = mdev->mc.vram_size;
 
 	return 0;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
