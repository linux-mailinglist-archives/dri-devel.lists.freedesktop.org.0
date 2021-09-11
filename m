Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D94075D3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 11:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450266EB5A;
	Sat, 11 Sep 2021 09:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5D6EB5A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 09:32:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B09A4610F8;
 Sat, 11 Sep 2021 09:32:56 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>
Subject: [PATCH V5 01/11] PCI/VGA: Move vgaarb to drivers/pci
Date: Sat, 11 Sep 2021 17:30:46 +0800
Message-Id: <20210911093056.1555274-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210911093056.1555274-1-chenhuacai@loongson.cn>
References: <20210911093056.1555274-1-chenhuacai@loongson.cn>
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

From: Bjorn Helgaas <bhelgaas@google.com>

The VGA arbiter is really PCI-specific and doesn't depend on any GPU
things.  Move it to the PCI subsystem.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/vga/Kconfig           | 19 -------------------
 drivers/gpu/vga/Makefile          |  1 -
 drivers/pci/Kconfig               | 19 +++++++++++++++++++
 drivers/pci/Makefile              |  1 +
 drivers/{gpu/vga => pci}/vgaarb.c |  0
 5 files changed, 20 insertions(+), 20 deletions(-)
 rename drivers/{gpu/vga => pci}/vgaarb.c (100%)

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
index 0c473d75e625..7c9e56d7b857 100644
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
index d62c4ac4ae1b..ebe720f69b15 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
 obj-$(CONFIG_PCI_ECAM)		+= ecam.o
 obj-$(CONFIG_PCI_P2PDMA)	+= p2pdma.o
 obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
+obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
 
 # Endpoint library must be initialized before its users
 obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/pci/vgaarb.c
similarity index 100%
rename from drivers/gpu/vga/vgaarb.c
rename to drivers/pci/vgaarb.c
-- 
2.27.0

