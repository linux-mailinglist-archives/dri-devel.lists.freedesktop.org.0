Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8A68A6C7
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 00:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6193410E943;
	Fri,  3 Feb 2023 23:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5610E943
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 23:09:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96C1BB82C28;
 Fri,  3 Feb 2023 23:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E526BC433D2;
 Fri,  3 Feb 2023 23:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675465759;
 bh=hwrK02Owe9b36bQzcgSLsgQliNp1lRExnRCrwnLt5RU=;
 h=From:To:Cc:Subject:Date:From;
 b=rPAVExKSicKDk1QfG5LlaeY/ZLkHDS83jnKIAuoVKMaLwYteh4Q+Bw/Yn1Oq34ZL8
 SS6z9Ce/q4a6ukTUxGYYCbKDoxeHtlF18e3l0o3tiHlum2jzUWoY2BMy1gSTiUilVv
 WHDZQH+Qwk7zSPzu/RrvXV1grlzxOWvNgwXbszlV5Lwui4/qRHedPJDc1yS9FOYFxg
 WWvC11mywmv+og1Ak1lNGSV/CIqWQUkGPQtVANmYQmDYEj8pnAgnyZKV2D8/G9Nif3
 emt7ANF/5yO6yUq6UemuKcnsTvu/EduGDZbi96Jp6BEwylvp3QvEy77oBLtn/M1xat
 LCW9OJ5soJtmQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] Revert "fbdev: Remove conflicting devices on PCI bus"
Date: Fri,  3 Feb 2023 17:09:09 -0600
Message-Id: <20230203230909.2058637-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Zeno Davatz <zdavatz@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

This reverts commit 145eed48de278007f646b908fd70ac59d24ed81a.

Zeno Davatz reported that 145eed48de27 ("fbdev: Remove conflicting devices
on PCI bus") caused a console hang.  The machine was actually still usable
via ssh, etc., but there was no activity on the console.

Reverting 145eed48de27 for the nvidiafb on that system fixed the problem.

Revert 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus") since
we don't know what caused the problem.

Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859
Reported-by: Zeno Davatz <zdavatz@gmail.com>
Tested-by: Zeno Davatz <zdavatz@gmail.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/video/fbdev/arkfb.c                  | 5 -----
 drivers/video/fbdev/asiliantfb.c             | 5 -----
 drivers/video/fbdev/aty/aty128fb.c           | 5 -----
 drivers/video/fbdev/aty/atyfb_base.c         | 7 +------
 drivers/video/fbdev/carminefb.c              | 5 -----
 drivers/video/fbdev/chipsfb.c                | 7 +------
 drivers/video/fbdev/cirrusfb.c               | 5 -----
 drivers/video/fbdev/cyber2000fb.c            | 5 -----
 drivers/video/fbdev/geode/gx1fb_core.c       | 5 -----
 drivers/video/fbdev/geode/gxfb_core.c        | 5 -----
 drivers/video/fbdev/geode/lxfb_core.c        | 5 -----
 drivers/video/fbdev/gxt4500.c                | 5 -----
 drivers/video/fbdev/i740fb.c                 | 5 -----
 drivers/video/fbdev/i810/i810_main.c         | 5 -----
 drivers/video/fbdev/imsttfb.c                | 8 +-------
 drivers/video/fbdev/intelfb/intelfbdrv.c     | 5 -----
 drivers/video/fbdev/kyro/fbdev.c             | 5 -----
 drivers/video/fbdev/matrox/matroxfb_base.c   | 5 -----
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   | 5 -----
 drivers/video/fbdev/neofb.c                  | 5 -----
 drivers/video/fbdev/nvidia/nvidia.c          | 7 +------
 drivers/video/fbdev/pm2fb.c                  | 5 -----
 drivers/video/fbdev/pm3fb.c                  | 5 -----
 drivers/video/fbdev/pvr2fb.c                 | 5 -----
 drivers/video/fbdev/riva/fbdev.c             | 5 -----
 drivers/video/fbdev/s3fb.c                   | 5 -----
 drivers/video/fbdev/savage/savagefb_driver.c | 5 -----
 drivers/video/fbdev/sis/sis_main.c           | 5 -----
 drivers/video/fbdev/skeletonfb.c             | 8 --------
 drivers/video/fbdev/sm712fb.c                | 5 -----
 drivers/video/fbdev/sstfb.c                  | 5 -----
 drivers/video/fbdev/sunxvr2500.c             | 5 -----
 drivers/video/fbdev/sunxvr500.c              | 5 -----
 drivers/video/fbdev/tdfxfb.c                 | 5 -----
 drivers/video/fbdev/tgafb.c                  | 7 -------
 drivers/video/fbdev/tridentfb.c              | 5 -----
 drivers/video/fbdev/vermilion/vermilion.c    | 7 +------
 drivers/video/fbdev/via/via-core.c           | 5 -----
 drivers/video/fbdev/vt8623fb.c               | 5 -----
 39 files changed, 5 insertions(+), 206 deletions(-)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 60a96fdb5dd8..41b9117c55bb 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -11,7 +11,6 @@
  *  Code is based on s3fb
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -949,10 +948,6 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	int rc;
 	u8 regval;
 
-	rc = aperture_remove_conflicting_pci_devices(dev, "arkfb");
-	if (rc < 0)
-		return rc;
-
 	/* Ignore secondary VGA device because there is no VGA arbitration */
 	if (! svga_primary_device(dev)) {
 		dev_info(&(dev->dev), "ignoring secondary device\n");
diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index 8383468f5577..4a98383eb274 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -29,7 +29,6 @@
  *  more details.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -546,10 +545,6 @@ static int asiliantfb_pci_init(struct pci_dev *dp,
 	struct fb_info *p;
 	int err;
 
-	err = aperture_remove_conflicting_pci_devices(dp, "asiliantfb");
-	if (err)
-		return err;
-
 	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0)
 		return -ENODEV;
 	addr = pci_resource_start(dp, 0);
diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index dd31b9d7d337..a5cb33feaf4a 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -47,7 +47,6 @@
  */
 
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -2056,10 +2055,6 @@ static int aty128_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	void __iomem *bios = NULL;
 #endif
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "aty128fb");
-	if (err)
-		return err;
-
 	/* Enable device in PCI config */
 	if ((err = pci_enable_device(pdev))) {
 		printk(KERN_ERR "aty128fb: Cannot enable PCI device: %d\n",
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 0ccf5d401ecb..a7cfcef11f41 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -48,7 +48,6 @@
 
 ******************************************************************************/
 
-#include <linux/aperture.h>
 #include <linux/compat.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -3534,11 +3533,7 @@ static int atyfb_pci_probe(struct pci_dev *pdev,
 	struct fb_info *info;
 	struct resource *rp;
 	struct atyfb_par *par;
-	int rc;
-
-	rc = aperture_remove_conflicting_pci_devices(pdev, "atyfb");
-	if (rc)
-		return rc;
+	int rc = -ENOMEM;
 
 	/* Enable device in PCI config */
 	if (pci_enable_device(pdev)) {
diff --git a/drivers/video/fbdev/carminefb.c b/drivers/video/fbdev/carminefb.c
index 4ae21dbdb8ca..3dc4fc19836f 100644
--- a/drivers/video/fbdev/carminefb.c
+++ b/drivers/video/fbdev/carminefb.c
@@ -7,7 +7,6 @@
  * - FB1 is display 1 with unique memory area
  * - both display use 32 bit colors
  */
-#include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
@@ -615,10 +614,6 @@ static int carminefb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	struct fb_info *info;
 	int ret;
 
-	ret = aperture_remove_conflicting_pci_devices(dev, "carminefb");
-	if (ret)
-		return ret;
-
 	ret = pci_enable_device(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index cc37ec3f8fc1..8aec3b235f1c 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -14,7 +14,6 @@
  *  more details.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -352,11 +351,7 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
 	struct fb_info *p;
 	unsigned long addr;
 	unsigned short cmd;
-	int rc;
-
-	rc = aperture_remove_conflicting_pci_devices(dp, "chipsfb");
-	if (rc)
-		return rc;
+	int rc = -ENODEV;
 
 	if (pci_enable_device(dp) < 0) {
 		dev_err(&dp->dev, "Cannot enable PCI device\n");
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index ba45e2147c52..0411c5a880e7 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -34,7 +34,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2086,10 +2085,6 @@ static int cirrusfb_pci_register(struct pci_dev *pdev,
 	unsigned long board_addr, board_size;
 	int ret;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "cirrusfb");
-	if (ret)
-		return ret;
-
 	ret = pci_enable_device(pdev);
 	if (ret < 0) {
 		printk(KERN_ERR "cirrusfb: Cannot enable PCI device\n");
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 38c0a6866d76..8345b2afdcc2 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -33,7 +33,6 @@
  * (which, incidentally, is about the same saving as a 2.5in hard disk
  * entering standby mode.)
  */
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1720,10 +1719,6 @@ static int cyberpro_pci_probe(struct pci_dev *dev,
 
 	sprintf(name, "CyberPro%4X", id->device);
 
-	err = aperture_remove_conflicting_pci_devices(dev, name);
-	if (err)
-		return err;
-
 	err = pci_enable_device(dev);
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 9c942001ac10..fee0f0920fde 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -6,7 +6,6 @@
  * Copyright (C) 2005 Arcom Control Systems Ltd.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -321,10 +320,6 @@ static int gx1fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_info *info;
 	int ret;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "gx1fb");
-	if (ret)
-		return ret;
-
 	info = gx1fb_init_fbinfo(&pdev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 8e05e76de075..8f17cb55810c 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -15,7 +15,6 @@
  *
  * 16 MiB of framebuffer memory is assumed to be available.
  */
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -365,10 +364,6 @@ static int gxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_videomode *modedb_ptr;
 	unsigned int modedb_size;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "gxfb");
-	if (ret)
-		return ret;
-
 	info = gxfb_init_fbinfo(&pdev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 8130e9eee2b4..3b2d192e4d5e 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -6,7 +6,6 @@
  * Built from gxfb (which is Copyright (C) 2006 Arcom Control Systems Ltd.)
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -485,10 +484,6 @@ static int lxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_videomode *modedb_ptr;
 	unsigned int modedb_size;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "lxfb");
-	if (ret)
-		return ret;
-
 	info = lxfb_init_fbinfo(&pdev->dev);
 
 	if (info == NULL)
diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index 5f42d3d9d6ce..99852ad1e72b 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -6,7 +6,6 @@
  * Copyright (C) 2006 Paul Mackerras, IBM Corp. <paulus@samba.org>
  */
 
-#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/fb.h>
@@ -622,10 +621,6 @@ static int gxt4500_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct fb_var_screeninfo var;
 	enum gxt_cards cardtype;
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "gxt4500fb");
-	if (err)
-		return err;
-
 	err = pci_enable_device(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "gxt4500: cannot enable PCI device: %d\n",
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 3860b137b86a..03239c1217d6 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -12,7 +12,6 @@
  *  i740fb by Patrick LERDA, v0.9
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1014,10 +1013,6 @@ static int i740fb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	bool found = false;
 	u8 *edid;
 
-	ret = aperture_remove_conflicting_pci_devices(dev, "i740fb");
-	if (ret)
-		return ret;
-
 	info = framebuffer_alloc(sizeof(struct i740fb_par), &(dev->dev));
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 85abb65f07d7..3c6cd4779a14 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -28,7 +28,6 @@
  *  more details.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2017,10 +2016,6 @@ static int i810fb_init_pci(struct pci_dev *dev,
 	struct fb_videomode mode;
 	int err = -1, vfreq, hfreq, pixclock;
 
-	err = aperture_remove_conflicting_pci_devices(dev, "i810fb");
-	if (err)
-		return err;
-
 	info = framebuffer_alloc(sizeof(struct i810fb_par), &dev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index bea45647184e..2779a6547f20 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -16,7 +16,6 @@
  *  more details.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1470,12 +1469,7 @@ static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct imstt_par *par;
 	struct fb_info *info;
 	struct device_node *dp;
-	int ret;
-
-	ret = aperture_remove_conflicting_pci_devices(pdev, "imsttfb");
-	if (ret)
-		return ret;
-	ret = -ENOMEM;
+	int ret = -ENOMEM;
 
 	dp = pci_device_to_OF_node(pdev);
 	if(dp)
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 0a9e5067b201..c3b9fc790a0b 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -107,7 +107,6 @@
  *              Add support for 945GME. (Phil Endecott <spam_from_intelfb@chezphil.org>)
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -487,10 +486,6 @@ static int intelfb_pci_register(struct pci_dev *pdev,
 
 	DBG_MSG("intelfb_pci_register\n");
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "intelfb");
-	if (err)
-		return err;
-
 	num_registered++;
 	if (num_registered != 1) {
 		ERR_MSG("Attempted to register %d devices "
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 0596573ef140..9ffef894241f 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -9,7 +9,6 @@
  * for more details.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -677,10 +676,6 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	unsigned long size;
 	int err;
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "kyrofb");
-	if (err)
-		return err;
-
 	if ((err = pci_enable_device(pdev))) {
 		printk(KERN_WARNING "kyrofb: Can't enable pdev: %d\n", err);
 		return err;
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 0d3cee7ae726..f9fd587e0e98 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -100,7 +100,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/version.h>
 
 #include "matroxfb_base.h"
@@ -2045,10 +2044,6 @@ static int matroxfb_probe(struct pci_dev* pdev, const struct pci_device_id* dumm
 	u_int32_t cmd;
 	DBG(__func__)
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "matroxfb");
-	if (err)
-		return err;
-
 	svid = pdev->subsystem_vendor;
 	sid = pdev->subsystem_device;
 	for (b = dev_list; b->vendor; b++) {
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index a236fc910148..d26c9f2f882d 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -10,7 +10,6 @@
 
 #undef DEBUG
 
-#include <linux/aperture.h>
 #include <linux/fb.h>
 #include <linux/delay.h>
 #include <linux/uaccess.h>
@@ -1000,10 +999,6 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "mb862xxfb");
-	if (ret)
-		return ret;
-
 	ret = pci_enable_device(pdev);
 	if (ret < 0) {
 		dev_err(dev, "Cannot enable PCI device\n");
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 39d8cdef5c97..51cffd280e4c 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -54,7 +54,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2030,10 +2029,6 @@ static int neofb_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	DBG("neofb_probe");
 
-	err = aperture_remove_conflicting_pci_devices(dev, "neofb");
-	if (err)
-		return err;
-
 	err = pci_enable_device(dev);
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 1960916098d4..09cd57e82bdf 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -9,7 +9,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1277,15 +1276,11 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	struct nvidia_par *par;
 	struct fb_info *info;
 	unsigned short cmd;
-	int ret;
+
 
 	NVTRACE_ENTER();
 	assert(pd != NULL);
 
-	ret = aperture_remove_conflicting_pci_devices(pd, "nvidiafb");
-	if (ret)
-		return ret;
-
 	info = framebuffer_alloc(sizeof(struct nvidia_par), &pd->dev);
 
 	if (!info)
diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 47d212944f30..f3b2c375eeb5 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -27,7 +27,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1522,10 +1521,6 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	int err;
 	int retval = -ENXIO;
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "pm2fb");
-	if (err)
-		return err;
-
 	err = pci_enable_device(pdev);
 	if (err) {
 		printk(KERN_WARNING "pm2fb: Can't enable pdev: %d\n", err);
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index b46a471df9ae..6ce139490308 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -22,7 +22,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1316,10 +1315,6 @@ static int pm3fb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	int err;
 	int retval = -ENXIO;
 
-	err = aperture_remove_conflicting_pci_devices(dev, "pm3fb");
-	if (err)
-		return err;
-
 	err = pci_enable_device(dev);
 	if (err) {
 		printk(KERN_WARNING "pm3fb: Can't enable PCI dev: %d\n", err);
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 6888127a5eb8..49eeecee4704 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -45,7 +45,6 @@
 
 #undef DEBUG
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -943,10 +942,6 @@ static int pvr2fb_pci_probe(struct pci_dev *pdev,
 {
 	int ret;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "pvrfb");
-	if (ret)
-		return ret;
-
 	ret = pci_enable_device(pdev);
 	if (ret) {
 		printk(KERN_ERR "pvr2fb: PCI enable failed\n");
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 644278146d3b..78e4e334e462 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -29,7 +29,6 @@
  *	doublescan modes are broken
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1899,10 +1898,6 @@ static int rivafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	NVTRACE_ENTER();
 	assert(pd != NULL);
 
-	ret = aperture_remove_conflicting_pci_devices(pd, "rivafb");
-	if (ret)
-		return ret;
-
 	info = framebuffer_alloc(sizeof(struct riva_par), &pd->dev);
 	if (!info) {
 		ret = -ENOMEM;
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 7d257489edcc..c8dfd879d2ea 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -11,7 +11,6 @@
  * which is based on the code of neofb.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1132,10 +1131,6 @@ static int s3_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
-	rc = aperture_remove_conflicting_pci_devices(dev, "s3fb");
-	if (rc)
-		return rc;
-
 	/* Allocate and fill driver data structure */
 	info = framebuffer_alloc(sizeof(struct s3fb_info), &(dev->dev));
 	if (!info)
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 4a27b68798bf..0a0b3f3178df 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -41,7 +41,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2177,10 +2176,6 @@ static int savagefb_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	DBG("savagefb_probe");
 
-	err = aperture_remove_conflicting_pci_devices(dev, "savagefb");
-	if (err)
-		return err;
-
 	info = framebuffer_alloc(sizeof(struct savagefb_par), &dev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index cfba776afcea..859fa637628d 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -19,7 +19,6 @@
  * which is (c) 1998 Gerd Knorr <kraxel@goldbach.in-berlin.de>
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -5862,10 +5861,6 @@ static int sisfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if(sisfb_off)
 		return -ENXIO;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "sisfb");
-	if (ret)
-		return ret;
-
 	sis_fb_info = framebuffer_alloc(sizeof(*ivideo), &pdev->dev);
 	if(!sis_fb_info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 40c130ab6b38..aaa4f1cd3be1 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -42,7 +42,6 @@
  *  more details.
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -667,13 +666,6 @@ static int xxxfb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
     struct device *device = &dev->dev; /* or &pdev->dev */
     int cmap_len, retval;
 
-    /*
-     * Remove firmware-based drivers that create resource conflicts.
-     */
-    retval = aperture_remove_conflicting_pci_devices(pdev, "xxxfb");
-    if (retval)
-	    return retval;
-
     /*
      * Dynamically allocate info and par
      */
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index b528776c7612..27cca9cc5e17 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -18,7 +18,6 @@
  * Framebuffer driver for Silicon Motion SM710, SM712, SM721 and SM722 chips
  */
 
-#include <linux/aperture.h>
 #include <linux/io.h>
 #include <linux/fb.h>
 #include <linux/pci.h>
@@ -1503,10 +1502,6 @@ static int smtcfb_pci_probe(struct pci_dev *pdev,
 
 	dev_info(&pdev->dev, "Silicon Motion display driver.\n");
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "smtcfb");
-	if (err)
-		return err;
-
 	err = pci_enable_device(pdev);	/* enable SMTC chip */
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index da296b2ab54a..60e7fa3b5ceb 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -80,7 +80,6 @@
  * Includes
  */
 
-#include <linux/aperture.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -1327,10 +1326,6 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct sst_spec *spec;
 	int err;
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "sstfb");
-	if (err)
-		return err;
-
 	/* Enable device in PCI config. */
 	if ((err=pci_enable_device(pdev))) {
 		printk(KERN_ERR "cannot enable device\n");
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index 2cab4b9be68a..11ad048f5ccb 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2007 David S. Miller (davem@davemloft.net)
  */
 
-#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/fb.h>
 #include <linux/pci.h>
@@ -124,10 +123,6 @@ static int s3d_pci_register(struct pci_dev *pdev,
 	struct s3d_info *sp;
 	int err;
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "s3dfb");
-	if (err)
-		return err;
-
 	err = pci_enable_device(pdev);
 	if (err < 0) {
 		printk(KERN_ERR "s3d: Cannot enable PCI device %s\n",
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index 6ec358af1256..900f69623b0c 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2007 David S. Miller (davem@davemloft.net)
  */
 
-#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/fb.h>
 #include <linux/pci.h>
@@ -250,10 +249,6 @@ static int e3d_pci_register(struct pci_dev *pdev,
 	unsigned int line_length;
 	int err;
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "e3dfb");
-	if (err)
-		return err;
-
 	of_node = pci_device_to_OF_node(pdev);
 	if (!of_node) {
 		printk(KERN_ERR "e3d: Cannot find OF node of %s\n",
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index d17e5e1472aa..d5530458cecd 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -64,7 +64,6 @@
  *
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1377,10 +1376,6 @@ static int tdfxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_monspecs *specs;
 	bool found;
 
-	err = aperture_remove_conflicting_pci_devices(pdev, "tdfxfb");
-	if (err)
-		return err;
-
 	err = pci_enable_device(pdev);
 	if (err) {
 		printk(KERN_ERR "tdfxfb: Can't enable pdev: %d\n", err);
diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 14d37c49633c..31441333d4bf 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -12,7 +12,6 @@
  *  more details.
  */
 
-#include <linux/aperture.h>
 #include <linux/bitrev.h>
 #include <linux/compiler.h>
 #include <linux/delay.h>
@@ -107,12 +106,6 @@ static struct pci_driver tgafb_pci_driver = {
 static int tgafb_pci_register(struct pci_dev *pdev,
 			      const struct pci_device_id *ent)
 {
-	int ret;
-
-	ret = aperture_remove_conflicting_pci_devices(pdev, "tgafb");
-	if (ret)
-		return ret;
-
 	return tgafb_register(&pdev->dev);
 }
 
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 6099b9768ba1..ee649751f5d8 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -16,7 +16,6 @@
  *	timing value tweaking so it looks good on every monitor in every mode
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/init.h>
@@ -1466,10 +1465,6 @@ static int trident_pci_probe(struct pci_dev *dev,
 	int chip_id;
 	bool found = false;
 
-	err = aperture_remove_conflicting_pci_devices(dev, "tridentfb");
-	if (err)
-		return err;
-
 	err = pcim_enable_device(dev);
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/vermilion/vermilion.c b/drivers/video/fbdev/vermilion/vermilion.c
index 0374ee6b6d03..ea4cf0395603 100644
--- a/drivers/video/fbdev/vermilion/vermilion.c
+++ b/drivers/video/fbdev/vermilion/vermilion.c
@@ -14,7 +14,6 @@
  *   Alan Hourihane <alanh-at-tungstengraphics-dot-com>
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -445,11 +444,7 @@ static int vml_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct vml_info *vinfo;
 	struct fb_info *info;
 	struct vml_par *par;
-	int err;
-
-	err = aperture_remove_conflicting_pci_devices(dev, "vmlfb");
-	if (err)
-		return err;
+	int err = 0;
 
 	par = kzalloc(sizeof(*par), GFP_KERNEL);
 	if (par == NULL)
diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 2c1803eb196f..43f443f93828 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -8,7 +8,6 @@
 /*
  * Core code for the Via multifunction framebuffer device.
  */
-#include <linux/aperture.h>
 #include <linux/via-core.h>
 #include <linux/via_i2c.h>
 #include <linux/via-gpio.h>
@@ -618,10 +617,6 @@ static int via_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	int ret;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, "viafb");
-	if (ret)
-		return ret;
-
 	ret = pci_enable_device(pdev);
 	if (ret)
 		return ret;
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 034333ee6e45..4b45836fdd8e 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -12,7 +12,6 @@
  * (http://davesdomain.org.uk/viafb/)
  */
 
-#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -673,10 +672,6 @@ static int vt8623_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
-	rc = aperture_remove_conflicting_pci_devices(dev, "vt8623fb");
-	if (rc)
-		return rc;
-
 	/* Allocate and fill driver data structure */
 	info = framebuffer_alloc(sizeof(struct vt8623fb_info), &(dev->dev));
 	if (!info)
-- 
2.25.1

