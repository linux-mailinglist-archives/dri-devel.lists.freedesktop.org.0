Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8C4C38FE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67A110E8C1;
	Thu, 24 Feb 2022 22:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029A410E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:48:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 818FCB829B0;
 Thu, 24 Feb 2022 22:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC281C340E9;
 Thu, 24 Feb 2022 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742887;
 bh=e7FQOMDSeUE3uVxsf/mtknOcGxVe/W8JcOSexTgWCis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZW2T4yGEQPPdxsZ0p/KvgpKVuO/Ph/wf4FpnOQTaRZKLNbcxMnvSiSLAxdS6AN6XY
 tOdkTAiTWcDP//QMs+Wex2TSFnUAA9Ev5TGkgyYJNjoEZrdMIVUEu+dq3Uve57Fsgu
 Z8o5uAz1pXwTpHXfGgVhrFsctY4DQilEiHknjC079b51yv88dIDYt/MAxxxJ6bbeFl
 9MUC84pU7l7PL0QgVlaikOcrgPcjQ5BeXAZcxFB5KPNsKJPjvIH0SK2daTkeFh9zyL
 SgyIVfpbijIuPDdTde8wHAutdV7Ys7OEJ3WMjx+irlDcJT8AECeAYCRGt6n8XwGbie
 ad19/QQiw2CFw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 01/11] PCI/VGA: Move vgaarb to drivers/pci
Date: Thu, 24 Feb 2022 16:47:43 -0600
Message-Id: <20220224224753.297579-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224224753.297579-1-helgaas@kernel.org>
References: <20220224224753.297579-1-helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

The VGA arbiter is really PCI-specific and doesn't depend on any GPU
things.  Move it to the PCI subsystem.

Note that misc_init() must be called before vga_arb_device_init().  These
are both subsys_initcalls, so this ordering depends on the link order,
which is determined by drivers/Makefile:

  obj-y += pci/
  obj-y += char/        <-- misc_init()
  obj-y += gpu/         <-- vga_arb_device_init() (before this commit)

The drivers/pci/ subsys_initcalls are called *before* misc_init(), so
convert vga_arb_device_init() to subsys_initcall_sync(), which is called
after *all* subsys_initcalls.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/vga/Kconfig           | 19 -------------------
 drivers/gpu/vga/Makefile          |  1 -
 drivers/pci/Kconfig               | 19 +++++++++++++++++++
 drivers/pci/Makefile              |  1 +
 drivers/{gpu/vga => pci}/vgaarb.c |  2 +-
 5 files changed, 21 insertions(+), 21 deletions(-)
 rename drivers/{gpu/vga => pci}/vgaarb.c (99%)

diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
index 1ad4c4ef0b5e..eb8b14ab22c3 100644
--- a/drivers/gpu/vga/Kconfig
+++ b/drivers/gpu/vga/Kconfig
@@ -1,23 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config VGA_ARB
-	bool "VGA Arbitration" if EXPERT
-	default y
-	depends on (PCI && !S390)
-	help
-	  Some "legacy" VGA devices implemented on PCI typically have the same
-	  hard-decoded addresses as they did on ISA. When multiple PCI devices
-	  are accessed at same time they need some kind of coordination. Please
-	  see Documentation/gpu/vgaarbiter.rst for more details. Select this to
-	  enable VGA arbiter.
-
-config VGA_ARB_MAX_GPUS
-	int "Maximum number of GPUs"
-	default 16
-	depends on VGA_ARB
-	help
-	  Reserves space in the kernel to maintain resource locking for
-	  multiple GPUS.  The overhead for each GPU is very small.
-
 config VGA_SWITCHEROO
 	bool "Laptop Hybrid Graphics - GPU switching support"
 	depends on X86
diff --git a/drivers/gpu/vga/Makefile b/drivers/gpu/vga/Makefile
index e92064442d60..9800620deda3 100644
--- a/drivers/gpu/vga/Makefile
+++ b/drivers/gpu/vga/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VGA_ARB)  += vgaarb.o
 obj-$(CONFIG_VGA_SWITCHEROO) += vga_switcheroo.o
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index d98fafdd0f99..133c73207782 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -252,6 +252,25 @@ config PCIE_BUS_PEER2PEER
 
 endchoice
 
+config VGA_ARB
+	bool "VGA Arbitration" if EXPERT
+	default y
+	depends on (PCI && !S390)
+	help
+	  Some "legacy" VGA devices implemented on PCI typically have the same
+	  hard-decoded addresses as they did on ISA. When multiple PCI devices
+	  are accessed at same time they need some kind of coordination. Please
+	  see Documentation/gpu/vgaarbiter.rst for more details. Select this to
+	  enable VGA arbiter.
+
+config VGA_ARB_MAX_GPUS
+	int "Maximum number of GPUs"
+	default 16
+	depends on VGA_ARB
+	help
+	  Reserves space in the kernel to maintain resource locking for
+	  multiple GPUS.  The overhead for each GPU is very small.
+
 source "drivers/pci/hotplug/Kconfig"
 source "drivers/pci/controller/Kconfig"
 source "drivers/pci/endpoint/Kconfig"
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 37be95adf169..0da6b1ebc694 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
 obj-$(CONFIG_PCI_ECAM)		+= ecam.o
 obj-$(CONFIG_PCI_P2PDMA)	+= p2pdma.o
 obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
+obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
 
 # Endpoint library must be initialized before its users
 obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/pci/vgaarb.c
similarity index 99%
rename from drivers/gpu/vga/vgaarb.c
rename to drivers/pci/vgaarb.c
index 569930552957..8320385a487b 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -1564,4 +1564,4 @@ static int __init vga_arb_device_init(void)
 	pr_info("loaded\n");
 	return rc;
 }
-subsys_initcall(vga_arb_device_init);
+subsys_initcall_sync(vga_arb_device_init);
-- 
2.25.1

