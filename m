Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E127FE295
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D0410E684;
	Wed, 29 Nov 2023 22:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCAA10E688
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 22:02:56 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701295374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1yRcYeARMB81Dlf07igmU59Jo/Xm98e5uimkNu4pXo=;
 b=hBwk9E2x1mwVZaGFl4sJuvhTDJq502/lFRsqjZBSxrMW4eWsrAPr/YmljLAw6cPLq5KiBs
 pkDqsvmBF0w614+utgqNrvw0iJuQoTsqxIbwY3DXFmGM2UeR4gL02L9huwdMmEE8eAay3S
 Rnx/Vd9L64f+8GV5Y45YG9CYdSMqynA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [etnaviv-next v12 7/8] drm/etnaviv: Add support for the JingJia Macro
 and LingJiu PCI(e) GPUs
Date: Thu, 30 Nov 2023 06:02:30 +0800
Message-Id: <20231129220231.12763-8-sui.jingfeng@linux.dev>
In-Reply-To: <20231129220231.12763-1-sui.jingfeng@linux.dev>
References: <20231129220231.12763-1-sui.jingfeng@linux.dev>
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested on X86-64 with JM9100 GPU, the JM9100 discrete GPU has only one
vivante GPU found so far.

$ sudo dmesg | grep etnaviv

 etnaviv 0000:0d:00.0: enabling device (0000 -> 0003)
 etnaviv 0000:0d:00.0: Unbalanced pm_runtime_enable!
 etnaviv 0000:0d:00.0: model: GC9200, revision: 6304
 [drm] Initialized etnaviv 1.3.0 20151214 for 0000:0d:00.0 on minor 0

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 112 +++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
index 37de661844d8..b55ee6dd723e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -6,10 +6,109 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_pci_drv.h"
 
+enum etnaviv_pci_gpu_chip_id {
+	GC_CORE_UNKNOWN = 0,
+	JM9100 = 1,
+	JD9230P = 2,
+	LINGJIU_GP102 = 3,
+	GC1000_IN_LS7A1000 = 4,
+	GC1000_IN_LS2K1000 = 5,
+	GC_CORE_PCI_LAST,
+};
+
+struct etnaviv_pci_gpu_platform_data {
+	enum etnaviv_pci_gpu_chip_id chip_id;
+	u32 num_core;
+	u32 num_vram;
+	u32 vram_bars[2];
+	u32 mmio_bar;
+	struct {
+		u32 id;
+		u32 offset;
+		u32 size;
+		char name[20];
+	} cores[ETNA_MAX_PIPES];
+
+	bool has_dedicated_vram;
+	bool no_clk;
+	bool share_irq;
+	char name[24];
+};
+
+static const struct etnaviv_pci_gpu_platform_data
+gc_core_plaform_data[GC_CORE_PCI_LAST] = {
+	{
+		.chip_id = GC_CORE_UNKNOWN,
+	},
+	{
+		.chip_id = JM9100,
+		.num_core = 1,
+		.num_vram = 2,
+		.vram_bars = {0, 2},
+		.mmio_bar = 1,
+		.cores = {{0, 0x00900000, 0x00010000, "etnaviv-gpu,3d"},},
+		.has_dedicated_vram = true,
+		.no_clk = true,
+		.share_irq = true,
+		.name = "JingJia Micro JM9100",
+	},
+	{
+		.chip_id = JD9230P,
+		.num_core = 2,
+		.num_vram = 2,
+		.vram_bars = {0, 2},
+		.mmio_bar = 1,
+		.cores = {{0, 0x00900000, 0x00010000, "etnaviv-gpu,3d"},
+			  {1, 0x00910000, 0x00010000, "etnaviv-gpu,3d"},},
+		.has_dedicated_vram = true,
+		.no_clk = true,
+		.share_irq = true,
+		.name = "JingJia Micro JD9230P",
+	},
+	{
+		.chip_id = LINGJIU_GP102,
+		.num_core = 2,
+		.num_vram = 1,
+		.vram_bars = {0,},
+		.mmio_bar = 2,
+		.cores = {{0, 0x00040000, 0x00010000, "etnaviv-gpu,3d"},
+			  {0, 0x000C0000, 0x00010000, "etnaviv-gpu,2d"},},
+		.has_dedicated_vram = true,
+		.no_clk = true,
+		.share_irq = true,
+		.name = "LingJiu GP102",
+	},
+	{
+		.chip_id = GC1000_IN_LS7A1000,
+		.num_core = 1,
+		.num_vram = 1,
+		.vram_bars = {2, 0},
+		.mmio_bar = 0,
+		.cores = {{0, 0, 0, "etnaviv-gpu,3d"}, {}, {}, {}},
+		.has_dedicated_vram = true,
+		.no_clk = true,
+		.share_irq = true,
+		.name = "GC1000 in LS7A1000",
+	},
+	{
+		.chip_id = GC1000_IN_LS2K1000,
+		.num_core = 1,
+		.num_vram = 0,
+		.mmio_bar = 0,
+		.cores = {{0, 0, 0, "etnaviv-gpu,3d"}, {}, {}, {}},
+		.has_dedicated_vram = false,
+		.no_clk = true,
+		.share_irq = true,
+		.name = "GC1000 in LS2K1000",
+	},
+};
+
 static int etnaviv_pci_probe(struct pci_dev *pdev,
 			     const struct pci_device_id *ent)
 {
+	enum etnaviv_pci_gpu_chip_id chip_id = ent->driver_data;
 	struct device *dev = &pdev->dev;
+	const struct etnaviv_pci_gpu_platform_data *pdata;
 	void __iomem *mmio;
 	int ret;
 
@@ -25,11 +124,15 @@ static int etnaviv_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
+	pdata = &gc_core_plaform_data[chip_id];
+
 	/* PCI bar 0 contain the MMIO registers */
-	mmio = pcim_iomap(pdev, 0, 0);
+	mmio = pcim_iomap(pdev, pdata->mmio_bar, 0);
 	if (IS_ERR(mmio))
 		return PTR_ERR(mmio);
 
+	mmio += pdata->cores[0].offset;
+
 	ret = etnaviv_gpu_driver_create(dev, mmio, pdev->irq, false, false);
 	if (ret)
 		return ret;
@@ -49,8 +152,11 @@ static void etnaviv_pci_remove(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id etnaviv_pci_id_lists[] = {
-	{PCI_VDEVICE(LOONGSON, 0x7a15)},
-	{PCI_VDEVICE(LOONGSON, 0x7a05)},
+	{0x0731, 0x9100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, JM9100},
+	{0x0731, 0x9230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, JD9230P},
+	{0x0709, 0x0001, PCI_ANY_ID, PCI_ANY_ID, 0, 0, LINGJIU_GP102},
+	{PCI_VDEVICE(LOONGSON, 0x7a15), GC1000_IN_LS7A1000},
+	{PCI_VDEVICE(LOONGSON, 0x7a05), GC1000_IN_LS2K1000},
 	{ }
 };
 
-- 
2.34.1

