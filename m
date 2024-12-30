Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD3E9FEEC4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572E010E63C;
	Tue, 31 Dec 2024 10:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24DA110E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 09:36:23 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.63])
 by gateway (Coremail) with SMTP id _____8Dxfa9taHJnHM9bAA--.25644S3;
 Mon, 30 Dec 2024 17:31:25 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
 by front1 (Coremail) with SMTP id qMiowMCxncVkaHJnp74NAA--.4295S4;
 Mon, 30 Dec 2024 17:31:19 +0800 (CST)
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
Subject: [PATCH v1 2/4] ipmi: Add Loongson-2K BMC support
Date: Mon, 30 Dec 2024 17:31:09 +0800
Message-ID: <a4cfdeed1a91a7a12c7ebe56bed2ba94991c4065.1735550269.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1735550269.git.zhoubinbin@loongson.cn>
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMCxncVkaHJnp74NAA--.4295S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XFyUJF17Ar45KFW7Ary8CrX_yoW3tw4Upa
 15K34kCw48tF47K3srJrykZFWrJr93Wa45tFW7X3yfurW3try0grn2yFy3ZF9rKFyDKF13
 tFZ8Ar43WFW7A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
 AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1mii3UUUUU==
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

This patch adds Loongson-2K BMC IPMI support.

According to the existing design, we use software simulation to
implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.

Also since both host side and BMC side read and write kcs status, I use
fifo pointer to ensure data consistency.

Therefore I made the whole IPMI driver independent.

Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmi_si.h      |   8 +
 drivers/char/ipmi/ipmi_si_intf.c |   3 +
 drivers/char/ipmi/ipmi_si_ls2k.c | 250 +++++++++++++++++++++++++++++++
 4 files changed, 262 insertions(+)
 create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c

diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index e0944547c9d0..614be45863b4 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -7,6 +7,7 @@ ipmi_si-y := ipmi_si_intf.o ipmi_kcs_sm.o ipmi_smic_sm.o ipmi_bt_sm.o \
 	ipmi_si_hotmod.o ipmi_si_hardcode.o ipmi_si_platform.o \
 	ipmi_si_mem_io.o
 ipmi_si-$(CONFIG_HAS_IOPORT) += ipmi_si_port_io.o
+ipmi_si-$(CONFIG_LOONGARCH) += ipmi_si_ls2k.o
 ipmi_si-$(CONFIG_PCI) += ipmi_si_pci.o
 ipmi_si-$(CONFIG_PARISC) += ipmi_si_parisc.o
 
diff --git a/drivers/char/ipmi/ipmi_si.h b/drivers/char/ipmi/ipmi_si.h
index a7ead2a4c753..0a4af352a42c 100644
--- a/drivers/char/ipmi/ipmi_si.h
+++ b/drivers/char/ipmi/ipmi_si.h
@@ -101,6 +101,14 @@ static inline void ipmi_si_parisc_init(void) { }
 static inline void ipmi_si_parisc_shutdown(void) { }
 #endif
 
+#ifdef CONFIG_LOONGARCH
+void ipmi_si_ls2k_init(void);
+void ipmi_si_ls2k_shutdown(void);
+#else
+static inline void ipmi_si_ls2k_init(void) { }
+static inline void ipmi_si_ls2k_shutdown(void) { }
+#endif
+
 int ipmi_si_port_setup(struct si_sm_io *io);
 int ipmi_si_mem_setup(struct si_sm_io *io);
 
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index eea23a3b966e..7227bc61be79 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2108,6 +2108,7 @@ static int __init init_ipmi_si(void)
 	ipmi_si_pci_init();
 
 	ipmi_si_parisc_init();
+	ipmi_si_ls2k_init();
 
 	/* We prefer devices with interrupts, but in the case of a machine
 	   with multiple BMCs we assume that there will be several instances
@@ -2292,6 +2293,8 @@ static void cleanup_ipmi_si(void)
 
 	ipmi_si_platform_shutdown();
 
+	ipmi_si_ls2k_shutdown();
+
 	mutex_lock(&smi_infos_lock);
 	list_for_each_entry_safe(e, tmp_e, &smi_infos, link)
 		cleanup_one_si(e);
diff --git a/drivers/char/ipmi/ipmi_si_ls2k.c b/drivers/char/ipmi/ipmi_si_ls2k.c
new file mode 100644
index 000000000000..cb31bb989fca
--- /dev/null
+++ b/drivers/char/ipmi/ipmi_si_ls2k.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Loongson-2K BMC IPMI
+ *
+ * Copyright (C) 2024 Loongson Technology Corporation Limited.
+ *
+ * Originally written by Chong Qiao <qiaochong@loongson.cn>
+ * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
+ */
+
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include "ipmi_si.h"
+
+#define LS2K_KCS_STS_OBF	BIT(0)
+#define LS2K_KCS_STS_IBF	BIT(1)
+#define LS2K_KCS_STS_SMS_ATN	BIT(2)
+#define LS2K_KCS_STS_CMD	BIT(3)
+
+#define LS2K_KCS_DATA_MASK	(LS2K_KCS_STS_OBF | LS2K_KCS_STS_IBF | LS2K_KCS_STS_CMD)
+
+/* Read and write fifo pointers for data consistency. */
+struct ls2k_fifo_flag {
+	u8 ibfh;
+	u8 ibft;
+	u8 obfh;
+	u8 obft;
+};
+
+struct ls2k_kcs_reg {
+	u8 status;
+	u8 data_out;
+	s16 data_in;
+	s16 cmd;
+};
+
+struct ls2k_kcs_data {
+	struct ls2k_fifo_flag fifo;
+	struct ls2k_kcs_reg reg;
+	u8 cmd_data;
+	u8 version;
+	u32 write_req;
+	u32 write_ack;
+	u32 reserved[2];
+};
+
+static void ls2k_set_obf(struct ls2k_kcs_data *ik, u8 sts)
+{
+	ik->reg.status = (ik->reg.status & ~LS2K_KCS_STS_OBF) | (sts & BIT(0));
+}
+
+static void ls2k_set_ibf(struct ls2k_kcs_data *ik, u8 sts)
+{
+	ik->reg.status = (ik->reg.status & ~LS2K_KCS_STS_IBF) | ((sts & BIT(0)) << 1);
+}
+
+static u8 ls2k_get_ibf(struct ls2k_kcs_data *ik)
+{
+	return (ik->reg.status >> 1) & BIT(0);
+}
+
+static unsigned char intf_sim_inb_v0(struct ls2k_kcs_data *ik,
+				     unsigned int offset)
+{
+	u32 inb = 0;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		inb = ik->reg.data_out;
+		ls2k_set_obf(ik, 0);
+		break;
+	case 1:
+		inb = ik->reg.status;
+		break;
+	}
+
+	return inb;
+}
+
+static unsigned char intf_sim_inb_v1(struct ls2k_kcs_data *ik,
+				     unsigned int offset)
+{
+	u32 inb = 0;
+	int cmd;
+	bool obf, ibf;
+
+	obf = ik->fifo.obfh != ik->fifo.obft;
+	ibf = ik->fifo.ibfh != ik->fifo.ibft;
+	cmd = ik->cmd_data;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		inb = ik->reg.data_out;
+		ik->fifo.obft = ik->fifo.obfh;
+		break;
+	case 1:
+		inb = ik->reg.status & ~LS2K_KCS_DATA_MASK;
+		inb |= obf | (ibf << 1) | (cmd << 3);
+		break;
+	}
+
+	return inb;
+}
+
+static unsigned char ls2k_mem_inb(const struct si_sm_io *io,
+				  unsigned int offset)
+{
+	struct ls2k_kcs_data *ik = io->addr;
+	int inb = 0;
+
+	if (ik->version == 0)
+		inb = intf_sim_inb_v0(ik, offset);
+	else if (ik->version == 1)
+		inb = intf_sim_inb_v1(ik, offset);
+
+	return inb;
+}
+
+static void intf_sim_outb_v0(struct ls2k_kcs_data *ik, unsigned int offset,
+			     unsigned char val)
+{
+	if (ls2k_get_ibf(ik))
+		return;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		ik->reg.data_in = val;
+		ik->reg.status &= ~LS2K_KCS_STS_CMD;
+		break;
+
+	case 1:
+		ik->reg.cmd = val;
+		ik->reg.status |= LS2K_KCS_STS_CMD;
+		break;
+	}
+
+	ls2k_set_ibf(ik, 1);
+	ik->write_req++;
+}
+
+static void intf_sim_outb_v1(struct ls2k_kcs_data *ik, unsigned int offset,
+			     unsigned char val)
+{
+	if (ik->fifo.ibfh != ik->fifo.ibft)
+		return;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		ik->reg.data_in = val;
+		ik->cmd_data = 0;
+		break;
+
+	case 1:
+		ik->reg.cmd = val;
+		ik->cmd_data = 1;
+		break;
+	}
+
+	ik->fifo.ibfh = !ik->fifo.ibft;
+	ik->write_req++;
+}
+
+static void ls2k_mem_outb(const struct si_sm_io *io, unsigned int offset,
+			  unsigned char val)
+{
+	struct ls2k_kcs_data *ik = io->addr;
+
+	if (ik->version == 0)
+		intf_sim_outb_v0(ik, offset, val);
+	else if (ik->version == 1)
+		intf_sim_outb_v1(ik, offset, val);
+}
+
+static void ls2k_mem_cleanup(struct si_sm_io *io)
+{
+	if (io->addr)
+		iounmap(io->addr);
+}
+
+static int ipmi_ls2k_sim_setup(struct si_sm_io *io)
+{
+	io->addr = ioremap(io->addr_data, io->regspacing);
+	if (!io->addr)
+		return -EIO;
+
+	io->inputb = ls2k_mem_inb;
+	io->outputb = ls2k_mem_outb;
+	io->io_cleanup = ls2k_mem_cleanup;
+
+	return 0;
+}
+
+static int ipmi_ls2k_probe(struct platform_device *pdev)
+{
+	struct si_sm_io io;
+
+	dev_info(&pdev->dev, "probing via ls2k platform");
+	memset(&io, 0, sizeof(io));
+
+	io.addr_source	= SI_PLATFORM;
+	io.si_type	= SI_KCS;
+	io.addr_space	= IPMI_MEM_ADDR_SPACE;
+	io.io_setup	= ipmi_ls2k_sim_setup;
+	io.addr_data	= pdev->resource[0].start;
+	io.regspacing	= pdev->resource[0].end - pdev->resource[0].start + 1;
+	io.regsize	= DEFAULT_REGSIZE;
+	io.regshift	= 0;
+	io.dev		= &pdev->dev;
+	io.irq		= 0;
+	if (io.irq)
+		io.irq_setup = ipmi_std_irq_setup;
+
+	dev_info(&pdev->dev, "%pR regsize %d spacing %d irq %d\n",
+		 &pdev->resource[0], io.regsize, io.regspacing, io.irq);
+
+	return ipmi_si_add_smi(&io);
+}
+
+static void ipmi_ls2k_remove(struct platform_device *pdev)
+{
+	ipmi_si_remove_by_dev(&pdev->dev);
+}
+
+struct platform_driver ipmi_ls2k_platform_driver = {
+	.driver = {
+		.name = "ls2k-ipmi-si",
+	},
+	.probe	= ipmi_ls2k_probe,
+	.remove	= ipmi_ls2k_remove,
+};
+
+static bool platform_registered;
+void ipmi_si_ls2k_init(void)
+{
+	int rv;
+
+	rv = platform_driver_register(&ipmi_ls2k_platform_driver);
+	if (rv)
+		pr_err("Unable to register driver: %d\n", rv);
+	else
+		platform_registered = true;
+}
+
+void ipmi_si_ls2k_shutdown(void)
+{
+	if (platform_registered)
+		platform_driver_unregister(&ipmi_ls2k_platform_driver);
+}
-- 
2.43.5

