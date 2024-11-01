Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017189B8FCE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 11:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25B510E99E;
	Fri,  1 Nov 2024 10:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DC110E99D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:55:52 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XfyQp2TG2zlXHX;
 Fri,  1 Nov 2024 18:53:54 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 7C1CD1800F2;
 Fri,  1 Nov 2024 18:55:49 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 1 Nov 2024 18:55:48 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V3 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
Date: Fri, 1 Nov 2024 18:50:25 +0800
Message-ID: <20241101105028.2177274-2-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20241101105028.2177274-1-shiyongbang@huawei.com>
References: <20241101105028.2177274-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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
Signed-off-by: yongbang shi <shiyongbang@huawei.com>
---
ChangeLog:
v2 -> v3:
  - put the macro definations in latter patch where they are actually used, suggested by Dmitry Baryshkov.
  - rename some macro definations to make them sensible, suggested by Dmitry Baryshkov.
  - using FIELD_PREP and FIELD_GET, suggested by Dmitry Baryshkov.
  - using DP_DPCD_REV_foo, suggested by Dmitry Baryshkov.
  - fix build errors reported by kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
v1 -> v2:
  - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
  - using drm dp header files' dp macros instead, suggested by Andy Yan.
  v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 162 ++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h   |  23 +++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  58 +++++++
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  27 +++
 6 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
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
index 000000000000..49ecda672109
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
@@ -0,0 +1,162 @@
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
+#define DP_MIN_PULSE_NUM 0x9
+
+static void hibmc_dp_aux_reset(const struct dp_dev *dp)
+{
+	dp_reg_write_field(dp->base + DP_DPTX_RST_CTRL, DP_CFG_AUX_RST_N, 0x0);
+	usleep_range(10, 15);
+	dp_reg_write_field(dp->base + DP_DPTX_RST_CTRL, DP_CFG_AUX_RST_N, 0x1);
+}
+
+static void hibmc_dp_aux_read_data(struct dp_dev *dp, u8 *buf, u8 size)
+{
+	u32 reg_num;
+	u32 value;
+	u32 num;
+	u8 i, j;
+
+	reg_num = DIV_ROUND_UP(size, BYTES_IN_U32);
+	for (i = 0; i < reg_num; i++) {
+		/* number of bytes read from a single register */
+		num = min(size - i * BYTES_IN_U32, BYTES_IN_U32);
+		value = readl(dp->base + DP_AUX_RD_DATA0 + i * BYTES_IN_U32);
+		/* convert the 32-bit value of the register to the buffer. */
+		for (j = 0; j < num; j++)
+			buf[i * BYTES_IN_U32 + j] = value >> (j * BITS_IN_U8);
+	}
+}
+
+static void hibmc_dp_aux_write_data(struct dp_dev *dp, u8 *buf, u8 size)
+{
+	u32 reg_num;
+	u32 value;
+	u8 i, j;
+	u32 num;
+
+	reg_num = DIV_ROUND_UP(size, BYTES_IN_U32);
+	for (i = 0; i < reg_num; i++) {
+		/* number of bytes written to a single register */
+		num = min_t(u8, size - i * BYTES_IN_U32, BYTES_IN_U32);
+		value = 0;
+		/* obtain the 32-bit value written to a single register. */
+		for (j = 0; j < num; j++)
+			value |= buf[i * BYTES_IN_U32 + j] << (j * BITS_IN_U8);
+		/* writing data to a single register */
+		writel(value, dp->base + DP_AUX_WR_DATA0 + i * BYTES_IN_U32);
+	}
+}
+
+static u32 hibmc_dp_aux_build_cmd(const struct drm_dp_aux_msg *msg)
+{
+	u32 aux_cmd = msg->request;
+
+	if (msg->size)
+		aux_cmd |= FIELD_PREP(AUX_CMD_REQ_LEN, (msg->size - 1));
+	else
+		aux_cmd |= FIELD_PREP(AUX_CMD_I2C_ADDR_ONLY, 1);
+
+	aux_cmd |= FIELD_PREP(AUX_CMD_ADDR, msg->address);
+
+	return aux_cmd;
+}
+
+/* ret >= 0 ,ret is size; ret < 0, ret is err code */
+static int hibmc_dp_aux_parse_xfer(struct dp_dev *dp, struct drm_dp_aux_msg *msg)
+{
+	u32 buf_data_cnt;
+	u32 aux_status;
+	int ret = 0;
+
+	aux_status = readl(dp->base + DP_AUX_STATUS);
+	msg->reply = FIELD_GET(DP_CFG_AUX_STATUS, aux_status);
+
+	if (aux_status & DP_CFG_AUX_TIMEOUT)
+		return -ETIMEDOUT;
+
+	/* only address */
+	if (!msg->size)
+		return 0;
+
+	if (msg->reply != DP_AUX_NATIVE_REPLY_ACK)
+		return 0;
+
+	buf_data_cnt = FIELD_GET(DP_CFG_AUX_READY_DATA_BYTE, aux_status);
+
+	switch (msg->request) {
+	case DP_AUX_NATIVE_WRITE:
+		ret = msg->size;
+		break;
+	case DP_AUX_I2C_WRITE | DP_AUX_I2C_MOT:
+		if (buf_data_cnt == AUX_I2C_WRITE_SUCCESS)
+			ret = msg->size;
+		else if (buf_data_cnt == AUX_I2C_WRITE_PARTIAL_SUCCESS)
+			ret = FIELD_GET(DP_CFG_AUX, aux_status);
+		break;
+	case DP_AUX_NATIVE_READ:
+	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
+		buf_data_cnt--;
+		/* only the successful part of data is read */
+		if (buf_data_cnt != msg->size) {
+			ret = -EBUSY;
+		} else { /* all data is successfully read */
+			hibmc_dp_aux_read_data(dp, msg->buffer, msg->size);
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
+static ssize_t hibmc_dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
+{
+	struct dp_dev *dp = container_of(aux, struct dp_dev, aux);
+	u32 aux_cmd;
+	int ret;
+	u32 val; /* val will be assigned at the beginning of readl_poll_timeout function */
+
+	writel(0, dp->base + DP_AUX_WR_DATA0);
+	writel(0, dp->base + DP_AUX_WR_DATA1);
+	writel(0, dp->base + DP_AUX_WR_DATA2);
+	writel(0, dp->base + DP_AUX_WR_DATA3);
+
+	hibmc_dp_aux_write_data(dp, msg->buffer, msg->size);
+
+	aux_cmd = hibmc_dp_aux_build_cmd(msg);
+	writel(aux_cmd, dp->base + DP_AUX_CMD_ADDR);
+
+	/* enable aux transfer */
+	dp_reg_write_field(dp->base + DP_AUX_REQ, DP_CFG_AUX_REQ, 0x1);
+	ret = readl_poll_timeout(dp->base + DP_AUX_REQ, val, !(val & DP_CFG_AUX_REQ), 50, 5000);
+	if (ret) {
+		hibmc_dp_aux_reset(dp);
+		return ret;
+	}
+
+	return hibmc_dp_aux_parse_xfer(dp, msg);
+}
+
+void hibmc_dp_aux_init(struct dp_dev *dp)
+{
+	dp_reg_write_field(dp->base + DP_AUX_REQ, DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
+	dp_reg_write_field(dp->base + DP_AUX_REQ, DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
+	dp_reg_write_field(dp->base + DP_AUX_REQ, DP_CFG_AUX_MIN_PULSE_NUM, DP_MIN_PULSE_NUM);
+
+	dp->aux.transfer = hibmc_dp_aux_xfer;
+	dp->aux.is_remote = 0;
+	drm_dp_aux_init(&dp->aux);
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
new file mode 100644
index 000000000000..794bb0482ea7
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_AUX_H
+#define DP_AUX_H
+
+#include <linux/bitops.h>
+#include "dp_comm.h"
+
+#define AUX_I2C_WRITE_SUCCESS		0x1
+#define AUX_I2C_WRITE_PARTIAL_SUCCESS	0x2
+#define EQ_MAX_RETRY			5
+#define BYTES_IN_U32			4
+#define BITS_IN_U8			8
+
+/* aux_cmd_addr register shift */
+#define AUX_CMD_REQ_LEN			GENMASK(7, 4)
+#define AUX_CMD_ADDR			GENMASK(27, 8)
+#define AUX_CMD_I2C_ADDR_ONLY		BIT(28)
+
+void hibmc_dp_aux_init(struct dp_dev *dp);
+
+#endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
new file mode 100644
index 000000000000..61a59fd59962
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -0,0 +1,58 @@
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
+#include <linux/bitfield.h>
+#include <linux/io.h>
+
+#include <drm/display/drm_dp_helper.h>
+
+#define dp_reg_read_field(addr, mask)				\
+		FIELD_GET(mask, readl(addr))
+
+#define dp_field_modify(reg_value, mask, value) ({		\
+		(reg_value) &= ~(mask);				\
+		(reg_value) |= FIELD_PREP(mask, value); })
+
+#define dp_reg_write_field(addr, mask, val) ({			\
+		typeof(addr) _addr = (addr);			\
+		u32 _value = readl(_addr);			\
+		dp_field_modify(_value, mask, val);		\
+		writel(_value, _addr); })
+
+struct link_status {
+	bool clock_recovered;
+	bool channel_equalized;
+	u8 cr_done_lanes;
+};
+
+struct link_cap {
+	int rx_dpcd_revision;
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
+struct dp_dev {
+	struct hibmc_dp_link link;
+	struct drm_dp_aux aux;
+	struct drm_device *dev;
+	void __iomem *base;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+};
+
+#endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
new file mode 100644
index 000000000000..0b965e6ba7b3
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_CONFIG_H
+#define DP_CONFIG_H
+
+#define DP_BPP			24
+#define DP_SYMBOL_PER_FCLK	4
+#define DP_MSA1			0x20
+#define DP_MSA2			0x845c00
+#define DP_OFFSET		0x1e0000
+#define DP_HDCP			0x2
+#define DP_INT_RST		0xffff
+#define DP_DPTX_RST		0x3ff
+#define DP_CLK_EN		0x7
+#define DP_SYNC_EN_MASK		0x3
+#define DP_LINK_RATE_CAL	27
+
+#endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
new file mode 100644
index 000000000000..83cf0cc06ae2
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -0,0 +1,27 @@
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
+#define DP_DPTX_RST_CTRL		0x700
+
+#define DP_CFG_AUX_SYNC_LEN_SEL			BIT(1)
+#define DP_CFG_AUX_TIMER_TIMEOUT		BIT(2)
+#define DP_CFG_AUX_MIN_PULSE_NUM		GENMASK(13, 9)
+#define DP_CFG_AUX_REQ				BIT(0)
+#define DP_CFG_AUX_RST_N			BIT(4)
+#define DP_CFG_AUX_TIMEOUT			BIT(0)
+#define DP_CFG_AUX_READY_DATA_BYTE		GENMASK(16, 12)
+#define DP_CFG_AUX				GENMASK(24, 17)
+#define DP_CFG_AUX_STATUS			GENMASK(11, 4)
+
+#endif
-- 
2.33.0

