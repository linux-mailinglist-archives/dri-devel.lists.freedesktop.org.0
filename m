Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8282808A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1387510E3D0;
	Tue,  9 Jan 2024 08:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DD6410E3D0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:24:01 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id D615E1C06CD;
 Tue,  9 Jan 2024 17:23:58 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v6 11/37] pci: pci-sh7751: Add SH7751 PCI driver
Date: Tue,  9 Jan 2024 17:23:08 +0900
Message-Id: <8933a4a81bc6c8f11d5399e6ca85362364fd2752.1704788539.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704788539.git.ysato@users.sourceforge.jp>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Renesas SH7751 CPU Internal PCI Controller driver.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/pci/controller/Kconfig      |   9 +
 drivers/pci/controller/Makefile     |   1 +
 drivers/pci/controller/pci-sh7751.c | 392 ++++++++++++++++++++++++++++
 3 files changed, 402 insertions(+)
 create mode 100644 drivers/pci/controller/pci-sh7751.c

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index e534c02ee34f..a2fd917a2e03 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -353,6 +353,15 @@ config PCIE_XILINX_CPM
 	  Say 'Y' here if you want kernel support for the
 	  Xilinx Versal CPM host bridge.
 
+config PCI_SH7751
+	bool "Renesas SH7751 PCI controller"
+	depends on OF
+	depends on CPU_SUBTYPE_SH7751 || CPU_SUBTYPE_SH7751R || COMPILE_TEST
+	select PCI_HOST_COMMON
+	help
+	  Say 'Y' here if you want kernel to support the Renesas SH7751 PCI
+	  Host Bridge driver.
+
 source "drivers/pci/controller/cadence/Kconfig"
 source "drivers/pci/controller/dwc/Kconfig"
 source "drivers/pci/controller/mobiveil/Kconfig"
diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
index f2b19e6174af..aa97e5d74e58 100644
--- a/drivers/pci/controller/Makefile
+++ b/drivers/pci/controller/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
 obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
 obj-$(CONFIG_PCIE_APPLE) += pcie-apple.o
 obj-$(CONFIG_PCIE_MT7621) += pcie-mt7621.o
+obj-$(CONFIG_PCI_SH7751) += pci-sh7751.o
 
 # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
 obj-y				+= dwc/
diff --git a/drivers/pci/controller/pci-sh7751.c b/drivers/pci/controller/pci-sh7751.c
new file mode 100644
index 000000000000..ed3de9b35835
--- /dev/null
+++ b/drivers/pci/controller/pci-sh7751.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SH7751 PCI driver
+ * Copyright (C) 2023 Yoshinori Sato
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_pci.h>
+#include <linux/of_platform.h>
+#include <linux/pci-ecam.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/pci.h>
+#include <linux/dma-direct.h>
+#include <asm/addrspace.h>
+
+/* PCICR and PCICLKCR write enable magic key */
+#define PCIC_WE_KEY		(0xa5 << 24)
+
+/* PCIC registers */
+/* 0x0000 - 0x00ff mapped to PCI device configuration space */
+#define PCIC_PCICR		0x100	/* PCI Control Register */
+#define PCIC_PCICR_TRSB		BIT(9)	/* Target Read Single */
+#define PCIC_PCICR_BSWP		BIT(8)	/* Target Byte Swap */
+#define PCIC_PCICR_PLUP		BIT(7)	/* Enable PCI Pullup */
+#define PCIC_PCICR_ARBM		BIT(6)	/* PCI Arbitration Mode */
+#define PCIC_PCICR_MD10		BIT(5)	/* MD10 status */
+#define PCIC_PCICR_MD9		BIT(4)	/* MD9 status */
+#define PCIC_PCICR_SERR		BIT(3)	/* SERR output assert */
+#define PCIC_PCICR_INTA		BIT(2)	/* INTA output assert */
+#define PCIC_PCICR_PRST		BIT(1)	/* PCI Reset Assert */
+#define PCIC_PCICR_CFIN		BIT(0)	/* Central Fun. Init Done */
+
+#define PCIC_PCILSR0		0x104	/* PCI Local Space Register0 */
+#define PCIC_PCILSR1		0x108	/* PCI Local Space Register1 */
+#define PCIC_PCILAR0		0x10c	/* PCI Local Addr Register1 */
+#define PCIC_PCILAR1		0x110	/* PCI Local Addr Register1 */
+#define PCIC_PCIINT		0x114	/* PCI Interrupt Register */
+#define PCIC_PCIINTM		0x118	/* PCI Interrupt Mask */
+#define PCIC_PCIALR		0x11c	/* Error Address Register */
+#define PCIC_PCICLR		0x120	/* Error Command/Data */
+#define PCIC_PCIAINT		0x130	/* Arbiter Interrupt Register */
+#define PCIC_PCIAINTM		0x134	/* Arbiter Int. Mask Register */
+#define PCIC_PCIBMLR		0x138	/* Error Bus Master Register */
+#define PCIC_PCIDMABT		0x140	/* DMA Transfer Arb. Register */
+#define PCIC_PCIPAR		0x1c0	/* PIO Address Register */
+#define PCIC_PCIMBR		0x1c4	/* Memory Base Address */
+#define PCIC_PCIIOBR		0x1c8	/* I/O Base Address Register */
+
+#define PCIC_PCIPINT		0x1cc	/* Power Mgmnt Int. Register */
+#define PCIC_PCIPINT_D3		BIT(1)	/* D3 Pwr Mgmt. Interrupt */
+#define PCIC_PCIPINT_D0		BIT(0)	/* D0 Pwr Mgmt. Interrupt */
+
+#define PCIC_PCIPINTM		0x1d0	/* Power Mgmnt Mask Register */
+#define PCIC_PCICLKR		0x1d4	/* Clock Ctrl. Register */
+#define PCIC_PCIBCR1		0x1e0	/* Memory BCR1 Register */
+#define PCIC_PCIBCR2		0x1e4	/* Memory BCR2 Register */
+#define PCIC_PCIWCR1		0x1e8	/* Wait Control 1 Register */
+#define PCIC_PCIWCR2		0x1ec	/* Wait Control 2 Register */
+#define PCIC_PCIWCR3		0x1f0	/* Wait Control 3 Register */
+#define PCIC_PCIMCR		0x1f4	/* Memory Control Register */
+#define PCIC_PCIBCR3		0x1f8	/* Memory BCR3 Register */
+#define PCIC_PCIPDR		0x220	/* Port IO Data Register */
+
+/* PCI IDs */
+/* Hitachi is the company that led to Renesas. */
+/* The SH7751 was designed by Hitachi, so it has a Hitachi ID. */
+#define PCI_VENDOR_ID_HITACHI	0x1054
+#define PCI_DEVICE_ID_SH7751	0x3505
+#define PCI_DEVICE_ID_SH7751R	0x350e
+
+/* BSC registers */
+/* Copy BSC setting to PCI BSC */
+#define BSC_BCR1		0x0000
+#define BSC_BCR1_SLAVE		BIT(30)
+#define BSC_BCR1_BRQEN		BIT(19)
+#define BSC_BCR2		0x0004
+#define BSC_BCR3		0x0050
+#define BSC_WCR1		0x0008
+#define BSC_WCR2		0x000c
+#define BSC_WCR3		0x0010
+#define BSC_MCR			0x0014
+#define BSC_MCR_MRSET		BIT(30)
+#define BSC_MCR_RFSH		BIT(2)
+
+/* PCIC access wrapper */
+#define pcic_writel(val, base, reg)	writel(val, base + (reg))
+#define pcic_readl(base, reg)		readl(base + (reg))
+
+/*
+ * PCIC fixups
+ */
+
+static void pcic_fixups(struct device *dev, void __iomem *pcic)
+{
+	struct property *prop_bar;
+	const __be32 *cur;
+	u32 bar;
+	u32 word;
+
+	if (of_property_read_bool(dev->of_node, "renesas,bus-arbit-round-robin"))
+		pcic_writel(BIT(0), pcic, PCIC_PCIDMABT);
+	else
+		pcic_writel(BIT(0), pcic, PCIC_PCIDMABT);
+
+	of_property_for_each_u32(dev->of_node, "pci-bar", prop_bar, cur, bar) {
+		if (bar >= 6) {
+			dev_err(dev, "invalid BAR %d\n", bar);
+			continue;
+		}
+		cur = of_prop_next_u32(prop_bar, cur, &word);
+		if (!cur) {
+			dev_warn(dev, "Missing BAR value %d\n", bar);
+			break;
+		}
+		pcic_writel(word, pcic, PCI_BASE_ADDRESS_0 + bar * 4);
+	}
+}
+
+/*
+ * We need to avoid collisions with `mirrored' VGA ports
+ * and other strange ISA hardware, so we always want the
+ * addresses to be allocated in the 0x000-0x0ff region
+ * modulo 0x400.
+ */
+#define IO_REGION_BASE 0x1000
+resource_size_t pcibios_align_resource(void *data, const struct resource *res,
+				resource_size_t size, resource_size_t align)
+{
+	resource_size_t start = res->start;
+
+	if (res->flags & IORESOURCE_IO) {
+		if (start < PCIBIOS_MIN_IO + IO_REGION_BASE)
+			start = PCIBIOS_MIN_IO + IO_REGION_BASE;
+
+		/*
+		 * Put everything into 0x00-0xff region modulo 0x400.
+		 */
+		if (start & 0x300)
+			start = (start + 0x3ff) & ~0x3ff;
+	}
+
+	return start;
+}
+
+static int setup_pci_bsc(struct device *dev, void __iomem *pcic,
+			 void __iomem *bsc, unsigned int area, bool bcr3)
+{
+	u32 word;
+
+	word = __raw_readl(bsc + BSC_BCR1);
+	/* check BCR for SDRAM in area */
+	if (((word >> area) & 1) == 0) {
+		dev_err(dev, "Area %u is not configured for SDRAM. BCR1=0x%x\n",
+			area, word);
+		return -EINVAL;
+	}
+	word |= BSC_BCR1_SLAVE;		/* PCIC BSC is slave only */
+	pcic_writel(word, pcic, PCIC_PCIBCR1);
+
+	word = __raw_readw(bsc + BSC_BCR2);
+	/* check BCR2 for 32bit SDRAM interface*/
+	if (((word >> (area << 1)) & 0x3) != 0x3) {
+		dev_err(dev, "Area %u is not 32 bit SDRAM. BCR2=0x%x\n",
+			area, word);
+		return -EINVAL;
+	}
+	pcic_writel(word, pcic, PCIC_PCIBCR2);
+
+	if (bcr3) {
+		/* BCR3 have only SH7751R */
+		word = __raw_readw(bsc + BSC_BCR3);
+		pcic_writel(word, pcic, PCIC_PCIBCR3);
+	}
+
+	/* configure the wait control registers */
+	word = __raw_readl(bsc + BSC_WCR1);
+	pcic_writel(word, pcic, PCIC_PCIWCR1);
+	word = __raw_readl(bsc + BSC_WCR2);
+	pcic_writel(word, pcic, PCIC_PCIWCR2);
+	word = __raw_readl(bsc + BSC_WCR3);
+	pcic_writel(word, pcic, PCIC_PCIWCR3);
+	word = __raw_readl(bsc + BSC_MCR);
+	/* Clear MRSET and RFSH bit */
+	word &= ~(BSC_MCR_MRSET | BSC_MCR_RFSH);
+	pcic_writel(word, pcic, PCIC_PCIMCR);
+
+	return 0;
+}
+
+#define NUM_LAR 2
+#define NUM_AREA 7
+
+static int set_dma_ranges(struct device *dev,
+			  void __iomem *pcic, void __iomem *bsc, bool bcr3)
+{
+	struct of_pci_range_parser parser;
+	struct of_pci_range range;
+	u32 bsc_done[NUM_AREA];
+	unsigned int area;
+	unsigned int reg;
+	u32 word;
+
+	if (of_pci_dma_range_parser_init(&parser, dev->of_node)) {
+		dev_err(dev, "Invalid dma-ranges property\n");
+		return -EINVAL;
+	}
+
+	pcic_writel(0, pcic, PCIC_PCILAR0);
+	pcic_writel(0, pcic, PCIC_PCILAR1);
+	reg = 0;
+	memset(&bsc_done, 0, sizeof(bsc_done));
+	for_each_of_pci_range(&parser, &range) {
+		dev_dbg(dev, "REG %d: DMA START - 0x%08llx, DMA SIZE - 0x%08llx\n",
+			reg, range.cpu_addr, range.size);
+
+		if (reg >= NUM_LAR) {
+			/* PCIC have two local address registers. */
+			dev_info(dev, "Out of dma-ranges");
+			break;
+		}
+		area = (range.cpu_addr >> 26) & 0x07;
+		if (area >= NUM_AREA) {
+			/* Area 7 is reserved. */
+			dev_info(dev, "Invalid local address 0x%08llx. Ignore it.\n",
+				 range.cpu_addr);
+			continue;
+		}
+
+		pcic_writel(range.size - 1, pcic, PCIC_PCILSR0 + reg * 4);
+		word = P2SEGADDR(range.cpu_addr);
+		pcic_writel(word, pcic, PCIC_PCILAR0 + reg * 4);
+		pcic_writel(word, pcic, PCI_BASE_ADDRESS_1 + reg * 4);
+
+		if (!bsc_done[area]) {
+			/* check BCR for SDRAM in specified area. And setup PCI BSC. */
+			if (setup_pci_bsc(dev, pcic, bsc, area, bcr3))
+				return -EINVAL;
+			bsc_done[area] = 1;
+		}
+		reg++;
+	}
+	return 0;
+}
+
+#define CMD_PREFIX "pci-command-reg-"
+static u32 command_flags(struct device_node *np)
+{
+	static const char * const bit_name[] = {
+		CMD_PREFIX "io-space",
+		CMD_PREFIX "memory-space",
+		CMD_PREFIX "bus-master",
+		CMD_PREFIX "special-cycle",
+		CMD_PREFIX "write-invalidate",
+		CMD_PREFIX "vga-snoop",
+		CMD_PREFIX "parity-error-response",
+		CMD_PREFIX "sleeping-control",
+		CMD_PREFIX "serr",
+		CMD_PREFIX "fast-back-to-back",
+	};
+	unsigned int i;
+	u32 ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(bit_name); i++) {
+		if (of_property_read_bool(np, bit_name[i]))
+			ret |= BIT(i);
+	}
+
+	return ret;
+}
+
+
+static int sh7751_pci_probe(struct platform_device *pdev)
+{
+	struct resource *res, *bscres;
+	void __iomem *pcic;
+	void __iomem *bsc;
+	u16 vid, did;
+	u32 word;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR(res))
+		return PTR_ERR(res);
+	pcic = ioremap(res->start, res->end - res->start + 1);
+
+	bscres = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	bsc = devm_ioremap_resource(&pdev->dev, bscres);
+	if (IS_ERR(bsc))
+		return PTR_ERR(bsc);
+
+	/* check for SH7751/SH7751R hardware */
+	word = pcic_readl(pcic, PCI_VENDOR_ID);
+	vid = word & 0xffff;
+	did = word >> 16;
+	if ((vid != PCI_VENDOR_ID_HITACHI) ||
+	    ((did != PCI_DEVICE_ID_SH7751) &&
+	     (did != PCI_DEVICE_ID_SH7751R))) {
+		dev_err(&pdev->dev, "This is not an SH7751(R)\n");
+		return -ENODEV;
+	}
+	dev_info(&pdev->dev, "PCI core found at %pR\n", res);
+
+	/* Set the BCR's to enable PCI access */
+	word = __raw_readl(bsc + BSC_BCR1);
+	word |= BSC_BCR1_BRQEN;
+	__raw_writel(word, bsc + BSC_BCR1);
+
+	/* Turn the clocks back on (not done in reset)*/
+	pcic_writel(PCIC_WE_KEY | 0, pcic, PCIC_PCICLKR);
+	/* Clear Powerdown IRQ's (not done in reset) */
+	word = PCIC_PCIPINT_D3 | PCIC_PCIPINT_D0;
+	pcic_writel(word, pcic, PCIC_PCIPINT);
+
+	/* set the command/status bits to */
+	word = command_flags(pdev->dev.of_node);
+	/* Clear status */
+	word |= PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT |
+		PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY |
+		PCI_STATUS_SIG_TARGET_ABORT | PCI_STATUS_PARITY;
+	pcic_writel(word, pcic, PCI_COMMAND);
+
+	/* define this host as the host bridge */
+	word = PCI_BASE_CLASS_BRIDGE << 24;
+	pcic_writel(word, pcic, PCI_CLASS_REVISION);
+
+	ret = pci_host_common_probe(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Initialize failed (%d)\n", ret);
+		return ret;
+	}
+
+	/* Set IO and Mem windows to local address */
+	if (set_dma_ranges(&pdev->dev, pcic, bsc,
+			   did == PCI_DEVICE_ID_SH7751R))
+		return -EINVAL;
+	pcic_writel(0, pcic, PCIC_PCIIOBR);
+
+	/* Override register setting */
+	pcic_fixups(&pdev->dev, pcic);
+
+	/* SH7751 init done, set central function init complete */
+	/* use round robin mode to stop a device starving/overrunning */
+	word = PCIC_PCICR_CFIN | PCIC_PCICR_ARBM;
+	pcic_writel(PCIC_WE_KEY | word, pcic, PCIC_PCICR);
+
+	return 0;
+}
+
+/*
+ * Direct access to PCI hardware...
+ */
+#define CONFIG_CMD(bus, devfn, where) \
+	(0x80000000 | (bus->number << 16) | (devfn << 8) | (where & ~3))
+
+static void __iomem *sh4_pci_map_bus(struct pci_bus *bus,
+				     unsigned int devfn, int where)
+{
+	struct pci_config_window *cfg = bus->sysdata;
+	void __iomem *pcic = (void __iomem *)cfg->res.start;
+
+	pcic_writel(CONFIG_CMD(bus, devfn, where), pcic, PCIC_PCIPAR);
+	return pcic + PCIC_PCIPDR;
+}
+
+static const struct pci_ecam_ops pci_sh7751_bus_ops = {
+	.pci_ops	= {
+		.map_bus = sh4_pci_map_bus,
+		.read    = pci_generic_config_read32,
+		.write   = pci_generic_config_write32,
+	}
+};
+
+static const struct of_device_id sh7751_pci_of_match[] = {
+	{ .compatible = "renesas,sh7751-pci",
+	  .data = &pci_sh7751_bus_ops },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sh7751_pci_of_match);
+
+static struct platform_driver sh7751_pci_driver = {
+	.driver = {
+		.name = "sh7751-pci",
+		.of_match_table = sh7751_pci_of_match,
+	},
+	.probe = sh7751_pci_probe,
+};
+module_platform_driver(sh7751_pci_driver);
+
+MODULE_DESCRIPTION("SH7751 PCI driver");
-- 
2.39.2

