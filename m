Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C4577C79
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 09:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525A6AB7BD;
	Mon, 18 Jul 2022 07:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1119AB7B7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8657D20BC6;
 Mon, 18 Jul 2022 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658129005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqPRcWb93TgRUTAT40BoFHPQ6+SAWXka+EwiVIQjsIQ=;
 b=JEAHaZNWDxzAbDJreKCPGRIOsEmqB4pxkeux8fbgQpGcrOXu5MMadf6QXIF8vFDkMiUp9w
 GTGdjyql0T+63fRrve1510v0sm3e8yBeJRirrlbbewZeWhTEpy5bZ3blnjn83VOpCTuVxs
 wjI6I/zoqwdG8u3+tGjaaHHw0GB9qZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658129005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqPRcWb93TgRUTAT40BoFHPQ6+SAWXka+EwiVIQjsIQ=;
 b=5ElFU3kSTfuy/FYrnBRiyCppnIv930Ll7Ayq2IibnwG8mopyzki58+DG2HSbMFgkS0J/V1
 Cm14ePQ13w6ZMnDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A20813A37;
 Mon, 18 Jul 2022 07:23:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kHU+EW0K1WKjcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 07:23:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH v2 06/11] fbdev: Remove conflicting devices on PCI bus
Date: Mon, 18 Jul 2022 09:23:17 +0200
Message-Id: <20220718072322.8927-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718072322.8927-1-tzimmermann@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove firmware devices on the PCI bus, by calling
aperture_remove_conflicting_pci_devices() in the probe function of
each related fbdev driver. iSo far, most of these drivers did not
remove conflicting VESA or EFI devices, or outride failed for
resource conflicts (i.e., matroxfb.) This must have been broken
for quite some time.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/arkfb.c                  | 5 +++++
 drivers/video/fbdev/asiliantfb.c             | 5 +++++
 drivers/video/fbdev/aty/aty128fb.c           | 5 +++++
 drivers/video/fbdev/aty/atyfb_base.c         | 7 ++++++-
 drivers/video/fbdev/carminefb.c              | 5 +++++
 drivers/video/fbdev/chipsfb.c                | 7 ++++++-
 drivers/video/fbdev/cirrusfb.c               | 5 +++++
 drivers/video/fbdev/cyber2000fb.c            | 5 +++++
 drivers/video/fbdev/geode/gx1fb_core.c       | 5 +++++
 drivers/video/fbdev/geode/gxfb_core.c        | 5 +++++
 drivers/video/fbdev/geode/lxfb_core.c        | 5 +++++
 drivers/video/fbdev/gxt4500.c                | 5 +++++
 drivers/video/fbdev/i740fb.c                 | 5 +++++
 drivers/video/fbdev/i810/i810_main.c         | 5 +++++
 drivers/video/fbdev/imsttfb.c                | 8 +++++++-
 drivers/video/fbdev/intelfb/intelfbdrv.c     | 5 +++++
 drivers/video/fbdev/kyro/fbdev.c             | 5 +++++
 drivers/video/fbdev/matrox/matroxfb_base.c   | 5 +++++
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   | 5 +++++
 drivers/video/fbdev/neofb.c                  | 5 +++++
 drivers/video/fbdev/nvidia/nvidia.c          | 7 ++++++-
 drivers/video/fbdev/pm2fb.c                  | 5 +++++
 drivers/video/fbdev/pm3fb.c                  | 5 +++++
 drivers/video/fbdev/pvr2fb.c                 | 5 +++++
 drivers/video/fbdev/riva/fbdev.c             | 5 +++++
 drivers/video/fbdev/s3fb.c                   | 5 +++++
 drivers/video/fbdev/savage/savagefb_driver.c | 5 +++++
 drivers/video/fbdev/sis/sis_main.c           | 5 +++++
 drivers/video/fbdev/skeletonfb.c             | 8 ++++++++
 drivers/video/fbdev/sm712fb.c                | 5 +++++
 drivers/video/fbdev/sstfb.c                  | 5 +++++
 drivers/video/fbdev/sunxvr2500.c             | 5 +++++
 drivers/video/fbdev/sunxvr500.c              | 5 +++++
 drivers/video/fbdev/tdfxfb.c                 | 5 +++++
 drivers/video/fbdev/tgafb.c                  | 7 +++++++
 drivers/video/fbdev/tridentfb.c              | 5 +++++
 drivers/video/fbdev/vermilion/vermilion.c    | 7 ++++++-
 drivers/video/fbdev/via/via-core.c           | 5 +++++
 drivers/video/fbdev/vt8623fb.c               | 5 +++++
 39 files changed, 206 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index eb3e47c58c5f..453daa072f53 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -11,6 +11,7 @@
  *  Code is based on s3fb
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -949,6 +950,10 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	int rc;
 	u8 regval;
 
+	rc = aperture_remove_conflicting_pci_devices(dev, "arkfb");
+	if (rc < 0)
+		return rc;
+
 	/* Ignore secondary VGA device because there is no VGA arbitration */
 	if (! svga_primary_device(dev)) {
 		dev_info(&(dev->dev), "ignoring secondary device\n");
diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index f8ef62542f7f..3818437a8f69 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -29,6 +29,7 @@
  *  more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -545,6 +546,10 @@ static int asiliantfb_pci_init(struct pci_dev *dp,
 	struct fb_info *p;
 	int err;
 
+	err = aperture_remove_conflicting_pci_devices(dp, "asiliantfb");
+	if (err)
+		return err;
+
 	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0)
 		return -ENODEV;
 	addr = pci_resource_start(dp, 0);
diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 5cdbbba2a013..57e398fe7a81 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -47,6 +47,7 @@
  */
 
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -2055,6 +2056,10 @@ static int aty128_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	void __iomem *bios = NULL;
 #endif
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "aty128fb");
+	if (err)
+		return err;
+
 	/* Enable device in PCI config */
 	if ((err = pci_enable_device(pdev))) {
 		printk(KERN_ERR "aty128fb: Cannot enable PCI device: %d\n",
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index a3e6faed7745..4804b6e9f3f4 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -48,6 +48,7 @@
 
 ******************************************************************************/
 
+#include <linux/aperture.h>
 #include <linux/compat.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -3533,7 +3534,11 @@ static int atyfb_pci_probe(struct pci_dev *pdev,
 	struct fb_info *info;
 	struct resource *rp;
 	struct atyfb_par *par;
-	int rc = -ENOMEM;
+	int rc;
+
+	rc = aperture_remove_conflicting_pci_devices(pdev, "atyfb");
+	if (rc)
+		return rc;
 
 	/* Enable device in PCI config */
 	if (pci_enable_device(pdev)) {
diff --git a/drivers/video/fbdev/carminefb.c b/drivers/video/fbdev/carminefb.c
index 3a1c2e0739a1..4651b48a87f9 100644
--- a/drivers/video/fbdev/carminefb.c
+++ b/drivers/video/fbdev/carminefb.c
@@ -7,6 +7,7 @@
  * - FB1 is display 1 with unique memory area
  * - both display use 32 bit colors
  */
+#include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
@@ -614,6 +615,10 @@ static int carminefb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	struct fb_info *info;
 	int ret;
 
+	ret = aperture_remove_conflicting_pci_devices(dev, "carminefb");
+	if (ret)
+		return ret;
+
 	ret = pci_enable_device(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index 618fb6dbbedb..5ad64714d39e 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -14,6 +14,7 @@
  *  more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -351,7 +352,11 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
 	struct fb_info *p;
 	unsigned long addr;
 	unsigned short cmd;
-	int rc = -ENODEV;
+	int rc;
+
+	rc = aperture_remove_conflicting_pci_devices(dp, "chipsfb");
+	if (rc)
+		return rc;
 
 	if (pci_enable_device(dp) < 0) {
 		dev_err(&dp->dev, "Cannot enable PCI device\n");
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 51e072c03e1c..4ff6f624f912 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -34,6 +34,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2085,6 +2086,10 @@ static int cirrusfb_pci_register(struct pci_dev *pdev,
 	unsigned long board_addr, board_size;
 	int ret;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "cirrusfb");
+	if (ret)
+		return ret;
+
 	ret = pci_enable_device(pdev);
 	if (ret < 0) {
 		printk(KERN_ERR "cirrusfb: Cannot enable PCI device\n");
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index d45355b9a58c..be7bcf95c96a 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -33,6 +33,7 @@
  * (which, incidentally, is about the same saving as a 2.5in hard disk
  * entering standby mode.)
  */
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1720,6 +1721,10 @@ static int cyberpro_pci_probe(struct pci_dev *dev,
 
 	sprintf(name, "CyberPro%4X", id->device);
 
+	err = aperture_remove_conflicting_pci_devices(dev, name);
+	if (err)
+		return err;
+
 	err = pci_enable_device(dev);
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 5d34d89fb665..4cac7e3bb1a0 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2005 Arcom Control Systems Ltd.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -320,6 +321,10 @@ static int gx1fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_info *info;
 	int ret;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "gx1fb");
+	if (ret)
+		return ret;
+
 	info = gx1fb_init_fbinfo(&pdev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 44089b331f91..2527bd80ec5f 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -15,6 +15,7 @@
  *
  * 16 MiB of framebuffer memory is assumed to be available.
  */
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -364,6 +365,10 @@ static int gxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_videomode *modedb_ptr;
 	unsigned int modedb_size;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "gxfb");
+	if (ret)
+		return ret;
+
 	info = gxfb_init_fbinfo(&pdev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 66c81262d18f..9d26592dbfce 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -6,6 +6,7 @@
  * Built from gxfb (which is Copyright (C) 2006 Arcom Control Systems Ltd.)
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -484,6 +485,10 @@ static int lxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_videomode *modedb_ptr;
 	unsigned int modedb_size;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "lxfb");
+	if (ret)
+		return ret;
+
 	info = lxfb_init_fbinfo(&pdev->dev);
 
 	if (info == NULL)
diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index e5475ae1e158..f0d36a4fdaef 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2006 Paul Mackerras, IBM Corp. <paulus@samba.org>
  */
 
+#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/fb.h>
@@ -621,6 +622,10 @@ static int gxt4500_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct fb_var_screeninfo var;
 	enum gxt_cards cardtype;
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "gxt4500fb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "gxt4500: cannot enable PCI device: %d\n",
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 09dd85553d4f..23329de28e77 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -12,6 +12,7 @@
  *  i740fb by Patrick LERDA, v0.9
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1008,6 +1009,10 @@ static int i740fb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	bool found = false;
 	u8 *edid;
 
+	ret = aperture_remove_conflicting_pci_devices(dev, "i740fb");
+	if (ret)
+		return ret;
+
 	info = framebuffer_alloc(sizeof(struct i740fb_par), &(dev->dev));
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 41a86efca516..ff09f8c20bfc 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -28,6 +28,7 @@
  *  more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2016,6 +2017,10 @@ static int i810fb_init_pci(struct pci_dev *dev,
 	struct fb_videomode mode;
 	int err = -1, vfreq, hfreq, pixclock;
 
+	err = aperture_remove_conflicting_pci_devices(dev, "i810fb");
+	if (err)
+		return err;
+
 	info = framebuffer_alloc(sizeof(struct i810fb_par), &dev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index f489386855c0..d7edb9c5d3a3 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -16,6 +16,7 @@
  *  more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1469,7 +1470,12 @@ static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct imstt_par *par;
 	struct fb_info *info;
 	struct device_node *dp;
-	int ret = -ENOMEM;
+	int ret;
+
+	ret = aperture_remove_conflicting_pci_devices(pdev, "imsttfb");
+	if (ret)
+		return ret;
+	ret = -ENOMEM;
 
 	dp = pci_device_to_OF_node(pdev);
 	if(dp)
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 5647fca8c49a..d4a2891a9a7a 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -107,6 +107,7 @@
  *              Add support for 945GME. (Phil Endecott <spam_from_intelfb@chezphil.org>)
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -483,6 +484,10 @@ static int intelfb_pci_register(struct pci_dev *pdev,
 
 	DBG_MSG("intelfb_pci_register\n");
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "intelfb");
+	if (err)
+		return err;
+
 	num_registered++;
 	if (num_registered != 1) {
 		ERR_MSG("Attempted to register %d devices "
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index d57772f96ad2..b4b93054c520 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -9,6 +9,7 @@
  * for more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -676,6 +677,10 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	unsigned long size;
 	int err;
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "kyrofb");
+	if (err)
+		return err;
+
 	if ((err = pci_enable_device(pdev))) {
 		printk(KERN_WARNING "kyrofb: Can't enable pdev: %d\n", err);
 		return err;
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 236521b19daf..3e26346c05a2 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -100,6 +100,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/version.h>
 
 #include "matroxfb_base.h"
@@ -2044,6 +2045,10 @@ static int matroxfb_probe(struct pci_dev* pdev, const struct pci_device_id* dumm
 	u_int32_t cmd;
 	DBG(__func__)
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "matroxfb");
+	if (err)
+		return err;
+
 	svid = pdev->subsystem_vendor;
 	sid = pdev->subsystem_device;
 	for (b = dev_list; b->vendor; b++) {
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index a7508f5be343..96800c9c9cd9 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -10,6 +10,7 @@
 
 #undef DEBUG
 
+#include <linux/aperture.h>
 #include <linux/fb.h>
 #include <linux/delay.h>
 #include <linux/uaccess.h>
@@ -999,6 +1000,10 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "mb862xxfb");
+	if (ret)
+		return ret;
+
 	ret = pci_enable_device(pdev);
 	if (ret < 0) {
 		dev_err(dev, "Cannot enable PCI device\n");
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 8ad2a79623af..93a2d2d1abe8 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -54,6 +54,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2029,6 +2030,10 @@ static int neofb_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	DBG("neofb_probe");
 
+	err = aperture_remove_conflicting_pci_devices(dev, "neofb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(dev);
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index a372a183c1f0..329e2e8133c6 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -9,6 +9,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1276,11 +1277,15 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	struct nvidia_par *par;
 	struct fb_info *info;
 	unsigned short cmd;
-
+	int ret;
 
 	NVTRACE_ENTER();
 	assert(pd != NULL);
 
+	ret = aperture_remove_conflicting_pci_devices(pd, "nvidiafb");
+	if (ret)
+		return ret;
+
 	info = framebuffer_alloc(sizeof(struct nvidia_par), &pd->dev);
 
 	if (!info)
diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index d3be2c64f1c0..bc80d8498aeb 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -27,6 +27,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1516,6 +1517,10 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	int err;
 	int retval = -ENXIO;
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "pm2fb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(pdev);
 	if (err) {
 		printk(KERN_WARNING "pm2fb: Can't enable pdev: %d\n", err);
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index a8faf46adeb1..ba69846d444f 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -22,6 +22,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1315,6 +1316,10 @@ static int pm3fb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	int err;
 	int retval = -ENXIO;
 
+	err = aperture_remove_conflicting_pci_devices(dev, "pm3fb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(dev);
 	if (err) {
 		printk(KERN_WARNING "pm3fb: Can't enable PCI dev: %d\n", err);
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index f4add36cb5f4..b73ad14efa20 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -45,6 +45,7 @@
 
 #undef DEBUG
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -942,6 +943,10 @@ static int pvr2fb_pci_probe(struct pci_dev *pdev,
 {
 	int ret;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "pvrfb");
+	if (ret)
+		return ret;
+
 	ret = pci_enable_device(pdev);
 	if (ret) {
 		printk(KERN_ERR "pvr2fb: PCI enable failed\n");
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 5bafc44c591b..0ea74e28f915 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -29,6 +29,7 @@
  *	doublescan modes are broken
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1898,6 +1899,10 @@ static int rivafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	NVTRACE_ENTER();
 	assert(pd != NULL);
 
+	ret = aperture_remove_conflicting_pci_devices(pd, "rivafb");
+	if (ret)
+		return ret;
+
 	info = framebuffer_alloc(sizeof(struct riva_par), &pd->dev);
 	if (!info) {
 		ret = -ENOMEM;
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index b93c8eb02336..f66c4de0e188 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -11,6 +11,7 @@
  * which is based on the code of neofb.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1129,6 +1130,10 @@ static int s3_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
+	rc = aperture_remove_conflicting_pci_devices(dev, "s3fb");
+	if (rc)
+		return rc;
+
 	/* Allocate and fill driver data structure */
 	info = framebuffer_alloc(sizeof(struct s3fb_info), &(dev->dev));
 	if (!info)
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 8114c921ceb8..b7818b652698 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -41,6 +41,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2176,6 +2177,10 @@ static int savagefb_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	DBG("savagefb_probe");
 
+	err = aperture_remove_conflicting_pci_devices(dev, "savagefb");
+	if (err)
+		return err;
+
 	info = framebuffer_alloc(sizeof(struct savagefb_par), &dev->dev);
 	if (!info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index f28fd69d5eb7..7114c5c17c91 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -19,6 +19,7 @@
  * which is (c) 1998 Gerd Knorr <kraxel@goldbach.in-berlin.de>
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -5849,6 +5850,10 @@ static int sisfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if(sisfb_off)
 		return -ENXIO;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "sisfb");
+	if (ret)
+		return ret;
+
 	sis_fb_info = framebuffer_alloc(sizeof(*ivideo), &pdev->dev);
 	if(!sis_fb_info)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 304320ce6c6f..125df366e23a 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -42,6 +42,7 @@
  *  more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -668,6 +669,13 @@ static int xxxfb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
     struct device *device = &dev->dev; /* or &pdev->dev */
     int cmap_len, retval;
 
+    /*
+     * Remove firmware-based drivers that create resource conflicts.
+     */
+    retval = aperture_remove_conflicting_pci_devices(pdev, "xxxfb");
+    if (retval)
+	    return retval;
+
     /*
      * Dynamically allocate info and par
      */
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 092a1caa1208..3baf33635e65 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -18,6 +18,7 @@
  * Framebuffer driver for Silicon Motion SM710, SM712, SM721 and SM722 chips
  */
 
+#include <linux/aperture.h>
 #include <linux/io.h>
 #include <linux/fb.h>
 #include <linux/pci.h>
@@ -1502,6 +1503,10 @@ static int smtcfb_pci_probe(struct pci_dev *pdev,
 
 	dev_info(&pdev->dev, "Silicon Motion display driver.\n");
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "smtcfb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(pdev);	/* enable SMTC chip */
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index 535ef4693cd4..73ca2782ebfc 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -80,6 +80,7 @@
  * Includes
  */
 
+#include <linux/aperture.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -1326,6 +1327,10 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct sst_spec *spec;
 	int err;
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "sstfb");
+	if (err)
+		return err;
+
 	/* Enable device in PCI config. */
 	if ((err=pci_enable_device(pdev))) {
 		printk(KERN_ERR "cannot enable device\n");
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index 1d3bacd9d5ac..81d59613ea1f 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2007 David S. Miller (davem@davemloft.net)
  */
 
+#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/fb.h>
 #include <linux/pci.h>
@@ -123,6 +124,10 @@ static int s3d_pci_register(struct pci_dev *pdev,
 	struct s3d_info *sp;
 	int err;
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "s3dfb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(pdev);
 	if (err < 0) {
 		printk(KERN_ERR "s3d: Cannot enable PCI device %s\n",
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index 9daf17b11106..3a51b2a1480c 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2007 David S. Miller (davem@davemloft.net)
  */
 
+#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/fb.h>
 #include <linux/pci.h>
@@ -249,6 +250,10 @@ static int e3d_pci_register(struct pci_dev *pdev,
 	unsigned int line_length;
 	int err;
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "e3dfb");
+	if (err)
+		return err;
+
 	of_node = pci_device_to_OF_node(pdev);
 	if (!of_node) {
 		printk(KERN_ERR "e3d: Cannot find OF node of %s\n",
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 67e37a62b07c..059e0174e139 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -64,6 +64,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -1376,6 +1377,10 @@ static int tdfxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct fb_monspecs *specs;
 	bool found;
 
+	err = aperture_remove_conflicting_pci_devices(pdev, "tdfxfb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(pdev);
 	if (err) {
 		printk(KERN_ERR "tdfxfb: Can't enable pdev: %d\n", err);
diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 9266c76783cc..4600138e3bef 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -12,6 +12,7 @@
  *  more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/bitrev.h>
 #include <linux/compiler.h>
 #include <linux/delay.h>
@@ -106,6 +107,12 @@ static struct pci_driver tgafb_pci_driver = {
 static int tgafb_pci_register(struct pci_dev *pdev,
 			      const struct pci_device_id *ent)
 {
+	int ret;
+
+	ret = aperture_remove_conflicting_pci_devices(pdev, "tgafb");
+	if (ret)
+		return ret;
+
 	return tgafb_register(&pdev->dev);
 }
 
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 319131bd72cf..6813df793c49 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -16,6 +16,7 @@
  *	timing value tweaking so it looks good on every monitor in every mode
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/init.h>
@@ -1470,6 +1471,10 @@ static int trident_pci_probe(struct pci_dev *dev,
 	int chip_id;
 	bool found = false;
 
+	err = aperture_remove_conflicting_pci_devices(dev, "tridentfb");
+	if (err)
+		return err;
+
 	err = pci_enable_device(dev);
 	if (err)
 		return err;
diff --git a/drivers/video/fbdev/vermilion/vermilion.c b/drivers/video/fbdev/vermilion/vermilion.c
index ff61605b8764..82b36dbb5b1a 100644
--- a/drivers/video/fbdev/vermilion/vermilion.c
+++ b/drivers/video/fbdev/vermilion/vermilion.c
@@ -14,6 +14,7 @@
  *   Alan Hourihane <alanh-at-tungstengraphics-dot-com>
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -442,7 +443,11 @@ static int vml_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct vml_info *vinfo;
 	struct fb_info *info;
 	struct vml_par *par;
-	int err = 0;
+	int err;
+
+	err = aperture_remove_conflicting_pci_devices(dev, "vmlfb");
+	if (err)
+		return err;
 
 	par = kzalloc(sizeof(*par), GFP_KERNEL);
 	if (par == NULL)
diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 89d75079b730..2ee8fcae08df 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -8,6 +8,7 @@
 /*
  * Core code for the Via multifunction framebuffer device.
  */
+#include <linux/aperture.h>
 #include <linux/via-core.h>
 #include <linux/via_i2c.h>
 #include <linux/via-gpio.h>
@@ -617,6 +618,10 @@ static int via_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	int ret;
 
+	ret = aperture_remove_conflicting_pci_devices(pdev, "viafb");
+	if (ret)
+		return ret;
+
 	ret = pci_enable_device(pdev);
 	if (ret)
 		return ret;
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index a92a8c670cf0..62318cef5f8c 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -12,6 +12,7 @@
  * (http://davesdomain.org.uk/viafb/)
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -670,6 +671,10 @@ static int vt8623_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
+	rc = aperture_remove_conflicting_pci_devices(dev, "vt8623fb");
+	if (rc)
+		return rc;
+
 	/* Allocate and fill driver data structure */
 	info = framebuffer_alloc(sizeof(struct vt8623fb_info), &(dev->dev));
 	if (!info)
-- 
2.36.1

