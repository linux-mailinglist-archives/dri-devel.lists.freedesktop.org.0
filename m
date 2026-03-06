Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G/zIXHWqmnfXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:28:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C0221969
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACC210ED37;
	Fri,  6 Mar 2026 13:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E853A10ED36
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:28:08 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C8FA02000ED;
 Fri,  6 Mar 2026 14:28:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AD8992000E3;
 Fri,  6 Mar 2026 14:28:07 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com
 [10.162.246.145])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3370420305;
 Fri,  6 Mar 2026 14:28:06 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:21 +0200
Subject: [PATCH v2 4/9] accel/neutron: Add driver for NXP Neutron NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-4-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=18120;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=Y/jBZQeyVcAs/Izp60pDMUmYhMqLrFkInA2ms/T7g7g=;
 b=Opv2AvZpcWWilb21H8L9LSBfLmOPUTYORgnxpX1zdnY+ylugIUYk+aK5FuRhbFKIfuZi4okz1
 HsyvsmWRx6PB/Qu8UaUJm5fXCVogga6NOTJ3lkKFIiC24Wjolpg4lSq
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Rspamd-Queue-Id: ED7C0221969
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:daniel.baluta@nxp.com,m:ruxandra.radulescu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.938];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:mid,nxp.com:email,gerhold.net:email,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

Add a driver for the Neutron Neural Processing Unit from NXP.

Neutron NPU provides machine learning (ML) acceleration for edge AI
applications. Neutron is integrated on NXP SoCs such as the i.MX95.
More information can be found under Documentation/accel/neutron.

For now introduce basic functionalities only: device probe and remove,
firmware load, boot and shutdown procedures, interrupt support, power
management.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 MAINTAINERS                            |  10 ++
 drivers/accel/Kconfig                  |   1 +
 drivers/accel/Makefile                 |   3 +-
 drivers/accel/neutron/Kconfig          |  16 +++
 drivers/accel/neutron/Makefile         |   7 +
 drivers/accel/neutron/neutron_device.c | 160 +++++++++++++++++++++++
 drivers/accel/neutron/neutron_device.h | 120 +++++++++++++++++
 drivers/accel/neutron/neutron_driver.c | 228 +++++++++++++++++++++++++++++++++
 drivers/accel/neutron/neutron_driver.h |  13 ++
 9 files changed, 557 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5b27b061da..f7a687eb6b54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19191,6 +19191,16 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
 F:	drivers/nfc/nxp-nci
 
+NXP Neutron NPU DRIVER
+M:	Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
+M:	Jiwei Fu <jiwei.fu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/neutron/
+F:	drivers/accel/neutron/
+F:	include/uapi/drm/neutron_accel.h
+
 NXP/Goodix TFA989X (TFA1) DRIVER
 M:	Stephan Gerhold <stephan@gerhold.net>
 L:	linux-sound@vger.kernel.org
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf2..ba392371b972 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -28,6 +28,7 @@ source "drivers/accel/amdxdna/Kconfig"
 source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
+source "drivers/accel/neutron/Kconfig"
 source "drivers/accel/qaic/Kconfig"
 source "drivers/accel/rocket/Kconfig"
 
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..698136e12cce 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
+obj-$(CONFIG_DRM_ACCEL_NXP_NEUTRON)	+= neutron/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
-obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
diff --git a/drivers/accel/neutron/Kconfig b/drivers/accel/neutron/Kconfig
new file mode 100644
index 000000000000..37b8ecb49804
--- /dev/null
+++ b/drivers/accel/neutron/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+config DRM_ACCEL_NXP_NEUTRON
+	tristate "NXP Neutron NPU"
+	depends on HAS_IOMEM
+	depends on DRM_ACCEL
+	depends on ARCH_MXC
+	select DRM_GEM_DMA_HELPER
+	select DRM_SCHED
+	help
+	  Enables driver for NXP Neutron NPU.
+
+	  Select this if you have an NXP SoC with Neutron, like i.MX95,
+	  and want to run machine learning applications.
+
+	  If built as module, the module is named neutron.
diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
new file mode 100644
index 000000000000..7592e318dd83
--- /dev/null
+++ b/drivers/accel/neutron/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-$(CONFIG_DRM_ACCEL_NXP_NEUTRON) := neutron.o
+
+neutron-y := \
+	neutron_driver.o \
+	neutron_device.o
diff --git a/drivers/accel/neutron/neutron_device.c b/drivers/accel/neutron/neutron_device.c
new file mode 100644
index 000000000000..61b3c96b4996
--- /dev/null
+++ b/drivers/accel/neutron/neutron_device.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025-2026 NXP */
+
+#include <linux/bitfield.h>
+#include <linux/elf.h>
+#include <linux/firmware.h>
+#include <linux/iopoll.h>
+
+#include "neutron_device.h"
+
+void neutron_enable_irq(struct neutron_device *ndev)
+{
+	u32 val;
+
+	val = readl_relaxed(NEUTRON_REG(ndev, INTENA));
+	val |= INTENA_INFDONE;
+	writel_relaxed(val, NEUTRON_REG(ndev, INTENA));
+}
+
+void neutron_disable_irq(struct neutron_device *ndev)
+{
+	writel_relaxed(INTENA_INFDONE, NEUTRON_REG(ndev, INTCLR));
+}
+
+void neutron_handle_irq(struct neutron_device *ndev)
+{
+	u32 appstatus;
+
+	appstatus = readl_relaxed(NEUTRON_REG(ndev, APPSTATUS));
+
+	/* Write 1 to clear */
+	writel_relaxed(appstatus & APPSTATUS_CLEAR_MASK, NEUTRON_REG(ndev, APPSTATUS));
+
+	if (appstatus & APPSTATUS_FAULTCAUSE_MASK)
+		dev_err(ndev->dev, "Neutron halted due to fault: 0x%lx\n",
+			FIELD_GET(APPSTATUS_FAULTCAUSE_MASK, appstatus));
+}
+
+#define neutron_boot_done(appctrl) \
+	(FIELD_GET(APPCTRL_MBWR_MASK, (appctrl)) == APPCTRL_MBWR_MAGIC)
+
+static int neutron_start(struct neutron_device *ndev)
+{
+	u32 resetctrl, appctrl;
+	int ret;
+
+	resetctrl = readl_relaxed(NEUTRON_REG(ndev, RESETCTRL));
+	writel_relaxed(resetctrl | RESETCTRL_ZVRUN, NEUTRON_REG(ndev, RESETCTRL));
+
+	ret = readl_poll_timeout(NEUTRON_REG(ndev, APPCTRL),
+				 appctrl, neutron_boot_done(appctrl),
+				 100, 1000 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(ndev->dev, "Neutron boot timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void neutron_stop(struct neutron_device *ndev)
+{
+	u32 resetctrl;
+
+	resetctrl = readl_relaxed(NEUTRON_REG(ndev, RESETCTRL));
+	writel_relaxed(resetctrl & ~RESETCTRL_ZVRUN, NEUTRON_REG(ndev, RESETCTRL));
+
+	readl_poll_timeout(NEUTRON_REG(ndev, RESETCTRL),
+			   resetctrl, !(resetctrl & RESETCTRL_ZVRUN),
+			   100, 100 * USEC_PER_MSEC);
+}
+
+static void __iomem *neutron_tcm_da_to_va(struct neutron_device *ndev, u64 da)
+{
+	struct neutron_mem_region *mem;
+	int offset, i;
+
+	for (i = 0; i < NEUTRON_MEM_MAX; i++) {
+		if (i != NEUTRON_MEM_ITCM && i != NEUTRON_MEM_DTCM)
+			continue;
+		mem = &ndev->mem_regions[i];
+		if (da >= mem->da && da < mem->da + mem->size) {
+			offset = da - mem->da;
+			return mem->va + offset;
+		}
+	}
+
+	return NULL;
+}
+
+static int neutron_load_firmware(struct neutron_device *ndev)
+{
+	const struct firmware *fw;
+	struct elf32_hdr *ehdr;
+	struct elf32_phdr *phdr, *seg;
+	void __iomem *dest;
+	int i, ret;
+
+	ret = request_firmware(&fw, NEUTRON_FIRMWARE_NAME, ndev->dev);
+	if (ret) {
+		dev_err(ndev->dev, "Failed to request firmware\n");
+		return ret;
+	}
+
+	ehdr = (struct elf32_hdr *)fw->data;
+	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) != 0) {
+		dev_err(ndev->dev, "Invalid firmware image\n");
+		ret = -EINVAL;
+		goto out_release_fw;
+	}
+
+	phdr = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		seg = &phdr[i];
+		if (seg->p_type != PT_LOAD || !seg->p_memsz)
+			continue;
+
+		dest = neutron_tcm_da_to_va(ndev, seg->p_paddr);
+		if (!dest) {
+			dev_err(ndev->dev, "Invalid firmware segment: 0x%x\n", seg->p_paddr);
+			ret = -EINVAL;
+			goto out_release_fw;
+		}
+
+		memcpy_toio(dest, fw->data + seg->p_offset, seg->p_filesz);
+		if (seg->p_memsz > seg->p_filesz)
+			memset_io(dest + seg->p_filesz, 0, seg->p_memsz - seg->p_filesz);
+	}
+
+out_release_fw:
+	release_firmware(fw);
+
+	return ret;
+}
+
+int neutron_boot(struct neutron_device *ndev)
+{
+	int ret;
+
+	if (ndev->flags & NEUTRON_BOOTED)
+		neutron_shutdown(ndev);
+
+	ret = neutron_load_firmware(ndev);
+	if (ret)
+		return ret;
+
+	ret = neutron_start(ndev);
+	if (ret)
+		return ret;
+
+	ndev->flags |= NEUTRON_BOOTED;
+
+	return 0;
+}
+
+void neutron_shutdown(struct neutron_device *ndev)
+{
+	neutron_stop(ndev);
+	ndev->flags &= ~NEUTRON_BOOTED;
+}
diff --git a/drivers/accel/neutron/neutron_device.h b/drivers/accel/neutron/neutron_device.h
new file mode 100644
index 000000000000..8e4df7462d82
--- /dev/null
+++ b/drivers/accel/neutron/neutron_device.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2025-2026 NXP */
+
+#ifndef __NEUTRON_DEVICE_H__
+#define __NEUTRON_DEVICE_H__
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/bits.h>
+#include <drm/drm_device.h>
+
+struct clk_bulk_data;
+
+#define NEUTRON_FIRMWARE_NAME		"NeutronFirmware.elf"
+
+/* Register offsets */
+#define NEUTRON_REG_RESETCTRL		0x00
+#define NEUTRON_REG_STATUSERR		0x04
+#define NEUTRON_REG_INTENA		0x08
+#define NEUTRON_REG_INTCLR		0x0C
+#define NEUTRON_REG_APPCTRL		0x200
+#define NEUTRON_REG_APPSTATUS		0x204
+#define NEUTRON_REG_BASEDDRL		0x208
+#define NEUTRON_REG_BASEDDRH		0x20C
+#define NEUTRON_REG_RINGCTRL		0x230
+#define NEUTRON_REG_TAIL		0x238
+#define NEUTRON_REG_HEAD		0x23C
+#define NEUTRON_REG_MBOX0		0x240
+#define NEUTRON_REG_MBOX1		0x244
+#define NEUTRON_REG_MBOX2		0x248
+#define NEUTRON_REG_MBOX3		0x24C
+#define NEUTRON_REG_MBOX4		0x250
+#define NEUTRON_REG_MBOX5		0x254
+#define NEUTRON_REG_MBOX6		0x258
+#define NEUTRON_REG_MBOX7		0x25C
+#define NEUTRON_REG_BASEINOUTL		0x280
+#define NEUTRON_REG_BASEINOUTH		0x284
+#define NEUTRON_REG_BASESPILLL		0x288
+#define NEUTRON_REG_BASESPILLH		0x28C
+
+/* Register fields */
+#define RESETCTRL_ZVRUN			BIT(0)
+
+#define INTENA_INFDONE			BIT(1)
+
+#define APPCTRL_MBWR_MASK		GENMASK(31, 16)
+#define APPCTRL_MBWR_MAGIC		0xF807
+
+#define APPSTATUS_INFDONE		BIT(0)
+#define APPSTATUS_INFHALTED		BIT(1)
+#define APPSTATUS_FAULTCAUSE_MASK	GENMASK(21, 16)
+#define APPSTATUS_CLEAR_MASK		GENMASK(4, 0)
+
+#define RINGCTRL_ADDR_MASK		GENMASK(16, 8)
+#define RINGCTRL_SIZE_MASK		GENMASK(7, 0)
+#define RINGCTRL_SIZE_MULT		256
+
+/* Neutron device-side memory map */
+#define NEUTRON_ITCM_DA			0x0
+#define NEUTRON_DTCM_DA			0x40000
+#define NEUTRON_DTCM_BANK1_OFFSET	0x4000
+
+/* Driver flags */
+#define NEUTRON_BOOTED			BIT(0)
+
+/**
+ * struct neutron_mem_region - Neutron memory region descriptor
+ * @va: kernel virtual address of the memory region
+ * @da: Device address of the memory region
+ * @size: size of the memory region
+ */
+struct neutron_mem_region {
+	void __iomem *va;
+	u64 da;
+	size_t size;
+};
+
+enum neutron_mem_id {
+	NEUTRON_MEM_REGS = 0,
+	NEUTRON_MEM_ITCM,
+	NEUTRON_MEM_DTCM,
+	NEUTRON_MEM_MAX
+};
+
+/**
+ * struct neutron_device - Neutron device structure
+ * @base: Base DRM device
+ * @dev: Pointer to underlying device
+ * @mem_regions: Array of memory region descriptors
+ * @irq: IRQ number
+ * @clks: Neutron clocks
+ * @num_clks: Number of clocks
+ * @flags: Software flags used by driver
+ */
+struct neutron_device {
+	struct drm_device base;
+	struct device *dev;
+
+	struct neutron_mem_region mem_regions[NEUTRON_MEM_MAX];
+
+	int irq;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	u32 flags;
+};
+
+#define to_neutron_device(drm) \
+	container_of(drm, struct neutron_device, base)
+
+#define NEUTRON_REG(ndev, name) \
+	((ndev)->mem_regions[NEUTRON_MEM_REGS].va + NEUTRON_REG_##name)
+
+int neutron_boot(struct neutron_device *ndev);
+void neutron_shutdown(struct neutron_device *ndev);
+void neutron_enable_irq(struct neutron_device *ndev);
+void neutron_disable_irq(struct neutron_device *ndev);
+void neutron_handle_irq(struct neutron_device *ndev);
+
+#endif /* __NEUTRON_DEVICE_H__ */
diff --git a/drivers/accel/neutron/neutron_driver.c b/drivers/accel/neutron/neutron_driver.c
new file mode 100644
index 000000000000..7f34785216cf
--- /dev/null
+++ b/drivers/accel/neutron/neutron_driver.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025-2026 NXP */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_gem.h>
+
+#include "neutron_device.h"
+#include "neutron_driver.h"
+
+#define NEUTRON_SUSPEND_DELAY_MS 1000
+
+static int neutron_open(struct drm_device *drm, struct drm_file *file)
+{
+	struct neutron_device *ndev = to_neutron_device(drm);
+	struct neutron_file_priv *npriv;
+
+	npriv = kzalloc_obj(*npriv);
+	if (!npriv)
+		return -ENOMEM;
+
+	npriv->ndev = ndev;
+	file->driver_priv = npriv;
+
+	return 0;
+}
+
+static void neutron_postclose(struct drm_device *drm, struct drm_file *file)
+{
+	struct neutron_file_priv *npriv = file->driver_priv;
+
+	kfree(npriv);
+}
+
+DEFINE_DRM_ACCEL_FOPS(neutron_drm_driver_fops);
+
+static const struct drm_driver neutron_drm_driver = {
+	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.name			= "neutron",
+	.desc			= "NXP Neutron driver",
+	.major			= 1,
+	.minor			= 0,
+
+	.fops			= &neutron_drm_driver_fops,
+	.open			= neutron_open,
+	.postclose		= neutron_postclose,
+};
+
+static irqreturn_t neutron_irq_handler_thread(int irq, void *data)
+{
+	struct neutron_device *ndev = data;
+
+	neutron_handle_irq(ndev);
+
+	return IRQ_HANDLED;
+}
+
+static int neutron_map_region(struct platform_device *pdev, char *name,
+			      enum neutron_mem_id id)
+{
+	struct neutron_device *ndev = platform_get_drvdata(pdev);
+	struct neutron_mem_region *mem = &ndev->mem_regions[id];
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!res)
+		return -EINVAL;
+
+	mem->va = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(mem->va))
+		return PTR_ERR(mem->va);
+
+	mem->size = resource_size(res);
+
+	if (id == NEUTRON_MEM_ITCM)
+		mem->da = NEUTRON_ITCM_DA;
+	else if (id == NEUTRON_MEM_DTCM)
+		mem->da = NEUTRON_DTCM_DA;
+
+	return 0;
+}
+
+static int neutron_probe(struct platform_device *pdev)
+{
+	struct neutron_device *ndev;
+	struct device *dev;
+	int ret;
+
+	ndev = devm_drm_dev_alloc(&pdev->dev, &neutron_drm_driver,
+				  struct neutron_device, base);
+	if (IS_ERR(ndev))
+		return PTR_ERR(ndev);
+
+	platform_set_drvdata(pdev, ndev);
+	dev = &pdev->dev;
+	ndev->dev = dev;
+
+	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
+
+	/* Map registers, ITCM and DTCM regions of the Neutron device */
+	ret = neutron_map_region(pdev, "regs", NEUTRON_MEM_REGS);
+	if (ret)
+		return ret;
+	ret = neutron_map_region(pdev, "itcm", NEUTRON_MEM_ITCM);
+	if (ret)
+		return ret;
+	ret = neutron_map_region(pdev, "dtcm", NEUTRON_MEM_DTCM);
+	if (ret)
+		return ret;
+
+	ndev->num_clks = devm_clk_bulk_get_all(dev, &ndev->clks);
+	if (ndev->num_clks < 0)
+		return ndev->num_clks;
+
+	ndev->irq = platform_get_irq(pdev, 0);
+	if (ndev->irq < 0)
+		return ndev->irq;
+
+	ret = devm_request_threaded_irq(dev, ndev->irq, NULL,
+					neutron_irq_handler_thread,
+					IRQF_ONESHOT, KBUILD_MODNAME, ndev);
+	if (ret) {
+		dev_err(dev, "Failed to request irq %d\n", ndev->irq);
+		return ret;
+	}
+
+	ret = of_reserved_mem_device_init(&pdev->dev);
+	if (ret) {
+		dev_err(dev, "Failed to initialize reserved memory\n");
+		return ret;
+	}
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto free_reserved;
+
+	pm_runtime_set_autosuspend_delay(dev, NEUTRON_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+
+	ret = drm_dev_register(&ndev->base, 0);
+	if (ret)
+		goto free_reserved;
+
+	return 0;
+
+free_reserved:
+	of_reserved_mem_device_release(&pdev->dev);
+
+	return ret;
+}
+
+static void neutron_remove(struct platform_device *pdev)
+{
+	struct neutron_device *ndev = platform_get_drvdata(pdev);
+
+	drm_dev_unregister(&ndev->base);
+	of_reserved_mem_device_release(&pdev->dev);
+}
+
+static int neutron_runtime_suspend(struct device *dev)
+{
+	struct neutron_device *ndev = dev_get_drvdata(dev);
+
+	neutron_disable_irq(ndev);
+	neutron_shutdown(ndev);
+
+	clk_bulk_disable_unprepare(ndev->num_clks, ndev->clks);
+
+	return 0;
+}
+
+static int neutron_runtime_resume(struct device *dev)
+{
+	struct neutron_device *ndev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(ndev->num_clks, ndev->clks);
+	if (ret)
+		return ret;
+
+	ret = neutron_boot(ndev);
+	if (ret) {
+		clk_bulk_disable_unprepare(ndev->num_clks, ndev->clks);
+		return ret;
+	}
+
+	neutron_enable_irq(ndev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops neutron_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(neutron_runtime_suspend, neutron_runtime_resume, NULL)
+};
+
+static const struct of_device_id neutron_match_table[] = {
+	{ .compatible = "nxp,imx95-neutron" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, neutron_match_table);
+
+static struct platform_driver neutron_driver = {
+	.probe	= &neutron_probe,
+	.remove	= &neutron_remove,
+	.driver	= {
+		.name		= "neutron",
+		.of_match_table	= of_match_ptr(neutron_match_table),
+		.pm		= pm_ptr(&neutron_pm_ops),
+	},
+};
+module_platform_driver(neutron_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP Neutron Accel Driver");
+MODULE_LICENSE("GPL");
+MODULE_FIRMWARE(NEUTRON_FIRMWARE_NAME);
diff --git a/drivers/accel/neutron/neutron_driver.h b/drivers/accel/neutron/neutron_driver.h
new file mode 100644
index 000000000000..cd52b5eb2d27
--- /dev/null
+++ b/drivers/accel/neutron/neutron_driver.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2025 NXP */
+
+#ifndef __NEUTRON_DRIVER_H__
+#define __NEUTRON_DRIVER_H__
+
+struct neutron_device;
+
+struct neutron_file_priv {
+	struct neutron_device *ndev;
+};
+
+#endif /* __NEUTRON_DRIVER_H__ */

-- 
2.34.1

