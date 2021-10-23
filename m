Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978B43848D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D2B6E837;
	Sat, 23 Oct 2021 17:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8848F6E826
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 11:15:02 +0000 (UTC)
X-UUID: e9d31e0a24f8425280daa880ca2426fc-20211023
X-UUID: e9d31e0a24f8425280daa880ca2426fc-20211023
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 476030224; Sat, 23 Oct 2021 19:14:57 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:14:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:56 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 08/13] soc: mediatek: apu: Add apusys rv driver
Date: Sat, 23 Oct 2021 19:14:04 +0800
Message-ID: <20211023111409.30463-9-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 23 Oct 2021 17:35:54 +0000
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

Add driver for control APU tinysys

APU integrated subsystem having MD32RV33 (MD32) that runs tinysys
The tinsys is running on a micro processor in APU.
Its firmware is load and boot from Kernel side. Kernel and tinysys use
IPI to tx/rx messages.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/soc/mediatek/apusys/Makefile        |   6 +
 drivers/soc/mediatek/apusys/apu-config.h    | 100 +++
 drivers/soc/mediatek/apusys/apu-core.c      |   2 +
 drivers/soc/mediatek/apusys/apu-core.h      |   2 +
 drivers/soc/mediatek/apusys/apu-ipi.c       | 486 ++++++++++++
 drivers/soc/mediatek/apusys/apu-mbox.c      |  83 ++
 drivers/soc/mediatek/apusys/apu-mbox.h      |  27 +
 drivers/soc/mediatek/apusys/apu-rproc.c     | 806 ++++++++++++++++++++
 drivers/soc/mediatek/apusys/apu-sw-logger.c | 429 +++++++++++
 drivers/soc/mediatek/apusys/apu.h           | 256 +++++++
 drivers/soc/mediatek/apusys/mt81xx-plat.c   | 320 ++++++++
 11 files changed, 2517 insertions(+)
 create mode 100644 drivers/soc/mediatek/apusys/apu-config.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-ipi.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-rproc.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-sw-logger.c
 create mode 100644 drivers/soc/mediatek/apusys/apu.h
 create mode 100644 drivers/soc/mediatek/apusys/mt81xx-plat.c

diff --git a/drivers/soc/mediatek/apusys/Makefile b/drivers/soc/mediatek/apusys/Makefile
index 8c61ed8e2c04..490de0ee4727 100644
--- a/drivers/soc/mediatek/apusys/Makefile
+++ b/drivers/soc/mediatek/apusys/Makefile
@@ -7,3 +7,9 @@ apu-objs += apu-core.o
 apu-objs += apu-pwr.o
 apu-objs += apu-pwr-ipi.o
 apu-$(CONFIG_MTK_APU_DEBUG) += apu-pwr-dbg.o
+
+apu-objs += apu-rproc.o
+apu-objs += apu-ipi.o
+apu-objs += apu-mbox.o
+apu-objs += mt81xx-plat.o
+apu-$(CONFIG_DEBUG_FS) += apu-sw-logger.o
diff --git a/drivers/soc/mediatek/apusys/apu-config.h b/drivers/soc/mediatek/apusys/apu-config.h
new file mode 100644
index 000000000000..fee3b0334502
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-config.h
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
diff --git a/drivers/soc/mediatek/apusys/apu-core.c b/drivers/soc/mediatek/apusys/apu-core.c
index 069e18af7a5b..80652b1d056e 100644
--- a/drivers/soc/mediatek/apusys/apu-core.c
+++ b/drivers/soc/mediatek/apusys/apu-core.c
@@ -19,6 +19,7 @@ static struct apusys_core_info g_core_info;
  */
 static int (*apusys_init_func[])(struct apusys_core_info *) = {
 	apu_power_drv_init,
+	apu_rproc_init,
 };
 
 /*
@@ -26,6 +27,7 @@ static int (*apusys_init_func[])(struct apusys_core_info *) = {
  * call exit function in order at apu.ko exit stage
  */
 static void (*apusys_exit_func[])(void) = {
+	apu_rproc_exit,
 	apu_power_drv_exit,
 };
 
diff --git a/drivers/soc/mediatek/apusys/apu-core.h b/drivers/soc/mediatek/apusys/apu-core.h
index 77f1b39424d1..b47d95f0a1ae 100644
--- a/drivers/soc/mediatek/apusys/apu-core.h
+++ b/drivers/soc/mediatek/apusys/apu-core.h
@@ -11,4 +11,6 @@ struct apusys_core_info {
 
 int apu_power_drv_init(struct apusys_core_info *info);
 void apu_power_drv_exit(void);
+int apu_rproc_init(struct apusys_core_info *info);
+void apu_rproc_exit(void);
 #endif
diff --git a/drivers/soc/mediatek/apusys/apu-ipi.c b/drivers/soc/mediatek/apusys/apu-ipi.c
new file mode 100644
index 000000000000..547e034b3620
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-ipi.c
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/lockdep.h>
+#include <linux/time64.h>
+
+#include "apu.h"
+#include "apu-config.h"
+#include "apu-mbox.h"
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
+	/* re-init inbox mask everytime for aoc */
+	apu_mbox_inbox_init(apu);
+	apu_deepidle_power_on_aputop(apu);
+	ret = apu_mbox_wait_inbox(apu);
+	if (ret) {
+		dev_info(apu->dev, "wait inbox fail, ret=%d\n", ret);
+		goto unlock_mutex;
+	}
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
+	apu_mbox_write_inbox(apu, &hdr);
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
+static irqreturn_t apu_ipi_handler(int irq, void *priv)
+{
+	struct timespec64 ts, te;
+	struct mtk_apu *apu = priv;
+	struct apu_mbox_hdr hdr;
+	struct mtk_share_obj *recv_obj = apu->recv_buf;
+	ipi_handler_t handler;
+	u32 id, len, calc_csum;
+	u32 temp_buf[APU_SHARE_BUFFER_SIZE / 4] = {0};
+
+	hdr.id = 0;
+	hdr.len = 0;
+	hdr.serial_no = 0;
+	hdr.csum = 0;
+
+	ktime_get_ts64(&ts);
+	apu_mbox_read_outbox(apu, &hdr);
+	id = hdr.id;
+	len = hdr.len;
+	if (hdr.serial_no != rx_serial_no) {
+		dev_info(apu->dev, "unmatched serial_no: curr=%u, recv=%u\n",
+			 rx_serial_no, hdr.serial_no);
+		dev_info(apu->dev, "outbox irq=%x\n",
+			 ioread32(apu->apu_mbox + 0xc4));
+		if (ioread32(apu->apu_mbox + 0xc4) == 0) {
+			dev_info(apu->dev, "abnormal isr call, skip\n");
+			goto ack_irq;
+		}
+	}
+	rx_serial_no++;
+
+	if (len > APU_SHARE_BUFFER_SIZE) {
+		dev_info(apu->dev, "IPI message too long(len %d, max %d)",
+			 len, APU_SHARE_BUFFER_SIZE);
+		goto ack_irq;
+	}
+
+	if (id >= APU_IPI_MAX) {
+		dev_info(apu->dev, "no such IPI id = %d", id);
+		goto ack_irq;
+	}
+
+	mutex_lock(&apu->ipi_desc[id].lock);
+	handler = apu->ipi_desc[id].handler;
+	if (!handler) {
+		dev_info(apu->dev, "IPI id=%d is not registered", id);
+		mutex_unlock(&apu->ipi_desc[id].lock);
+		goto ack_irq;
+	}
+
+	memcpy_fromio(temp_buf, &recv_obj->share_buf, len);
+
+	calc_csum = calculate_csum(temp_buf, len);
+	if (calc_csum != hdr.csum) {
+		dev_info(apu->dev, "csum error: recv=0x%08x, calc=0x%08x\n",
+			 hdr.csum, calc_csum);
+#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+		dump_msg_buf(apu, temp_buf, hdr.len);
+#endif
+	}
+
+	handler(temp_buf, len, apu->ipi_desc[id].priv);
+	ipi_usage_cnt_update(apu, id, -1);
+	mutex_unlock(&apu->ipi_desc[id].lock);
+
+	apu->ipi_id_ack[id] = true;
+	wake_up(&apu->ack_wq);
+
+ack_irq:
+	apu_mbox_ack_outbox(apu);
+	ktime_get_ts64(&te);
+	ts = timespec64_sub(te, ts);
+
+	return IRQ_HANDLED;
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
+	apu_mbox_hw_exit(apu);
+	apu_remove_rpmsg_subdev(apu);
+	apu_ipi_unregister(apu, APU_IPI_INIT);
+}
+
+int apu_ipi_init(struct platform_device *pdev, struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
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
+	/* register mailbox IRQ */
+	apu->mbox0_irq_number = platform_get_irq_byname(pdev, "mbox0_irq");
+	dev_info(&pdev->dev, "%s: mbox0_irq = %d\n", __func__,
+		 apu->mbox0_irq_number);
+
+	ret = devm_request_threaded_irq(&pdev->dev, apu->mbox0_irq_number,
+					NULL, apu_ipi_handler, IRQF_ONESHOT,
+					"apu_ipi", apu);
+	if (ret < 0)
+		goto remove_rpmsg_subdev;
+
+	apu_mbox_hw_init(apu);
+
+	return 0;
+
+remove_rpmsg_subdev:
+	apu_remove_rpmsg_subdev(apu);
+	apu_ipi_unregister(apu, APU_IPI_INIT);
+
+	return ret;
+}
diff --git a/drivers/soc/mediatek/apusys/apu-mbox.c b/drivers/soc/mediatek/apusys/apu-mbox.c
new file mode 100644
index 000000000000..dfd41f7c2640
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-mbox.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/jiffies.h>
+
+#include "apu.h"
+#include "apu-mbox.h"
+
+#define _INBOX(_m)		((_m)->apu_mbox + 0x0)
+#define _OUTBOX(_m)		((_m)->apu_mbox + 0x20)
+#define _DUMMY(_m)		((_m)->apu_mbox + 0x40)
+#define _INBOX_IRQ(_m)		((_m)->apu_mbox + 0xc0)
+#define _OUTBOX_IRQ(_m)		((_m)->apu_mbox + 0xc4)
+#define _INBOX_IRQ_MASK(_m)	((_m)->apu_mbox + 0xd0)
+#define _OUTBOX_IRQ_MASK(_m)	((_m)->apu_mbox + 0xd8)
+
+void apu_mbox_ack_outbox(struct mtk_apu *apu)
+{
+	iowrite32(ioread32(_OUTBOX_IRQ(apu)),
+		  _OUTBOX_IRQ(apu));
+}
+
+void apu_mbox_read_outbox(struct mtk_apu *apu, struct apu_mbox_hdr *hdr)
+{
+	unsigned int i, val;
+
+	for (i = 0; i < APU_MBOX_HDR_SLOTS; i++) {
+		val = ioread32(_OUTBOX(apu) + i * APU_MBOX_SLOT_SIZE);
+		((unsigned int *)hdr)[i] = val;
+	}
+}
+
+int apu_mbox_wait_inbox(struct mtk_apu *apu)
+{
+	unsigned long timeout;
+	unsigned char irq, mask;
+
+	timeout = jiffies + msecs_to_jiffies(1000);
+	do {
+		if (time_after(jiffies, timeout)) {
+			dev_info(apu->dev, "timeout.\n");
+			return -ETIMEDOUT;
+		}
+
+		irq = ioread32(_INBOX_IRQ(apu));
+		mask = ioread32(_INBOX_IRQ_MASK(apu));
+
+	} while (irq & ~mask);
+
+	return 0;
+}
+
+void apu_mbox_write_inbox(struct mtk_apu *apu, struct apu_mbox_hdr *hdr)
+{
+	unsigned int i, val;
+
+	for (i = 0; i < APU_MBOX_HDR_SLOTS; i++) {
+		val = ((unsigned int *)hdr)[i];
+		iowrite32(val, _INBOX(apu) +  i * APU_MBOX_SLOT_SIZE);
+	}
+}
+
+void apu_mbox_inbox_init(struct mtk_apu *apu)
+{
+	iowrite32(~(1 << (APU_MBOX_HDR_SLOTS - 1)),
+		  _INBOX_IRQ_MASK(apu));
+}
+
+void apu_mbox_hw_init(struct mtk_apu *apu)
+{
+	apu_mbox_inbox_init(apu);
+
+	/* clear outbox IRQ */
+	apu_mbox_ack_outbox(apu);
+}
+
+void apu_mbox_hw_exit(struct mtk_apu *apu)
+{
+	/* mask inbox IRQ */
+	iowrite32(0xff, _INBOX_IRQ_MASK(apu));
+}
diff --git a/drivers/soc/mediatek/apusys/apu-mbox.h b/drivers/soc/mediatek/apusys/apu-mbox.h
new file mode 100644
index 000000000000..47c48d2a1c25
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-mbox.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef APU_MBOX_H
+#define APU_MBOX_H
+
+struct apu_mbox_hdr {
+	unsigned int id;
+	unsigned int len;
+	unsigned int serial_no;
+	unsigned int csum;
+};
+
+#define APU_MBOX_SLOT_SIZE	(4)
+#define APU_MBOX_HDR_SLOTS \
+		(sizeof(struct apu_mbox_hdr) / APU_MBOX_SLOT_SIZE)
+
+void apu_mbox_ack_outbox(struct mtk_apu *apu);
+void apu_mbox_read_outbox(struct mtk_apu *apu, struct apu_mbox_hdr *hdr);
+int apu_mbox_wait_inbox(struct mtk_apu *apu);
+void apu_mbox_write_inbox(struct mtk_apu *apu, struct apu_mbox_hdr *hdr);
+void apu_mbox_inbox_init(struct mtk_apu *apu);
+void apu_mbox_hw_init(struct mtk_apu *apu);
+void apu_mbox_hw_exit(struct mtk_apu *apu);
+#endif /* APU_MBOX_H */
diff --git a/drivers/soc/mediatek/apusys/apu-rproc.c b/drivers/soc/mediatek/apusys/apu-rproc.c
new file mode 100644
index 000000000000..e2fe63dd6cc1
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-rproc.c
@@ -0,0 +1,806 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+#include <linux/time64.h>
+#include <linux/of_platform.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/sched/clock.h>
+#include <linux/time64.h>
+#include <linux/workqueue.h>
+
+#include "apu.h"
+#include "apu-config.h"
+#include "apu-core.h"
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
+static struct dentry *dbg_root;
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
+		 ioread32(apu->apu_mbox + MBOX0_SPARE0),
+		 ioread32(apu->apu_mbox + MBOX0_SPARE1),
+		 ioread32(apu->apu_mbox + MBOX0_SPARE2),
+		 ioread32(apu->apu_mbox + MBOX0_SPARE3));
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
+	ret = sw_logger_config_init(apu);
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
+	sw_logger_config_remove(apu);
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
+	switch (event) {
+	case GENPD_NOTIFY_OFF:
+		pr_info("%s: apu top off\n", __func__);
+		queue_work(apu_pwr_wq, apu_pwr_work);
+		break;
+	case GENPD_NOTIFY_ON:
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
+	struct device_link *link;
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
+	    !hw_ops->power_init ||
+	    !hw_ops->power_on || !hw_ops->power_off ||
+	    !apu->platdata->ipi_attrs) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	if (data->flags & F_AUTO_BOOT) {
+		ret = hw_ops->power_init(apu);
+		if (ret)
+			goto out_free_rproc;
+
+		link = device_link_add(dev, apu->power_dev, DL_FLAG_PM_RUNTIME);
+		if (!link)
+			dev_err(dev, "unable to link\n");
+	}
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
+	apu->dbg_root = dbg_root;
+	ret = apu_sw_logger_init(apu);
+	if (ret)
+		goto remove_apu_sw_logger;
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
+remove_apu_sw_logger:
+	apu_sw_logger_remove(apu);
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
+	apu_sw_logger_remove(apu);
+	hw_ops->apu_memmap_remove(apu);
+	pm_runtime_disable(dev);
+	rproc_free(apu->rproc);
+
+	return 0;
+}
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
+int apu_rproc_init(struct apusys_core_info *info)
+{
+	dbg_root = info->dbg_root;
+	return platform_driver_register(&apu_driver);
+}
+
+void apu_rproc_exit(void)
+{
+	platform_driver_unregister(&apu_driver);
+}
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek APU control driver");
diff --git a/drivers/soc/mediatek/apusys/apu-sw-logger.c b/drivers/soc/mediatek/apusys/apu-sw-logger.c
new file mode 100644
index 000000000000..818b11cbaa29
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-sw-logger.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/sched/signal.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+
+#include "apu.h"
+#include "apu-core.h"
+
+#define SW_LOGGER_DEV_NAME "apu_sw_logger"
+#define APUSYS_LOGGER_DIR "logger"
+
+#define LOG_LINE_MAX_LENS 128
+#define APU_LOG_SIZE (1024 * 1024)
+#define APU_LOG_BUF_SIZE (1024 * 1024)
+
+static struct dentry *log_root;
+static struct dentry *log_seqlog;
+static struct dentry *log_seqlogl;
+
+static void sw_logger_buf_invalidate(struct mtk_apu *apu)
+{
+	dma_sync_single_for_cpu(apu->dev, apu->handle, APU_LOG_SIZE,
+				DMA_FROM_DEVICE);
+}
+
+static int sw_logger_buf_alloc(struct device *dev)
+{
+	struct mtk_apu *apu = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	apu->sw_log_buf = kzalloc(APU_LOG_SIZE, GFP_KERNEL);
+	if (!apu->sw_log_buf)
+		return -ENOMEM;
+
+	apu->handle = dma_map_single(dev, apu->sw_log_buf, APU_LOG_SIZE,
+				     DMA_FROM_DEVICE);
+	if (dma_mapping_error(dev, apu->handle) != 0) {
+		kfree(apu->sw_log_buf);
+		apu->sw_log_buf = NULL;
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+int sw_logger_config_init(struct mtk_apu *apu)
+{
+	int ret;
+	unsigned long flags;
+	struct logger_init_info *st_logger_init_info;
+
+	if (!apu || !apu->conf_buf)
+		return -EINVAL;
+
+	if (!apu->sw_log_buf) {
+		ret = sw_logger_buf_alloc(apu->dev);
+		if (ret) {
+			dev_err(apu->dev, "%s: sw_logger_buf_alloc fail\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	spin_lock_irqsave(&apu->sw_logger_spinlock, flags);
+	iowrite32(0, apu->apu_mbox + LOG_W_PTR);
+	iowrite32(0, apu->apu_mbox + LOG_R_PTR);
+	iowrite32(0, apu->apu_mbox + LOG_OV_FLG);
+	spin_unlock_irqrestore(&apu->sw_logger_spinlock, flags);
+
+	st_logger_init_info = (struct logger_init_info *)
+		get_apu_config_user_ptr(apu->conf_buf, LOGGER_INIT_INFO);
+
+	st_logger_init_info->iova = apu->handle;
+
+	return 0;
+}
+
+void sw_logger_config_remove(struct mtk_apu *apu)
+{
+	if (apu->handle)
+		dma_unmap_single(apu->dev, apu->handle,
+				 APU_LOG_SIZE, DMA_FROM_DEVICE);
+	kfree(apu->sw_log_buf);
+}
+
+/*
+ * seq_start() takes a position as an argument and returns an iterator which
+ * will start reading at that position.
+ * start->show->next->show...->next->show->next->stop->start->stop
+ */
+static void *seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)s->private;
+	u32 w_ptr, r_ptr, overflow_flg;
+	unsigned long flags;
+
+	if (!apu->sw_log_buf) {
+		pr_err("%s: sw_log_buf == NULL\n", __func__);
+		return NULL;
+	}
+
+	spin_lock_irqsave(&apu->sw_logger_spinlock, flags);
+	w_ptr = ioread32(apu->apu_mbox + LOG_W_PTR);
+	r_ptr = ioread32(apu->apu_mbox + LOG_R_PTR);
+	overflow_flg = ioread32(apu->apu_mbox + LOG_OV_FLG);
+	spin_unlock_irqrestore(&apu->sw_logger_spinlock, flags);
+
+	sw_logger_buf_invalidate(apu);
+
+	if (w_ptr == r_ptr && overflow_flg == 0)
+		return NULL;
+
+	if (!apu->pseqdata) {
+		apu->pseqdata = kzalloc(sizeof(*apu->pseqdata), GFP_KERNEL);
+		if (apu->pseqdata) {
+			apu->pseqdata->w_ptr = w_ptr;
+			apu->pseqdata->r_ptr = r_ptr;
+			apu->pseqdata->overflow_flg = overflow_flg;
+			if (overflow_flg == 0)
+				apu->pseqdata->i = r_ptr;
+			else
+				apu->pseqdata->i = w_ptr;
+
+			apu->pseqdata->is_finished = 0;
+		}
+	}
+
+	return apu->pseqdata;
+}
+
+/*
+ * seq_start() takes a position as an argument and returns an iterator which
+ * will start reading at that position.
+ */
+static void *seq_startl(struct seq_file *s, loff_t *pos)
+{
+	struct mtk_apu *apu = s->private;
+	u32 w_ptr, r_ptr, overflow_flg;
+	struct sw_logger_seq_data *pseqdata_lock = &apu->pseqdata_lock;
+	unsigned long flags;
+
+	if (!apu->sw_log_buf)
+		return NULL;
+
+	spin_lock_irqsave(&apu->sw_logger_spinlock, flags);
+	w_ptr = ioread32(apu->apu_mbox + LOG_W_PTR);
+	r_ptr = ioread32(apu->apu_mbox + LOG_R_PTR);
+	overflow_flg = ioread32(apu->apu_mbox + LOG_OV_FLG);
+	spin_unlock_irqrestore(&apu->sw_logger_spinlock, flags);
+
+	sw_logger_buf_invalidate(apu);
+
+	/* for ctrl-c to force exit the loop */
+	while (!signal_pending(current) && w_ptr == r_ptr) {
+		usleep_range(10000, 12000);
+
+		spin_lock_irqsave(&apu->sw_logger_spinlock, flags);
+		w_ptr = ioread32(apu->apu_mbox + LOG_W_PTR);
+		r_ptr = ioread32(apu->apu_mbox + LOG_R_PTR);
+		overflow_flg = ioread32(apu->apu_mbox + LOG_OV_FLG);
+		spin_unlock_irqrestore(&apu->sw_logger_spinlock, flags);
+
+		sw_logger_buf_invalidate(apu);
+
+		pseqdata_lock->w_ptr = w_ptr;
+		pseqdata_lock->r_ptr = r_ptr;
+		pseqdata_lock->overflow_flg = overflow_flg;
+		pseqdata_lock->i = r_ptr;
+	}
+
+	if (pseqdata_lock->startl_first ||
+	    pseqdata_lock->i == pseqdata_lock->w_ptr) {
+		pseqdata_lock->startl_first = false;
+		pseqdata_lock->w_ptr = w_ptr;
+		pseqdata_lock->r_ptr = r_ptr;
+		pseqdata_lock->overflow_flg = overflow_flg;
+		pseqdata_lock->i = r_ptr;
+	}
+
+	if (signal_pending(current))
+		pseqdata_lock->startl_first = true;
+
+	return pseqdata_lock;
+}
+
+/*
+ * move the iterator forward to the next position in the sequence
+ */
+static void *seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct sw_logger_seq_data *psdata = v;
+
+	if (!psdata) {
+		pr_err("%s: psdata == NULL\n", __func__);
+		return NULL;
+	}
+
+	psdata->i = (psdata->i + LOG_LINE_MAX_LENS) % APU_LOG_SIZE;
+
+	/* prevent kernel warning */
+	*pos = psdata->i;
+
+	if (psdata->i != psdata->w_ptr)
+		return v;
+
+	psdata->is_finished = 1;
+	return NULL;
+}
+
+/*
+ * move the iterator forward to the next position in the sequence
+ */
+static void *seq_next_lock(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct mtk_apu *apu = s->private;
+	struct sw_logger_seq_data *psdata = v;
+
+	if (!psdata) {
+		pr_err("%s: psdata == NULL\n", __func__);
+		return NULL;
+	}
+
+	psdata->i = (psdata->i + LOG_LINE_MAX_LENS) % APU_LOG_SIZE;
+
+	/* prevent kernel warning */
+	*pos = psdata->i;
+
+	if (psdata->i != psdata->w_ptr)
+		return v;
+
+	iowrite32(psdata->i, apu->apu_mbox + LOG_R_PTR);
+	return NULL;
+}
+
+/*
+ * stop() is called when iteration is complete (clean up)
+ */
+static void seq_stop(struct seq_file *s, void *v)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)s->private;
+	unsigned long flags;
+
+	if (apu->pseqdata) {
+		if (apu->pseqdata->is_finished == 1) {
+			spin_lock_irqsave(&apu->sw_logger_spinlock, flags);
+			iowrite32(apu->pseqdata->i, apu->apu_mbox + LOG_R_PTR);
+			/* fixme: assume next overflow won't happen
+			 * until next seq_start
+			 */
+			iowrite32(0, apu->apu_mbox + LOG_OV_FLG);
+			spin_unlock_irqrestore(&apu->sw_logger_spinlock, flags);
+			kfree(apu->pseqdata);
+			apu->pseqdata = NULL;
+		}
+	}
+}
+
+/*
+ * stop() is called when iteration is complete (clean up)
+ */
+static void seq_stopl(struct seq_file *s, void *v)
+{
+}
+
+/*
+ * success return 0, otherwise return error code
+ */
+static int seq_show(struct seq_file *s, void *v)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)s->private;
+	struct sw_logger_seq_data *psdata = v;
+
+	seq_printf(s, "%s", apu->sw_log_buf + psdata->i);
+
+	return 0;
+}
+
+static int seq_showl(struct seq_file *s, void *v)
+{
+	struct mtk_apu *apu = (struct mtk_apu *)s->private;
+	struct sw_logger_seq_data *psdata = v;
+
+	if (psdata->i != psdata->w_ptr)
+		seq_printf(s, "%s", apu->sw_log_buf + psdata->i);
+
+	return 0;
+}
+
+static const struct seq_operations seq_ops = {
+	.start = seq_start,
+	.next  = seq_next,
+	.stop  = seq_stop,
+	.show  = seq_show
+};
+
+static const struct seq_operations seq_ops_lock = {
+	.start = seq_startl,
+	.next  = seq_next_lock,
+	.stop  = seq_stopl,
+	.show  = seq_showl
+};
+
+static int debug_sqopen_lock(struct inode *inode, struct file *file)
+{
+	struct mtk_apu *apu = inode->i_private;
+	int ret;
+
+	ret = seq_open(file, &seq_ops_lock);
+	if (ret)
+		return ret;
+
+	((struct seq_file *)file->private_data)->private = apu;
+
+	return 0;
+}
+
+static int debug_sqopen(struct inode *inode, struct file *file)
+{
+	struct mtk_apu *apu = inode->i_private;
+	int ret;
+
+	ret = seq_open(file, &seq_ops);
+	if (ret)
+		return ret;
+
+	((struct seq_file *)file->private_data)->private = apu;
+
+	return 0;
+}
+
+static const struct file_operations seqlog_ops = {
+	.owner   = THIS_MODULE,
+	.open    = debug_sqopen,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = seq_release,
+};
+
+static const struct file_operations seqlogl_ops = {
+	.owner   = THIS_MODULE,
+	.open    = debug_sqopen_lock,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = seq_release,
+};
+
+static int sw_logger_create_debugfs(struct device *dev)
+{
+	struct mtk_apu *apu = dev_get_drvdata(dev);
+	int ret = 0;
+
+	log_root = debugfs_create_dir(APUSYS_LOGGER_DIR, apu->dbg_root);
+	ret = IS_ERR_OR_NULL(log_root);
+	if (ret) {
+		dev_err(dev, "(%d)failed to create apusys_logger dir\n", ret);
+		goto out;
+	}
+
+	log_seqlog = debugfs_create_file("seq_log", 0444,
+					 log_root, apu, &seqlog_ops);
+	ret = IS_ERR_OR_NULL(log_seqlog);
+	if (ret) {
+		dev_err(dev, "(%d)failed to create apusys_logger node(seqlog)\n",
+			ret);
+		goto out;
+	}
+
+	log_seqlogl = debugfs_create_file("seq_logl", 0444,
+					  log_root, apu, &seqlogl_ops);
+	ret = IS_ERR_OR_NULL(log_seqlogl);
+	if (ret) {
+		dev_err(dev, "(%d)failed to create apusys_logger node(seqlogL)\n",
+			ret);
+		goto out;
+	}
+
+	return 0;
+
+out:
+	debugfs_remove_recursive(log_root);
+	return ret;
+}
+
+static void sw_logger_remove_debugfs(struct device *dev)
+{
+	debugfs_remove_recursive(log_root);
+}
+
+int apu_sw_logger_init(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	int ret = 0;
+
+	spin_lock_init(&apu->sw_logger_spinlock);
+	ret = sw_logger_create_debugfs(dev);
+	if (ret) {
+		dev_err(dev, "%s fail\n", __func__);
+		goto remove_debugfs;
+	}
+
+	return 0;
+
+remove_debugfs:
+	sw_logger_remove_debugfs(dev);
+	dev_err(dev, "%s error!!\n", __func__);
+
+	return ret;
+}
+
+void apu_sw_logger_remove(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+
+	sw_logger_remove_debugfs(dev);
+}
diff --git a/drivers/soc/mediatek/apusys/apu.h b/drivers/soc/mediatek/apusys/apu.h
new file mode 100644
index 000000000000..5bbc46416a19
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu.h
@@ -0,0 +1,256 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef APU_H
+#define APU_H
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/rpmsg/mtk_rpmsg.h>
+
+#include "apu-config.h"
+
+/* setup the SMC command ops */
+#define MTK_SIP_APU_START_MCU	0x00
+#define MTK_SIP_APU_STOP_MCU	0x01
+
+/* md32_sysctrl register definition */
+#define MD32_SYS_CTRL	0x0
+#define MD32_MON_PC		0x838
+#define MD32_MON_LR		0x83c
+#define MD32_MON_SP		0x840
+#define MD32_STATUS		0x844
+
+/*wdt register */
+#define WDT_INT		0x0
+#define WDT_CTRL0	0x4
+#define WDT_EN		BIT(31)
+
+/* apu_mbox spare regiter */
+#define MBOX0_SPARE0 0x40
+#define MBOX0_SPARE1 0x44
+#define MBOX0_SPARE2 0x48
+#define MBOX0_SPARE3 0x4C
+#define MBOX6_SPARE0 0x640
+#define MBOX6_SPARE1 0x644
+#define MBOX6_SPARE2 0x648
+#define MBOX6_SPARE3 0x64C
+
+#define HOST_CONFIG_ADDR MBOX0_SPARE2
+
+#define LOG_W_PTR (MBOX0_SPARE0)
+#define LOG_R_PTR (MBOX0_SPARE1)
+#define LOG_OV_FLG (MBOX0_SPARE3)
+
+/* rv setup  */
+#define F_PRELOAD_FIRMWARE	BIT(0)
+#define F_AUTO_BOOT		BIT(1)
+
+#define TCM_SIZE (128UL * 1024UL)
+#define CODE_BUF_SIZE (1024UL * 1024UL)
+#define DRAM_DUMP_SIZE (CODE_BUF_SIZE - TCM_SIZE)
+#define REG_SIZE (4UL * 151UL)
+#define TBUF_SIZE (4UL * 32UL)
+#define CACHE_DUMP_SIZE (37UL * 1024UL)
+#define DRAM_OFFSET (0x00000UL)
+#define DRAM_DUMP_OFFSET (TCM_SIZE)
+#define TCM_OFFSET (0x1d700000UL)
+#define CODE_BUF_DA (DRAM_OFFSET)
+
+/* ipi */
+#define APU_FW_VER_LEN	       32
+#define APU_SHARE_BUFFER_SIZE  256
+
+#define IPI_LOCKED			1
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
+	struct mutex lock; /*ipi hanlder mutex */
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
+struct sw_logger_seq_data {
+	u32 w_ptr;
+	u32 r_ptr;
+	u32 overflow_flg;
+	int i;
+	int is_finished;
+	char *data;
+	bool startl_first;
+};
+
+struct mtk_apu {
+	struct rproc *rproc;
+	struct device *dev;
+	void __iomem *apu_mbox;
+	void __iomem *md32_sysctrl;
+	void __iomem *apu_wdt;
+	int mbox0_irq_number;
+	int wdt_irq_number;
+	spinlock_t reg_lock; /* register r/w lock */
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
+	/* link power deive */
+	struct device *power_dev;
+	bool boot_done;
+	struct work_struct pwr_work;
+
+	/* logger and debug */
+	struct dentry *dbg_root;
+	dma_addr_t handle;
+	char *sw_log_buf;
+	spinlock_t sw_logger_spinlock; /* logger status update lock */
+	struct sw_logger_seq_data pseqdata_lock;
+	struct sw_logger_seq_data *pseqdata;
+};
+
+struct apu_coredump {
+	char tcmdump[TCM_SIZE];
+	char ramdump[DRAM_DUMP_SIZE];
+	char regdump[REG_SIZE];
+	char tbufdump[TBUF_SIZE];
+	u32 cachedump[CACHE_DUMP_SIZE / sizeof(u32)];
+} __packed;
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
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+int sw_logger_config_init(struct mtk_apu *apu);
+void sw_logger_config_remove(struct mtk_apu *apu);
+int apu_sw_logger_init(struct mtk_apu *apu);
+void apu_sw_logger_remove(struct mtk_apu *apu);
+#else
+static inline int sw_logger_config_init(struct mtk_apu *apu) { return 0; }
+static inline void sw_logger_config_remove(struct mtk_apu *apu) { }
+static inline int apu_sw_logger_init(struct mtk_apu *apu) { return 0; }
+static inline void apu_sw_logger_remove(struct mtk_apu *apu) { }
+#endif
+
+extern const struct mtk_apu_platdata mt8192_platdata;
+#endif /* APU_H */
diff --git a/drivers/soc/mediatek/apusys/mt81xx-plat.c b/drivers/soc/mediatek/apusys/mt81xx-plat.c
new file mode 100644
index 000000000000..54f75c8d07c3
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mt81xx-plat.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/sched/clock.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+
+#include "apu.h"
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
+	/* initialize IOMMU and ACP config (iommu_tr_en=1, acp_en=0) */
+	iowrite32(0xEA9, apu->md32_sysctrl);
+
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
+static int mt8192_rproc_start(struct mtk_apu *apu)
+{
+	apu_reset_mcu(apu);
+	apu_start_mcu(apu);
+
+	return 0;
+}
+
+static int mt8192_rproc_resume(struct mtk_apu *apu)
+{
+	apu_start_mcu(apu);
+
+	return 0;
+}
+
+static int mt8192_rproc_stop(struct mtk_apu *apu)
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
+static int mt81xx_apu_power_init(struct mtk_apu *apu)
+{
+	struct device *dev = apu->dev;
+	struct device_node *np;
+	struct platform_device *pdev;
+
+	/* power dev */
+	np = of_parse_phandle(dev->of_node, "mediatek,apusys-power", 0);
+	if (!np) {
+		dev_info(dev, "failed to parse apusys_power node\n");
+		return -EINVAL;
+	}
+
+	if (!of_device_is_available(np)) {
+		dev_info(dev, "unable to find apusys_power node\n");
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev) {
+		dev_info(dev, "apusys_power is not ready yet\n");
+		of_node_put(np);
+		return -EPROBE_DEFER;
+	}
+
+	dev_info(dev, "%s: get power_dev, name=%s\n", __func__, pdev->name);
+
+	apu->power_dev = &pdev->dev;
+	of_node_put(np);
+
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
+	ret = readl_relaxed_poll_timeout(apu->apu_mbox + MBOX6_SPARE3,
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
+		return ret;
+	}
+
+	/* polling APU TOP rpm state till suspended */
+	dev_info(apu->dev, "start polling power off\n");
+	timeout = 500;
+	while (!pm_runtime_suspended(apu->power_dev) && timeout-- > 0)
+		msleep(20);
+	if (timeout <= 0) {
+		dev_info(apu->dev, "%s: polling power off timeout!!\n",
+			 __func__);
+		apu_ipi_unlock(apu);
+		WARN_ON(0);
+		ret = -ETIMEDOUT;
+		goto error_get_power_dev;
+	}
+
+	dev_info(apu->dev, "polling power done\n");
+
+	return 0;
+
+error_get_power_dev:
+	pm_runtime_get_sync(apu->power_dev);
+
+	return ret;
+}
+
+static int mt8192_apu_memmap_init(struct mtk_apu *apu)
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
+static void mt8192_apu_memmap_remove(struct mtk_apu *apu)
+{
+	iounmap(apu->apu_wdt);
+	iounmap(apu->md32_sysctrl);
+	iounmap(apu->apu_mbox);
+}
+
+const struct mtk_apu_platdata mt8192_platdata = {
+	.flags		= F_AUTO_BOOT,
+	.ipi_attrs = mt81xx_ipi_attrs,
+	.ops		= {
+		.init	= NULL,
+		.exit	= NULL,
+		.start	= mt8192_rproc_start,
+		.stop	= mt8192_rproc_stop,
+		.resume	= mt8192_rproc_resume,
+		.apu_memmap_init = mt8192_apu_memmap_init,
+		.apu_memmap_remove = mt8192_apu_memmap_remove,
+		.cg_gating = NULL,
+		.cg_ungating = NULL,
+		.rv_cachedump = NULL,
+		.power_init = mt81xx_apu_power_init,
+		.power_on = mt81xx_apu_power_on,
+		.power_off = mt81xx_apu_power_off,
+	},
+};
-- 
2.18.0

