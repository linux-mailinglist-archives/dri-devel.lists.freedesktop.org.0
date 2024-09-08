Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915B970632
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C306810E255;
	Sun,  8 Sep 2024 09:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PyTxdLv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0891410E256
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:45:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziUBE3Ymecb0ZbasO1cwCGLK1KK7fKoU4FDOn88qPMg=;
 b=PyTxdLv1gjIsdMDUdhRdUjq//Wj7TXbECrxXh+9WB0xQG5DT/XwMeumhwOdQJhOA40+/1S
 WktG0YiVpXh6OC2FRhL1gUy6AHR3c3mMhbrNOs/act6bym0nZgszvWPU6VpZvGX6geTOL5
 ndWvGXI1BXZZSsGtJKSb6cIHOOIumqM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 14/19] drm/etnaviv: Add PCIe IP setup code
Date: Sun,  8 Sep 2024 17:43:52 +0800
Message-ID: <20240908094357.291862-15-sui.jingfeng@linux.dev>
In-Reply-To: <20240908094357.291862-1-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Because some PCIe IP need special setup before its VRAM bar can be usable,
do this with instance specific object function.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/Makefile          |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c |  19 ++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h |   9 ++
 drivers/gpu/drm/etnaviv/pcie_ip_setup.c   | 109 ++++++++++++++++++++++
 4 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/etnaviv/pcie_ip_setup.c

diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
index 6829e1ebf2db..383f181bfc4c 100644
--- a/drivers/gpu/drm/etnaviv/Makefile
+++ b/drivers/gpu/drm/etnaviv/Makefile
@@ -16,6 +16,7 @@ etnaviv-y := \
 	etnaviv_perfmon.o \
 	etnaviv_sched.o
 
-etnaviv-$(CONFIG_DRM_ETNAVIV_PCI_DRIVER) += etnaviv_pci_drv.o
+etnaviv-$(CONFIG_DRM_ETNAVIV_PCI_DRIVER) += etnaviv_pci_drv.o \
+					    pcie_ip_setup.o
 
 obj-$(CONFIG_DRM_ETNAVIV)	+= etnaviv.o
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
index f13f3208120f..9911bfdc41a9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -5,6 +5,11 @@
 #include "etnaviv_drv.h"
 #include "etnaviv_pci_drv.h"
 
+static const struct etnaviv_pcie_ip_funcs jemo_9xxxx_gpu_pcie_ip_funcs = {
+	.init = jemo_pcie_init,
+	.fini = NULL,
+};
+
 static const struct etnaviv_pci_gpu_data
 gccore_platform_data[GCCORE_PCI_CHIP_ID_LAST] = {
 	{
@@ -18,7 +23,9 @@ gccore_platform_data[GCCORE_PCI_CHIP_ID_LAST] = {
 		.mmio_bar = 1,
 		.ip_block = {{0, 0x00900000, 0x00004000, "etnaviv-gpu,3d"},},
 		.has_dedicated_vram = true,
+		.has_iatu = true,
 		.has_display = true,
+		.pcie_ip_funcs = &jemo_9xxxx_gpu_pcie_ip_funcs,
 		.market_name = "JingJia Micro JM9100",
 	},
 	{
@@ -30,7 +37,9 @@ gccore_platform_data[GCCORE_PCI_CHIP_ID_LAST] = {
 		.ip_block = {{0, 0x00900000, 0x00004000, "etnaviv-gpu,3d"},
 			     {1, 0x00910000, 0x00004000, "etnaviv-gpu,3d"},},
 		.has_dedicated_vram = true,
+		.has_iatu = true,
 		.has_display = true,
+		.pcie_ip_funcs = &jemo_9xxxx_gpu_pcie_ip_funcs,
 		.market_name = "JingJia Micro JD9230P",
 	},
 	{
@@ -42,6 +51,7 @@ gccore_platform_data[GCCORE_PCI_CHIP_ID_LAST] = {
 		.ip_block = {{0, 0x00040000, 0x00004000, "etnaviv-gpu,3d"},
 			     {0, 0x000C0000, 0x00004000, "etnaviv-gpu,2d"},},
 		.has_dedicated_vram = true,
+		.has_iatu = false,
 		.has_display = true,
 		.market_name = "LingJiu GP102",
 	},
@@ -53,6 +63,7 @@ gccore_platform_data[GCCORE_PCI_CHIP_ID_LAST] = {
 		.mmio_bar = 0,
 		.ip_block = {{0, 0, 0x00004000, "etnaviv-gpu,3d"},},
 		.has_dedicated_vram = true,
+		.has_iatu = false,
 		.has_display = false,
 		.market_name = "GC1000 in LS7A1000",
 	},
@@ -83,6 +94,7 @@ static int etnaviv_pci_probe(struct pci_dev *pdev,
 			     const struct pci_device_id *ent)
 {
 	const struct etnaviv_pci_gpu_data *pdata;
+	const struct etnaviv_pcie_ip_funcs *pcie_ip_funcs;
 	struct device *dev = &pdev->dev;
 	unsigned int i;
 	unsigned int num_core;
@@ -102,6 +114,13 @@ static int etnaviv_pci_probe(struct pci_dev *pdev,
 	if (!pdata)
 		return -ENODEV;
 
+	pcie_ip_funcs = pdata->pcie_ip_funcs;
+	if (pcie_ip_funcs) {
+		ret = pcie_ip_funcs->init(pdev);
+		if (ret)
+			return ret;
+	}
+
 	num_core = pdata->num_core;
 
 	dev_info(dev, "%s has %u GPU cores\n", pdata->market_name, num_core);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
index eae8cdea5674..39eb2851355a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -23,6 +23,11 @@ struct vivante_gc_ip_block {
 	char compatible[20];
 };
 
+struct etnaviv_pcie_ip_funcs {
+	int (*init)(struct pci_dev *pdev);
+	void (*fini)(struct pci_dev *pdev);
+};
+
 struct etnaviv_pci_gpu_data {
 	enum etnaviv_pci_chip_id chip_id;
 	u32 num_core;
@@ -31,13 +36,17 @@ struct etnaviv_pci_gpu_data {
 	u32 mmio_bar;
 	struct vivante_gc_ip_block ip_block[ETNA_MAX_IP_BLOCK];
 	bool has_dedicated_vram;
+	bool has_iatu;
 	bool has_display;
+	const struct etnaviv_pcie_ip_funcs *pcie_ip_funcs;
 	char market_name[24];
 };
 
 int etnaviv_register_pci_driver(void);
 void etnaviv_unregister_pci_driver(void);
 
+int jemo_pcie_init(struct pci_dev *pdev);
+
 #else
 
 static inline int etnaviv_register_pci_driver(void) { return 0; }
diff --git a/drivers/gpu/drm/etnaviv/pcie_ip_setup.c b/drivers/gpu/drm/etnaviv/pcie_ip_setup.c
new file mode 100644
index 000000000000..f90db8260c35
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/pcie_ip_setup.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pci.h>
+
+#include "etnaviv_drv.h"
+#include "etnaviv_pci_drv.h"
+
+#define PCIE_IATU_BASE_ADDR               0x10000
+#define PCIE_IATU_BAR_ADDR_INC            0x200
+
+#define PCIE_REGION_INBOUND               1
+#define PCIE_REGION_OUTBOUND              0
+#define PCIE_REGION_DIRECT_BIT            31
+#define PCIE_REGION_DIRECT_BITMASK        0x80000000
+#define PCIE_REGION_INDEX_BITMASK         0x7FFFFFFF
+
+#define PCIE_REGION_TYPE_MEM              0x00
+#define PCIE_REGION_TYPE_IO               0x10
+
+#define PCIE_REGION_MATCH_BAR             1
+#define PCIE_REGION_MATCH_ADDR            0
+
+#define PCIE_REGION_ENABLE_BITMASK        BIT(31)
+#define PCIE_REGION_ENABLE_BIT            BIT(31)
+#define PCIE_REGION_MODE_BITMASK          BIT(30)
+#define PCIE_REGION_MODE_BIT              BIT(30)
+
+#define PCIE_REGION_BAR_NUM_BITMASK       GENMASK(10, 8)
+#define PCIE_REGION_BAR_NUM_SHIFT         8
+
+#define PCIE_REGION_INBOUND_TYPE          0x100
+#define PCIE_REGION_INBOUND_CTRL          0x104
+#define PCIE_REGION_INBOUND_ADDR_LO       0x114
+#define PCIE_REGION_INBOUND_ADDR_HI       0x118
+
+static void iatu_write(void __iomem *iatu, u32 bar, u32 offset, u32 value)
+{
+	u32 bar_base = PCIE_IATU_BASE_ADDR + bar * PCIE_IATU_BAR_ADDR_INC;
+
+	writel(value, iatu + bar_base + offset);
+}
+
+static u32 iatu_read(void __iomem *iatu, u32 bar, u32 offset)
+{
+	u32 bar_base = PCIE_IATU_BASE_ADDR + bar * PCIE_IATU_BAR_ADDR_INC;
+
+	return readl(iatu + bar_base + offset);
+}
+
+static int iatu_map_bar(void __iomem *iatu, u32 bar, u64 axi_addr)
+{
+	u32 addr_hi = axi_addr >> 32;
+	u32 addr_lo = axi_addr & 0xffffffff;
+	u32 val;
+
+	iatu_write(iatu, bar + 9, PCIE_REGION_INBOUND_ADDR_LO, addr_lo);
+	iatu_write(iatu, bar + 9, PCIE_REGION_INBOUND_ADDR_HI, addr_hi);
+	iatu_write(iatu, bar + 9, PCIE_REGION_INBOUND_TYPE,
+				  PCIE_REGION_TYPE_MEM);
+
+	val = PCIE_REGION_ENABLE_BIT |
+	      PCIE_REGION_MODE_BIT |
+	      bar << PCIE_REGION_BAR_NUM_SHIFT;
+	iatu_write(iatu, bar + 9, PCIE_REGION_INBOUND_CTRL, val);
+
+	/* sanity check */
+	val = iatu_read(iatu, bar + 9, PCIE_REGION_INBOUND_ADDR_LO);
+	if (val != addr_lo) {
+		pr_err("%s : %u\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	val = iatu_read(iatu, bar + 9, PCIE_REGION_INBOUND_ADDR_HI);
+	if (val != addr_hi) {
+		pr_err("%s : %u\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int jemo_pcie_init(struct pci_dev *pdev)
+{
+	void __iomem *iatu;
+	int ret;
+
+	/* Bar 4 is PCIe iATU */
+	iatu = pci_iomap(pdev, 4, 0);
+	if (!iatu)
+		return -ENOMEM;
+
+	ret = iatu_map_bar(iatu, 0, 0x10000000);
+	if (ret)
+		return ret;
+
+	ret = iatu_map_bar(iatu, 1, 0x00000000);
+	if (ret)
+		return ret;
+
+	ret = iatu_map_bar(iatu, 2, 0x10000000);
+	if (ret)
+		return ret;
+
+	pci_iounmap(pdev, iatu);
+
+	dev_info(&pdev->dev, "PCIe iATU init done\n");
+
+	return 0;
+}
-- 
2.43.0

