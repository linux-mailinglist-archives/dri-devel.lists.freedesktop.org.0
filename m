Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9B470715
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B3510EC3B;
	Fri, 10 Dec 2021 17:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF35310EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:50 +0000 (UTC)
X-UUID: 75102da3e98349ad97736a1010d0cd6e-20211211
X-UUID: 75102da3e98349ad97736a1010d0cd6e-20211211
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 593780870; Sat, 11 Dec 2021 01:26:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 11 Dec 2021 01:26:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:45 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 08/17] remoteproc: mediatek: Add APU remoteproc driver
Date: Sat, 11 Dec 2021 01:25:56 +0800
Message-ID: <20211210172605.30618-9-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

APU integrated subsystem having MD32RV33 (MD32) that runs tinysys
The tinysys is runs on a microprocessor in APU. Its firmware
is loaded and booted from Kernel side. Kernel and tinysys use IPI
to send and receive messages.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 drivers/remoteproc/Kconfig                |   12 +
 drivers/remoteproc/Makefile               |    2 +
 drivers/remoteproc/mtk-apu-ipi.c          |  474 +++++++++
 drivers/remoteproc/mtk-apu-rproc.c        | 1054 +++++++++++++++++++++
 include/linux/remoteproc/mtk-apu-config.h |  100 ++
 include/linux/remoteproc/mtk-apu.h        |  217 +++++
 6 files changed, 1859 insertions(+)
 create mode 100644 drivers/remoteproc/mtk-apu-ipi.c
 create mode 100644 drivers/remoteproc/mtk-apu-rproc.c
 create mode 100644 include/linux/remoteproc/mtk-apu-config.h
 create mode 100644 include/linux/remoteproc/mtk-apu.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index f2e961f998ca..72fc5fe7f4b5 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -54,6 +54,18 @@ config INGENIC_VPU_RPROC
 	  This can be either built-in or a loadable module.
 	  If unsure say N.
 
+config MTK_APU_RPROC
+	tristate "MediaTek APU remoteproc support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	select MAILBOX
+	select MTK_APU_MBOX
+	select MTK_SCP
+	help
+	  Say y here to support MediaTek AI Processing Unit Subsystem
+	  via the remote processor framework.
+
+	  It's safe to say N here.
+
 config MTK_SCP
 	tristate "Mediatek SCP support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 0ac256b6c977..1c1f1e443c56 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -15,6 +15,8 @@ obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
+obj-$(CONFIG_MTK_APU_RPROC)	+= apu.o
+apu-objs	+= mtk-apu-rproc.o mtk-apu-ipi.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
diff --git a/drivers/remoteproc/mtk-apu-ipi.c b/drivers/remoteproc/mtk-apu-ipi.c
new file mode 100644
index 000000000000..62197441eb0b
--- /dev/null
+++ b/drivers/remoteproc/mtk-apu-ipi.c
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/lockdep.h>
+#include <linux/mailbox_client.h>
+#include <linux/remoteproc/mtk-apu.h>
+#include <linux/remoteproc/mtk-apu-config.h>
+#include <linux/time64.h>
+
+struct apu_mbox_hdr {
+	unsigned int id;
+	unsigned int len;
+	unsigned int serial_no;
+	unsigned int csum;
+};
+
+#define IPI_BUF_SIZE (round_up(sizeof(struct mtk_share_obj) * 2, PAGE_SIZE))
+
+static struct lock_class_key ipi_lock_key[APU_IPI_MAX];
+static unsigned int tx_serial_no;
+static unsigned int rx_serial_no;
+
+#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+static inline void dump_msg_buf(struct mtk_apu *apu, void *data, u32 len)
+{
+	struct device *dev = apu->dev;
+	u32 i;
+	int size = 64, num;
+	u8 buf[64], *ptr = buf;
+	int ret;
+
+	dev_info(dev, "===== dump message =====\n");
+	for (i = 0; i < len; i++) {
+		num = snprintf(ptr, size, "%02x ", ((u8 *)data)[i]);
+		if (num <= 0) {
+			dev_info(dev, "%s: snprintf return error(num = %d)\n",
+				 __func__, num);
+			return;
+		}
+		size -= num;
+		ptr += num;
+
+		if ((i + 1) % 4 == 0) {
+			ret = snprintf(ptr++, size--, " ");
+			if (ret <= 0) {
+				dev_info(dev, "%s: snprintf return error(ret = %d)\n",
+					 __func__, ret);
+				return;
+			}
+		}
+
+		if ((i + 1) % 16 == 0 || (i + 1) >= len) {
+			dev_info(dev, "%s\n", buf);
+			size = 64;
+			ptr = buf;
+		}
+	}
+	dev_info(dev, "========================\n");
+}
+#endif
+
+static u32 calculate_csum(void *data, u32 len)
+{
+	u32 csum = 0, res = 0, i;
+	u8 *ptr;
+
+	for (i = 0; i < (len / sizeof(csum)); i++)
+		csum += *(((u32 *)data) + i);
+
+	ptr = (u8 *)data + len / sizeof(csum) * sizeof(csum);
+	for (i = 0; i < (len % sizeof(csum)); i++)
+		res |= *(ptr + i) << i * 8;
+
+	csum += res;
+
+	return csum;
+}
+
+static inline bool bypass_check(u32 id)
+{
+	/* whitelist IPI used in power off flow */
+	return id == APU_IPI_DEEP_IDLE;
+}
+
+static void ipi_usage_cnt_update(struct mtk_apu *apu, u32 id, int diff)
+{
+	struct apu_ipi_desc *ipi = &apu->ipi_desc[id];
+
+	if (apu->platdata->ipi_attrs[id].ack != IPI_WITH_ACK)
+		return;
+
+	spin_lock(&apu->usage_cnt_lock);
+	ipi->usage_cnt += diff;
+	spin_unlock(&apu->usage_cnt_lock);
+}
+
+int apu_ipi_send(struct mtk_apu *apu, u32 id, void *data, u32 len,
+		 u32 wait_ms)
+{
+	struct timespec64 ts, te;
+	struct apu_mbox_hdr hdr;
+	unsigned long timeout;
+	int ret = 0;
+
+	ktime_get_ts64(&ts);
+
+	if (!apu ||
+	    id <= APU_IPI_INIT ||
+	    id >= APU_IPI_MAX ||
+	    id == APU_IPI_NS_SERVICE ||
+	    len > APU_SHARE_BUFFER_SIZE ||
+	    !data)
+		return -EINVAL;
+
+	mutex_lock(&apu->send_lock);
+	if (apu->platdata->ipi_attrs[id].direction == IPI_HOST_INITIATE &&
+	    apu->ipi_inbound_locked == IPI_LOCKED && !bypass_check(id)) {
+		dev_info(apu->dev, "%s: ipi locked, ipi=%d\n", __func__, id);
+		mutex_unlock(&apu->send_lock);
+		return -EBUSY;
+	}
+
+	apu_deepidle_power_on_aputop(apu);
+
+	/* copy message payload to share buffer, need to do cache flush if
+	 * the buffer is cacheable. currently not
+	 */
+	memcpy_toio(apu->send_buf, data, len);
+
+	hdr.id = id;
+	hdr.len = len;
+	hdr.csum = calculate_csum(data, len);
+	hdr.serial_no = tx_serial_no++;
+
+	ret = mbox_send_message(apu->ch, &hdr);
+	if (ret < 0) {
+		dev_err(apu->dev, "%s: failed to send msg, ret=%d\n", __func__,
+			ret);
+		goto unlock_mutex;
+	}
+	ret = 0;
+
+	apu->ipi_id_ack[id] = false;
+
+	/* poll ack from remote processor if wait_ms specified */
+	if (wait_ms) {
+		timeout = jiffies + msecs_to_jiffies(wait_ms);
+		ret = wait_event_timeout(apu->ack_wq,
+					 &apu->ipi_id_ack[id],
+					 timeout);
+
+		apu->ipi_id_ack[id] = false;
+
+		if (WARN(!ret, "apu ipi %d ack timeout!", id)) {
+			ret = -EIO;
+			goto unlock_mutex;
+		} else {
+			ret = 0;
+		}
+	}
+	ipi_usage_cnt_update(apu, id, 1);
+
+unlock_mutex:
+	mutex_unlock(&apu->send_lock);
+	ktime_get_ts64(&te);
+	ts = timespec64_sub(te, ts);
+
+	return ret;
+}
+
+int apu_ipi_lock(struct mtk_apu *apu)
+{
+	struct apu_ipi_desc *ipi;
+	int i;
+	bool ready_to_lock = true;
+
+	if (mutex_trylock(&apu->send_lock) == 0)
+		return -EBUSY;
+
+	if (apu->ipi_inbound_locked == IPI_LOCKED) {
+		dev_info(apu->dev, "%s: ipi already locked\n", __func__);
+		mutex_unlock(&apu->send_lock);
+		return 0;
+	}
+
+	spin_lock(&apu->usage_cnt_lock);
+	for (i = 0; i < APU_IPI_MAX; i++) {
+		ipi = &apu->ipi_desc[i];
+
+		if (apu->platdata->ipi_attrs[i].ack == IPI_WITH_ACK &&
+		    ipi->usage_cnt != 0 &&
+		    !bypass_check(i)) {
+			dev_info(apu->dev, "%s: ipi %d is still in use %d\n",
+				 __func__, i, ipi->usage_cnt);
+			ready_to_lock = false;
+		}
+	}
+
+	if (!ready_to_lock) {
+		spin_unlock(&apu->usage_cnt_lock);
+		mutex_unlock(&apu->send_lock);
+		return -EBUSY;
+	}
+
+	apu->ipi_inbound_locked = IPI_LOCKED;
+	spin_unlock(&apu->usage_cnt_lock);
+	mutex_unlock(&apu->send_lock);
+
+	return 0;
+}
+
+void apu_ipi_unlock(struct mtk_apu *apu)
+{
+	mutex_lock(&apu->send_lock);
+	if (apu->ipi_inbound_locked == IPI_UNLOCKED)
+		dev_info(apu->dev, "%s: ipi already unlocked\n", __func__);
+
+	spin_lock(&apu->usage_cnt_lock);
+	apu->ipi_inbound_locked = IPI_UNLOCKED;
+	spin_unlock(&apu->usage_cnt_lock);
+	mutex_unlock(&apu->send_lock);
+}
+
+int apu_ipi_register(struct mtk_apu *apu, u32 id,
+		     ipi_handler_t handler, void *priv)
+{
+	if (!apu || id >= APU_IPI_MAX || WARN_ON(!handler)) {
+		if (apu)
+			dev_info(apu->dev,
+				 "%s failed. apu=%p, id=%d, handler=%p, priv=%p\n",
+				 __func__, apu, id, handler, priv);
+		return -EINVAL;
+	}
+
+	mutex_lock(&apu->ipi_desc[id].lock);
+	apu->ipi_desc[id].handler = handler;
+	apu->ipi_desc[id].priv = priv;
+	mutex_unlock(&apu->ipi_desc[id].lock);
+
+	return 0;
+}
+
+void apu_ipi_unregister(struct mtk_apu *apu, u32 id)
+{
+	if (!apu || id >= APU_IPI_MAX) {
+		if (apu)
+			dev_info(apu->dev, "%s: invalid id=%d\n", __func__, id);
+		return;
+	}
+
+	mutex_lock(&apu->ipi_desc[id].lock);
+	apu->ipi_desc[id].handler = NULL;
+	apu->ipi_desc[id].priv = NULL;
+	mutex_unlock(&apu->ipi_desc[id].lock);
+}
+
+static void apu_init_ipi_handler(void *data, unsigned int len, void *priv)
+{
+	struct mtk_apu *apu = priv;
+	struct apu_run *run = data;
+	struct device *dev = apu->dev;
+
+	strscpy(apu->run.fw_ver, data, APU_FW_VER_LEN);
+	apu->run.signaled = 1;
+	wake_up_interruptible(&apu->run.wq);
+	dev_info(dev, "fw_ver: %s\n", run->fw_ver);
+}
+
+static void apu_ipi_handle_rx(struct mbox_client *cl, void *mssg)
+{
+	struct mtk_apu *apu = container_of(cl, struct mtk_apu, cl);
+	struct mtk_share_obj *recv_obj = apu->recv_buf;
+	struct apu_mbox_hdr *hdr = mssg;
+	u8 temp_buf[sizeof(struct mtk_share_obj)];
+	u32 id, len, calc_csum;
+
+	if (hdr->serial_no != rx_serial_no) {
+		dev_info(apu->dev, "unmatched serial_no: curr=%u, recv=%u\n",
+			 rx_serial_no, hdr->serial_no);
+	}
+	rx_serial_no++;
+
+	id = hdr->id;
+	len = hdr->len;
+
+	if (hdr->len > APU_SHARE_BUFFER_SIZE) {
+		dev_info(apu->dev, "IPI message too long(len %d, max %d)",
+			 len, APU_SHARE_BUFFER_SIZE);
+		return;
+	}
+
+	if (id >= APU_IPI_MAX) {
+		dev_info(apu->dev, "no such IPI id = %d", id);
+		return;
+	}
+
+	mutex_lock(&apu->ipi_desc[id].lock);
+	if (!apu->ipi_desc[id].handler) {
+		dev_info(apu->dev, "IPI id=%d is not registered", id);
+		mutex_unlock(&apu->ipi_desc[id].lock);
+		return;
+	}
+
+	memcpy_fromio(temp_buf, &recv_obj->share_buf, len);
+	calc_csum = calculate_csum(temp_buf, len);
+	if (calc_csum != hdr->csum) {
+		dev_info(apu->dev, "csum error: recv=0x%08x, calc=0x%08x\n",
+			 hdr->csum, calc_csum);
+#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+		dump_msg_buf(apu, temp_buf, hdr->len);
+#endif
+	}
+
+	apu->ipi_desc[id].handler(temp_buf, len, apu->ipi_desc[id].priv);
+	ipi_usage_cnt_update(apu, id, -1);
+	mutex_unlock(&apu->ipi_desc[id].lock);
+
+	apu->ipi_id_ack[id] = true;
+	wake_up(&apu->ack_wq);
+}
+
+static int apu_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+			unsigned int len, unsigned int wait)
+{
+	struct mtk_apu *apu = platform_get_drvdata(pdev);
+
+	return apu_ipi_send(apu, id, buf, len, wait);
+}
+
+static int apu_register_ipi(struct platform_device *pdev, u32 id,
+			    ipi_handler_t handler, void *priv)
+{
+	struct mtk_apu *apu = platform_get_drvdata(pdev);
+
+	return apu_ipi_register(apu, id, handler, priv);
+}
+
+static void apu_unregister_ipi(struct platform_device *pdev, u32 id)
+{
+	struct mtk_apu *apu = platform_get_drvdata(pdev);
+
+	apu_ipi_unregister(apu, id);
+}
+
+static struct mtk_rpmsg_info apu_rpmsg_info = {
+	.send_ipi = apu_send_ipi,
+	.register_ipi = apu_register_ipi,
+	.unregister_ipi = apu_unregister_ipi,
+	.ns_ipi_id = APU_IPI_NS_SERVICE,
+};
+
+static void apu_add_rpmsg_subdev(struct mtk_apu *apu)
+{
+	struct platform_device *pdev = to_platform_device(apu->dev);
+
+	apu->rpmsg_subdev = mtk_rpmsg_create_rproc_subdev(pdev,
+							  &apu_rpmsg_info);
+	if (apu->rpmsg_subdev)
+		rproc_add_subdev(apu->rproc, apu->rpmsg_subdev);
+}
+
+static void apu_remove_rpmsg_subdev(struct mtk_apu *apu)
+{
+	if (apu->rpmsg_subdev) {
+		rproc_remove_subdev(apu->rproc, apu->rpmsg_subdev);
+		mtk_rpmsg_destroy_rproc_subdev(apu->rpmsg_subdev);
+		apu->rpmsg_subdev = NULL;
+	}
+}
+
+void apu_ipi_config_remove(struct mtk_apu *apu)
+{
+	dma_free_coherent(apu->dev, IPI_BUF_SIZE,
+			  apu->recv_buf, apu->recv_buf_da);
+}
+
+int apu_ipi_config_init(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	struct apu_ipi_config *ipi_config;
+	void *ipi_buf = NULL;
+	dma_addr_t ipi_buf_da = 0;
+
+	ipi_config = (struct apu_ipi_config *)
+		get_apu_config_user_ptr(apu->conf_buf, APU_IPI_CONFIG);
+
+	/* initialize shared buffer */
+	ipi_buf = dma_alloc_coherent(dev, IPI_BUF_SIZE,
+				     &ipi_buf_da, GFP_KERNEL);
+	if (!ipi_buf || !ipi_buf_da) {
+		dev_info(dev, "failed to allocate ipi share memory\n");
+		return -ENOMEM;
+	}
+
+	memset_io(ipi_buf, 0, sizeof(struct mtk_share_obj) * 2);
+	apu->recv_buf = ipi_buf;
+	apu->recv_buf_da = ipi_buf_da;
+	apu->send_buf = ipi_buf + sizeof(struct mtk_share_obj);
+	apu->send_buf_da = ipi_buf_da + sizeof(struct mtk_share_obj);
+	ipi_config->in_buf_da = apu->send_buf_da;
+	ipi_config->out_buf_da = apu->recv_buf_da;
+
+	return 0;
+}
+
+void apu_ipi_remove(struct mtk_apu *apu)
+{
+	mbox_free_channel(apu->ch);
+	apu_remove_rpmsg_subdev(apu);
+	apu_ipi_unregister(apu, APU_IPI_INIT);
+}
+
+int apu_ipi_init(struct platform_device *pdev, struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	struct mbox_client *cl;
+	int i, ret;
+
+	tx_serial_no = 0;
+	rx_serial_no = 0;
+
+	mutex_init(&apu->send_lock);
+	spin_lock_init(&apu->usage_cnt_lock);
+	for (i = 0; i < APU_IPI_MAX; i++) {
+		mutex_init(&apu->ipi_desc[i].lock);
+		lockdep_set_class_and_name(&apu->ipi_desc[i].lock,
+					   &ipi_lock_key[i],
+					   apu->platdata->ipi_attrs[i].name);
+	}
+
+	init_waitqueue_head(&apu->run.wq);
+	init_waitqueue_head(&apu->ack_wq);
+
+	/* APU initialization IPI register */
+	ret = apu_ipi_register(apu, APU_IPI_INIT, apu_init_ipi_handler, apu);
+	if (ret) {
+		dev_err(dev, "failed to register ipi for init, ret=%d\n",
+			ret);
+		return ret;
+	}
+
+	/* add rpmsg subdev */
+	apu_add_rpmsg_subdev(apu);
+
+	cl = &apu->cl;
+	cl->dev = dev;
+	cl->tx_block = true;
+	cl->tx_tout = 1000; /* timeout 1000ms */
+	cl->knows_txdone = false;
+	cl->rx_callback = apu_ipi_handle_rx;
+
+	apu->ch = mbox_request_channel(cl, 0);
+	if (IS_ERR(apu->ch)) {
+		ret = PTR_ERR(apu->ch);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request mbox chan, ret %d\n",
+				ret);
+
+		goto remove_rpmsg_subdev;
+	}
+
+	return 0;
+
+remove_rpmsg_subdev:
+	apu_remove_rpmsg_subdev(apu);
+	apu_ipi_unregister(apu, APU_IPI_INIT);
+
+	return ret;
+}
diff --git a/drivers/remoteproc/mtk-apu-rproc.c b/drivers/remoteproc/mtk-apu-rproc.c
new file mode 100644
index 000000000000..40af8e88f41a
--- /dev/null
+++ b/drivers/remoteproc/mtk-apu-rproc.c
@@ -0,0 +1,1054 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+#include <linux/time64.h>
+#include <linux/of_platform.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc/mtk-apu.h>
+#include <linux/remoteproc/mtk-apu-config.h>
+#include <linux/sched/clock.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+#include <linux/time64.h>
+#include <linux/workqueue.h>
+
+/* cmd */
+enum {
+	DPIDLE_CMD_LOCK_IPI = 0x5a00,
+	DPIDLE_CMD_UNLOCK_IPI = 0x5a01,
+	DPIDLE_CMD_PDN_UNLOCK = 0x5a02,
+};
+
+/* ack */
+enum {
+	DPIDLE_ACK_OK = 0,
+	DPIDLE_ACK_LOCK_BUSY,
+	DPIDLE_ACK_POWER_DOWN_FAIL,
+};
+
+static struct work_struct *apu_pwr_work;
+static struct workqueue_struct *apu_pwr_wq;
+
+static const struct apu_ipi mt81xx_ipi_attrs[APU_IPI_MAX] = {
+		   [APU_IPI_INIT] = {
+			   .name = "init",
+			   .direction = IPI_APU_INITIATE,
+			   .ack = IPI_WITHOUT_ACK,
+		   },
+		   [APU_IPI_NS_SERVICE] = {
+			   .name = "name-service",
+			   .direction = IPI_APU_INITIATE,
+			   .ack = IPI_WITHOUT_ACK,
+		   },
+		   [APU_IPI_DEEP_IDLE] = {
+			   .name = "deep_idle",
+			   .direction = IPI_APU_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_CTRL_RPMSG] = {
+			   .name = "apu-ctrl-rpmsg",
+			   .direction = IPI_APU_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_MIDDLEWARE] = {
+			   .name = "apu-mdw-rpmsg",
+			   .direction = IPI_HOST_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_REVISER_RPMSG] = {
+			   .name = "apu-reviser-rpmsg",
+			   .direction = IPI_HOST_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_PWR_TX] = {
+			   .name = "apupwr-tx-rpmsg",
+			   .direction = IPI_HOST_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_PWR_RX] = {
+			   .name = "apupwr-rx-rpmsg",
+			   .direction = IPI_APU_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_MDLA_TX] = {
+			   .name = "mdla-tx-rpmsg",
+			   .direction = IPI_HOST_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_MDLA_RX] = {
+			   .name = "mdla-rx-rpmsg",
+			   .direction = IPI_APU_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_TIMESYNC] = {
+			   .name = "apu-timesync",
+			   .direction = IPI_APU_INITIATE,
+			   .ack = IPI_WITH_ACK,
+		   },
+		   [APU_IPI_EDMA_TX] = {
+			   .name = "apu-edma-rpmsg",
+			   .direction = IPI_HOST_INITIATE,
+			   .ack = IPI_WITHOUT_ACK,
+		   },
+		   [APU_IPI_MNOC_TX] = {
+			   .name = "apu-mnoc-rpmsg",
+			   .direction = IPI_HOST_INITIATE,
+			   .ack = IPI_WITHOUT_ACK,
+		   },
+};
+
+static void apu_reset_mcu(struct mtk_apu *apu)
+{
+	u32 reg;
+
+	/* assert mcu reset */
+	reg = ioread32(apu->md32_sysctrl);
+	iowrite32(reg & ~0x1, apu->md32_sysctrl);
+	mdelay(10);
+	iowrite32(reg | 0x1, apu->md32_sysctrl);
+}
+
+static int apu_start_mcu(struct mtk_apu *apu)
+{
+	struct arm_smccc_res ares;
+
+	iowrite32(0xEA9, apu->md32_sysctrl);
+	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL, MTK_SIP_APU_START_MCU,
+		      0, 0, 0, 0, 0, 0, &ares);
+	if (ares.a0)
+		dev_err(apu->dev, "start mcu fail: %lu\n", ares.a0);
+
+	return 0;
+}
+
+static int apu_stop_mcu(struct mtk_apu *apu)
+{
+	struct arm_smccc_res ares;
+
+	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL, MTK_SIP_APU_STOP_MCU,
+		      0, 0, 0, 0, 0, 0, &ares);
+	if (ares.a0)
+		dev_err(apu->dev, "stop mcufail: %lu\n", ares.a0);
+
+	return 0;
+}
+
+static int mt81xx_rproc_start(struct mtk_apu *apu)
+{
+	apu_reset_mcu(apu);
+	apu_start_mcu(apu);
+
+	return 0;
+}
+
+static int mt81xx_rproc_resume(struct mtk_apu *apu)
+{
+	apu_start_mcu(apu);
+
+	return 0;
+}
+
+static int mt81xx_rproc_stop(struct mtk_apu *apu)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&apu->reg_lock, flags);
+	/* disable apu wdt */
+	iowrite32(ioread32(apu->apu_wdt + WDT_CTRL0) & ~WDT_EN,
+		  apu->apu_wdt + WDT_CTRL0);
+	/* clear wdt interrupt */
+	iowrite32(0x1, apu->apu_wdt);
+	spin_unlock_irqrestore(&apu->reg_lock, flags);
+
+	/* Hold runstall */
+	apu_stop_mcu(apu);
+	return 0;
+}
+
+static int mt81xx_apu_power_on(struct mtk_apu *apu)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(apu->dev);
+	if (ret < 0) {
+		dev_info(apu->dev,
+			 "%s: call to get_sync(dev) failed, ret=%d\n",
+			 __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt81xx_apu_power_off(struct mtk_apu *apu)
+{
+	int ret, timeout;
+	u32 val;
+
+	/* wait remote power state */
+	ret = readl_relaxed_poll_timeout(apu->apu_mbox + REG_MBOX_SPARE(6, 3),
+					 val,
+					 (val & BIT(0)),
+					 10, 25000);
+	if (ret) {
+		dev_err(apu->dev, "Remote WFI not ready\n");
+		return ret;
+	}
+
+	ret = pm_runtime_put_sync(apu->dev);
+	if (ret) {
+		dev_info(apu->dev,
+			 "%s: call to put_sync(dev) failed, ret=%d\n",
+			 __func__, ret);
+		goto error_genpd;
+	}
+
+	/* polling APU TOP rpm state till suspended */
+	dev_info(apu->dev, "start polling power off\n");
+	timeout = 500;
+	while (apu->top_genpd && timeout-- > 0)
+		msleep(20);
+	if (timeout <= 0) {
+		dev_info(apu->dev, "%s: polling power off timeout!!\n",
+			 __func__);
+		apu_ipi_unlock(apu);
+		WARN_ON(0);
+		ret = -ETIMEDOUT;
+		goto error_genpd;
+	}
+
+	dev_info(apu->dev, "polling power done\n");
+
+	return 0;
+
+error_genpd:
+	pm_runtime_get_sync(apu->dev);
+
+	return ret;
+}
+
+static int mt81xx_apu_memmap_init(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "apu_mbox");
+	if (!res) {
+		dev_info(dev, "%s: apu_mbox get resource fail\n", __func__);
+		return -ENODEV;
+	}
+	apu->apu_mbox = ioremap(res->start, res->end - res->start + 1);
+	if (IS_ERR((void const *)apu->apu_mbox)) {
+		dev_info(dev, "%s: apu_mbox remap base fail\n", __func__);
+		return -ENOMEM;
+	}
+
+	res = platform_get_resource_byname(pdev,
+					   IORESOURCE_MEM, "md32_sysctrl");
+	if (!res) {
+		dev_info(dev, "%s: md32_sysctrl get resource fail\n", __func__);
+		return -ENODEV;
+	}
+	apu->md32_sysctrl = ioremap(res->start, res->end - res->start + 1);
+	if (IS_ERR((void const *)apu->md32_sysctrl)) {
+		dev_info(dev, "%s: md32_sysctrl remap base fail\n", __func__);
+		return -ENOMEM;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "apu_wdt");
+	if (!res) {
+		dev_info(dev, "%s: apu_wdt get resource fail\n", __func__);
+		return -ENODEV;
+	}
+	apu->apu_wdt = ioremap(res->start, res->end - res->start + 1);
+	if (IS_ERR((void const *)apu->apu_wdt)) {
+		dev_info(dev, "%s: apu_wdt remap base fail\n", __func__);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void mt81xx_apu_memmap_remove(struct mtk_apu *apu)
+{
+	iounmap(apu->apu_wdt);
+	iounmap(apu->md32_sysctrl);
+	iounmap(apu->apu_mbox);
+}
+
+static void *apu_da_to_va(struct rproc *rproc, u64 da, size_t len,
+			  bool *is_iomem)
+{
+	void *ptr = NULL;
+	struct mtk_apu *apu = (struct mtk_apu *)rproc->priv;
+
+	if (da >= DRAM_OFFSET && da < DRAM_OFFSET + CODE_BUF_SIZE) {
+		ptr = apu->code_buf + (da - DRAM_OFFSET);
+	} else {
+		dev_err(apu->dev, "%s: invalid da: da = 0x%llx, len = %zu\n",
+			__func__, da, len);
+	}
+	return ptr;
+}
+
+static int apu_run(struct rproc *rproc)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)rproc->priv;
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+	struct device *dev = apu->dev;
+	struct apu_run *run = &apu->run;
+	struct timespec64 begin, end, delta;
+	int ret;
+
+	pm_runtime_get_sync(apu->dev);
+	hw_ops->start(apu);
+
+	/* check if boot success */
+	ktime_get_ts64(&begin);
+	ret = wait_event_interruptible_timeout(run->wq,
+					       run->signaled,
+					       msecs_to_jiffies(10000));
+	ktime_get_ts64(&end);
+	if (ret == 0) {
+		dev_info(dev, "APU initialization timeout!!\n");
+		ret = -ETIME;
+		goto stop;
+	}
+	if (ret == -ERESTARTSYS) {
+		dev_info(dev, "wait APU interrupted by a signal!!\n");
+		goto stop;
+	}
+
+	apu->boot_done = true;
+	delta = timespec64_sub(end, begin);
+	dev_info(dev, "APU uP boot success. boot time: %llu s, %llu ns\n",
+		 (u64)delta.tv_sec, (u64)delta.tv_nsec);
+
+	return 0;
+
+stop:
+	hw_ops->stop(apu);
+
+	return ret;
+}
+
+static int apu_start(struct rproc *rproc)
+{
+	return apu_run(rproc);
+}
+
+static int apu_attach(struct rproc *rproc)
+{
+	return apu_run(rproc);
+}
+
+static int apu_stop(struct rproc *rproc)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)rproc->priv;
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+
+	hw_ops->stop(apu);
+
+	return 0;
+}
+
+static const struct rproc_ops apu_ops = {
+	.start		= apu_start,
+	.stop		= apu_stop,
+	.attach		= apu_attach,
+	.da_to_va	= apu_da_to_va,
+};
+
+#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+static void apu_deepidle_pwron_dbg_fn(struct work_struct *work)
+{
+	struct mtk_apu *apu = container_of(work, struct mtk_apu, pwron_dbg_wk);
+	struct device *dev = apu->dev;
+	int i;
+
+	dev_info(dev, "mbox dummy= 0x%08x 0x%08x 0x%08x 0x%08x\n",
+		 ioread32(apu->apu_mbox + REG_MBOX_SPARE(0, 0)),
+		 ioread32(apu->apu_mbox + REG_MBOX_SPARE(0, 1)),
+		 ioread32(apu->apu_mbox + REG_MBOX_SPARE(0, 2)),
+		 ioread32(apu->apu_mbox + REG_MBOX_SPARE(0, 3)));
+
+	usleep_range(0, 1000);
+	for (i = 0; i < 5; i++) {
+		dev_info(apu->dev, "apu boot: pc=%08x, sp=%08x\n",
+			 ioread32(apu->md32_sysctrl + MD32_MON_PC),
+			 ioread32(apu->md32_sysctrl + MD32_MON_SP));
+		usleep_range(0, 1000);
+	}
+
+	dev_info(dev, "%s: MD32_SYS_CTRL = 0x%x\n",
+		 __func__, ioread32(apu->md32_sysctrl + MD32_SYS_CTRL));
+}
+#endif
+
+static int apu_deepidle_send_ack(struct mtk_apu *apu, u32 cmd, u32 ack)
+{
+	struct dpidle_msg msg;
+	int ret;
+
+	msg.cmd = cmd;
+	msg.ack = ack;
+	ret = apu_ipi_send(apu, APU_IPI_DEEP_IDLE, &msg, sizeof(msg), 0);
+	if (ret)
+		dev_info(apu->dev,
+			 "%s: failed to send ack msg, ack=%d, ret=%d\n",
+			 __func__, ack, ret);
+
+	return ret;
+}
+
+static void apu_deepidle_work_func(struct work_struct *work)
+{
+	struct mtk_apu *apu = container_of(work, struct mtk_apu, deepidle_work);
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+	struct dpidle_msg *msg = &apu->recv_msg;
+	int ret;
+
+	switch (msg->cmd) {
+	case DPIDLE_CMD_LOCK_IPI:
+		ret = apu_ipi_lock(apu);
+		if (ret) {
+			dev_info(apu->dev, "%s: failed to lock IPI, ret=%d\n",
+				 __func__, ret);
+			apu_deepidle_send_ack(apu, DPIDLE_CMD_LOCK_IPI,
+					      DPIDLE_ACK_LOCK_BUSY);
+			return;
+		}
+		apu_deepidle_send_ack(apu, DPIDLE_CMD_LOCK_IPI,
+				      DPIDLE_ACK_OK);
+		break;
+
+	case DPIDLE_CMD_UNLOCK_IPI:
+		apu_ipi_unlock(apu);
+		apu_deepidle_send_ack(apu, DPIDLE_CMD_UNLOCK_IPI,
+				      DPIDLE_ACK_OK);
+		break;
+
+	case DPIDLE_CMD_PDN_UNLOCK:
+		apu_deepidle_send_ack(apu, DPIDLE_CMD_PDN_UNLOCK,
+				      DPIDLE_ACK_OK);
+		ret = hw_ops->power_off(apu);
+		if (ret) {
+			dev_info(apu->dev, "failed to power off ret=%d\n", ret);
+			apu_ipi_unlock(apu);
+			WARN_ON(0);
+			return;
+		}
+		apu_ipi_unlock(apu);
+		break;
+
+	default:
+		dev_info(apu->dev, "unknown cmd %x\n", msg->cmd);
+		break;
+	}
+}
+
+static void apu_deepidle_ipi_handler(void *data, unsigned int len, void *priv)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)priv;
+
+	memcpy(&apu->recv_msg, data, len);
+	queue_work(apu->apu_deepidle_workq, &apu->deepidle_work);
+}
+
+static int apu_deepidle_init(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	int ret;
+
+	apu->apu_deepidle_workq = alloc_workqueue("apu_deepidle",
+						  WQ_UNBOUND | WQ_HIGHPRI, 0);
+	if (!apu->apu_deepidle_workq) {
+		dev_info(apu->dev, "%s: failed to allocate rq for deep idle\n",
+			 __func__);
+		return -ENOMEM;
+	}
+	INIT_WORK(&apu->deepidle_work, apu_deepidle_work_func);
+
+	ret = apu_ipi_register(apu, APU_IPI_DEEP_IDLE,
+			       apu_deepidle_ipi_handler, apu);
+	if (ret) {
+		dev_info(dev,
+			 "%s: failed to register deepidle ipi, ret=%d\n",
+			 __func__, ret);
+	}
+#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+	INIT_WORK(&apu->pwron_dbg_wk, apu_deepidle_pwron_dbg_fn);
+#endif
+
+	return ret;
+}
+
+static void apu_deepidle_exit(struct mtk_apu *apu)
+{
+#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+	flush_work(&apu->pwron_dbg_wk);
+#endif
+	apu_ipi_unregister(apu, APU_IPI_DEEP_IDLE);
+	if (apu->apu_deepidle_workq)
+		destroy_workqueue(apu->apu_deepidle_workq);
+}
+
+void apu_deepidle_power_on_aputop(struct mtk_apu *apu)
+{
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+
+	if (pm_runtime_suspended(apu->dev)) {
+		apu->conf_buf->time_offset = sched_clock();
+		hw_ops->power_on(apu);
+
+	#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+		schedule_work(&apu->pwron_dbg_wk);
+	#endif
+	}
+}
+
+static void apu_timesync_work_func(struct work_struct *work)
+{
+	struct mtk_apu *apu = container_of(work, struct mtk_apu, timesync_work);
+	int ret;
+
+	apu->timesync_stamp = sched_clock();
+	ret = apu_ipi_send(apu, APU_IPI_TIMESYNC, &apu->timesync_stamp,
+			   sizeof(u64), 0);
+	if (ret) {
+		dev_err(apu->dev, "timsync ipi fail(%d)\n", ret);
+		return;
+	}
+}
+
+static void apu_timesync_handler(void *data, u32 len, void *priv)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)priv;
+
+	queue_work(apu->timesync_wq, &apu->timesync_work);
+}
+
+static int apu_timesync_init(struct mtk_apu *apu)
+{
+	int ret;
+
+	apu->timesync_wq = alloc_workqueue("apu_timesync",
+					   WQ_UNBOUND | WQ_HIGHPRI, 0);
+	if (!apu->timesync_wq) {
+		dev_info(apu->dev, "%s: failed to allocate wq for timesync\n",
+			 __func__);
+		return -ENOMEM;
+	}
+	INIT_WORK(&apu->timesync_work, apu_timesync_work_func);
+
+	ret = apu_ipi_register(apu, APU_IPI_TIMESYNC, apu_timesync_handler,
+			       apu);
+	if (ret) {
+		dev_info(apu->dev, "%s: failed to register IPI\n", __func__);
+		destroy_workqueue(apu->timesync_wq);
+		apu->timesync_wq = NULL;
+		return ret;
+	}
+
+	pr_info("%s %d\n", __func__, __LINE__);
+	return 0;
+}
+
+static void apu_timesync_remove(struct mtk_apu *apu)
+{
+	apu_ipi_unregister(apu, APU_IPI_TIMESYNC);
+
+	if (apu->timesync_wq)
+		destroy_workqueue(apu->timesync_wq);
+}
+
+static irqreturn_t apu_wdt_isr(int irq, void *private_data)
+{
+	unsigned long flags;
+	struct mtk_apu *apu = (struct mtk_apu *)private_data;
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+
+	spin_lock_irqsave(&apu->reg_lock, flags);
+	if (hw_ops->cg_gating)
+		hw_ops->cg_gating(apu);
+
+	/* disable apu wdt */
+	iowrite32(ioread32(apu->apu_wdt + WDT_CTRL0) & ~WDT_EN,
+		  apu->apu_wdt + WDT_CTRL0);
+	/* clear wdt interrupt */
+	iowrite32(0x1, apu->apu_wdt);
+	spin_unlock_irqrestore(&apu->reg_lock, flags);
+	disable_irq_nosync(apu->wdt_irq_number);
+
+	return IRQ_HANDLED;
+}
+
+static int apu_excep_init(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	u32 irq_type = irq_get_trigger_type(apu->wdt_irq_number);
+	int ret = 0;
+
+	apu->wdt_irq_number = platform_get_irq_byname(pdev, "apu_wdt");
+	ret = devm_request_irq(dev, apu->wdt_irq_number, apu_wdt_isr,
+			       irq_type, "apusys_wdt", apu);
+	if (ret < 0)
+		dev_err(dev, "%s Failed to request irq %d: %d\n",
+			__func__, apu->wdt_irq_number, ret);
+
+	return ret;
+}
+
+static void apu_excep_remove(struct mtk_apu *apu)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&apu->reg_lock, flags);
+	/* disable apu wdt */
+	iowrite32(ioread32(apu->apu_wdt + WDT_CTRL0) & ~WDT_EN,
+		  apu->apu_wdt + WDT_CTRL0);
+	/* clear wdt interrupt */
+	iowrite32(0x1, apu->apu_wdt);
+	spin_unlock_irqrestore(&apu->reg_lock, flags);
+	disable_irq(apu->wdt_irq_number);
+}
+
+#define CONFIG_SIZE (round_up(sizeof(struct config_v1), PAGE_SIZE))
+static void apu_config_user_ptr_init(const struct mtk_apu *apu)
+{
+	struct config_v1 *config;
+	struct config_v1_entry_table *entry_table;
+
+	if (!apu || !apu->conf_buf) {
+		pr_err("%s: error\n", __func__);
+		return;
+	}
+
+	config = apu->conf_buf;
+	config->header_magic = 0xc0de0101;
+	config->header_rev = 0x1;
+	config->entry_offset = offsetof(struct config_v1, entry_tbl);
+	config->config_size = sizeof(struct config_v1);
+
+	entry_table = (struct config_v1_entry_table *)((void *)config +
+		config->entry_offset);
+
+	entry_table->user_entry[0] = offsetof(struct config_v1, user0_data);
+	entry_table->user_entry[1] = offsetof(struct config_v1, user1_data);
+	entry_table->user_entry[2] = offsetof(struct config_v1, user2_data);
+	entry_table->user_entry[3] = offsetof(struct config_v1, user3_data);
+	entry_table->user_entry[4] = offsetof(struct config_v1, user4_data);
+}
+
+static int apu_config_setup(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	unsigned long flags;
+	int ret;
+
+	apu->conf_buf = dma_alloc_coherent(apu->dev, CONFIG_SIZE,
+					   &apu->conf_da, GFP_KERNEL);
+
+	if (!apu->conf_buf || apu->conf_da == 0) {
+		dev_info(dev, "%s: dma_alloc_coherent fail\n", __func__);
+		return -ENOMEM;
+	}
+	memset(apu->conf_buf, 0, CONFIG_SIZE);
+
+	apu_config_user_ptr_init(apu);
+	spin_lock_irqsave(&apu->reg_lock, flags);
+	iowrite32((u32)apu->conf_da, apu->apu_mbox + HOST_CONFIG_ADDR);
+	spin_unlock_irqrestore(&apu->reg_lock, flags);
+
+	apu->conf_buf->time_offset = sched_clock();
+	ret = apu_ipi_config_init(apu);
+	if (ret) {
+		dev_info(dev, "apu ipi config init failed\n");
+		goto out;
+	}
+
+	ret = sw_logger_config_init(apu->conf_buf);
+	if (ret) {
+		dev_err(dev, "sw logger config init failed\n");
+		goto err_sw_logger;
+	}
+
+	return 0;
+
+err_sw_logger:
+	apu_ipi_config_remove(apu);
+out:
+	return ret;
+}
+
+static void apu_config_remove(struct mtk_apu *apu)
+{
+	sw_logger_config_remove();
+	apu_ipi_config_remove(apu);
+	dma_free_coherent(apu->dev, CONFIG_SIZE,
+			  apu->conf_buf, apu->conf_da);
+}
+
+static int apu_dram_boot_init(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	int ret = 0;
+	int map_sg_sz = 0;
+	void *domain;
+	struct sg_table sgt;
+	phys_addr_t pa;
+	u32 boundary;
+	u64 iova;
+
+	domain = iommu_get_domain_for_dev(apu->dev);
+	if (!domain) {
+		dev_err(dev, "%s: iommu_get_domain_for_dev fail\n",
+			__func__);
+		return -ENOMEM;
+	}
+
+	/* Allocate code buffer */
+	apu->code_buf = dma_alloc_coherent(apu->dev, CODE_BUF_SIZE,
+					   &apu->code_da, GFP_KERNEL);
+	if (!apu->code_buf || apu->code_da == 0) {
+		dev_err(dev, "%s: dma_alloc_coherent fail\n", __func__);
+		return -ENOMEM;
+	}
+	memset(apu->code_buf, 0, CODE_BUF_SIZE);
+	boundary = (u32)upper_32_bits(apu->code_da);
+	iova = CODE_BUF_DA | ((u64)boundary << 32);
+
+	/* Convert IOVA to sgtable */
+	sgt.sgl = NULL;
+	ret = dma_get_sgtable(apu->dev, &sgt, apu->code_buf,
+			      apu->code_da, CODE_BUF_SIZE);
+	if (ret < 0 || !sgt.sgl) {
+		dev_err(dev, "get sgtable fail\n");
+		return -EINVAL;
+	}
+
+	/* Map sg_list to MD32_BOOT_ADDR */
+	map_sg_sz = iommu_map_sg(domain, iova, sgt.sgl,
+				 sgt.nents, IOMMU_READ | IOMMU_WRITE);
+	if (map_sg_sz != CODE_BUF_SIZE)
+		return -EINVAL;
+
+	pa = iommu_iova_to_phys(domain, iova + CODE_BUF_SIZE - SZ_4K);
+	if (!pa)
+		ret = -EPERM;
+
+	return ret;
+}
+
+static void apu_dram_boot_remove(struct mtk_apu *apu)
+{
+	void *domain = iommu_get_domain_for_dev(apu->dev);
+	u32 boundary = (u32)upper_32_bits(apu->code_da);
+	u64 iova = CODE_BUF_DA | ((u64)boundary << 32);
+
+	if (domain)
+		iommu_unmap(domain, iova, CODE_BUF_SIZE);
+
+	dma_free_coherent(apu->dev, CODE_BUF_SIZE, apu->code_buf, apu->code_da);
+}
+
+static void apu_power_work_fn(struct work_struct *work)
+{
+	struct mtk_apu *apu = container_of(work, struct mtk_apu, pwr_work);
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+
+	if (!apu->boot_done) {
+		pr_info("%s: uP not boot yet, skip pm nfy\n", __func__);
+		return;
+	}
+	hw_ops->stop(apu);
+}
+
+static int apu_power_genpd_notifier(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct mtk_apu *apu = container_of(apu_pwr_work,
+					   struct mtk_apu, pwr_work);
+
+	switch (event) {
+	case GENPD_NOTIFY_OFF:
+		apu->top_genpd = false;
+		pr_info("%s: apu top off\n", __func__);
+		queue_work(apu_pwr_wq, apu_pwr_work);
+		break;
+	case GENPD_NOTIFY_ON:
+		apu->top_genpd = true;
+		pr_info("%s: apu top on\n", __func__);
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block apu_genpd_nb = {
+	.notifier_call = apu_power_genpd_notifier,
+};
+
+static int apu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct rproc *rproc;
+	struct mtk_apu *apu;
+	struct mtk_apu_platdata *data;
+	struct mtk_apu_hw_ops *hw_ops;
+	char *fw_name = "mrv.elf";
+	int ret = 0;
+
+	data = (struct mtk_apu_platdata *)of_device_get_match_data(dev);
+	if (!data) {
+		dev_info(dev, "%s: of_device_get_match_data fail\n", __func__);
+		return -EINVAL;
+	}
+	hw_ops = &data->ops;
+
+	rproc = rproc_alloc(dev,
+			    np->name,
+			    &apu_ops,
+			    fw_name,
+			    sizeof(struct mtk_apu));
+
+	if (!rproc) {
+		dev_info(dev, "unable to allocate remoteproc\n");
+		return -ENOMEM;
+	}
+
+	if (data->flags & F_AUTO_BOOT)
+		rproc->auto_boot = true;
+	else
+		rproc->auto_boot = false;
+
+	apu = (struct mtk_apu *)rproc->priv;
+	apu->rproc = rproc;
+	apu->dev = dev;
+	apu->platdata = data;
+	platform_set_drvdata(pdev, apu);
+	spin_lock_init(&apu->reg_lock);
+
+	/* detect mandaotry platform data*/
+	if (!hw_ops->apu_memmap_init || !hw_ops->apu_memmap_remove ||
+	    !hw_ops->start || !hw_ops->stop ||
+	    !hw_ops->power_on || !hw_ops->power_off ||
+	    !apu->platdata->ipi_attrs) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+
+	ret = dma_set_mask_and_coherent(apu->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		pr_info("%s: dma_set_mask_and_coherent fail(%d)\n",
+			__func__, ret);
+		goto out_free_rproc;
+	}
+
+	ret = hw_ops->apu_memmap_init(apu);
+	if (ret)
+		goto remove_apu_memmap;
+
+	ret = apu_config_setup(apu);
+	if (ret)
+		goto remove_apu_config_setup;
+
+	ret = apu_dram_boot_init(apu);
+	if (ret)
+		goto remove_apu_dram_boot;
+
+	ret = apu_ipi_init(pdev, apu);
+	if (ret)
+		goto remove_apu_ipi;
+
+	if (data->flags & F_AUTO_BOOT) {
+		ret = apu_deepidle_init(apu);
+		if (ret < 0)
+			goto remove_apu_deepidle;
+	}
+
+	ret = apu_timesync_init(apu);
+	if (ret)
+		goto remove_apu_timesync;
+
+	ret = apu_excep_init(apu);
+	if (ret < 0)
+		goto remove_apu_excep;
+
+	if (data->flags & F_PRELOAD_FIRMWARE)
+		rproc->state = RPROC_DETACHED;
+
+	ret = rproc_add(rproc);
+	if (ret < 0) {
+		dev_info(dev, "boot fail ret:%d\n", ret);
+		goto remove_apu_excep;
+	}
+
+	if (hw_ops->init) {
+		ret = hw_ops->init(apu);
+		if (ret)
+			goto del_rproc;
+	}
+
+	apu_pwr_wq = alloc_workqueue("apu_pwr_wq",
+				     WQ_UNBOUND | WQ_HIGHPRI, 0);
+	if (!apu_pwr_wq) {
+		dev_info(dev, "%s: failed to allocate wq for rv power\n",
+			 __func__);
+		goto del_rproc;
+	}
+	INIT_WORK(&apu->pwr_work, apu_power_work_fn);
+	apu_pwr_work = &apu->pwr_work;
+
+	pm_runtime_put_sync(&pdev->dev);
+	dev_pm_genpd_add_notifier(dev, &apu_genpd_nb);
+
+	return 0;
+
+del_rproc:
+	rproc_del(rproc);
+
+remove_apu_excep:
+	apu_excep_remove(apu);
+
+remove_apu_timesync:
+	apu_timesync_remove(apu);
+
+remove_apu_deepidle:
+	apu_deepidle_exit(apu);
+
+remove_apu_ipi:
+	apu_ipi_remove(apu);
+
+remove_apu_dram_boot:
+	apu_dram_boot_remove(apu);
+
+remove_apu_config_setup:
+	apu_config_remove(apu);
+
+remove_apu_memmap:
+	hw_ops->apu_memmap_remove(apu);
+
+out_free_rproc:
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	rproc_free(rproc);
+
+	return ret;
+}
+
+static int apu_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_apu *apu = platform_get_drvdata(pdev);
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+
+	if (hw_ops->exit)
+		hw_ops->exit(apu);
+
+	dev_pm_genpd_remove_notifier(dev);
+	pm_runtime_put_sync(&pdev->dev);
+	destroy_workqueue(apu_pwr_wq);
+	rproc_del(apu->rproc);
+	apu_deepidle_exit(apu);
+	apu_excep_remove(apu);
+	apu_timesync_remove(apu);
+	apu_ipi_remove(apu);
+	apu_dram_boot_remove(apu);
+	apu_config_remove(apu);
+	hw_ops->apu_memmap_remove(apu);
+	pm_runtime_disable(dev);
+	rproc_free(apu->rproc);
+
+	return 0;
+}
+
+const struct mtk_apu_platdata mt8192_platdata = {
+	.flags = F_AUTO_BOOT,
+	.ipi_attrs = mt81xx_ipi_attrs,
+	.ops = {
+		.start = mt81xx_rproc_start,
+		.stop = mt81xx_rproc_stop,
+		.resume = mt81xx_rproc_resume,
+		.apu_memmap_init = mt81xx_apu_memmap_init,
+		.apu_memmap_remove = mt81xx_apu_memmap_remove,
+		.power_on = mt81xx_apu_power_on,
+		.power_off = mt81xx_apu_power_off,
+	},
+};
+
+static const struct of_device_id apu_of_match[] = {
+	{ .compatible = "mediatek,mt8192-apusys-rv", .data = &mt8192_platdata},
+	{},
+};
+MODULE_DEVICE_TABLE(of, apu_of_match);
+
+static int apu_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int apu_runtime_resume(struct device *dev)
+{
+	struct mtk_apu *apu = dev_get_drvdata(dev);
+	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
+
+	if (!apu->boot_done)
+		return 0;
+
+	if (hw_ops->resume)
+		return hw_ops->resume(apu);
+
+	return 0;
+}
+
+static const struct dev_pm_ops apu_pm_ops = {
+	SET_RUNTIME_PM_OPS(apu_runtime_suspend, apu_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver apu_driver = {
+	.probe = apu_probe,
+	.remove = apu_remove,
+	.driver = {
+		.name = "mtk-apu",
+		.of_match_table = of_match_ptr(apu_of_match),
+		.pm = &apu_pm_ops,
+	},
+};
+
+static int __init apu_rproc_init(void)
+{
+	return platform_driver_register(&apu_driver);
+}
+
+static void __exit apu_rproc_exit(void)
+{
+	platform_driver_unregister(&apu_driver);
+}
+
+module_init(apu_rproc_init);
+module_exit(apu_rproc_exit);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek APU control driver");
diff --git a/include/linux/remoteproc/mtk-apu-config.h b/include/linux/remoteproc/mtk-apu-config.h
new file mode 100644
index 000000000000..fee3b0334502
--- /dev/null
+++ b/include/linux/remoteproc/mtk-apu-config.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef APU_CONFIG_H
+#define APU_CONFIG_H
+
+struct apu_ipi_config {
+	u64 in_buf_da;
+	u64 out_buf_da;
+} __packed;
+
+struct vpu_init_info {
+	u32 vpu_num;
+	u32 cfg_addr;
+	u32 cfg_size;
+	u32 algo_info_ptr[3 * 2];
+	u32 rst_vec[3];
+	u32 dmem_addr[3];
+	u32 imem_addr[3];
+	u32 iram_addr[3];
+	u32 cmd_addr[3];
+	u32 log_addr[3];
+	u32 log_size[3];
+} __packed;
+
+struct apusys_chip_data {
+	u32 s_code;
+	u32 b_code;
+	u32 r_code;
+	u32 a_code;
+} __packed;
+
+struct logger_init_info {
+	u32 iova;
+} __packed;
+
+struct reviser_init_info {
+	u32 boundary;
+	u32 dram[32];
+} __packed;
+
+enum user_config {
+	APU_IPI_CONFIG = 0x0,
+	VPU_INIT_INFO,
+	APUSYS_CHIP_DATA,
+	LOGGER_INIT_INFO,
+	REVISER_INIT_INFO,
+	USER_CONFIG_MAX
+};
+
+struct config_v1_entry_table {
+	u32 user_entry[USER_CONFIG_MAX];
+} __packed;
+
+struct config_v1 {
+	/* header begin */
+	u32 header_magic;
+	u32 header_rev;
+	u32 entry_offset;
+	u32 config_size;
+	/* header end */
+	/* do not add new member before this line */
+
+	/* system related config begin */
+	u32 ramdump_offset;
+	u32 ramdump_type;
+	u64 time_offset;
+	/* system related config end */
+
+	/* entry table */
+	u8 entry_tbl[sizeof(struct config_v1_entry_table)];
+
+	/* user data payload begin */
+	u8 user0_data[sizeof(struct apu_ipi_config)];
+	u8 user1_data[sizeof(struct vpu_init_info)];
+	u8 user2_data[sizeof(struct apusys_chip_data)];
+	u8 user3_data[sizeof(struct logger_init_info)];
+	u8 user4_data[sizeof(struct reviser_init_info)];
+	/* user data payload end */
+} __packed;
+
+static inline void *get_apu_config_user_ptr(struct config_v1 *conf,
+					    enum user_config user_id)
+{
+	struct config_v1_entry_table *entry_tbl;
+
+	if (!conf)
+		return NULL;
+
+	if (user_id >= USER_CONFIG_MAX)
+		return NULL;
+
+	entry_tbl = (struct config_v1_entry_table *)
+		((void *)conf + conf->entry_offset);
+
+	return (void *)conf + entry_tbl->user_entry[user_id];
+}
+#endif /* APU_CONFIG_H */
diff --git a/include/linux/remoteproc/mtk-apu.h b/include/linux/remoteproc/mtk-apu.h
new file mode 100644
index 000000000000..a5d3ff8a2d48
--- /dev/null
+++ b/include/linux/remoteproc/mtk-apu.h
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef APU_H
+#define APU_H
+
+#include <linux/spinlock.h>
+#include <linux/remoteproc/mtk-apu-config.h>
+#include <linux/rpmsg/mtk_rpmsg.h>
+#include <linux/mailbox_client.h>
+
+/* setup the SMC command ops */
+#define MTK_SIP_APU_START_MCU	0x00
+#define MTK_SIP_APU_STOP_MCU	0x01
+
+/* md32_sysctrl register definition */
+#define MD32_SYS_CTRL	0x0
+#define MD32_MON_PC	0x838
+#define MD32_MON_LR	0x83c
+#define MD32_MON_SP	0x840
+#define MD32_STATUS	0x844
+
+/*wdt register */
+#define WDT_INT		0x0
+#define WDT_CTRL0	0x4
+#define WDT_EN		BIT(31)
+
+/* apu_mbox spare register: mbox 0..6, spare 0..3 */
+#define REG_MBOX_SPARE(mbox, reg)	\
+	((0x40 + (0x100 * (mbox))) + ((reg) * 0x4))
+
+/* rv setup  */
+#define HOST_CONFIG_ADDR	REG_MBOX_SPARE(0, 2)
+#define F_PRELOAD_FIRMWARE	BIT(0)
+#define F_AUTO_BOOT		BIT(1)
+
+#define TCM_SIZE		(SZ_128 * SZ_1K)
+#define CODE_BUF_SIZE		SZ_1M
+#define DRAM_DUMP_SIZE		(CODE_BUF_SIZE - TCM_SIZE)
+#define REG_SIZE		(4UL * 151UL)
+#define TBUF_SIZE		(4UL * 32UL)
+#define CACHE_DUMP_SIZE		(37UL * SZ_1K)
+#define DRAM_OFFSET		(0x0UL)
+#define DRAM_DUMP_OFFSET	(TCM_SIZE)
+#define TCM_OFFSET		(0x1d700000UL)
+#define CODE_BUF_DA		(DRAM_OFFSET)
+
+/* ipi */
+#define APU_FW_VER_LEN		32
+#define APU_SHARE_BUFFER_SIZE	SZ_256
+
+#define IPI_LOCKED		1
+#define IPI_UNLOCKED		0
+
+#define IPI_HOST_INITIATE	0
+#define IPI_APU_INITIATE	1
+#define IPI_WITH_ACK		1
+#define IPI_WITHOUT_ACK		0
+
+enum {
+	APU_IPI_INIT = 0,
+	APU_IPI_NS_SERVICE,
+	APU_IPI_DEEP_IDLE,
+	APU_IPI_CTRL_RPMSG,
+	APU_IPI_MIDDLEWARE,
+	APU_IPI_REVISER_RPMSG,
+	APU_IPI_PWR_TX,
+	APU_IPI_PWR_RX,
+	APU_IPI_MDLA_TX,
+	APU_IPI_MDLA_RX,
+	APU_IPI_TIMESYNC,
+	APU_IPI_EDMA_TX,
+	APU_IPI_MNOC_TX,
+	APU_IPI_MAX,
+};
+
+struct mtk_apu;
+
+struct mtk_apu_hw_ops {
+	int (*init)(struct mtk_apu *apu);
+	int (*exit)(struct mtk_apu *apu);
+	int (*start)(struct mtk_apu *apu);
+	int (*stop)(struct mtk_apu *apu);
+	int (*resume)(struct mtk_apu *apu);
+	int (*apu_memmap_init)(struct mtk_apu *apu);
+	void (*apu_memmap_remove)(struct mtk_apu *apu);
+	void (*cg_gating)(struct mtk_apu *apu);
+	void (*cg_ungating)(struct mtk_apu *apu);
+	void (*rv_cachedump)(struct mtk_apu *apu);
+
+	/* power related ops */
+	int (*power_init)(struct mtk_apu *apu);
+	int (*power_on)(struct mtk_apu *apu);
+	int (*power_off)(struct mtk_apu *apu);
+};
+
+struct apu_ipi {
+	char *name;
+	unsigned int direction:1;
+	unsigned int ack:1;
+};
+
+struct mtk_apu_platdata {
+	u32 flags;
+	struct mtk_apu_hw_ops ops;
+	const struct apu_ipi *ipi_attrs;
+};
+
+struct dpidle_msg {
+	u32 cmd;
+	u32 ack;
+};
+
+struct apu_run {
+	s8 fw_ver[APU_FW_VER_LEN];
+	u32 signaled;
+	wait_queue_head_t wq;
+};
+
+struct apu_ipi_desc {
+	struct mutex lock; /*ipi handler mutex */
+	ipi_handler_t handler;
+	void *priv;
+	/*
+	 * positive: host-initiated ipi outstanding count
+	 * negative: apu-initiated ipi outstanding count
+	 */
+	int usage_cnt;
+};
+
+struct mtk_share_obj {
+	u8 share_buf[APU_SHARE_BUFFER_SIZE];
+};
+
+struct mtk_apu {
+	struct rproc *rproc;
+	struct device *dev;
+	void __iomem *apu_mbox;
+	void __iomem *md32_sysctrl;
+	void __iomem *apu_wdt;
+	int wdt_irq_number;
+	spinlock_t reg_lock; /* register r/w lock */
+
+	/* mailbox */
+	struct mbox_client cl;
+	struct mbox_chan *ch;
+
+	/* Buffer to place execution area */
+	void *code_buf;
+	dma_addr_t code_da;
+
+	/* Buffer to place config area */
+	struct config_v1 *conf_buf;
+	dma_addr_t conf_da;
+
+	/* to synchronize boot status of remote processor */
+	struct apu_run run;
+
+	/* to prevent multiple ipi_send run concurrently */
+	struct mutex send_lock;
+	spinlock_t usage_cnt_lock; /* ipi occipued lock */
+	struct apu_ipi_desc ipi_desc[APU_IPI_MAX];
+	bool ipi_id_ack[APU_IPI_MAX]; /* per-ipi ack */
+	bool ipi_inbound_locked;
+	wait_queue_head_t ack_wq; /* for waiting for ipi ack */
+
+	/* ipi */
+	struct rproc_subdev *rpmsg_subdev;
+	dma_addr_t recv_buf_da;
+	struct mtk_share_obj *recv_buf;
+	dma_addr_t send_buf_da;
+	struct mtk_share_obj *send_buf;
+
+	/* time sync */
+	struct work_struct timesync_work;
+	struct workqueue_struct *timesync_wq;
+	u64 timesync_stamp;
+
+	/*deep idle */
+	struct dpidle_msg recv_msg;
+	struct work_struct deepidle_work;
+	struct workqueue_struct *apu_deepidle_workq;
+	struct work_struct pwron_dbg_wk;
+
+	struct mtk_apu_platdata	*platdata;
+
+	/* power status */
+	bool boot_done;
+	struct work_struct pwr_work;
+	bool top_genpd;
+};
+
+int apu_ipi_config_init(struct mtk_apu *apu);
+void apu_ipi_config_remove(struct mtk_apu *apu);
+void apu_ipi_remove(struct mtk_apu *apu);
+int apu_ipi_init(struct platform_device *pdev, struct mtk_apu *apu);
+int apu_ipi_register(struct mtk_apu *apu, u32 id,
+		     ipi_handler_t handler, void *priv);
+void apu_ipi_unregister(struct mtk_apu *apu, u32 id);
+int apu_ipi_send(struct mtk_apu *apu, u32 id, void *data, u32 len,
+		 u32 wait_ms);
+int apu_ipi_lock(struct mtk_apu *apu);
+void apu_ipi_unlock(struct mtk_apu *apu);
+
+void apu_deepidle_power_on_aputop(struct mtk_apu *apu);
+
+#if (IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_MTK_APU_DEBUG))
+int sw_logger_config_init(struct config_v1 *conf);
+void sw_logger_config_remove(void);
+#else
+static inline int sw_logger_config_init(struct config_v1 *conf) { return 0; }
+static inline void sw_logger_config_remove(void) { }
+#endif
+
+#endif /* APU_H */
-- 
2.18.0

