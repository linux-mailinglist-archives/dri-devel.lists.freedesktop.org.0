Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0BAFB9FE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4B110E331;
	Mon,  7 Jul 2025 17:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t626NaHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4C510E165
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 17:37:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DE8C3450C2;
 Mon,  7 Jul 2025 17:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857CEC4CEE3;
 Mon,  7 Jul 2025 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751909846;
 bh=8Xmc1kWMbfBAphlEij+eyL7s2osFqXjAldmjAhU1vMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t626NaHza32X8ifh3RNdryWJrdYrBB4XosdMn0bQk8nP2sD+Wo+y/yMyOJwV0GoiU
 yYgSeDOYv4dtMOtttvLjmw/Wg+V9zbmM7og4UzgmKMj6Z/TjDC5X4lns6EQPj7lrYU
 5SYRPX0rFQT3dzA1Pwo/pIgh3g4o9qfJAE7lpnRMZO1B1X8adpiXIDzTnj3qywZrJf
 8EHbqQJHlCyss6vOgkk9sohxYU/2aPihjp4kbVG9/y5x47iU1gmo3LFhHtzxNetgds
 R1AE8W51g70zgST5d9/i+Umicf/twq7QkUK4YqC1tWvZkc8uRWxN4hQQ2ZLhF15/PZ
 gk6DbKQgrohtg==
From: Hans de Goede <hansg@kernel.org>
To: David Airlie <airlied@linux.ie>
Cc: Hans de Goede <hansg@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Andi Kleen <ak@linux.intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] agp/amd64: Remove support for probing unlisted PCI devices
Date: Mon,  7 Jul 2025 19:37:10 +0200
Message-ID: <20250707173710.313701-4-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707173710.313701-1-hansg@kernel.org>
References: <20250707173710.313701-1-hansg@kernel.org>
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

AMD64 boards with AGP support are so old that the agp_amd64_pci_table
should be complete and there is no need to probe unlisted PCI devices,
so lets completely remove support for probing unlisted PCI devices.

Suggested-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/char/agp/Kconfig     |  3 +--
 drivers/char/agp/agp.h       |  1 -
 drivers/char/agp/amd64-agp.c | 41 +-----------------------------------
 drivers/char/agp/backend.c   |  4 ----
 4 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/drivers/char/agp/Kconfig b/drivers/char/agp/Kconfig
index c47eb7bf06d4..752b18901613 100644
--- a/drivers/char/agp/Kconfig
+++ b/drivers/char/agp/Kconfig
@@ -63,8 +63,7 @@ config AGP_AMD64
 	  This option gives you AGP support for the GLX component of
 	  X using the on-CPU northbridge of the AMD Athlon64/Opteron CPUs.
 	  You still need an external AGP bridge like the AMD 8151, VIA
-	  K8T400M, SiS755. It may also support other AGP bridges when loaded
-	  with agp_try_unsupported=1.
+	  K8T400M, SiS755.
 
 config AGP_INTEL
 	tristate "Intel 440LX/BX/GX, I8xx and E7x05 chipset support"
diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
index 67d7be800a7c..9fbe100c8f5e 100644
--- a/drivers/char/agp/agp.h
+++ b/drivers/char/agp/agp.h
@@ -237,7 +237,6 @@ void agp3_generic_cleanup(void);
 extern const struct aper_size_info_16 agp3_generic_sizes[];
 
 extern int agp_off;
-extern int agp_try_unsupported_boot;
 
 long compat_agp_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
 
diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index f883c06b538a..e63827724bb1 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -34,7 +34,6 @@
 #define ULI_X86_64_ENU_SCR_REG		0x54
 
 static struct resource *aperture_resource;
-static bool agp_try_unsupported __initdata;
 static int agp_bridges_found;
 
 static void amd64_tlbflush(struct agp_memory *temp)
@@ -734,47 +733,10 @@ static struct pci_driver agp_amd64_pci_driver = {
 /* Not static due to IOMMU code calling it early. */
 int __init agp_amd64_init(void)
 {
-	struct pci_dev *pdev = NULL;
-	int err = 0;
-
 	if (agp_off)
 		return -EINVAL;
 
-	err = pci_register_driver(&agp_amd64_pci_driver);
-	if (err < 0)
-		return err;
-
-	if (agp_bridges_found == 0) {
-		if (!agp_try_unsupported && !agp_try_unsupported_boot) {
-			printk(KERN_INFO PFX "No supported AGP bridge found.\n");
-#ifdef MODULE
-			printk(KERN_INFO PFX "You can try agp_try_unsupported=1\n");
-#else
-			printk(KERN_INFO PFX "You can boot with agp=try_unsupported\n");
-#endif
-			pci_unregister_driver(&agp_amd64_pci_driver);
-			return -ENODEV;
-		}
-
-		/* First check that we have at least one AMD64 NB */
-		if (!amd_nb_num()) {
-			pci_unregister_driver(&agp_amd64_pci_driver);
-			return -ENODEV;
-		}
-
-		/* Look for any AGP bridge */
-		for_each_pci_dev(pdev)
-			if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
-				pci_add_dynid(&agp_amd64_pci_driver,
-					      pdev->vendor, pdev->device,
-					      pdev->subsystem_vendor,
-					      pdev->subsystem_device, 0, 0, 0);
-		if (agp_bridges_found == 0) {
-			pci_unregister_driver(&agp_amd64_pci_driver);
-			err = -ENODEV;
-		}
-	}
-	return err;
+	return pci_register_driver(&agp_amd64_pci_driver);
 }
 
 static int __init agp_amd64_mod_init(void)
@@ -801,6 +763,5 @@ module_init(agp_amd64_mod_init);
 module_exit(agp_amd64_cleanup);
 
 MODULE_AUTHOR("Dave Jones, Andi Kleen");
-module_param(agp_try_unsupported, bool, 0);
 MODULE_DESCRIPTION("GART driver for the AMD Opteron/Athlon64 on-CPU northbridge");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/agp/backend.c b/drivers/char/agp/backend.c
index 1776afd3ee07..ca9c3472d4b7 100644
--- a/drivers/char/agp/backend.c
+++ b/drivers/char/agp/backend.c
@@ -319,9 +319,7 @@ void agp_remove_bridge(struct agp_bridge_data *bridge)
 EXPORT_SYMBOL_GPL(agp_remove_bridge);
 
 int agp_off;
-int agp_try_unsupported_boot;
 EXPORT_SYMBOL(agp_off);
-EXPORT_SYMBOL(agp_try_unsupported_boot);
 
 static int __init agp_init(void)
 {
@@ -340,8 +338,6 @@ static __init int agp_setup(char *s)
 {
 	if (!strcmp(s,"off"))
 		agp_off = 1;
-	if (!strcmp(s,"try_unsupported"))
-		agp_try_unsupported_boot = 1;
 	return 1;
 }
 __setup("agp=", agp_setup);
-- 
2.49.0

