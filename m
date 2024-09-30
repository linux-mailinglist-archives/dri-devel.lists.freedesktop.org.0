Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB598B57A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCA410E5EF;
	Tue,  1 Oct 2024 07:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6910E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 10:30:59 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XHH0P3llNz2QTys;
 Mon, 30 Sep 2024 18:11:17 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 0FDE91A016C;
 Mon, 30 Sep 2024 18:12:11 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 30 Sep 2024 18:12:09 +0800
From: shiyongbang <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc drivers
Date: Mon, 30 Sep 2024 18:06:07 +0800
Message-ID: <20240930100610.782363-2-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240930100610.782363-1-shiyongbang@huawei.com>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500013.china.huawei.com (7.221.188.12)
X-Mailman-Approved-At: Tue, 01 Oct 2024 07:26:13 +0000
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

From: baihan li <libaihan@huawei.com>

Add dp aux read/write functions. They are basic functions
 and will be used later.

Signed-off-by: baihan li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile     |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 227 +++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h  |  80 +++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  88 +++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |  76 +++++++
 5 files changed, 473 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index d25c75e60d3d..8770ec6dfffd 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o
+hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
+	       dp/dp_aux.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
new file mode 100644
index 000000000000..e85ac22c18a9
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2024 Hisilicon Limited.
+
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/minmax.h>
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include "dp_comm.h"
+#include "dp_reg.h"
+#include "dp_aux.h"
+
+static void dp_aux_reset(const struct hibmc_dp_aux *aux)
+{
+	dp_write_bits(aux->addr + DP_DPTX_RST_CTRL, DP_CFG_AUX_RST_N, 0x0);
+	usleep_range(10, 15);
+	dp_write_bits(aux->addr + DP_DPTX_RST_CTRL, DP_CFG_AUX_RST_N, 0x1);
+}
+
+static void dp_aux_read_data(struct hibmc_dp_aux *aux, u8 *buf, u8 size)
+{
+	u32 reg_num;
+	u32 value;
+	u32 num;
+	u8 i, j;
+
+	reg_num = round_up(size, AUX_4_BYTE) / AUX_4_BYTE;
+	for (i = 0; i < reg_num; i++) {
+		/* number of bytes read from a single register */
+		num = min(size - i * AUX_4_BYTE, AUX_4_BYTE);
+		value = readl(aux->addr + DP_AUX_RD_DATA0 + i * AUX_4_BYTE);
+		/* convert the 32-bit value of the register to the buffer. */
+		for (j = 0; j < num; j++)
+			buf[i * AUX_4_BYTE + j] = value >> (j * AUX_8_BIT);
+	}
+}
+
+static void dp_aux_write_data(struct hibmc_dp_aux *aux, u8 *buf, u8 size)
+{
+	u32 reg_num;
+	u32 value;
+	u8 i, j;
+	u32 num;
+
+	reg_num = round_up(size, AUX_4_BYTE) / AUX_4_BYTE;
+	for (i = 0; i < reg_num; i++) {
+		/* number of bytes written to a single register */
+		num = min_t(u8, size - i * AUX_4_BYTE, AUX_4_BYTE);
+		value = 0;
+		/* obtain the 32-bit value written to a single register. */
+		for (j = 0; j < num; j++)
+			value |= buf[i * AUX_4_BYTE + j] << (j * AUX_8_BIT);
+		/* writing data to a single register */
+		writel(value, aux->addr + DP_AUX_WR_DATA0 + i * AUX_4_BYTE);
+	}
+}
+
+static u32 dp_aux_build_cmd(const struct hibmc_dp_aux_msg *msg)
+{
+	u32 aux_cmd = msg->request << AUX_CMD_REQ_TYPE_S;
+
+	if (msg->size)
+		aux_cmd |= (msg->size - 1) << AUX_CMD_REQ_LEN_S;
+	else
+		aux_cmd |= 1 << AUX_CMD_I2C_ADDR_ONLY_S;
+
+	aux_cmd |= msg->address << AUX_CMD_ADDR_S;
+
+	return aux_cmd;
+}
+
+/* ret >= 0 ,ret is size; ret < 0, ret is err code */
+static int dp_aux_parse_xfer(struct hibmc_dp_aux *aux, struct hibmc_dp_aux_msg *msg)
+{
+	u32 buf_data_cnt;
+	u32 aux_status;
+	int ret = 0;
+
+	aux_status = readl(aux->addr + DP_AUX_STATUS);
+	msg->reply = (aux_status & DP_CFG_AUX_STATUS) >> DP_CFG_AUX_STATUS_S;
+
+	if (aux_status & DP_CFG_AUX_TIMEOUT)
+		return -ETIMEDOUT;
+
+	/* only address */
+	if (!msg->size)
+		return 0;
+
+	if (msg->reply != DP_AUX_ACK)
+		return 0;
+
+	buf_data_cnt = (aux_status & DP_CFG_AUX_READY_DATA_BYTE) >> AUX_READY_DATA_BYTE_S;
+
+	switch (msg->request) {
+	case DP_NATIVE_W:
+		ret = msg->size;
+		break;
+	case DP_I2C_MOT_W:
+		if (buf_data_cnt == AUX_I2C_WRITE_SUCCESS)
+			ret = msg->size;
+		else if (buf_data_cnt == AUX_I2C_WRITE_PARTIAL_SUCCESS)
+			ret = (aux_status & DP_CFG_AUX) >> DP_CFG_AUX_S;
+		break;
+	case DP_NATIVE_R:
+	case DP_I2C_MOT_R:
+		buf_data_cnt--;
+		/* only the successful part of data is read */
+		if (buf_data_cnt != msg->size) {
+			ret = -EBUSY;
+		} else { /* all data is successfully read */
+			dp_aux_read_data(aux, msg->buf, msg->size);
+			ret = msg->size;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+/* ret >= 0 ,ret is size; ret < 0, ret is err code */
+static int dp_aux_xfer(struct hibmc_dp_aux *aux, struct hibmc_dp_aux_msg *msg)
+{
+	u32 aux_cmd;
+	int ret;
+	u32 val; /* val will be assigned at the beginning of readl_poll_timeout function */
+
+	aux_cmd = dp_aux_build_cmd(msg);
+	writel(aux_cmd, aux->addr + DP_AUX_CMD_ADDR);
+
+	/* enable aux transfer */
+	dp_write_bits(aux->addr + DP_AUX_REQ, DP_CFG_AUX_REQ, 0x1);
+	ret = readl_poll_timeout(aux->addr + DP_AUX_REQ, val, !(val & DP_CFG_AUX_REQ), 50, 5000);
+	if (ret) {
+		dp_aux_reset(aux);
+		return ret;
+	}
+
+	return dp_aux_parse_xfer(aux, msg);
+}
+
+/* ret >= 0 ,ret is size; ret < 0, ret is err code */
+static int dp_aux_rw(struct hibmc_dp_aux *aux, u32 address, u8 *buffer, u8 request, u8 size)
+{
+	struct hibmc_dp_aux_msg msg;
+	u32 retry;
+	int ret;
+
+	msg.address = address;
+	msg.request = request;
+	msg.buf = buffer;
+	msg.size = size;
+
+	mutex_lock(&aux->lock);
+
+	writel(0, aux->addr + DP_AUX_WR_DATA0);
+	writel(0, aux->addr + DP_AUX_WR_DATA1);
+	writel(0, aux->addr + DP_AUX_WR_DATA2);
+	writel(0, aux->addr + DP_AUX_WR_DATA3);
+
+	dp_aux_write_data(aux, buffer, size);
+
+	for (retry = 0; retry < AUX_RW_MAX_RETRY; retry++) {
+		ret = dp_aux_xfer(aux, &msg);
+		if (ret < 0) {
+			if (ret == -EBUSY) {
+				usleep_range(450, 500);
+				continue;
+			} else if (ret == -ETIMEDOUT) {
+				continue;
+			} else {
+				goto exit;
+			}
+		}
+		switch (msg.reply & DP_AUX_NATIVE_REPLY_MASK) {
+		case DP_AUX_ACK:
+			goto exit;
+		case DP_AUX_NACK:
+		case DP_AUX_DEFER:
+			usleep_range(450, 500);
+			continue;
+		default:
+			ret = -EINVAL;
+			goto exit;
+		}
+	}
+
+exit:
+	mutex_unlock(&aux->lock);
+
+	return ret;
+}
+
+int dp_aux_write(struct hibmc_dp_dev *dp, u32 address, u8 *buffer, u8 size)
+{
+	int ret;
+
+	ret = dp_aux_rw(&dp->aux, address, buffer, DP_NATIVE_W, size);
+	if (ret != size) {
+		drm_err(dp->dev, "dp aux dpcd write failed, address:0x%x, size:%u, ret:%d!\n",
+			address, size, ret);
+		if (ret < 0)
+			return ret;
+		else
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
+int dp_aux_read(struct hibmc_dp_dev *dp, u32 address, u8 *buffer, u8 size)
+{
+	int ret;
+
+	ret = dp_aux_rw(&dp->aux, address, buffer, DP_NATIVE_R, size);
+	if (ret != size) {
+		drm_err(dp->dev, "dp aux dpcd read failed, address:0x%x, size:%u, ret:%d!\n",
+			address, size, ret);
+		if (ret < 0)
+			return ret;
+		else
+			return -EFAULT;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
new file mode 100644
index 000000000000..9b738cf2cc6a
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_AUX_H
+#define DP_AUX_H
+
+#include <linux/bitops.h>
+#include "dp_comm.h"
+
+#define DP_I2C_MOT_W			0x4
+#define DP_I2C_MOT_R			0x5
+#define DP_NATIVE_W			0x8
+#define DP_NATIVE_R			0x9
+
+#define AUX_I2C_WRITE_SUCCESS		0x1
+#define AUX_I2C_WRITE_PARTIAL_SUCCESS	0x2
+
+#define EQ_MAX_RETRY			5
+#define AUX_RW_MAX_RETRY		7
+
+#define DPCD_LINK_BW_SET		0x0100
+#define DPCD_LANE_COUNT_SET		0x0101
+#define DPCD_TRAINING_PATTERN_SET	0x0102
+#define DPCD_TRAINING_LANE0_SET		0x0103
+#define DPCD_DOWNSPREAD_CTRL		0x0107
+#define DPCD_LANE0_1_STATUS		0x0202
+#define DPCD_ADJUST_REQUEST_LANE0_1	0x0206
+
+#define DPCD_VOLTAGE_SWING_LANE_0	(BIT(0) | BIT(1))
+#define DPCD_PRE_EMPHASIS_LANE_0	(BIT(2) | BIT(3))
+#define DPCD_VOLTAGE_SWING_SET_S	0
+#define DPCD_PRE_EMPHASIS_SET_S		3
+#define DPCD_SCRAMBLING_DISABLE		BIT(5)
+#define DPCD_CR_DONE_BITS		BIT(0)
+#define DPCD_EQ_DONE_BITS		(BIT(0) | BIT(1) | BIT(2))
+#define DPCD_ENHANCED_FRAME_EN		0x80
+
+#define DPCD_TRAINING_PATTERN_DISABLE	0x0
+#define DPCD_TRAINING_PATTERN_1		0x1
+#define DPCD_TRAINING_PATTERN_2		0x2
+#define DPCD_TRAINING_PATTERN_3		0x3
+#define DPCD_TRAINING_PATTERN_4		0x7
+#define DPCD_VOLTAGE_SWING_LEVEL_0	FIELD_PREP(GENMASK(1, 0), 0)
+#define DPCD_VOLTAGE_SWING_LEVEL_1	FIELD_PREP(GENMASK(1, 0), 1)
+#define DPCD_VOLTAGE_SWING_LEVEL_2	FIELD_PREP(GENMASK(1, 0), 2)
+#define DPCD_VOLTAGE_SWING_LEVEL_3	FIELD_PREP(GENMASK(1, 0), 3)
+#define DPCD_PRE_EMPHASIS_LEVEL_0	FIELD_PREP(GENMASK(4, 3), 0)
+#define DPCD_PRE_EMPHASIS_LEVEL_1	FIELD_PREP(GENMASK(4, 3), 1)
+#define DPCD_PRE_EMPHASIS_LEVEL_2	FIELD_PREP(GENMASK(4, 3), 2)
+#define DPCD_PRE_EMPHASIS_LEVEL_3	FIELD_PREP(GENMASK(4, 3), 3)
+
+#define DP_LINK_RATE_NUM		4
+#define DP_LINK_RATE_0			0x6
+#define DP_LINK_RATE_1			0xA
+#define DP_LINK_RATE_2			0x14
+#define DP_LINK_RATE_3			0x1E
+#define DP_AUX_NATIVE_REPLY_MASK	(0x3 << 4)
+#define DP_AUX_ACK			(0 << 4)
+#define DP_AUX_NACK			(0x1 << 4)
+#define DP_AUX_DEFER			(0x2 << 4)
+#define DP_CFG_AUX_S			17
+#define DP_CFG_AUX_STATUS_S		4
+
+#define AUX_4_BYTE			4
+#define AUX_4_BIT			4
+#define AUX_8_BIT			8
+#define AUX_RESET_INTERVAL		15
+#define AUX_RETRY_INTERVAL		500
+#define AUX_READY_DATA_BYTE_S		12
+
+/* aux_cmd_addr register shift */
+#define AUX_CMD_REQ_TYPE_S		0
+#define AUX_CMD_REQ_LEN_S		4
+#define AUX_CMD_ADDR_S			8
+#define AUX_CMD_I2C_ADDR_ONLY_S		28
+
+int dp_aux_write(struct hibmc_dp_dev *dp, u32 address, u8 *buffer, u8 size);
+int dp_aux_read(struct hibmc_dp_dev *dp, u32 address, u8 *buffer, u8 size);
+
+#endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
new file mode 100644
index 000000000000..931f08a70bb4
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_COMM_H
+#define DP_COMM_H
+
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/errno.h>
+#include <linux/mutex.h>
+#include <linux/kernel.h>
+#include <linux/io.h>
+
+#define REG_LENGTH 32
+
+static inline u32 dp_read_bits(void __iomem *addr, u32 bit_mask)
+{
+	u32 reg_val;
+
+	reg_val = readl(addr);
+
+	return (reg_val & bit_mask) >> __ffs(bit_mask);
+}
+
+static inline void dp_write_bits(void __iomem *addr, u32 bit_mask, u32 val)
+{
+	u32 reg_val;
+
+	reg_val = readl(addr);
+	reg_val &= ~bit_mask;
+	reg_val |= (val << __ffs(bit_mask)) & bit_mask;
+	writel(reg_val, addr);
+}
+
+enum dpcd_revision {
+	DPCD_REVISION_10 = 0x10,
+	DPCD_REVISION_11,
+	DPCD_REVISION_12,
+	DPCD_REVISION_13,
+	DPCD_REVISION_14,
+};
+
+struct hibmc_dp_aux_msg {
+	u32 address;
+	u8 request;
+	u8 *buf;
+	u8 size;
+	u8 reply;
+};
+
+struct hibmc_dp_aux {
+	struct mutex lock; /* aux transfer lock */
+	void __iomem *addr;
+};
+
+struct link_status {
+	bool clock_recovered;
+	bool channel_equalized;
+	u8 cr_done_lanes;
+};
+
+struct link_cap {
+	enum dpcd_revision rx_dpcd_revision;
+	u8 link_rate;
+	u8 lanes;
+	bool is_tps3;
+	bool is_tps4;
+};
+
+struct hibmc_dp_link {
+	struct link_status status;
+	u8 *train_set;
+	struct link_cap cap;
+};
+
+struct hibmc_dp_dev {
+	struct hibmc_dp_link link;
+	struct hibmc_dp_aux aux;
+	struct drm_device *dev;
+	void __iomem *base;
+};
+
+static inline struct hibmc_dp_dev *to_dp_dev_s(struct hibmc_dp_aux *aux)
+{
+	return container_of(aux, struct hibmc_dp_dev, aux);
+}
+
+#endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
new file mode 100644
index 000000000000..3dcb847057a4
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_REG_H
+#define DP_REG_H
+
+#define DP_AUX_CMD_ADDR			0x50
+#define DP_AUX_WR_DATA0			0x54
+#define DP_AUX_WR_DATA1			0x58
+#define DP_AUX_WR_DATA2			0x5c
+#define DP_AUX_WR_DATA3			0x60
+#define DP_AUX_RD_DATA0			0x64
+#define DP_AUX_REQ			0x74
+#define DP_AUX_STATUS			0x78
+#define DP_PHYIF_CTRL0			0xa0
+#define DP_VIDEO_CTRL			0x100
+#define DP_VIDEO_CONFIG0		0x104
+#define DP_VIDEO_CONFIG1		0x108
+#define DP_VIDEO_CONFIG2		0x10c
+#define DP_VIDEO_CONFIG3		0x110
+#define DP_VIDEO_PACKET			0x114
+#define DP_VIDEO_MSA0			0x118
+#define DP_VIDEO_MSA1			0x11c
+#define DP_VIDEO_MSA2			0x120
+#define DP_VIDEO_HORIZONTAL_SIZE	0X124
+#define DP_TIMING_GEN_CONFIG0		0x26c
+#define DP_TIMING_GEN_CONFIG2		0x274
+#define DP_TIMING_GEN_CONFIG3		0x278
+#define DP_HDCP_CFG			0x600
+#define DP_INTR_ENABLE			0x720
+#define DP_INTR_ORIGINAL_STATUS		0x728
+#define DP_DPTX_RST_CTRL		0x700
+#define DP_DPTX_CLK_CTRL		0x704
+#define DP_DPTX_GCTL0			0x708
+#define DP_TIMING_MODEL_CTRL		0x884
+#define DP_TIMING_SYNC_CTRL		0xFF0
+
+#define DP_CFG_AUX_SYNC_LEN_SEL			BIT(1)
+#define DP_CFG_AUX_TIMER_TIMEOUT		BIT(2)
+#define DP_CFG_STREAM_FRAME_MODE		BIT(6)
+#define DP_CFG_AUX_MIN_PULSE_NUM		GENMASK(13, 9)
+#define DP_CFG_LANE_DATA_EN			GENMASK(11, 8)
+#define DP_CFG_PHY_LANE_NUM			GENMASK(2, 1)
+#define DP_CFG_AUX_REQ				BIT(0)
+#define DP_CFG_AUX_RST_N			BIT(4)
+#define DP_CFG_AUX_TIMEOUT			BIT(0)
+#define DP_CFG_AUX_READY_DATA_BYTE		GENMASK(16, 12)
+#define DP_CFG_AUX				GENMASK(24, 17)
+#define DP_CFG_AUX_STATUS			GENMASK(11, 4)
+#define DP_CFG_SCRAMBLE_EN			BIT(0)
+#define DP_CFG_PAT_SEL				GENMASK(7, 4)
+#define DP_CFG_TIMING_GEN0_HACTIVE		GENMASK(31, 16)
+#define DP_CFG_TIMING_GEN0_HBLANK		GENMASK(15, 0)
+#define DP_CFG_TIMING_GEN0_VACTIVE		GENMASK(31, 16)
+#define DP_CFG_TIMING_GEN0_VBLANK		GENMASK(15, 0)
+#define DP_CFG_TIMING_GEN0_VFRONT_PORCH		GENMASK(31, 16)
+#define DP_CFG_STREAM_HACTIVE			GENMASK(31, 16)
+#define DP_CFG_STREAM_HBLANK			GENMASK(15, 0)
+#define DP_CFG_STREAM_HSYNC_WIDTH		GENMASK(15, 0)
+#define DP_CFG_STREAM_VACTIVE			GENMASK(31, 16)
+#define DP_CFG_STREAM_VBLANK			GENMASK(15, 0)
+#define DP_CFG_STREAM_VFRONT_PORCH		GENMASK(31, 16)
+#define DP_CFG_STREAM_VSYNC_WIDTH		GENMASK(15, 0)
+#define DP_CFG_STREAM_VSTART			GENMASK(31, 16)
+#define DP_CFG_STREAM_HSTART			GENMASK(15, 0)
+#define DP_CFG_STREAM_VSYNC_POLARITY		BIT(8)
+#define DP_CFG_STREAM_HSYNC_POLARITY		BIT(7)
+#define DP_CFG_STREAM_RGB_ENABLE		BIT(1)
+#define DP_CFG_STREAM_VIDEO_MAPPING		GENMASK(5, 2)
+#define DP_CFG_PIXEL_NUM_TIMING_MODE_SEL1	GENMASK(31, 16)
+#define DP_CFG_STREAM_TU_SYMBOL_SIZE		GENMASK(5, 0)
+#define DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
+#define DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
+#define DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
+
+#endif
-- 
2.33.0

