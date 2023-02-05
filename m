Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E368B1C1
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 22:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE62F10E2A5;
	Sun,  5 Feb 2023 21:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D7310E2A5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 21:08:00 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-ZUTW5WaPPL2BFPt5Hm_yhg-1; Sun, 05 Feb 2023 16:07:55 -0500
X-MC-Unique: ZUTW5WaPPL2BFPt5Hm_yhg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 417133804060;
 Sun,  5 Feb 2023 21:07:55 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92D5B492C14;
 Sun,  5 Feb 2023 21:07:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: linux-fbdev@vger.kernel.org
Subject: [PATCH] nvidiafb: detect the hardware support before removing console.
Date: Mon,  6 Feb 2023 07:07:51 +1000
Message-Id: <20230205210751.3842103-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Dave Airlie <airlied@redhat.com>, Zeno Davatz <zdavatz@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This driver removed the console, but hasn't yet decided if it could
take over the console yet. Instead of doing that, probe the hw for
support and then remove the console afterwards.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859
Reported-by: Zeno Davatz <zdavatz@gmail.com>
---
 drivers/video/fbdev/nvidia/nvidia.c | 81 +++++++++++++++--------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 1960916098d4..e60a276b4855 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1197,17 +1197,17 @@ static int nvidia_set_fbinfo(struct fb_info *info)
 	return nvidiafb_check_var(&info->var, info);
 }
 
-static u32 nvidia_get_chipset(struct fb_info *info)
+static u32 nvidia_get_chipset(struct pci_dev *pci_dev,
+			      volatile u32 __iomem *REGS)
 {
-	struct nvidia_par *par = info->par;
-	u32 id = (par->pci_dev->vendor << 16) | par->pci_dev->device;
+	u32 id = (pci_dev->vendor << 16) | pci_dev->device;
 
 	printk(KERN_INFO PFX "Device ID: %x \n", id);
 
 	if ((id & 0xfff0) == 0x00f0 ||
 	    (id & 0xfff0) == 0x02e0) {
 		/* pci-e */
-		id = NV_RD32(par->REGS, 0x1800);
+		id = NV_RD32(REGS, 0x1800);
 
 		if ((id & 0x0000ffff) == 0x000010DE)
 			id = 0x10DE0000 | (id >> 16);
@@ -1220,12 +1220,11 @@ static u32 nvidia_get_chipset(struct fb_info *info)
 	return id;
 }
 
-static u32 nvidia_get_arch(struct fb_info *info)
+static u32 nvidia_get_arch(u32 Chipset)
 {
-	struct nvidia_par *par = info->par;
 	u32 arch = 0;
 
-	switch (par->Chipset & 0x0ff0) {
+	switch (Chipset & 0x0ff0) {
 	case 0x0100:		/* GeForce 256 */
 	case 0x0110:		/* GeForce2 MX */
 	case 0x0150:		/* GeForce2 */
@@ -1278,16 +1277,44 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	struct fb_info *info;
 	unsigned short cmd;
 	int ret;
+	volatile u32 __iomem *REGS;
+	int Chipset;
+	u32 Architecture;
 
 	NVTRACE_ENTER();
 	assert(pd != NULL);
 
+	if (pci_enable_device(pd)) {
+		printk(KERN_ERR PFX "cannot enable PCI device\n");
+		return -ENODEV;
+	}
+
+	/* enable IO and mem if not already done */
+	pci_read_config_word(pd, PCI_COMMAND, &cmd);
+	cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
+	pci_write_config_word(pd, PCI_COMMAND, cmd);
+
+	nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
+	nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
+
+	REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
+	if (!REGS) {
+		printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
+		return -ENODEV;
+	}
+
+	Chipset = nvidia_get_chipset(pd, REGS);
+	Architecture = nvidia_get_arch(Chipset);
+	if (Architecture == 0) {
+		printk(KERN_ERR PFX "unknown NV_ARCH\n");
+		goto err_out;
+	}
+
 	ret = aperture_remove_conflicting_pci_devices(pd, "nvidiafb");
 	if (ret)
-		return ret;
+		goto err_out;
 
 	info = framebuffer_alloc(sizeof(struct nvidia_par), &pd->dev);
-
 	if (!info)
 		goto err_out;
 
@@ -1298,11 +1325,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	if (info->pixmap.addr == NULL)
 		goto err_out_kfree;
 
-	if (pci_enable_device(pd)) {
-		printk(KERN_ERR PFX "cannot enable PCI device\n");
-		goto err_out_enable;
-	}
-
 	if (pci_request_regions(pd, "nvidiafb")) {
 		printk(KERN_ERR PFX "cannot request PCI regions\n");
 		goto err_out_enable;
@@ -1318,34 +1340,17 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	par->paneltweak = paneltweak;
 	par->reverse_i2c = reverse_i2c;
 
-	/* enable IO and mem if not already done */
-	pci_read_config_word(pd, PCI_COMMAND, &cmd);
-	cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
-	pci_write_config_word(pd, PCI_COMMAND, cmd);
-
-	nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
 	nvidiafb_fix.smem_start = pci_resource_start(pd, 1);
-	nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
-
-	par->REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
 
-	if (!par->REGS) {
-		printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
-		goto err_out_free_base0;
-	}
+	par->REGS = REGS;
 
-	par->Chipset = nvidia_get_chipset(info);
-	par->Architecture = nvidia_get_arch(info);
-
-	if (par->Architecture == 0) {
-		printk(KERN_ERR PFX "unknown NV_ARCH\n");
-		goto err_out_arch;
-	}
+	par->Chipset = Chipset;
+	par->Architecture = Architecture;
 
 	sprintf(nvidiafb_fix.id, "NV%x", (pd->device & 0x0ff0) >> 4);
 
 	if (NVCommonSetup(info))
-		goto err_out_arch;
+		goto err_out_free_base0;
 
 	par->FbAddress = nvidiafb_fix.smem_start;
 	par->FbMapSize = par->RamAmountKBytes * 1024;
@@ -1401,7 +1406,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 		goto err_out_iounmap_fb;
 	}
 
-
 	printk(KERN_INFO PFX
 	       "PCI nVidia %s framebuffer (%dMB @ 0x%lX)\n",
 	       info->fix.id,
@@ -1415,15 +1419,14 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 err_out_free_base1:
 	fb_destroy_modedb(info->monspecs.modedb);
 	nvidia_delete_i2c_busses(par);
-err_out_arch:
-	iounmap(par->REGS);
- err_out_free_base0:
+err_out_free_base0:
 	pci_release_regions(pd);
 err_out_enable:
 	kfree(info->pixmap.addr);
 err_out_kfree:
 	framebuffer_release(info);
 err_out:
+	iounmap(REGS);
 	return -ENODEV;
 }
 
-- 
2.38.1

