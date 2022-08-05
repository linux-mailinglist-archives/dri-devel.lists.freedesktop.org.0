Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A558A9A6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 12:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47C7B3452;
	Fri,  5 Aug 2022 10:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1115.securemx.jp [210.130.202.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBA1B50D9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 10:41:39 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 275AfR6o001203;
 Fri, 5 Aug 2022 19:41:27 +0900
X-Iguazu-Qid: 2wHHhr7aT4vSnWCn14
X-Iguazu-QSIG: v=2; s=0; t=1659696087; q=2wHHhr7aT4vSnWCn14;
 m=hTj58QqpbBIBeysi580KlXZicaVIuISR2CyXqHtjAbQ=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1112) id 275AfPLo032357
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 5 Aug 2022 19:41:25 +0900
X-SA-MID: 40149904
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: FYI: misc: visconti: Toshiba Visconti DSP accelerator driver sample
Date: Fri,  5 Aug 2022 19:36:05 +0900
X-TSB-HOP2: ON
Message-Id: <20220805103605.23096-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Odded

This is a sample (wip) driver for a DSP found on Toshiba Visconti SoC.
The DSP typically accepts some images, apply an algorithm on them and yields resulting one.
Therefore (image-in, image-out), they say this driver should be classified to media driver category.
However, it can handle various data format (wider than v4l2 officially supports) 
if userland provide firmware (=algorithm) for its own.

Yes, this rough implementation is the first step only our staff could go.
I'm not for sure whether we could carry out experiments earlier if we chose to use existing frameworks,
instead of writing our own routine for handling DMA-BUFs and interrupts.
I hope this post will help your case-study.

Regards
	Yuji Ishikawa

====
misc: visconti: Add Toshiba Visconti DSPIF image processing accelerator

Add support to DSPIF image processing accelerator on Toshiba Visconti ARM SoCs.
The accelerator accepts a task description and a firmware, provides various filter / image processing algorithm.
Currently, DSP firmware is fixed one loaded by bootloader.
And the phisical address of the firmware is specified from userland, not hard-coded nor loaded from device tree.

CPU and DSP share following communication media to manage tasks.

* DSP registers: 32bit word access registers to specify DSP firmware address and several parameters.
* shared mem: a part of DRAM to pass task description (struct hwd_dspif_msg). The DSP busmaster interface is little endian.
* interrupt controller (DCOMM): to notify start event (CPU->DSP) and finish event (DSP->CPU).

The implementation has two C sources:

* dspif.c
  The user interface. It receives inference task description from userlan library.
  manages lifecycle of DMA-BUF instances holding input/output data,
  managegs interrupt requests and updates device file status.
  Memory blocks are specified with fds + offsets of DMA-BUF instances.

* hwd_dspif.c
  The hardware layer. It configures hardware registers following a request from dspif.c.
  This layer communicate with DSP hardware via registers, shared memory and dedicated interrupt controller.
  Memory blocks are specified with 32bit-truncated phisical address

Future plan:
* Power management operations will be added, once the visconti clock framework driver supports the DSP hardware.
* When the visconti IOMMU driver (currently under review) is accepted,
  the hardware layer will use 32bit IO virutal address mapped by the dedicated IOMMU.
* Better way to load / specify DSP firmware.

dt-bindings: misc: visconti: Add Toshiba Visconti DSPIF image processing accelerator bindings

Also, here's a Device Tree binding documentation that allows to describe
the DSPIF image processing accelerator found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
 .../misc/visconti/toshiba,visconti-dspif.yaml |  61 ++
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/visconti/Kconfig                 |   8 +
 drivers/misc/visconti/Makefile                |   7 +
 drivers/misc/visconti/dspif/Makefile          |   8 +
 drivers/misc/visconti/dspif/dspif.c           | 547 ++++++++++++++++++
 drivers/misc/visconti/dspif/hwd_dspif.c       | 275 +++++++++
 drivers/misc/visconti/dspif/hwd_dspif.h       | 100 ++++
 include/uapi/linux/visconti-dspif.h           |  85 +++
 include/uapi/linux/visconti-ipa.h             |  87 +++
 11 files changed, 1180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-dspif.yaml
 create mode 100644 drivers/misc/visconti/Kconfig
 create mode 100644 drivers/misc/visconti/Makefile
 create mode 100644 drivers/misc/visconti/dspif/Makefile
 create mode 100644 drivers/misc/visconti/dspif/dspif.c
 create mode 100644 drivers/misc/visconti/dspif/hwd_dspif.c
 create mode 100644 drivers/misc/visconti/dspif/hwd_dspif.h
 create mode 100644 include/uapi/linux/visconti-dspif.h
 create mode 100644 include/uapi/linux/visconti-ipa.h

diff --git a/Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-dspif.yaml b/Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-dspif.yaml
new file mode 100644
index 000000000..7c10e28dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-dspif.yaml
@@ -0,0 +1,61 @@
+# SPDX-LIcense-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/visconti/toshiba,visconti-dspif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti DSPIF image processing accerelator
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description: |
+  Toshiba Visconti DSPIF image processing accelerator provides various operation on images.
+  Visconti5 have up to 4 DSP units.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,visconti-dspif
+
+  reg:
+    items:
+      - description: DSP control register
+      - description: DCOMM interrupt controller register
+
+  interrupts:
+    maxItems: 1
+
+  index:
+    enum: [0, 1, 2, 3]
+
+  comm_base:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description: shared memory address for communication between CPU and DSP
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - index
+  - comm_base
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        dsp0: dsp@30000000 {
+            compatible = "toshiba,visconti-dspif";
+            reg = <0 0x30000000 0 0x01ffe000>, <0 0x24050000 0 0x10000>;
+            interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+            index = <0>;
+            comm_base = /bits/ 64 <0x81e00000>;
+            status = "disabled";
+        };
+    };
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 0f5a49fc7..4da73fd4c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -487,4 +487,5 @@ source "drivers/misc/cardreader/Kconfig"
 source "drivers/misc/habanalabs/Kconfig"
 source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
+source "drivers/misc/visconti/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index a086197af..946c6f961 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
 obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
+obj-$(CONFIG_ARCH_VISCONTI)	+= visconti/
diff --git a/drivers/misc/visconti/Kconfig b/drivers/misc/visconti/Kconfig
new file mode 100644
index 000000000..1b68e9cf3
--- /dev/null
+++ b/drivers/misc/visconti/Kconfig
@@ -0,0 +1,8 @@
+if ARCH_VISCONTI
+
+config VISCONTI_DSPIF
+    tristate "Visconti DSPIF driver"
+    help
+      This option enable support for the Toshiba Visconti DSPIF accelerator driver.
+
+endif
diff --git a/drivers/misc/visconti/Makefile b/drivers/misc/visconti/Makefile
new file mode 100644
index 000000000..b52a9344a
--- /dev/null
+++ b/drivers/misc/visconti/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti specific device drivers.
+#
+
+obj-$(CONFIG_VISCONTI_DSPIF) += dspif/
+
diff --git a/drivers/misc/visconti/dspif/Makefile b/drivers/misc/visconti/dspif/Makefile
new file mode 100644
index 000000000..290c6a53b
--- /dev/null
+++ b/drivers/misc/visconti/dspif/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti DSPIF driver
+#
+
+visconti-dspif-objs = dspif.o hwd_dspif.o
+
+obj-$(CONFIG_VISCONTI_DSPIF) += visconti-dspif.o
diff --git a/drivers/misc/visconti/dspif/dspif.c b/drivers/misc/visconti/dspif/dspif.c
new file mode 100644
index 000000000..7e0931f0e
--- /dev/null
+++ b/drivers/misc/visconti/dspif/dspif.c
@@ -0,0 +1,547 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti DSPIF Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-buf.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/visconti-dspif.h>
+#include <linux/wait.h>
+
+#include "hwd_dspif.h"
+
+#define IPA_POLL_EVENT_NONE    (0)
+#define IPA_POLL_EVENT_DONE    (1)
+#define IPA_POLL_EVENT_ERROR   (2)
+#define IPA_WAKEUP_RETRY_DELAY (300 * 1000) /*usec*/
+
+#define DRV_DSPIF_FW_ADDR_MASK	0x3ff
+#define DRV_DSPIF_COMM_IOVA_END (0x81E0A000U)
+
+struct dspif_priv {
+	struct device *dev;
+	struct miscdevice miscdev;
+	struct mutex lock; /* only 1 user context execute an API at a time */
+	void __iomem *regs;
+	void __iomem *dcomm_regs;
+	void __iomem *comm_base;
+	u64 comm_paddr;
+	u32 comm_size;
+	int irq;
+	wait_queue_head_t waitq;
+	enum drv_ipa_state status;
+	unsigned int hwd_event;
+	unsigned int poll_event;
+	int id;
+	char name[16];
+	struct hwd_dspif_status hwd_status;
+
+	struct dma_buf_attachment *dba[DRV_DSPIF_BUFFER_INDEX_MAX];
+	struct sg_table *sgt[DRV_DSPIF_BUFFER_INDEX_MAX];
+	enum dma_data_direction dma_dir[DRV_DSPIF_BUFFER_INDEX_MAX];
+	unsigned int dma_count;
+
+	dma_addr_t buffer_iova[DRV_DSPIF_BUFFER_INDEX_MAX];
+};
+
+static int ipa_attach_dmabuf(struct device *dev, int fd, struct dma_buf_attachment **a,
+			     struct sg_table **s, dma_addr_t *addr, enum dma_data_direction dma_dir)
+{
+	struct dma_buf_attachment *attachment;
+	struct dma_buf *dmabuf;
+	struct sg_table *sgt;
+	int ret;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf)) {
+		dev_err(dev, "Invalid dmabuf FD\n");
+		return PTR_ERR(dmabuf);
+	}
+	attachment = dma_buf_attach(dmabuf, dev);
+
+	if (IS_ERR(attachment)) {
+		dev_err(dev, "Failed to attach dmabuf\n");
+		ret = PTR_ERR(attachment);
+		goto err_put;
+	}
+	sgt = dma_buf_map_attachment(attachment, dma_dir);
+	if (IS_ERR(sgt)) {
+		dev_err(dev, "Failed to get dmabufs sg_table\n");
+		ret = PTR_ERR(sgt);
+		goto err_detach;
+	}
+	if (sgt->nents != 1) {
+		dev_err(dev, "Sparse DMA region is unsupported\n");
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	*addr = sg_dma_address(sgt->sgl);
+	*a = attachment;
+	*s = sgt;
+
+	return 0;
+
+err_unmap:
+	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
+err_detach:
+	dma_buf_detach(dmabuf, attachment);
+err_put:
+	dma_buf_put(dmabuf);
+	return ret;
+}
+
+static u32 dspif_ipa_addr_to_iova(struct dspif_priv *priv, struct drv_ipa_addr addr)
+{
+	u32 iova = 0;
+
+	if (addr.buffer_index < priv->dma_count &&
+	    addr.offset < priv->dba[addr.buffer_index]->dmabuf->size)
+		iova = priv->buffer_iova[addr.buffer_index] + addr.offset;
+	return iova;
+}
+
+static int dspif_attach_dma_buf(struct dspif_priv *priv, unsigned int buffer_index,
+				struct drv_ipa_buffer_info buffer_info[DRV_DSPIF_BUFFER_INDEX_MAX])
+{
+	dma_addr_t addr;
+	int ret = 0;
+
+	if (buffer_index >= DRV_DSPIF_BUFFER_INDEX_MAX) {
+		dev_err(priv->dev, "Buffer index invalid: index=%d\n", buffer_index);
+		return -EINVAL;
+	}
+
+	switch (buffer_info[buffer_index].direction) {
+	case DRV_IPA_DIR_NONE:
+		priv->dma_dir[priv->dma_count] = DMA_NONE;
+		break;
+	case DRV_IPA_DIR_TO_DEVICE:
+		priv->dma_dir[priv->dma_count] = DMA_TO_DEVICE;
+		break;
+	case DRV_IPA_DIR_FROM_DEVICE:
+		priv->dma_dir[priv->dma_count] = DMA_FROM_DEVICE;
+		break;
+	case DRV_IPA_DIR_BIDIRECTION:
+		priv->dma_dir[priv->dma_count] = DMA_BIDIRECTIONAL;
+		break;
+	default:
+		dev_err(priv->dev, "DMA direction invalid: index=%d dir=%d\n", buffer_index,
+			buffer_info[buffer_index].direction);
+		return -EINVAL;
+	}
+
+	ret = ipa_attach_dmabuf(priv->dev, buffer_info[buffer_index].fd,
+				&priv->dba[priv->dma_count], &priv->sgt[priv->dma_count], &addr,
+				priv->dma_dir[priv->dma_count]);
+	if (ret == 0) {
+		priv->dma_count++;
+		priv->buffer_iova[buffer_index] = addr;
+	}
+
+	return ret;
+}
+
+static void dspif_detach_dma_buf(struct dspif_priv *priv)
+{
+	struct dma_buf *dmabuf;
+	int i;
+
+	for (i = 0; i < priv->dma_count; i++) {
+		dmabuf = priv->dba[i]->dmabuf;
+		dma_buf_unmap_attachment(priv->dba[i], priv->sgt[i], priv->dma_dir[i]);
+		dma_buf_detach(dmabuf, priv->dba[i]);
+		dma_buf_put(dmabuf);
+	}
+}
+
+static int dspif_validate_address(struct dspif_priv *priv, u32 fw_addr, u64 comm_paddr)
+{
+	int i;
+
+	for (i = 0; i < priv->dma_count; i++) {
+		if (priv->buffer_iova[i] < DRV_DSPIF_COMM_IOVA_END)
+			return -ENOSPC;
+	}
+
+	return 0;
+}
+
+static irqreturn_t dspif_irq(int irq, void *dev_id)
+{
+	struct dspif_priv *priv = dev_id;
+
+	priv->hwd_event = hwd_dspif_irq_handler(priv->id);
+
+	disable_irq_nosync(priv->irq);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t dspif_irq_thread(int irq, void *dev_id)
+{
+	struct dspif_priv *priv = dev_id;
+	unsigned long delay = 1;
+
+	mutex_lock(&priv->lock);
+	dspif_detach_dma_buf(priv);
+
+	hwd_dspif_stop(priv->id);
+
+	hwd_dspif_get_status(priv->id, &priv->hwd_status);
+
+	priv->status = DRV_IPA_STATE_IDLE;
+
+	/* status should be updated before poll_event so that
+	 * when poll() returns, user context must observe state as idle
+	 */
+	smp_wmb();
+
+	if (priv->hwd_event == HWD_DSPIF_EVENT_DONE)
+		priv->poll_event = IPA_POLL_EVENT_DONE;
+	else
+		priv->poll_event = IPA_POLL_EVENT_ERROR;
+
+	/* General barrier to avoid re-ordering of priv->poll_event=N and
+	 * waitqueue_active()
+	 */
+	smp_mb();
+
+	/* Threads going to sleep in poll() can miss wakeup, when wakeup is done
+	 * between event check in ipa_poll() and sleeping. Wakeup repeatedly.
+	 */
+	while (waitqueue_active(&priv->waitq)) {
+		wake_up_interruptible(&priv->waitq);
+
+		WARN_ON(delay > IPA_WAKEUP_RETRY_DELAY);
+		usleep_range(delay, delay + 1);
+		delay += delay;
+	}
+
+	mutex_unlock(&priv->lock);
+
+	return IRQ_HANDLED;
+}
+
+static void dspif_start(struct dspif_priv *priv, struct hwd_dspif_descriptor *desc)
+{
+	hwd_dspif_start(priv->id, desc);
+}
+
+static int dspif_ioctl_start(struct dspif_priv *priv, unsigned long arg)
+{
+	struct hwd_dspif_descriptor hwd_desc;
+	struct drv_dspif_descriptor desc;
+	unsigned int i;
+	int ret = 0;
+
+	ret = mutex_lock_interruptible(&priv->lock);
+	if (ret)
+		return ret;
+
+	if (priv->status == DRV_IPA_STATE_BUSY) {
+		dev_dbg(priv->dev, "busy: %d\n", priv->status);
+		mutex_unlock(&priv->lock);
+		return -EBUSY;
+	}
+
+	if (copy_from_user(&desc, (void __user *)arg, sizeof(struct drv_dspif_descriptor))) {
+		dev_err(priv->dev, "Descriptor memory access error\n");
+		ret = -EFAULT;
+		goto err1;
+	}
+
+	if ((desc.fw_addr & DRV_DSPIF_FW_ADDR_MASK) != 0U) {
+		dev_err(priv->dev, "Invalid Firmware address\n");
+		ret = -EINVAL;
+		goto err1;
+	}
+
+	priv->dma_count = 0;
+
+	/* setup buffer */
+	for (i = 0; i < desc.buffer_info_num; i++) {
+		ret = dspif_attach_dma_buf(priv, i, desc.buffer_info);
+		if (ret) {
+			dev_err(priv->dev, "dma buf attach error: index=%d\n", i);
+			goto err2;
+		}
+	}
+
+	/* setup descriptor */
+	hwd_desc.fw_addr = desc.fw_addr;
+	hwd_desc.msg.id = cpu_to_le32(desc.msg.id);
+	hwd_desc.msg.error = cpu_to_le32(desc.msg.error);
+
+	for (i = 0; i < HWD_DSPIF_NUM_ARG_IMM; i++)
+		hwd_desc.msg.imm[i].value = cpu_to_le64(desc.msg.imm[i].value);
+
+	for (i = 0; i < DRV_DSPIF_NUM_ARG_REF; i++) {
+		u64 iova;
+
+		if (drv_ipa_is_invalid_addr(desc.msg.ref[i].address))
+			continue;
+
+		iova = dspif_ipa_addr_to_iova(priv, desc.msg.ref[i].address);
+		if (iova == 0) {
+			dev_err(priv->dev, "IPA address to iova conversion error: ref %s: %d\n",
+				__func__, __LINE__);
+			ret = -EINVAL;
+			goto err2;
+		}
+		hwd_desc.msg.ref[i].address = cpu_to_le64(iova);
+		hwd_desc.msg.ref[i].size = cpu_to_le64(desc.msg.ref[i].size);
+	}
+
+	for (i = 0; i < DRV_DSPIF_NUM_ARG_IMG; i++) {
+		u64 iova;
+
+		if (drv_ipa_is_invalid_addr(desc.msg.img[i].address))
+			continue;
+
+		iova = dspif_ipa_addr_to_iova(priv, desc.msg.img[i].address);
+		if (iova == 0) {
+			dev_err(priv->dev, "IPA address to iova conversion error: ref %s: %d\n",
+				__func__, __LINE__);
+			ret = -EINVAL;
+			goto err2;
+		}
+
+		hwd_desc.msg.img[i].address = cpu_to_le64(iova);
+		hwd_desc.msg.img[i].width = cpu_to_le32(desc.msg.img[i].width);
+		hwd_desc.msg.img[i].height = cpu_to_le32(desc.msg.img[i].height);
+		hwd_desc.msg.img[i].pitch = cpu_to_le32(desc.msg.img[i].pitch);
+		hwd_desc.msg.img[i].type = cpu_to_le32(desc.msg.img[i].type);
+	}
+
+	ret = dspif_validate_address(priv, desc.fw_addr, priv->comm_paddr);
+	if (ret) {
+		dev_err(priv->dev, "no space left in dspif\n");
+		goto err2;
+	}
+
+	dspif_start(priv, &hwd_desc);
+
+	priv->poll_event = IPA_POLL_EVENT_NONE;
+	priv->hwd_event = 0;
+	priv->status = DRV_IPA_STATE_BUSY;
+	/* Barrier to prevent dspif_irq() from setting priv->hwd_event
+	 * before it is reset above
+	 */
+	smp_wmb();
+	enable_irq(priv->irq);
+
+	mutex_unlock(&priv->lock);
+
+	return ret;
+
+err2:
+	dspif_detach_dma_buf(priv);
+err1:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int dspif_ioctl_get_status(struct dspif_priv *priv, unsigned long arg)
+{
+	struct hwd_dspif_status hwd_status;
+	struct drv_dspif_status status;
+	int ret = 0;
+
+	ret = mutex_lock_interruptible(&priv->lock);
+	if (ret)
+		return ret;
+
+	if (priv->status == DRV_IPA_STATE_BUSY)
+		hwd_dspif_get_status(priv->id, &hwd_status);
+	else
+		hwd_status = priv->hwd_status;
+
+	status.state = priv->status;
+	mutex_unlock(&priv->lock);
+
+	status.error = hwd_status.error;
+	if (copy_to_user((void __user *)arg, &status, sizeof(struct drv_dspif_status))) {
+		dev_err(priv->dev, "status memory access error\n");
+		ret = -EFAULT;
+	}
+
+	return ret;
+}
+
+static long dspif_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct dspif_priv *priv = container_of(fp->private_data, struct dspif_priv, miscdev);
+	int ret = 0;
+
+	switch (cmd) {
+	case IOC_IPA_START:
+		ret = dspif_ioctl_start(priv, arg);
+		break;
+	case IOC_IPA_GET_STATUS:
+		ret = dspif_ioctl_get_status(priv, arg);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+
+	return ret;
+}
+
+static __poll_t dspif_poll(struct file *fp, poll_table *wait)
+{
+	struct dspif_priv *priv = container_of(fp->private_data, struct dspif_priv, miscdev);
+	unsigned int poll_event;
+	__poll_t mask = 0;
+
+	poll_wait(fp, &priv->waitq, wait);
+
+	/* Barrier to avoid re-ordering of poll_wait() and event load
+	 * Read barrier here and release barrier in poll_wait() together will
+	 * prevent re-ordering
+	 */
+	smp_rmb();
+	poll_event = priv->poll_event;
+	if (poll_event != IPA_POLL_EVENT_NONE) {
+		if (poll_event == IPA_POLL_EVENT_DONE)
+			mask = EPOLLIN | EPOLLRDNORM;
+		else
+			mask = EPOLLERR;
+	}
+	return mask;
+}
+
+static const struct file_operations dspif_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = dspif_ioctl,
+	.poll = dspif_poll,
+};
+
+static int dspif_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dspif_priv *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+
+	/* update DMA mask */
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
+	if (ret)
+		return ret;
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	/*
+	 * devm_platform_ioremap_resource() failes for multiple requests
+	 * because the DCOMM region is shared up to 4 instances of this driver.
+	 */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	priv->dcomm_regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(priv->dcomm_regs))
+		return PTR_ERR(priv->dcomm_regs);
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
+
+	ret = devm_request_threaded_irq(dev, priv->irq, dspif_irq, dspif_irq_thread, 0, "dspif",
+					priv);
+	if (ret) {
+		dev_err(dev, "irq request failed\n");
+		return ret;
+	}
+	disable_irq(priv->irq);
+
+	ret = of_property_read_u32(dev->of_node, "index", &priv->id);
+	if (ret) {
+		dev_err(dev, "failed to acquire index\n");
+		return ret;
+	}
+
+	ret = of_property_read_u64(dev->of_node, "comm_base", &priv->comm_paddr);
+	if (ret) {
+		dev_err(dev, "failed to acquire comm base resource\n");
+		return ret;
+	}
+	priv->comm_size = 0x1000;
+	priv->comm_base = ioremap(priv->comm_paddr, priv->comm_size);
+	if (IS_ERR(priv->comm_base))
+		return PTR_ERR(priv->comm_base);
+
+	hwd_dspif_initialize(priv->id, priv->dcomm_regs, priv->regs, priv->comm_base);
+
+	snprintf(priv->name, sizeof(priv->name), "dspif%d", priv->id);
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = priv->name;
+	priv->miscdev.fops = &dspif_fops;
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		dev_err(dev, "misc registration failed\n");
+		hwd_dspif_uninitialize(priv->id);
+		return ret;
+	}
+
+	dev_info(dev, "com_base=0x%llx\n", priv->comm_paddr);
+
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
+	init_waitqueue_head(&priv->waitq);
+
+	priv->status = DRV_IPA_STATE_IDLE;
+	return 0;
+}
+
+static int dspif_remove(struct platform_device *pdev)
+{
+	struct dspif_priv *priv = platform_get_drvdata(pdev);
+
+	misc_deregister(&priv->miscdev);
+	hwd_dspif_uninitialize(priv->id);
+	return 0;
+}
+
+static const struct of_device_id dspif_of_match[] = {
+	{
+		.compatible = "toshiba,visconti-dspif",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, dspif_of_match);
+
+static struct platform_driver dspif_driver = {
+	.probe = dspif_probe,
+	.remove = dspif_remove,
+	.driver = {
+		.name = "visconti_dspif",
+		.of_match_table = of_match_ptr(dspif_of_match),
+	},
+};
+module_platform_driver(dspif_driver);
+
+MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti dspif driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/misc/visconti/dspif/hwd_dspif.c b/drivers/misc/visconti/dspif/hwd_dspif.c
new file mode 100644
index 000000000..38ae6545e
--- /dev/null
+++ b/drivers/misc/visconti/dspif/hwd_dspif.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti DSPIF Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/types.h>
+
+#include "hwd_dspif.h"
+
+/* DCOMM registers */
+#define DCOMM_DEST_ENABLE    0x0010
+#define DCOMM_ERR_SET_DSP    0x0100
+#define DCOMM_ERR_CLR_DSP    0x0200
+#define DCOMM_ERR_STATUS_DSP 0x0300
+
+/*
+ * rr, dd: 0x00 - 0x03
+ */
+#define ROFF(rr) ((rr) * 0x80)
+#define DOFF(dd) ((dd) * 0x04)
+
+#define DCOMM_INT_SET_RRR_D16(rr) (0x1000 + ROFF(rr) + DOFF(16))
+#define DCOMM_INT_SET_R04_DDD(dd) (0x1200 + DOFF(dd))
+#define DCOMM_INT_MSK_RRR_D16(rr) (0x2000 + ROFF(rr) + DOFF(16))
+#define DCOMM_INT_MSK_R04_DDD(dd) (0x2200 + DOFF(dd))
+#define DCOMM_INT_CLR_RRR_D16(rr) (0x3000 + ROFF(rr) + DOFF(16))
+#define DCOMM_INT_CLR_R04_DDD(dd) (0x3200 + DOFF(dd))
+
+/* DSP control registers */
+#define DSP_RESET_VECTOR     0x0000
+#define DSP_ARB_XTS_PRIORITY 0xD008
+#define DSP_ARB_DMA_PRIORITY 0xD088
+
+/* COMM between DSP and CPU */
+#define COMM_DSPIF_MSG_ERROR (offsetof(struct hwd_dspif_msg, error))
+
+/* Arbitration register values */
+#define HWD_DSP_ARB_XTS (0x00000101U)
+#define HWD_DSP_ARB_DMA (0x00000000U)
+
+#define HWD_DSPIF_DCOMM_SEND_BIT     BIT(0)
+#define HWD_DSPIF_DCOMM_UNMASK_SHIFT 16
+#define HWD_DSPIF_DCOMM_UNMASK_SEND  BIT(0 + HWD_DSPIF_DCOMM_UNMASK_SHIFT)
+#define HWD_DSPIF_DCOMM_MASK_SEND    (HWD_DSPIF_DCOMM_SEND_BIT)
+
+/**
+ * struct hwd_dspif_resources - HWD driver internal resource structure
+ *
+ * @dcomm_base: Pointer for register of PIDCOMM
+ * @dsp_base: Pointer for register of DSP
+ * @comm_base: Pointer for communication register
+ * @status: information of DSP
+ * @target_bit: bit pattern for DSP channel
+ * @clear_bit: bit pattern for clearing INT_MASK
+ */
+struct hwd_dspif_resources {
+	void __iomem *dcomm_base;
+	void __iomem *dsp_base;
+	void __iomem *comm_base;
+	struct hwd_dspif_status status;
+	u32 target_bit;
+	u32 clear_bit;
+};
+
+/* HWD driver internal resource */
+static struct hwd_dspif_resources hwd_dspif_resources[HWD_DSPIF_DEVICE_MAX] = {
+	/* Device 0 */
+	{
+		.target_bit = BIT(0),
+		.clear_bit = BIT(0 + HWD_DSPIF_DCOMM_UNMASK_SHIFT),
+	},
+	/* Device 1 */
+	{
+		.target_bit = BIT(1),
+		.clear_bit = BIT(1 + HWD_DSPIF_DCOMM_UNMASK_SHIFT),
+	},
+	/* Device 2 */
+	{
+		.target_bit = BIT(2),
+		.clear_bit = BIT(2 + HWD_DSPIF_DCOMM_UNMASK_SHIFT),
+	},
+	/* Device 3 */
+	{
+		.target_bit = BIT(3),
+		.clear_bit = BIT(3 + HWD_DSPIF_DCOMM_UNMASK_SHIFT),
+	},
+};
+
+/**
+ * hwd_dspif_descriptor_copy() - Copy Descriptor
+ *
+ * @comm_base: destination area of msg
+ * @src: msg in descriptor
+ */
+static void hwd_dspif_descriptor_copy(void __iomem *comm_base, const struct hwd_dspif_msg *src)
+{
+	/* copy message area */
+	memcpy_toio(comm_base, src, sizeof(*src));
+
+	/* Initialize area of response from DSP */
+	writel(0, comm_base + COMM_DSPIF_MSG_ERROR);
+}
+
+/**
+ * hwd_dspif_initialize() - Initialize DSP device
+ *
+ * @module_id: id of the h/w module
+ * @dcomm_reg_vaddr: PIDCOMM register base address (virtual address)
+ * @dsp_reg_vaddr: DSP register base address (virtual address)
+ * @comm_vaddr: communication area address (virtual address)
+ */
+void hwd_dspif_initialize(u32 module_id, void __iomem *dcomm_reg_vaddr, void __iomem *dsp_reg_vaddr,
+			  void __iomem *comm_vaddr)
+{
+	struct hwd_dspif_resources *res;
+
+	res = &hwd_dspif_resources[module_id];
+	res->dcomm_base = dcomm_reg_vaddr;
+	res->dsp_base = dsp_reg_vaddr;
+	res->comm_base = comm_vaddr;
+}
+
+/**
+ * hwd_dspif_uninitialize() - Uninitialize DSP device
+ *
+ * @module_id: id of the h/w module
+ */
+void hwd_dspif_uninitialize(u32 module_id)
+{
+	struct hwd_dspif_resources *res;
+
+	res = &hwd_dspif_resources[module_id];
+	res->dcomm_base = NULL;
+	res->dsp_base = NULL;
+	res->comm_base = NULL;
+}
+
+/**
+ * hwd_dspif_start() - Start DSP device
+ *
+ * @module_id: id of the h/w module
+ * @desc: Pointer to descriptor structure
+ *
+ * Host processor (CA53) and DSPs are connected
+ * via an interrupt controller (DCOMM)
+ *
+ * usage of DCOMM:
+ *
+ * * DCOMM_INT_CLR_RRR_D16(id): id=0,1,2,3
+ *   * register to clear interrupt to CA53 from DSP(id)
+ *   * bit0-7; set 1 to clear interrupt from DSP; bit0 from DSP0, bit1 from DSP1, ...
+ * * DCOMM_INT_CLR_R04_DDD(id): id=0,1,2,3
+ *   * register to clear interrupt to DSP(id) from CA53
+ *   * bit0: set 1 to clear interrupt to DSP
+ *   * bit1-7: (reserved)
+ * * DCOMM_INT_MSK_RRR_D16(id): id=0,1,2,3
+ *   * register to mask interrupt to CA53 from DSP(id)
+ *   * bit0-7: set 1 to mask interrupt; bit0 from DSP0, bit1 from DSP1, ...
+ *   * bit16-23: set 1 to UNMASK interrupt; bit16 from DSP0, bit17 from DSP1, ...
+ * * DCOMM_INT_MSK_R04_DDD(id): id=0,1,2,3
+ *   * register to mask interrupt to DSP(id) from CA53
+ *   * bit0: set 1 to mask interrupt
+ *   * bit16: set 1 to UNMASK interrupt
+ * * DCOMM_INT_SET_RRR_D16(id): id=0,1,2,3
+ *   * FYI: register to issue interrupt to CA53 from DSP(id)
+ *   * FYI: bit0: set by DSP0; set 1 to issue interrupt GIC_SPI 180
+ *   * FYI: bit1: set by DSP1; set 1 to issue interrupt GIC_SPI 181
+ *   * FYI: bit2: set by DSP2; set 1 to issue interrupt GIC_SPI 182
+ *   * FYI: bit3: set by DSP3; set 1 to issue interrupt GIC_SPI 183
+ * * DCOMM_INT_SET_R04_DDD(id): id=0,1,2,3
+ *   * register to issue interrupt to DSP(id) from CA53
+ *   * bit0: issue interrupt to DSP
+ *   * bit1-7: (reserved)
+ *
+ */
+void hwd_dspif_start(u32 module_id, const struct hwd_dspif_descriptor *desc)
+{
+	struct hwd_dspif_resources *res;
+	void __iomem *dcomm_base;
+	void __iomem *dsp_base;
+
+	res = &hwd_dspif_resources[module_id];
+	dcomm_base = res->dcomm_base;
+	dsp_base = res->dsp_base;
+
+	/* Initialize error code from DSP */
+	res->status.error = 0;
+
+	/* Copy to communication area with user provided values */
+	hwd_dspif_descriptor_copy(res->comm_base, &desc->msg);
+
+	/* Select firmware */
+	writel(desc->fw_addr, dsp_base + DSP_RESET_VECTOR);
+
+	/* Set arbitration parameter */
+	writel(HWD_DSP_ARB_XTS, dsp_base + DSP_ARB_XTS_PRIORITY);
+	writel(HWD_DSP_ARB_DMA, dsp_base + DSP_ARB_DMA_PRIORITY);
+
+	/* Clear interrupt causes */
+	writel(res->target_bit, dcomm_base + DCOMM_INT_CLR_RRR_D16(module_id));
+	writel(HWD_DSPIF_DCOMM_SEND_BIT, dcomm_base + DCOMM_INT_CLR_R04_DDD(module_id));
+
+	/* UNMASK interrupt */
+	writel(res->clear_bit, dcomm_base + DCOMM_INT_MSK_RRR_D16(module_id));
+	writel(HWD_DSPIF_DCOMM_UNMASK_SEND, dcomm_base + DCOMM_INT_MSK_R04_DDD(module_id));
+
+	dsb(st);
+
+	/* Signal to DSP by DCOMM */
+	writel(HWD_DSPIF_DCOMM_SEND_BIT, dcomm_base + DCOMM_INT_SET_R04_DDD(module_id));
+}
+
+/**
+ * hwd_dspif_stop() - Stop DSP device
+ *
+ * @module_id: id of the h/w module
+ */
+void hwd_dspif_stop(u32 module_id)
+{
+	const struct hwd_dspif_resources *res = &hwd_dspif_resources[module_id];
+	void __iomem *dcomm_base = res->dcomm_base;
+
+	/* Mask Interrupt from/to DSP */
+	writel(res->target_bit, dcomm_base + DCOMM_INT_MSK_RRR_D16(module_id));
+	writel(HWD_DSPIF_DCOMM_MASK_SEND, dcomm_base + DCOMM_INT_MSK_R04_DDD(module_id));
+}
+
+/**
+ * hwd_dspif_irq_handler() - HWD DSPIF interrupt handler
+ *
+ * @module_id: id of the h/w module
+ * Return: HWD_DSPIF_EVENT_DONE DSP processing is completed
+ * Return: HWD_DSPIF_EVENT_ERROR DSP processing is failed
+ */
+u32 hwd_dspif_irq_handler(u32 module_id)
+{
+	struct hwd_dspif_resources *res = &hwd_dspif_resources[module_id];
+	void __iomem *dcomm_base = res->dcomm_base;
+	u32 event;
+	s32 error;
+
+	/* Clear interrupt causes */
+	writel(res->target_bit, dcomm_base + DCOMM_INT_CLR_RRR_D16(module_id));
+
+	/* This error field is written by DSP */
+	/* this addr has __iommmu and __le32 attributes */
+	error = (s32)le32_to_cpu((__force __le32)readl(res->comm_base + COMM_DSPIF_MSG_ERROR));
+
+	/* if error is zero, event is DONE else ERROR */
+	event = (error == 0) ? HWD_DSPIF_EVENT_DONE : HWD_DSPIF_EVENT_ERROR;
+
+	/* save error value */
+	res->status.error = error;
+
+	return event;
+}
+
+/**
+ * hwd_dspif_get_status() - HWD DSPIF Get Status
+ *
+ * @module_id: number of the h/w module
+ * @status: Pointer to status structure
+ */
+void hwd_dspif_get_status(u32 module_id, struct hwd_dspif_status *status)
+{
+	const struct hwd_dspif_resources *res = &hwd_dspif_resources[module_id];
+
+	/* return saved status */
+	status->error = res->status.error;
+}
diff --git a/drivers/misc/visconti/dspif/hwd_dspif.h b/drivers/misc/visconti/dspif/hwd_dspif.h
new file mode 100644
index 000000000..ac252786f
--- /dev/null
+++ b/drivers/misc/visconti/dspif/hwd_dspif.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/* Toshiba Visconti DSPIF Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef HWD_DSPIF_H
+#define HWD_DSPIF_H
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+enum hwd_power_ctrl { HWD_POWER_OFF = 0, HWD_POWER_ON = 1 };
+
+#define HWD_DSPIF_EVENT_DONE  BIT(0)
+#define HWD_DSPIF_EVENT_ERROR BIT(1)
+
+#define HWD_DSPIF_NUM_ARG_IMM (8)
+#define HWD_DSPIF_NUM_ARG_REF (4)
+#define HWD_DSPIF_NUM_ARG_IMG (6)
+
+/**
+ * enum hwd_dspif_module_id - ID for each DSPIF device
+ */
+enum hwd_dspif_module_id {
+	HWD_DSPIF_DEVICE_0 = 0,
+	HWD_DSPIF_DEVICE_1 = 1,
+	HWD_DSPIF_DEVICE_2 = 2,
+	HWD_DSPIF_DEVICE_3 = 3,
+	HWD_DSPIF_DEVICE_MAX = 4
+};
+
+/**
+ * struct hwd_dspif_status - DSPIF HWD Driver Status
+ * @error: Return value from DSP F/W
+ */
+struct hwd_dspif_status {
+	s32 error;
+};
+
+/**
+ * struct hwd_dspif_msg - DSP message structure
+ *
+ * The hwd_dspif_msg instance is passed to DSP via memory block on DRAM.
+ * Therefore, each integer members should be cared their endianess.
+ *
+ * @id: u32 le. Function ID, Defined by DSP FW
+ * @error: s32 le. Reserved area for return value of DSP FW
+ * @imm: Argument for immediate value
+ * @imm.value: s64 le. Immediate value
+ * @ref: Argument for reference address
+ * @ref.address: u64 le. Address
+ * @ref.size: u64 le. Size of area specified by address
+ * @img: Image information
+ * @img.address: u64 le. Address of image data
+ * @img.width: s32 le. Width of image data
+ * @img.height: s32 le. Height of image data
+ * @img.pitch: s32 le. Pitch of image data
+ * @img.type: u32 le. Type format of image data [0x01, 0x02, 0x81, 0x82, 0x04, 0x84, 0x08, 0x88]
+ */
+struct hwd_dspif_msg {
+	__le32 id;
+	__le32 error;
+	struct {
+		__le64 value;
+	} imm[HWD_DSPIF_NUM_ARG_IMM];
+	struct {
+		__le64 address;
+		__le64 size;
+	} ref[HWD_DSPIF_NUM_ARG_REF];
+	struct {
+		__le64 address;
+		__le32 width;
+		__le32 height;
+		__le32 pitch;
+		__le32 type;
+	} img[HWD_DSPIF_NUM_ARG_IMG];
+};
+
+/**
+ * struct hwd_dspif_descriptor - HWD DSPIF Descriptor
+ *
+ * @msg: Message structure to DSP
+ * @fw_addr: Firmware address
+ */
+struct hwd_dspif_descriptor {
+	struct hwd_dspif_msg msg;
+	u32 fw_addr;
+};
+
+void hwd_dspif_initialize(u32 module_id, void __iomem *dcomm_reg_vaddr, void __iomem *dsp_reg_vaddr,
+			  void __iomem *comm_vaddr);
+void hwd_dspif_uninitialize(u32 module_id);
+void hwd_dspif_start(u32 module_id, const struct hwd_dspif_descriptor *desc);
+void hwd_dspif_stop(u32 module_id);
+u32 hwd_dspif_irq_handler(u32 module_id);
+void hwd_dspif_get_status(u32 module_id, struct hwd_dspif_status *status);
+
+#endif /* HWD_DSPIF_H */
diff --git a/include/uapi/linux/visconti-dspif.h b/include/uapi/linux/visconti-dspif.h
new file mode 100644
index 000000000..1de51b8f6
--- /dev/null
+++ b/include/uapi/linux/visconti-dspif.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Toshiba Visconti DSPIF Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef _UAPI_LINUX_DSPIF_H
+#define _UAPI_LINUX_DSPIF_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+#include <linux/visconti-ipa.h>
+
+#define DRV_DSPIF_BUFFER_INDEX_MAX (15)
+
+#define DRV_DSPIF_EVENT_DONE	 (1U)
+#define DRV_DSPIF_EVENT_ERROR	 (2U)
+#define DRV_DSPIF_EVENT_HW_ERROR (3U)
+
+#define DRV_DSPIF_NUM_ARG_IMM (8)
+#define DRV_DSPIF_NUM_ARG_REF (4)
+#define DRV_DSPIF_NUM_ARG_IMG (6)
+
+/**
+ * struct drv_dspif_status - DSPIF IPA descriptor for IOC_IPA_START
+ * @state: A &enum drv_ipa_state value for the state of driver
+ * @error: Return value from DSP firmware
+ */
+struct drv_dspif_status {
+	__u32 state;
+	__s32 error;
+};
+
+/**
+ * struct drv_dspif_msg - Message structure
+ * @id:           Function ID, Defined by DSP FW
+ * @error:        Reserved area for return value of DSP FW
+ * @imm:          Argument for immediate value
+ * @imm.value:    Immediate value
+ * @ref:          Argument for reference address
+ * @ref.address:  Address
+ * @ref.size:     Size of area specified by address
+ * @img:          Image information
+ * @img.address:  Address of image data
+ * @img.width:    Width of image data
+ * @img.height:   Height of image data
+ * @img.pitch:    Pitch of image data
+ * @img.type:     Type format of image data;
+ *                U8(0x01), S8(0x81), U16(0x02), S16(0x82), U32(0x04), S32(0x84), S64(0x88)
+ */
+struct drv_dspif_msg {
+	__u32 id;
+	__s32 error;
+	struct {
+		__s64 value;
+	} imm[DRV_DSPIF_NUM_ARG_IMM];
+	struct {
+		struct drv_ipa_addr address;
+		__u64 size;
+	} ref[DRV_DSPIF_NUM_ARG_REF];
+	struct {
+		struct drv_ipa_addr address;
+		__s32 width;
+		__s32 height;
+		__s32 pitch;
+		__u32 type;
+	} img[DRV_DSPIF_NUM_ARG_IMG];
+};
+
+/**
+ * struct drv_dspif_descriptor - DSPIF IPA descriptor for IOC_IPA_START
+ * @msg:             Message structure to DSP
+ * @fw_addr:         Firmware address
+ * @buffer_info:     Table of buffer information
+ * @buffer_info_num: Number of buffer_info
+ */
+struct drv_dspif_descriptor {
+	struct drv_dspif_msg msg;
+	__u32 fw_addr;
+	struct drv_ipa_buffer_info buffer_info[DRV_DSPIF_BUFFER_INDEX_MAX];
+	__u32 buffer_info_num;
+};
+
+#endif /* _UAPI_LINUX_DSPIF_H */
diff --git a/include/uapi/linux/visconti-ipa.h b/include/uapi/linux/visconti-ipa.h
new file mode 100644
index 000000000..f233d8302
--- /dev/null
+++ b/include/uapi/linux/visconti-ipa.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Toshiba Visconti Image Processing Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef _UAPI_LINUX_IPA_H
+#define _UAPI_LINUX_IPA_H
+
+#include <linux/types.h>
+
+/**
+ * enum drv_ipa_state - state of Visconti IPA driver
+ *
+ * @DRV_IPA_STATE_IDLE:     driver is idle
+ * @DRV_IPA_STATE_BUSY:     device is busy
+ */
+enum drv_ipa_state { DRV_IPA_STATE_IDLE = 0, DRV_IPA_STATE_BUSY };
+
+/**
+ * enum drv_ipa_buffer_direction - usage of buffer
+ *
+ * @DRV_IPA_DIR_BIDIRECTION: cpu writes/reads data
+ * @DRV_IPA_DIR_TO_DEVICE:   cpu writes data
+ * @DRV_IPA_DIR_FROM_DEVICE: cpu reads data
+ * @DRV_IPA_DIR_NONE:        cpu not access or non-coherent
+ */
+enum drv_ipa_buffer_direction {
+	DRV_IPA_DIR_BIDIRECTION = 0,
+	DRV_IPA_DIR_TO_DEVICE,
+	DRV_IPA_DIR_FROM_DEVICE,
+	DRV_IPA_DIR_NONE
+};
+
+/**
+ * struct drv_ipa_buffer_info - buffer information for Visconti IPA drivers
+ *
+ * @fd:        file descriptor of a dma-buf heap instance
+ * @flags:     optional flags for attributes of the buffer
+ * @direction: A &enum drv_ipa_buffer_direction value
+ *             for buffer direction (to/from device)
+ */
+struct drv_ipa_buffer_info {
+	__u32 fd;
+	__u32 flags;
+	__u32 direction;
+};
+
+/**
+ * struct drv_ipa_addr - address structure for Visconti IPA drivers
+ *
+ * @buffer_index: array index of &struct drv_ipa_buffer_info
+ * @offset:       offset from the top of the heap instance
+ */
+struct drv_ipa_addr {
+	__u32 buffer_index;
+	__u32 offset;
+};
+
+#define IPA_BUFFER_INDEX_MAX (16)
+#define IPA_INVALID_ADDR                                                                           \
+	{                                                                                          \
+		.buffer_index = 0xffffffffu, .offset = 0xffffffffu                                 \
+	}
+
+static inline struct drv_ipa_addr drv_ipa_invalid_addr(void)
+{
+	struct drv_ipa_addr invalid_addr = IPA_INVALID_ADDR;
+	return invalid_addr;
+}
+
+static inline bool drv_ipa_is_invalid_addr(struct drv_ipa_addr addr)
+{
+	struct drv_ipa_addr invalid_addr = IPA_INVALID_ADDR;
+
+	if (addr.buffer_index == invalid_addr.buffer_index && addr.offset == invalid_addr.offset) {
+		return true;
+	}
+	return false;
+}
+
+#define IOC_IPA_MAGIC	   'I'
+#define IOC_IPA_START	   _IO(IOC_IPA_MAGIC, 0)
+#define IOC_IPA_GET_STATUS _IO(IOC_IPA_MAGIC, 1)
+
+#endif /* _UAPI_LINUX_IPA_H */
-- 
2.17.1


