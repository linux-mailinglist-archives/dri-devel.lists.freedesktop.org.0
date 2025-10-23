Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC99C00819
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 12:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27C210E3CC;
	Thu, 23 Oct 2025 10:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lk4UVU/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8970B10E3BD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761215565;
 bh=7tA44lKoyX/LAo5tfZ67VhI2xLJ4zakr/xlavnQru7w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lk4UVU/O47OdwvYM9QlW7XhOtISdw/BprhuYjYUNbXRMq4y63AZyM5JhyJ+D3PFf8
 pxaV8tp1tpHFR/2OKqXgqQ2LLIlQb7lxQLzGUkvNpGP30IHE+GYgnq1mjv6eU6lvhc
 R1WyGsJYPQ8oAbx/rM9oG9azkpVcH6eQfeFch7T+YJGyuErmpzXmMyAqqwbVR6xuXu
 68s0voh7kN5cs8c7582uUIUCwRqPxH8ncrqVSx927HD2BIN/0dn8V60fj1OcCzKEvb
 gnPMV/sDYSAVjHGYteM5lwgYNoyz8zEuW5ZwC2kfEd2QQvLZnhARZJ5rtSDFSN352h
 ubSmV/1tq2w4Q==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9889617E141C;
 Thu, 23 Oct 2025 12:32:44 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 23 Oct 2025 12:32:35 +0200
Subject: [PATCH v11 09/11] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf@collabora.com>
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761215558; l=69998;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=VUKrAtW78pVBpQIzpm6Z/cNcJVn9kahkQuzjG9expXI=;
 b=vaCe4oIJ6n3WY88DF2F4lhBVBc5XDCqF1PjAGFrLEZJm5nvl95P/HgC1Qv+DjGBhPhu49iIZ4
 yMfFy5URBMNBPyX64WBoCX7arMVMxmJlCMHc0IU6g6MgsX4ytsaiJXA
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
found in MediaTek's MT8195, MT8188 SoC and their variants, and
including support for display modes up to 4k60 and for HDMI
Audio, as per the HDMI 2.0 spec.

HDCP and CEC functionalities are also supported by this hardware,
but are not included in this commit and that also poses a slight
difference between the V2 and V1 controllers in how they handle
Hotplug Detection (HPD).

While the v1 controller was using the CEC controller to check
HDMI cable connection and disconnection, in this driver the v2
one does not.

This is due to the fact that on parts with v2 designs, like the
MT8195 SoC, there is one CEC controller shared between the HDMI
Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
adding support to use the CEC HW to wake up the HDMI controllers
it is necessary to have support for one TX, one RX *and* for both
at the same time.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/Kconfig            |    7 +
 drivers/gpu/drm/mediatek/Makefile           |    2 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |    4 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  395 ++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1398 +++++++++++++++++++++++++++
 7 files changed, 2078 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 994b48b82d447c47391122e6ff2d139edb223536..c89ae4ed2c96123684ecd357314fa2d2ba5a4433 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -45,3 +45,10 @@ config DRM_MEDIATEK_HDMI
 	select DRM_MEDIATEK_HDMI_COMMON
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
+
+config DRM_MEDIATEK_HDMI_V2
+	tristate "DRM HDMI v2 IP support for MediaTek SoCs"
+	depends on DRM_MEDIATEK
+	select DRM_MEDIATEK_HDMI_COMMON
+	help
+	  DRM/KMS HDMI driver for MediaTek SoCs with HDMIv2 IP
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 78cf2d4fc85ff444b936a6b705d86a3ec7ff1574..e0ac49b07d5050110f250967e65a87f21decc8cb 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -25,5 +25,7 @@ obj-$(CONFIG_DRM_MEDIATEK_HDMI_COMMON) += mtk_hdmi_common.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi_ddc.o
+obj-$(CONFIG_DRM_MEDIATEK_HDMI_V2) += mtk_hdmi_v2.o
+obj-$(CONFIG_DRM_MEDIATEK_HDMI_V2) += mtk_hdmi_ddc_v2.o
 
 obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 38986ab61795c22b5b0659ad2ca258b923034a34..9cd7add3dd949e2920c876f7bcf990350c42d215 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -290,6 +290,10 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
+	hdmi->irq = platform_get_irq(pdev, 0);
+	if (!hdmi->irq)
+		return hdmi->irq;
+
 	hdmi->regs = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index 38d1bdf4c77e4f6684473abec0e8c1e6ddc7db0f..de5e064585f85d9eb2e447f2d18432513d60d2d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -126,6 +126,12 @@ struct hdmi_audio_param {
 	struct hdmi_codec_params codec_params;
 };
 
+enum hdmi_hpd_state {
+	HDMI_PLUG_OUT = 0,
+	HDMI_PLUG_IN_AND_SINK_POWER_ON,
+	HDMI_PLUG_IN_ONLY,
+};
+
 struct mtk_hdmi_ver_conf {
 	const struct drm_bridge_funcs *bridge_funcs;
 	const struct hdmi_codec_ops *codec_ops;
@@ -139,6 +145,7 @@ struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
 	unsigned long max_mode_clock;
+	u32 reg_hdmi_tx_cfg;
 };
 
 struct mtk_hdmi {
@@ -161,6 +168,8 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
+	unsigned int irq;
+	enum hdmi_hpd_state hpd;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
 	struct mutex update_plugged_status_lock;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
new file mode 100644
index 0000000000000000000000000000000000000000..227705a6409ab40b0317df3574453252b7f63b33
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek HDMI v2 Display Data Channel Driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre, SAS
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <drm/drm_edid.h>
+
+#include "mtk_hdmi_common.h"
+#include "mtk_hdmi_regs_v2.h"
+
+#define DDC2_DLY_CNT 572 /* BIM=208M/(v*4) = 90Khz */
+#define DDC2_DLY_CNT_EDID 832 /* BIM=208M/(v*4) = 62.5Khz */
+#define SI2C_ADDR_READ 0xf4
+#define SCDC_I2C_SLAVE_ADDRESS 0x54
+
+struct mtk_hdmi_ddc {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk *clk;
+	struct i2c_adapter adap;
+};
+
+static int mtk_ddc_check_and_rise_low_bus(struct mtk_hdmi_ddc *ddc)
+{
+	u32 val;
+
+	regmap_read(ddc->regs, HDCP2X_DDCM_STATUS, &val);
+	if (val & DDC_I2C_BUS_LOW) {
+		regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
+				   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLOCK_SCL));
+		usleep_range(250, 300);
+	}
+
+	if (val & DDC_I2C_NO_ACK) {
+		u32 ddc_ctrl, hpd_ddc_ctrl, hpd_ddc_status;
+
+		regmap_read(ddc->regs, DDC_CTRL, &ddc_ctrl);
+		regmap_read(ddc->regs, HPD_DDC_CTRL, &hpd_ddc_ctrl);
+		regmap_read(ddc->regs, HPD_DDC_STATUS, &hpd_ddc_status);
+	}
+
+	if (val & DDC_I2C_NO_ACK)
+		return -EIO;
+
+	return 0;
+}
+
+static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u16 addr_id,
+			  u16 offset_id, u8 *wr_data)
+{
+	u32 val;
+	int ret;
+
+	/* If down, rise bus for write operation */
+	mtk_ddc_check_and_rise_low_bus(ddc);
+
+	regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
+			   FIELD_PREP(HPD_DDC_DELAY_CNT, DDC2_DLY_CNT));
+
+	if (wr_data) {
+		regmap_write(ddc->regs, SI2C_CTRL,
+			     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
+			     FIELD_PREP(SI2C_WDATA, *wr_data) |
+			     SI2C_WR);
+	}
+
+	regmap_write(ddc->regs, DDC_CTRL,
+		     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_SEQ_WRITE) |
+		     FIELD_PREP(DDC_CTRL_DIN_CNT, wr_data == NULL ? 0 : 1) |
+		     FIELD_PREP(DDC_CTRL_OFFSET, offset_id) |
+		     FIELD_PREP(DDC_CTRL_ADDR, addr_id));
+	usleep_range(1000, 1250);
+
+	ret = regmap_read_poll_timeout(ddc->regs, HPD_DDC_STATUS, val,
+				       !(val & DDC_I2C_IN_PROG), 500, 1000);
+	if (ret) {
+		dev_err(ddc->dev, "DDC I2C write timeout\n");
+		return ret;
+	}
+
+	/* The I2C bus might be down after WR operation: rise it again */
+	ret = mtk_ddc_check_and_rise_low_bus(ddc);
+	if (ret) {
+		dev_err(ddc->dev, "Error during write operation: No ACK\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *ddc, u16 uc_dev,
+			      u8 addr, u8 *puc_value, u16 data_cnt)
+{
+	u16 dly_cnt, i, loop_counter, temp_length, uc_idx;
+	u32 rem, uc_read_count, val;
+	int ret;
+
+	mtk_ddc_check_and_rise_low_bus(ddc);
+
+	regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
+			   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLEAR_FIFO));
+
+	if (data_cnt >= 16) {
+		temp_length = 16;
+		loop_counter = data_cnt;
+
+		rem = do_div(loop_counter, temp_length);
+		if (rem)
+			loop_counter++;
+	} else {
+		temp_length = data_cnt;
+		loop_counter = 1;
+	}
+
+	if (uc_dev >= DDC_ADDR)
+		dly_cnt = DDC2_DLY_CNT_EDID;
+	else
+		dly_cnt = DDC2_DLY_CNT;
+
+	regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
+			   FIELD_PREP(HPD_DDC_DELAY_CNT, dly_cnt));
+
+	for (i = 0; i < loop_counter; i++) {
+		rem = data_cnt % 16;
+
+		if (i > 0 && i == (loop_counter - 1) && rem)
+			temp_length = rem;
+
+		/* 0x51 - 0x53: Flow control */
+		if (uc_dev > DDC_ADDR && uc_dev <= 0x53) {
+			regmap_update_bits(ddc->regs, SCDC_CTRL, SCDC_DDC_SEGMENT,
+					   FIELD_PREP(SCDC_DDC_SEGMENT, uc_dev - DDC_ADDR));
+
+			regmap_write(ddc->regs, DDC_CTRL,
+				     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ENH_READ_NOACK) |
+				     FIELD_PREP(DDC_CTRL_DIN_CNT, temp_length) |
+				     FIELD_PREP(DDC_CTRL_OFFSET, addr + i * temp_length) |
+				     FIELD_PREP(DDC_CTRL_ADDR, DDC_ADDR));
+		} else {
+			u16 offset;
+
+			if (addr != 0x43)
+				offset = i * 16;
+			else
+				offset = 0;
+
+			regmap_write(ddc->regs, DDC_CTRL,
+				     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_SEQ_READ_NOACK) |
+				     FIELD_PREP(DDC_CTRL_DIN_CNT, temp_length) |
+				     FIELD_PREP(DDC_CTRL_OFFSET, addr + offset) |
+				     FIELD_PREP(DDC_CTRL_ADDR, uc_dev));
+		}
+		usleep_range(5000, 5500);
+
+		ret = regmap_read_poll_timeout(ddc->regs, HPD_DDC_STATUS, val,
+					       !(val & DDC_I2C_IN_PROG), 1000,
+					       500 * (temp_length + 5));
+		if (ret) {
+			dev_err(ddc->dev, "Timeout waiting for DDC I2C\n");
+			return ret;
+		}
+
+		ret = mtk_ddc_check_and_rise_low_bus(ddc);
+		if (ret) {
+			dev_err(ddc->dev, "Error during read operation: No ACK\n");
+			return ret;
+		}
+
+		for (uc_idx = 0; uc_idx < temp_length; uc_idx++) {
+			unsigned int read_idx = i * 16 + uc_idx;
+
+			regmap_write(ddc->regs, SI2C_CTRL,
+				     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
+				     SI2C_RD);
+
+			regmap_read(ddc->regs, HPD_DDC_STATUS, &val);
+			puc_value[read_idx] = FIELD_GET(DDC_DATA_OUT, val);
+
+			regmap_write(ddc->regs, SI2C_CTRL,
+				     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
+				     SI2C_CONFIRM_READ);
+
+			/*
+			 * If HDMI IP gets reset during EDID read, DDC read
+			 * operation will fail and its delay counter will be
+			 * reset to 400.
+			 */
+			regmap_read(ddc->regs, HPD_DDC_CTRL, &val);
+			if (FIELD_GET(HPD_DDC_DELAY_CNT, val) < DDC2_DLY_CNT)
+				return 0;
+
+			uc_read_count = read_idx + 1;
+		}
+	}
+	if (uc_read_count > U8_MAX)
+		dev_warn(ddc->dev, "Invalid read data count %u\n", uc_read_count);
+
+	return uc_read_count;
+}
+
+static int mtk_hdmi_fg_ddc_data_read(struct mtk_hdmi_ddc *ddc, u16 b_dev,
+				     u8 data_addr, u16 data_cnt, u8 *pr_data)
+{
+	int read_data_cnt;
+	u16 req_data_cnt;
+
+	if (!data_cnt) {
+		dev_err(ddc->dev, "Invalid DDCM read request\n");
+		return -EINVAL;
+	}
+
+	req_data_cnt = U8_MAX - data_addr + 1;
+	if (req_data_cnt > data_cnt)
+		req_data_cnt = data_cnt;
+
+	regmap_set_bits(ddc->regs, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN);
+
+	read_data_cnt = mtk_ddcm_read_hdmi(ddc, b_dev, data_addr, pr_data, req_data_cnt);
+
+	if (read_data_cnt < 0)
+		return read_data_cnt;
+	else if (read_data_cnt != req_data_cnt)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_hdmi_ddc_fg_data_write(struct mtk_hdmi_ddc *ddc, u16 b_dev,
+				      u8 data_addr, u16 data_cnt, u8 *pr_data)
+{
+	int i, ret;
+
+	regmap_set_bits(ddc->regs, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN);
+	/*
+	 * In case there is no payload data, just do a single write for the
+	 * address only
+	 */
+	if (data_cnt == 0)
+		return mtk_ddc_wr_one(ddc, b_dev, data_addr, NULL);
+
+	i = 0;
+	do {
+		ret = mtk_ddc_wr_one(ddc, b_dev, data_addr + i, pr_data + i);
+		if (ret)
+			return ret;
+	} while (++i < data_cnt);
+
+	return 0;
+}
+
+static int mtk_hdmi_ddc_v2_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
+{
+	struct mtk_hdmi_ddc *ddc;
+	u8 offset = 0;
+	int i, ret;
+
+	ddc = adapter->algo_data;
+
+	for (i = 0; i < num; i++) {
+		struct i2c_msg *msg = &msgs[i];
+
+		if (!msg->buf) {
+			dev_err(ddc->dev, "No message buffer\n");
+			return -EINVAL;
+		}
+
+		if (msg->flags & I2C_M_RD) {
+			/*
+			 * The underlying DDC hardware always issues a write request
+			 * that assigns the read offset as part of the read operation,
+			 * therefore, use the `offset` value assigned in the previous
+			 * write request from drm_edid
+			 */
+			ret = mtk_hdmi_fg_ddc_data_read(ddc, msg->addr, offset,
+							msg->len, &msg->buf[0]);
+			if (ret)
+				return ret;
+		} else {
+			/*
+			 * The HW needs the data offset, found in buf[0], in the
+			 * DDC_CTRL register, and each byte of data, starting at
+			 * buf[1], goes in the SI2C_WDATA register.
+			 */
+			ret = mtk_hdmi_ddc_fg_data_write(ddc, msg->addr, msg->buf[0],
+							 msg->len - 1, &msg->buf[1]);
+			if (ret)
+				return ret;
+
+			/*
+			 * Store the offset value requested by drm_edid or by
+			 * scdc to use in subsequent read requests.
+			 */
+			if ((msg->addr == DDC_ADDR || msg->addr == SCDC_I2C_SLAVE_ADDRESS) &&
+			    msg->len == 1) {
+				offset = msg->buf[0];
+			}
+		}
+	}
+
+	return i;
+}
+
+static u32 mtk_hdmi_ddc_v2_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm mtk_hdmi_ddc_v2_algorithm = {
+	.master_xfer = mtk_hdmi_ddc_v2_xfer,
+	.functionality = mtk_hdmi_ddc_v2_func,
+};
+
+static int mtk_hdmi_ddc_v2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_hdmi_ddc *ddc;
+	int ret;
+
+	ddc = devm_kzalloc(dev, sizeof(*ddc), GFP_KERNEL);
+	if (!ddc)
+		return -ENOMEM;
+
+	ddc->dev = dev;
+	ddc->regs = device_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR_OR_NULL(ddc->regs))
+		return dev_err_probe(dev,
+				     IS_ERR(ddc->regs) ? PTR_ERR(ddc->regs) : -EINVAL,
+				     "Cannot get regmap\n");
+
+	ddc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(ddc->clk))
+		return dev_err_probe(dev, PTR_ERR(ddc->clk), "Cannot get DDC clock\n");
+
+	strscpy(ddc->adap.name, "mediatek-hdmi-ddc-v2", sizeof(ddc->adap.name));
+	ddc->adap.owner = THIS_MODULE;
+	ddc->adap.algo = &mtk_hdmi_ddc_v2_algorithm;
+	ddc->adap.retries = 3;
+	ddc->adap.dev.of_node = dev->of_node;
+	ddc->adap.algo_data = ddc;
+	ddc->adap.dev.parent = &pdev->dev;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Cannot enable Runtime PM\n");
+
+	pm_runtime_get_sync(dev);
+
+	ret = devm_i2c_add_adapter(dev, &ddc->adap);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot add DDC I2C adapter\n");
+
+	platform_set_drvdata(pdev, ddc);
+	return 0;
+}
+
+static const struct of_device_id mtk_hdmi_ddc_v2_match[] = {
+	{ .compatible = "mediatek,mt8195-hdmi-ddc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_v2_match);
+
+struct platform_driver mtk_hdmi_ddc_v2_driver = {
+	.probe = mtk_hdmi_ddc_v2_probe,
+	.driver = {
+		.name = "mediatek-hdmi-ddc-v2",
+		.of_match_table = mtk_hdmi_ddc_v2_match,
+	},
+};
+module_platform_driver(mtk_hdmi_ddc_v2_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek HDMIv2 DDC Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
new file mode 100644
index 0000000000000000000000000000000000000000..521b35c7e14d37c2189cf9fa5f2a8660f1cee67f
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
@@ -0,0 +1,263 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre, SAS
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _MTK_HDMI_REGS_H
+#define _MTK_HDMI_REGS_H
+
+/* HDMI_TOP Config */
+#define TOP_CFG00			0x000
+#define  HDMI2_ON			BIT(2)
+#define  HDMI_MODE_HDMI			BIT(3)
+#define  SCR_ON				BIT(4)
+#define  TMDS_PACK_MODE			GENMASK(9, 8)
+#define   TMDS_PACK_MODE_8BPP		0
+#define   TMDS_PACK_MODE_10BPP		1
+#define   TMDS_PACK_MODE_12BPP		2
+#define   TMDS_PACK_MODE_16BPP		3
+#define  DEEPCOLOR_PKT_EN		BIT(12)
+#define  HDMI_ABIST_VIDEO_FORMAT	GENMASK(21, 16)
+#define  HDMI_ABIST_ENABLE		BIT(31)
+#define TOP_CFG01 0x004
+#define  CP_SET_MUTE_EN			BIT(0)
+#define  CP_CLR_MUTE_EN			BIT(1)
+#define  NULL_PKT_EN			BIT(2)
+#define  NULL_PKT_VSYNC_HIGH_EN		BIT(3)
+
+/* HDMI_TOP Audio: Channel Mapping */
+#define TOP_AUD_MAP			0x00c
+#define  SD0_MAP			GENMASK(2, 0)
+#define  SD1_MAP			GENMASK(6, 4)
+#define  SD2_MAP			GENMASK(10, 8)
+#define  SD3_MAP			GENMASK(14, 12)
+#define  SD4_MAP			GENMASK(18, 16)
+#define  SD5_MAP			GENMASK(22, 20)
+#define  SD6_MAP			GENMASK(26, 24)
+#define  SD7_MAP			GENMASK(30, 28)
+
+/* Auxiliary Video Information (AVI) Infoframe */
+#define TOP_AVI_HEADER			0x024
+#define TOP_AVI_PKT00			0x028
+#define TOP_AVI_PKT01			0x02C
+#define TOP_AVI_PKT02			0x030
+#define TOP_AVI_PKT03			0x034
+#define TOP_AVI_PKT04			0x038
+#define TOP_AVI_PKT05			0x03C
+
+/* Audio Interface Infoframe */
+#define TOP_AIF_HEADER			0x040
+#define TOP_AIF_PKT00			0x044
+#define TOP_AIF_PKT01			0x048
+#define TOP_AIF_PKT02			0x04c
+#define TOP_AIF_PKT03			0x050
+
+/* Audio SPDIF Infoframe */
+#define TOP_SPDIF_HEADER		0x054
+#define TOP_SPDIF_PKT00			0x058
+#define TOP_SPDIF_PKT01			0x05c
+#define TOP_SPDIF_PKT02			0x060
+#define TOP_SPDIF_PKT03			0x064
+#define TOP_SPDIF_PKT04			0x068
+#define TOP_SPDIF_PKT05			0x06c
+#define TOP_SPDIF_PKT06			0x070
+#define TOP_SPDIF_PKT07			0x074
+
+/* Infoframes Configuration */
+#define TOP_INFO_EN			0x01c
+#define  AVI_EN				BIT(0)
+#define  SPD_EN				BIT(1)
+#define  AUD_EN				BIT(2)
+#define  CP_EN				BIT(5)
+#define  VSIF_EN			BIT(11)
+#define  AVI_EN_WR			BIT(16)
+#define  SPD_EN_WR			BIT(17)
+#define  AUD_EN_WR			BIT(18)
+#define  CP_EN_WR			BIT(21)
+#define  VSIF_EN_WR			BIT(27)
+#define TOP_INFO_RPT			0x020
+#define  AVI_RPT_EN			BIT(0)
+#define  SPD_RPT_EN			BIT(1)
+#define  AUD_RPT_EN			BIT(2)
+#define  CP_RPT_EN			BIT(5)
+#define  VSIF_RPT_EN			BIT(11)
+
+/* Vendor Specific Infoframe */
+#define TOP_VSIF_HEADER			0x174
+#define TOP_VSIF_PKT00			0x178
+#define TOP_VSIF_PKT01			0x17c
+#define TOP_VSIF_PKT02			0x180
+#define TOP_VSIF_PKT03			0x184
+#define TOP_VSIF_PKT04			0x188
+#define TOP_VSIF_PKT05			0x18c
+#define TOP_VSIF_PKT06			0x190
+#define TOP_VSIF_PKT07			0x194
+
+/* HDMI_TOP Misc */
+#define TOP_MISC_CTLR			0x1a4
+#define  DEEP_COLOR_ADD			BIT(4)
+
+/* Hardware interrupts */
+#define TOP_INT_STA00			0x1a8
+#define TOP_INT_ENABLE00		0x1b0
+#define  HTPLG_R_INT			BIT(0)
+#define  HTPLG_F_INT			BIT(1)
+#define  PORD_R_INT			BIT(2)
+#define  PORD_F_INT			BIT(3)
+#define  HDMI_VSYNC_INT			BIT(4)
+#define  HDMI_AUDIO_INT			BIT(5)
+#define  HDCP2X_RX_REAUTH_REQ_DDCM_INT	BIT(25)
+#define TOP_INT_ENABLE01		0x1b4
+#define TOP_INT_CLR00			0x1b8
+#define TOP_INT_CLR01			0x1bc
+
+
+/* Video Mute */
+#define TOP_VMUTE_CFG1			0x1c8
+#define  REG_VMUTE_EN			BIT(16)
+
+/* HDMI Audio IP */
+#define AIP_CTRL			0x400
+#define  CTS_SW_SEL			BIT(0)
+#define  CTS_REQ_EN			BIT(1)
+#define  MCLK_EN			BIT(2)
+#define  NO_MCLK_CTSGEN_SEL		BIT(3)
+#define  AUD_IN_EN			BIT(8)
+#define  AUD_SEL_OWRT			BIT(9)
+#define  SPDIF_EN			BIT(13)
+#define  HBRA_ON			BIT(14)
+#define  DSD_EN				BIT(15)
+#define  I2S_EN				GENMASK(19, 16)
+#define  HBR_FROM_SPDIF			BIT(20)
+#define  CTS_CAL_N4			BIT(23)
+#define  SPDIF_INTERNAL_MODULE		BIT(24)
+#define AIP_N_VAL			0x404
+#define AIP_CTS_SVAL			0x408
+#define AIP_SPDIF_CTRL			0x40c
+#define  WR_1UI_LOCK			BIT(0)
+#define  FS_OVERRIDE_WRITE		BIT(1)
+#define  WR_2UI_LOCK			BIT(2)
+#define  MAX_1UI_WRITE			GENMASK(15, 8)
+#define  MAX_2UI_SPDIF_WRITE		GENMASK(23, 16)
+#define  MAX_2UI_I2S_HI_WRITE		GENMASK(23, 20)
+#define   MAX_2UI_I2S_LFE_CC_SWAP	BIT(1)
+#define  MAX_2UI_I2S_LO_WRITE		GENMASK(19, 16)
+#define  AUD_ERR_THRESH			GENMASK(29, 24)
+#define  I2S2DSD_EN			BIT(30)
+#define AIP_I2S_CTRL			0x410
+#define  FIFO0_MAP			GENMASK(1, 0)
+#define  FIFO1_MAP			GENMASK(3, 2)
+#define  FIFO2_MAP			GENMASK(5, 4)
+#define  FIFO3_MAP			GENMASK(7, 6)
+#define  I2S_1ST_BIT_NOSHIFT		BIT(8)
+#define  I2S_DATA_DIR_LSB		BIT(9)
+#define  JUSTIFY_RIGHT			BIT(10)
+#define  WS_HIGH			BIT(11)
+#define  VBIT_COMPRESSED		BIT(12)
+#define  CBIT_ORDER_SAME		BIT(13)
+#define  SCK_EDGE_RISE			BIT(14)
+#define AIP_I2S_CHST0			0x414
+#define AIP_I2S_CHST1			0x418
+#define AIP_TXCTRL			0x424
+#define  RST4AUDIO			BIT(0)
+#define  RST4AUDIO_FIFO			BIT(1)
+#define  RST4AUDIO_ACR			BIT(2)
+#define  AUD_LAYOUT_1			BIT(4)
+#define  AUD_MUTE_FIFO_EN		BIT(5)
+#define  AUD_PACKET_DROP		BIT(6)
+#define  DSD_MUTE_EN			BIT(7)
+#define AIP_TPI_CTRL			0x428
+#define  TPI_AUDIO_LOOKUP_EN		BIT(2)
+
+/* Video downsampling configuration */
+#define VID_DOWNSAMPLE_CONFIG		0x8d0
+#define  C444_C422_CONFIG_ENABLE	BIT(0)
+#define  C422_C420_CONFIG_ENABLE	BIT(4)
+#define  C422_C420_CONFIG_BYPASS	BIT(5)
+#define  C422_C420_CONFIG_OUT_CB_OR_CR	BIT(6)
+#define VID_OUT_FORMAT			0x8fc
+#define  OUTPUT_FORMAT_DEMUX_420_ENABLE	BIT(10)
+
+/* HDCP registers */
+#define HDCP_TOP_CTRL			0xc00
+#define HDCP2X_CTRL_0			0xc20
+#define  HDCP2X_EN			BIT(0)
+#define  HDCP2X_ENCRYPT_EN		BIT(7)
+#define  HDCP2X_HPD_OVR			BIT(10)
+#define  HDCP2X_HPD_SW			BIT(11)
+#define HDCP2X_POL_CTRL			0xc54
+#define  HDCP2X_DIS_POLL_EN		BIT(16)
+#define HDCP1X_CTRL			0xcd0
+#define  HDCP1X_ENC_EN			BIT(6)
+
+/* HDMI DDC registers */
+#define HPD_DDC_CTRL			0xc08
+#define  HPD_DDC_DELAY_CNT		GENMASK(31, 16)
+#define  HPD_DDC_HPD_DBNC_EN		BIT(2)
+#define  HPD_DDC_PORD_DBNC_EN		BIT(3)
+#define DDC_CTRL			0xc10
+#define  DDC_CTRL_ADDR			GENMASK(7, 1)
+#define  DDC_CTRL_OFFSET		GENMASK(15, 8)
+#define  DDC_CTRL_DIN_CNT		GENMASK(25, 16)
+#define  DDC_CTRL_CMD			GENMASK(31, 28)
+#define SCDC_CTRL			0xc18
+#define  SCDC_DDC_SEGMENT		GENMASK(15, 8)
+#define HPD_DDC_STATUS			0xc60
+#define  HPD_STATE			GENMASK(1, 0)
+#define   HPD_STATE_CONNECTED		2
+#define  HPD_PIN_STA			BIT(4)
+#define  PORD_PIN_STA			BIT(5)
+#define  DDC_I2C_IN_PROG		BIT(13)
+#define  DDC_DATA_OUT			GENMASK(23, 16)
+#define SI2C_CTRL			0xcac
+#define  SI2C_WR			BIT(0)
+#define  SI2C_RD			BIT(1)
+#define  SI2C_CONFIRM_READ		BIT(2)
+#define  SI2C_WDATA			GENMASK(15, 8)
+#define  SI2C_ADDR			GENMASK(23, 16)
+
+/* HDCP DDC registers */
+#define HDCP2X_DDCM_STATUS		0xc68
+#define  DDC_I2C_NO_ACK			BIT(10)
+#define  DDC_I2C_BUS_LOW		BIT(11)
+
+/* HDMI TX registers */
+#define HDMITX_CONFIG_MT8188		0xea0
+#define HDMITX_CONFIG_MT8195		0x900
+#define  HDMI_YUV420_MODE		BIT(10)
+#define  HDMITX_SW_HPD			BIT(29)
+#define  HDMITX_SW_RSTB			BIT(31)
+
+/**
+ * enum mtk_hdmi_ddc_v2_cmds - DDC_CMD register commands
+ * @DDC_CMD_READ_NOACK:      Current address read with no ACK on last byte
+ * @DDC_CMD_READ:            Current address read with ACK on last byte
+ * @DDC_CMD_SEQ_READ_NOACK:  Sequential read with no ACK on last byte
+ * @DDC_CMD_SEQ_READ:        Sequential read with ACK on last byte
+ * @DDC_CMD_ENH_READ_NOACK:  Enhanced read with no ACK on last byte
+ * @DDC_CMD_ENH_READ:        Enhanced read with ACK on last byte
+ * @DDC_CMD_SEQ_WRITE_NOACK: Sequential write ignoring ACK on last byte
+ * @DDC_CMD_SEQ_WRITE:       Sequential write requiring ACK on last byte
+ * @DDC_CMD_RSVD:            Reserved for future use
+ * @DDC_CMD_CLEAR_FIFO:      Clear DDC I2C FIFO
+ * @DDC_CMD_CLOCK_SCL:       Start clocking DDC I2C SCL
+ * @DDC_CMD_ABORT_XFER:      Abort DDC I2C transaction
+ */
+enum mtk_hdmi_ddc_v2_cmds {
+	DDC_CMD_READ_NOACK = 0x0,
+	DDC_CMD_READ,
+	DDC_CMD_SEQ_READ_NOACK,
+	DDC_CMD_SEQ_READ,
+	DDC_CMD_ENH_READ_NOACK,
+	DDC_CMD_ENH_READ,
+	DDC_CMD_SEQ_WRITE_NOACK,
+	DDC_CMD_SEQ_WRITE = 0x07,
+	DDC_CMD_CLEAR_FIFO = 0x09,
+	DDC_CMD_CLOCK_SCL = 0x0a,
+	DDC_CMD_ABORT_XFER = 0x0f
+};
+
+#endif /* _MTK_HDMI_REGS_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
new file mode 100644
index 0000000000000000000000000000000000000000..2e8d8aed3c47417200dd951755cc2e3ef41df75d
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -0,0 +1,1398 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek HDMI v2 IP driver
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre, SAS
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/suspend.h>
+#include <linux/units.h>
+#include <linux/phy/phy.h>
+
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_scdc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "mtk_hdmi_common.h"
+#include "mtk_hdmi_regs_v2.h"
+
+#define MTK_HDMI_V2_CLOCK_MIN	27000
+#define MTK_HDMI_V2_CLOCK_MAX	594000
+
+#define HPD_PORD_HWIRQS		(HTPLG_R_INT | HTPLG_F_INT | PORD_F_INT | PORD_R_INT)
+
+enum mtk_hdmi_v2_clk_id {
+	MTK_HDMI_V2_CLK_HDCP_SEL,
+	MTK_HDMI_V2_CLK_HDCP_24M_SEL,
+	MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI,
+	MTK_HDMI_V2_CLK_HDMI_APB_SEL,
+	MTK_HDMI_V2_CLK_COUNT,
+};
+
+const char *const mtk_hdmi_v2_clk_names[MTK_HDMI_V2_CLK_COUNT] = {
+	[MTK_HDMI_V2_CLK_HDMI_APB_SEL] = "bus",
+	[MTK_HDMI_V2_CLK_HDCP_SEL] = "hdcp",
+	[MTK_HDMI_V2_CLK_HDCP_24M_SEL] = "hdcp24m",
+	[MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI] = "hdmi-split",
+};
+
+static inline void mtk_hdmi_v2_hwirq_disable(struct mtk_hdmi *hdmi)
+{
+	regmap_write(hdmi->regs, TOP_INT_ENABLE00, 0);
+	regmap_write(hdmi->regs, TOP_INT_ENABLE01, 0);
+}
+
+static inline void mtk_hdmi_v2_enable_hpd_pord_irq(struct mtk_hdmi *hdmi, bool enable)
+{
+	if (enable)
+		regmap_set_bits(hdmi->regs, TOP_INT_ENABLE00, HPD_PORD_HWIRQS);
+	else
+		regmap_clear_bits(hdmi->regs, TOP_INT_ENABLE00, HPD_PORD_HWIRQS);
+}
+
+static inline void mtk_hdmi_v2_set_sw_hpd(struct mtk_hdmi *hdmi, bool enable)
+{
+	if (enable) {
+		regmap_set_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMITX_SW_HPD);
+		regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_OVR);
+		regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_SW);
+	} else {
+		regmap_clear_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_OVR);
+		regmap_clear_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_SW);
+		regmap_clear_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMITX_SW_HPD);
+	}
+}
+
+static inline void mtk_hdmi_v2_enable_scrambling(struct mtk_hdmi *hdmi, bool enable)
+{
+	struct drm_scdc *scdc = &hdmi->curr_conn->display_info.hdmi.scdc;
+
+	if (enable)
+		regmap_set_bits(hdmi->regs, TOP_CFG00, SCR_ON | HDMI2_ON);
+	else
+		regmap_clear_bits(hdmi->regs, TOP_CFG00, SCR_ON | HDMI2_ON);
+
+	if (scdc->supported) {
+		if (scdc->scrambling.supported)
+			drm_scdc_set_scrambling(hdmi->curr_conn, enable);
+		drm_scdc_set_high_tmds_clock_ratio(hdmi->curr_conn, enable);
+	}
+}
+
+static void mtk_hdmi_v2_hw_vid_mute(struct mtk_hdmi *hdmi, bool enable)
+{
+	/* If enabled, sends a black image */
+	if (enable)
+		regmap_set_bits(hdmi->regs, TOP_VMUTE_CFG1, REG_VMUTE_EN);
+	else
+		regmap_clear_bits(hdmi->regs, TOP_VMUTE_CFG1, REG_VMUTE_EN);
+}
+
+static void mtk_hdmi_v2_hw_aud_mute(struct mtk_hdmi *hdmi, bool enable)
+{
+	u32 aip, val;
+
+	if (!enable) {
+		regmap_clear_bits(hdmi->regs, AIP_TXCTRL, AUD_MUTE_FIFO_EN);
+		return;
+	}
+
+	regmap_read(hdmi->regs, AIP_CTRL, &aip);
+
+	val = AUD_MUTE_FIFO_EN;
+	if (aip & DSD_EN)
+		val |= DSD_MUTE_EN;
+
+	regmap_update_bits(hdmi->regs, AIP_TXCTRL, val, val);
+}
+
+static void mtk_hdmi_v2_hw_reset(struct mtk_hdmi *hdmi)
+{
+	regmap_clear_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMITX_SW_RSTB);
+	udelay(5);
+	regmap_set_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMITX_SW_RSTB);
+}
+
+static inline u32 mtk_hdmi_v2_format_hw_packet(const u8 *buffer, u8 len)
+{
+	unsigned short i;
+	u32 val = 0;
+
+	for (i = 0; i < len; i++)
+		val |= buffer[i] << (i * 8);
+
+	return val;
+}
+
+static void mtk_hdmi_v2_hw_write_audio_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+{
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN | AUD_EN_WR);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
+
+	regmap_write(hdmi->regs, TOP_AIF_HEADER, mtk_hdmi_v2_format_hw_packet(&buffer[0], 3));
+	regmap_write(hdmi->regs, TOP_AIF_PKT00, mtk_hdmi_v2_format_hw_packet(&buffer[3], 3));
+	regmap_write(hdmi->regs, TOP_AIF_PKT01, mtk_hdmi_v2_format_hw_packet(&buffer[7], 2));
+	regmap_write(hdmi->regs, TOP_AIF_PKT02, 0);
+	regmap_write(hdmi->regs, TOP_AIF_PKT03, 0);
+
+	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
+	regmap_set_bits(hdmi->regs, TOP_INFO_EN, AUD_EN | AUD_EN_WR);
+}
+
+static void mtk_hdmi_v2_hw_write_avi_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+{
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
+
+	regmap_write(hdmi->regs, TOP_AVI_HEADER, mtk_hdmi_v2_format_hw_packet(&buffer[0], 3));
+	regmap_write(hdmi->regs, TOP_AVI_PKT00, mtk_hdmi_v2_format_hw_packet(&buffer[3], 4));
+	regmap_write(hdmi->regs, TOP_AVI_PKT01, mtk_hdmi_v2_format_hw_packet(&buffer[7], 3));
+	regmap_write(hdmi->regs, TOP_AVI_PKT02, mtk_hdmi_v2_format_hw_packet(&buffer[10], 4));
+	regmap_write(hdmi->regs, TOP_AVI_PKT03, mtk_hdmi_v2_format_hw_packet(&buffer[14], 3));
+	regmap_write(hdmi->regs, TOP_AVI_PKT04, 0);
+	regmap_write(hdmi->regs, TOP_AVI_PKT05, 0);
+
+	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
+	regmap_set_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
+}
+
+static void mtk_hdmi_v2_hw_write_spd_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+{
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
+
+	regmap_write(hdmi->regs, TOP_SPDIF_HEADER, mtk_hdmi_v2_format_hw_packet(&buffer[0], 3));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT00, mtk_hdmi_v2_format_hw_packet(&buffer[3], 4));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT01, mtk_hdmi_v2_format_hw_packet(&buffer[7], 3));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT02, mtk_hdmi_v2_format_hw_packet(&buffer[10], 4));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT03, mtk_hdmi_v2_format_hw_packet(&buffer[14], 3));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT04, mtk_hdmi_v2_format_hw_packet(&buffer[17], 4));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT05, mtk_hdmi_v2_format_hw_packet(&buffer[21], 3));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT06, mtk_hdmi_v2_format_hw_packet(&buffer[24], 4));
+	regmap_write(hdmi->regs, TOP_SPDIF_PKT07, buffer[28]);
+
+	regmap_set_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
+	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
+}
+
+static void mtk_hdmi_v2_hw_write_vendor_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+{
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
+
+	regmap_write(hdmi->regs, TOP_VSIF_HEADER, mtk_hdmi_v2_format_hw_packet(&buffer[0], 3));
+	regmap_write(hdmi->regs, TOP_VSIF_PKT00, mtk_hdmi_v2_format_hw_packet(&buffer[3], 4));
+	regmap_write(hdmi->regs, TOP_VSIF_PKT01, mtk_hdmi_v2_format_hw_packet(&buffer[7], 2));
+	regmap_write(hdmi->regs, TOP_VSIF_PKT02, 0);
+	regmap_write(hdmi->regs, TOP_VSIF_PKT03, 0);
+	regmap_write(hdmi->regs, TOP_VSIF_PKT04, 0);
+	regmap_write(hdmi->regs, TOP_VSIF_PKT05, 0);
+	regmap_write(hdmi->regs, TOP_VSIF_PKT06, 0);
+	regmap_write(hdmi->regs, TOP_VSIF_PKT07, 0);
+
+	regmap_set_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
+	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
+}
+
+static void mtk_hdmi_yuv420_downsampling(struct mtk_hdmi *hdmi, bool enable)
+{
+	u32 val;
+
+	regmap_read(hdmi->regs, VID_DOWNSAMPLE_CONFIG, &val);
+
+	if (enable) {
+		regmap_set_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMI_YUV420_MODE);
+
+		val |= C444_C422_CONFIG_ENABLE | C422_C420_CONFIG_ENABLE;
+		val |= C422_C420_CONFIG_OUT_CB_OR_CR;
+		val &= ~C422_C420_CONFIG_BYPASS;
+		regmap_write(hdmi->regs, VID_DOWNSAMPLE_CONFIG, val);
+
+		regmap_set_bits(hdmi->regs, VID_OUT_FORMAT, OUTPUT_FORMAT_DEMUX_420_ENABLE);
+	} else {
+		regmap_clear_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMI_YUV420_MODE);
+
+		val &= ~(C444_C422_CONFIG_ENABLE | C422_C420_CONFIG_ENABLE);
+		val &= ~C422_C420_CONFIG_OUT_CB_OR_CR;
+		val |= C422_C420_CONFIG_BYPASS;
+		regmap_write(hdmi->regs, VID_DOWNSAMPLE_CONFIG, val);
+
+		regmap_clear_bits(hdmi->regs, VID_OUT_FORMAT, OUTPUT_FORMAT_DEMUX_420_ENABLE);
+	}
+}
+
+static int mtk_hdmi_v2_setup_audio_infoframe(struct mtk_hdmi *hdmi)
+{
+	struct hdmi_codec_params *params = &hdmi->aud_param.codec_params;
+	struct hdmi_audio_infoframe frame;
+	u8 buffer[14];
+	ssize_t ret;
+
+	memcpy(&frame, &params->cea, sizeof(frame));
+
+	ret = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
+
+	return 0;
+}
+
+static inline void mtk_hdmi_v2_hw_gcp_avmute(struct mtk_hdmi *hdmi, bool mute)
+{
+	u32 val;
+
+	regmap_read(hdmi->regs, TOP_CFG01, &val);
+	val &= ~(CP_CLR_MUTE_EN | CP_SET_MUTE_EN);
+
+	if (mute) {
+		val |= CP_SET_MUTE_EN;
+		val &= ~CP_CLR_MUTE_EN;
+	} else {
+		val |= CP_CLR_MUTE_EN;
+		val &= ~CP_SET_MUTE_EN;
+	}
+	regmap_write(hdmi->regs, TOP_CFG01, val);
+
+	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, CP_RPT_EN);
+	regmap_set_bits(hdmi->regs, TOP_INFO_EN, CP_EN | CP_EN_WR);
+}
+
+static void mtk_hdmi_v2_hw_ncts_enable(struct mtk_hdmi *hdmi, bool enable)
+{
+	if (enable)
+		regmap_set_bits(hdmi->regs, AIP_CTRL, CTS_SW_SEL);
+	else
+		regmap_clear_bits(hdmi->regs, AIP_CTRL, CTS_SW_SEL);
+}
+
+static void mtk_hdmi_v2_hw_aud_set_channel_status(struct mtk_hdmi *hdmi)
+{
+	u8 *ch_status = hdmi->aud_param.codec_params.iec.status;
+
+	/* Only the first 5 to 7 bytes of Channel Status contain useful information */
+	regmap_write(hdmi->regs, AIP_I2S_CHST0, mtk_hdmi_v2_format_hw_packet(&ch_status[0], 4));
+	regmap_write(hdmi->regs, AIP_I2S_CHST1, mtk_hdmi_v2_format_hw_packet(&ch_status[4], 3));
+}
+
+static void mtk_hdmi_v2_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
+				     unsigned int sample_rate,
+				     unsigned int clock)
+{
+	unsigned int n, cts;
+
+	mtk_hdmi_get_ncts(sample_rate, clock, &n, &cts);
+
+	regmap_write(hdmi->regs, AIP_N_VAL, n);
+	regmap_write(hdmi->regs, AIP_CTS_SVAL, cts);
+}
+
+static void mtk_hdmi_v2_hw_aud_enable(struct mtk_hdmi *hdmi, bool enable)
+{
+	if (enable)
+		regmap_clear_bits(hdmi->regs, AIP_TXCTRL, AUD_PACKET_DROP);
+	else
+		regmap_set_bits(hdmi->regs, AIP_TXCTRL, AUD_PACKET_DROP);
+}
+
+static u32 mtk_hdmi_v2_aud_output_channel_map(u8 sd0, u8 sd1, u8 sd2, u8 sd3,
+					      u8 sd4, u8 sd5, u8 sd6, u8 sd7)
+{
+	u32 val;
+
+	/*
+	 * Each of the Output Channels (0-7) can be mapped to get their input
+	 * from any of the available Input Channels (0-7): this function
+	 * takes input channel numbers and formats a value that must then
+	 * be written to the TOP_AUD_MAP hardware register by the caller.
+	 */
+	val = FIELD_PREP(SD0_MAP, sd0) | FIELD_PREP(SD1_MAP, sd1);
+	val |= FIELD_PREP(SD2_MAP, sd2) | FIELD_PREP(SD3_MAP, sd3);
+	val |= FIELD_PREP(SD4_MAP, sd4) | FIELD_PREP(SD5_MAP, sd5);
+	val |= FIELD_PREP(SD6_MAP, sd6) | FIELD_PREP(SD7_MAP, sd7);
+
+	return val;
+}
+
+static void mtk_hdmi_audio_dsd_config(struct mtk_hdmi *hdmi,
+				      unsigned char chnum, bool dsd_bypass)
+{
+	u32 channel_map;
+
+	regmap_update_bits(hdmi->regs, AIP_CTRL, SPDIF_EN | DSD_EN | HBRA_ON, DSD_EN);
+	regmap_set_bits(hdmi->regs, AIP_TXCTRL, DSD_MUTE_EN);
+
+	if (dsd_bypass)
+		channel_map = mtk_hdmi_v2_aud_output_channel_map(0, 2, 4, 6, 1, 3, 5, 7);
+	else
+		channel_map = mtk_hdmi_v2_aud_output_channel_map(0, 5, 1, 0, 3, 2, 4, 0);
+
+	regmap_write(hdmi->regs, TOP_AUD_MAP, channel_map);
+	regmap_clear_bits(hdmi->regs, AIP_SPDIF_CTRL, I2S2DSD_EN);
+}
+
+static inline void mtk_hdmi_v2_hw_i2s_fifo_map(struct mtk_hdmi *hdmi, u32 fifo_mapping)
+{
+	regmap_update_bits(hdmi->regs, AIP_I2S_CTRL,
+			   FIFO0_MAP | FIFO1_MAP | FIFO2_MAP | FIFO3_MAP, fifo_mapping);
+}
+
+static inline void mtk_hdmi_v2_hw_i2s_ch_number(struct mtk_hdmi *hdmi, u8 chnum)
+{
+	regmap_update_bits(hdmi->regs, AIP_CTRL, I2S_EN, FIELD_PREP(I2S_EN, chnum));
+}
+
+static void mtk_hdmi_v2_hw_i2s_ch_mapping(struct mtk_hdmi *hdmi, u8 chnum, u8 mapping)
+{
+	u32 fifo_map;
+	u8 bdata;
+
+	switch (chnum) {
+	default:
+	case 2:
+		bdata = 0x1;
+		break;
+	case 3:
+		bdata = 0x3;
+		break;
+	case 6:
+		if (mapping == 0x0e) {
+			bdata = 0xf;
+			break;
+		}
+		fallthrough;
+	case 5:
+		bdata = 0x7;
+		break;
+	case 7:
+	case 8:
+		bdata = 0xf;
+		break;
+	}
+
+	/* Assign default FIFO mapping: SD0 to FIFO0, SD1 to FIFO1, etc. */
+	fifo_map = FIELD_PREP(FIFO0_MAP, 0) | FIELD_PREP(FIFO1_MAP, 1);
+	fifo_map |= FIELD_PREP(FIFO2_MAP, 2) | FIELD_PREP(FIFO3_MAP, 3);
+	mtk_hdmi_v2_hw_i2s_fifo_map(hdmi, fifo_map);
+	mtk_hdmi_v2_hw_i2s_ch_number(hdmi, bdata);
+
+	/*
+	 * Set HDMI Audio packet layout indicator:
+	 * Layout 0 is for two channels
+	 * Layout 1 is for up to eight channels
+	 */
+	if (chnum == 2)
+		regmap_set_bits(hdmi->regs, AIP_TXCTRL, AUD_LAYOUT_1);
+	else
+		regmap_clear_bits(hdmi->regs, AIP_TXCTRL, AUD_LAYOUT_1);
+}
+
+static void mtk_hdmi_i2s_data_fmt(struct mtk_hdmi *hdmi, unsigned char fmt)
+{
+	u32 val;
+
+	regmap_read(hdmi->regs, AIP_I2S_CTRL, &val);
+	val &= ~(WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
+
+	switch (fmt) {
+	case HDMI_I2S_MODE_RJT_24BIT:
+	case HDMI_I2S_MODE_RJT_16BIT:
+		val |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
+		break;
+	case HDMI_I2S_MODE_LJT_24BIT:
+	case HDMI_I2S_MODE_LJT_16BIT:
+		val |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT);
+		break;
+	case HDMI_I2S_MODE_I2S_24BIT:
+	case HDMI_I2S_MODE_I2S_16BIT:
+	default:
+		break;
+	}
+
+	regmap_write(hdmi->regs, AIP_I2S_CTRL, val);
+}
+
+static inline void mtk_hdmi_i2s_sck_edge_rise(struct mtk_hdmi *hdmi, bool rise)
+{
+	if (rise)
+		regmap_set_bits(hdmi->regs, AIP_I2S_CTRL, SCK_EDGE_RISE);
+	else
+		regmap_clear_bits(hdmi->regs, AIP_I2S_CTRL, SCK_EDGE_RISE);
+}
+
+static inline void mtk_hdmi_i2s_cbit_order(struct mtk_hdmi *hdmi, unsigned int cbit)
+{
+	regmap_update_bits(hdmi->regs, AIP_I2S_CTRL, CBIT_ORDER_SAME, cbit);
+}
+
+static inline void mtk_hdmi_i2s_vbit(struct mtk_hdmi *hdmi, unsigned int vbit)
+{
+	/* V bit: 0 for PCM, 1 for Compressed data */
+	regmap_update_bits(hdmi->regs, AIP_I2S_CTRL, VBIT_COMPRESSED, vbit);
+}
+
+static inline void mtk_hdmi_i2s_data_direction(struct mtk_hdmi *hdmi, unsigned int is_lsb)
+{
+	regmap_update_bits(hdmi->regs, AIP_I2S_CTRL, I2S_DATA_DIR_LSB, is_lsb);
+}
+
+static inline void mtk_hdmi_v2_hw_audio_type(struct mtk_hdmi *hdmi, unsigned int spdif_i2s)
+{
+	regmap_update_bits(hdmi->regs, AIP_CTRL, SPDIF_EN, FIELD_PREP(SPDIF_EN, spdif_i2s));
+}
+
+static u8 mtk_hdmi_v2_get_i2s_ch_mapping(struct mtk_hdmi *hdmi, u8 channel_type)
+{
+	switch (channel_type) {
+	case HDMI_AUD_CHAN_TYPE_1_1:
+	case HDMI_AUD_CHAN_TYPE_2_1:
+		return 0x01;
+	case HDMI_AUD_CHAN_TYPE_3_0:
+		return 0x02;
+	case HDMI_AUD_CHAN_TYPE_3_1:
+		return 0x03;
+	case HDMI_AUD_CHAN_TYPE_3_0_LRS:
+	case HDMI_AUD_CHAN_TYPE_4_0:
+		return 0x08;
+	case HDMI_AUD_CHAN_TYPE_5_1:
+		return 0x0b;
+	case HDMI_AUD_CHAN_TYPE_4_1_CLRS:
+	case HDMI_AUD_CHAN_TYPE_6_0:
+	case HDMI_AUD_CHAN_TYPE_6_0_CS:
+	case HDMI_AUD_CHAN_TYPE_6_0_CH:
+	case HDMI_AUD_CHAN_TYPE_6_0_OH:
+	case HDMI_AUD_CHAN_TYPE_6_0_CHR:
+		return 0x0e;
+	case HDMI_AUD_CHAN_TYPE_1_0:
+	case HDMI_AUD_CHAN_TYPE_2_0:
+	case HDMI_AUD_CHAN_TYPE_3_1_LRS:
+	case HDMI_AUD_CHAN_TYPE_4_1:
+	case HDMI_AUD_CHAN_TYPE_5_0:
+	case HDMI_AUD_CHAN_TYPE_4_0_CLRS:
+	case HDMI_AUD_CHAN_TYPE_6_1:
+	case HDMI_AUD_CHAN_TYPE_6_1_CS:
+	case HDMI_AUD_CHAN_TYPE_6_1_CH:
+	case HDMI_AUD_CHAN_TYPE_6_1_OH:
+	case HDMI_AUD_CHAN_TYPE_6_1_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_0:
+	case HDMI_AUD_CHAN_TYPE_7_0_LH_RH:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR:
+	case HDMI_AUD_CHAN_TYPE_7_0_LC_RC:
+	case HDMI_AUD_CHAN_TYPE_7_0_LW_RW:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS:
+	case HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS:
+	case HDMI_AUD_CHAN_TYPE_7_0_CS_CH:
+	case HDMI_AUD_CHAN_TYPE_7_0_CS_OH:
+	case HDMI_AUD_CHAN_TYPE_7_0_CS_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_0_CH_OH:
+	case HDMI_AUD_CHAN_TYPE_7_0_CH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_0_OH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR:
+	case HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS:
+	case HDMI_AUD_CHAN_TYPE_7_1:
+	case HDMI_AUD_CHAN_TYPE_7_1_LH_RH:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR:
+	case HDMI_AUD_CHAN_TYPE_7_1_LC_RC:
+	case HDMI_AUD_CHAN_TYPE_7_1_LW_RW:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS:
+	case HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS:
+	case HDMI_AUD_CHAN_TYPE_7_1_CS_CH:
+	case HDMI_AUD_CHAN_TYPE_7_1_CS_OH:
+	case HDMI_AUD_CHAN_TYPE_7_1_CS_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_1_CH_OH:
+	case HDMI_AUD_CHAN_TYPE_7_1_CH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_1_OH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR:
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static inline void mtk_hdmi_v2_hw_i2s_ch_swap(struct mtk_hdmi *hdmi)
+{
+	regmap_update_bits(hdmi->regs, AIP_SPDIF_CTRL, MAX_2UI_I2S_HI_WRITE,
+			   FIELD_PREP(MAX_2UI_I2S_HI_WRITE, MAX_2UI_I2S_LFE_CC_SWAP));
+}
+
+static void mtk_hdmi_hbr_config(struct mtk_hdmi *hdmi, bool dsd_bypass)
+{
+	const u32 hbr_mask = SPDIF_EN | DSD_EN | HBRA_ON;
+
+	if (dsd_bypass) {
+		regmap_update_bits(hdmi->regs, AIP_CTRL, hbr_mask, HBRA_ON);
+		regmap_set_bits(hdmi->regs, AIP_CTRL, I2S_EN);
+	} else {
+		regmap_update_bits(hdmi->regs, AIP_CTRL, hbr_mask, SPDIF_EN);
+		regmap_set_bits(hdmi->regs, AIP_CTRL, SPDIF_INTERNAL_MODULE);
+		regmap_set_bits(hdmi->regs, AIP_CTRL, HBR_FROM_SPDIF);
+		regmap_set_bits(hdmi->regs, AIP_CTRL, CTS_CAL_N4);
+	}
+}
+
+static inline void mtk_hdmi_v2_hw_spdif_config(struct mtk_hdmi *hdmi)
+{
+	regmap_clear_bits(hdmi->regs, AIP_SPDIF_CTRL, WR_1UI_LOCK);
+	regmap_clear_bits(hdmi->regs, AIP_SPDIF_CTRL, FS_OVERRIDE_WRITE);
+	regmap_clear_bits(hdmi->regs, AIP_SPDIF_CTRL, WR_2UI_LOCK);
+
+	regmap_update_bits(hdmi->regs, AIP_SPDIF_CTRL, MAX_1UI_WRITE,
+			   FIELD_PREP(MAX_1UI_WRITE, 4));
+	regmap_update_bits(hdmi->regs, AIP_SPDIF_CTRL, MAX_2UI_SPDIF_WRITE,
+			   FIELD_PREP(MAX_2UI_SPDIF_WRITE, 9));
+	regmap_update_bits(hdmi->regs, AIP_SPDIF_CTRL, AUD_ERR_THRESH,
+			   FIELD_PREP(AUD_ERR_THRESH, 4));
+
+	regmap_set_bits(hdmi->regs, AIP_SPDIF_CTRL, I2S2DSD_EN);
+}
+
+static void mtk_hdmi_v2_aud_set_input(struct mtk_hdmi *hdmi)
+{
+	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
+	struct hdmi_codec_params *codec_params = &aud_param->codec_params;
+	u8 i2s_ch_map;
+	u32 out_ch_map;
+
+	/* Write the default output channel map. CH0 maps to SD0, CH1 maps to SD1, etc */
+	out_ch_map = mtk_hdmi_v2_aud_output_channel_map(0, 1, 2, 3, 4, 5, 6, 7);
+	regmap_write(hdmi->regs, TOP_AUD_MAP, out_ch_map);
+
+	regmap_update_bits(hdmi->regs, AIP_SPDIF_CTRL, MAX_2UI_I2S_HI_WRITE, 0);
+	regmap_clear_bits(hdmi->regs, AIP_CTRL,
+			  SPDIF_EN | DSD_EN | HBRA_ON | CTS_CAL_N4 |
+			  HBR_FROM_SPDIF | SPDIF_INTERNAL_MODULE);
+	regmap_clear_bits(hdmi->regs, AIP_TXCTRL, DSD_MUTE_EN | AUD_LAYOUT_1);
+
+	if (aud_param->aud_input_type == HDMI_AUD_INPUT_I2S) {
+		switch (aud_param->aud_codec) {
+		case HDMI_AUDIO_CODING_TYPE_DTS_HD:
+		case HDMI_AUDIO_CODING_TYPE_MLP:
+			mtk_hdmi_i2s_data_fmt(hdmi, aud_param->aud_i2s_fmt);
+			mtk_hdmi_hbr_config(hdmi, true);
+			break;
+		case HDMI_AUDIO_CODING_TYPE_DSD:
+			mtk_hdmi_audio_dsd_config(hdmi, codec_params->channels, 0);
+			mtk_hdmi_v2_hw_i2s_ch_mapping(hdmi, codec_params->channels, 1);
+			break;
+		default:
+			mtk_hdmi_i2s_data_fmt(hdmi, aud_param->aud_i2s_fmt);
+			mtk_hdmi_i2s_sck_edge_rise(hdmi, true);
+			mtk_hdmi_i2s_cbit_order(hdmi, CBIT_ORDER_SAME);
+			mtk_hdmi_i2s_vbit(hdmi, 0); /* PCM data */
+			mtk_hdmi_i2s_data_direction(hdmi, 0); /* MSB first */
+			mtk_hdmi_v2_hw_audio_type(hdmi, HDMI_AUD_INPUT_I2S);
+			i2s_ch_map = mtk_hdmi_v2_get_i2s_ch_mapping(hdmi,
+						aud_param->aud_input_chan_type);
+			mtk_hdmi_v2_hw_i2s_ch_mapping(hdmi, codec_params->channels, i2s_ch_map);
+			mtk_hdmi_v2_hw_i2s_ch_swap(hdmi);
+		}
+	} else {
+		if (codec_params->sample_rate == 768000 &&
+		    (aud_param->aud_codec == HDMI_AUDIO_CODING_TYPE_DTS_HD ||
+		     aud_param->aud_codec == HDMI_AUDIO_CODING_TYPE_MLP)) {
+			mtk_hdmi_hbr_config(hdmi, false);
+		} else {
+			mtk_hdmi_v2_hw_spdif_config(hdmi);
+			mtk_hdmi_v2_hw_i2s_ch_mapping(hdmi, 2, 0);
+		}
+	}
+}
+
+static inline void mtk_hdmi_v2_hw_audio_input_enable(struct mtk_hdmi *hdmi, bool ena)
+{
+	if (ena)
+		regmap_set_bits(hdmi->regs, AIP_CTRL, AUD_IN_EN);
+	else
+		regmap_clear_bits(hdmi->regs, AIP_CTRL, AUD_IN_EN);
+}
+
+static void mtk_hdmi_v2_aip_ctrl_init(struct mtk_hdmi *hdmi)
+{
+	regmap_set_bits(hdmi->regs, AIP_CTRL,
+			AUD_SEL_OWRT | NO_MCLK_CTSGEN_SEL | MCLK_EN | CTS_REQ_EN);
+	regmap_clear_bits(hdmi->regs, AIP_TPI_CTRL, TPI_AUDIO_LOOKUP_EN);
+}
+
+static void mtk_hdmi_v2_audio_reset(struct mtk_hdmi *hdmi, bool reset)
+{
+	const u32 arst_bits = RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR;
+
+	if (reset)
+		regmap_set_bits(hdmi->regs, AIP_TXCTRL, arst_bits);
+	else
+		regmap_clear_bits(hdmi->regs, AIP_TXCTRL, arst_bits);
+}
+
+static void mtk_hdmi_v2_aud_output_config(struct mtk_hdmi *hdmi,
+					  struct drm_display_mode *display_mode)
+{
+	/* Shut down and reset the HDMI Audio HW to avoid glitching */
+	mtk_hdmi_v2_hw_aud_mute(hdmi, true);
+	mtk_hdmi_v2_hw_aud_enable(hdmi, false);
+	mtk_hdmi_v2_audio_reset(hdmi, true);
+
+	/* Configure the main hardware params and get out of reset */
+	mtk_hdmi_v2_aip_ctrl_init(hdmi);
+	mtk_hdmi_v2_aud_set_input(hdmi);
+	mtk_hdmi_v2_hw_aud_set_channel_status(hdmi);
+	mtk_hdmi_v2_setup_audio_infoframe(hdmi);
+	mtk_hdmi_v2_hw_audio_input_enable(hdmi, true);
+	mtk_hdmi_v2_audio_reset(hdmi, false);
+
+	/* Ignore N/CTS packet transmission requests and configure */
+	mtk_hdmi_v2_hw_ncts_enable(hdmi, false);
+	mtk_hdmi_v2_hw_aud_set_ncts(hdmi, hdmi->aud_param.codec_params.sample_rate,
+				    display_mode->clock);
+
+	/* Wait for the HW to apply settings */
+	usleep_range(25, 50);
+
+	/* Hardware is fully configured: enable TX of N/CTS pkts and unmute */
+	mtk_hdmi_v2_hw_ncts_enable(hdmi, true);
+	mtk_hdmi_v2_hw_aud_enable(hdmi, true);
+	mtk_hdmi_v2_hw_aud_mute(hdmi, false);
+}
+
+static void mtk_hdmi_v2_change_video_resolution(struct mtk_hdmi *hdmi,
+						struct drm_connector_state *conn_state)
+{
+	mtk_hdmi_v2_hw_reset(hdmi);
+	mtk_hdmi_v2_set_sw_hpd(hdmi, true);
+	udelay(2);
+
+	regmap_write(hdmi->regs, HDCP_TOP_CTRL, 0);
+
+	/*
+	 * Enable HDCP reauthentication interrupt: the HW uses this internally
+	 * for the HPD state machine even if HDCP encryption is not enabled.
+	 */
+	regmap_set_bits(hdmi->regs, TOP_INT_ENABLE00, HDCP2X_RX_REAUTH_REQ_DDCM_INT);
+
+	/* Enable hotplug and pord interrupts */
+	mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
+
+	/* Force enabling HDCP HPD */
+	regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_OVR);
+	regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_SW);
+
+	/* Set 8 bits per pixel */
+	regmap_update_bits(hdmi->regs, TOP_CFG00, TMDS_PACK_MODE,
+			   FIELD_PREP(TMDS_PACK_MODE, TMDS_PACK_MODE_8BPP));
+	/* Disable generating deepcolor packets */
+	regmap_clear_bits(hdmi->regs, TOP_CFG00, DEEPCOLOR_PKT_EN);
+	/* Disable adding deepcolor information to the general packet */
+	regmap_clear_bits(hdmi->regs, TOP_MISC_CTLR, DEEP_COLOR_ADD);
+
+	if (hdmi->curr_conn->display_info.is_hdmi)
+		regmap_set_bits(hdmi->regs, TOP_CFG00, HDMI_MODE_HDMI);
+	else
+		regmap_clear_bits(hdmi->regs, TOP_CFG00, HDMI_MODE_HDMI);
+
+	udelay(5);
+	mtk_hdmi_v2_hw_vid_mute(hdmi, true);
+	mtk_hdmi_v2_hw_aud_mute(hdmi, true);
+	mtk_hdmi_v2_hw_gcp_avmute(hdmi, false);
+
+	regmap_update_bits(hdmi->regs, TOP_CFG01,
+			   NULL_PKT_VSYNC_HIGH_EN | NULL_PKT_EN, NULL_PKT_VSYNC_HIGH_EN);
+	usleep_range(100, 150);
+
+	/* Enable scrambling if tmds clock is 340MHz or more */
+	mtk_hdmi_v2_enable_scrambling(hdmi, hdmi->mode.clock >= 340 * KILO);
+
+	switch (conn_state->hdmi.output_format) {
+	default:
+	case HDMI_COLORSPACE_RGB:
+	case HDMI_COLORSPACE_YUV444:
+		/* Disable YUV420 downsampling for RGB and YUV444 */
+		mtk_hdmi_yuv420_downsampling(hdmi, false);
+		break;
+	case HDMI_COLORSPACE_YUV422:
+		/*
+		 * YUV420 downsampling is special and needs a bit of setup
+		 * so we disable everything there before doing anything else.
+		 *
+		 * YUV422 downsampling instead just needs one bit to be set.
+		 */
+		mtk_hdmi_yuv420_downsampling(hdmi, false);
+		regmap_set_bits(hdmi->regs, VID_DOWNSAMPLE_CONFIG,
+				C444_C422_CONFIG_ENABLE);
+		break;
+	case HDMI_COLORSPACE_YUV420:
+		mtk_hdmi_yuv420_downsampling(hdmi, true);
+		break;
+	};
+}
+
+static void mtk_hdmi_v2_output_set_display_mode(struct mtk_hdmi *hdmi,
+						struct drm_connector_state *conn_state,
+						struct drm_display_mode *mode)
+{
+	union phy_configure_opts opts = {
+		.dp = { .link_rate = hdmi->mode.clock * KILO }
+	};
+	int ret;
+
+	ret = phy_configure(hdmi->phy, &opts);
+	if (ret)
+		dev_err(hdmi->dev, "Setting clock=%d failed: %d", mode->clock, ret);
+
+	mtk_hdmi_v2_change_video_resolution(hdmi, conn_state);
+	mtk_hdmi_v2_aud_output_config(hdmi, mode);
+}
+
+static int mtk_hdmi_v2_clk_enable(struct mtk_hdmi *hdmi)
+{
+	int ret;
+
+	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_SEL]);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_24M_SEL]);
+	if (ret)
+		goto disable_hdcp_clk;
+
+	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_HDMI_APB_SEL]);
+	if (ret)
+		goto disable_hdcp_24m_clk;
+
+	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI]);
+	if (ret)
+		goto disable_bus_clk;
+
+	return 0;
+
+disable_bus_clk:
+	clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDMI_APB_SEL]);
+disable_hdcp_24m_clk:
+	clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_24M_SEL]);
+disable_hdcp_clk:
+	clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_SEL]);
+
+	return ret;
+}
+
+static void mtk_hdmi_v2_clk_disable(struct mtk_hdmi *hdmi)
+{
+	clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI]);
+	clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDMI_APB_SEL]);
+	clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_24M_SEL]);
+	clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_SEL]);
+}
+
+static enum hdmi_hpd_state mtk_hdmi_v2_hpd_pord_status(struct mtk_hdmi *hdmi)
+{
+	u8 hpd_pin_sta, pord_pin_sta;
+	u32 hpd_status;
+
+	regmap_read(hdmi->regs, HPD_DDC_STATUS, &hpd_status);
+	hpd_pin_sta = FIELD_GET(HPD_PIN_STA, hpd_status);
+	pord_pin_sta = FIELD_GET(PORD_PIN_STA, hpd_status);
+
+	/*
+	 * Inform that the cable is plugged in (hpd_pin_sta) so that the
+	 * sink can be powered on by switching the 5V VBUS as required by
+	 * the HDMI spec for reading EDID and for HDMI Audio registers to
+	 * be accessible.
+	 *
+	 * PORD detection succeeds only when the cable is plugged in and
+	 * the sink is powered on: reaching that state means that the
+	 * communication with the sink can be started.
+	 *
+	 * Please note that when the cable is plugged out the HPD pin will
+	 * be the first one to fall, while PORD may still be in rise state
+	 * for a few more milliseconds, so we decide HDMI_PLUG_OUT without
+	 * checking PORD at all (we check only HPD falling for that).
+	 */
+	if (hpd_pin_sta && pord_pin_sta)
+		return HDMI_PLUG_IN_AND_SINK_POWER_ON;
+	else if (hpd_pin_sta)
+		return HDMI_PLUG_IN_ONLY;
+	else
+		return HDMI_PLUG_OUT;
+}
+
+static irqreturn_t mtk_hdmi_v2_isr(int irq, void *arg)
+{
+	struct mtk_hdmi *hdmi = arg;
+	unsigned int irq_sta;
+	int ret = IRQ_HANDLED;
+
+	regmap_read(hdmi->regs, TOP_INT_STA00, &irq_sta);
+
+	/* Handle Hotplug Detection interrupts */
+	if (irq_sta & HPD_PORD_HWIRQS) {
+		/*
+		 * Disable the HPD/PORD IRQs now and until thread done to
+		 * avoid interrupt storm that could happen with bad cables
+		 */
+		mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, false);
+		ret = IRQ_WAKE_THREAD;
+
+		/* Clear HPD/PORD irqs to avoid unwanted retriggering */
+		regmap_write(hdmi->regs, TOP_INT_CLR00, HPD_PORD_HWIRQS);
+		regmap_write(hdmi->regs, TOP_INT_CLR00, 0);
+	}
+
+	return ret;
+}
+
+static irqreturn_t __mtk_hdmi_v2_isr_thread(struct mtk_hdmi *hdmi)
+{
+	enum hdmi_hpd_state hpd;
+
+	hpd = mtk_hdmi_v2_hpd_pord_status(hdmi);
+	if (hpd != hdmi->hpd) {
+		struct drm_encoder *encoder = hdmi->bridge.encoder;
+
+		hdmi->hpd = hpd;
+
+		if (encoder && encoder->dev)
+			drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
+	}
+
+	mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mtk_hdmi_v2_isr_thread(int irq, void *arg)
+{
+	struct mtk_hdmi *hdmi = arg;
+
+	/*
+	 * Debounce HDMI monitor HPD status.
+	 * Empirical testing shows that 30ms is enough wait
+	 */
+	msleep(30);
+
+	return __mtk_hdmi_v2_isr_thread(hdmi);
+}
+
+static int mtk_hdmi_v2_enable(struct mtk_hdmi *hdmi)
+{
+	bool was_active = pm_runtime_active(hdmi->dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(hdmi->dev);
+	if (ret) {
+		dev_err(hdmi->dev, "Cannot resume HDMI\n");
+		return ret;
+	}
+
+	ret = mtk_hdmi_v2_clk_enable(hdmi);
+	if (ret) {
+		pm_runtime_put(hdmi->dev);
+		return ret;
+	}
+
+	if (!was_active) {
+		mtk_hdmi_v2_hw_reset(hdmi);
+		mtk_hdmi_v2_set_sw_hpd(hdmi, true);
+	}
+
+	return 0;
+}
+
+static void mtk_hdmi_v2_disable(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_v2_clk_disable(hdmi);
+	pm_runtime_put_sync(hdmi->dev);
+}
+
+/*
+ * Bridge callbacks
+ */
+
+static int mtk_hdmi_v2_bridge_attach(struct drm_bridge *bridge,
+				     struct drm_encoder *encoder,
+				     enum drm_bridge_attach_flags flags)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	int ret;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_ERROR("The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
+		return -EINVAL;
+	}
+	if (hdmi->next_bridge) {
+		ret = drm_bridge_attach(encoder, hdmi->next_bridge, bridge, flags);
+		if (ret)
+			return ret;
+	}
+
+	ret = mtk_hdmi_v2_enable(hdmi);
+	if (ret)
+		return ret;
+
+	/* Enable Hotplug and Pord pins internal debouncing */
+	regmap_set_bits(hdmi->regs, HPD_DDC_CTRL,
+			HPD_DDC_HPD_DBNC_EN | HPD_DDC_PORD_DBNC_EN);
+
+	irq_clear_status_flags(hdmi->irq, IRQ_NOAUTOEN);
+	enable_irq(hdmi->irq);
+
+	/*
+	 * Check if any HDMI monitor was connected before probing this driver
+	 * and/or attaching the bridge, without debouncing: if so, we want to
+	 * notify the DRM so that we start outputting an image ASAP.
+	 * Note that calling the ISR thread function will also perform a HW
+	 * registers write that enables both the HPD and Pord interrupts.
+	 */
+	__mtk_hdmi_v2_isr_thread(hdmi);
+
+	mtk_hdmi_v2_disable(hdmi);
+
+	return 0;
+}
+
+static void mtk_hdmi_v2_bridge_detach(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	WARN_ON(pm_runtime_active(hdmi->dev));
+
+	/* The controller is already powered off, just disable irq here */
+	disable_irq(hdmi->irq);
+}
+
+static void mtk_hdmi_v2_handle_plugged_change(struct mtk_hdmi *hdmi, bool plugged)
+{
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev, plugged);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+}
+
+static void mtk_hdmi_v2_bridge_pre_enable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	struct drm_connector_state *conn_state;
+	union phy_configure_opts opts = {
+		.dp = { .link_rate = hdmi->mode.clock * KILO }
+	};
+	int ret;
+
+	/* Power on the controller before trying to write to registers */
+	ret = mtk_hdmi_v2_enable(hdmi);
+	if (WARN_ON(ret))
+		return;
+
+	/* Retrieve the connector through the atomic state */
+	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+
+	conn_state = drm_atomic_get_new_connector_state(state, hdmi->curr_conn);
+	if (WARN_ON(!conn_state))
+		return;
+
+	/*
+	 * Preconfigure the HDMI controller and the HDMI PHY at pre_enable
+	 * stage to make sure that this IP is ready and clocked before the
+	 * mtk_dpi gets powered on and before it enables the output.
+	 */
+	mtk_hdmi_v2_output_set_display_mode(hdmi, conn_state, &hdmi->mode);
+
+	/* Reconfigure phy clock link with appropriate rate */
+	phy_configure(hdmi->phy, &opts);
+
+	/* Power on the PHY here to make sure that DPI_HDMI is clocked */
+	phy_power_on(hdmi->phy);
+
+	hdmi->powered = true;
+}
+
+static void mtk_hdmi_v2_bridge_enable(struct drm_bridge *bridge,
+				      struct drm_atomic_state *state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	int ret;
+
+	if (WARN_ON(!hdmi->powered))
+		return;
+
+	ret = drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
+	if (ret)
+		dev_err(hdmi->dev, "Could not update infoframes: %d\n", ret);
+
+	mtk_hdmi_v2_hw_vid_mute(hdmi, false);
+
+	/* signal the connect event to audio codec */
+	mtk_hdmi_v2_handle_plugged_change(hdmi, true);
+
+	hdmi->enabled = true;
+}
+
+static void mtk_hdmi_v2_bridge_disable(struct drm_bridge *bridge,
+				       struct drm_atomic_state *state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	if (!hdmi->enabled)
+		return;
+
+	mtk_hdmi_v2_hw_gcp_avmute(hdmi, true);
+	msleep(50);
+	mtk_hdmi_v2_hw_vid_mute(hdmi, true);
+	mtk_hdmi_v2_hw_aud_mute(hdmi, true);
+	msleep(50);
+
+	hdmi->enabled = false;
+}
+
+static void mtk_hdmi_v2_bridge_post_disable(struct drm_bridge *bridge,
+					    struct drm_atomic_state *state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	if (!hdmi->powered)
+		return;
+
+	phy_power_off(hdmi->phy);
+	hdmi->powered = false;
+
+	/* signal the disconnect event to audio codec */
+	mtk_hdmi_v2_handle_plugged_change(hdmi, false);
+
+	/* Power off */
+	mtk_hdmi_v2_disable(hdmi);
+}
+
+static enum drm_connector_status mtk_hdmi_v2_bridge_detect(struct drm_bridge *bridge,
+							   struct drm_connector *connector)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	return hdmi->hpd != HDMI_PLUG_OUT ?
+	       connector_status_connected : connector_status_disconnected;
+}
+
+static const struct drm_edid *mtk_hdmi_v2_bridge_edid_read(struct drm_bridge *bridge,
+							   struct drm_connector *connector)
+{
+	return drm_edid_read(connector);
+}
+
+static void mtk_hdmi_v2_hpd_enable(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	int ret;
+
+	ret = mtk_hdmi_v2_enable(hdmi);
+	if (ret) {
+		dev_err(hdmi->dev, "Cannot power on controller for HPD: %d\n", ret);
+		return;
+	}
+
+	mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
+}
+
+static void mtk_hdmi_v2_hpd_disable(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, false);
+	mtk_hdmi_v2_disable(hdmi);
+}
+
+static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+						 const struct drm_display_mode *mode,
+						 unsigned long long tmds_rate)
+{
+	if (mode->clock < MTK_HDMI_V2_CLOCK_MIN)
+		return MODE_CLOCK_LOW;
+	else if (mode->clock > MTK_HDMI_V2_CLOCK_MAX)
+		return MODE_CLOCK_HIGH;
+	else
+		return MODE_OK;
+}
+
+static int mtk_hdmi_v2_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					    enum hdmi_infoframe_type type)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN_WR | AUD_EN);
+		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
+		break;
+	case HDMI_INFOFRAME_TYPE_AVI:
+		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
+		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
+		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
+		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
+		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
+		break;
+	case HDMI_INFOFRAME_TYPE_DRM:
+	default:
+		break;
+	};
+
+	return 0;
+}
+
+static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
+		break;
+	case HDMI_INFOFRAME_TYPE_AVI:
+		mtk_hdmi_v2_hw_write_avi_infoframe(hdmi, buffer);
+		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		mtk_hdmi_v2_hw_write_spd_infoframe(hdmi, buffer);
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		mtk_hdmi_v2_hw_write_vendor_infoframe(hdmi, buffer);
+		break;
+	case HDMI_INFOFRAME_TYPE_DRM:
+	default:
+		dev_err(hdmi->dev, "Unsupported HDMI infoframe type %u\n", type);
+		break;
+	};
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
+	.attach = mtk_hdmi_v2_bridge_attach,
+	.detach = mtk_hdmi_v2_bridge_detach,
+	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
+	.mode_set = mtk_hdmi_bridge_mode_set,
+	.atomic_pre_enable = mtk_hdmi_v2_bridge_pre_enable,
+	.atomic_enable = mtk_hdmi_v2_bridge_enable,
+	.atomic_disable = mtk_hdmi_v2_bridge_disable,
+	.atomic_post_disable = mtk_hdmi_v2_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.detect = mtk_hdmi_v2_bridge_detect,
+	.edid_read = mtk_hdmi_v2_bridge_edid_read,
+	.hpd_enable = mtk_hdmi_v2_hpd_enable,
+	.hpd_disable = mtk_hdmi_v2_hpd_disable,
+	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
+	.hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
+	.hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,
+};
+
+/*
+ * HDMI audio codec callbacks
+ */
+static int mtk_hdmi_v2_audio_hook_plugged_cb(struct device *dev, void *data,
+					     hdmi_codec_plugged_cb fn,
+					     struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	bool plugged;
+
+	if (!hdmi)
+		return -ENODEV;
+
+	mtk_hdmi_audio_set_plugged_cb(hdmi, fn, codec_dev);
+	plugged = (hdmi->hpd == HDMI_PLUG_IN_AND_SINK_POWER_ON);
+	mtk_hdmi_v2_handle_plugged_change(hdmi, plugged);
+
+	return 0;
+}
+
+static int mtk_hdmi_v2_audio_hw_params(struct device *dev, void *data,
+				       struct hdmi_codec_daifmt *daifmt,
+				       struct hdmi_codec_params *params)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (hdmi->audio_enable) {
+		mtk_hdmi_audio_params(hdmi, daifmt, params);
+		mtk_hdmi_v2_aud_output_config(hdmi, &hdmi->mode);
+	}
+	return 0;
+}
+
+static int mtk_hdmi_v2_audio_startup(struct device *dev, void *data)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_v2_hw_aud_enable(hdmi, true);
+	hdmi->audio_enable = true;
+
+	return 0;
+}
+
+static void mtk_hdmi_v2_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	hdmi->audio_enable = false;
+	mtk_hdmi_v2_hw_aud_enable(hdmi, false);
+}
+
+static int mtk_hdmi_v2_audio_mute(struct device *dev, void *data, bool enable, int dir)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_v2_hw_aud_mute(hdmi, enable);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops mtk_hdmi_v2_audio_codec_ops = {
+	.hw_params = mtk_hdmi_v2_audio_hw_params,
+	.audio_startup = mtk_hdmi_v2_audio_startup,
+	.audio_shutdown = mtk_hdmi_v2_audio_shutdown,
+	.mute_stream = mtk_hdmi_v2_audio_mute,
+	.get_eld = mtk_hdmi_audio_get_eld,
+	.hook_plugged_cb = mtk_hdmi_v2_audio_hook_plugged_cb,
+};
+
+static __maybe_unused int mtk_hdmi_v2_suspend(struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_v2_disable(hdmi);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_hdmi_v2_resume(struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	return mtk_hdmi_v2_enable(hdmi);
+}
+
+static SIMPLE_DEV_PM_OPS(mtk_hdmi_v2_pm_ops, mtk_hdmi_v2_suspend, mtk_hdmi_v2_resume);
+
+static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
+	.bridge_funcs = &mtk_v2_hdmi_bridge_funcs,
+	.codec_ops = &mtk_hdmi_v2_audio_codec_ops,
+	.mtk_hdmi_clock_names = mtk_hdmi_v2_clk_names,
+	.num_clocks = MTK_HDMI_V2_CLK_COUNT,
+	.interlace_allowed = true,
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8188 = {
+	.ver_conf = &mtk_hdmi_conf_v2,
+	.reg_hdmi_tx_cfg = HDMITX_CONFIG_MT8188
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8195 = {
+	.ver_conf = &mtk_hdmi_conf_v2,
+	.reg_hdmi_tx_cfg = HDMITX_CONFIG_MT8195
+};
+
+static int mtk_hdmi_v2_probe(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi;
+	int ret;
+
+	/* Populate HDMI sub-devices if present */
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret)
+		return ret;
+
+	hdmi = mtk_hdmi_common_probe(pdev);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	hdmi->hpd = HDMI_PLUG_OUT;
+
+	/* Disable all HW interrupts at probe stage */
+	mtk_hdmi_v2_hwirq_disable(hdmi);
+
+	/*
+	 * In case bootloader leaves HDMI enabled before booting, make
+	 * sure that any interrupt that was left is cleared by setting
+	 * all bits in the INT_CLR registers for all 32+19 interrupts.
+	 */
+	regmap_write(hdmi->regs, TOP_INT_CLR00, GENMASK(31, 0));
+	regmap_write(hdmi->regs, TOP_INT_CLR01, GENMASK(18, 0));
+
+	/* Restore interrupt clearing registers to zero */
+	regmap_write(hdmi->regs, TOP_INT_CLR00, 0);
+	regmap_write(hdmi->regs, TOP_INT_CLR01, 0);
+
+	/*
+	 * Install the ISR but keep it disabled: as the interrupts are
+	 * being set up in the .bridge_attach() callback which will
+	 * enable both the right HW IRQs and the ISR.
+	 */
+	irq_set_status_flags(hdmi->irq, IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(&pdev->dev, hdmi->irq, mtk_hdmi_v2_isr,
+					mtk_hdmi_v2_isr_thread,
+					IRQ_TYPE_LEVEL_HIGH,
+					dev_name(&pdev->dev), hdmi);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Cannot request IRQ\n");
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Cannot enable Runtime PM\n");
+
+	return 0;
+}
+
+static void mtk_hdmi_v2_remove(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	i2c_put_adapter(hdmi->ddc_adpt);
+}
+
+static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {
+	{ .compatible = "mediatek,mt8188-hdmi-tx", .data = &mtk_hdmi_conf_mt8188 },
+	{ .compatible = "mediatek,mt8195-hdmi-tx", .data = &mtk_hdmi_conf_mt8195 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_v2_of_ids);
+
+static struct platform_driver mtk_hdmi_v2_driver = {
+	.probe = mtk_hdmi_v2_probe,
+	.remove = mtk_hdmi_v2_remove,
+	.driver = {
+		.name = "mediatek-drm-hdmi-v2",
+		.of_match_table = mtk_drm_hdmi_v2_of_ids,
+		.pm = &mtk_hdmi_v2_pm_ops,
+	},
+};
+module_platform_driver(mtk_hdmi_v2_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>>");
+MODULE_DESCRIPTION("MediaTek HDMIv2 Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DRM_MTK_HDMI");

-- 
2.51.0

