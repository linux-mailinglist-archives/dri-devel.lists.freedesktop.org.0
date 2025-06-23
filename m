Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F5AE4D05
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 20:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21610E299;
	Mon, 23 Jun 2025 18:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rps3YcCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD40F10E299
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 18:48:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7A287A50E83;
 Mon, 23 Jun 2025 18:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0250DC4CEF1;
 Mon, 23 Jun 2025 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750704505;
 bh=8DZ4LPdmiF/gLNoKEzQdv+iJ3v6IKz46G7ZkKiM2lpY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rps3YcCNhFObZ+uHXTrt8NnX3veByCmkmSEK5DoJkCaNpVTQWSM0DWKw+J8bGl/D/
 7oCdDh5sVekIWe59LTqYsX7ofi5VL7bvrdErWtqpuctLBdHGDyt3l70ufAvIEh+Iav
 LXWd0IX4/SqGHz8LOWZxiVwMO6dGELCjRYAEXmc0mmSrMBiuLAGuPSiUVuJuFD4qcb
 b8q/1Su/ND2c37r9DG0Newzrxcgzmnfg4cf3/d2QRc2p+WoYBMKUsCYxjjrLve2G1M
 Kf8TUlE3sejrS5mvOOnhM3fTNJ19t44H7i21k3fdfcIETH6t3IYPVCTTu1FhbBw/Jh
 8dY7X0pRaG9JA==
From: Mario Limonciello <superm1@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 iommu@lists.linux.dev (open list:INTEL IOMMU (VT-d)),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 7/8] PCI/VGA: Move check for firmware default out of VGA
 arbiter
Date: Mon, 23 Jun 2025 13:47:56 -0500
Message-ID: <20250623184757.3774786-8-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623184757.3774786-1-superm1@kernel.org>
References: <20250623184757.3774786-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

The x86 specific check for whether a framebuffer belongs to a device
works for display devices as well as VGA devices.  Callers to
video_is_primary_device() can benefit from checking non-VGA display
devices.

Move the x86 specific check into x86 specific code, and adjust VGA
arbiter to call that code as well. This allows fbcon to find the
right PCI device on systems that don't have VGA devices.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * use helper
---
 arch/x86/video/video-common.c | 13 ++++++++++++-
 drivers/pci/vgaarb.c          | 36 ++---------------------------------
 2 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
index 81fc97a2a837a..917568e4d7fb1 100644
--- a/arch/x86/video/video-common.c
+++ b/arch/x86/video/video-common.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/screen_info.h>
 #include <linux/vgaarb.h>
 
 #include <asm/video.h>
@@ -27,6 +28,7 @@ EXPORT_SYMBOL(pgprot_framebuffer);
 
 bool video_is_primary_device(struct device *dev)
 {
+	struct screen_info *si = &screen_info;
 	struct pci_dev *pdev;
 
 	if (!dev_is_pci(dev))
@@ -34,7 +36,16 @@ bool video_is_primary_device(struct device *dev)
 
 	pdev = to_pci_dev(dev);
 
-	return (pdev == vga_default_device());
+	if (!pci_is_display(pdev))
+		return false;
+
+	if (pdev == vga_default_device())
+		return true;
+
+	if (pdev == screen_info_pci_dev(si))
+		return true;
+
+	return false;
 }
 EXPORT_SYMBOL(video_is_primary_device);
 
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 78748e8d2dbae..15ab58c70b016 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -26,12 +26,12 @@
 #include <linux/poll.h>
 #include <linux/miscdevice.h>
 #include <linux/slab.h>
-#include <linux/screen_info.h>
 #include <linux/vt.h>
 #include <linux/console.h>
 #include <linux/acpi.h>
 #include <linux/uaccess.h>
 #include <linux/vgaarb.h>
+#include <asm/video.h>
 
 static void vga_arbiter_notify_clients(void);
 
@@ -554,38 +554,6 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
-static bool vga_is_firmware_default(struct pci_dev *pdev)
-{
-#if defined(CONFIG_X86)
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
-	struct resource *r;
-	u64 limit;
-
-	/* Select the device owning the boot framebuffer if there is one */
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	limit = base + size;
-
-	/* Does firmware framebuffer belong to us? */
-	pci_dev_for_each_resource(pdev, r) {
-		if (resource_type(r) != IORESOURCE_MEM)
-			continue;
-
-		if (!r->start || !r->end)
-			continue;
-
-		if (base < r->start || limit >= r->end)
-			continue;
-
-		return true;
-	}
-#endif
-	return false;
-}
-
 static bool vga_arb_integrated_gpu(struct device *dev)
 {
 #if defined(CONFIG_ACPI)
@@ -623,7 +591,7 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
 	if (boot_vga && boot_vga->is_firmware_default)
 		return false;
 
-	if (vga_is_firmware_default(pdev)) {
+	if (video_is_primary_device(&pdev->dev)) {
 		vgadev->is_firmware_default = true;
 		return true;
 	}
-- 
2.43.0

