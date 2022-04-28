Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49375134B5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7128A10EA6E;
	Thu, 28 Apr 2022 13:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFC210E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 13:16:51 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 23SDGbV6028134;
 Thu, 28 Apr 2022 22:16:37 +0900
X-Iguazu-Qid: 34tKGLvGMjfTNBOyPs
X-Iguazu-QSIG: v=2; s=0; t=1651151797; q=34tKGLvGMjfTNBOyPs;
 m=d2KuCK8xhUlJ6ivCuLHzKJumf/hYRZfr7tFXLoXjHiE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1511) id 23SDGawl015573
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 22:16:36 +0900
X-SA-MID: 37013504
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 3/4] soc: visconti: Add Toshiba Visconti DNN image processing
 accelerator
Date: Thu, 28 Apr 2022 22:11:27 +0900
X-TSB-HOP2: ON
Message-Id: <20220428131128.5053-4-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
References: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
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

Add support to DNN image processing accelerator on Toshiba Visconti ARM SoCs.
The accelerator is applicable to DNN inference tasks.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/soc/visconti/Kconfig           |   6 +
 drivers/soc/visconti/Makefile          |   2 +
 drivers/soc/visconti/dnn/Makefile      |   6 +
 drivers/soc/visconti/dnn/dnn.c         | 533 +++++++++++++++++++++++++
 drivers/soc/visconti/dnn/hwd_dnn.c     | 183 +++++++++
 drivers/soc/visconti/dnn/hwd_dnn.h     |  68 ++++
 drivers/soc/visconti/dnn/hwd_dnn_reg.h | 228 +++++++++++
 drivers/soc/visconti/uapi/dnn.h        |  77 ++++
 8 files changed, 1103 insertions(+)
 create mode 100644 drivers/soc/visconti/dnn/Makefile
 create mode 100644 drivers/soc/visconti/dnn/dnn.c
 create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.c
 create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.h
 create mode 100644 drivers/soc/visconti/dnn/hwd_dnn_reg.h
 create mode 100644 drivers/soc/visconti/uapi/dnn.h

diff --git a/drivers/soc/visconti/Kconfig b/drivers/soc/visconti/Kconfig
index 8b1378917..a25287d0c 100644
--- a/drivers/soc/visconti/Kconfig
+++ b/drivers/soc/visconti/Kconfig
@@ -1 +1,7 @@
+if ARCH_VISCONTI
+
+config VISCONTI_DNN
+    bool "Visconti DNN driver"
+
+endif
 
diff --git a/drivers/soc/visconti/Makefile b/drivers/soc/visconti/Makefile
index 8d710da08..b9bd0f7e2 100644
--- a/drivers/soc/visconti/Makefile
+++ b/drivers/soc/visconti/Makefile
@@ -4,3 +4,5 @@
 #
 
 obj-y += ipa_common.o
+
+obj-$(CONFIG_VISCONTI_DNN) += dnn/
diff --git a/drivers/soc/visconti/dnn/Makefile b/drivers/soc/visconti/dnn/Makefile
new file mode 100644
index 000000000..52d57b60d
--- /dev/null
+++ b/drivers/soc/visconti/dnn/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti DNN driver
+#
+
+obj-y += dnn.o hwd_dnn.o
diff --git a/drivers/soc/visconti/dnn/dnn.c b/drivers/soc/visconti/dnn/dnn.c
new file mode 100644
index 000000000..aeff92037
--- /dev/null
+++ b/drivers/soc/visconti/dnn/dnn.c
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti DNN Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/wait.h>
+
+#include "../ipa_common.h"
+#include "../uapi/dnn.h"
+#include "hwd_dnn.h"
+
+struct dnn_priv {
+	struct device *dev;
+	struct miscdevice miscdev;
+	struct mutex lock;
+	void __iomem *regs;
+	int irq;
+	wait_queue_head_t waitq;
+	enum drv_ipa_state status;
+	unsigned int poll_event;
+	int id;
+	char name[16];
+	bool dma_coherent;
+	struct hwd_dnn_status hwd_status;
+
+	u32 *list_vaddr[DRV_DNN_BASE_ADDR_NUM];
+	dma_addr_t list_paddr[DRV_DNN_BASE_ADDR_NUM];
+	unsigned int err_flags[HWD_DNN_EER_FLAG_NUM];
+
+	struct dma_buf_attachment *dba[DRV_DNN_BUFFER_INDEX_MAX];
+	struct sg_table *sgt[DRV_DNN_BUFFER_INDEX_MAX];
+	enum dma_data_direction dma_dir[DRV_DNN_BUFFER_INDEX_MAX];
+	unsigned int dma_count;
+
+	dma_addr_t buffer_iova[DRV_DNN_BUFFER_INDEX_MAX];
+
+	struct drv_ipa_addr temp_list[HWD_DNN_LIST_NUM_MAX];
+};
+
+static uint32_t dnn_ipa_addr_to_iova(struct dnn_priv *priv, struct drv_ipa_addr addr)
+{
+	u32 iova = 0;
+
+	if (addr.buffer_index < priv->dma_count &&
+	    addr.offset < priv->dba[addr.buffer_index]->dmabuf->size)
+		iova = priv->buffer_iova[addr.buffer_index] + addr.offset;
+	return iova;
+}
+
+static int dnn_attach_dma_buf(struct dnn_priv *priv, unsigned int buffer_index,
+			      struct drv_ipa_buffer_info buffer_info[DRV_DNN_BUFFER_INDEX_MAX])
+{
+	int ret = 0;
+	dma_addr_t addr;
+
+	if (buffer_index >= DRV_DNN_BUFFER_INDEX_MAX) {
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
+static void dnn_detach_dma_buf(struct dnn_priv *priv)
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
+static irqreturn_t dnn_irq(int irq, void *dev_id)
+{
+	struct dnn_priv *priv = dev_id;
+	unsigned int event;
+
+	event = hwd_dnn_irq_handler(priv->id);
+
+	if (event & HWD_DNN_EVENT_EXEC_DONE) {
+		disable_irq_nosync(priv->irq);
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t dnn_irq_thread(int irq, void *dev_id)
+{
+	struct dnn_priv *priv = dev_id;
+	unsigned long delay = 1;
+
+	mutex_lock(&priv->lock);
+	dnn_detach_dma_buf(priv);
+
+	hwd_dnn_get_status(priv->id, &priv->hwd_status);
+
+	priv->status = DRV_IPA_STATE_IDLE;
+
+	/* status should be updated before poll_event so that
+	 * when poll() returns, user context must observe state as idle
+	 */
+	smp_wmb();
+
+	if (priv->hwd_status.eer)
+		priv->poll_event = IPA_POLL_EVENT_ERROR;
+	else
+		priv->poll_event = IPA_POLL_EVENT_DONE;
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
+static void dnn_start(struct dnn_priv *priv, struct hwd_dnn_descriptor *desc)
+{
+	hwd_dnn_start(priv->id, desc);
+}
+
+static int dnn_parse_entry_addr(struct dnn_priv *priv, int idx, struct drv_dnn_descriptor *desc,
+				struct hwd_dnn_descriptor *hwd_desc)
+{
+	dma_addr_t addr;
+	struct drv_ipa_addr ipa_addr;
+	int j, ret = 0;
+
+	switch (desc->base_addr[idx].purpose) {
+	case DRV_DNN_BASE_ADDR_PURPOSE_OUTPUT:
+	case DRV_DNN_BASE_ADDR_PURPOSE_INPUT:
+		if (copy_from_user(priv->temp_list,
+				   (void __user *)desc->base_addr[idx].addr.list_addr,
+				   sizeof(struct drv_ipa_addr) * (desc->list_num + 1))) {
+			dev_err(priv->dev, "IPA address to iova conversion error: %d\n", __LINE__);
+			ret = -EFAULT;
+			break;
+		}
+
+		hwd_desc->base_addr[idx] = priv->list_paddr[idx];
+		for (j = 0; j < desc->list_num + 1; j++) {
+			ipa_addr = priv->temp_list[j];
+			addr = dnn_ipa_addr_to_iova(priv, ipa_addr);
+			if (addr == 0) {
+				dev_err(priv->dev,
+					"@LIST@ IPA address to iova conversion error: %d\n",
+					__LINE__);
+				ret = -EINVAL;
+				break;
+			}
+			dev_dbg(priv->dev, "@LIST@ %d: fd=%d %llx %x\n", idx,
+				desc->buffer_info[ipa_addr.buffer_index].fd,
+				(u64)hwd_desc->base_addr[idx], (u32)addr);
+			priv->list_vaddr[idx][j] = addr;
+		}
+		break;
+	case DRV_DNN_BASE_ADDR_PURPOSE_AWB:
+		ipa_addr = desc->base_addr[idx].addr.ipa_addr;
+		addr = dnn_ipa_addr_to_iova(priv, ipa_addr);
+		if (addr == 0) {
+			dev_err(priv->dev, "@AWB@ IPA address to iova conversion error: %d\n",
+				__LINE__);
+			ret = -EINVAL;
+			break;
+		}
+		hwd_desc->base_addr[idx] = addr;
+		dev_dbg(priv->dev, "@AWB@ %d: fd=%d %llx\n", idx,
+			desc->buffer_info[ipa_addr.buffer_index].fd, (u64)hwd_desc->base_addr[idx]);
+		break;
+	case DRV_DNN_BASE_ADDR_PURPOSE_TEMPORARY:
+		ipa_addr = desc->base_addr[idx].addr.ipa_addr;
+		addr = dnn_ipa_addr_to_iova(priv, ipa_addr);
+		if (addr == 0) {
+			dev_err(priv->dev, "@TEMP@ IPA address to iova conversion error: %d\n",
+				__LINE__);
+			ret = -EINVAL;
+			break;
+		}
+		hwd_desc->base_addr[idx] = addr;
+		dev_dbg(priv->dev, "@TEMP@ %d: fd=%d %llx\n", idx,
+			desc->buffer_info[ipa_addr.buffer_index].fd, (u64)hwd_desc->base_addr[idx]);
+		break;
+	default:
+		hwd_desc->base_addr[idx] = 0;
+		break;
+	}
+	return ret;
+}
+
+static int dnn_ioctl_start(struct dnn_priv *priv, unsigned long arg)
+{
+	struct drv_dnn_descriptor desc;
+	struct hwd_dnn_descriptor hwd_desc;
+	int i, ret = 0;
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
+	if (copy_from_user(&desc, (void __user *)arg, sizeof(struct drv_dnn_descriptor))) {
+		dev_err(priv->dev, "Descriptor memory access error\n");
+		ret = -EFAULT;
+		goto err1;
+	}
+
+	if (DRV_DNN_BIT_CONFIG_DESC_FINAL != (desc.config_done & DRV_DNN_BIT_CONFIG_DESC_FINAL)) {
+		dev_err(priv->dev, "Descriptor configuration not complete\n");
+		ret = -EINVAL;
+		goto err1;
+	}
+
+	priv->dma_count = 0;
+
+	/* setup buffer */
+	for (i = 0; i < desc.buffer_info_num; i++) {
+		ret = dnn_attach_dma_buf(priv, i, desc.buffer_info);
+		if (ret) {
+			dev_err(priv->dev, "dma buf attach error: index=%d\n", i);
+			goto err2;
+		}
+		dev_dbg(priv->dev, "@buffer[%d]@: fd=%d %s iova=%llx\n", i, desc.buffer_info[i].fd,
+			desc.buffer_info[i].coherent ? "coherent" : "non-coherent",
+			(uint64_t)priv->buffer_iova[i]);
+	}
+
+	/* get iova address of configuration area */
+	hwd_desc.configuration = dnn_ipa_addr_to_iova(priv, desc.configuration);
+	if (hwd_desc.configuration == 0) {
+		dev_err(priv->dev, "Invalid IPA Address: configuration %s: %d\n", __func__,
+			__LINE__);
+		ret = -EINVAL;
+		goto err2;
+	}
+
+	dev_dbg(priv->dev, "@config@: fd=%d %llx\n",
+		desc.buffer_info[desc.configuration.buffer_index].fd,
+		(uint64_t)hwd_desc.configuration);
+
+	for (i = 0; i < DRV_DNN_BASE_ADDR_NUM; i++) {
+		ret = dnn_parse_entry_addr(priv, i, &desc, &hwd_desc);
+		if (ret)
+			goto err2;
+	}
+
+	hwd_desc.configuration_size = desc.configuration_size;
+	hwd_desc.list_num = desc.list_num;
+	hwd_desc.eer_flags_addr = priv->err_flags;
+	hwd_desc.base_addr_flag = desc.base_addr_flag;
+	hwd_desc.config_done = desc.config_done;
+
+	hwd_desc.configuration += desc.configuration_offset;
+
+	dnn_start(priv, &hwd_desc);
+
+	priv->poll_event = IPA_POLL_EVENT_NONE;
+	priv->status = DRV_IPA_STATE_BUSY;
+	enable_irq(priv->irq);
+
+	mutex_unlock(&priv->lock);
+
+	return ret;
+
+err2:
+	dnn_detach_dma_buf(priv);
+err1:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int dnn_ioctl_get_status(struct dnn_priv *priv, unsigned long arg)
+{
+	struct drv_dnn_status status;
+	struct hwd_dnn_status hwd_status;
+	int ret = 0, i;
+
+	ret = mutex_lock_interruptible(&priv->lock);
+	if (ret)
+		return ret;
+
+	if (priv->status == DRV_IPA_STATE_BUSY)
+		hwd_dnn_get_status(priv->id, &hwd_status);
+	else
+		hwd_status = priv->hwd_status;
+
+	status.state = priv->status;
+	mutex_unlock(&priv->lock);
+
+	status.eer_cmd = hwd_status.eer_cmd;
+	status.eer = hwd_status.eer;
+	for (i = 0; i < HWD_DNN_EER_FLAG_NUM; i++)
+		status.eer_flags[i] = priv->err_flags[i];
+
+	if (copy_to_user((void __user *)arg, &status, sizeof(struct drv_dnn_status))) {
+		dev_err(priv->dev, "status memory access error\n");
+		ret = -EFAULT;
+	}
+
+	return ret;
+}
+
+static long dnn_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct dnn_priv *priv = container_of(fp->private_data, struct dnn_priv, miscdev);
+	int ret = 0;
+
+	switch (cmd) {
+	case IOC_IPA_START:
+		ret = dnn_ioctl_start(priv, arg);
+		break;
+	case IOC_IPA_GET_STATUS:
+		ret = dnn_ioctl_get_status(priv, arg);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+
+	return ret;
+}
+
+static __poll_t dnn_poll(struct file *fp, poll_table *wait)
+{
+	struct dnn_priv *priv = container_of(fp->private_data, struct dnn_priv, miscdev);
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
+		mask = EPOLLIN | EPOLLRDNORM;
+		if (poll_event == IPA_POLL_EVENT_ERROR)
+			mask |= EPOLLERR;
+	}
+	return mask;
+}
+
+static const struct file_operations dnn_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = dnn_ioctl,
+	.poll = dnn_poll,
+};
+
+static int dnn_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dnn_priv *priv;
+	int i, ret;
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
+	if (priv->irq < 0)
+		return priv->irq;
+
+	ret = devm_request_threaded_irq(dev, priv->irq, dnn_irq, dnn_irq_thread, 0, "dnn", priv);
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
+	/*
+	 * allocate uncached-memory to hold address-list for DNN operation
+	 * to hold ptr to 32bit addr memory block
+	 *      for each base address (upto HWD_DNN_BASE_ADDR_NUM)
+	 *      for each iteration (up to HWD_DNN_LIST_NUM_MAX)
+	 * uint32_t list_addr [HWD_DNN_BASE_ADDR_NUM] [HWD_DNN_LIST_NUM_MAX];
+	 */
+	priv->list_vaddr[0] =
+		dma_alloc_wc(dev, sizeof(u32) * HWD_DNN_LIST_NUM_MAX * HWD_DNN_BASE_ADDR_NUM,
+			     &priv->list_paddr[0], GFP_KERNEL);
+	if (!priv->list_vaddr[0]) {
+		dev_err(dev, "dma_alloc_wc failed\n");
+		return -ENOMEM;
+	}
+	for (i = 1; i < HWD_DNN_BASE_ADDR_NUM; i++) {
+		priv->list_vaddr[i] = priv->list_vaddr[0] + HWD_DNN_LIST_NUM_MAX * i;
+		priv->list_paddr[i] = priv->list_paddr[0] + sizeof(u32) * HWD_DNN_LIST_NUM_MAX * i;
+	}
+
+	hwd_dnn_initialize(priv->id, priv->regs);
+
+	snprintf(priv->name, sizeof(priv->name), "dnn%d", priv->id);
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = priv->name;
+	priv->miscdev.fops = &dnn_fops;
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		dev_err(dev, "misc registration failed\n");
+		hwd_dnn_uninitialize(priv->id);
+		dma_free_wc(dev, sizeof(u32) * HWD_DNN_LIST_NUM_MAX * HWD_DNN_BASE_ADDR_NUM,
+			    priv->list_vaddr[0], priv->list_paddr[0]);
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
+static int dnn_remove(struct platform_device *pdev)
+{
+	struct dnn_priv *priv = platform_get_drvdata(pdev);
+
+	misc_deregister(&priv->miscdev);
+	hwd_dnn_uninitialize(priv->id);
+	dma_free_wc(&pdev->dev, sizeof(u32) * HWD_DNN_LIST_NUM_MAX * HWD_DNN_BASE_ADDR_NUM,
+		    priv->list_vaddr[0], priv->list_paddr[0]);
+	return 0;
+}
+
+static const struct of_device_id dnn_of_match[] = {
+	{
+		.compatible = "toshiba,visconti-dnn",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, dnn_of_match);
+
+static struct platform_driver dnn_driver = {
+	.probe = dnn_probe,
+	.remove = dnn_remove,
+	.driver = {
+		.name = "visconti_dnn",
+		.of_match_table = of_match_ptr(dnn_of_match),
+	},
+};
+module_platform_driver(dnn_driver);
+
+MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti DNN driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/soc/visconti/dnn/hwd_dnn.c b/drivers/soc/visconti/dnn/hwd_dnn.c
new file mode 100644
index 000000000..832040329
--- /dev/null
+++ b/drivers/soc/visconti/dnn/hwd_dnn.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti DNN Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/io.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+#include "hwd_dnn.h"
+#include "hwd_dnn_reg.h"
+
+#define HWD_DNN_INT_END		BIT(0)
+#define HWD_DNN_INT_EER		BIT(24)
+#define HWD_DNN_INT_UNUSED	(0x003f0100U)
+#define HWD_DNN_INT_MASK_CONFIG (HWD_DNN_INT_UNUSED | HWD_DNN_INT_EER)
+#define HWD_DNN_INT_CLEAR_ALL	(HWD_DNN_INT_END | HWD_DNN_INT_EER)
+#define HWD_DNN_EXE_CONFIG_MODE (0x3U)
+
+#define HWD_DNN_CGATE_ORD_CONFIG BIT(17)
+
+/**
+ * struct hwd_dnn_resources - HWD driver internal resource structure
+ *
+ * @reg: control register
+ * @status: driver status
+ * @eer_flags_addr: Address of execution error flags
+ */
+struct hwd_dnn_resources {
+	struct hwd_dnn_reg *reg;
+	struct hwd_dnn_status status;
+	u32 *eer_flags_addr;
+};
+
+/* HWD driver internal resource */
+static struct hwd_dnn_resources hwd_dnn_resources[HWD_DNN_DEVICE_MAX] = {};
+
+/**
+ * hwd_dnn_initialize() - Initialize DNN device
+ *
+ * @module_id: @ref hwd_dnn_device "id" of the h/w module
+ * @vaddr: register base virtual address
+ * Return: 0 operation completed successfully
+ */
+void hwd_dnn_initialize(u32 module_id, void *vaddr)
+{
+	struct hwd_dnn_resources *res = &hwd_dnn_resources[module_id];
+
+	/* Initialize the device */
+	res->reg = (struct hwd_dnn_reg *)vaddr;
+}
+
+/**
+ * hwd_dnn_uninitialize() - Uninitialize DNN device
+ *
+ * @module_id: @ref hwd_dnn_device "id" of the h/w module
+ */
+void hwd_dnn_uninitialize(u32 module_id)
+{
+	struct hwd_dnn_resources *res = &hwd_dnn_resources[module_id];
+
+	res->reg = NULL;
+}
+
+/**
+ * hwd_dnn_start() - Start DNN device
+ *
+ * @module_id: @ref hwd_dnn_device "id" of the h/w module
+ * @desc: Pointer to descriptor structure
+ */
+void hwd_dnn_start(u32 module_id, const struct hwd_dnn_descriptor *desc)
+{
+	struct hwd_dnn_resources *res = &hwd_dnn_resources[module_id];
+	struct hwd_dnn_reg *reg;
+	u32 base_addr_flag;
+	int i;
+
+	reg = res->reg;
+
+	/* Configure the registers with user provided values */
+	writel(desc->configuration & GENMASK(31, 0), &reg->cfg_addr);
+	writel(desc->configuration_size, &reg->cfg_size);
+	writel(desc->list_num, &reg->cfg_rpt);
+
+	base_addr_flag = desc->base_addr_flag;
+	for (i = 0; i < HWD_DNN_BASE_ADDR_NUM; i++) {
+		if (base_addr_flag & BIT(i)) {
+			/* 1: address list is specified */
+			writel(0U, &reg->base_addr[i]);
+			writel(desc->base_addr[i] & GENMASK(31, 0), &reg->base_list[i]);
+		} else {
+			/* 0: region address is specified */
+			writel(desc->base_addr[i] & GENMASK(31, 0), &reg->base_addr[i]);
+			writel(0U, &reg->base_list[i]);
+		}
+	}
+
+	writel(base_addr_flag, &reg->base_list_cfg);
+
+	/* clear and unmask interrupts */
+	writel(HWD_DNN_INT_CLEAR_ALL, &reg->intstat);
+	writel(HWD_DNN_INT_MASK_CONFIG, &reg->intmask);
+
+	res->status.eer_cmd = 0;
+	res->status.eer = 0;
+	res->eer_flags_addr = desc->eer_flags_addr;
+
+	/*Invalidate load command in Clock Gating Control Register */
+	writel(HWD_DNN_CGATE_ORD_CONFIG, &reg->cgate_ord);
+
+	/* Sync memory barrier */
+	dsb(st);
+
+	/* Start the device */
+	writel(HWD_DNN_EXE_CONFIG_MODE, &reg->exe);
+}
+
+/**
+ * hwd_dnn_irq_handler() - HWD DNN interrupt handler
+ *
+ * @module_id: id of the h/w module
+ * Return: HWD_DNN_EVENT_EXEC_DONE Bit field saying Configuration processing is completed
+ */
+u32 hwd_dnn_irq_handler(u32 module_id)
+{
+	struct hwd_dnn_resources *res = &hwd_dnn_resources[module_id];
+	struct hwd_dnn_reg *reg;
+	u32 event = 0;
+	u32 int_stat;
+	u32 cause;
+	int i;
+
+	reg = res->reg;
+
+	/* Read the interrupt causes */
+	cause = readl(&reg->mask_intstat);
+
+	/* Read the interrupt status register */
+	int_stat = readl(&reg->intstat);
+
+	/*
+	 * Read the error command.
+	 * Clearing DNN_INTSTAT.EER interrupt cause initializes the error command register.
+	 * Read error command before clearing the interrupt cause.
+	 */
+	res->status.eer_cmd = readl(&reg->int_eer_cmd);
+
+	/* Clear the interrupt causes */
+	writel(cause, &reg->intstat);
+
+	if (cause & HWD_DNN_INT_END) {
+		/* Get EER flags, if requestd */
+		if (res->eer_flags_addr)
+			for (i = 0; i < HWD_DNN_EER_FLAG_NUM; i++)
+				res->eer_flags_addr[i] = readl(&reg->eer_flag[i]);
+
+		event = HWD_DNN_EVENT_EXEC_DONE;
+	}
+
+	if (int_stat & HWD_DNN_INT_EER) {
+		/* Operation error occurred */
+		res->status.eer = 1;
+	}
+
+	return event;
+}
+
+/**
+ * hwd_dnn_get_status() - HWD DNN Get Status
+ *
+ * @module_id: @ref hwd_dnn_device "id" of the h/w module
+ * @status: Pointer to status structure
+ */
+void hwd_dnn_get_status(u32 module_id, struct hwd_dnn_status *status)
+{
+	const struct hwd_dnn_resources *res = &hwd_dnn_resources[module_id];
+
+	/* Update device status */
+	status->eer_cmd = res->status.eer_cmd;
+	status->eer = res->status.eer;
+}
diff --git a/drivers/soc/visconti/dnn/hwd_dnn.h b/drivers/soc/visconti/dnn/hwd_dnn.h
new file mode 100644
index 000000000..84425990c
--- /dev/null
+++ b/drivers/soc/visconti/dnn/hwd_dnn.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/* Toshiba Visconti DNN Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef HWD_DNN_H
+#define HWD_DNN_H
+
+/**
+ * enum hwd_dnn_device_id - device ids for available DNN Accelerators
+ */
+enum hwd_dnn_device_id { HWD_DNN_DEVICE_0 = 0, HWD_DNN_DEVICE_1 = 1, HWD_DNN_DEVICE_MAX = 2 };
+
+/* DNN events returned by irq handler */
+#define HWD_DNN_EVENT_EXEC_DONE (1U)
+
+/* number of base address available for DNN */
+#define HWD_DNN_BASE_ADDR_NUM (8U)
+
+/* number of error flag registers */
+#define HWD_DNN_EER_FLAG_NUM (32U)
+
+/* DNN hardware can execute 1024 iterations for different dataset at a time */
+#define HWD_DNN_LIST_NUM_MAX (1024U)
+
+/**
+ * struct hwd_dnn_status - DNN HWD Driver Status
+ *
+ * @eer_cmd:  Error Command
+ * @eer:      Execution Error
+ * @reserved: Padding
+ */
+struct hwd_dnn_status {
+	u32 eer_cmd;
+	u32 eer : 1;
+	u32 reserved : 31;
+};
+
+/**
+ * struct hwd_dnn_descriptor - HWD DNN Descriptor
+ *
+ * @configuration: Configuration data
+ * @configuration_size: Configuration data size
+ * @list_num: Number of input/output list
+ * @base_addr: Base Address
+ * @eer_flags_addr: Address of storing execution error flags
+ * @base_addr_flag: Bit-fields of Base Address list config. If 1, address list. If 0, fixed address
+ * @config_done: Flags of called configuration
+ */
+struct hwd_dnn_descriptor {
+	u32 configuration;
+	u32 configuration_size;
+	u32 list_num;
+	u32 base_addr[HWD_DNN_BASE_ADDR_NUM];
+	u32 *eer_flags_addr;
+	u32 base_addr_flag;
+	u16 config_done;
+};
+
+void hwd_dnn_initialize(u32 module_id, void *vaddr);
+void hwd_dnn_uninitialize(u32 module_id);
+void hwd_dnn_start(u32 module_id, const struct hwd_dnn_descriptor *desc);
+u32 hwd_dnn_irq_handler(u32 module_id);
+void hwd_dnn_get_status(u32 module_id, struct hwd_dnn_status *status);
+
+#endif /* HWD_DNN_H */
diff --git a/drivers/soc/visconti/dnn/hwd_dnn_reg.h b/drivers/soc/visconti/dnn/hwd_dnn_reg.h
new file mode 100644
index 000000000..c1271e092
--- /dev/null
+++ b/drivers/soc/visconti/dnn/hwd_dnn_reg.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/* Toshiba Visconti DNN Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef HWD_DNN_REG_H
+#define HWD_DNN_REG_H
+
+/**
+ * struct hwd_dnn_reg - DNN register address struct
+ */
+struct hwd_dnn_reg {
+	u32 version;
+	u32 exe;
+	u32 reserved_a_1;
+	u32 intstat;
+	u32 intmask;
+	u32 mask_intstat;
+	u32 reserved_a_2;
+	u32 int_eer_cmd;
+	u32 reserved_b_1[8];
+	u32 cfg_cid;
+	u32 cfg_cnm;
+	u32 reserved_b_2[10];
+	u32 reserved_a_3;
+	u32 cgate_ord;
+	u32 reserved_b_3[2];
+	u32 eer_flag[32];
+	u32 cfg_addr;
+	u32 cfg_size;
+	u32 cfg_rpt;
+	u32 reserved_b_4[1];
+	u32 base_list_cfg;
+	u32 reserved_b_5[11];
+	u32 base_addr[8];
+	u32 reserved_b_6[24];
+	u32 base_list[8];
+	u32 reserved_b_7[8];
+	u32 cmd_load;
+	u32 ld_format;
+	u32 reserved_b_8[14];
+	u32 ld_g_size0;
+	u32 ld_g_size1;
+	u32 reserved_b_9[2];
+	u32 reserved_a_4;
+	u32 reserved_b_10[1];
+	u32 ld_g_base_id;
+	u32 ld_g_offset;
+	u32 ld_g_lptch;
+	u32 ld_g_cptch;
+	u32 ld_g_vptch;
+	u32 reserved_b_11[5];
+	u32 ld_l_size0;
+	u32 ld_l_size1;
+	u32 reserved_b_12[2];
+	u32 ld_l_addr;
+	u32 reserved_b_13[3];
+	u32 ld_l_lptch;
+	u32 ld_l_cptch;
+	u32 ld_l_vptch;
+	u32 reserved_b_14[17];
+	u32 reserved_a_5;
+	u32 reserved_b_15[3];
+	u32 cmd_store;
+	u32 st_format;
+	u32 reserved_b_16[14];
+	u32 st_g_size0;
+	u32 st_g_size1;
+	u32 reserved_b_17[2];
+	u32 reserved_a_6;
+	u32 reserved_b_18[1];
+	u32 st_g_base_id;
+	u32 st_g_offset;
+	u32 st_g_lptch;
+	u32 st_g_cptch;
+	u32 st_g_vptch;
+	u32 reserved_b_19[5];
+	u32 st_l_size0;
+	u32 st_l_size1;
+	u32 reserved_b_20[2];
+	u32 st_l_addr;
+	u32 reserved_b_21[3];
+	u32 st_l_lptch;
+	u32 st_l_cptch;
+	u32 st_l_vptch;
+	u32 reserved_b_22[17];
+	u32 reserved_a_7;
+	u32 reserved_b_23[3];
+	u32 cmd_copy;
+	u32 reserved_b_24[15];
+	u32 cp_src_size0;
+	u32 cp_src_size1;
+	u32 reserved_b_25[2];
+	u32 cp_src_addr;
+	u32 reserved_b_26[3];
+	u32 cp_src_lptch;
+	u32 cp_src_cptch;
+	u32 reserved_a_8;
+	u32 reserved_b_27[5];
+	u32 cp_dst_size0;
+	u32 cp_dst_size1;
+	u32 reserved_b_28[2];
+	u32 cp_dst_addr;
+	u32 reserved_b_29[3];
+	u32 cp_dst_lptch;
+	u32 cp_dst_cptch;
+	u32 reserved_a_9;
+	u32 reserved_b_30[17];
+	u32 reserved_a_10;
+	u32 reserved_b_31[3];
+	u32 cmd_fill;
+	u32 reserved_b_32[1];
+	u32 fl_cfg;
+	u32 reserved_b_33[13];
+	u32 fl_src_size0;
+	u32 fl_src_size1;
+	u32 reserved_b_34[2];
+	u32 fl_src_addr;
+	u32 reserved_b_35[3];
+	u32 fl_src_lptch;
+	u32 fl_src_cptch;
+	u32 reserved_b_36[6];
+	u32 fl_dst_size0;
+	u32 fl_dst_size1;
+	u32 reserved_b_37[2];
+	u32 fl_dst_addr;
+	u32 reserved_b_38[3];
+	u32 fl_dst_lptch;
+	u32 fl_dst_cptch;
+	u32 reserved_b_39[22];
+	u32 cmd_sync;
+	u32 reserved_b_40[1];
+	u32 cmd_srst;
+	u32 reserved_b_41[1];
+	u32 cmd_halt;
+	u32 reserved_b_42[3];
+	u32 cmd_finish;
+	u32 reserved_b_43[119];
+	u32 cmd_exe;
+	u32 exe_mode;
+	u32 reserved_b_44[14];
+	u32 exe_inf_size0;
+	u32 exe_inf_size1;
+	u32 reserved_b_45[2];
+	u32 exe_inf_addr;
+	u32 reserved_b_46[3];
+	u32 exe_inf_lptch;
+	u32 exe_inf_cptch;
+	u32 reserved_b_47[26];
+	u32 exe_conv_bias_addr;
+	u32 reserved_b_48[27];
+	u32 exe_conv_wt_size0;
+	u32 exe_conv_wt_size1;
+	u32 reserved_b_49[2];
+	u32 exe_conv_wt_addr;
+	u32 reserved_b_50[3];
+	u32 exe_conv_wt_lptch;
+	u32 exe_conv_wt_cptch;
+	u32 exe_conv_wt_vptch;
+	u32 reserved_b_51[9];
+	u32 exe_conv_acv_addr;
+	u32 reserved_b_52[3];
+	u32 exe_conv_acv_lptch;
+	u32 exe_conv_acv_cptch;
+	u32 reserved_b_53[18];
+	u32 exe_conv_out;
+	u32 reserved_b_54[11];
+	u32 actv_tbl_range;
+	u32 reserved_a_11;
+	u32 actv_tbl_prm;
+	u32 reserved_b_55[5];
+	u32 exe_pool_size;
+	u32 reserved_b_56[43];
+	u32 exe_pool_out;
+	u32 exe_pool_pe_crop;
+	u32 reserved_b_57[10];
+	u32 exe_norm_g_prm;
+	u32 reserved_b_58[15];
+	u32 exe_sav_max_prm;
+	u32 reserved_b_59[35];
+	u32 exe_norm_out;
+	u32 reserved_b_60[23];
+	u32 exe_outf_addr;
+	u32 reserved_b_61[3];
+	u32 exe_outf_lptch;
+	u32 exe_outf_cptch;
+	u32 reserved_b_62[102];
+	u32 reserved_a_12;
+	u32 reserved_b_63[8];
+	u32 reserved_a_13;
+	u32 reserved_a_14;
+	u32 reserved_a_15;
+	u32 reserved_b_64[4];
+	u32 reserved_a_16;
+	u32 reserved_a_17;
+	u32 reserved_b_65[46];
+	u32 exe_pool_pa3_0;
+	u32 exe_pool_pa3_2;
+	u32 exe_pool_pa3_4;
+	u32 exe_pool_pa3_6;
+	u32 exe_pool_pa3_8;
+	u32 exe_pool_pa3_10;
+	u32 exe_pool_pa3_12;
+	u32 exe_pool_pa3_14;
+	u32 exe_pool_pa3_16;
+	u32 exe_pool_pa3_18;
+	u32 exe_pool_pa3_20;
+	u32 exe_pool_pa3_22;
+	u32 exe_pool_pa3_24;
+	u32 reserved_b_66[3];
+	u32 exe_pool_pa2_0;
+	u32 exe_pool_pa2_2;
+	u32 exe_pool_pa2_4;
+	u32 exe_pool_pa2_6;
+	u32 exe_pool_pa2_8;
+	u32 exe_pool_pa2_10;
+	u32 exe_pool_pa2_12;
+	u32 exe_pool_pa2_14;
+	u32 exe_pool_pa2_16;
+	u32 exe_pool_pa2_18;
+	u32 exe_pool_pa2_20;
+	u32 exe_pool_pa2_22;
+	u32 exe_pool_pa2_24;
+};
+
+#endif /* HWD_DNN_REG_H */
diff --git a/drivers/soc/visconti/uapi/dnn.h b/drivers/soc/visconti/uapi/dnn.h
new file mode 100644
index 000000000..972c39655
--- /dev/null
+++ b/drivers/soc/visconti/uapi/dnn.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Toshiba Visconti DNN Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef _UAPI_LINUX_DNN_H
+#define _UAPI_LINUX_DNN_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+#include "ipa.h"
+
+#define DRV_DNN_BIT_CONFIG_DESC_FINAL (0x8000U)
+#define DRV_DNN_BUFFER_INDEX_MAX      (15)
+
+#define DRV_DNN_BASE_ADDR_NUM (8U) /* DNN number of base address */
+
+#define DRV_DNN_BASE_ADDR_PURPOSE_INPUT	    (1U)
+#define DRV_DNN_BASE_ADDR_PURPOSE_OUTPUT    (2U)
+#define DRV_DNN_BASE_ADDR_PURPOSE_AWB	    (3U)
+#define DRV_DNN_BASE_ADDR_PURPOSE_TEMPORARY (4U)
+
+/**
+ * struct drv_dnn_status - DNN IPA status for IOC_IPA_GET_STATUS
+ *
+ * @state:     State of driver
+ * @eer_cmd:   Execution error command
+ * @eer:       Execution error
+ * @reserved:  Padding
+ * @eer_flags: Execution error flags
+ */
+struct drv_dnn_status {
+	enum drv_ipa_state state;
+	u32 eer_cmd;
+	u32 eer : 1;
+	u32 reserved : 31;
+	u32 eer_flags[32];
+};
+
+struct drv_dnn_base_addr {
+	u32 purpose;
+	union {
+		struct drv_ipa_addr ipa_addr;
+		uintptr_t list_addr;
+	} addr;
+};
+
+/**
+ * struct drv_dnn_descriptor - DNN IPA Descriptor for IOC_IPA_START
+ *
+ * @configuration:        Address of configuration data
+ * @configuration_offset: Configuration offset
+ * @configuration_size:   Configuration data size
+ * @list_num:             Number of input/output list
+ * @base_addr:            Base addresses
+ * @base_addr_flag:       Bit-fields of base_addr list config
+ * - if 0, fixed address
+ * - if 1, address list
+ * @config_done:          Flags of called configuration
+ * @buffer_info:          Table of buffer information
+ * @buffer_info_num:      Number of buffer_info
+ */
+struct drv_dnn_descriptor {
+	struct drv_ipa_addr configuration;
+	u32 configuration_offset;
+	u32 configuration_size;
+	u32 list_num;
+	struct drv_dnn_base_addr base_addr[DRV_DNN_BASE_ADDR_NUM];
+	u32 base_addr_flag;
+	u16 config_done;
+	struct drv_ipa_buffer_info buffer_info[DRV_DNN_BUFFER_INDEX_MAX];
+	s32 buffer_info_num;
+};
+
+#endif /* _UAPI_LINUX_DNN_H */
-- 
2.17.1


