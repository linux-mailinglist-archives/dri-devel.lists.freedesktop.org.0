Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A5E511858
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 15:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED2510EAE5;
	Wed, 27 Apr 2022 13:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1514.securemx.jp [210.130.202.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C55D10E24B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 13:29:12 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 23RDSsXO001891;
 Wed, 27 Apr 2022 22:28:54 +0900
X-Iguazu-Qid: 34tKMNGQI7XTpuRrbk
X-Iguazu-QSIG: v=2; s=0; t=1651066134; q=34tKMNGQI7XTpuRrbk;
 m=jaTS3+mnfMLU4holnXdOhIE32hf6PMV7iMp2cWpZfqw=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1511) id 23RDSrI3004341
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 22:28:53 +0900
X-SA-MID: 3264137
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 3/4] soc: visconti: Add Toshiba Visconti AFFINE image
 processing accelerator
Date: Wed, 27 Apr 2022 22:23:44 +0900
X-TSB-HOP2: ON
Message-Id: <20220427132345.27327-4-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427132345.27327-1-yuji2.ishikawa@toshiba.co.jp>
References: <20220427132345.27327-1-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, yuji2.ishikawa@toshiba.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds support to AFFINE image processing accelerator on Toshiba Visconti ARM SoCs.
This accelerator supoorts affine transform, lens undistortion and LUT transform.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
v1 -> v2:
  - apply checkpatch.pl --strict
  - renamed identifiers; hwd_AFFINE_xxxx to hwd_affine_xxxx
---
 drivers/soc/visconti/Kconfig                 |   6 +
 drivers/soc/visconti/Makefile                |   2 +
 drivers/soc/visconti/affine/Makefile         |   6 +
 drivers/soc/visconti/affine/affine.c         | 451 +++++++++++++++++++
 drivers/soc/visconti/affine/hwd_affine.c     | 206 +++++++++
 drivers/soc/visconti/affine/hwd_affine.h     |  83 ++++
 drivers/soc/visconti/affine/hwd_affine_reg.h |  45 ++
 drivers/soc/visconti/uapi/affine.h           |  87 ++++
 8 files changed, 886 insertions(+)
 create mode 100644 drivers/soc/visconti/affine/Makefile
 create mode 100644 drivers/soc/visconti/affine/affine.c
 create mode 100644 drivers/soc/visconti/affine/hwd_affine.c
 create mode 100644 drivers/soc/visconti/affine/hwd_affine.h
 create mode 100644 drivers/soc/visconti/affine/hwd_affine_reg.h
 create mode 100644 drivers/soc/visconti/uapi/affine.h

diff --git a/drivers/soc/visconti/Kconfig b/drivers/soc/visconti/Kconfig
index 8b1378917..01583d407 100644
--- a/drivers/soc/visconti/Kconfig
+++ b/drivers/soc/visconti/Kconfig
@@ -1 +1,7 @@
+if ARCH_VISCONTI
+
+config VISCONTI_AFFINE
+    bool "Visconti Affine driver"
+
+endif
 
diff --git a/drivers/soc/visconti/Makefile b/drivers/soc/visconti/Makefile
index 8d710da08..b25a726c3 100644
--- a/drivers/soc/visconti/Makefile
+++ b/drivers/soc/visconti/Makefile
@@ -4,3 +4,5 @@
 #
 
 obj-y += ipa_common.o
+
+obj-$(CONFIG_VISCONTI_AFFINE) += affine/
diff --git a/drivers/soc/visconti/affine/Makefile b/drivers/soc/visconti/affine/Makefile
new file mode 100644
index 000000000..82f83b2d6
--- /dev/null
+++ b/drivers/soc/visconti/affine/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti AFFINE driver
+#
+
+obj-y += affine.o hwd_affine.o
diff --git a/drivers/soc/visconti/affine/affine.c b/drivers/soc/visconti/affine/affine.c
new file mode 100644
index 000000000..eea045dcf
--- /dev/null
+++ b/drivers/soc/visconti/affine/affine.c
@@ -0,0 +1,451 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/wait.h>
+
+#include "hwd_affine.h"
+#include "../ipa_common.h"
+#include "../uapi/affine.h"
+
+struct affine_priv {
+	struct device *dev;
+	struct miscdevice miscdev;
+	struct mutex lock;
+	void __iomem *regs;
+	int irq;
+	wait_queue_head_t waitq;
+	enum drv_ipa_state status;
+	unsigned int hwd_event;
+	unsigned int poll_event;
+	int id;
+	char name[16];
+	bool dma_coherent;
+	struct hwd_affine_status hwd_status;
+
+	struct dma_buf_attachment *dba[DRV_AFFINE_BUFFER_INDEX_MAX];
+	struct sg_table *sgt[DRV_AFFINE_BUFFER_INDEX_MAX];
+	enum dma_data_direction dma_dir[DRV_AFFINE_BUFFER_INDEX_MAX];
+	unsigned int dma_count;
+
+	dma_addr_t buffer_iova[DRV_AFFINE_BUFFER_INDEX_MAX];
+};
+
+static u32 affine_ipa_addr_to_iova(struct affine_priv *priv, struct drv_ipa_addr addr)
+{
+	u32 iova = 0;
+
+	if (addr.buffer_index < priv->dma_count &&
+	    addr.offset < priv->dba[addr.buffer_index]->dmabuf->size)
+		iova = priv->buffer_iova[addr.buffer_index] + addr.offset;
+	return iova;
+}
+
+static int affine_attach_dma_buf(struct affine_priv *priv, unsigned int buffer_index,
+				 struct drv_ipa_buffer_info *buffer_info)
+{
+	int ret = 0;
+	dma_addr_t addr;
+
+	if (buffer_index >= DRV_AFFINE_BUFFER_INDEX_MAX) {
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
+	if (!buffer_info[buffer_index].coherent) {
+		priv->dev->dma_coherent = false;
+		if (priv->dma_coherent)
+			priv->dma_dir[priv->dma_count] = DMA_NONE;
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
+	priv->dev->dma_coherent = priv->dma_coherent;
+
+	return ret;
+}
+
+static void affine_detach_dma_buf(struct affine_priv *priv)
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
+static irqreturn_t affine_irq(int irq, void *dev_id)
+{
+	struct affine_priv *priv = dev_id;
+
+	priv->hwd_event = hwd_affine_irq_handler(priv->id);
+
+	disable_irq_nosync(priv->irq);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t affine_irq_thread(int irq, void *dev_id)
+{
+	struct affine_priv *priv = dev_id;
+	unsigned long delay = 1;
+
+	mutex_lock(&priv->lock);
+	affine_detach_dma_buf(priv);
+
+	hwd_affine_get_status(priv->id, &priv->hwd_status);
+
+	priv->status = DRV_IPA_STATE_IDLE;
+
+	/* status should be updated before poll_event so that
+	 * when poll() returns, user context must observe state as idle
+	 */
+	smp_wmb();
+
+	if (priv->hwd_event == HWD_AFFINE_EVENT_DONE)
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
+static void affine_start(struct affine_priv *priv, struct hwd_affine_descriptor *desc)
+{
+	hwd_affine_start(priv->id, desc);
+}
+
+static int affine_ioctl_start(struct affine_priv *priv, unsigned long arg)
+{
+	struct hwd_affine_descriptor hwd_desc;
+	struct drv_affine_descriptor desc;
+	int ret = 0;
+	int i;
+
+	ret = mutex_lock_interruptible(&priv->lock);
+	if (ret)
+		return ret;
+
+	if (priv->status == DRV_IPA_STATE_BUSY) {
+		dev_dbg(priv->dev, "busy: %d\n", priv->status);
+		ret = -EBUSY;
+		goto err1;
+	}
+
+	if (copy_from_user(&desc, (void __user *)arg, sizeof(struct drv_affine_descriptor))) {
+		dev_err(priv->dev, "Descriptor memory access error\n");
+		ret = -EFAULT;
+		goto err1;
+	}
+
+	if (DRV_AFFINE_BIT_CONFIG_DESC_FINAL !=
+	    (desc.config_done & DRV_AFFINE_BIT_CONFIG_DESC_FINAL)) {
+		dev_err(priv->dev, "Descriptor configuration not complete\n");
+		ret = -EINVAL;
+		goto err1;
+	}
+
+	priv->dma_count = 0;
+
+	/* setup buffer */
+	for (i = 0; i < desc.buffer_info_num; i++) {
+		ret = affine_attach_dma_buf(priv, i, desc.buffer_info);
+		if (ret) {
+			dev_err(priv->dev, "dma buf attach error: index=%d\n", i);
+			goto err2;
+		}
+		dev_dbg(priv->dev, "@buffer[%d]@: fd=%d %s iova=%llx\n", i, desc.buffer_info[i].fd,
+			desc.buffer_info[i].coherent ? "coherent" : "non-coherent",
+			(uint64_t)priv->buffer_iova[i]);
+	}
+
+	memcpy(&hwd_desc, &desc, sizeof(struct hwd_affine_descriptor));
+
+	hwd_desc.src_addr = affine_ipa_addr_to_iova(priv, desc.src_addr);
+	if (hwd_desc.src_addr == 0) {
+		dev_err(priv->dev, "IPA address to iova conversion error: src_addr %s: %d\n",
+			__func__, __LINE__);
+		ret = -EINVAL;
+		goto err2;
+	}
+
+	hwd_desc.dst_addr = affine_ipa_addr_to_iova(priv, desc.dst_addr);
+	if (hwd_desc.dst_addr == 0) {
+		dev_err(priv->dev, "IPA address to iova conversion error: dst_addr %s: %d\n",
+			__func__, __LINE__);
+		ret = -EINVAL;
+		goto err2;
+	}
+
+	hwd_desc.tbl_addr = 0;
+	if (desc.tbl_ptch != 0) {
+		hwd_desc.tbl_addr = affine_ipa_addr_to_iova(priv, desc.tbl_addr);
+		if (hwd_desc.tbl_addr == 0) {
+			dev_err(priv->dev,
+				"IPA address to iova conversion error: tbl_addr %s: %d\n", __func__,
+				__LINE__);
+			ret = -EINVAL;
+			goto err2;
+		}
+	}
+
+	dev_dbg(priv->dev, "src: 0x%x\n", hwd_desc.src_addr);
+	dev_dbg(priv->dev, "dst: 0x%x\n", hwd_desc.dst_addr);
+	dev_dbg(priv->dev, "tbl: 0x%x\n", hwd_desc.tbl_addr);
+
+	affine_start(priv, &hwd_desc);
+
+	priv->poll_event = IPA_POLL_EVENT_NONE;
+	priv->hwd_event = 0;
+	priv->status = DRV_IPA_STATE_BUSY;
+	/* Barrier to prevent affine_irq() from setting priv->hwd_event
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
+	affine_detach_dma_buf(priv);
+err1:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int affine_ioctl_get_status(struct affine_priv *priv, unsigned long arg)
+{
+	struct drv_affine_status status;
+	struct hwd_affine_status hwd_status;
+	int ret = 0;
+
+	ret = mutex_lock_interruptible(&priv->lock);
+	if (ret)
+		return ret;
+
+	if (priv->status == DRV_IPA_STATE_BUSY)
+		hwd_affine_get_status(priv->id, &hwd_status);
+	else
+		hwd_status = priv->hwd_status;
+
+	status.state = priv->status;
+	mutex_unlock(&priv->lock);
+
+	status.comp_lack_data = hwd_status.comp_lack_data;
+	status.comp_over_coordinate = hwd_status.comp_over_coordinate;
+	status.comp_over_data = hwd_status.comp_over_data;
+	status.comp_size = hwd_status.comp_size;
+	status.comp_syntax_error = hwd_status.comp_syntax_error;
+	if (copy_to_user((void __user *)arg, &status, sizeof(struct drv_affine_status))) {
+		dev_err(priv->dev, "status memory access error\n");
+		ret = -EFAULT;
+	}
+
+	return ret;
+}
+
+static long affine_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct affine_priv *priv = container_of(fp->private_data, struct affine_priv, miscdev);
+	int ret = 0;
+
+	switch (cmd) {
+	case IOC_IPA_START:
+		ret = affine_ioctl_start(priv, arg);
+		break;
+	case IOC_IPA_GET_STATUS:
+		ret = affine_ioctl_get_status(priv, arg);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+
+	return ret;
+}
+
+static __poll_t affine_poll(struct file *fp, poll_table *wait)
+{
+	struct affine_priv *priv = container_of(fp->private_data, struct affine_priv, miscdev);
+	__poll_t mask = 0;
+	unsigned int poll_event;
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
+static const struct file_operations affine_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = affine_ioctl,
+	.poll = affine_poll,
+};
+
+static int affine_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct affine_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+
+	/* update DMA mask */
+	priv->dma_coherent = dev->dma_coherent;
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
+	if (ret)
+		return ret;
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0) {
+		dev_err(dev, "failed to acquire irq resource\n");
+		return -ENOENT;
+	}
+	ret = devm_request_threaded_irq(dev, priv->irq, affine_irq, affine_irq_thread, 0, "affine",
+					priv);
+	if (ret) {
+		dev_err(dev, "irq request failed\n");
+		return ret;
+	}
+	disable_irq(priv->irq);
+
+	ret = of_property_read_u32(dev->of_node, "index", &priv->id);
+	if (ret) {
+		dev_err(dev, "failed to acquire irq resource\n");
+		return ret;
+	}
+
+	hwd_affine_initialize(priv->id, priv->regs);
+
+	snprintf(priv->name, sizeof(priv->name), "affine%d", priv->id);
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = priv->name;
+	priv->miscdev.fops = &affine_fops;
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		dev_err(dev, "misc registration failed\n");
+		hwd_affine_uninitialize(priv->id);
+		return ret;
+	}
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
+static int affine_remove(struct platform_device *pdev)
+{
+	struct affine_priv *priv = platform_get_drvdata(pdev);
+
+	misc_deregister(&priv->miscdev);
+	hwd_affine_uninitialize(priv->id);
+	return 0;
+}
+
+static const struct of_device_id affine_of_match[] = {
+	{
+		.compatible = "toshiba,visconti-affine",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, affine_of_match);
+
+static struct platform_driver affine_driver = {
+	.probe = affine_probe,
+	.remove = affine_remove,
+	.driver = {
+		.name = "visconti_affine",
+		.of_match_table = of_match_ptr(affine_of_match),
+	},
+};
+module_platform_driver(affine_driver);
+
+MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti affine driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/soc/visconti/affine/hwd_affine.c b/drivers/soc/visconti/affine/hwd_affine.c
new file mode 100644
index 000000000..6720a0212
--- /dev/null
+++ b/drivers/soc/visconti/affine/hwd_affine.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+
+#include "hwd_affine.h"
+#include "hwd_affine_reg.h"
+
+#define HWD_AFFINE_CLEAR_BITS	  GENMASK(15, 0)
+#define HWD_AFFINE_INTMASK_NORMAL (0x04100)
+
+#define HWD_AFFINE_INT_END	  BIT(0)
+#define HWD_AFFINE_INT_TCOMP_ERR0 BIT(16)
+#define HWD_AFFINE_INT_TCOMP_ERR1 BIT(17)
+#define HWD_AFFINE_INT_TCOMP_ERR2 BIT(18)
+#define HWD_AFFINE_INT_TCOMP_ERR3 BIT(19)
+#define HWD_AFFINE_INT_TCOMP_SIZE BIT(20)
+
+#define HWD_AFFINE_HWD_MASK_ADDR GENMASK(31, 0)
+
+#define HWD_AFFINE_START_CMD BIT(0)
+
+/**
+ * struct hwd_affine_resources - HWD driver internal resource structure
+ */
+struct hwd_affine_resources {
+	struct hwd_affine_reg *reg;
+	struct hwd_affine_status status;
+};
+
+/* HWD driver internal resource */
+static struct hwd_affine_resources hwd_affine_resources[HWD_AFFINE_DEVICE_MAX] = {};
+
+/**
+ * hwd_affine_initialize() - Initialize AFFINE device
+ *
+ * @module_id: @ref hwd_affine_device "id" of the h/w module
+ * @vaddr: register base virtual address
+ */
+void hwd_affine_initialize(u32 module_id, void *vaddr)
+{
+	struct hwd_affine_resources *res = &hwd_affine_resources[module_id];
+
+	/* Initialize the device */
+	res->reg = (struct hwd_affine_reg *)vaddr;
+}
+
+/**
+ * hwd_affine_uninitialize() - Uninitialize AFFINE device
+ *
+ * @module_id: @ref hwd_affine_device "id" of the h/w module
+ */
+void hwd_affine_uninitialize(u32 module_id)
+{
+	struct hwd_affine_resources *res = &hwd_affine_resources[module_id];
+
+	/* Deinitialize the device */
+	res->reg = NULL;
+}
+
+#define NUM_AFFINE_PARAMS  6
+#define NUM_HOMO_PARAMS	   3
+#define NUM_DISTORT_PARAMS 12
+
+/**
+ * hwd_affine_start() - Start AFFINE device
+ *
+ * @module_id: @ref hwd_affine_device "id" of the h/w module
+ * @desc: Pointer to AFFINE descriptor structure
+ */
+void hwd_affine_start(u32 module_id, const struct hwd_affine_descriptor *desc)
+{
+	struct hwd_affine_resources *res = &hwd_affine_resources[module_id];
+	struct hwd_affine_reg *reg;
+	int i;
+
+	reg = res->reg;
+
+	/* Initialize status */
+	res->status.comp_syntax_error = 0;
+	res->status.comp_over_coordinate = 0;
+	res->status.comp_over_data = 0;
+	res->status.comp_lack_data = 0;
+	res->status.comp_size = 0;
+
+	/* Clear interrupt status */
+	writel(HWD_AFFINE_CLEAR_BITS, &reg->statc);
+
+	/* Reset T_RST bit, C_RST bit, and O_RST bits*/
+	writel(desc->ctrl, &reg->ctrl);
+	readl(&reg->ctrl);
+
+	writel(desc->src_size, &reg->src_size);
+	writel((u32)(desc->src_addr & HWD_AFFINE_HWD_MASK_ADDR), &reg->src_addr);
+	writel(desc->dst_bgn, &reg->dst_bgn);
+	writel(desc->dst_size, &reg->dst_size);
+	writel((u32)(desc->dst_addr & HWD_AFFINE_HWD_MASK_ADDR), &reg->dst_addr);
+	writel(desc->l_ptch, &reg->l_ptch);
+
+	for (i = 0; i < NUM_AFFINE_PARAMS; i++)
+		writel(desc->affine_param[i], &reg->affine_param[i]);
+
+	for (i = 0; i < NUM_HOMO_PARAMS; i++)
+		writel(desc->homo_param[i], &reg->homo_param[i]);
+
+	/* AFFINE Table */
+	writel((u32)(desc->tbl_addr & HWD_AFFINE_HWD_MASK_ADDR), &reg->tbl_addr);
+	writel(desc->tbl_ptch, &reg->tbl_ptch);
+	writel(desc->tbl_comp_size, &reg->tbl_comp_size);
+
+	for (i = 0; i < NUM_DISTORT_PARAMS; i++)
+		writel(desc->dist_param[i], &reg->dist_param[i]);
+
+	writel(HWD_AFFINE_INTMASK_NORMAL, &reg->intm);
+
+	writel(desc->mode, &reg->mode);
+	writel(desc->mode2, &reg->mode2);
+	writel(desc->adj_p, &reg->adj_p);
+
+	/* Data Sync */
+	dsb(st);
+
+	/* Kick AFFINE */
+	writel(HWD_AFFINE_START_CMD, &reg->ctrl);
+}
+
+/**
+ * hwd_affine_irq_handler() - HWD AFFINE interrupt handler
+ *
+ * @module_id: @ref hwd_affine_device "id" of the h/w module
+ * Return: following bitfields
+ * - HWD_AFFINE_EVENT_DONE: HW processing is completed
+ * - HWD_AFFINE_EVENT_SYNTAX_ERROR: HW Table Syntax error
+ * - HWD_AFFINE_EVENT_OVER_COORD: HW Table decoding coordinate error
+ * - HWD_AFFINE_EVENT_OVER_DATA: HW Table over compressed data error
+ * - HWD_AFFINE_EVENT_LACK_DATA: HW Table compressed data insufficient error
+ * - HWD_AFFINE_EVENT_SIZE_ERROR: HW Table smaller than the size actual size of compressed data
+ */
+u32 hwd_affine_irq_handler(u32 module_id)
+{
+	u32 event = 0;
+	struct hwd_affine_resources *res = &hwd_affine_resources[module_id];
+	struct hwd_affine_reg *reg;
+	u32 cause;
+
+	reg = res->reg;
+
+	/* Read and Clear the interrupt causes */
+	cause = readl(&reg->statc);
+	writel(cause, &reg->statc);
+
+	if (cause & HWD_AFFINE_INT_END)
+		/* Execution End */
+		event |= HWD_AFFINE_EVENT_DONE;
+
+	if (cause & HWD_AFFINE_INT_TCOMP_ERR0) {
+		/* Syntax error */
+		res->status.comp_syntax_error = 1;
+		event |= HWD_AFFINE_EVENT_SYNTAX_ERROR;
+	}
+
+	if (cause & HWD_AFFINE_INT_TCOMP_ERR1) {
+		/* Decoding coordinate error */
+		res->status.comp_over_coordinate = 1;
+		event |= HWD_AFFINE_EVENT_OVER_COORD;
+	}
+
+	if (cause & HWD_AFFINE_INT_TCOMP_ERR2) {
+		/* Over compressed data error */
+		res->status.comp_over_data = 1;
+		event |= HWD_AFFINE_EVENT_OVER_DATA;
+	}
+
+	if (cause & HWD_AFFINE_INT_TCOMP_ERR3) {
+		/* Compressed data insufficient error */
+		res->status.comp_lack_data = 1;
+		event |= HWD_AFFINE_EVENT_LACK_DATA;
+	}
+
+	if (cause & HWD_AFFINE_INT_TCOMP_SIZE) {
+		/* Smaller than the actual size of compressed data */
+		res->status.comp_size = 1;
+		event |= HWD_AFFINE_EVENT_SIZE_ERROR;
+	}
+
+	return event;
+}
+
+/**
+ * hwd_affine_get_status() - HWD AFFINE Get Status
+ *
+ * @module_id: @ref hwd_affine_device "id" of the h/w module
+ * @status: Pointer to status structure
+ * Return: RETURN_OK operation completed successfully
+ */
+void hwd_affine_get_status(u32 module_id, struct hwd_affine_status *status)
+{
+	const struct hwd_affine_resources *res = &hwd_affine_resources[module_id];
+
+	*status = res->status;
+}
diff --git a/drivers/soc/visconti/affine/hwd_affine.h b/drivers/soc/visconti/affine/hwd_affine.h
new file mode 100644
index 000000000..ed17b1116
--- /dev/null
+++ b/drivers/soc/visconti/affine/hwd_affine.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef HWD_AFFINE_H
+#define HWD_AFFINE_H
+
+/**
+ * enum hwd_affine_device_id - AFFINE HWD Device ID
+ */
+enum hwd_affine_device_id {
+	HWD_AFFINE_DEVICE_0 = 0,
+	HWD_AFFINE_DEVICE_1 = 1,
+	HWD_AFFINE_DEVICE_MAX = 2,
+};
+
+/* hwd_affine_event_flags - Macro for Affine driver events */
+#define HWD_AFFINE_EVENT_DONE	      BIT(0)
+#define HWD_AFFINE_EVENT_SYNTAX_ERROR BIT(1)
+#define HWD_AFFINE_EVENT_OVER_COORD   BIT(2)
+#define HWD_AFFINE_EVENT_OVER_DATA    BIT(3)
+#define HWD_AFFINE_EVENT_LACK_DATA    BIT(4)
+#define HWD_AFFINE_EVENT_SIZE_ERROR   BIT(5)
+#define HWD_AFFINE_EVENT_MAX	      BIT(6)
+
+/* hwd_affine_param_num_flags Macro for Affine parameter number */
+#define HWD_AFFINE_AFFINE_PARAM_NUM	 (6U)
+#define HWD_AFFINE_UNDIST_PARAM_NUM	 (12U)
+#define HWD_AFFINE_HOMO_PARAM_NUM	 (3U)
+#define HWD_AFFINE_TEMP_UNDIST_PARAM_NUM (10U)
+
+/**
+ * struct hwd_affine_status - HWD Affine status
+ * @comp_size: Setting size is smaller than actual size
+ * @comp_lack_data: Compressed table is lacking enough data for processing
+ * @comp_over_data: Compressed table is exceeding the limit of data that can be processed
+ * @comp_over_coordinate: Number of coordinates in compressed table data exceeded the limit
+ * @comp_syntax_error: Syntax error of compressed table has occurred
+ * @reserved: Padding
+ */
+struct hwd_affine_status {
+	u32 comp_size : 1;
+	u32 comp_lack_data : 1;
+	u32 comp_over_data : 1;
+	u32 comp_over_coordinate : 1;
+	u32 comp_syntax_error : 1;
+	u32 reserved : 27;
+};
+
+/**
+ * struct hwd_affine_descriptor - HWD AFFINE Descriptor
+ */
+struct hwd_affine_descriptor {
+	u32 ctrl;
+	u32 mode2;
+	u32 mode;
+	u32 adj_p;
+	u32 src_size;
+	u32 src_addr;
+	u32 dst_bgn;
+	u32 dst_size;
+	u32 dst_addr;
+	u32 l_ptch;
+	u32 tbl_addr;
+	u32 tbl_ptch;
+	u32 affine_param[HWD_AFFINE_AFFINE_PARAM_NUM];
+	u32 dist_param[HWD_AFFINE_UNDIST_PARAM_NUM];
+	u32 homo_param[HWD_AFFINE_HOMO_PARAM_NUM];
+	u32 tbl_comp_size;
+	float temp_dist_p[HWD_AFFINE_TEMP_UNDIST_PARAM_NUM];
+	u16 config_done;
+};
+
+void hwd_affine_initialize(u32 module_id, void *vaddr);
+void hwd_affine_uninitialize(u32 module_id);
+void hwd_affine_start(u32 module_id, const struct hwd_affine_descriptor *desc);
+u32 hwd_affine_irq_handler(u32 module_id);
+void hwd_affine_get_status(u32 module_id, struct hwd_affine_status *status);
+
+#endif /* HWD_AFFINE_H */
diff --git a/drivers/soc/visconti/affine/hwd_affine_reg.h b/drivers/soc/visconti/affine/hwd_affine_reg.h
new file mode 100644
index 000000000..407d898fa
--- /dev/null
+++ b/drivers/soc/visconti/affine/hwd_affine_reg.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef HWD_AFFINE_REG_H
+#define HWD_AFFINE_REG_H
+
+/* hwd_affine_params_num_flags - Macro for Affine parameter number */
+#define HWD_AFFINE_AFFINE_PARAMS_NUM (6)
+#define HWD_AFFINE_UNDIST_PARAMS_NUM (12)
+#define HWD_AFFINE_HOMO_PARAMS_NUM   (3)
+#define HWD_AFFINE_RESERVED	     (472)
+
+/**
+ * struct hwd_affine_reg - Structure of Affine register descriptor
+ */
+struct hwd_affine_reg {
+	u32 ctrl;
+	u32 reserved0[2];
+	u32 mode2;
+	u32 mode;
+	u32 adj_p;
+	u32 intm;
+	u32 statc;
+	u32 out_lpos;
+	u32 src_size;
+	u32 src_addr;
+	u32 dst_bgn;
+	u32 dst_size;
+	u32 dst_addr;
+	u32 l_ptch;
+	u32 tbl_addr;
+	u32 tbl_ptch;
+	u32 affine_param[HWD_AFFINE_AFFINE_PARAMS_NUM];
+	u32 dist_param[HWD_AFFINE_UNDIST_PARAMS_NUM];
+	u32 reserved1;
+	u32 homo_param[HWD_AFFINE_HOMO_PARAMS_NUM];
+	u32 tbl_comp_size;
+	u32 reserved2[HWD_AFFINE_RESERVED];
+};
+
+#endif /* HWD_AFFINE_REG_H */
diff --git a/drivers/soc/visconti/uapi/affine.h b/drivers/soc/visconti/uapi/affine.h
new file mode 100644
index 000000000..539261483
--- /dev/null
+++ b/drivers/soc/visconti/uapi/affine.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * (C) Copyright 2020 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef _UAPI_LINUX_AFIINE_H
+#define _UAPI_LINUX_AFIINE_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+#include "ipa.h"
+
+#define DRV_AFFINE_BIT_CONFIG_DESC_FINAL (0x8000U)
+#define DRV_AFFINE_BUFFER_INDEX_MAX	 (3)
+
+#define DRV_AFFINE_AFFINE_PARAM_NUM	 (6U)
+#define DRV_AFFINE_UNDIST_PARAM_NUM	 (12U)
+#define DRV_AFFINE_HOMO_PARAM_NUM	 (3U)
+#define DRV_AFFINE_TEMP_UNDIST_PARAM_NUM (10U)
+
+/**
+ * struct drv_affine_status - AFFINE IPA status for IOC_IPA_GET_STATUS
+ * @state:                State of driver
+ * @comp_size:            Setting size is smaller than actual size
+ * @comp_lack_data:       Compressed table is lacking enough data for processing
+ * @comp_over_data:       Compressed table is exceeding the limit of data that can be processed
+ * @comp_over_coordinate: Number of coordinates in compressed table data exceeded the limit
+ * @comp_syntax_error:    Syntax error of compressed table has occurred
+ * @reserved:             Padding
+ */
+struct drv_affine_status {
+	enum drv_ipa_state state;
+	uint32_t comp_size : 1;
+	uint32_t comp_lack_data : 1;
+	uint32_t comp_over_data : 1;
+	uint32_t comp_over_coordinate : 1;
+	uint32_t comp_syntax_error : 1;
+	uint32_t reserved : 27;
+};
+
+/**
+ * struct drv_affine_descriptor - AFFINE IPA descriptor for IOC_IPA_START
+ * @ctrl:            Operation control of AFFINE
+ * @mode2:           Operation mode for the AFFINE execution
+ * @mode:            Operation mode for the AFFINE execution
+ * @adj_p:           Output Pixel Value Adjustment
+ * @src_size:        Input image size
+ * @src_addr:        Start address of input image
+ * @dst_bgn:         Start coordinate of the output rectangle area
+ * @dst_size:        Size of the output rectangle area
+ * @dst_addr:        Address of the output rectangle area
+ * @l_ptch:          Line pitch of both the input image and output rectangle area
+ * @tbl_addr:        Start address of the table used in the table conversion mode.
+ * @tbl_ptch:        Line pitch of the table used in the table conversion mode
+ * @affine_param:    Parameters for Affine transformation
+ * @dist_param:      Parameters for Distortion correction
+ * @homo_param:      Parameters Homography transformation
+ * @tbl_comp_size:   Table compression size
+ * @temp_dist_p:     Temporary buffer to hold distortion input parameters
+ * @config_done:     Flags of called configuration
+ * @buffer_info:     Table of buffer information
+ * @buffer_info_num: Number of buffer_info
+ */
+struct drv_affine_descriptor {
+	uint32_t ctrl;
+	uint32_t mode2;
+	uint32_t mode;
+	uint32_t adj_p;
+	uint32_t src_size;
+	struct drv_ipa_addr src_addr;
+	uint32_t dst_bgn;
+	uint32_t dst_size;
+	struct drv_ipa_addr dst_addr;
+	uint32_t l_ptch;
+	struct drv_ipa_addr tbl_addr;
+	uint32_t tbl_ptch;
+	uint32_t affine_param[DRV_AFFINE_AFFINE_PARAM_NUM];
+	uint32_t dist_param[DRV_AFFINE_UNDIST_PARAM_NUM];
+	uint32_t homo_param[DRV_AFFINE_HOMO_PARAM_NUM];
+	uint32_t tbl_comp_size;
+	float temp_dist_p[DRV_AFFINE_TEMP_UNDIST_PARAM_NUM];
+	uint16_t config_done;
+	struct drv_ipa_buffer_info buffer_info[DRV_AFFINE_BUFFER_INDEX_MAX];
+	int32_t buffer_info_num;
+};
+
+#endif /* _UAPI_LINUX_AFIINE_H */
-- 
2.17.1


