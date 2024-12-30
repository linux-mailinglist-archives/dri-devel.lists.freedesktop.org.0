Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E429FEEC2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B5410E63B;
	Tue, 31 Dec 2024 10:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CF4A10E055
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 09:39:24 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.63])
 by gateway (Coremail) with SMTP id _____8AxUa9naHJnDM9bAA--.50181S3;
 Mon, 30 Dec 2024 17:31:19 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
 by front1 (Coremail) with SMTP id qMiowMCxncVkaHJnp74NAA--.4295S3;
 Mon, 30 Dec 2024 17:31:18 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, dri-devel@lists.freedesktop.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH v1 1/4] mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core driver
Date: Mon, 30 Dec 2024 17:31:08 +0800
Message-ID: <074e91224f0e48861e11954dc80c92de322906a2.1735550269.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1735550269.git.zhoubinbin@loongson.cn>
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMCxncVkaHJnp74NAA--.4295S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XrykWrWDAw1kJr4xKFWDJrc_yoW7uw43pF
 n3Jay5CF4kXF47GrsxWr1UCFsxua9Yya4jqrsrJ34avayay34UZ348tF9xZryDGryq9ry7
 tFWYyw1jkFs8JabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
 AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGPUUUUU==
X-Mailman-Approved-At: Tue, 31 Dec 2024 10:34:56 +0000
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

The Loongson-2K Board Management Controller provides an PCIe
interface to the host to access the feature implemented in the BMC.

The BMC is assembled on a server similar to the server machine with
Loongson-3C6000 CPUs. It supports multiple sub-devices like DRM.

Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mfd/Kconfig       |  15 ++++
 drivers/mfd/Makefile      |   2 +
 drivers/mfd/ls2kbmc-mfd.c | 145 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/mfd/ls2kbmc-mfd.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ae23b317a64e..97d9d52b7e8a 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2414,5 +2414,20 @@ config MFD_RSMU_SPI
 	  Additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_LS2K_BMC
+	tristate "Loongson-2K Board Management Controller Support"
+	depends on LOONGARCH
+	select MFD_CORE
+	help
+	  Say yes here to add support for the Loongson-2K BMC
+	  which is a Board Management Controller connected to the PCIe bus.
+	  The device supports multiple sub-devices like DRM.
+	  This driver provides common support for accessing the devices;
+	  additional drivers must be enabled in order to use the
+	  functionality of the BMC device.
+
+	  This driver can also be built as a module. If so the module
+	  will be called ls2kbmc-mfd.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e057d6d6faef..3faec9638303 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -290,3 +290,5 @@ obj-$(CONFIG_MFD_ATC260X_I2C)	+= atc260x-i2c.o
 
 obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu_i2c.o rsmu_core.o
 obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
+
+obj-$(CONFIG_MFD_LS2K_BMC)	+= ls2kbmc-mfd.o
diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
new file mode 100644
index 000000000000..2912112c41c8
--- /dev/null
+++ b/drivers/mfd/ls2kbmc-mfd.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Loongson-2K Board Management Controller (BMC) MFD Core Driver.
+ *
+ * Copyright (C) 2024 Loongson Technology Corporation Limited.
+ *
+ * Originally written by Chong Qiao <qiaochong@loongson.cn>
+ * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+#include <linux/platform_device.h>
+
+static struct resource ls2k_display_resources[] = {
+	{
+		.name	= "ls2kbmc-simplebuf-res",
+		.start	= SZ_16M + SZ_2M,
+		.end	= SZ_16M + SZ_2M + SZ_4M - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct resource ls2k_ipmi0_resources[] = {
+	{
+		.name	= "ipmi-res0",
+		.start	= SZ_16M + 0x00f00000,
+		.end	= SZ_16M + 0x00f00000 + 0x1c - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct resource ls2k_ipmi1_resources[] = {
+	{
+		.name	= "ipmi-res1",
+		.start	= SZ_16M + 0x00f00000 + 0x1c,
+		.end	= SZ_16M + 0x00f00000 + 0x1c * 2 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct resource ls2k_ipmi2_resources[] = {
+	{
+		.name	= "ipmi-res2",
+		.start	= SZ_16M + 0x00f00000 + 0x1c * 2,
+		.end	= SZ_16M + 0x00f00000 + 0x1c * 3 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct resource ls2k_ipmi3_resources[] = {
+	{
+		.name	= "ipmi-res3",
+		.start	= SZ_16M + 0x00f00000 + 0x1c * 3,
+		.end	= SZ_16M + 0x00f00000 + 0x1c * 4 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct resource ls2k_ipmi4_resources[] = {
+	{
+		.name	= "ipmi-res4",
+		.start	= SZ_16M + 0x00f00000 + 0x1c * 4,
+		.end	= SZ_16M + 0x00f00000 + 0x1c * 5 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct mfd_cell ls2k_bmc_cells[] = {
+	{
+		.name = "ls2kbmc-framebuffer",
+		.num_resources = ARRAY_SIZE(ls2k_display_resources),
+		.resources = ls2k_display_resources,
+	},
+	{
+		.name = "ls2k-ipmi-si",
+		.num_resources = ARRAY_SIZE(ls2k_ipmi0_resources),
+		.resources = ls2k_ipmi0_resources,
+	},
+	{
+		.name = "ls2k-ipmi-si",
+		.num_resources = ARRAY_SIZE(ls2k_ipmi1_resources),
+		.resources = ls2k_ipmi1_resources,
+	},
+	{
+		.name = "ls2k-ipmi-si",
+		.num_resources = ARRAY_SIZE(ls2k_ipmi2_resources),
+		.resources = ls2k_ipmi2_resources,
+	},
+	{
+		.name = "ls2k-ipmi-si",
+		.num_resources = ARRAY_SIZE(ls2k_ipmi3_resources),
+		.resources = ls2k_ipmi3_resources,
+	},
+	{
+		.name = "ls2k-ipmi-si",
+		.num_resources = ARRAY_SIZE(ls2k_ipmi4_resources),
+		.resources = ls2k_ipmi4_resources,
+	},
+};
+
+static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	int ret = 0;
+
+	ret = pci_enable_device(dev);
+	if (ret)
+		return ret;
+
+	ls2k_bmc_cells[0].platform_data = &dev;
+	ls2k_bmc_cells[0].pdata_size = sizeof(dev);
+
+	return devm_mfd_add_devices(&dev->dev, PLATFORM_DEVID_AUTO,
+				    ls2k_bmc_cells, ARRAY_SIZE(ls2k_bmc_cells),
+				    &dev->resource[0], 0, NULL);
+}
+
+static void ls2k_bmc_remove(struct pci_dev *dev)
+{
+	pci_disable_device(dev);
+}
+
+static struct pci_device_id ls2k_bmc_devices[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
+
+static struct pci_driver ls2k_bmc_driver = {
+	.name = "ls2k-bmc",
+	.id_table = ls2k_bmc_devices,
+	.probe = ls2k_bmc_probe,
+	.remove = ls2k_bmc_remove,
+};
+
+module_pci_driver(ls2k_bmc_driver);
+
+MODULE_DESCRIPTION("Loongson-2K BMC driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_LICENSE("GPL");
-- 
2.43.5

