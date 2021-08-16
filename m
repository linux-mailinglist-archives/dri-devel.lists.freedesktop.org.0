Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363F63EDE00
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C2D6E049;
	Mon, 16 Aug 2021 19:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754506E048
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:25:52 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v4so17971875wro.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/XfYFIYwy/HkujSVpOAeCSjRnFWuHt2xEmDcZy3F/4Y=;
 b=S85xAQN6w1FtqeHt1YXtSmFEOjPaNOnNwspAVDXg199BhDU7XBNwSl/5i5wcYpTGaH
 Myu5QsY/UdjKor2I4MpIpq0BZDsPPFv3bsK7Z35xgl533WZA7ssfLfU1xBMqnvbGUF3o
 R8RCkdG7HE3SHT2JY3aIAa/buJXj6oriK7AEW0ZXALHn8z1BVMcnAFIgvDB1R52OMr4+
 9RXSocIV0RbApSGTthHcplt5jzMYJ1ZR6LnmCYtswPADscZ40XRzLnTbgpDwsxQTdHLM
 pjEIFG7xCVDFiwtZ97kuDaJrr6rk337TOOIxkZcCc0F88eMVNI2A9yQNV8AHztKwfnS4
 c9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/XfYFIYwy/HkujSVpOAeCSjRnFWuHt2xEmDcZy3F/4Y=;
 b=Id/ptWWgo4fztcjjqmxvxnU/5l8Tx9/RVcHcqqr0kqUcQIchkZrOIeBuzH/pFFt1Dk
 YeWV6fm8MyTR/L1aByKSDeTBkCAZ1NBHzWZxgefqwq2YHXKc6rgtNTLA0gFaDPRZoCTg
 wBf1oy6by9ilWKXCe7ffKDh4FUItL2ttHH9CpT16a23a9pyRKj2w7a8OxqrfwWMkOHHF
 2vVv8/SNaNOnJwmETgABaoS3eaXzhTnrUpdN7KbDsbykijOgZ8yGSbqs/QItsB6GEBOJ
 51JLuGEi94YRlQSurBBjX6bleOX0ZR+hVB6p6niJGrSyqgOP4XvYS51TjBI6e+beLV1H
 /vkA==
X-Gm-Message-State: AOAM533KCq/ChmjI3kLIFyIqoJxc6XArDa9CcZ5Ddaiz+6UvYuTdb6Ea
 q7HJF9kybWLiYIJo58sXRmqlXA==
X-Google-Smtp-Source: ABdhPJw3jfeZIRgdw9Um2xmvFRnS0MnRpKmcR7W1UGKYD0Q3/yCaet5CgdvMqwZIu/cCEkTbqLHu8w==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr69719wrt.226.1629141950515;
 Mon, 16 Aug 2021 12:25:50 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:50 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 16 Aug 2021 21:25:23 +0200
Message-Id: <20210816192523.1739365-6-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816192523.1739365-1-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Aug 2021 19:45:33 +0000
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

This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.

It supports both functional units on the mt8195, the embedded
DisplayPort as well as the external DisplayPort units. It offers
hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
to 4 lanes.

This driver is based on an initial version by
Jason-JH.Lin <jason-jh.lin@mediatek.com>.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/gpu/drm/mediatek/Kconfig      |    7 +
 drivers/gpu/drm/mediatek/Makefile     |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c     | 3025 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h | 3095 +++++++++++++++++++++++++
 4 files changed, 6129 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 2976d21e9a34..d81eb3521c1c 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -28,3 +28,10 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
+
+config MTK_DPTX_SUPPORT
+	tristate "DRM DPTX Support for Mediatek SoCs"
+	depends on DRM_MEDIATEK
+	select GENERIC_PHY
+	help
+	  DRM/KMS Display Port driver for Mediatek SoCs.
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index dc54a7a69005..6b9d148ab7fe 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -20,3 +20,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
+
+obj-$(CONFIG_MTK_DPTX_SUPPORT) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
new file mode 100644
index 000000000000..055ab816937f
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -0,0 +1,3025 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/extcon.h>
+#include <linux/extcon-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/of_graph.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/mediatek_drm.h>
+#include <sound/hdmi-codec.h>
+#include <video/videomode.h>
+
+#include "mtk_dp_reg.h"
+
+#define MTK_DP_AUX_WAIT_REPLY_COUNT		20000
+#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT	3
+
+#define MTK_DP_MAX_LANES			4
+#define MTK_DP_MAX_LINK_RATE			MTK_DP_LINKRATE_HBR3
+
+#define MTK_DP_TBC_BUF_READ_START_ADDR		0x08
+
+#define MTK_DP_TRAIN_RETRY_LIMIT		0x8
+#define MTK_DP_TRAIN_MAX_ITERATIONS		0x5
+
+#define MTK_DP_AUX_WRITE_READ_WAIT_TIME_US	20
+
+#define MTK_DP_DP_VERSION_11			0x11
+
+enum mtk_dp_state {
+	MTK_DP_STATE_INITIAL,
+	MTK_DP_STATE_IDLE,
+	MTK_DP_STATE_PREPARE,
+	MTK_DP_STATE_NORMAL,
+};
+
+enum mtk_dp_train_state {
+	MTK_DP_TRAIN_STATE_STARTUP = 0,
+	MTK_DP_TRAIN_STATE_CHECKCAP,
+	MTK_DP_TRAIN_STATE_CHECKEDID,
+	MTK_DP_TRAIN_STATE_TRAINING_PRE,
+	MTK_DP_TRAIN_STATE_TRAINING,
+	MTK_DP_TRAIN_STATE_CHECKTIMING,
+	MTK_DP_TRAIN_STATE_NORMAL,
+	MTK_DP_TRAIN_STATE_POWERSAVE,
+	MTK_DP_TRAIN_STATE_DPIDLE,
+};
+
+struct mtk_dp_timings {
+	struct videomode vm;
+
+	u16 htotal;
+	u16 vtotal;
+	u8 frame_rate;
+	u32 pix_rate_khz;
+};
+
+struct mtk_dp_train_info {
+	bool sink_ext_cap;
+	bool tps3;
+	bool tps4;
+	bool sink_ssc;
+	bool cable_plugged_in;
+	bool cable_state_change;
+	bool cr_done;
+	bool eq_done;
+
+	int link_rate;
+	int lane_count;
+
+	int irq_status;
+	int check_cap_count;
+};
+
+// Same values as used by the DP Spec for MISC0 bits 1 and 2
+enum mtk_dp_color_format {
+	MTK_DP_COLOR_FORMAT_RGB_444     = 0,
+	MTK_DP_COLOR_FORMAT_YUV_422     = 1,
+	MTK_DP_COLOR_FORMAT_YUV_444     = 2,
+	MTK_DP_COLOR_FORMAT_YUV_420     = 3,
+	MTK_DP_COLOR_FORMAT_YONLY       = 4,
+	MTK_DP_COLOR_FORMAT_RAW         = 5,
+	MTK_DP_COLOR_FORMAT_RESERVED    = 6,
+	MTK_DP_COLOR_FORMAT_DEFAULT     = MTK_DP_COLOR_FORMAT_RGB_444,
+	MTK_DP_COLOR_FORMAT_UNKNOWN     = 15,
+};
+
+// Multiple of 0.27Gbps
+enum mtk_dp_linkrate {
+	MTK_DP_LINKRATE_RBR	=  0x6,
+	MTK_DP_LINKRATE_HBR	=  0xA,
+	MTK_DP_LINKRATE_HBR2	= 0x14,
+	MTK_DP_LINKRATE_HBR25	= 0x19,
+	MTK_DP_LINKRATE_HBR3	= 0x1E,
+};
+
+// Same values as used for DP Spec MISC0 bits 5,6,7
+enum mtk_dp_color_depth {
+	MTK_DP_COLOR_DEPTH_6BIT       = 0,
+	MTK_DP_COLOR_DEPTH_8BIT       = 1,
+	MTK_DP_COLOR_DEPTH_10BIT      = 2,
+	MTK_DP_COLOR_DEPTH_12BIT      = 3,
+	MTK_DP_COLOR_DEPTH_16BIT      = 4,
+	MTK_DP_COLOR_DEPTH_UNKNOWN    = 5,
+};
+
+struct mtk_dp_audio_cfg {
+	int sample_rate;
+	int word_length_bits;
+	int channels;
+};
+
+struct mtk_dp_info {
+	enum mtk_dp_color_depth depth;
+	enum mtk_dp_color_format format;
+	struct mtk_dp_audio_cfg audio_caps;
+	struct mtk_dp_timings timings;
+};
+
+struct mtk_dp_driver_data {
+	bool is_edp;
+};
+
+struct mtk_dp {
+	const struct mtk_dp_driver_data *driver_data;
+	struct device *dev;
+
+	struct drm_device *drm_dev;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_connector conn;
+	struct drm_dp_aux aux;
+	struct edid *edid;
+	struct drm_display_mode mode;
+
+	struct work_struct work;
+	struct workqueue_struct *workqueue;
+
+	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
+
+	struct mtk_dp_info info;
+	enum mtk_dp_state state;
+
+	struct mtk_dp_train_info training_info;
+	enum mtk_dp_train_state train_state;
+	enum mtk_dp_train_state train_state_pre;
+
+	struct task_struct *task;
+
+	struct regmap *regs;
+	struct clk *dp_tx_clk;
+
+	bool enabled;
+	bool power_enabled;
+	bool powered;
+	bool audio_enable;
+	bool video_enable;
+	bool dp_ready;
+	bool has_fec;
+	struct mutex dp_lock;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
+	struct mutex update_plugged_status_lock;
+};
+
+enum mtk_dp_sdp_type {
+	MTK_DP_SDP_NONE = 0x00,
+	MTK_DP_SDP_ACM  = 0x01,
+	MTK_DP_SDP_ISRC = 0x02,
+	MTK_DP_SDP_AVI  = 0x03,
+	MTK_DP_SDP_AUI  = 0x04,
+	MTK_DP_SDP_SPD  = 0x05,
+	MTK_DP_SDP_MPEG = 0x06,
+	MTK_DP_SDP_NTSC = 0x07,
+	MTK_DP_SDP_VSP  = 0x08,
+	MTK_DP_SDP_VSC  = 0x09,
+	MTK_DP_SDP_EXT  = 0x0A,
+	MTK_DP_SDP_PPS0 = 0x0B,
+	MTK_DP_SDP_PPS1 = 0x0C,
+	MTK_DP_SDP_PPS2 = 0x0D,
+	MTK_DP_SDP_PPS3 = 0x0E,
+	MTK_DP_SDP_DRM  = 0x10,
+	MTK_DP_SDP_MAX_NUM
+};
+
+struct mtk_dp_sdp_packet {
+	enum mtk_dp_sdp_type type;
+	u8 header[4];
+	u8 data[32];
+};
+
+#define MTK_DP_IEC_CHANNEL_STATUS_LEN 5
+union mtk_dp_audio_channel_status {
+	struct {
+		u8 rev : 1;
+		u8 is_lpcm : 1;
+		u8 copy_right : 1;
+		u8 additional_format_info : 3;
+		u8 channel_status_mode : 2;
+		u8 category_code;
+		u8 src_num : 4;
+		u8 channel_num : 4;
+		u8 sampling_freq : 4;
+		u8 clk_accuracy : 2;
+		u8 rev2 : 2;
+		u8 word_len : 4;
+		u8 original_sampling_freq : 4;
+	} iec;
+
+	u8 buf[MTK_DP_IEC_CHANNEL_STATUS_LEN];
+};
+
+static struct regmap_config mtk_dp_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SEC_OFFSET + 0x90,
+	.name		= "mtk-dp-registers",
+};
+
+static inline struct mtk_dp *mtk_dp_from_conn(struct drm_connector *c)
+{
+	return container_of(c, struct mtk_dp, conn);
+}
+
+static inline struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
+{
+	return container_of(b, struct mtk_dp, bridge);
+}
+
+u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
+{
+	u32 read_val;
+	int ret;
+
+	ret = regmap_read(mtk_dp->regs, offset, &read_val);
+	if (ret) {
+		drm_err(mtk_dp->drm_dev, "Failed to read register %x: %d\n",
+			offset, ret);
+		return 0;
+	}
+
+	return read_val;
+}
+
+void mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
+{
+	int ret;
+
+	ret = regmap_write(mtk_dp->regs, offset, val);
+	if (ret)
+		drm_err(mtk_dp->drm_dev,
+			"Failed to write register %x with value %x: %d\n",
+			offset, val, ret);
+}
+
+void mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset, u32 val, u32 mask)
+{
+	int ret;
+
+	ret = regmap_update_bits(mtk_dp->regs, offset, val, mask);
+	if (ret)
+		drm_err(mtk_dp->drm_dev,
+			"Failed to update register %x with value %x, mask %x: %d\n",
+			offset, val, mask, ret);
+}
+
+static void mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32 offset, u8 *buf,
+				    size_t length)
+{
+	int i;
+	int num_regs = (length + 1) / 2;
+
+	// 2 bytes per register
+	for (i = 0; i < num_regs; i++) {
+		u32 val = buf[i * 2] |
+			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 : 0);
+
+		mtk_dp_write(mtk_dp, offset + i * 4, val);
+	}
+}
+
+static unsigned long mtk_dp_sip_atf_call(unsigned int cmd, unsigned int para)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32, cmd, para, 0, 0, 0, 0, 0,
+		      &res);
+
+	pr_debug("[DPTX]%s cmd 0x%x, p1 0x%x, ret 0x%lx-0x%lx", __func__, cmd,
+		 para, res.a0, res.a1);
+	return res.a1;
+}
+
+static void mtk_dp_msa_bypass_disable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030, 0,
+			   BIT(HTOTAL_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(VTOTAL_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(HSTART_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(VSTART_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(HWIDTH_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(VHEIGHT_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(HSP_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(HSW_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(VSP_SEL_DP_ENC0_P0_SHIFT) |
+				   BIT(VSW_SEL_DP_ENC0_P0_SHIFT));
+}
+
+static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)
+{
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3010, timings->htotal,
+			   HTOTAL_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3018,
+			   timings->vm.hsync_len + timings->vm.hback_porch,
+			   HSTART_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3028,
+			   timings->vm.hsync_len << HSW_SW_DP_ENC0_P0_SHIFT,
+			   HSW_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3028, 0,
+			   HSP_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3020, timings->vm.hactive,
+			   HWIDTH_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3014, timings->vtotal,
+			   VTOTAL_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_301C,
+			   timings->vm.vsync_len + timings->vm.vback_porch,
+			   VSTART_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_302C,
+			   timings->vm.vsync_len << VSW_SW_DP_ENC0_P0_SHIFT,
+			   VSW_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_302C, 0,
+			   VSP_SW_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3024, timings->vm.vactive,
+			   VHEIGHT_SW_DP_ENC0_P0_MASK);
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3064, timings->vm.hactive,
+			   HDE_NUM_LAST_DP_ENC0_P0_MASK);
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3154, timings->htotal,
+			   PGEN_HTOTAL_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3158,
+			   timings->vm.hfront_porch,
+			   PGEN_HSYNC_RISING_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_315C, timings->vm.hsync_len,
+			   PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3160,
+			   timings->vm.hback_porch + timings->vm.hsync_len,
+			   PGEN_HFDE_START_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3164, timings->vm.hactive,
+			   PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3168, timings->vtotal,
+			   PGEN_VTOTAL_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_316C,
+			   timings->vm.vfront_porch,
+			   PGEN_VSYNC_RISING_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3170, timings->vm.vsync_len,
+			   PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3174,
+			   timings->vm.vback_porch + timings->vm.vsync_len,
+			   PGEN_VFDE_START_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3178, timings->vm.vactive,
+			   PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
+				    enum mtk_dp_color_format color_format)
+{
+	u32 val;
+
+	mtk_dp->info.format = color_format;
+
+	// Update MISC0
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
+			   color_format << DP_TEST_COLOR_FORMAT_SHIFT,
+			   DP_TEST_COLOR_FORMAT_MASK);
+
+	switch (color_format) {
+	case MTK_DP_COLOR_FORMAT_YUV_422:
+		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
+		break;
+	case MTK_DP_COLOR_FORMAT_YUV_420:
+		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
+		break;
+	case MTK_DP_COLOR_FORMAT_YONLY:
+	case MTK_DP_COLOR_FORMAT_RAW:
+	case MTK_DP_COLOR_FORMAT_RESERVED:
+	case MTK_DP_COLOR_FORMAT_UNKNOWN:
+		drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n",
+			 color_format);
+		fallthrough;
+	case MTK_DP_COLOR_FORMAT_RGB_444:
+	case MTK_DP_COLOR_FORMAT_YUV_444:
+		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
+			   PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_set_color_depth(struct mtk_dp *mtk_dp,
+				   enum mtk_dp_color_depth color_depth)
+{
+	u32 val;
+
+	mtk_dp->info.depth = color_depth;
+
+	// Update MISC0
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
+			   color_depth << DP_TEST_BIT_DEPTH_SHIFT,
+			   DP_TEST_BIT_DEPTH_MASK);
+
+	switch (color_depth) {
+	case MTK_DP_COLOR_DEPTH_6BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_8BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_10BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_12BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_16BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_UNKNOWN:
+		drm_warn(mtk_dp->drm_dev, "Unsupported color depth %d\n",
+			 color_depth);
+		return;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
+			   VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_mn_overwrite_disable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
+			   VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_set_sram_read_start(struct mtk_dp *mtk_dp, u32 val)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
+			   val << SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT,
+			   SRAM_START_READ_THRD_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_setup_encoder(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
+			   BIT(VIDEO_MN_GEN_EN_DP_ENC0_P0_SHIFT),
+			   VIDEO_MN_GEN_EN_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3040,
+			   0x20 << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
+			   SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364,
+			   0x20 << SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT,
+			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3300,
+			   2 << VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_SHIFT,
+			   VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364,
+			   4 << FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT,
+			   FIFO_READ_START_POINT_DP_ENC1_P0_MASK);
+	mtk_dp_write(mtk_dp, MTK_DP_ENC1_P0_3368,
+		     1 << VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT |
+			     1 << VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT |
+			     BIT(SDP_DP13_EN_DP_ENC1_P0_SHIFT) |
+			     1 << BS2BS_MODE_DP_ENC1_P0_SHIFT);
+}
+
+static void mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3038, 0,
+			   VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK);
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31B0, BIT(6), BIT(6));
+}
+
+static void mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
+					struct mtk_dp_audio_cfg *cfg)
+{
+	u32 channel_enable_bits;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3324,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK);
+
+	//audio channel count change reset
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4 + 1, BIT(1), BIT(1));
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK,
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK,
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK);
+
+	switch (cfg->channels) {
+	case 2:
+		channel_enable_bits = AUDIO_2CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_2CH_EN_DP_ENC0_P0_MASK;
+		break;
+	case 8:
+	default:
+		channel_enable_bits = AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_8CH_EN_DP_ENC0_P0_MASK;
+		break;
+	}
+	mtk_dp_update_bits(
+		mtk_dp, MTK_DP_ENC0_P0_3088,
+		channel_enable_bits | AU_EN_DP_ENC0_P0_MASK,
+		AUDIO_2CH_SEL_DP_ENC0_P0_MASK | AUDIO_2CH_EN_DP_ENC0_P0_MASK |
+			AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+			AUDIO_8CH_EN_DP_ENC0_P0_MASK | AU_EN_DP_ENC0_P0_MASK);
+
+	//audio channel count change reset
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4 + 1, 0, BIT(1));
+
+	//enable audio reset
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(0), BIT(0));
+}
+
+static void mtk_dp_audio_channel_status_set(struct mtk_dp *mtk_dp,
+					    struct mtk_dp_audio_cfg *cfg)
+{
+	union mtk_dp_audio_channel_status channel_status;
+
+	memset(&channel_status, 0, sizeof(channel_status));
+
+	switch (cfg->sample_rate) {
+	case 32000:
+		channel_status.iec.sampling_freq = 3;
+		break;
+	case 44100:
+		channel_status.iec.sampling_freq = 0;
+		break;
+	case 48000:
+		channel_status.iec.sampling_freq = 2;
+		break;
+	case 88200:
+		channel_status.iec.sampling_freq = 8;
+		break;
+	case 96000:
+		channel_status.iec.sampling_freq = 0xA;
+		break;
+	case 192000:
+		channel_status.iec.sampling_freq = 0xE;
+		break;
+	default:
+		channel_status.iec.sampling_freq = 0x1;
+		break;
+	}
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		channel_status.iec.word_len = 0x02;
+		break;
+	case 20:
+		channel_status.iec.word_len = 0x03;
+		break;
+	case 24:
+		channel_status.iec.word_len = 0x0B;
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_308C,
+			   channel_status.buf[1] << 8 | channel_status.buf[0],
+			   CH_STATUS_0_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3090,
+			   channel_status.buf[3] << 8 | channel_status.buf[2],
+			   CH_STATUS_1_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3094, channel_status.buf[4],
+			   CH_STATUS_2_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
+					      int channels)
+{
+	if (channels != 2 && channels != 8)
+		channels = 8;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_312C,
+			   (channels - 1) << ASP_HB3_DP_ENC0_P0_SHIFT,
+			   ASP_HB2_DP_ENC0_P0_MASK | ASP_HB3_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp, u8 divider)
+{
+	mtk_dp_update_bits(
+		mtk_dp, MTK_DP_ENC0_P0_30BC,
+		divider << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT,
+		AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
+}
+
+static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
+{
+	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
+		  HPD_DB_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_sdp_trigger_packet(struct mtk_dp *mtk_dp,
+				      enum mtk_dp_sdp_type type)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, type,
+			   SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, SDP_PACKET_W_DP_ENC1_P0,
+			   SDP_PACKET_W_DP_ENC1_P0);
+}
+
+static void mtk_dp_sdp_set_data(struct mtk_dp *mtk_dp, u8 *data_bytes)
+{
+	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_ENC1_P0_3200, data_bytes, 0x10);
+}
+
+static void mtk_dp_sdp_set_header(struct mtk_dp *mtk_dp,
+				  enum mtk_dp_sdp_type type, u8 *header_bytes)
+{
+	u32 db_addr;
+
+	switch (type) {
+	case MTK_DP_SDP_DRM:
+		db_addr = MTK_DP_ENC0_P0_3138;
+		break;
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		db_addr = MTK_DP_ENC0_P0_3130;
+		break;
+	default:
+		db_addr = MTK_DP_ENC0_P0_30D8 + (type - MTK_DP_SDP_ACM) * 8;
+	}
+
+	mtk_dp_bulk_16bit_write(mtk_dp, db_addr, header_bytes, 4);
+}
+
+static const u32 mtk_dp_sdp_type_to_reg[MTK_DP_SDP_MAX_NUM] = {
+	/* MTK_DP_SDP_NONE => */ 0x0,
+	/* MTK_DP_SDP_ACM  => */ MTK_DP_ENC0_P0_30B4,
+	/* MTK_DP_SDP_ISRC => */ MTK_DP_ENC0_P0_30B4 + 1,
+	/* MTK_DP_SDP_AVI  => */ MTK_DP_ENC0_P0_30A4 + 1,
+	/* MTK_DP_SDP_AUI  => */ MTK_DP_ENC0_P0_30A8,
+	/* MTK_DP_SDP_SPD  => */ MTK_DP_ENC0_P0_30A8 + 1,
+	/* MTK_DP_SDP_MPEG => */ MTK_DP_ENC0_P0_30AC,
+	/* MTK_DP_SDP_NTSC => */ MTK_DP_ENC0_P0_30AC + 1,
+	/* MTK_DP_SDP_VSP  => */ MTK_DP_ENC0_P0_30B0,
+	/* MTK_DP_SDP_VSC  => */ MTK_DP_ENC0_P0_30B8,
+	/* MTK_DP_SDP_EXT  => */ MTK_DP_ENC0_P0_30B0 + 1,
+	/* MTK_DP_SDP_PPS0 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS1 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS2 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS3 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_DRM  => */ MTK_DP_ENC0_P0_31DC,
+};
+
+static void mtk_dp_disable_sdp(struct mtk_dp *mtk_dp, enum mtk_dp_sdp_type type)
+{
+	if (type == MTK_DP_SDP_NONE)
+		return;
+
+	// Disable periodic send
+	mtk_dp_write(mtk_dp, mtk_dp_sdp_type_to_reg[type], 0);
+}
+
+static void mtk_dp_setup_sdp(struct mtk_dp *mtk_dp,
+			     struct mtk_dp_sdp_packet *packet)
+{
+	mtk_dp_sdp_set_data(mtk_dp, packet->data);
+	mtk_dp_sdp_set_header(mtk_dp, packet->type, packet->header);
+
+	mtk_dp_disable_sdp(mtk_dp, packet->type);
+
+	switch (packet->type) {
+	case MTK_DP_SDP_NONE:
+		break;
+	case MTK_DP_SDP_ISRC:
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
+				   0x1C << ISRC1_HB3_DP_ENC0_P0_SHIFT,
+				   ISRC1_HB3_DP_ENC0_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, MTK_DP_SDP_ISRC,
+				   SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+
+		if (packet->header[3] & BIT(2))
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+					   BIT(ISRC_CONT_DP_ENC0_P0_SHIFT),
+					   ISRC_CONT_DP_ENC0_P0_MASK);
+		else
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC, 0,
+					   ISRC_CONT_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+				   SDP_PACKET_W_DP_ENC1_P0,
+				   SDP_PACKET_W_DP_ENC1_P0);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30B4,
+				   5 << ISRC_CFG_DP_ENC0_P0_SHIFT,
+				   ISRC_CFG_DP_ENC0_P0_MASK);
+		break;
+	case MTK_DP_SDP_DRM:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31DC,
+				   5 << HDR0_CFG_DP_ENC0_P0_SHIFT,
+				   HDR0_CFG_DP_ENC0_P0_MASK);
+		break;
+	case MTK_DP_SDP_ACM:
+	case MTK_DP_SDP_AVI:
+	case MTK_DP_SDP_AUI:
+	case MTK_DP_SDP_SPD:
+	case MTK_DP_SDP_MPEG:
+	case MTK_DP_SDP_NTSC:
+	case MTK_DP_SDP_VSP:
+	case MTK_DP_SDP_VSC:
+	case MTK_DP_SDP_EXT:
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		// Enable periodic sending
+		mtk_dp_update_bits(mtk_dp, mtk_dp_sdp_type_to_reg[packet->type],
+				   0x05, 0xff);
+		break;
+	default:
+		break;
+	}
+}
+
+static void mtk_dp_sdp_vsc_ext_disable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A0, 0,
+			   BIT(7) | BIT(8) | BIT(12));
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_328C, 0, BIT(7));
+}
+
+static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_write(
+		mtk_dp, MTK_DP_AUX_P0_3640,
+		BIT(AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT) |
+			BIT(AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT) |
+			BIT(AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT) |
+			BIT(AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_SHIFT) |
+			BIT(AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT) |
+			BIT(AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT) |
+			BIT(AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT));
+}
+
+static void mtk_dp_aux_set_cmd(struct mtk_dp *mtk_dp, u8 cmd, u32 addr)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3644, cmd,
+			   MCU_REQUEST_COMMAND_AUX_TX_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3648, addr,
+			   MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_364C, addr >> 16,
+			   MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK);
+}
+
+static void mtk_dp_aux_cmd_complete(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3650,
+			   BIT(MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_SHIFT),
+			   MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_MASK |
+				   PHY_FIFO_RST_AUX_TX_P0_MASK |
+				   MCU_REQ_DATA_NUM_AUX_TX_P0_MASK);
+}
+
+static void mtk_dp_aux_request_ready(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3630,
+			   BIT(AUX_TX_REQUEST_READY_AUX_TX_P0_SHIFT),
+			   AUX_TX_REQUEST_READY_AUX_TX_P0_MASK);
+}
+
+static void mtk_dp_aux_fill_write_fifo(struct mtk_dp *mtk_dp, u8 *buf,
+				       size_t length)
+{
+	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_AUX_P0_3708, buf, length);
+}
+
+static void mtk_dp_aux_read_rx_fifo(struct mtk_dp *mtk_dp, u8 *buf,
+				    size_t length, int read_delay)
+{
+	int read_pos;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3620, 0,
+			   AUX_RD_MODE_AUX_TX_P0_MASK);
+
+	for (read_pos = 0; read_pos < length; read_pos++) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3620,
+				   BIT(AUX_RX_FIFO_R_PULSE_TX_P0_SHIFT),
+				   AUX_RX_FIFO_READ_PULSE_TX_P0_MASK);
+		udelay(read_delay);
+		buf[read_pos] =
+			(u8)(mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3620) &
+			     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK >>
+				     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_SHIFT);
+	}
+}
+
+static void mtk_dp_aux_set_length(struct mtk_dp *mtk_dp, size_t length)
+{
+	if (length > 0) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3650,
+				   (length - 1)
+					   << MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT,
+				   MCU_REQ_DATA_NUM_AUX_TX_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C, 0,
+				   AUX_NO_LENGTH_AUX_TX_P0_MASK |
+					   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
+					   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
+	} else {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C,
+				   BIT(AUX_NO_LENGTH_AUX_TX_P0_SHIFT),
+				   AUX_NO_LENGTH_AUX_TX_P0_MASK |
+					   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
+					   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
+	}
+}
+
+static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
+{
+	int wait_reply = MTK_DP_AUX_WAIT_REPLY_COUNT;
+
+	while (--wait_reply) {
+		u32 aux_irq_status;
+
+		if (is_read) {
+			u32 fifo_status =
+				mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3618);
+
+			if (fifo_status &
+			    (AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK |
+			     AUX_RX_FIFO_FULL_AUX_TX_P0_MASK)) {
+				return 0;
+			}
+		}
+
+		aux_irq_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3640);
+		if (aux_irq_status & AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK)
+			return 0;
+
+		if (aux_irq_status & AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK)
+			return -ETIMEDOUT;
+
+		udelay(1);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
+				  u32 addr, u8 *buf, size_t length)
+{
+	int ret;
+	u32 reply_cmd;
+
+	if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
+			(cmd == DP_AUX_NATIVE_READ && !length)))
+		return -EINVAL;
+
+	if (!is_read)
+		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3704,
+				   BIT(AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT),
+				   AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MASK);
+
+	mtk_dp_aux_cmd_complete(mtk_dp);
+	mtk_dp_aux_irq_clear(mtk_dp);
+	udelay(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US);
+
+	mtk_dp_aux_set_cmd(mtk_dp, cmd, addr);
+	mtk_dp_aux_set_length(mtk_dp, length);
+
+	if (!is_read) {
+		if (length)
+			mtk_dp_aux_fill_write_fifo(mtk_dp, buf, length);
+
+		mtk_dp_update_bits(
+			mtk_dp, MTK_DP_AUX_P0_3704,
+			AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK,
+			AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK);
+	}
+
+	mtk_dp_aux_request_ready(mtk_dp);
+
+	ret = mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
+
+	reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
+		    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
+	if (ret || reply_cmd) {
+		u32 phy_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628) &
+				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
+		if (phy_status != AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
+			drm_err(mtk_dp->drm_dev,
+				"AUX Rx Aux hang, need SW reset\n");
+			ret = -EIO;
+		}
+
+		mtk_dp_aux_cmd_complete(mtk_dp);
+		mtk_dp_aux_irq_clear(mtk_dp);
+
+		udelay(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US);
+		return ret;
+	}
+
+	if (!length) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C, 0,
+				   AUX_NO_LENGTH_AUX_TX_P0_MASK |
+					   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
+					   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
+	} else if (is_read) {
+		int read_delay;
+
+		if (cmd == (DP_AUX_I2C_READ | DP_AUX_I2C_MOT) ||
+		    cmd == DP_AUX_I2C_READ)
+			read_delay = 500;
+		else
+			read_delay = 100;
+
+		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length, read_delay);
+	}
+
+	mtk_dp_aux_cmd_complete(mtk_dp);
+	mtk_dp_aux_irq_clear(mtk_dp);
+	udelay(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US);
+
+	return 0;
+}
+
+static bool mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp, int lane_num,
+					  int swingValue, int preEmphasis)
+{
+	u32 lane_shift = lane_num * DP_TX1_VOLT_SWING_SHIFT;
+
+	if (lane_num < 0 || lane_num > 3)
+		return false;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
+			   swingValue << (DP_TX0_VOLT_SWING_SHIFT + lane_shift),
+			   DP_TX0_VOLT_SWING_MASK << lane_shift);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
+			   preEmphasis << (DP_TX0_PRE_EMPH_SHIFT + lane_shift),
+			   DP_TX0_PRE_EMPH_MASK << lane_shift);
+
+	return true;
+}
+
+static void mtk_dp_reset_swing_pre_emphasis(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP, 0,
+			   DP_TX0_VOLT_SWING_MASK | DP_TX1_VOLT_SWING_MASK |
+				   DP_TX2_VOLT_SWING_MASK |
+				   DP_TX3_VOLT_SWING_MASK |
+				   DP_TX0_PRE_EMPH_MASK | DP_TX1_PRE_EMPH_MASK |
+				   DP_TX2_PRE_EMPH_MASK | DP_TX3_PRE_EMPH_MASK);
+}
+
+static void mtk_dp_fec_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
+			   enable ? BIT(FEC_EN_DP_TRANS_P0_SHIFT) : 0,
+			   FEC_EN_DP_TRANS_P0_MASK);
+}
+
+static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
+{
+	u32 irq_status = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_35D0) &
+		  SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK;
+
+	if (irq_status) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C8, irq_status,
+				   SW_IRQ_CLR_DP_TRANS_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C8, 0,
+				   SW_IRQ_CLR_DP_TRANS_P0_MASK);
+	}
+
+	return irq_status;
+}
+
+static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
+{
+	u32 irq_status =
+		mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3418) &
+		IRQ_STATUS_DP_TRANS_P0_MASK >> IRQ_STATUS_DP_TRANS_P0_SHIFT;
+
+	if (irq_status) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, irq_status,
+				   IRQ_CLR_DP_TRANS_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, 0,
+				   IRQ_CLR_DP_TRANS_P0_MASK);
+	}
+
+	return irq_status;
+}
+
+static void mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	u32 val = 0;
+
+	if (!enable)
+		val = IRQ_MASK_DP_TRANS_P0_DISC_IRQ |
+		      IRQ_MASK_DP_TRANS_P0_CONN_IRQ |
+		      IRQ_MASK_DP_TRANS_P0_INT_IRQ;
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, val,
+			   IRQ_MASK_DP_TRANS_P0_MASK);
+}
+
+void mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_342C,
+			   XTAL_FREQ_DP_TRANS_P0_DEFAULT,
+			   XTAL_FREQ_DP_TRANS_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
+			   BIT(FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT),
+			   FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
+			   BIT(AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT),
+			   AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
+			   SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_IRQ_MASK, IRQ_MASK_AUX_TOP_IRQ,
+			   IRQ_MASK_AUX_TOP_IRQ);
+}
+
+static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
+{
+	// Debounce threshold
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   8 << HPD_DEB_THD_DP_TRANS_P0_SHIFT,
+			   HPD_DEB_THD_DP_TRANS_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
+			    HPD_INT_THD_DP_TRANS_P0_UPPER_1100US)
+				   << HPD_INT_THD_DP_TRANS_P0_SHIFT,
+			   HPD_INT_THD_DP_TRANS_P0_MASK);
+
+	// Connect threshold 1.5ms + 5 x 0.1ms = 2ms
+	// Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   (5 << HPD_DISC_THD_DP_TRANS_P0_SHIFT) |
+				   (5 << HPD_CONN_THD_DP_TRANS_P0_SHIFT),
+			   HPD_DISC_THD_DP_TRANS_P0_MASK |
+				   HPD_CONN_THD_DP_TRANS_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
+			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
+			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_initialize_phy_settings(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
+			   DP_PWR_STATE_MASK);
+	mtk_dp_write(mtk_dp, DP_PHY_DIG_BIT_RATE, 0);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
+
+	mtk_dp_write(mtk_dp, MTK_DP_LANE0_DRIVING_PARAM_3,
+		     DRIVING_PARAM_3_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE1_DRIVING_PARAM_3,
+		     DRIVING_PARAM_3_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE2_DRIVING_PARAM_3,
+		     DRIVING_PARAM_3_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE3_DRIVING_PARAM_3,
+		     DRIVING_PARAM_3_DEFAULT);
+
+	mtk_dp_write(mtk_dp, MTK_DP_LANE0_DRIVING_PARAM_4,
+		     DRIVING_PARAM_4_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE1_DRIVING_PARAM_4,
+		     DRIVING_PARAM_4_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE2_DRIVING_PARAM_4,
+		     DRIVING_PARAM_4_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE3_DRIVING_PARAM_4,
+		     DRIVING_PARAM_4_DEFAULT);
+
+	mtk_dp_write(mtk_dp, MTK_DP_LANE0_DRIVING_PARAM_5,
+		     DRIVING_PARAM_5_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE1_DRIVING_PARAM_5,
+		     DRIVING_PARAM_5_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE2_DRIVING_PARAM_5,
+		     DRIVING_PARAM_5_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE3_DRIVING_PARAM_5,
+		     DRIVING_PARAM_5_DEFAULT);
+
+	mtk_dp_write(mtk_dp, MTK_DP_LANE0_DRIVING_PARAM_6,
+		     DRIVING_PARAM_6_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE1_DRIVING_PARAM_6,
+		     DRIVING_PARAM_6_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE2_DRIVING_PARAM_6,
+		     DRIVING_PARAM_6_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE3_DRIVING_PARAM_6,
+		     DRIVING_PARAM_6_DEFAULT);
+
+	mtk_dp_write(mtk_dp, MTK_DP_LANE0_DRIVING_PARAM_7,
+		     DRIVING_PARAM_7_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE1_DRIVING_PARAM_7,
+		     DRIVING_PARAM_7_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE2_DRIVING_PARAM_7,
+		     DRIVING_PARAM_7_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE3_DRIVING_PARAM_7,
+		     DRIVING_PARAM_7_DEFAULT);
+
+	mtk_dp_write(mtk_dp, MTK_DP_LANE0_DRIVING_PARAM_8,
+		     DRIVING_PARAM_8_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE1_DRIVING_PARAM_8,
+		     DRIVING_PARAM_8_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE2_DRIVING_PARAM_8,
+		     DRIVING_PARAM_8_DEFAULT);
+	mtk_dp_write(mtk_dp, MTK_DP_LANE3_DRIVING_PARAM_8,
+		     DRIVING_PARAM_8_DEFAULT);
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
+			   BIT(RX_REPLY_COMPLETE_MODE_AUX_TX_P0_SHIFT),
+			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0_MASK);
+}
+
+static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
+{
+	// modify timeout threshold = 1595 [12 : 8]
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_360C, 0x1595,
+			   AUX_TIMEOUT_THR_AUX_TX_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3658, 0,
+			   AUX_TX_OV_EN_AUX_TX_P0_MASK);
+	// 25 for 26M
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3634,
+			   25 << AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT,
+			   AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK);
+	// 13 for 26M
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3614,
+			   13 << AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT,
+			   AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_37C8,
+			   BIT(MTK_ATOP_EN_AUX_TX_P0_SHIFT),
+			   MTK_ATOP_EN_AUX_TX_P0_MASK);
+}
+
+static void mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
+			   VBID_VIDEO_MUTE_DP_ENC0_P0_MASK);
+	mtk_dp_set_color_format(mtk_dp, MTK_DP_COLOR_FORMAT_RGB_444);
+	mtk_dp_set_color_depth(mtk_dp, MTK_DP_COLOR_DEPTH_8BIT);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3368,
+			   1 << BS2BS_MODE_DP_ENC1_P0_SHIFT,
+			   BS2BS_MODE_DP_ENC1_P0_MASK);
+
+	// dp tx encoder reset all sw
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
+			   BIT(DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SHIFT),
+			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK);
+	mdelay(1);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
+			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_ssc_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
+			   DP_PWR_STATE_MASK);
+	mtk_dp_update_bits(mtk_dp, DP_PHY_DIG_PLL_CTL_1,
+			   enable ? TPLL_SSC_EN : 0, TPLL_SSC_EN);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
+
+	udelay(50);
+}
+
+
+static void mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_340C,
+			   BIT(DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_SHIFT),
+			   DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK);
+	mdelay(1);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_340C, 0,
+			   DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK);
+}
+
+
+static void mtk_dp_phyd_reset(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, DP_PHY_DIG_SW_RST, 0, DP_GLB_SW_RST_PHYD);
+	udelay(50);
+	mtk_dp_update_bits(mtk_dp, DP_PHY_DIG_SW_RST, DP_GLB_SW_RST_PHYD,
+			   DP_GLB_SW_RST_PHYD);
+}
+
+static void mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35F0,
+			   lanes == 0 ? 0 : BIT(3), BIT(3) | BIT(2));
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, lanes,
+			   LANE_NUM_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4,
+			   lanes << LANE_NUM_DP_TRANS_P0_SHIFT,
+			   LANE_NUM_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_set_tx_rate(struct mtk_dp *mtk_dp,
+			       enum mtk_dp_linkrate linkrate)
+{
+	u32 val;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
+			   DP_PWR_STATE_MASK);
+
+	switch (linkrate) {
+	default:
+		drm_err(mtk_dp->drm_dev,
+			"Implementation error, unknown linkrate %x\n",
+			linkrate);
+		fallthrough;
+	case MTK_DP_LINKRATE_RBR:
+		val = BIT_RATE_RBR;
+		break;
+	case MTK_DP_LINKRATE_HBR:
+		val = BIT_RATE_HBR;
+		break;
+	case MTK_DP_LINKRATE_HBR2:
+		val = BIT_RATE_HBR2;
+		break;
+	case MTK_DP_LINKRATE_HBR3:
+		val = BIT_RATE_HBR3;
+		break;
+	}
+	mtk_dp_write(mtk_dp, DP_PHY_DIG_BIT_RATE, val);
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
+}
+
+static void mtk_dp_set_idle_pattern(struct mtk_dp *mtk_dp, bool enable)
+{
+	const u32 val = POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK |
+			POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK |
+			POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK |
+			POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK;
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3580, enable ? val : 0, val);
+}
+
+static void mtk_dp_train_set_pattern(struct mtk_dp *mtk_dp, int pattern)
+{
+	if (pattern < 0 || pattern > 4) {
+		drm_err(mtk_dp->drm_dev,
+			"Implementation error, no such pattern %d\n", pattern);
+		return;
+	}
+
+	if (pattern == 1) // TPS1
+		mtk_dp_set_idle_pattern(mtk_dp, false);
+
+	mtk_dp_update_bits(
+		mtk_dp, MTK_DP_TRANS_P0_3400,
+		pattern ? BIT(pattern - 1) << PATTERN1_EN_DP_TRANS_P0_SHIFT : 0,
+		PATTERN1_EN_DP_TRANS_P0_MASK |
+			PATTERN2_EN_DP_TRANS_P0_MASK |
+			PATTERN3_EN_DP_TRANS_P0_MASK |
+			PATTERN4_EN_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_set_enhanced_frame_mode(struct mtk_dp *mtk_dp, bool enable)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
+			   enable ? BIT(ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT) : 0,
+			   ENHANCED_FRAME_EN_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_training_set_scramble(struct mtk_dp *mtk_dp, bool enable)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3404,
+			enable ? DP_SCR_EN_DP_TRANS_P0_MASK : 0,
+			DP_SCR_EN_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
+{
+	u32 val = BIT(VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT);
+
+	if (enable)
+		val |= BIT(VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
+			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
+				   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
+
+	if (mtk_dp->driver_data->is_edp)
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	else
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
+}
+
+static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
+{
+	if (mute) {
+		mtk_dp_update_bits(
+			mtk_dp, MTK_DP_ENC0_P0_3030,
+			BIT(VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT) |
+				BIT(VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT),
+			VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088, 0,
+				   AU_EN_DP_ENC0_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4, 0,
+				   AU_TS_CFG_DP_ENC0_P0_MASK);
+
+	} else {
+		mtk_dp_update_bits(
+			mtk_dp, MTK_DP_ENC0_P0_3030, 0,
+			VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+				   BIT(AU_EN_DP_ENC0_P0_SHIFT),
+				   AU_EN_DP_ENC0_P0_MASK);
+		// Send one every two frames
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4, 0x0F,
+				   AU_TS_CFG_DP_ENC0_P0_MASK);
+	}
+}
+
+static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, 0,
+			   SW_RST_B_PHYD);
+	udelay(10);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, SW_RST_B_PHYD,
+			   SW_RST_B_PHYD);
+}
+
+static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
+	udelay(10);
+	mtk_dp_write(mtk_dp, 0x0034, 0x4AA);
+	mtk_dp_write(mtk_dp, 0x1040, 0x0);
+	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
+		     0x550 | BIT(FUSE_SEL_SHIFT) | BIT(MEM_ISO_EN_SHIFT));
+}
+
+static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
+{
+	mtk_dp->training_info.link_rate = MTK_DP_LINKRATE_HBR2;
+	mtk_dp->training_info.lane_count = MTK_DP_MAX_LANES;
+	mtk_dp->training_info.sink_ext_cap = false;
+	mtk_dp->training_info.sink_ssc = false;
+	mtk_dp->training_info.tps3 = true;
+	mtk_dp->training_info.tps4 = true;
+	mtk_dp->training_info.irq_status = 0;
+	mtk_dp->training_info.cable_plugged_in = false;
+	mtk_dp->training_info.cable_state_change = false;
+	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+	mtk_dp->train_state_pre = MTK_DP_TRAIN_STATE_STARTUP;
+	mtk_dp->state = MTK_DP_STATE_INITIAL;
+
+	mtk_dp->info.format = MTK_DP_COLOR_FORMAT_RGB_444;
+	mtk_dp->info.depth = MTK_DP_COLOR_DEPTH_8BIT;
+	memset(&mtk_dp->info.timings, 0,
+		sizeof(struct mtk_dp_timings));
+	mtk_dp->info.timings.frame_rate = 60;
+
+	mtk_dp->power_enabled = false;
+	mtk_dp->video_enable = false;
+	mtk_dp->dp_ready = false;
+	mtk_dp->has_fec = false;
+	mtk_dp->audio_enable = false;
+}
+
+static void mtk_dp_sdp_set_down_cnt_init(struct mtk_dp *mtk_dp,
+					 u32 Sram_Read_Start)
+{
+	u32 sdp_down_cnt_init = 0;
+	u32 dc_offset;
+
+	if (mtk_dp->info.timings.pix_rate_khz > 0)
+		sdp_down_cnt_init = Sram_Read_Start *
+				    mtk_dp->training_info.link_rate * 2700 * 8 /
+				    (mtk_dp->info.timings.pix_rate_khz * 4);
+
+	switch (mtk_dp->training_info.lane_count) {
+	case 1:
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x1A ?
+			sdp_down_cnt_init : 0x1A;  //26
+		break;
+	case 2:
+		// case for LowResolution && High Audio Sample Rate
+		dc_offset = mtk_dp->info.timings.vtotal <= 525 ?
+			0x04 : 0x00;
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x10 ?
+			sdp_down_cnt_init : 0x10 + dc_offset; //20 or 16
+		break;
+	case 4:
+	default:
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x06 ?
+			sdp_down_cnt_init : 0x06; //6
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3040,
+			   sdp_down_cnt_init
+				   << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
+			   SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
+{
+	int pix_clk_mhz;
+	u32 dc_offset;
+	u32 spd_down_cnt_init = 0;
+
+	pix_clk_mhz = mtk_dp->info.format == MTK_DP_COLOR_FORMAT_YUV_420 ?
+		mtk_dp->info.timings.pix_rate_khz/2000 :
+		mtk_dp->info.timings.pix_rate_khz/1000;
+
+	switch (mtk_dp->training_info.lane_count) {
+	case 1:
+		spd_down_cnt_init = 0x20;
+		break;
+	case 2:
+		dc_offset = (mtk_dp->info.timings.vtotal <= 525) ? 0x14 : 0x00;
+		spd_down_cnt_init = 0x18 + dc_offset;
+		break;
+	case 4:
+	default:
+		dc_offset = (mtk_dp->info.timings.vtotal <= 525) ? 0x08 : 0x00;
+		if (pix_clk_mhz > mtk_dp->training_info.link_rate * 27)
+			spd_down_cnt_init = 0x8;
+		else
+			spd_down_cnt_init = 0x10 + dc_offset;
+		break;
+	}
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364, spd_down_cnt_init,
+			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
+}
+
+static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
+{
+	u32 sram_read_start = MTK_DP_TBC_BUF_READ_START_ADDR;
+
+	if (mtk_dp->training_info.lane_count > 0) {
+		sram_read_start =
+			min_t(u32, MTK_DP_TBC_BUF_READ_START_ADDR,
+			      mtk_dp->info.timings.vm.hactive /
+				      (mtk_dp->training_info.lane_count *
+				       4 * 2 * 2));
+		mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
+	}
+
+	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
+}
+
+static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
+{
+	int ubTargetFrameRate = 60;
+	int ulTargetPixelclk;
+
+	if (mtk_dp->info.timings.frame_rate > 0) {
+		ubTargetFrameRate = mtk_dp->info.timings.frame_rate;
+		ulTargetPixelclk = (int)mtk_dp->info.timings.htotal *
+				   (int)mtk_dp->info.timings.vtotal *
+				   ubTargetFrameRate;
+	} else if (mtk_dp->info.timings.pix_rate_khz > 0) {
+		ulTargetPixelclk = mtk_dp->info.timings.pix_rate_khz * 1000;
+	} else {
+		ulTargetPixelclk = (int)mtk_dp->info.timings.htotal *
+				   (int)mtk_dp->info.timings.vtotal *
+				   ubTargetFrameRate;
+	}
+
+	if (ulTargetPixelclk > 0)
+		mtk_dp->info.timings.pix_rate_khz = ulTargetPixelclk / 1000;
+}
+
+static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_msa_bypass_disable(mtk_dp);
+	mtk_dp_calculate_pixrate(mtk_dp);
+	mtk_dp_pg_disable(mtk_dp);
+	mtk_dp_setup_tu(mtk_dp);
+}
+
+static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
+{
+	ssize_t ret;
+	u8 sink_count;
+	u8 link_status[DP_LINK_STATUS_SIZE] = {};
+	u32 sink_count_reg;
+	u32 link_status_reg;
+	bool locked;
+
+	if (mtk_dp->training_info.sink_ext_cap) {
+		sink_count_reg = DP_SINK_COUNT_ESI;
+		link_status_reg = DP_LANE0_1_STATUS_ESI;
+	} else {
+		sink_count_reg = DP_SINK_COUNT;
+		link_status_reg = DP_LANE0_1_STATUS;
+	}
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg, &sink_count);
+	if (ret < 0) {
+		drm_info(mtk_dp->drm_dev,
+			 "Read sink count failed: %ld\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	if (ret < 0) {
+		drm_info(mtk_dp->drm_dev,
+			 "Read DP_SINK_COUNT_ESI failed: %ld\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg, link_status,
+			       sizeof(link_status));
+	if (!ret) {
+		drm_info(mtk_dp->drm_dev, "Read link status failed: %ld\n",
+			 ret);
+		return;
+	}
+
+	locked = drm_dp_channel_eq_ok(link_status,
+				      mtk_dp->training_info.lane_count);
+	if (!locked && mtk_dp->train_state > MTK_DP_TRAIN_STATE_TRAINING_PRE)
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
+
+	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
+				   DP_REMOTE_CONTROL_COMMAND_PENDING);
+
+	if (DP_GET_SINK_COUNT(sink_count) &&
+	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
+		mtk_dp->training_info.check_cap_count = 0;
+		kfree(mtk_dp->edid);
+		mtk_dp->edid = NULL;
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;
+		mdelay(20);
+	}
+}
+
+static void mtk_dp_sdp_stop_sending(struct mtk_dp *mtk_dp)
+{
+	u8 packet_type;
+
+	for (packet_type = MTK_DP_SDP_ACM; packet_type < MTK_DP_SDP_MAX_NUM;
+	     packet_type++)
+		mtk_dp_disable_sdp(mtk_dp, packet_type);
+
+	mtk_dp_sdp_vsc_ext_disable(mtk_dp);
+}
+
+static int mtk_dp_train_hpd_handle(struct mtk_dp *mtk_dp)
+{
+	int ret = 0;
+
+	if (mtk_dp->training_info.cable_state_change) {
+		mtk_dp->training_info.cable_state_change = false;
+
+		if (!mtk_dp->training_info.cable_plugged_in ||
+		    !mtk_dp_plug_state(mtk_dp)) {
+			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
+
+			mtk_dp_initialize_priv_data(mtk_dp);
+			mtk_dp_set_idle_pattern(mtk_dp, true);
+			if (mtk_dp->has_fec)
+				mtk_dp_fec_enable(mtk_dp, false);
+			mtk_dp_sdp_stop_sending(mtk_dp);
+			mtk_dp_power_disable(mtk_dp);
+
+			clk_disable_unprepare(mtk_dp->dp_tx_clk);
+
+			kfree(mtk_dp->edid);
+			mtk_dp->edid = NULL;
+			ret = -ENODEV;
+		}
+	}
+
+	if (mtk_dp->training_info.irq_status & MTK_DP_HPD_INTERRUPT) {
+		mtk_dp->training_info.irq_status &= ~MTK_DP_HPD_INTERRUPT;
+		mtk_dp_hpd_sink_event(mtk_dp);
+	}
+
+	return ret;
+}
+
+static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
+					    u8 dpcd_adjust_req[2])
+{
+	int lane;
+
+	for (lane = 0; lane < lanes; ++lane) {
+		u8 val;
+		u8 swing;
+		u8 preemphasis;
+		int index = lane / 2;
+		int shift = lane % 2 ? DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT : 0;
+
+		swing = (dpcd_adjust_req[index] >> shift) &
+			DP_ADJUST_VOLTAGE_SWING_LANE0_MASK;
+		preemphasis = ((dpcd_adjust_req[index] >> shift) &
+			       DP_ADJUST_PRE_EMPHASIS_LANE0_MASK) >>
+			      DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT;
+		val = swing << DP_TRAIN_VOLTAGE_SWING_SHIFT |
+		      preemphasis << DP_TRAIN_PRE_EMPHASIS_SHIFT;
+
+		if (swing == DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
+			val |= DP_TRAIN_MAX_SWING_REACHED;
+		if (preemphasis == 3)
+			val |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
+
+		mtk_dp_set_swing_pre_emphasis(mtk_dp, lane, swing, preemphasis);
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_LANE0_SET + lane,
+				   val);
+	}
+
+	// Wait for the signal to be stable enough
+	mdelay(2);
+}
+
+static void mtk_dp_read_link_status(struct mtk_dp *mtk_dp,
+				    u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	drm_dp_dpcd_read(&mtk_dp->aux, DP_LANE0_1_STATUS, link_status,
+			 DP_LINK_STATUS_SIZE);
+
+	if (mtk_dp->training_info.sink_ext_cap)
+		drm_dp_dpcd_read(&mtk_dp->aux,
+				 DP_LANE0_1_STATUS_ESI,
+				 link_status, 3);
+}
+
+static int mtk_dp_train_flow(struct mtk_dp *mtk_dp, int link_rate,
+			     int lane_count)
+{
+	u8 link_status[DP_LINK_STATUS_SIZE] = {};
+	int target_link_rate = link_rate;
+	int target_lane_count = lane_count;
+	u8 lane_adjust[2] = {};
+	bool pass_tps1 = false;
+	bool pass_tps2_3 = false;
+	int train_retries;
+	int status_control;
+	int iteration_count;
+	u8 prev_lane_adjust;
+	u8 val;
+
+	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SET_POWER, &val);
+	if (val != DP_SET_POWER_D0) {
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+		mdelay(1);
+	}
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LINK_BW_SET, target_link_rate);
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
+			   target_lane_count | DP_LANE_COUNT_ENHANCED_FRAME_EN);
+
+	if (mtk_dp->training_info.sink_ssc)
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DOWNSPREAD_CTRL,
+				   DP_SPREAD_AMP_0_5);
+
+	train_retries = 0;
+	status_control = 0;
+	iteration_count = 1;
+	prev_lane_adjust = 0xFF;
+
+	mtk_dp_set_lanes(mtk_dp, target_lane_count/2);
+	mtk_dp_set_tx_rate(mtk_dp, target_link_rate);
+
+	do {
+		train_retries++;
+		if (!mtk_dp->training_info.cable_plugged_in ||
+			((mtk_dp->training_info.irq_status & MTK_DP_HPD_DISCONNECT)
+				!= 0x0)) {
+			return -ENODEV;
+		}
+
+		if (mtk_dp->train_state < MTK_DP_TRAIN_STATE_TRAINING)
+			return -EAGAIN;
+
+		if (!pass_tps1)	{
+			mtk_dp_training_set_scramble(mtk_dp, false);
+
+			if (status_control == 0x0) {
+				mtk_dp_train_set_pattern(mtk_dp, 1);
+				status_control = 0x1;
+				val = DP_LINK_SCRAMBLING_DISABLE |
+				      DP_TRAINING_PATTERN_1;
+				drm_dp_dpcd_writeb(
+					&mtk_dp->aux, DP_TRAINING_PATTERN_SET,
+					DP_LINK_SCRAMBLING_DISABLE |
+						DP_TRAINING_PATTERN_1);
+				drm_dp_dpcd_read(&mtk_dp->aux,
+						 DP_ADJUST_REQUEST_LANE0_1,
+						 lane_adjust,
+						 sizeof(lane_adjust));
+				iteration_count++;
+
+				mtk_dp_train_update_swing_pre(mtk_dp,
+					target_lane_count, lane_adjust);
+			}
+
+			drm_dp_link_train_clock_recovery_delay(&mtk_dp->aux,
+							       mtk_dp->rx_cap);
+			mtk_dp_read_link_status(mtk_dp, link_status);
+
+			if (drm_dp_clock_recovery_ok(link_status,
+				target_lane_count)) {
+				mtk_dp->training_info.cr_done = true;
+				pass_tps1 = true;
+				train_retries = 0;
+				iteration_count = 1;
+			} else {
+				//request swing & emp is the same eith last time
+				if (prev_lane_adjust == link_status[4]) {
+					iteration_count++;
+					if (prev_lane_adjust &
+					    DP_ADJUST_VOLTAGE_SWING_LANE0_MASK)
+						iteration_count =
+							MTK_DP_TRAIN_MAX_ITERATIONS;
+				} else {
+					prev_lane_adjust = link_status[4];
+				}
+			}
+		} else if (pass_tps1 && !pass_tps2_3) {
+			if (status_control == 0x1) {
+				if (mtk_dp->training_info.tps4) {
+					mtk_dp_train_set_pattern(mtk_dp, 4);
+					val = DP_TRAINING_PATTERN_4;
+				} else if (mtk_dp->training_info.tps3) {
+					mtk_dp_train_set_pattern(mtk_dp, 3);
+					val = DP_LINK_SCRAMBLING_DISABLE |
+					      DP_TRAINING_PATTERN_3;
+				} else {
+					mtk_dp_train_set_pattern(mtk_dp, 2);
+					val = DP_LINK_SCRAMBLING_DISABLE |
+					      DP_TRAINING_PATTERN_2;
+				}
+				drm_dp_dpcd_writeb(&mtk_dp->aux,
+						   DP_TRAINING_PATTERN_SET,
+						   val);
+
+				status_control = 0x2;
+				drm_dp_dpcd_read(&mtk_dp->aux,
+						 DP_ADJUST_REQUEST_LANE0_1,
+						 lane_adjust,
+						 sizeof(lane_adjust));
+
+				iteration_count++;
+				mtk_dp_train_update_swing_pre(
+					mtk_dp, target_lane_count, lane_adjust);
+			}
+
+			drm_dp_link_train_channel_eq_delay(&mtk_dp->aux,
+							   mtk_dp->rx_cap);
+
+			mtk_dp_read_link_status(mtk_dp, link_status);
+
+			if (!drm_dp_clock_recovery_ok(link_status,
+						      target_lane_count)) {
+				mtk_dp->training_info.cr_done = false;
+				mtk_dp->training_info.eq_done = false;
+				break;
+			}
+
+			if (drm_dp_channel_eq_ok(link_status,
+						 target_lane_count)) {
+				mtk_dp->training_info.eq_done = true;
+				pass_tps2_3 = true;
+				break;
+			}
+
+			if (prev_lane_adjust == link_status[4])
+				iteration_count++;
+			else
+				prev_lane_adjust = link_status[4];
+		}
+	} while (train_retries < MTK_DP_TRAIN_RETRY_LIMIT &&
+		 iteration_count < MTK_DP_TRAIN_MAX_ITERATIONS);
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_PATTERN_SET,
+			   DP_TRAINING_PATTERN_DISABLE);
+	mtk_dp_train_set_pattern(mtk_dp, 0);
+
+	if (pass_tps2_3) {
+		mtk_dp->training_info.link_rate = target_link_rate;
+		mtk_dp->training_info.lane_count = target_lane_count;
+
+		mtk_dp_training_set_scramble(mtk_dp, true);
+
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
+				   target_lane_count |
+					   DP_LANE_COUNT_ENHANCED_FRAME_EN);
+		mtk_dp_set_enhanced_frame_mode(mtk_dp, true);
+
+		return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
+static void mtk_dp_fec_set_capabilities(struct mtk_dp *mtk_dp)
+{
+	u8 fec_capabilities;
+
+	drm_dp_dpcd_readb(&mtk_dp->aux, DP_FEC_CAPABILITY, &fec_capabilities);
+
+	mtk_dp->has_fec = !!(fec_capabilities & DP_FEC_CAPABILITY);
+	if (!mtk_dp->has_fec)
+		return;
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_FEC_CONFIGURATION,
+			   DP_FEC_BIT_ERROR_COUNT | DP_FEC_READY);
+}
+
+static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
+{
+	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
+	u8 val;
+	struct mtk_dp_train_info *train_info = &mtk_dp->training_info;
+
+	if (!mtk_dp_plug_state(mtk_dp))
+		return false;
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+	mdelay(2);
+
+	drm_dp_dpcd_read(&mtk_dp->aux, DP_DPCD_REV, buf, sizeof(buf));
+
+	train_info->sink_ext_cap = false;
+	if (buf[DP_DPCD_REV] >= DP_DPCD_REV_13)
+		train_info->sink_ext_cap =
+			!!(buf[DP_TRAINING_AUX_RD_INTERVAL] &
+			   DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT);
+
+	if (train_info->sink_ext_cap)
+		drm_dp_dpcd_read(&mtk_dp->aux, DP_DP13_DPCD_REV, buf,
+				 sizeof(buf));
+
+	memcpy(mtk_dp->rx_cap, buf, min(sizeof(mtk_dp->rx_cap), sizeof(buf)));
+	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &= DP_TRAINING_AUX_RD_MASK;
+
+	if (buf[DP_DPCD_REV] >= DP_DPCD_REV_14)
+		mtk_dp_fec_set_capabilities(mtk_dp);
+
+	train_info->link_rate =
+		min_t(u8, MTK_DP_MAX_LINK_RATE, buf[DP_MAX_LINK_RATE]);
+	train_info->lane_count = min(
+		MTK_DP_MAX_LANES, buf[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK);
+
+	train_info->tps3 = !!(buf[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED);
+	train_info->tps4 = !!(buf[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED);
+
+	train_info->sink_ssc =
+		!!(buf[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
+
+	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
+	if (val & DP_MST_CAP) {
+		// Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0
+		drm_dp_dpcd_readb(&mtk_dp->aux,
+				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0, &val);
+		if (val)
+			drm_dp_dpcd_writeb(&mtk_dp->aux,
+					   DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
+					   val);
+	}
+
+	return true;
+}
+
+static int mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
+						struct mtk_dp_audio_cfg *cfg)
+{
+	struct cea_sad *sads;
+	int sad_count;
+	int i;
+	int ret = 0;
+
+	if (mtk_dp->edid == NULL) {
+		pr_err("EDID not found!\n");
+		return -EINVAL;
+	}
+
+	sad_count = drm_edid_to_sad(mtk_dp->edid, &sads);
+	if (sad_count <= 0) {
+		drm_info(mtk_dp->drm_dev, "The SADs is NULL\n");
+		return 0;
+	}
+
+	for (i = 0; i < sad_count; i++) {
+		int sample_rate;
+		int word_length;
+		// Only PCM supported at the moment
+		if (sads[i].format != HDMI_AUDIO_CODING_TYPE_PCM)
+			continue;
+
+		sample_rate = drm_cea_sad_get_sample_rate(&sads[i]);
+		word_length =
+			drm_cea_sad_get_uncompressed_word_length(&sads[i]);
+		if (sample_rate <= 0 || word_length <= 0)
+			continue;
+
+		cfg->channels = sads[i].channels;
+		cfg->word_length_bits = word_length;
+		cfg->sample_rate = sample_rate;
+		ret = 1;
+		break;
+	}
+	kfree(sads);
+
+	return ret;
+}
+
+static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_phyd_reset(mtk_dp);
+	mtk_dp_reset_swing_pre_emphasis(mtk_dp);
+	mtk_dp_ssc_enable(mtk_dp, mtk_dp->training_info.sink_ssc);
+
+	mdelay(2);
+}
+
+static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
+{
+	int ret = 0;
+	int lane_count;
+	int link_rate;
+	int train_limit;
+	int max_link_rate;
+	int plug_wait;
+
+	for (plug_wait = 7; !mtk_dp_plug_state(mtk_dp) && plug_wait > 0;
+	     --plug_wait)
+		mdelay(1);
+	if (plug_wait == 0) {
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
+		return -ENODEV;
+	}
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+
+	link_rate = mtk_dp->rx_cap[1];
+	lane_count = mtk_dp->rx_cap[2] & 0x1F;
+
+	mtk_dp->training_info.link_rate = min(MTK_DP_MAX_LINK_RATE, link_rate);
+	mtk_dp->training_info.lane_count =
+		min(MTK_DP_MAX_LANES, lane_count);
+	link_rate = mtk_dp->training_info.link_rate;
+	lane_count = mtk_dp->training_info.lane_count;
+
+	switch (link_rate) {
+	case MTK_DP_LINKRATE_RBR:
+	case MTK_DP_LINKRATE_HBR:
+	case MTK_DP_LINKRATE_HBR2:
+	case MTK_DP_LINKRATE_HBR25:
+	case MTK_DP_LINKRATE_HBR3:
+		break;
+	default:
+		mtk_dp->training_info.link_rate = MTK_DP_LINKRATE_HBR3;
+		break;
+	};
+
+	max_link_rate = link_rate;
+	for (train_limit = 0; train_limit <= 6; ++train_limit) {
+		mtk_dp->training_info.cr_done = false;
+		mtk_dp->training_info.eq_done = false;
+
+		mtk_dp_train_change_mode(mtk_dp);
+		ret = mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
+		if (ret == -ENODEV || ret == -EAGAIN)
+			return ret;
+
+		if (!mtk_dp->training_info.cr_done) {
+			switch (link_rate) {
+			case MTK_DP_LINKRATE_RBR:
+				lane_count = lane_count/2;
+				link_rate = max_link_rate;
+				if (lane_count == 0x0) {
+					mtk_dp->train_state
+						= MTK_DP_TRAIN_STATE_DPIDLE;
+					return -EIO;
+				}
+				break;
+			case MTK_DP_LINKRATE_HBR:
+				link_rate = MTK_DP_LINKRATE_RBR;
+				break;
+			case MTK_DP_LINKRATE_HBR2:
+				link_rate = MTK_DP_LINKRATE_HBR;
+				break;
+			case MTK_DP_LINKRATE_HBR3:
+				link_rate = MTK_DP_LINKRATE_HBR2;
+				break;
+			default:
+				return -EINVAL;
+			};
+		} else if (!mtk_dp->training_info.eq_done) {
+			lane_count /= 2;
+			if (lane_count == 0)
+				return -EIO;
+		} else
+			return 0;
+
+	}
+
+	return -ETIMEDOUT;
+}
+
+static struct edid *mtk_dp_handle_edid(struct mtk_dp *mtk_dp)
+{
+	struct drm_connector *connector = &mtk_dp->conn;
+
+	/* use cached edid if we have one */
+	if (mtk_dp->edid) {
+		/* invalid edid */
+		if (IS_ERR(mtk_dp->edid))
+			return NULL;
+
+		return drm_edid_duplicate(mtk_dp->edid);
+	}
+
+	return drm_get_edid(connector, &mtk_dp->aux.ddc);
+}
+
+static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
+{
+	int ret = 0;
+
+	ret = mtk_dp_train_hpd_handle(mtk_dp);
+
+	if (!mtk_dp->training_info.cable_plugged_in)
+		return -ENODEV;
+
+	if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
+		return ret;
+
+	mtk_dp->train_state_pre = mtk_dp->train_state;
+
+	switch (mtk_dp->train_state) {
+	case MTK_DP_TRAIN_STATE_STARTUP:
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
+		break;
+
+	case MTK_DP_TRAIN_STATE_CHECKCAP:
+		if (mtk_dp_parse_capabilities(mtk_dp)) {
+			mtk_dp->training_info.check_cap_count = 0;
+			mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;
+		} else {
+			mtk_dp->training_info.check_cap_count++;
+
+			if (mtk_dp->training_info.check_cap_count >
+			    MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT) {
+				mtk_dp->training_info.check_cap_count = 0;
+				mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
+				ret = -ETIMEDOUT;
+			}
+		}
+		break;
+
+	case MTK_DP_TRAIN_STATE_CHECKEDID:
+		mtk_dp->edid = mtk_dp_handle_edid(mtk_dp);
+		if (mtk_dp->edid) {
+			int caps_found;
+
+			memset(&mtk_dp->info.audio_caps, 0,
+			       sizeof(mtk_dp->info.audio_caps));
+			caps_found = mtk_dp_edid_parse_audio_capabilities(
+				mtk_dp, &mtk_dp->info.audio_caps);
+			if (caps_found > 0)
+				mtk_dp->audio_enable = true;
+		} else
+			drm_info(mtk_dp->drm_dev, "Read EDID Fail!\n");
+
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
+		break;
+
+	case MTK_DP_TRAIN_STATE_TRAINING_PRE:
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
+		break;
+
+	case MTK_DP_TRAIN_STATE_TRAINING:
+		ret = mtk_dp_train_start(mtk_dp);
+		if (!ret) {
+			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
+			mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKTIMING;
+			mtk_dp->dp_ready = true;
+			mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
+		}  else if (ret != -EAGAIN)
+			mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
+
+		ret = 0;
+		break;
+
+	case MTK_DP_TRAIN_STATE_CHECKTIMING:
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;
+		break;
+	case MTK_DP_TRAIN_STATE_NORMAL:
+		break;
+	case MTK_DP_TRAIN_STATE_POWERSAVE:
+		break;
+	case MTK_DP_TRAIN_STATE_DPIDLE:
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	if (enable) {
+		mtk_dp_set_tx_out(mtk_dp);
+		mtk_dp_video_mute(mtk_dp, false);
+	} else {
+		mtk_dp_video_mute(mtk_dp, true);
+	}
+}
+
+static void mtk_dp_audio_sdp_setup(struct mtk_dp *mtk_dp,
+	struct mtk_dp_audio_cfg *cfg)
+{
+	struct mtk_dp_sdp_packet packet;
+	struct hdmi_audio_infoframe frame;
+
+	hdmi_audio_infoframe_init(&frame);
+	frame.coding_type = HDMI_AUDIO_CODING_TYPE_PCM;
+	frame.channels = cfg->channels;
+	frame.sample_frequency = cfg->sample_rate;
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		break;
+	case 20:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_20;
+		break;
+	case 24:
+	default:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_24;
+		break;
+	}
+
+	packet.type = MTK_DP_SDP_AUI;
+	hdmi_audio_infoframe_pack_for_dp(&frame, packet.header,
+					 sizeof(packet.header), packet.data,
+					 sizeof(packet.data),
+					 MTK_DP_DP_VERSION_11);
+
+	mtk_dp_audio_sdp_asp_set_channels(mtk_dp, cfg->channels);
+	mtk_dp_setup_sdp(mtk_dp, &packet);
+}
+
+static void mtk_dp_audio_setup(struct mtk_dp *mtk_dp,
+			       struct mtk_dp_audio_cfg *cfg)
+{
+	mtk_dp_audio_sdp_setup(mtk_dp, cfg);
+	mtk_dp_audio_channel_status_set(mtk_dp, cfg);
+
+	mtk_dp_audio_setup_channels(mtk_dp, cfg);
+	mtk_dp_audio_set_divider(mtk_dp, 5);
+}
+
+static void mtk_dp_video_config(struct mtk_dp *mtk_dp)
+{
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	if (!mtk_dp->dp_ready) {
+		pr_err("%s, DP is not ready!\n", __func__);
+		return;
+	}
+
+	drm_display_mode_to_videomode(&mtk_dp->mode, &timings->vm);
+
+	timings->frame_rate = mtk_dp->mode.clock * 1000 / mtk_dp->mode.htotal /
+			      mtk_dp->mode.vtotal;
+	timings->htotal = mtk_dp->mode.htotal;
+	timings->vtotal = mtk_dp->mode.vtotal;
+
+	mtk_dp_mn_overwrite_disable(mtk_dp);
+
+	mtk_dp_set_msa(mtk_dp);
+
+	mtk_dp_set_color_depth(mtk_dp, mtk_dp->info.depth);
+	mtk_dp_set_color_format(mtk_dp, mtk_dp->info.format);
+}
+
+static int mtk_dp_state_handler(struct mtk_dp *mtk_dp)
+{
+	int ret = 0;
+
+	if (!mtk_dp->training_info.cable_plugged_in)
+		return -ENODEV;
+
+	switch (mtk_dp->state) {
+	case MTK_DP_STATE_INITIAL:
+		mtk_dp_video_mute(mtk_dp, true);
+		mtk_dp_audio_mute(mtk_dp, true);
+		mtk_dp->state = MTK_DP_STATE_IDLE;
+		break;
+
+	case MTK_DP_STATE_IDLE:
+		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
+			mtk_dp->state = MTK_DP_STATE_PREPARE;
+		break;
+
+	case MTK_DP_STATE_PREPARE:
+		if (mtk_dp->video_enable) {
+			mtk_dp_video_config(mtk_dp);
+			mtk_dp_video_enable(mtk_dp, true);
+		}
+
+		if (mtk_dp->audio_enable) {
+			mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+			mtk_dp_audio_mute(mtk_dp, false);
+		}
+
+		mtk_dp->state = MTK_DP_STATE_NORMAL;
+		break;
+
+	case MTK_DP_STATE_NORMAL:
+		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
+			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
+			mtk_dp_sdp_stop_sending(mtk_dp);
+			mtk_dp->state = MTK_DP_STATE_IDLE;
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static void mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
+{
+	bool connected;
+	u16 swirq_status = mtk_dp_swirq_get_clear(mtk_dp);
+	u8 hwirq_status =  mtk_dp_hwirq_get_clear(mtk_dp);
+	struct mtk_dp_train_info *train_info = &mtk_dp->training_info;
+
+	train_info->irq_status |= hwirq_status | swirq_status;
+
+	if (!train_info->irq_status)
+		return;
+
+	connected = mtk_dp_plug_state(mtk_dp);
+	if (connected || !train_info->cable_plugged_in)
+		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
+	else if (!connected || train_info->cable_plugged_in)
+		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
+
+	if (!(train_info->irq_status &
+	      (MTK_DP_HPD_CONNECT | MTK_DP_HPD_DISCONNECT)))
+		return;
+
+	if (train_info->irq_status & MTK_DP_HPD_CONNECT) {
+		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
+		train_info->cable_plugged_in = true;
+	} else {
+		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
+		train_info->cable_plugged_in = false;
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+		mtk_dp->train_state_pre = MTK_DP_TRAIN_STATE_STARTUP;
+	}
+	train_info->cable_state_change = true;
+	queue_work(mtk_dp->workqueue, &mtk_dp->work);
+}
+
+static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_set_idle_pattern(mtk_dp, true);
+	mtk_dp_initialize_priv_data(mtk_dp);
+
+	mtk_dp_initialize_settings(mtk_dp);
+	mtk_dp_initialize_aux_settings(mtk_dp);
+	mtk_dp_initialize_digital_settings(mtk_dp);
+	mtk_dp_initialize_phy_settings(mtk_dp);
+	mtk_dp_initialize_hpd_detect_settings(mtk_dp);
+
+	mtk_dp_digital_sw_reset(mtk_dp);
+}
+
+static void mtk_dp_work_func(struct work_struct *work)
+{
+	int event;
+	struct mtk_dp *mtk_dp = container_of(work, struct mtk_dp, work);
+
+	event = mtk_dp_plug_state(mtk_dp) ? connector_status_connected :
+		connector_status_disconnected;
+
+	if (event < 0)
+		return;
+
+	if (mtk_dp->drm_dev)
+		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
+}
+
+static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
+{
+	struct mtk_dp *mtk_dp = dev;
+	uint32_t irq_status;
+
+	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
+
+	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
+		mtk_dp_hpd_isr_handler(mtk_dp);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_dp_dt_parse_pdata(struct mtk_dp *mtk_dp,
+		struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret = 0;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	mtk_dp->regs = devm_regmap_init_mmio(dev, base, &mtk_dp_regmap_config);
+	if (IS_ERR(mtk_dp->regs))
+		return PTR_ERR(mtk_dp->regs);
+
+	mtk_dp->dp_tx_clk = devm_clk_get(dev, "dp_tx_faxi");
+	if (IS_ERR(mtk_dp->dp_tx_clk)) {
+		ret = PTR_ERR(mtk_dp->dp_tx_clk);
+		dev_err(dev, "Failed to get dptx clock: %d\n", ret);
+		mtk_dp->dp_tx_clk = NULL;
+	}
+
+	return ret;
+}
+
+static inline struct mtk_dp *mtk_dp_ctx_from_conn(struct drm_connector *c)
+{
+	return container_of(c, struct mtk_dp, conn);
+}
+
+static enum drm_connector_status mtk_dp_conn_detect(struct drm_connector *conn,
+						    bool force)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_ctx_from_conn(conn);
+
+	return mtk_dp_plug_state(mtk_dp) ? connector_status_connected :
+						 connector_status_disconnected;
+}
+
+static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
+{
+	bool connected;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	connected = mtk_dp_plug_state(mtk_dp);
+	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
+		mtk_dp->plugged_cb(mtk_dp->codec_dev, connected);
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+}
+
+static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	enum drm_connector_status ret;
+
+	ret = mtk_dp_plug_state(mtk_dp) ? connector_status_connected :
+			connector_status_disconnected;
+
+	if (mtk_dp->driver_data->is_edp)
+		return connector_status_connected;
+
+	mtk_dp_update_plugged_status(mtk_dp);
+	return ret;
+}
+
+static void mtk_dp_conn_destroy(struct drm_connector *conn)
+{
+	drm_connector_cleanup(conn);
+}
+
+static const struct drm_connector_funcs mtk_dp_connector_funcs = {
+	.detect = mtk_dp_conn_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = mtk_dp_conn_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int mtk_dp_conn_mode_valid(struct drm_connector *conn,
+		struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static struct drm_encoder *mtk_dp_conn_best_enc(struct drm_connector *conn)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_conn(conn);
+
+	return mtk_dp->bridge.encoder;
+}
+
+static int mtk_dp_conn_get_modes(struct drm_connector *conn)
+{
+	int ret;
+	int num_modes = 0;
+	struct mtk_dp *mtk_dp = mtk_dp_from_conn(conn);
+
+	if (!mtk_dp->edid) {
+		mtk_dp->edid = drm_get_edid(conn, &mtk_dp->aux.ddc);
+		if (!mtk_dp->edid) {
+			drm_err(mtk_dp->drm_dev, "Failed to read EDID\n");
+			return 0;
+		}
+	}
+
+	ret = drm_connector_update_edid_property(conn, mtk_dp->edid);
+	if (ret) {
+		drm_err(mtk_dp->drm_dev, "Failed to update EDID property: %d\n",
+			ret);
+		return 0;
+	}
+
+	num_modes = drm_add_edid_modes(conn, mtk_dp->edid);
+	return num_modes;
+}
+
+static const struct drm_connector_helper_funcs
+		mtk_dp_connector_helper_funcs = {
+	.get_modes = mtk_dp_conn_get_modes,
+	.mode_valid = mtk_dp_conn_mode_valid,
+	.best_encoder = mtk_dp_conn_best_enc,
+};
+
+static struct edid *mtk_get_edid(struct drm_bridge *bridge,
+			   struct drm_connector *connector)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	bool poweroff = !mtk_dp->powered;
+	struct edid *edid;
+
+	drm_bridge_chain_pre_enable(bridge);
+
+	edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
+
+	/*
+	 * If we call the get_edid() function without having enabled the chip
+	 * before, return the chip to its original power state.
+	 */
+	if (poweroff)
+		drm_bridge_chain_post_disable(bridge);
+
+	mtk_dp->edid = edid;
+
+	return edid;
+}
+
+static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
+				   struct drm_dp_aux_msg *msg)
+{
+	ssize_t ret = 0;
+	struct mtk_dp *mtk_dp;
+	bool is_read;
+	u8 request;
+	size_t accessed_bytes = 0;
+
+	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
+
+	if (!mtk_dp->training_info.cable_plugged_in ||
+	    mtk_dp->training_info.irq_status & MTK_DP_HPD_DISCONNECT) {
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
+		ret = -EAGAIN;
+		goto err;
+	}
+
+	switch (msg->request) {
+	case DP_AUX_I2C_MOT:
+	case DP_AUX_I2C_WRITE:
+	case DP_AUX_NATIVE_WRITE:
+	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
+	case DP_AUX_I2C_WRITE_STATUS_UPDATE | DP_AUX_I2C_MOT:
+		request = msg->request & ~DP_AUX_I2C_WRITE_STATUS_UPDATE;
+		is_read = false;
+		break;
+	case DP_AUX_I2C_READ:
+	case DP_AUX_NATIVE_READ:
+	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
+		is_read = true;
+		request = msg->request;
+		break;
+	default:
+		drm_err(mtk_aux->drm_dev, "invalid aux cmd = %d\n",
+			msg->request);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	while (accessed_bytes < msg->size) {
+		size_t to_access = min((size_t)DP_AUX_MAX_PAYLOAD_BYTES,
+				       msg->size - accessed_bytes);
+
+		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
+					     msg->address + accessed_bytes,
+					     msg->buffer + accessed_bytes,
+					     to_access);
+		accessed_bytes += to_access;
+		if (ret) {
+			drm_info(mtk_dp->drm_dev,
+				 "Failed to do AUX transfer: %ld\n", ret);
+			break;
+		}
+	}
+
+err:
+	if (!ret) {
+		msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
+		ret = msg->size;
+	} else {
+		msg->reply = DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPLY_NACK;
+		ret = -EAGAIN;
+	}
+
+	return ret;
+}
+
+static void mtk_dp_aux_init(struct mtk_dp *mtk_dp)
+{
+	drm_dp_aux_init(&mtk_dp->aux);
+	mtk_dp->aux.name = "aux_mtk_dp";
+	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+}
+
+static void mtk_dp_hpd_interrupt_set(struct mtk_dp *mtk_dp, int bstatus)
+{
+	if ((bstatus == MTK_DP_HPD_CONNECT && !mtk_dp->power_enabled) ||
+	    (bstatus == MTK_DP_HPD_DISCONNECT && mtk_dp->power_enabled) ||
+	    (bstatus == MTK_DP_HPD_INTERRUPT && mtk_dp->power_enabled)) {
+		if (bstatus == MTK_DP_HPD_CONNECT) {
+			int ret;
+
+			ret = clk_prepare_enable(mtk_dp->dp_tx_clk);
+			if (ret < 0)
+				dev_err(mtk_dp->dev,
+					"Fail to enable dptx clock: %d\n", ret);
+			mtk_dp_init_port(mtk_dp);
+			mtk_dp_power_enable(mtk_dp);
+			mtk_dp->power_enabled = true;
+		}
+
+		mtk_dp_hwirq_enable(mtk_dp, true);
+		return;
+	}
+}
+
+static void __maybe_unused mtk_dp_poweroff(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->dp_lock);
+
+	mtk_dp_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_DISCONNECT);
+	mutex_unlock(&mtk_dp->dp_lock);
+}
+
+static void mtk_dp_poweron(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->dp_lock);
+
+	mtk_dp_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_CONNECT);
+	mutex_unlock(&mtk_dp->dp_lock);
+}
+
+static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	int ret;
+
+	mtk_dp_poweron(mtk_dp);
+
+	if (mtk_dp->next_bridge) {
+		ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
+					&mtk_dp->bridge, flags);
+		if (ret) {
+			drm_warn(mtk_dp->drm_dev,
+				 "Failed to attach external bridge: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		drm_err(mtk_dp->drm_dev,
+			"Fix bridge driver to make connector optional!");
+		return 0;
+	}
+
+	mtk_dp->drm_dev = bridge->dev;
+
+	ret = drm_connector_init(bridge->dev, &mtk_dp->conn,
+				 &mtk_dp_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret) {
+		drm_warn(mtk_dp->drm_dev,
+			 "Failed to initialize connector: %d\n", ret);
+		return ret;
+	}
+
+	drm_connector_helper_add(&mtk_dp->conn, &mtk_dp_connector_helper_funcs);
+
+	mtk_dp->conn.polled = DRM_CONNECTOR_POLL_HPD;
+	mtk_dp->conn.interlace_allowed = false;
+	mtk_dp->conn.doublescan_allowed = false;
+
+	ret = drm_connector_attach_encoder(&mtk_dp->conn, bridge->encoder);
+	if (ret) {
+		drm_warn(mtk_dp->drm_dev,
+			 "Failed to attach connector to encoder: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static bool mtk_dp_bridge_mode_fixup(struct drm_bridge *bridge,
+				     const struct drm_display_mode *mode,
+				     struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void mtk_dp_bridge_disable(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+
+	mtk_dp->enabled = false;
+}
+
+static void mtk_dp_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+
+	mtk_dp->powered = false;
+}
+
+static void mtk_dp_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+
+	drm_mode_copy(&mtk_dp->mode, adjusted_mode);
+}
+
+static void mtk_dp_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+
+	mtk_dp_parse_capabilities(mtk_dp);
+
+	mtk_dp->powered = true;
+}
+
+static void mtk_dp_bridge_enable(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	int ret = 0;
+	int i;
+
+	mtk_dp_parse_capabilities(mtk_dp);
+	mtk_dp->edid = mtk_dp_handle_edid(mtk_dp);
+	//training
+	for (i = 0; i < 50; i++) {
+		ret = mtk_dp_train_handler(mtk_dp);
+		if (ret)
+			break;
+
+		ret = mtk_dp_state_handler(mtk_dp);
+		if (ret)
+			break;
+	}
+
+	if (ret)
+		drm_info(mtk_dp->drm_dev, "dptx handle fail!!!");
+
+
+	mtk_dp_video_config(mtk_dp);
+	mtk_dp_video_enable(mtk_dp, true);
+
+	if (mtk_dp->audio_enable) {
+		mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+		mtk_dp_audio_mute(mtk_dp, false);
+	}
+
+	mtk_dp->enabled = true;
+}
+
+static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
+	.attach = mtk_dp_bridge_attach,
+	.mode_fixup = mtk_dp_bridge_mode_fixup,
+	.disable = mtk_dp_bridge_disable,
+	.post_disable = mtk_dp_bridge_post_disable,
+	.mode_set = mtk_dp_bridge_mode_set,
+	.pre_enable = mtk_dp_bridge_pre_enable,
+	.enable = mtk_dp_bridge_enable,
+	.get_edid = mtk_get_edid,
+	.detect = mtk_dp_bdg_detect,
+};
+
+/*
+ * HDMI audio codec callbacks
+ */
+static int mtk_dp_audio_hw_params(struct device *dev, void *data,
+				    struct hdmi_codec_daifmt *daifmt,
+				    struct hdmi_codec_params *params)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	struct mtk_dp_audio_cfg cfg;
+
+	if (!mtk_dp->dp_ready) {
+		pr_err("%s, DP is not ready!\n", __func__);
+		return -ENODEV;
+	}
+
+	cfg.channels = params->cea.channels;
+	cfg.sample_rate = params->sample_rate;
+	cfg.word_length_bits = 24;
+
+	mtk_dp_audio_setup(mtk_dp, &cfg);
+
+	return 0;
+}
+
+static int mtk_dp_audio_startup(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, false);
+
+	return 0;
+}
+
+static void mtk_dp_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, true);
+}
+
+static int mtk_dp_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
+				size_t len)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	if (mtk_dp->enabled)
+		memcpy(buf, mtk_dp->conn.eld,
+		       min(sizeof(mtk_dp->conn.eld), len));
+	else
+		memset(buf, 0, len);
+	return 0;
+}
+
+static int mtk_dp_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_dp *mtk_dp = data;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	mtk_dp->plugged_cb = fn;
+	mtk_dp->codec_dev = codec_dev;
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+
+	mtk_dp_update_plugged_status(mtk_dp);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
+	.hw_params = mtk_dp_audio_hw_params,
+	.audio_startup = mtk_dp_audio_startup,
+	.audio_shutdown = mtk_dp_audio_shutdown,
+	.get_eld = mtk_dp_audio_get_eld,
+	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
+	.no_capture_mute = 1,
+};
+
+static int mtk_dp_register_audio_driver(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &mtk_dp_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = mtk_dp,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return 0;
+}
+
+static int mtk_dp_probe(struct platform_device *pdev)
+{
+	struct mtk_dp *mtk_dp;
+	struct device *dev = &pdev->dev;
+	int ret;
+	int irq_num = 0;
+	struct drm_panel *panel;
+
+	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
+	if (!mtk_dp)
+		return -ENOMEM;
+
+	mtk_dp->dev = dev;
+
+	irq_num = platform_get_irq(pdev, 0);
+	if (irq_num < 0) {
+		dev_err(&pdev->dev, "failed to request dp irq resource\n");
+		return -EPROBE_DEFER;
+	}
+
+	mtk_dp->driver_data = of_device_get_match_data(dev);
+	if (!mtk_dp->driver_data)
+		return -EINVAL;
+
+	if (mtk_dp->driver_data->is_edp) {
+		ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
+						  &panel, &mtk_dp->next_bridge);
+		if (ret) {
+			dev_err(dev, "Failed to find panel or bridge: %d\n",
+				ret);
+			return -EPROBE_DEFER;
+		}
+
+		if (panel) {
+			mtk_dp->next_bridge =
+				devm_drm_panel_bridge_add(dev, panel);
+			if (IS_ERR(mtk_dp->next_bridge)) {
+				ret = PTR_ERR(mtk_dp->next_bridge);
+				dev_err(dev, "Failed to create bridge: %d\n",
+					ret);
+				return -EPROBE_DEFER;
+			}
+		}
+	}
+
+	ret = mtk_dp_dt_parse_pdata(mtk_dp, pdev);
+	if (ret)
+		return ret;
+
+	mtk_dp_aux_init(mtk_dp);
+
+	irq_set_status_flags(irq_num, IRQ_TYPE_LEVEL_HIGH);
+	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dp_hpd_event,
+			       IRQ_TYPE_LEVEL_HIGH, dev_name(&pdev->dev),
+			       mtk_dp);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request mediatek dptx irq\n");
+		return -EPROBE_DEFER;
+	}
+
+	INIT_WORK(&mtk_dp->work, mtk_dp_work_func);
+	mtk_dp->workqueue = create_workqueue("mtk_dp_work");
+	if (!mtk_dp->workqueue) {
+		dev_err(dev, "Failed to create work queue.\n");
+		ret = -ENOMEM;
+		return ret;
+	}
+
+	mutex_init(&mtk_dp->dp_lock);
+
+	platform_set_drvdata(pdev, mtk_dp);
+
+	if (!mtk_dp->driver_data->is_edp) {
+		mutex_init(&mtk_dp->update_plugged_status_lock);
+		ret = mtk_dp_register_audio_driver(dev);
+		if (ret) {
+			dev_err(dev, "Failed to register audio driver: %d\n",
+				ret);
+			return ret;
+		}
+	}
+	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
+	mtk_dp->bridge.of_node = pdev->dev.of_node;
+	if (mtk_dp->driver_data->is_edp)
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+
+	mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
+			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES;
+	drm_bridge_add(&mtk_dp->bridge);
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	platform_set_drvdata(pdev, mtk_dp);
+
+	return 0;
+}
+
+static int mtk_dp_remove(struct platform_device *pdev)
+{
+	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
+	int ret;
+
+	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
+
+	drm_connector_cleanup(&mtk_dp->conn);
+
+	if (!IS_ERR(mtk_dp->task))
+		ret = kthread_stop(mtk_dp->task);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int mtk_dp_suspend(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_power_disable(mtk_dp);
+	mtk_dp_hwirq_enable(mtk_dp, false);
+
+	pm_runtime_put_sync(dev);
+
+	return 0;
+}
+
+static int mtk_dp_resume(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev);
+
+	mtk_dp_init_port(mtk_dp);
+	mtk_dp_power_enable(mtk_dp);
+	mtk_dp_hwirq_enable(mtk_dp, true);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops,
+		mtk_dp_suspend, mtk_dp_resume);
+
+static const struct mtk_dp_driver_data mt8195_dp_driver_data = {
+	.is_edp = false,
+};
+
+static const struct mtk_dp_driver_data mt8195_edp_driver_data = {
+	.is_edp = true,
+};
+
+static const struct of_device_id mtk_dp_of_match[] = {
+	{
+		.compatible = "mediatek,mt8195-dp_tx",
+		.data = &mt8195_dp_driver_data,
+	},
+	{
+		.compatible = "mediatek,mt8195-edp_tx",
+		.data = &mt8195_edp_driver_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
+
+struct platform_driver mtk_dp_driver = {
+	.probe = mtk_dp_probe,
+	.remove = mtk_dp_remove,
+	.driver = {
+		.name = "mediatek-drm-dp",
+		.of_match_table = mtk_dp_of_match,
+		.pm = &mtk_dp_pm_ops,
+	},
+};
+
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
new file mode 100644
index 000000000000..83afc79d98ff
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -0,0 +1,3095 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre
+ */
+#ifndef _MTK_DP_REG_H_
+#define _MTK_DP_REG_H_
+
+#define MTK_DP_SIP_CONTROL_AARCH32 0x82000523
+# define MTK_DP_SIP_ATF_VIDEO_UNMUTE 0x20
+# define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE 0x21
+# define MTK_DP_SIP_ATF_REG_WRITE 0x22
+# define MTK_DP_SIP_ATF_REG_READ 0x23
+# define MTK_DP_SIP_ATF_CMD_COUNT 0x24
+
+#define TOP_OFFSET		0x2000
+#define ENC0_OFFSET		0x3000
+#define ENC1_OFFSET		0x3200
+#define TRANS_OFFSET		0x3400
+#define AUX_OFFSET		0x3600
+#define SEC_OFFSET		0x4000
+
+#define MTK_DP_HPD_DISCONNECT	BIT(1)
+#define MTK_DP_HPD_CONNECT	BIT(2)
+#define MTK_DP_HPD_INTERRUPT	BIT(3)
+
+#define MTK_DP_ENC0_P0_3000              (ENC0_OFFSET + 0x000)
+# define LANE_NUM_DP_ENC0_P0_MASK                                      0x3
+# define LANE_NUM_DP_ENC0_P0_SHIFT                                     0
+# define VIDEO_MUTE_SW_DP_ENC0_P0_MASK                                 0x4
+# define VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT                                2
+# define VIDEO_MUTE_SEL_DP_ENC0_P0_MASK                                0x8
+# define VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT                               3
+# define ENHANCED_FRAME_EN_DP_ENC0_P0_MASK                             0x10
+# define ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT                            4
+# define HDCP_FRAME_EN_DP_ENC0_P0_MASK                                 0x20
+# define HDCP_FRAME_EN_DP_ENC0_P0_SHIFT                                5
+# define IDP_EN_DP_ENC0_P0_MASK                                        0x40
+# define IDP_EN_DP_ENC0_P0_SHIFT                                       6
+# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_MASK                           0x80
+# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_SHIFT                          7
+# define MIXER_DUMMY_DATA_DP_ENC0_P0_MASK                              0xff00
+# define MIXER_DUMMY_DATA_DP_ENC0_P0_SHIFT                             8
+
+#define MTK_DP_ENC0_P0_3004              (ENC0_OFFSET + 0x004)
+# define MIXER_STUFF_DUMMY_DATA_DP_ENC0_P0_MASK                        0xff
+# define MIXER_STUFF_DUMMY_DATA_DP_ENC0_P0_SHIFT                       0
+# define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK                              0x100
+# define VIDEO_M_CODE_SEL_DP_ENC0_P0_SHIFT                             8
+# define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK                     0x200
+# define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SHIFT                    9
+# define MIXER_RESET_SW_DP_ENC0_P0_MASK                                0x400
+# define MIXER_RESET_SW_DP_ENC0_P0_SHIFT                               10
+# define VIDEO_RESET_SW_DP_ENC0_P0_MASK                                0x800
+# define VIDEO_RESET_SW_DP_ENC0_P0_SHIFT                               11
+# define VIDEO_PATTERN_GEN_RESET_SW_DP_ENC0_P0_MASK                    0x1000
+# define VIDEO_PATTERN_GEN_RESET_SW_DP_ENC0_P0_SHIFT                   12
+# define SDP_RESET_SW_DP_ENC0_P0_MASK                                  0x2000
+# define SDP_RESET_SW_DP_ENC0_P0_SHIFT                                 13
+# define DP_TX_MUX_DP_ENC0_P0_MASK                                     0x4000
+# define DP_TX_MUX_DP_ENC0_P0_SHIFT                                    14
+# define MIXER_FSM_RESET_DP_ENC0_P0_MASK                               0x8000
+# define MIXER_FSM_RESET_DP_ENC0_P0_SHIFT                              15
+
+#define MTK_DP_ENC0_P0_3008              (ENC0_OFFSET + 0x008)
+# define VIDEO_M_CODE_SW_0_DP_ENC0_P0_MASK                             0xffff
+# define VIDEO_M_CODE_SW_0_DP_ENC0_P0_SHIFT                            0
+
+#define MTK_DP_ENC0_P0_300C              (ENC0_OFFSET + 0x00C)
+# define VIDEO_M_CODE_SW_1_DP_ENC0_P0_MASK                             0xff
+# define VIDEO_M_CODE_SW_1_DP_ENC0_P0_SHIFT                            0
+# define VIDEO_M_CODE_PULSE_DP_ENC0_P0_MASK                            0x100
+# define VIDEO_M_CODE_PULSE_DP_ENC0_P0_SHIFT                           8
+# define COMPRESSEDSTREAM_FLAG_DP_ENC0_P0_MASK                         0x200
+# define COMPRESSEDSTREAM_FLAG_DP_ENC0_P0_SHIFT                        9
+# define SDP_SPLIT_EN_DP_ENC0_P0_MASK                                  0x400
+# define SDP_SPLIT_EN_DP_ENC0_P0_SHIFT                                 10
+# define SDP_SPLIT_FIFO_RST_DP_ENC0_P0_MASK                            0x800
+# define SDP_SPLIT_FIFO_RST_DP_ENC0_P0_SHIFT                           11
+# define VIDEO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK                     0x7000
+# define VIDEO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT                    12
+# define SDP_AUDIO_ONE_SAMPLE_MODE_DP_ENC0_P0_MASK                     0x8000
+# define SDP_AUDIO_ONE_SAMPLE_MODE_DP_ENC0_P0_SHIFT                    15
+
+#define MTK_DP_ENC0_P0_3010              (ENC0_OFFSET + 0x010)
+# define HTOTAL_SW_DP_ENC0_P0_MASK                                     0xffff
+# define HTOTAL_SW_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3014              (ENC0_OFFSET + 0x014)
+# define VTOTAL_SW_DP_ENC0_P0_MASK                                     0xffff
+# define VTOTAL_SW_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3018              (ENC0_OFFSET + 0x018)
+# define HSTART_SW_DP_ENC0_P0_MASK                                     0xffff
+# define HSTART_SW_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_301C              (ENC0_OFFSET + 0x01C)
+# define VSTART_SW_DP_ENC0_P0_MASK                                     0xffff
+# define VSTART_SW_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3020              (ENC0_OFFSET + 0x020)
+# define HWIDTH_SW_DP_ENC0_P0_MASK                                     0xffff
+# define HWIDTH_SW_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3024              (ENC0_OFFSET + 0x024)
+# define VHEIGHT_SW_DP_ENC0_P0_MASK                                    0xffff
+# define VHEIGHT_SW_DP_ENC0_P0_SHIFT                                   0
+
+#define MTK_DP_ENC0_P0_3028              (ENC0_OFFSET + 0x028)
+# define HSW_SW_DP_ENC0_P0_MASK                                        0x7fff
+# define HSW_SW_DP_ENC0_P0_SHIFT                                       0
+# define HSP_SW_DP_ENC0_P0_MASK                                        0x8000
+# define HSP_SW_DP_ENC0_P0_SHIFT                                       15
+
+#define MTK_DP_ENC0_P0_302C              (ENC0_OFFSET + 0x02C)
+# define VSW_SW_DP_ENC0_P0_MASK                                        0x7fff
+# define VSW_SW_DP_ENC0_P0_SHIFT                                       0
+# define VSP_SW_DP_ENC0_P0_MASK                                        0x8000
+# define VSP_SW_DP_ENC0_P0_SHIFT                                       15
+
+#define MTK_DP_ENC0_P0_3030              (ENC0_OFFSET + 0x030)
+# define HTOTAL_SEL_DP_ENC0_P0_MASK                                    0x1
+# define HTOTAL_SEL_DP_ENC0_P0_SHIFT                                   0
+# define VTOTAL_SEL_DP_ENC0_P0_MASK                                    0x2
+# define VTOTAL_SEL_DP_ENC0_P0_SHIFT                                   1
+# define HSTART_SEL_DP_ENC0_P0_MASK                                    0x4
+# define HSTART_SEL_DP_ENC0_P0_SHIFT                                   2
+# define VSTART_SEL_DP_ENC0_P0_MASK                                    0x8
+# define VSTART_SEL_DP_ENC0_P0_SHIFT                                   3
+# define HWIDTH_SEL_DP_ENC0_P0_MASK                                    0x10
+# define HWIDTH_SEL_DP_ENC0_P0_SHIFT                                   4
+# define VHEIGHT_SEL_DP_ENC0_P0_MASK                                   0x20
+# define VHEIGHT_SEL_DP_ENC0_P0_SHIFT                                  5
+# define HSP_SEL_DP_ENC0_P0_MASK                                       0x40
+# define HSP_SEL_DP_ENC0_P0_SHIFT                                      6
+# define HSW_SEL_DP_ENC0_P0_MASK                                       0x80
+# define HSW_SEL_DP_ENC0_P0_SHIFT                                      7
+# define VSP_SEL_DP_ENC0_P0_MASK                                       0x100
+# define VSP_SEL_DP_ENC0_P0_SHIFT                                      8
+# define VSW_SEL_DP_ENC0_P0_MASK                                       0x200
+# define VSW_SEL_DP_ENC0_P0_SHIFT                                      9
+# define TX_VBID_SW_EN_DP_ENC0_P0_MASK                                 0x400
+# define TX_VBID_SW_EN_DP_ENC0_P0_SHIFT                                10
+# define VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK                       0x800
+# define VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT                           11
+# define VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK                      0x1000
+# define VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT                          12
+# define VBID_INTERLACE_FLAG_SW_DP_ENC0_P0_MASK                        0x2000
+# define VBID_INTERLACE_FLAG_SW_DP_ENC0_P0_SHIFT                       13
+# define VBID_INTERLACE_FLAG_SEL_DP_ENC0_P0_MASK                       0x4000
+# define VBID_INTERLACE_FLAG_SEL_DP_ENC0_P0_SHIFT                      14
+# define MIXER_SDP_EN_DP_ENC0_P0_MASK                                  0x8000
+# define MIXER_SDP_EN_DP_ENC0_P0_SHIFT                                 15
+
+#define MTK_DP_ENC0_P0_3034              (ENC0_OFFSET + 0x034)
+# define MISC0_DATA_DP_ENC0_P0_MASK                                    0xff
+# define MISC0_DATA_DP_ENC0_P0_SHIFT                                   0
+# define MISC1_DATA_DP_ENC0_P0_MASK                                    0xff00
+# define MISC1_DATA_DP_ENC0_P0_SHIFT                                   8
+
+#define MTK_DP_ENC0_P0_3038              (ENC0_OFFSET + 0x038)
+# define TX_VBID_SW_DP_ENC0_P0_MASK                                    0xff
+# define TX_VBID_SW_DP_ENC0_P0_SHIFT                                   0
+# define VIDEO_DATA_SWAP_DP_ENC0_P0_MASK                               0x700
+# define VIDEO_DATA_SWAP_DP_ENC0_P0_SHIFT                              8
+# define VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK                              0x800
+# define VIDEO_SOURCE_SEL_DP_ENC0_P0_SHIFT                             11
+# define FIELD_VBID_SW_EN_DP_ENC0_P0_MASK                              0x1000
+# define FIELD_VBID_SW_EN_DP_ENC0_P0_SHIFT                             12
+# define FIELD_SW_DP_ENC0_P0_MASK                                      0x2000
+# define FIELD_SW_DP_ENC0_P0_SHIFT                                     13
+# define V3D_EN_SW_DP_ENC0_P0_MASK                                     0x4000
+# define V3D_EN_SW_DP_ENC0_P0_SHIFT                                    14
+# define V3D_LR_HW_SWAP_DP_ENC0_P0_MASK                                0x8000
+# define V3D_LR_HW_SWAP_DP_ENC0_P0_SHIFT                               15
+
+#define MTK_DP_ENC0_P0_303C              (ENC0_OFFSET + 0x03C)
+# define SRAM_START_READ_THRD_DP_ENC0_P0_MASK                          0x3f
+# define SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT                         0
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK                             0x700
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT                            8
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT                            (0 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT                            (1 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT                            (2 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT                             (3 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT                             (4 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+# define VIDEO_COLOR_DEPTH_DP_ENC0_P0_DSC                              (7 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK                           0x7000
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT                          12
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB                            (0 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422                       (1 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420                       (2 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YONLY                          (3 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RAW                            (4 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+# define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_DSC                            (7 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+# define VIDEO_MN_GEN_EN_DP_ENC0_P0_MASK                               0x8000
+# define VIDEO_MN_GEN_EN_DP_ENC0_P0_SHIFT                              15
+
+#define MTK_DP_ENC0_P0_3040              (ENC0_OFFSET + 0x040)
+# define SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK                             0xfff
+# define SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT                            0
+# define AUDIO_32CH_EN_DP_ENC0_P0_MASK                                 0x1000
+# define AUDIO_32CH_EN_DP_ENC0_P0_SHIFT                                12
+# define AUDIO_32CH_SEL_DP_ENC0_P0_MASK                                0x2000
+# define AUDIO_32CH_SEL_DP_ENC0_P0_SHIFT                               13
+# define AUDIO_16CH_EN_DP_ENC0_P0_MASK                                 0x4000
+# define AUDIO_16CH_EN_DP_ENC0_P0_SHIFT                                14
+# define AUDIO_16CH_SEL_DP_ENC0_P0_MASK                                0x8000
+# define AUDIO_16CH_SEL_DP_ENC0_P0_SHIFT                               15
+
+#define MTK_DP_ENC0_P0_3044              (ENC0_OFFSET + 0x044)
+# define VIDEO_N_CODE_0_DP_ENC0_P0_MASK                                0xffff
+# define VIDEO_N_CODE_0_DP_ENC0_P0_SHIFT                               0
+
+#define MTK_DP_ENC0_P0_3048              (ENC0_OFFSET + 0x048)
+# define VIDEO_N_CODE_1_DP_ENC0_P0_MASK                                0xff
+# define VIDEO_N_CODE_1_DP_ENC0_P0_SHIFT                               0
+
+#define MTK_DP_ENC0_P0_304C              (ENC0_OFFSET + 0x04C)
+# define VIDEO_SRAM_MODE_DP_ENC0_P0_MASK                                 0x3
+# define VIDEO_SRAM_MODE_DP_ENC0_P0_SHIFT                                0
+# define VBID_VIDEO_MUTE_DP_ENC0_P0_MASK                                 0x4
+# define VBID_VIDEO_MUTE_DP_ENC0_P0_SHIFT                                2
+# define VBID_VIDEO_MUTE_IDLE_PATTERN_SYNC_EN_DP_ENC0_P0_MASK            0x8
+# define VBID_VIDEO_MUTE_IDLE_PATTERN_SYNC_EN_DP_ENC0_P0_SHIFT           3
+# define HDCP_SYNC_SEL_DP_ENC0_P0_MASK                                   0x10
+# define HDCP_SYNC_SEL_DP_ENC0_P0_SHIFT                                  4
+# define HDCP_SYNC_SW_DP_ENC0_P0_MASK                                    0x20
+# define HDCP_SYNC_SW_DP_ENC0_P0_SHIFT                                   5
+# define SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK                           0x100
+# define SDP_VSYNC_RISING_MASK_DP_ENC0_P0_SHIFT                          8
+
+#define MTK_DP_ENC0_P0_3050              (ENC0_OFFSET + 0x050)
+# define VIDEO_N_CODE_MN_GEN_0_DP_ENC0_P0_MASK                           0xffff
+# define VIDEO_N_CODE_MN_GEN_0_DP_ENC0_P0_SHIFT                          0
+
+#define MTK_DP_ENC0_P0_3054              (ENC0_OFFSET + 0x054)
+# define VIDEO_N_CODE_MN_GEN_1_DP_ENC0_P0_MASK                           0xff
+# define VIDEO_N_CODE_MN_GEN_1_DP_ENC0_P0_SHIFT                          0
+
+#define MTK_DP_ENC0_P0_3058              (ENC0_OFFSET + 0x058)
+# define AUDIO_N_CODE_MN_GEN_0_DP_ENC0_P0_MASK                           0xffff
+# define AUDIO_N_CODE_MN_GEN_0_DP_ENC0_P0_SHIFT                          0
+
+#define MTK_DP_ENC0_P0_305C              (ENC0_OFFSET + 0x05C)
+# define AUDIO_N_CODE_MN_GEN_1_DP_ENC0_P0_MASK                           0xff
+# define AUDIO_N_CODE_MN_GEN_1_DP_ENC0_P0_SHIFT                          0
+
+#define MTK_DP_ENC0_P0_3060              (ENC0_OFFSET + 0x060)
+# define NUM_INTERLACE_FRAME_DP_ENC0_P0_MASK                             0x7
+# define NUM_INTERLACE_FRAME_DP_ENC0_P0_SHIFT                            0
+# define INTERLACE_DET_EVEN_EN_DP_ENC0_P0_MASK                           0x8
+# define INTERLACE_DET_EVEN_EN_DP_ENC0_P0_SHIFT                          3
+# define FIELD_DETECT_EN_DP_ENC0_P0_MASK                                 0x10
+# define FIELD_DETECT_EN_DP_ENC0_P0_SHIFT                                4
+# define FIELD_DETECT_UPDATE_THRD_DP_ENC0_P0_MASK                        0xff00
+# define FIELD_DETECT_UPDATE_THRD_DP_ENC0_P0_SHIFT                       8
+
+#define MTK_DP_ENC0_P0_3064              (ENC0_OFFSET + 0x064)
+# define HDE_NUM_LAST_DP_ENC0_P0_MASK                                    0xffff
+# define HDE_NUM_LAST_DP_ENC0_P0_SHIFT                                   0
+
+#define MTK_DP_ENC0_P0_3088              (ENC0_OFFSET + 0x088)
+# define AUDIO_DETECT_EN_DP_ENC0_P0_MASK                                 0x20
+# define AUDIO_DETECT_EN_DP_ENC0_P0_SHIFT                                5
+# define AU_EN_DP_ENC0_P0_MASK                                           0x40
+# define AU_EN_DP_ENC0_P0_SHIFT                                          6
+# define AUDIO_8CH_EN_DP_ENC0_P0_MASK                                    0x80
+# define AUDIO_8CH_EN_DP_ENC0_P0_SHIFT                                   7
+# define AUDIO_8CH_SEL_DP_ENC0_P0_MASK                                   0x100
+# define AUDIO_8CH_SEL_DP_ENC0_P0_SHIFT                                  8
+# define AU_GEN_EN_DP_ENC0_P0_MASK                                       0x200
+# define AU_GEN_EN_DP_ENC0_P0_SHIFT                                      9
+# define AUDIO_MN_GEN_EN_DP_ENC0_P0_MASK                                 0x1000
+# define AUDIO_MN_GEN_EN_DP_ENC0_P0_SHIFT                                12
+# define DIS_ASP_DP_ENC0_P0_MASK                                         0x2000
+# define DIS_ASP_DP_ENC0_P0_SHIFT                                        13
+# define AUDIO_2CH_EN_DP_ENC0_P0_MASK                                    0x4000
+# define AUDIO_2CH_EN_DP_ENC0_P0_SHIFT                                   14
+# define AUDIO_2CH_SEL_DP_ENC0_P0_MASK                                   0x8000
+# define AUDIO_2CH_SEL_DP_ENC0_P0_SHIFT                                  15
+
+#define MTK_DP_ENC0_P0_308C              (ENC0_OFFSET + 0x08C)
+# define CH_STATUS_0_DP_ENC0_P0_MASK                                     0xffff
+# define CH_STATUS_0_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3090              (ENC0_OFFSET + 0x090)
+# define CH_STATUS_1_DP_ENC0_P0_MASK                                     0xffff
+# define CH_STATUS_1_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3094              (ENC0_OFFSET + 0x094)
+# define CH_STATUS_2_DP_ENC0_P0_MASK                                     0xff
+# define CH_STATUS_2_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3098              (ENC0_OFFSET + 0x098)
+# define USER_DATA_0_DP_ENC0_P0_MASK                                     0xffff
+# define USER_DATA_0_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_309C              (ENC0_OFFSET + 0x09C)
+# define USER_DATA_1_DP_ENC0_P0_MASK                                     0xffff
+# define USER_DATA_1_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_30A0              (ENC0_OFFSET + 0x0A0)
+# define USER_DATA_2_DP_ENC0_P0_MASK                                     0xff
+# define USER_DATA_2_DP_ENC0_P0_SHIFT                                    0
+# define VSC_EXT_VESA_CFG_DP_ENC0_P0_MASK                                0xf00
+# define VSC_EXT_VESA_CFG_DP_ENC0_P0_SHIFT                               8
+# define VSC_EXT_CEA_CFG_DP_ENC0_P0_MASK                                 0xf000
+# define VSC_EXT_CEA_CFG_DP_ENC0_P0_SHIFT                                12
+
+#define MTK_DP_ENC0_P0_30A4              (ENC0_OFFSET + 0x0A4)
+# define AU_TS_CFG_DP_ENC0_P0_MASK                                       0xff
+# define AU_TS_CFG_DP_ENC0_P0_SHIFT                                      0
+# define AVI_CFG_DP_ENC0_P0_MASK                                         0xff00
+# define AVI_CFG_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30A8              (ENC0_OFFSET + 0x0A8)
+# define AUI_CFG_DP_ENC0_P0_MASK                                         0xff
+# define AUI_CFG_DP_ENC0_P0_SHIFT                                        0
+# define SPD_CFG_DP_ENC0_P0_MASK                                         0xff00
+# define SPD_CFG_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30AC              (ENC0_OFFSET + 0x0AC)
+# define MPEG_CFG_DP_ENC0_P0_MASK                                        0xff
+# define MPEG_CFG_DP_ENC0_P0_SHIFT                                       0
+# define NTSC_CFG_DP_ENC0_P0_MASK                                        0xff00
+# define NTSC_CFG_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_30B0              (ENC0_OFFSET + 0x0B0)
+# define VSP_CFG_DP_ENC0_P0_MASK                                         0xff
+# define VSP_CFG_DP_ENC0_P0_SHIFT                                        0
+# define EXT_CFG_DP_ENC0_P0_MASK                                         0xff00
+# define EXT_CFG_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30B4              (ENC0_OFFSET + 0x0B4)
+# define ACM_CFG_DP_ENC0_P0_MASK                                         0xff
+# define ACM_CFG_DP_ENC0_P0_SHIFT                                        0
+# define ISRC_CFG_DP_ENC0_P0_MASK                                        0xff00
+# define ISRC_CFG_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_30B8              (ENC0_OFFSET + 0x0B8)
+# define VSC_CFG_DP_ENC0_P0_MASK                                         0xff
+# define VSC_CFG_DP_ENC0_P0_SHIFT                                        0
+# define MSA_CFG_DP_ENC0_P0_MASK                                         0xff00
+# define MSA_CFG_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30BC              (ENC0_OFFSET + 0x0BC)
+# define ISRC_CONT_DP_ENC0_P0_MASK                                       0x1
+# define ISRC_CONT_DP_ENC0_P0_SHIFT                                      0
+# define MSA_BY_SDP_DP_ENC0_P0_MASK                                      0x2
+# define MSA_BY_SDP_DP_ENC0_P0_SHIFT                                     1
+# define SDP_EN_DP_ENC0_P0_MASK                                          0x4
+# define SDP_EN_DP_ENC0_P0_SHIFT                                         2
+# define NIBBLE_INTERLEAVER_EN_DP_ENC0_P0_MASK                           0x8
+# define NIBBLE_INTERLEAVER_EN_DP_ENC0_P0_SHIFT                          3
+# define ECC_EN_DP_ENC0_P0_MASK                                          0x10
+# define ECC_EN_DP_ENC0_P0_SHIFT                                         4
+# define ASP_MIN_PL_SIZE_DP_ENC0_P0_MASK                                 0x60
+# define ASP_MIN_PL_SIZE_DP_ENC0_P0_SHIFT                                5
+# define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK                       0x700
+# define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT                      8
+# define AUDIO_M_CODE_SEL_DP_ENC0_P0_MASK                                0x4000
+# define AUDIO_M_CODE_SEL_DP_ENC0_P0_SHIFT                               14
+# define ASP_HB23_SEL_DP_ENC0_P0_MASK                                    0x8000
+# define ASP_HB23_SEL_DP_ENC0_P0_SHIFT                                   15
+
+#define MTK_DP_ENC0_P0_30C0              (ENC0_OFFSET + 0x0C0)
+# define AU_TS_HB0_DP_ENC0_P0_MASK                                       0xff
+# define AU_TS_HB0_DP_ENC0_P0_SHIFT                                      0
+# define AU_TS_HB1_DP_ENC0_P0_MASK                                       0xff00
+# define AU_TS_HB1_DP_ENC0_P0_SHIFT                                      8
+
+#define MTK_DP_ENC0_P0_30C4              (ENC0_OFFSET + 0x0C4)
+# define AU_TS_HB2_DP_ENC0_P0_MASK                                       0xff
+# define AU_TS_HB2_DP_ENC0_P0_SHIFT                                      0
+# define AU_TS_HB3_DP_ENC0_P0_MASK                                       0xff00
+# define AU_TS_HB3_DP_ENC0_P0_SHIFT                                      8
+
+#define MTK_DP_ENC0_P0_30C8              (ENC0_OFFSET + 0x0C8)
+# define AUDIO_M_CODE_SW_0_DP_ENC0_P0_MASK                               0xffff
+# define AUDIO_M_CODE_SW_0_DP_ENC0_P0_SHIFT                              0
+
+#define MTK_DP_ENC0_P0_30CC              (ENC0_OFFSET + 0x0CC)
+# define AUDIO_M_CODE_SW_1_DP_ENC0_P0_MASK                               0xff
+# define AUDIO_M_CODE_SW_1_DP_ENC0_P0_SHIFT                              0
+
+#define MTK_DP_ENC0_P0_30D0              (ENC0_OFFSET + 0x0D0)
+# define AUDIO_N_CODE_0_DP_ENC0_P0_MASK                                  0xffff
+# define AUDIO_N_CODE_0_DP_ENC0_P0_SHIFT                                 0
+
+#define MTK_DP_ENC0_P0_30D4              (ENC0_OFFSET + 0x0D4)
+# define AUDIO_N_CODE_1_DP_ENC0_P0_MASK                                  0xff
+# define AUDIO_N_CODE_1_DP_ENC0_P0_SHIFT                                 0
+
+#define MTK_DP_ENC0_P0_30D8              (ENC0_OFFSET + 0x0D8)
+# define ACM_HB0_DP_ENC0_P0_MASK                                         0xff
+# define ACM_HB0_DP_ENC0_P0_SHIFT                                        0
+# define ACM_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define ACM_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30DC              (ENC0_OFFSET + 0x0DC)
+# define ACM_HB2_DP_ENC0_P0_MASK                                         0xff
+# define ACM_HB2_DP_ENC0_P0_SHIFT                                        0
+# define ACM_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define ACM_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30E0              (ENC0_OFFSET + 0x0E0)
+# define ISRC_HB0_DP_ENC0_P0_MASK                                        0xff
+# define ISRC_HB0_DP_ENC0_P0_SHIFT                                       0
+# define ISRC_HB1_DP_ENC0_P0_MASK                                        0xff00
+# define ISRC_HB1_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_30E4              (ENC0_OFFSET + 0x0E4)
+# define ISRC_HB2_DP_ENC0_P0_MASK                                        0xff
+# define ISRC_HB2_DP_ENC0_P0_SHIFT                                       0
+# define ISRC0_HB3_DP_ENC0_P0_MASK                                       0xff00
+# define ISRC0_HB3_DP_ENC0_P0_SHIFT                                      8
+
+#define MTK_DP_ENC0_P0_30E8              (ENC0_OFFSET + 0x0E8)
+# define AVI_HB0_DP_ENC0_P0_MASK                                         0xff
+# define AVI_HB0_DP_ENC0_P0_SHIFT                                        0
+# define AVI_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define AVI_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30EC              (ENC0_OFFSET + 0x0EC)
+# define AVI_HB2_DP_ENC0_P0_MASK                                         0xff
+# define AVI_HB2_DP_ENC0_P0_SHIFT                                        0
+# define AVI_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define AVI_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30F0              (ENC0_OFFSET + 0x0F0)
+# define AUI_HB0_DP_ENC0_P0_MASK                                         0xff
+# define AUI_HB0_DP_ENC0_P0_SHIFT                                        0
+# define AUI_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define AUI_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30F4              (ENC0_OFFSET + 0x0F4)
+# define AUI_HB2_DP_ENC0_P0_MASK                                         0xff
+# define AUI_HB2_DP_ENC0_P0_SHIFT                                        0
+# define AUI_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define AUI_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30F8              (ENC0_OFFSET + 0x0F8)
+# define SPD_HB0_DP_ENC0_P0_MASK                                         0xff
+# define SPD_HB0_DP_ENC0_P0_SHIFT                                        0
+# define SPD_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define SPD_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_30FC              (ENC0_OFFSET + 0x0FC)
+# define SPD_HB2_DP_ENC0_P0_MASK                                         0xff
+# define SPD_HB2_DP_ENC0_P0_SHIFT                                        0
+# define SPD_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define SPD_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3100              (ENC0_OFFSET + 0x100)
+# define MPEG_HB0_DP_ENC0_P0_MASK                                        0xff
+# define MPEG_HB0_DP_ENC0_P0_SHIFT                                       0
+# define MPEG_HB1_DP_ENC0_P0_MASK                                        0xff00
+# define MPEG_HB1_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_3104              (ENC0_OFFSET + 0x104)
+# define MPEG_HB2_DP_ENC0_P0_MASK                                        0xff
+# define MPEG_HB2_DP_ENC0_P0_SHIFT                                       0
+# define MPEG_HB3_DP_ENC0_P0_MASK                                        0xff00
+# define MPEG_HB3_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_3108              (ENC0_OFFSET + 0x108)
+# define NTSC_HB0_DP_ENC0_P0_MASK                                        0xff
+# define NTSC_HB0_DP_ENC0_P0_SHIFT                                       0
+# define NTSC_HB1_DP_ENC0_P0_MASK                                        0xff00
+# define NTSC_HB1_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_310C              (ENC0_OFFSET + 0x10C)
+# define NTSC_HB2_DP_ENC0_P0_MASK                                        0xff
+# define NTSC_HB2_DP_ENC0_P0_SHIFT                                       0
+# define NTSC_HB3_DP_ENC0_P0_MASK                                        0xff00
+# define NTSC_HB3_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_3110              (ENC0_OFFSET + 0x110)
+# define VSP_HB0_DP_ENC0_P0_MASK                                         0xff
+# define VSP_HB0_DP_ENC0_P0_SHIFT                                        0
+# define VSP_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define VSP_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3114              (ENC0_OFFSET + 0x114)
+# define VSP_HB2_DP_ENC0_P0_MASK                                         0xff
+# define VSP_HB2_DP_ENC0_P0_SHIFT                                        0
+# define VSP_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define VSP_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3118              (ENC0_OFFSET + 0x118)
+# define VSC_HB0_DP_ENC0_P0_MASK                                         0xff
+# define VSC_HB0_DP_ENC0_P0_SHIFT                                        0
+# define VSC_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define VSC_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_311C              (ENC0_OFFSET + 0x11C)
+# define VSC_HB2_DP_ENC0_P0_MASK                                         0xff
+# define VSC_HB2_DP_ENC0_P0_SHIFT                                        0
+# define VSC_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define VSC_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3120              (ENC0_OFFSET + 0x120)
+# define EXT_HB0_DP_ENC0_P0_MASK                                         0xff
+# define EXT_HB0_DP_ENC0_P0_SHIFT                                        0
+# define EXT_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define EXT_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3124              (ENC0_OFFSET + 0x124)
+# define EXT_HB2_DP_ENC0_P0_MASK                                         0xff
+# define EXT_HB2_DP_ENC0_P0_SHIFT                                        0
+# define EXT_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define EXT_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3128              (ENC0_OFFSET + 0x128)
+# define ASP_HB0_DP_ENC0_P0_MASK                                         0xff
+# define ASP_HB0_DP_ENC0_P0_SHIFT                                        0
+# define ASP_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define ASP_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_312C              (ENC0_OFFSET + 0x12C)
+# define ASP_HB2_DP_ENC0_P0_MASK                                         0xff
+# define ASP_HB2_DP_ENC0_P0_SHIFT                                        0
+# define ASP_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define ASP_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3130              (ENC0_OFFSET + 0x130)
+# define PPS_HB0_DP_ENC0_P0_MASK                                         0xff
+# define PPS_HB0_DP_ENC0_P0_SHIFT                                        0
+# define PPS_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define PPS_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3134              (ENC0_OFFSET + 0x134)
+# define PPS_HB2_DP_ENC0_P0_MASK                                         0xff
+# define PPS_HB2_DP_ENC0_P0_SHIFT                                        0
+# define PPS_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define PPS_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_3138              (ENC0_OFFSET + 0x138)
+# define HDR0_HB0_DP_ENC0_P0_MASK                                        0xff
+# define HDR0_HB0_DP_ENC0_P0_SHIFT                                       0
+# define HDR0_HB1_DP_ENC0_P0_MASK                                        0xff00
+# define HDR0_HB1_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_313C              (ENC0_OFFSET + 0x13C)
+# define HDR0_HB2_DP_ENC0_P0_MASK                                        0xff
+# define HDR0_HB2_DP_ENC0_P0_SHIFT                                       0
+# define HDR0_HB3_DP_ENC0_P0_MASK                                        0xff00
+# define HDR0_HB3_DP_ENC0_P0_SHIFT                                       8
+
+#define MTK_DP_ENC0_P0_3140              (ENC0_OFFSET + 0x140)
+# define PGEN_CURSOR_V_DP_ENC0_P0_MASK                                   0x1fff
+# define PGEN_CURSOR_V_DP_ENC0_P0_SHIFT                                  0
+# define PGEN_TG_SEL_DP_ENC0_P0_MASK                                     0x2000
+# define PGEN_TG_SEL_DP_ENC0_P0_SHIFT                                    13
+# define PGEN_PG_SEL_DP_ENC0_P0_MASK                                     0x4000
+# define PGEN_PG_SEL_DP_ENC0_P0_SHIFT                                    14
+# define PGEN_CURSOR_EN_DP_ENC0_P0_MASK                                  0x8000
+# define PGEN_CURSOR_EN_DP_ENC0_P0_SHIFT                                 15
+
+#define MTK_DP_ENC0_P0_3144              (ENC0_OFFSET + 0x144)
+# define PGEN_CURSOR_H_DP_ENC0_P0_MASK                                   0x3fff
+# define PGEN_CURSOR_H_DP_ENC0_P0_SHIFT                                  0
+
+#define MTK_DP_ENC0_P0_3148              (ENC0_OFFSET + 0x148)
+# define PGEN_CURSOR_RGB_COLOR_CODE_0_DP_ENC0_P0_MASK                    0xffff
+# define PGEN_CURSOR_RGB_COLOR_CODE_0_DP_ENC0_P0_SHIFT                   0
+
+#define MTK_DP_ENC0_P0_314C              (ENC0_OFFSET + 0x14C)
+# define PGEN_CURSOR_RGB_COLOR_CODE_1_DP_ENC0_P0_MASK                    0xffff
+# define PGEN_CURSOR_RGB_COLOR_CODE_1_DP_ENC0_P0_SHIFT                   0
+
+#define MTK_DP_ENC0_P0_3150              (ENC0_OFFSET + 0x150)
+# define PGEN_CURSOR_RGB_COLOR_CODE_2_DP_ENC0_P0_MASK                    0xf
+# define PGEN_CURSOR_RGB_COLOR_CODE_2_DP_ENC0_P0_SHIFT                   0
+
+#define MTK_DP_ENC0_P0_3154              (ENC0_OFFSET + 0x154)
+# define PGEN_HTOTAL_DP_ENC0_P0_MASK                                     0x3fff
+# define PGEN_HTOTAL_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_3158              (ENC0_OFFSET + 0x158)
+# define PGEN_HSYNC_RISING_DP_ENC0_P0_MASK                               0x3fff
+# define PGEN_HSYNC_RISING_DP_ENC0_P0_SHIFT                              0
+
+#define MTK_DP_ENC0_P0_315C              (ENC0_OFFSET + 0x15C)
+# define PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK                          0x3fff
+# define PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_SHIFT                         0
+
+#define MTK_DP_ENC0_P0_3160              (ENC0_OFFSET + 0x160)
+# define PGEN_HFDE_START_DP_ENC0_P0_MASK                                 0x3fff
+# define PGEN_HFDE_START_DP_ENC0_P0_SHIFT                                0
+
+#define MTK_DP_ENC0_P0_3164              (ENC0_OFFSET + 0x164)
+# define PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK                          0x3fff
+# define PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_SHIFT                         0
+
+#define MTK_DP_ENC0_P0_3168              (ENC0_OFFSET + 0x168)
+# define PGEN_VTOTAL_DP_ENC0_P0_MASK                                     0x1fff
+# define PGEN_VTOTAL_DP_ENC0_P0_SHIFT                                    0
+
+#define MTK_DP_ENC0_P0_316C              (ENC0_OFFSET + 0x16C)
+# define PGEN_VSYNC_RISING_DP_ENC0_P0_MASK                               0x1fff
+# define PGEN_VSYNC_RISING_DP_ENC0_P0_SHIFT                              0
+
+#define MTK_DP_ENC0_P0_3170              (ENC0_OFFSET + 0x170)
+# define PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK                          0x1fff
+# define PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_SHIFT                         0
+
+#define MTK_DP_ENC0_P0_3174              (ENC0_OFFSET + 0x174)
+# define PGEN_VFDE_START_DP_ENC0_P0_MASK                                 0x1fff
+# define PGEN_VFDE_START_DP_ENC0_P0_SHIFT                                0
+
+#define MTK_DP_ENC0_P0_3178              (ENC0_OFFSET + 0x178)
+# define PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK                          0x1fff
+# define PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_SHIFT                         0
+
+#define MTK_DP_ENC0_P0_317C              (ENC0_OFFSET + 0x17C)
+# define PGEN_PAT_BASE_PIXEL_0_DP_ENC0_P0_MASK                           0xfff
+# define PGEN_PAT_BASE_PIXEL_0_DP_ENC0_P0_SHIFT                          0
+
+#define MTK_DP_ENC0_P0_3180              (ENC0_OFFSET + 0x180)
+# define PGEN_PAT_BASE_PIXEL_1_DP_ENC0_P0_MASK                           0xfff
+# define PGEN_PAT_BASE_PIXEL_1_DP_ENC0_P0_SHIFT                          0
+
+#define MTK_DP_ENC0_P0_3184              (ENC0_OFFSET + 0x184)
+# define PGEN_PAT_BASE_PIXEL_2_DP_ENC0_P0_MASK                           0xfff
+# define PGEN_PAT_BASE_PIXEL_2_DP_ENC0_P0_SHIFT                          0
+
+#define MTK_DP_ENC0_P0_3188              (ENC0_OFFSET + 0x188)
+# define PGEN_INITIAL_H_CNT_DP_ENC0_P0_MASK                              0x3fff
+# define PGEN_INITIAL_H_CNT_DP_ENC0_P0_SHIFT                             0
+
+#define MTK_DP_ENC0_P0_318C              (ENC0_OFFSET + 0x18C)
+# define PGEN_INITIAL_V_CNT_DP_ENC0_P0_MASK                              0x1fff
+# define PGEN_INITIAL_V_CNT_DP_ENC0_P0_SHIFT                             0
+
+#define MTK_DP_ENC0_P0_3190              (ENC0_OFFSET + 0x190)
+# define PGEN_INITIAL_CB_SEL_DP_ENC0_P0_MASK                             0x7
+# define PGEN_INITIAL_CB_SEL_DP_ENC0_P0_SHIFT                            0
+# define PGEN_FRAME_8K4K_MODE_EN_DP_ENC0_P0_MASK                         0x10
+# define PGEN_FRAME_8K4K_MODE_EN_DP_ENC0_P0_SHIFT                        4
+# define PGEN_FRAME_8K4K_MODE_SET_DP_ENC0_P0_MASK                        0x20
+# define PGEN_FRAME_8K4K_MODE_SET_DP_ENC0_P0_SHIFT                       5
+# define PGEN_INITIAL_H_GRAD_FLAG_DP_ENC0_P0_MASK                        0x40
+# define PGEN_INITIAL_H_GRAD_FLAG_DP_ENC0_P0_SHIFT                       6
+# define PGEN_INITIAL_V_GRAD_FLAG_DP_ENC0_P0_MASK                        0x80
+# define PGEN_INITIAL_V_GRAD_FLAG_DP_ENC0_P0_SHIFT                       7
+# define PGEN_FRAME_END_H_EN_DP_ENC0_P0_MASK                             0x100
+# define PGEN_FRAME_END_H_EN_DP_ENC0_P0_SHIFT                            8
+# define PGEN_FRAME_END_V_EN_DP_ENC0_P0_MASK                             0x200
+# define PGEN_FRAME_END_V_EN_DP_ENC0_P0_SHIFT                            9
+
+#define MTK_DP_ENC0_P0_3194              (ENC0_OFFSET + 0x194)
+# define PGEN_PAT_EXTRA_PIXEL_0_DP_ENC0_P0_MASK                          0xfff
+# define PGEN_PAT_EXTRA_PIXEL_0_DP_ENC0_P0_SHIFT                         0
+
+#define MTK_DP_ENC0_P0_3198              (ENC0_OFFSET + 0x198)
+# define PGEN_PAT_EXTRA_PIXEL_1_DP_ENC0_P0_MASK                          0xfff
+# define PGEN_PAT_EXTRA_PIXEL_1_DP_ENC0_P0_SHIFT                         0
+
+#define MTK_DP_ENC0_P0_319C              (ENC0_OFFSET + 0x19C)
+# define PGEN_PAT_EXTRA_PIXEL_2_DP_ENC0_P0_MASK                          0xfff
+# define PGEN_PAT_EXTRA_PIXEL_2_DP_ENC0_P0_SHIFT                         0
+
+#define MTK_DP_ENC0_P0_31A0              (ENC0_OFFSET + 0x1A0)
+# define PGEN_PAT_INCREMENT_0_DP_ENC0_P0_MASK                            0xffff
+# define PGEN_PAT_INCREMENT_0_DP_ENC0_P0_SHIFT                           0
+
+#define MTK_DP_ENC0_P0_31A4              (ENC0_OFFSET + 0x1A4)
+# define PGEN_PAT_INCREMENT_1_DP_ENC0_P0_MASK                            0x1
+# define PGEN_PAT_INCREMENT_1_DP_ENC0_P0_SHIFT                           0
+
+#define MTK_DP_ENC0_P0_31A8              (ENC0_OFFSET + 0x1A8)
+# define PGEN_PAT_HWIDTH_DP_ENC0_P0_MASK                                 0x3fff
+# define PGEN_PAT_HWIDTH_DP_ENC0_P0_SHIFT                                0
+
+#define MTK_DP_ENC0_P0_31AC              (ENC0_OFFSET + 0x1AC)
+# define PGEN_PAT_VWIDTH_DP_ENC0_P0_MASK                                 0x1fff
+# define PGEN_PAT_VWIDTH_DP_ENC0_P0_SHIFT                                0
+
+#define MTK_DP_ENC0_P0_31B0              (ENC0_OFFSET + 0x1B0)
+# define PGEN_PAT_RGB_ENABLE_DP_ENC0_P0_MASK                             0x7
+# define PGEN_PAT_RGB_ENABLE_DP_ENC0_P0_SHIFT                            0
+# define PGEN_PATTERN_SEL_DP_ENC0_P0_MASK                                0x70
+# define PGEN_PATTERN_SEL_DP_ENC0_P0_SHIFT                               4
+# define PGEN_PAT_DIRECTION_DP_ENC0_P0_MASK                              0x80
+# define PGEN_PAT_DIRECTION_DP_ENC0_P0_SHIFT                             7
+# define PGEN_PAT_GRADIENT_NORMAL_MODE_DP_ENC0_P0_MASK                   0x100
+# define PGEN_PAT_GRADIENT_NORMAL_MODE_DP_ENC0_P0_SHIFT                  8
+# define PGEN_PAT_COLOR_BAR_GRADIENT_EN_DP_ENC0_P0_MASK                  0x200
+# define PGEN_PAT_COLOR_BAR_GRADIENT_EN_DP_ENC0_P0_SHIFT                 9
+# define PGEN_PAT_CHESSBOARD_NORMAL_MODE_DP_ENC0_P0_MASK                 0x400
+# define PGEN_PAT_CHESSBOARD_NORMAL_MODE_DP_ENC0_P0_SHIFT                10
+# define PGEN_PAT_EXCHANGE_DP_ENC0_P0_MASK                               0x800
+# define PGEN_PAT_EXCHANGE_DP_ENC0_P0_SHIFT                              11
+# define PGEN_PAT_RGB_SUB_PIXEL_MASK_DP_ENC0_P0_MASK                     0x1000
+# define PGEN_PAT_RGB_SUB_PIXEL_MASK_DP_ENC0_P0_SHIFT                    12
+
+#define MTK_DP_ENC0_P0_31B4              (ENC0_OFFSET + 0x1B4)
+# define PGEN_PAT_THICKNESS_DP_ENC0_P0_MASK                              0xf
+# define PGEN_PAT_THICKNESS_DP_ENC0_P0_SHIFT                             0
+
+#define MTK_DP_ENC0_P0_31C0              (ENC0_OFFSET + 0x1C0)
+# define VIDEO_MUTE_CNT_THRD_DP_ENC0_P0_MASK                             0xfff
+# define VIDEO_MUTE_CNT_THRD_DP_ENC0_P0_SHIFT                            0
+
+#define MTK_DP_ENC0_P0_31C4              (ENC0_OFFSET + 0x1C4)
+# define PPS_HW_BYPASS_MASK_DP_ENC0_P0_MASK                              0x800
+# define PPS_HW_BYPASS_MASK_DP_ENC0_P0_SHIFT                             11
+# define MST_EN_DP_ENC0_P0_MASK                                          0x1000
+# define MST_EN_DP_ENC0_P0_SHIFT                                         12
+# define DSC_BYPASS_EN_DP_ENC0_P0_MASK                                   0x2000
+# define DSC_BYPASS_EN_DP_ENC0_P0_SHIFT                                  13
+# define VSC_HW_BYPASS_MASK_DP_ENC0_P0_MASK                              0x4000
+# define VSC_HW_BYPASS_MASK_DP_ENC0_P0_SHIFT                             14
+# define HDR0_HW_BYPASS_MASK_DP_ENC0_P0_MASK                             0x8000
+# define HDR0_HW_BYPASS_MASK_DP_ENC0_P0_SHIFT                            15
+
+#define MTK_DP_ENC0_P0_31C8              (ENC0_OFFSET + 0x1C8)
+# define VSC_EXT_VESA_HB0_DP_ENC0_P0_MASK                                0xff
+# define VSC_EXT_VESA_HB0_DP_ENC0_P0_SHIFT                               0
+# define VSC_EXT_VESA_HB1_DP_ENC0_P0_MASK                                0xff00
+# define VSC_EXT_VESA_HB1_DP_ENC0_P0_SHIFT                               8
+
+#define MTK_DP_ENC0_P0_31CC              (ENC0_OFFSET + 0x1CC)
+# define VSC_EXT_VESA_HB2_DP_ENC0_P0_MASK                                0xff
+# define VSC_EXT_VESA_HB2_DP_ENC0_P0_SHIFT                               0
+# define VSC_EXT_VESA_HB3_DP_ENC0_P0_MASK                                0xff00
+# define VSC_EXT_VESA_HB3_DP_ENC0_P0_SHIFT                               8
+
+#define MTK_DP_ENC0_P0_31D0              (ENC0_OFFSET + 0x1D0)
+# define VSC_EXT_CEA_HB0_DP_ENC0_P0_MASK                                 0xff
+# define VSC_EXT_CEA_HB0_DP_ENC0_P0_SHIFT                                0
+# define VSC_EXT_CEA_HB1_DP_ENC0_P0_MASK                                 0xff00
+# define VSC_EXT_CEA_HB1_DP_ENC0_P0_SHIFT                                8
+
+#define MTK_DP_ENC0_P0_31D4              (ENC0_OFFSET + 0x1D4)
+# define VSC_EXT_CEA_HB2_DP_ENC0_P0_MASK                                 0xff
+# define VSC_EXT_CEA_HB2_DP_ENC0_P0_SHIFT                                0
+# define VSC_EXT_CEA_HB3_DP_ENC0_P0_MASK                                 0xff00
+# define VSC_EXT_CEA_HB3_DP_ENC0_P0_SHIFT                                8
+
+#define MTK_DP_ENC0_P0_31D8              (ENC0_OFFSET + 0x1D8)
+# define VSC_EXT_VESA_NUM_DP_ENC0_P0_MASK                                0x3f
+# define VSC_EXT_VESA_NUM_DP_ENC0_P0_SHIFT                               0
+# define VSC_EXT_CEA_NUM_DP_ENC0_P0_MASK                                 0x3f00
+# define VSC_EXT_CEA_NUM_DP_ENC0_P0_SHIFT                                8
+
+#define MTK_DP_ENC0_P0_31DC              (ENC0_OFFSET + 0x1DC)
+# define HDR0_CFG_DP_ENC0_P0_MASK                                        0xff
+# define HDR0_CFG_DP_ENC0_P0_SHIFT                                       0
+# define RESERVED_CFG_DP_ENC0_P0_MASK                                    0xff00
+# define RESERVED_CFG_DP_ENC0_P0_SHIFT                                   8
+
+#define MTK_DP_ENC0_P0_31E0              (ENC0_OFFSET + 0x1E0)
+# define RESERVED_HB0_DP_ENC0_P0_MASK                                    0xff
+# define RESERVED_HB0_DP_ENC0_P0_SHIFT                                   0
+# define RESERVED_HB1_DP_ENC0_P0_MASK                                    0xff00
+# define RESERVED_HB1_DP_ENC0_P0_SHIFT                                   8
+
+#define MTK_DP_ENC0_P0_31E4              (ENC0_OFFSET + 0x1E4)
+# define RESERVED_HB2_DP_ENC0_P0_MASK                                    0xff
+# define RESERVED_HB2_DP_ENC0_P0_SHIFT                                   0
+# define RESERVED_HB3_DP_ENC0_P0_MASK                                    0xff00
+# define RESERVED_HB3_DP_ENC0_P0_SHIFT                                   8
+
+#define MTK_DP_ENC0_P0_31E8              (ENC0_OFFSET + 0x1E8)
+# define PPS_CFG_DP_ENC0_P0_MASK                                         0xff
+# define PPS_CFG_DP_ENC0_P0_SHIFT                                        0
+# define PPS_CFG_ONE_TIME_DP_ENC0_P0_MASK                                0x100
+# define PPS_CFG_ONE_TIME_DP_ENC0_P0_SHIFT                               8
+# define SDP_SPLIT_FIFO_READ_START_POINT_DP_ENC0_P0_MASK                 0xf000
+# define SDP_SPLIT_FIFO_READ_START_POINT_DP_ENC0_P0_SHIFT                12
+
+#define MTK_DP_ENC0_P0_31EC              (ENC0_OFFSET + 0x1EC)
+# define VIDEO_M_CODE_FROM_DPRX_DP_ENC0_P0_MASK                          0x1
+# define VIDEO_M_CODE_FROM_DPRX_DP_ENC0_P0_SHIFT                         0
+# define MSA_MISC_FROM_DPRX_DP_ENC0_P0_MASK                              0x2
+# define MSA_MISC_FROM_DPRX_DP_ENC0_P0_SHIFT                             1
+# define ADS_CFG_DP_ENC0_P0_MASK                                         0x4
+# define ADS_CFG_DP_ENC0_P0_SHIFT                                        2
+# define ADS_MODE_DP_ENC0_P0_MASK                                        0x8
+# define ADS_MODE_DP_ENC0_P0_SHIFT                                       3
+# define AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK                                0x10
+# define AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT                               4
+# define ISRC1_HB3_DP_ENC0_P0_MASK                                       0xff00
+# define ISRC1_HB3_DP_ENC0_P0_SHIFT                                      8
+
+#define MTK_DP_ENC0_P0_31F0              (ENC0_OFFSET + 0x1F0)
+# define ADS_HB0_DP_ENC0_P0_MASK                                         0xff
+# define ADS_HB0_DP_ENC0_P0_SHIFT                                        0
+# define ADS_HB1_DP_ENC0_P0_MASK                                         0xff00
+# define ADS_HB1_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_31F8              (ENC0_OFFSET + 0x1F8)
+# define ADS_HB2_DP_ENC0_P0_MASK                                         0xff
+# define ADS_HB2_DP_ENC0_P0_SHIFT                                        0
+# define ADS_HB3_DP_ENC0_P0_MASK                                         0xff00
+# define ADS_HB3_DP_ENC0_P0_SHIFT                                        8
+
+#define MTK_DP_ENC0_P0_31FC              (ENC0_OFFSET + 0x1FC)
+# define VIDEO_ARBITER_DE_LAST_NUM0_SW_DP_ENC0_P0_MASK                   0x3
+# define VIDEO_ARBITER_DE_LAST_NUM0_SW_DP_ENC0_P0_SHIFT                  0
+# define VIDEO_ARBITER_DE_LAST_NUM1_SW_DP_ENC0_P0_MASK                   0xc
+# define VIDEO_ARBITER_DE_LAST_NUM1_SW_DP_ENC0_P0_SHIFT                  2
+# define VIDEO_ARBITER_DE_LAST_NUM2_SW_DP_ENC0_P0_MASK                   0x30
+# define VIDEO_ARBITER_DE_LAST_NUM2_SW_DP_ENC0_P0_SHIFT                  4
+# define VIDEO_ARBITER_DE_LAST_NUM3_SW_DP_ENC0_P0_MASK                   0xc0
+# define VIDEO_ARBITER_DE_LAST_NUM3_SW_DP_ENC0_P0_SHIFT                  6
+# define HDE_NUM_EVEN_EN_SW_LANE0_DP_ENC0_P0_MASK                        0x100
+# define HDE_NUM_EVEN_EN_SW_LANE0_DP_ENC0_P0_SHIFT                       8
+# define HDE_NUM_EVEN_EN_SW_LANE1_DP_ENC0_P0_MASK                        0x200
+# define HDE_NUM_EVEN_EN_SW_LANE1_DP_ENC0_P0_SHIFT                       9
+# define HDE_NUM_EVEN_EN_SW_LANE2_DP_ENC0_P0_MASK                        0x400
+# define HDE_NUM_EVEN_EN_SW_LANE2_DP_ENC0_P0_SHIFT                       10
+# define HDE_NUM_EVEN_EN_SW_LANE3_DP_ENC0_P0_MASK                        0x800
+# define HDE_NUM_EVEN_EN_SW_LANE3_DP_ENC0_P0_SHIFT                       11
+# define DE_LAST_NUM_SW_DP_ENC0_P0_MASK                                  0x1000
+# define DE_LAST_NUM_SW_DP_ENC0_P0_SHIFT                                 12
+
+#define MTK_DP_ENC1_P0_3200              (ENC1_OFFSET + 0x000)
+# define SDP_DB0_DP_ENC1_P0_MASK                                         0xff
+# define SDP_DB0_DP_ENC1_P0_SHIFT                                        0
+# define SDP_DB1_DP_ENC1_P0_MASK                                         0xff00
+# define SDP_DB1_DP_ENC1_P0_SHIFT                                        8
+
+#define MTK_DP_ENC1_P0_3204              (ENC1_OFFSET + 0x004)
+# define SDP_DB2_DP_ENC1_P0_MASK                                         0xff
+# define SDP_DB2_DP_ENC1_P0_SHIFT                                        0
+# define SDP_DB3_DP_ENC1_P0_MASK                                         0xff00
+# define SDP_DB3_DP_ENC1_P0_SHIFT                                        8
+
+#define MTK_DP_ENC1_P0_3208              (ENC1_OFFSET + 0x008)
+# define SDP_DB4_DP_ENC1_P0_MASK                                         0xff
+# define SDP_DB4_DP_ENC1_P0_SHIFT                                        0
+# define SDP_DB5_DP_ENC1_P0_MASK                                         0xff00
+# define SDP_DB5_DP_ENC1_P0_SHIFT                                        8
+
+#define MTK_DP_ENC1_P0_320C              (ENC1_OFFSET + 0x00C)
+# define SDP_DB6_DP_ENC1_P0_MASK                                         0xff
+# define SDP_DB6_DP_ENC1_P0_SHIFT                                        0
+# define SDP_DB7_DP_ENC1_P0_MASK                                         0xff00
+# define SDP_DB7_DP_ENC1_P0_SHIFT                                        8
+
+#define MTK_DP_ENC1_P0_3210              (ENC1_OFFSET + 0x010)
+# define SDP_DB8_DP_ENC1_P0_MASK                                         0xff
+# define SDP_DB8_DP_ENC1_P0_SHIFT                                        0
+# define SDP_DB9_DP_ENC1_P0_MASK                                         0xff00
+# define SDP_DB9_DP_ENC1_P0_SHIFT                                        8
+
+#define MTK_DP_ENC1_P0_3214              (ENC1_OFFSET + 0x014)
+# define SDP_DB10_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB10_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB11_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB11_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3218              (ENC1_OFFSET + 0x018)
+# define SDP_DB12_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB12_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB13_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB13_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_321C              (ENC1_OFFSET + 0x01C)
+# define SDP_DB14_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB14_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB15_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB15_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3220              (ENC1_OFFSET + 0x020)
+# define SDP_DB16_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB16_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB17_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB17_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3224              (ENC1_OFFSET + 0x024)
+# define SDP_DB18_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB18_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB19_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB19_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3228              (ENC1_OFFSET + 0x028)
+# define SDP_DB20_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB20_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB21_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB21_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_322C              (ENC1_OFFSET + 0x02C)
+# define SDP_DB22_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB22_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB23_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB23_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3230              (ENC1_OFFSET + 0x030)
+# define SDP_DB24_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB24_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB25_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB25_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3234              (ENC1_OFFSET + 0x034)
+# define SDP_DB26_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB26_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB27_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB27_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3238              (ENC1_OFFSET + 0x038)
+# define SDP_DB28_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB28_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB29_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB29_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_323C              (ENC1_OFFSET + 0x03C)
+# define SDP_DB30_DP_ENC1_P0_MASK                                        0xff
+# define SDP_DB30_DP_ENC1_P0_SHIFT                                       0
+# define SDP_DB31_DP_ENC1_P0_MASK                                        0xff00
+# define SDP_DB31_DP_ENC1_P0_SHIFT                                       8
+
+#define MTK_DP_ENC1_P0_3240              (ENC1_OFFSET + 0x040)
+# define SDP_DB0_R_DP_ENC1_P0_MASK                                       0xff
+# define SDP_DB0_R_DP_ENC1_P0_SHIFT                                      0
+# define SDP_DB1_R_DP_ENC1_P0_MASK                                       0xff00
+# define SDP_DB1_R_DP_ENC1_P0_SHIFT                                      8
+
+#define MTK_DP_ENC1_P0_3244              (ENC1_OFFSET + 0x044)
+# define SDP_DB2_R_DP_ENC1_P0_MASK                                       0xff
+# define SDP_DB2_R_DP_ENC1_P0_SHIFT                                      0
+# define SDP_DB3_R_DP_ENC1_P0_MASK                                       0xff00
+# define SDP_DB3_R_DP_ENC1_P0_SHIFT                                      8
+
+#define MTK_DP_ENC1_P0_3248              (ENC1_OFFSET + 0x048)
+# define SDP_DB4_R_DP_ENC1_P0_MASK                                       0xff
+# define SDP_DB4_R_DP_ENC1_P0_SHIFT                                      0
+# define SDP_DB5_R_DP_ENC1_P0_MASK                                       0xff00
+# define SDP_DB5_R_DP_ENC1_P0_SHIFT                                      8
+
+#define MTK_DP_ENC1_P0_324C              (ENC1_OFFSET + 0x04C)
+# define SDP_DB6_R_DP_ENC1_P0_MASK                                       0xff
+# define SDP_DB6_R_DP_ENC1_P0_SHIFT                                      0
+# define SDP_DB7_R_DP_ENC1_P0_MASK                                       0xff00
+# define SDP_DB7_R_DP_ENC1_P0_SHIFT                                      8
+
+#define MTK_DP_ENC1_P0_3250              (ENC1_OFFSET + 0x050)
+# define SDP_DB8_R_DP_ENC1_P0_MASK                                       0xff
+# define SDP_DB8_R_DP_ENC1_P0_SHIFT                                      0
+# define SDP_DB9_R_DP_ENC1_P0_MASK                                       0xff00
+# define SDP_DB9_R_DP_ENC1_P0_SHIFT                                      8
+
+#define MTK_DP_ENC1_P0_3254              (ENC1_OFFSET + 0x054)
+# define SDP_DB10_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB10_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB11_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB11_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3258              (ENC1_OFFSET + 0x058)
+# define SDP_DB12_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB12_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB13_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB13_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_325C              (ENC1_OFFSET + 0x05C)
+# define SDP_DB14_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB14_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB15_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB15_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3260              (ENC1_OFFSET + 0x060)
+# define SDP_DB16_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB16_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB17_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB17_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3264              (ENC1_OFFSET + 0x064)
+# define SDP_DB18_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB18_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB19_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB19_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3268              (ENC1_OFFSET + 0x068)
+# define SDP_DB20_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB20_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB21_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB21_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_326C              (ENC1_OFFSET + 0x06C)
+# define SDP_DB22_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB22_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB23_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB23_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3270              (ENC1_OFFSET + 0x070)
+# define SDP_DB24_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB24_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB25_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB25_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3274              (ENC1_OFFSET + 0x074)
+# define SDP_DB26_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB26_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB27_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB27_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3278              (ENC1_OFFSET + 0x078)
+# define SDP_DB28_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB28_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB29_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB29_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_327C              (ENC1_OFFSET + 0x07C)
+# define SDP_DB30_R_DP_ENC1_P0_MASK                                      0xff
+# define SDP_DB30_R_DP_ENC1_P0_SHIFT                                     0
+# define SDP_DB31_R_DP_ENC1_P0_MASK                                      0xff00
+# define SDP_DB31_R_DP_ENC1_P0_SHIFT                                     8
+
+#define MTK_DP_ENC1_P0_3280              (ENC1_OFFSET + 0x080)
+# define SDP_PACKET_TYPE_DP_ENC1_P0_MASK                                 0x1f
+# define SDP_PACKET_TYPE_DP_ENC1_P0_SHIFT                                0
+# define SDP_PACKET_W_DP_ENC1_P0                                         0x20
+# define SDP_PACKET_W_DP_ENC1_P0_MASK                                    0x20
+# define SDP_PACKET_W_DP_ENC1_P0_SHIFT                                   5
+# define SDP_PACKET_R_DP_ENC1_P0_MASK                                    0x40
+# define SDP_PACKET_R_DP_ENC1_P0_SHIFT                                   6
+
+#define MTK_DP_ENC1_P0_328C              (ENC1_OFFSET + 0x08C)
+# define VSC_SW_HW_SEL_VESA_DP_ENC1_P0_MASK                              0x1
+# define VSC_SW_HW_SEL_VESA_DP_ENC1_P0_SHIFT                             0
+# define VSC_SRAM_HW_RST_VESA_DP_ENC1_P0_MASK                            0x2
+# define VSC_SRAM_HW_RST_VESA_DP_ENC1_P0_SHIFT                           1
+# define VSC_SRAM_SW_RST_VESA_DP_ENC1_P0_MASK                            0x4
+# define VSC_SRAM_SW_RST_VESA_DP_ENC1_P0_SHIFT                           2
+# define VSC_SRAM_HW_EMPTY_VESA_DP_ENC1_P0_MASK                          0x8
+# define VSC_SRAM_HW_EMPTY_VESA_DP_ENC1_P0_SHIFT                         3
+# define VSC_SRAM_HW_FULL_VESA_DP_ENC1_P0_MASK                           0x10
+# define VSC_SRAM_HW_FULL_VESA_DP_ENC1_P0_SHIFT                          4
+# define VSC_SRAM_HW_FULL_CLR_VESA_DP_ENC1_P0_MASK                       0x20
+# define VSC_SRAM_HW_FULL_CLR_VESA_DP_ENC1_P0_SHIFT                      5
+# define VSC_DATA_TOGGLE_VESA_DP_ENC1_P0_MASK                            0x40
+# define VSC_DATA_TOGGLE_VESA_DP_ENC1_P0_SHIFT                           6
+# define VSC_DATA_RDY_VESA_DP_ENC1_P0_MASK                               0x80
+# define VSC_DATA_RDY_VESA_DP_ENC1_P0_SHIFT                              7
+# define VSC_SRAM_SW_EMPTY_VESA_DP_ENC1_P0_MASK                          0x100
+# define VSC_SRAM_SW_EMPTY_VESA_DP_ENC1_P0_SHIFT                         8
+
+#define MTK_DP_ENC1_P0_3290              (ENC1_OFFSET + 0x090)
+# define VSC_DATA_BYTE0_VESA_DP_ENC1_P0_MASK                             0xff
+# define VSC_DATA_BYTE0_VESA_DP_ENC1_P0_SHIFT                            0
+# define VSC_DATA_BYTE1_VESA_DP_ENC1_P0_MASK                             0xff00
+# define VSC_DATA_BYTE1_VESA_DP_ENC1_P0_SHIFT                            8
+
+#define MTK_DP_ENC1_P0_3294              (ENC1_OFFSET + 0x094)
+# define VSC_DATA_BYTE2_VESA_DP_ENC1_P0_MASK                             0xff
+# define VSC_DATA_BYTE2_VESA_DP_ENC1_P0_SHIFT                            0
+# define VSC_DATA_BYTE3_VESA_DP_ENC1_P0_MASK                             0xff00
+# define VSC_DATA_BYTE3_VESA_DP_ENC1_P0_SHIFT                            8
+
+#define MTK_DP_ENC1_P0_3298              (ENC1_OFFSET + 0x098)
+# define VSC_DATA_BYTE4_VESA_DP_ENC1_P0_MASK                             0xff
+# define VSC_DATA_BYTE4_VESA_DP_ENC1_P0_SHIFT                            0
+# define VSC_DATA_BYTE5_VESA_DP_ENC1_P0_MASK                             0xff00
+# define VSC_DATA_BYTE5_VESA_DP_ENC1_P0_SHIFT                            8
+
+#define MTK_DP_ENC1_P0_329C              (ENC1_OFFSET + 0x09C)
+# define VSC_DATA_BYTE6_VESA_DP_ENC1_P0_MASK                             0xff
+# define VSC_DATA_BYTE6_VESA_DP_ENC1_P0_SHIFT                            0
+# define VSC_DATA_BYTE7_VESA_DP_ENC1_P0_MASK                             0xff00
+# define VSC_DATA_BYTE7_VESA_DP_ENC1_P0_SHIFT                            8
+
+#define MTK_DP_ENC1_P0_32A0              (ENC1_OFFSET + 0x0A0)
+# define VSC_SW_HW_SEL_CEA_DP_ENC1_P0_MASK                               0x1
+# define VSC_SW_HW_SEL_CEA_DP_ENC1_P0_SHIFT                              0
+# define VSC_SRAM_HW_RST_CEA_DP_ENC1_P0_MASK                             0x2
+# define VSC_SRAM_HW_RST_CEA_DP_ENC1_P0_SHIFT                            1
+# define VSC_SRAM_SW_RST_CEA_DP_ENC1_P0_MASK                             0x4
+# define VSC_SRAM_SW_RST_CEA_DP_ENC1_P0_SHIFT                            2
+# define VSC_SRAM_HW_EMPTY_CEA_DP_ENC1_P0_MASK                           0x8
+# define VSC_SRAM_HW_EMPTY_CEA_DP_ENC1_P0_SHIFT                          3
+# define VSC_SRAM_HW_FULL_CEA_DP_ENC1_P0_MASK                            0x10
+# define VSC_SRAM_HW_FULL_CEA_DP_ENC1_P0_SHIFT                           4
+# define VSC_SRAM_HW_FULL_CLR_CEA_DP_ENC1_P0_MASK                        0x20
+# define VSC_SRAM_HW_FULL_CLR_CEA_DP_ENC1_P0_SHIFT                       5
+# define VSC_DATA_TOGGLE_CEA_DP_ENC1_P0_MASK                             0x40
+# define VSC_DATA_TOGGLE_CEA_DP_ENC1_P0_SHIFT                            6
+# define VSC_DATA_RDY_CEA_DP_ENC1_P0_MASK                                0x80
+# define VSC_DATA_RDY_CEA_DP_ENC1_P0_SHIFT                               7
+# define VSC_SRAM_SW_EMPTY_CEA_DP_ENC1_P0_MASK                           0x100
+# define VSC_SRAM_SW_EMPTY_CEA_DP_ENC1_P0_SHIFT                          8
+
+#define MTK_DP_ENC1_P0_32A4              (ENC1_OFFSET + 0x0A4)
+# define VSC_DATA_BYTE0_CEA_DP_ENC1_P0_MASK                              0xff
+# define VSC_DATA_BYTE0_CEA_DP_ENC1_P0_SHIFT                             0
+# define VSC_DATA_BYTE1_CEA_DP_ENC1_P0_MASK                              0xff00
+# define VSC_DATA_BYTE1_CEA_DP_ENC1_P0_SHIFT                             8
+
+#define MTK_DP_ENC1_P0_32A8              (ENC1_OFFSET + 0x0A8)
+# define VSC_DATA_BYTE2_CEA_DP_ENC1_P0_MASK                              0xff
+# define VSC_DATA_BYTE2_CEA_DP_ENC1_P0_SHIFT                             0
+# define VSC_DATA_BYTE3_CEA_DP_ENC1_P0_MASK                              0xff00
+# define VSC_DATA_BYTE3_CEA_DP_ENC1_P0_SHIFT                             8
+
+#define MTK_DP_ENC1_P0_32AC              (ENC1_OFFSET + 0x0AC)
+# define VSC_DATA_BYTE4_CEA_DP_ENC1_P0_MASK                              0xff
+# define VSC_DATA_BYTE4_CEA_DP_ENC1_P0_SHIFT                             0
+# define VSC_DATA_BYTE5_CEA_DP_ENC1_P0_MASK                              0xff00
+# define VSC_DATA_BYTE5_CEA_DP_ENC1_P0_SHIFT                             8
+
+#define MTK_DP_ENC1_P0_32B0              (ENC1_OFFSET + 0x0B0)
+# define VSC_DATA_BYTE6_CEA_DP_ENC1_P0_MASK                              0xff
+# define VSC_DATA_BYTE6_CEA_DP_ENC1_P0_SHIFT                             0
+# define VSC_DATA_BYTE7_CEA_DP_ENC1_P0_MASK                              0xff00
+# define VSC_DATA_BYTE7_CEA_DP_ENC1_P0_SHIFT                             8
+
+#define MTK_DP_ENC1_P0_32B4              (ENC1_OFFSET + 0x0B4)
+# define VSC_DATA_SW_CAN_WRITE_VESA_DP_ENC1_P0_MASK                      0x1
+# define VSC_DATA_SW_CAN_WRITE_VESA_DP_ENC1_P0_SHIFT                     0
+# define VSC_DATA_SW_CAN_WRITE_CEA_DP_ENC1_P0_MASK                       0x2
+# define VSC_DATA_SW_CAN_WRITE_CEA_DP_ENC1_P0_SHIFT                      1
+# define VSC_DATA_TRANSMIT_SEL_VESA_DP_ENC1_P0_MASK                      0x4
+# define VSC_DATA_TRANSMIT_SEL_VESA_DP_ENC1_P0_SHIFT                     2
+# define VSC_DATA_TRANSMIT_SEL_CEA_DP_ENC1_P0_MASK                       0x8
+# define VSC_DATA_TRANSMIT_SEL_CEA_DP_ENC1_P0_SHIFT                      3
+
+#define MTK_DP_ENC1_P0_32C0              (ENC1_OFFSET + 0x0C0)
+# define IRQ_MASK_DP_ENC1_P0_MASK                                        0xffff
+# define IRQ_MASK_DP_ENC1_P0_SHIFT                                       0
+
+#define MTK_DP_ENC1_P0_32C4              (ENC1_OFFSET + 0x0C4)
+# define IRQ_CLR_DP_ENC1_P0_MASK                                         0xffff
+# define IRQ_CLR_DP_ENC1_P0_SHIFT                                        0
+
+#define MTK_DP_ENC1_P0_32C8              (ENC1_OFFSET + 0x0C8)
+# define IRQ_FORCE_DP_ENC1_P0_MASK                                       0xffff
+# define IRQ_FORCE_DP_ENC1_P0_SHIFT                                      0
+
+#define MTK_DP_ENC1_P0_32CC              (ENC1_OFFSET + 0x0CC)
+# define IRQ_STATUS_DP_ENC1_P0_MASK                                      0xffff
+# define IRQ_STATUS_DP_ENC1_P0_SHIFT                                     0
+
+#define MTK_DP_ENC1_P0_32D0              (ENC1_OFFSET + 0x0D0)
+# define IRQ_FINAL_STATUS_DP_ENC1_P0_MASK                                0xffff
+# define IRQ_FINAL_STATUS_DP_ENC1_P0_SHIFT                               0
+
+#define MTK_DP_ENC1_P0_32D4              (ENC1_OFFSET + 0x0D4)
+# define IRQ_MASK_51_DP_ENC1_P0_MASK                                     0xffff
+# define IRQ_MASK_51_DP_ENC1_P0_SHIFT                                    0
+
+#define MTK_DP_ENC1_P0_32D8              (ENC1_OFFSET + 0x0D8)
+# define IRQ_CLR_51_DP_ENC1_P0_MASK                                      0xffff
+# define IRQ_CLR_51_DP_ENC1_P0_SHIFT                                     0
+
+#define MTK_DP_ENC1_P0_32DC              (ENC1_OFFSET + 0x0DC)
+# define IRQ_FORCE_51_DP_ENC1_P0_MASK                                    0xffff
+# define IRQ_FORCE_51_DP_ENC1_P0_SHIFT                                   0
+
+#define MTK_DP_ENC1_P0_32E0              (ENC1_OFFSET + 0x0E0)
+# define IRQ_STATUS_51_DP_ENC1_P0_MASK                                   0xffff
+# define IRQ_STATUS_51_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_32E4              (ENC1_OFFSET + 0x0E4)
+# define IRQ_FINAL_STATUS_51_DP_ENC1_P0_MASK                             0xffff
+# define IRQ_FINAL_STATUS_51_DP_ENC1_P0_SHIFT                            0
+
+#define MTK_DP_ENC1_P0_32E8              (ENC1_OFFSET + 0x0E8)
+# define AUDIO_SRAM_WRITE_ADDR_0_DP_ENC1_P0_MASK                         0x7f
+# define AUDIO_SRAM_WRITE_ADDR_0_DP_ENC1_P0_SHIFT                        0
+# define AUDIO_SRAM_WRITE_ADDR_1_DP_ENC1_P0_MASK                         0x7f00
+# define AUDIO_SRAM_WRITE_ADDR_1_DP_ENC1_P0_SHIFT                        8
+
+#define MTK_DP_ENC1_P0_32EC              (ENC1_OFFSET + 0x0EC)
+# define AUDIO_SRAM_WRITE_ADDR_2_DP_ENC1_P0_MASK                         0x7f
+# define AUDIO_SRAM_WRITE_ADDR_2_DP_ENC1_P0_SHIFT                        0
+# define AUDIO_SRAM_WRITE_ADDR_3_DP_ENC1_P0_MASK                         0x7f00
+# define AUDIO_SRAM_WRITE_ADDR_3_DP_ENC1_P0_SHIFT                        8
+
+#define MTK_DP_ENC1_P0_32F0              (ENC1_OFFSET + 0x0F0)
+# define M_CODE_FEC_MERGE_0_DP_ENC1_P0_MASK                              0xffff
+# define M_CODE_FEC_MERGE_0_DP_ENC1_P0_SHIFT                             0
+
+#define MTK_DP_ENC1_P0_32F4              (ENC1_OFFSET + 0x0F4)
+# define M_CODE_FEC_MERGE_1_DP_ENC1_P0_MASK                              0xff
+# define M_CODE_FEC_MERGE_1_DP_ENC1_P0_SHIFT                             0
+
+#define MTK_DP_ENC1_P0_32F8              (ENC1_OFFSET + 0x0F8)
+# define MSA_UPDATE_LINE_CNT_THRD_DP_ENC1_P0_MASK                        0xff
+# define MSA_UPDATE_LINE_CNT_THRD_DP_ENC1_P0_SHIFT                       0
+# define SDP_SPLIT_BUG_FIX_DP_ENC1_P0_MASK                               0x200
+# define SDP_SPLIT_BUG_FIX_DP_ENC1_P0_SHIFT                              9
+# define MSA_MUTE_MASK_DP_ENC1_P0_MASK                                   0x400
+# define MSA_MUTE_MASK_DP_ENC1_P0_SHIFT                                  10
+# define MSA_UPDATE_SEL_DP_ENC1_P0_MASK                                  0x3000
+# define MSA_UPDATE_SEL_DP_ENC1_P0_SHIFT                                 12
+# define VIDEO_MUTE_TOGGLE_SEL_DP_ENC1_P0_MASK                           0xc000
+# define VIDEO_MUTE_TOGGLE_SEL_DP_ENC1_P0_SHIFT                          14
+
+#define MTK_DP_ENC1_P0_3300              (ENC1_OFFSET + 0x100)
+# define AUDIO_AFIFO_CNT_SEL_DP_ENC1_P0_MASK                             0x1
+# define AUDIO_AFIFO_CNT_SEL_DP_ENC1_P0_SHIFT                            0
+# define AUDIO_SRAM_CNT_SEL_DP_ENC1_P0_MASK                              0x2
+# define AUDIO_SRAM_CNT_SEL_DP_ENC1_P0_SHIFT                             1
+# define AUDIO_AFIFO_CNT_DP_ENC1_P0_MASK                                 0xf0
+# define AUDIO_AFIFO_CNT_DP_ENC1_P0_SHIFT                                4
+# define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK                             0x300
+# define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_SHIFT                            8
+
+#define MTK_DP_ENC1_P0_3304              (ENC1_OFFSET + 0x104)
+# define AUDIO_SRAM_CNT_DP_ENC1_P0_MASK                                  0x7f
+# define AUDIO_SRAM_CNT_DP_ENC1_P0_SHIFT                                 0
+# define AU_PRTY_REGEN_DP_ENC1_P0_MASK                                   0x100
+# define AU_PRTY_REGEN_DP_ENC1_P0_SHIFT                                  8
+# define AU_CH_STS_REGEN_DP_ENC1_P0_MASK                                 0x200
+# define AU_CH_STS_REGEN_DP_ENC1_P0_SHIFT                                9
+# define AUDIO_VALIDITY_REGEN_DP_ENC1_P0_MASK                            0x400
+# define AUDIO_VALIDITY_REGEN_DP_ENC1_P0_SHIFT                           10
+# define AUDIO_RESERVED_REGEN_DP_ENC1_P0_MASK                            0x800
+# define AUDIO_RESERVED_REGEN_DP_ENC1_P0_SHIFT                           11
+# define AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK                       0x1000
+# define AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_SHIFT                      12
+
+#define MTK_DP_ENC1_P0_3320              (ENC1_OFFSET + 0x120)
+# define AUDIO_PATTERN_GEN_DSTB_CNT_THRD_DP_ENC1_P0_MASK                 0x1ff
+# define AUDIO_PATTERN_GEN_DSTB_CNT_THRD_DP_ENC1_P0_SHIFT                0
+
+#define MTK_DP_ENC1_P0_3324              (ENC1_OFFSET + 0x124)
+# define AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK                                0x300
+# define AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT                               8
+# define AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX                                (0 << AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT)
+# define AUDIO_SOURCE_MUX_DP_ENC1_P0_HDMIRX                              (1 << AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT)
+# define AUDIO_SOURCE_MUX_DP_ENC1_P0_HAYDYN                              (2 << AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT)
+# define AUDIO_PATTERN_GEN_CH_NUM_DP_ENC1_P0_MASK                        0x3000
+# define AUDIO_PATGEN_CH_NUM_DP_ENC1_P0_SHIFT                            12
+# define AUDIO_PATTERN_GEN_FS_SEL_DP_ENC1_P0_MASK                        0xc000
+# define AUDIO_PATGEN_FS_SEL_DP_ENC1_P0_SHIFT                            14
+
+#define MTK_DP_ENC1_P0_3328              (ENC1_OFFSET + 0x128)
+# define VSYNC_DETECT_POL_DP_ENC1_P0_MASK                                0x1
+# define VSYNC_DETECT_POL_DP_ENC1_P0_SHIFT                               0
+# define HSYNC_DETECT_POL_DP_ENC1_P0_MASK                                0x2
+# define HSYNC_DETECT_POL_DP_ENC1_P0_SHIFT                               1
+# define HTOTAL_DETECT_STABLE_DP_ENC1_P0_MASK                            0x4
+# define HTOTAL_DETECT_STABLE_DP_ENC1_P0_SHIFT                           2
+# define HDE_DETECT_STABLE_DP_ENC1_P0_MASK                               0x8
+# define HDE_DETECT_STABLE_DP_ENC1_P0_SHIFT                              3
+
+#define MTK_DP_ENC1_P0_332C              (ENC1_OFFSET + 0x12C)
+# define VTOTAL_DETECT_DP_ENC1_P0_MASK                                   0xffff
+# define VTOTAL_DETECT_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_3330              (ENC1_OFFSET + 0x130)
+# define VDE_DETECT_DP_ENC1_P0_MASK                                      0xffff
+# define VDE_DETECT_DP_ENC1_P0_SHIFT                                     0
+
+#define MTK_DP_ENC1_P0_3334              (ENC1_OFFSET + 0x134)
+# define HTOTAL_DETECT_DP_ENC1_P0_MASK                                   0xffff
+# define HTOTAL_DETECT_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_3338              (ENC1_OFFSET + 0x138)
+# define HDE_DETECT_DP_ENC1_P0_MASK                                      0xffff
+# define HDE_DETECT_DP_ENC1_P0_SHIFT                                     0
+
+#define MTK_DP_ENC1_P0_3340              (ENC1_OFFSET + 0x140)
+# define BIST_FAIL_VIDEO_L0_DP_ENC1_P0_MASK                              0x1
+# define BIST_FAIL_VIDEO_L0_DP_ENC1_P0_SHIFT                             0
+# define BIST_FAIL_VIDEO_L1_DP_ENC1_P0_MASK                              0x2
+# define BIST_FAIL_VIDEO_L1_DP_ENC1_P0_SHIFT                             1
+# define BIST_FAIL_VIDEO_L2_DP_ENC1_P0_MASK                              0x4
+# define BIST_FAIL_VIDEO_L2_DP_ENC1_P0_SHIFT                             2
+# define BIST_FAIL_VIDEO_L3_DP_ENC1_P0_MASK                              0x8
+# define BIST_FAIL_VIDEO_L3_DP_ENC1_P0_SHIFT                             3
+# define BIST_FAIL_AUDIO_L0_DP_ENC1_P0_MASK                              0x10
+# define BIST_FAIL_AUDIO_L0_DP_ENC1_P0_SHIFT                             4
+# define BIST_FAIL_AUDIO_L1_DP_ENC1_P0_MASK                              0x20
+# define BIST_FAIL_AUDIO_L1_DP_ENC1_P0_SHIFT                             5
+# define BIST_FAIL_AUDIO_L2_DP_ENC1_P0_MASK                              0x40
+# define BIST_FAIL_AUDIO_L2_DP_ENC1_P0_SHIFT                             6
+# define BIST_FAIL_AUDIO_L3_DP_ENC1_P0_MASK                              0x80
+# define BIST_FAIL_AUDIO_L3_DP_ENC1_P0_SHIFT                             7
+# define BIST_FAIL_VSC_VESA_HW_DP_ENC1_P0_MASK                           0x100
+# define BIST_FAIL_VSC_VESA_HW_DP_ENC1_P0_SHIFT                          8
+# define BIST_FAIL_VSC_CEA_HW_DP_ENC1_P0_MASK                            0x200
+# define BIST_FAIL_VSC_CEA_HW_DP_ENC1_P0_SHIFT                           9
+# define BIST_FAIL_VSC_VESA_SW_DP_ENC1_P0_MASK                           0x400
+# define BIST_FAIL_VSC_VESA_SW_DP_ENC1_P0_SHIFT                          10
+# define BIST_FAIL_VSC_CEA_SW_DP_ENC1_P0_MASK                            0x800
+# define BIST_FAIL_VSC_CEA_SW_DP_ENC1_P0_SHIFT                           11
+# define LR_FIELD_SYNC_SEL_DP_ENC1_P0_MASK                               0x7000
+# define LR_FIELD_SYNC_SEL_DP_ENC1_P0_SHIFT                              12
+
+#define MTK_DP_ENC1_P0_3344              (ENC1_OFFSET + 0x144)
+# define DP_CH1_MATRIX_DP_ENC1_P0_MASK                                   0x1f
+# define DP_CH1_MATRIX_DP_ENC1_P0_SHIFT                                  0
+# define DP_CH2_MATRIX_DP_ENC1_P0_MASK                                   0x1f00
+# define DP_CH2_MATRIX_DP_ENC1_P0_SHIFT                                  8
+
+#define MTK_DP_ENC1_P0_3348              (ENC1_OFFSET + 0x148)
+# define DP_CH3_MATRIX_DP_ENC1_P0_MASK                                   0x1f
+# define DP_CH3_MATRIX_DP_ENC1_P0_SHIFT                                  0
+# define DP_CH4_MATRIX_DP_ENC1_P0_MASK                                   0x1f00
+# define DP_CH4_MATRIX_DP_ENC1_P0_SHIFT                                  8
+
+#define MTK_DP_ENC1_P0_334C              (ENC1_OFFSET + 0x14C)
+# define DP_CH5_MATRIX_DP_ENC1_P0_MASK                                   0x1f
+# define DP_CH5_MATRIX_DP_ENC1_P0_SHIFT                                  0
+# define DP_CH6_MATRIX_DP_ENC1_P0_MASK                                   0x1f00
+# define DP_CH6_MATRIX_DP_ENC1_P0_SHIFT                                  8
+
+#define MTK_DP_ENC1_P0_3350              (ENC1_OFFSET + 0x150)
+# define DP_CH7_MATRIX_DP_ENC1_P0_MASK                                   0x1f
+# define DP_CH7_MATRIX_DP_ENC1_P0_SHIFT                                  0
+# define DP_CH8_MATRIX_DP_ENC1_P0_MASK                                   0x1f00
+# define DP_CH8_MATRIX_DP_ENC1_P0_SHIFT                                  8
+
+#define MTK_DP_ENC1_P0_3354              (ENC1_OFFSET + 0x154)
+# define DP_S2P_LAUNCH_CFG_DP_ENC1_P0_MASK                               0x7f
+# define DP_S2P_LAUNCH_CFG_DP_ENC1_P0_SHIFT                              0
+# define AUDIO_HAYDN_EN_FORCE_DP_ENC1_P0_MASK                            0x1000
+# define AUDIO_HAYDN_EN_FORCE_DP_ENC1_P0_SHIFT                           12
+# define AUDIO_HAYDN_FORMAT_DP_ENC1_P0_MASK                              0xf00
+# define AUDIO_HAYDN_FORMAT_DP_ENC1_P0_SHIFT                             8
+
+#define MTK_DP_ENC1_P0_3358              (ENC1_OFFSET + 0x158)
+# define TU_SIZE_DP_ENC1_P0_MASK                                         0x7f
+# define TU_SIZE_DP_ENC1_P0_SHIFT                                        0
+# define TU_CALC_SW_DP_ENC1_P0_MASK                                      0x80
+# define TU_CALC_SW_DP_ENC1_P0_SHIFT                                     7
+
+#define MTK_DP_ENC1_P0_335C              (ENC1_OFFSET + 0x15C)
+# define SYMBOL_DATA_PER_TU_SW_0_DP_ENC1_P0_MASK                         0xffff
+# define SYMBOL_DATA_PER_TU_SW_0_DP_ENC1_P0_SHIFT                        0
+
+#define MTK_DP_ENC1_P0_3360              (ENC1_OFFSET + 0x160)
+# define SYMBOL_DATA_PER_TU_SW_1_DP_ENC1_P0_MASK                         0x7fff
+# define SYMBOL_DATA_PER_TU_SW_1_DP_ENC1_P0_SHIFT                        0
+
+#define MTK_DP_ENC1_P0_3364              (ENC1_OFFSET + 0x164)
+# define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK                     0xfff
+# define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT                    0
+# define FIFO_READ_START_POINT_DP_ENC1_P0_MASK                           0xf000
+# define FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT                          12
+
+#define MTK_DP_ENC1_P0_3368              (ENC1_OFFSET + 0x168)
+# define VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_MASK                   0x3
+# define VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT                  0
+# define VIDEO_STABLE_EN_DP_ENC1_P0_MASK                                 0x4
+# define VIDEO_STABLE_EN_DP_ENC1_P0_SHIFT                                2
+# define VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_MASK                           0xf0
+# define VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT                          4
+# define SDP_DP13_EN_DP_ENC1_P0_MASK                                     0x100
+# define SDP_DP13_EN_DP_ENC1_P0_SHIFT                                    8
+# define VIDEO_PIXEL_SWAP_DP_ENC1_P0_MASK                                0x600
+# define VIDEO_PIXEL_SWAP_DP_ENC1_P0_SHIFT                               9
+# define BS2BS_MODE_DP_ENC1_P0_MASK                                      0x3000
+# define BS2BS_MODE_DP_ENC1_P0_SHIFT                                     12
+
+#define MTK_DP_ENC1_P0_336C              (ENC1_OFFSET + 0x16C)
+# define DSC_EN_DP_ENC1_P0_MASK                                          0x1
+# define DSC_EN_DP_ENC1_P0_SHIFT                                         0
+# define DSC_BYTE_SWAP_DP_ENC1_P0_MASK                                   0x2
+# define DSC_BYTE_SWAP_DP_ENC1_P0_SHIFT                                  1
+# define DSC_SLICE_NUM_DP_ENC1_P0_MASK                                   0xf0
+# define DSC_SLICE_NUM_DP_ENC1_P0_SHIFT                                  4
+# define DSC_CHUNK_REMAINDER_DP_ENC1_P0_MASK                             0xf00
+# define DSC_CHUNK_REMAINDER_DP_ENC1_P0_SHIFT                            8
+
+#define MTK_DP_ENC1_P0_3370              (ENC1_OFFSET + 0x170)
+# define DSC_CHUNK_NUM_DP_ENC1_P0_MASK                                   0xffff
+# define DSC_CHUNK_NUM_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_33AC              (ENC1_OFFSET + 0x1AC)
+# define TEST_CRC_R_CR_DP_ENC1_P0_MASK                                   0xffff
+# define TEST_CRC_R_CR_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_33B0              (ENC1_OFFSET + 0x1B0)
+# define TEST_CRC_G_Y_DP_ENC1_P0_MASK                                    0xffff
+# define TEST_CRC_G_Y_DP_ENC1_P0_SHIFT                                   0
+
+#define MTK_DP_ENC1_P0_33B4              (ENC1_OFFSET + 0x1B4)
+# define TEST_CRC_B_CB_DP_ENC1_P0_MASK                                   0xffff
+# define TEST_CRC_B_CB_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_33B8              (ENC1_OFFSET + 0x1B8)
+# define TEST_CRC_WRAP_CNT_DP_ENC1_P0_MASK                               0xf
+# define TEST_CRC_WRAP_CNT_DP_ENC1_P0_SHIFT                              0
+# define CRC_COLOR_FORMAT_DP_ENC1_P0_MASK                                0x1f0
+# define CRC_COLOR_FORMAT_DP_ENC1_P0_SHIFT                               4
+# define CRC_TEST_SINK_START_DP_ENC1_P0_MASK                             0x200
+# define CRC_TEST_SINK_START_DP_ENC1_P0_SHIFT                            9
+
+#define MTK_DP_ENC1_P0_33BC              (ENC1_OFFSET + 0x1BC)
+# define CRC_TEST_CONFIG_DP_ENC1_P0_MASK                                 0x1fff
+# define CRC_TEST_CONFIG_DP_ENC1_P0_SHIFT                                0
+
+#define MTK_DP_ENC1_P0_33C0              (ENC1_OFFSET + 0x1C0)
+# define VIDEO_TU_VALUE_DP_ENC1_P0_MASK                                  0x7f
+# define VIDEO_TU_VALUE_DP_ENC1_P0_SHIFT                                 0
+# define DP_TX_MIXER_TESTBUS_SEL_DP_ENC1_P0_MASK                         0xf00
+# define DP_TX_MIXER_TESTBUS_SEL_DP_ENC1_P0_SHIFT                        8
+# define DP_TX_SDP_TESTBUS_SEL_DP_ENC1_P0_MASK                           0xf000
+# define DP_TX_SDP_TESTBUS_SEL_DP_ENC1_P0_SHIFT                          12
+
+#define MTK_DP_ENC1_P0_33C4              (ENC1_OFFSET + 0x1C4)
+# define DP_TX_VIDEO_TESTBUS_SEL_DP_ENC1_P0_MASK                         0x1f
+# define DP_TX_VIDEO_TESTBUS_SEL_DP_ENC1_P0_SHIFT                        0
+# define DP_TX_ENCODER_TESTBUS_SEL_DP_ENC1_P0_MASK                       0x60
+# define DP_TX_ENCODER_TESTBUS_SEL_DP_ENC1_P0_SHIFT                      5
+
+#define MTK_DP_ENC1_P0_33C8              (ENC1_OFFSET + 0x1C8)
+# define VIDEO_M_CODE_READ_0_DP_ENC1_P0_MASK                             0xffff
+# define VIDEO_M_CODE_READ_0_DP_ENC1_P0_SHIFT                            0
+
+#define MTK_DP_ENC1_P0_33CC              (ENC1_OFFSET + 0x1CC)
+# define VIDEO_M_CODE_READ_1_DP_ENC1_P0_MASK                             0xff
+# define VIDEO_M_CODE_READ_1_DP_ENC1_P0_SHIFT                            0
+
+#define MTK_DP_ENC1_P0_33D0              (ENC1_OFFSET + 0x1D0)
+# define AUDIO_M_CODE_READ_0_DP_ENC1_P0_MASK                             0xffff
+# define AUDIO_M_CODE_READ_0_DP_ENC1_P0_SHIFT                            0
+
+#define MTK_DP_ENC1_P0_33D4              (ENC1_OFFSET + 0x1D4)
+# define AUDIO_M_CODE_READ_1_DP_ENC1_P0_MASK                             0xff
+# define AUDIO_M_CODE_READ_1_DP_ENC1_P0_SHIFT                            0
+
+#define MTK_DP_ENC1_P0_33D8              (ENC1_OFFSET + 0x1D8)
+# define VSC_EXT_CFG_DP_ENC1_P0_MASK                                     0xff
+# define VSC_EXT_CFG_DP_ENC1_P0_SHIFT                                    0
+# define SDP_SPLIT_FIFO_EMPTY_DP_ENC1_P0_MASK                            0x100
+# define SDP_SPLIT_FIFO_EMPTY_DP_ENC1_P0_SHIFT                           8
+# define SDP_SPLIT_FIFO_FULL_DP_ENC1_P0_MASK                             0x200
+# define SDP_SPLIT_FIFO_FULL_DP_ENC1_P0_SHIFT                            9
+# define SDP_SPLIT_FIFO_FULL_CLR_DP_ENC1_P0_MASK                         0x400
+# define SDP_SPLIT_FIFO_FULL_CLR_DP_ENC1_P0_SHIFT                        10
+# define SDP_SPLIT_INSERT_INVALID_CNT_THRD_DP_ENC1_P0_MASK               0xf000
+# define SDP_SPLIT_INSERT_INVALID_CNT_THRD_DP_ENC1_P0_SHIFT              12
+
+#define MTK_DP_ENC1_P0_33DC              (ENC1_OFFSET + 0x1DC)
+# define VIDEO_SRAM0_FULL_DP_ENC1_P0_MASK                                0x1
+# define VIDEO_SRAM0_FULL_DP_ENC1_P0_SHIFT                               0
+# define VIDEO_SRAM0_FULL_CLR_DP_ENC1_P0_MASK                            0x2
+# define VIDEO_SRAM0_FULL_CLR_DP_ENC1_P0_SHIFT                           1
+# define VIDEO_SRAM1_FULL_DP_ENC1_P0_MASK                                0x4
+# define VIDEO_SRAM1_FULL_DP_ENC1_P0_SHIFT                               2
+# define VIDEO_SRAM1_FULL_CLR_DP_ENC1_P0_MASK                            0x8
+# define VIDEO_SRAM1_FULL_CLR_DP_ENC1_P0_SHIFT                           3
+# define VIDEO_SRAM2_FULL_DP_ENC1_P0_MASK                                0x10
+# define VIDEO_SRAM2_FULL_DP_ENC1_P0_SHIFT                               4
+# define VIDEO_SRAM2_FULL_CLR_DP_ENC1_P0_MASK                            0x20
+# define VIDEO_SRAM2_FULL_CLR_DP_ENC1_P0_SHIFT                           5
+# define VIDEO_SRAM3_FULL_DP_ENC1_P0_MASK                                0x40
+# define VIDEO_SRAM3_FULL_DP_ENC1_P0_SHIFT                               6
+# define VIDEO_SRAM3_FULL_CLR_DP_ENC1_P0_MASK                            0x80
+# define VIDEO_SRAM3_FULL_CLR_DP_ENC1_P0_SHIFT                           7
+# define VIDEO_SRAM0_EMPTY_DP_ENC1_P0_MASK                               0x100
+# define VIDEO_SRAM0_EMPTY_DP_ENC1_P0_SHIFT                              8
+# define VIDEO_SRAM0_EMPTY_CLR_DP_ENC1_P0_MASK                           0x200
+# define VIDEO_SRAM0_EMPTY_CLR_DP_ENC1_P0_SHIFT                          9
+# define VIDEO_SRAM1_EMPTY_DP_ENC1_P0_MASK                               0x400
+# define VIDEO_SRAM1_EMPTY_DP_ENC1_P0_SHIFT                              10
+# define VIDEO_SRAM1_EMPTY_CLR_DP_ENC1_P0_MASK                           0x800
+# define VIDEO_SRAM1_EMPTY_CLR_DP_ENC1_P0_SHIFT                          11
+# define VIDEO_SRAM2_EMPTY_DP_ENC1_P0_MASK                               0x1000
+# define VIDEO_SRAM2_EMPTY_DP_ENC1_P0_SHIFT                              12
+# define VIDEO_SRAM2_EMPTY_CLR_DP_ENC1_P0_MASK                           0x2000
+# define VIDEO_SRAM2_EMPTY_CLR_DP_ENC1_P0_SHIFT                          13
+# define VIDEO_SRAM3_EMPTY_DP_ENC1_P0_MASK                               0x4000
+# define VIDEO_SRAM3_EMPTY_DP_ENC1_P0_SHIFT                              14
+# define VIDEO_SRAM3_EMPTY_CLR_DP_ENC1_P0_MASK                           0x8000
+# define VIDEO_SRAM3_EMPTY_CLR_DP_ENC1_P0_SHIFT                          15
+
+#define MTK_DP_ENC1_P0_33E0              (ENC1_OFFSET + 0x1E0)
+# define BS2BS_CNT_SW_DP_ENC1_P0_MASK                                    0xffff
+# define BS2BS_CNT_SW_DP_ENC1_P0_SHIFT                                   0
+
+#define MTK_DP_ENC1_P0_33E4              (ENC1_OFFSET + 0x1E4)
+# define MIXER_STATE_0_DP_ENC1_P0_MASK                                   0xffff
+# define MIXER_STATE_0_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_33E8              (ENC1_OFFSET + 0x1E8)
+# define MIXER_STATE_1_DP_ENC1_P0_MASK                                   0xffff
+# define MIXER_STATE_1_DP_ENC1_P0_SHIFT                                  0
+
+#define MTK_DP_ENC1_P0_33EC              (ENC1_OFFSET + 0x1EC)
+# define MIXER_STATE_2_DP_ENC1_P0_MASK                                   0xff
+# define MIXER_STATE_2_DP_ENC1_P0_SHIFT                                  0
+# define VIDEO_PERIOD_ENABLE_DP_ENC1_P0_MASK                             0x200
+# define VIDEO_PERIOD_ENABLE_DP_ENC1_P0_SHIFT                            9
+# define BS2BS_CNT_SW_SEL_DP_ENC1_P0_MASK                                0x400
+# define BS2BS_CNT_SW_SEL_DP_ENC1_P0_SHIFT                               10
+# define AUDIO_SRAM_FULL_DP_ENC1_P0_MASK                                 0x800
+# define AUDIO_SRAM_FULL_DP_ENC1_P0_SHIFT                                11
+# define AUDIO_SRAM_FULL_CLR_DP_ENC1_P0_MASK                             0x1000
+# define AUDIO_SRAM_FULL_CLR_DP_ENC1_P0_SHIFT                            12
+# define AUDIO_SRAM_EMPTY_DP_ENC1_P0_MASK                                0x2000
+# define AUDIO_SRAM_EMPTY_DP_ENC1_P0_SHIFT                               13
+
+#define MTK_DP_ENC1_P0_33F0              (ENC1_OFFSET + 0x1F0)
+# define DP_ENCODER_DUMMY_RW_0_DP_ENC1_P0_MASK                           0xffff
+# define DP_ENCODER_DUMMY_RW_0_DP_ENC1_P0_SHIFT                          0
+
+#define MTK_DP_ENC1_P0_33F4              (ENC1_OFFSET + 0x1F4)
+# define DP_ENCODER_DUMMY_RW_1_DP_ENC1_P0_MASK                           0xffff
+# define DP_ENCODER_DUMMY_RW_1_DP_ENC1_P0_SHIFT                          0
+
+#define MTK_DP_ENC1_P0_33F8              (ENC1_OFFSET + 0x1F8)
+# define DP_ENCODER_DUMMY_R_0_DP_ENC1_P0_MASK                            0xffff
+# define DP_ENCODER_DUMMY_R_0_DP_ENC1_P0_SHIFT                           0
+
+#define MTK_DP_ENC1_P0_33FC              (ENC1_OFFSET + 0x1FC)
+# define DP_ENCODER_DUMMY_R_1_DP_ENC1_P0_MASK                            0xffff
+# define DP_ENCODER_DUMMY_R_1_DP_ENC1_P0_SHIFT                           0
+
+#define MTK_DP_TRANS_P0_3400              (TRANS_OFFSET + 0x000)
+# define PRE_MISC_LANE0_MUX_DP_TRANS_P0_MASK                                 0x3
+# define PRE_MISC_LANE0_MUX_DP_TRANS_P0_SHIFT                                0
+# define PRE_MISC_LANE1_MUX_DP_TRANS_P0_MASK                                 0xc
+# define PRE_MISC_LANE1_MUX_DP_TRANS_P0_SHIFT                                2
+# define PRE_MISC_LANE2_MUX_DP_TRANS_P0_MASK                                 0x30
+# define PRE_MISC_LANE2_MUX_DP_TRANS_P0_SHIFT                                4
+# define PRE_MISC_LANE3_MUX_DP_TRANS_P0_MASK                                 0xc0
+# define PRE_MISC_LANE3_MUX_DP_TRANS_P0_SHIFT                                6
+# define PRE_MISC_PORT_MUX_DP_TRANS_P0_MASK                                  0x700
+# define PRE_MISC_PORT_MUX_DP_TRANS_P0_SHIFT                                 8
+# define HDCP_SEL_DP_TRANS_P0_MASK                                           0x800
+# define HDCP_SEL_DP_TRANS_P0_SHIFT                                          11
+# define PATTERN1_EN_DP_TRANS_P0_MASK                                        0x1000
+# define PATTERN1_EN_DP_TRANS_P0_SHIFT                                       12
+# define PATTERN2_EN_DP_TRANS_P0_MASK                                        0x2000
+# define PATTERN2_EN_DP_TRANS_P0_SHIFT                                       13
+# define PATTERN3_EN_DP_TRANS_P0_MASK                                        0x4000
+# define PATTERN3_EN_DP_TRANS_P0_SHIFT                                       14
+# define PATTERN4_EN_DP_TRANS_P0_MASK                                        0x8000
+# define PATTERN4_EN_DP_TRANS_P0_SHIFT                                       15
+
+#define MTK_DP_TRANS_P0_3404              (TRANS_OFFSET + 0x004)
+# define DP_SCR_EN_DP_TRANS_P0_MASK                                          0x1
+# define DP_SCR_EN_DP_TRANS_P0_SHIFT                                         0
+# define ALTER_SCRAMBLER_RESET_EN_DP_TRANS_P0_MASK                           0x2
+# define ALTER_SCRAMBLER_RESET_EN_DP_TRANS_P0_SHIFT                          1
+# define SCRAMB_BYPASS_IN_EN_DP_TRANS_P0_MASK                                0x4
+# define SCRAMB_BYPASS_IN_EN_DP_TRANS_P0_SHIFT                               2
+# define SCRAMB_BYPASS_MASK_DP_TRANS_P0_MASK                                 0x8
+# define SCRAMB_BYPASS_MASK_DP_TRANS_P0_SHIFT                                3
+# define INDEX_SCR_MODE_DP_TRANS_P0_MASK                                     0x30
+# define INDEX_SCR_MODE_DP_TRANS_P0_SHIFT                                    4
+# define PAT_INIT_DISPARITY_DP_TRANS_P0_MASK                                 0x40
+# define PAT_INIT_DISPARITY_DP_TRANS_P0_SHIFT                                6
+# define TPS_DISPARITY_RESET_DP_TRANS_P0_MASK                                0x80
+# define TPS_DISPARITY_RESET_DP_TRANS_P0_SHIFT                               7
+
+#define MTK_DP_TRANS_P0_3408              (TRANS_OFFSET + 0x008)
+# define LANE_SKEW_SEL_LANE0_DP_TRANS_P0_MASK                                0x3
+# define LANE_SKEW_SEL_LANE0_DP_TRANS_P0_SHIFT                               0
+# define LANE_SKEW_SEL_LANE1_DP_TRANS_P0_MASK                                0xc
+# define LANE_SKEW_SEL_LANE1_DP_TRANS_P0_SHIFT                               2
+# define LANE_SKEW_SEL_LANE2_DP_TRANS_P0_MASK                                0x30
+# define LANE_SKEW_SEL_LANE2_DP_TRANS_P0_SHIFT                               4
+# define LANE_SKEW_SEL_LANE3_DP_TRANS_P0_MASK                                0xc0
+# define LANE_SKEW_SEL_LANE3_DP_TRANS_P0_SHIFT                               6
+# define POST_MISC_LANE0_MUX_DP_TRANS_P0_MASK                                0x300
+# define POST_MISC_LANE0_MUX_DP_TRANS_P0_SHIFT                               8
+# define POST_MISC_LANE1_MUX_DP_TRANS_P0_MASK                                0xc00
+# define POST_MISC_LANE1_MUX_DP_TRANS_P0_SHIFT                               10
+# define POST_MISC_LANE2_MUX_DP_TRANS_P0_MASK                                0x3000
+# define POST_MISC_LANE2_MUX_DP_TRANS_P0_SHIFT                               12
+# define POST_MISC_LANE3_MUX_DP_TRANS_P0_MASK                                0xc000
+# define POST_MISC_LANE3_MUX_DP_TRANS_P0_SHIFT                               14
+
+#define MTK_DP_TRANS_P0_340C              (TRANS_OFFSET + 0x00C)
+# define TOP_RESET_SW_DP_TRANS_P0_MASK                                       0x100
+# define TOP_RESET_SW_DP_TRANS_P0_SHIFT                                      8
+# define LANE0_RESET_SW_DP_TRANS_P0_MASK                                     0x200
+# define LANE0_RESET_SW_DP_TRANS_P0_SHIFT                                    9
+# define LANE1_RESET_SW_DP_TRANS_P0_MASK                                     0x400
+# define LANE1_RESET_SW_DP_TRANS_P0_SHIFT                                    10
+# define LANE2_RESET_SW_DP_TRANS_P0_MASK                                     0x800
+# define LANE2_RESET_SW_DP_TRANS_P0_SHIFT                                    11
+# define LANE3_RESET_SW_DP_TRANS_P0_MASK                                     0x1000
+# define LANE3_RESET_SW_DP_TRANS_P0_SHIFT                                    12
+# define DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK                      0x2000
+# define DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_SHIFT                     13
+# define HDCP13_RST_SW_DP_TRANS_P0_MASK                                      0x4000
+# define HDCP13_RST_SW_DP_TRANS_P0_SHIFT                                     14
+# define HDCP22_RST_SW_DP_TRANS_P0_MASK                                      0x8000
+# define HDCP22_RST_SW_DP_TRANS_P0_SHIFT                                     15
+
+#define MTK_DP_TRANS_P0_3410              (TRANS_OFFSET + 0x010)
+# define HPD_DEB_THD_DP_TRANS_P0_MASK                                        0xf
+# define HPD_DEB_THD_DP_TRANS_P0_SHIFT                                       0
+# define HPD_INT_THD_DP_TRANS_P0_MASK                                        0xf0
+# define HPD_INT_THD_DP_TRANS_P0_SHIFT                                       4
+# define HPD_INT_THD_DP_TRANS_P0_LOWER_100US                                 (0 << HPD_INT_THD_DP_TRANS_P0_SHIFT)
+# define HPD_INT_THD_DP_TRANS_P0_LOWER_300US                                 (1 << HPD_INT_THD_DP_TRANS_P0_SHIFT)
+# define HPD_INT_THD_DP_TRANS_P0_LOWER_500US                                 (2 << HPD_INT_THD_DP_TRANS_P0_SHIFT)
+# define HPD_INT_THD_DP_TRANS_P0_LOWER_700US                                 (3 << HPD_INT_THD_DP_TRANS_P0_SHIFT)
+# define HPD_INT_THD_DP_TRANS_P0_UPPER_700US                                 (0 << (HPD_INT_THD_DP_TRANS_P0_SHIFT + 2))
+# define HPD_INT_THD_DP_TRANS_P0_UPPER_900US                                 (1 << (HPD_INT_THD_DP_TRANS_P0_SHIFT + 2))
+# define HPD_INT_THD_DP_TRANS_P0_UPPER_1100US                                (2 << (HPD_INT_THD_DP_TRANS_P0_SHIFT + 2))
+# define HPD_INT_THD_DP_TRANS_P0_UPPER_1300US                                (3 << (HPD_INT_THD_DP_TRANS_P0_SHIFT + 2))
+# define HPD_DISC_THD_DP_TRANS_P0_MASK                                       0xf00
+# define HPD_DISC_THD_DP_TRANS_P0_SHIFT                                      8
+# define HPD_CONN_THD_DP_TRANS_P0_MASK                                       0xf000
+# define HPD_CONN_THD_DP_TRANS_P0_SHIFT                                      12
+
+#define MTK_DP_TRANS_P0_3414              (TRANS_OFFSET + 0x014)
+# define HPD_OVR_EN_DP_TRANS_P0_MASK                                         0x1
+# define HPD_OVR_EN_DP_TRANS_P0_SHIFT                                        0
+# define HPD_SET_DP_TRANS_P0_MASK                                            0x2
+# define HPD_SET_DP_TRANS_P0_SHIFT                                           1
+# define HPD_DB_DP_TRANS_P0_MASK                                             0x4
+# define HPD_DB_DP_TRANS_P0_SHIFT                                            2
+
+#define MTK_DP_TRANS_P0_3418              (TRANS_OFFSET + 0x018)
+# define IRQ_CLR_DP_TRANS_P0_MASK                                            0xf
+# define IRQ_CLR_DP_TRANS_P0_SHIFT                                           0
+# define IRQ_MASK_DP_TRANS_P0_MASK                                           0xf0
+# define IRQ_MASK_DP_TRANS_P0_SHIFT                                          4
+# define IRQ_MASK_DP_TRANS_P0_DISC_IRQ                                       (BIT(1) << IRQ_MASK_DP_TRANS_P0_SHIFT)
+# define IRQ_MASK_DP_TRANS_P0_CONN_IRQ                                       (BIT(2) << IRQ_MASK_DP_TRANS_P0_SHIFT)
+# define IRQ_MASK_DP_TRANS_P0_INT_IRQ                                        (BIT(3) << IRQ_MASK_DP_TRANS_P0_SHIFT)
+# define IRQ_FORCE_DP_TRANS_P0_MASK                                          0xf00
+# define IRQ_FORCE_DP_TRANS_P0_SHIFT                                         8
+# define IRQ_STATUS_DP_TRANS_P0_MASK                                         0xf000
+# define IRQ_STATUS_DP_TRANS_P0_SHIFT                                        12
+# define IRQ_STATUS_DP_TRANS_P0_DISC_IRQ                                     (BIT(1) << IRQ_STATUS_DP_TRANS_P0_SHIFT)
+# define IRQ_STATUS_DP_TRANS_P0_CONN_IRQ                                     (BIT(2) << IRQ_STATUS_DP_TRANS_P0_SHIFT)
+# define IRQ_STATUS_DP_TRANS_P0_INT_IRQ                                      (BIT(3) << IRQ_STATUS_DP_TRANS_P0_SHIFT)
+#define MTK_DP_TRANS_P0_341C              (TRANS_OFFSET + 0x01C)
+# define IRQ_CLR_51_DP_TRANS_P0_MASK                                         0xf
+# define IRQ_CLR_51_DP_TRANS_P0_SHIFT                                        0
+# define IRQ_MASK_51_DP_TRANS_P0_MASK                                        0xf0
+# define IRQ_MASK_51_DP_TRANS_P0_SHIFT                                       4
+# define IRQ_FORCE_51_DP_TRANS_P0_MASK                                       0xf00
+# define IRQ_FORCE_51_DP_TRANS_P0_SHIFT                                      8
+# define IRQ_STATUS_51_DP_TRANS_P0_MASK                                      0xf000
+# define IRQ_STATUS_51_DP_TRANS_P0_SHIFT                                     12
+
+#define MTK_DP_TRANS_P0_3420              (TRANS_OFFSET + 0x020)
+# define HPD_STATUS_DP_TRANS_P0_MASK                                         0x1
+# define HPD_STATUS_DP_TRANS_P0_SHIFT                                        0
+
+#define MTK_DP_TRANS_P0_3428              (TRANS_OFFSET + 0x028)
+# define POST_MISC_BIT_REVERSE_EN_LANE0_DP_TRANS_P0_MASK                     0x1
+# define POST_MISC_BIT_REVERSE_EN_LANE0_DP_TRANS_P0_SHIFT                    0
+# define POST_MISC_BIT_REVERSE_EN_LANE1_DP_TRANS_P0_MASK                     0x2
+# define POST_MISC_BIT_REVERSE_EN_LANE1_DP_TRANS_P0_SHIFT                    1
+# define POST_MISC_BIT_REVERSE_EN_LANE2_DP_TRANS_P0_MASK                     0x4
+# define POST_MISC_BIT_REVERSE_EN_LANE2_DP_TRANS_P0_SHIFT                    2
+# define POST_MISC_BIT_REVERSE_EN_LANE3_DP_TRANS_P0_MASK                     0x8
+# define POST_MISC_BIT_REVERSE_EN_LANE3_DP_TRANS_P0_SHIFT                    3
+# define POST_MISC_PN_SWAP_EN_LANE0_DP_TRANS_P0_MASK                         0x10
+# define POST_MISC_PN_SWAP_EN_LANE0_DP_TRANS_P0_SHIFT                        4
+# define POST_MISC_PN_SWAP_EN_LANE1_DP_TRANS_P0_MASK                         0x20
+# define POST_MISC_PN_SWAP_EN_LANE1_DP_TRANS_P0_SHIFT                        5
+# define POST_MISC_PN_SWAP_EN_LANE2_DP_TRANS_P0_MASK                         0x40
+# define POST_MISC_PN_SWAP_EN_LANE2_DP_TRANS_P0_SHIFT                        6
+# define POST_MISC_PN_SWAP_EN_LANE3_DP_TRANS_P0_MASK                         0x80
+# define POST_MISC_PN_SWAP_EN_LANE3_DP_TRANS_P0_SHIFT                        7
+# define POST_MISC_DATA_SWAP_EN_LANE0_DP_TRANS_P0_MASK                       0x100
+# define POST_MISC_DATA_SWAP_EN_LANE0_DP_TRANS_P0_SHIFT                      8
+# define POST_MISC_DATA_SWAP_EN_LANE1_DP_TRANS_P0_MASK                       0x200
+# define POST_MISC_DATA_SWAP_EN_LANE1_DP_TRANS_P0_SHIFT                      9
+# define POST_MISC_DATA_SWAP_EN_LANE2_DP_TRANS_P0_MASK                       0x400
+# define POST_MISC_DATA_SWAP_EN_LANE2_DP_TRANS_P0_SHIFT                      10
+# define POST_MISC_DATA_SWAP_EN_LANE3_DP_TRANS_P0_MASK                       0x800
+# define POST_MISC_DATA_SWAP_EN_LANE3_DP_TRANS_P0_SHIFT                      11
+
+#define MTK_DP_TRANS_P0_342C              (TRANS_OFFSET + 0x02C)
+# define XTAL_FREQ_DP_TRANS_P0_DEFAULT                                       0x69
+# define XTAL_FREQ_DP_TRANS_P0_MASK                                          0xff
+# define XTAL_FREQ_DP_TRANS_P0_SHIFT                                         0
+
+#define MTK_DP_TRANS_P0_3430              (TRANS_OFFSET + 0x030)
+# define HPD_INT_THD_ECO_DP_TRANS_P0_MASK                                    0x3
+# define HPD_INT_THD_ECO_DP_TRANS_P0_SHIFT                                   0
+# define HPD_INT_THD_ECO_DP_TRANS_P0_LOW_BOUND_EXT                           BIT(0)
+# define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT                          BIT(1)
+
+#define MTK_DP_TRANS_P0_3440              (TRANS_OFFSET + 0x040)
+# define PGM_PAT_EN_DP_TRANS_P0_MASK                                         0xf
+# define PGM_PAT_EN_DP_TRANS_P0_SHIFT                                        0
+# define PGM_PAT_SEL_L0_DP_TRANS_P0_MASK                                     0x70
+# define PGM_PAT_SEL_L0_DP_TRANS_P0_SHIFT                                    4
+# define PGM_PAT_SEL_L1_DP_TRANS_P0_MASK                                     0x700
+# define PGM_PAT_SEL_L1_DP_TRANS_P0_SHIFT                                    8
+# define PGM_PAT_SEL_L2_DP_TRANS_P0_MASK                                     0x7000
+# define PGM_PAT_SEL_L2_DP_TRANS_P0_SHIFT                                    12
+
+#define MTK_DP_TRANS_P0_3444              (TRANS_OFFSET + 0x044)
+# define PGM_PAT_SEL_L3_DP_TRANS_P0_MASK                                     0x7
+# define PGM_PAT_SEL_L3_DP_TRANS_P0_SHIFT                                    0
+# define PRBS_EN_DP_TRANS_P0_MASK                                            0x8
+# define PRBS_EN_DP_TRANS_P0_SHIFT                                           3
+
+#define MTK_DP_TRANS_P0_3448              (TRANS_OFFSET + 0x048)
+# define PGM_PAT_L0_0_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L0_0_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_344C              (TRANS_OFFSET + 0x04C)
+# define PGM_PAT_L0_1_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L0_1_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3450              (TRANS_OFFSET + 0x050)
+# define PGM_PAT_L0_2_DP_TRANS_P0_MASK                                       0xff
+# define PGM_PAT_L0_2_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3454              (TRANS_OFFSET + 0x054)
+# define PGM_PAT_L1_0_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L1_0_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3458              (TRANS_OFFSET + 0x058)
+# define PGM_PAT_L1_1_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L1_1_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_345C              (TRANS_OFFSET + 0x05C)
+# define PGM_PAT_L1_2_DP_TRANS_P0_MASK                                       0xff
+# define PGM_PAT_L1_2_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3460              (TRANS_OFFSET + 0x060)
+# define PGM_PAT_L2_0_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L2_0_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3464              (TRANS_OFFSET + 0x064)
+# define PGM_PAT_L2_1_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L2_1_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3468              (TRANS_OFFSET + 0x068)
+# define PGM_PAT_L2_2_DP_TRANS_P0_MASK                                       0xff
+# define PGM_PAT_L2_2_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_346C              (TRANS_OFFSET + 0x06C)
+# define PGM_PAT_L3_0_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L3_0_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3470              (TRANS_OFFSET + 0x070)
+# define PGM_PAT_L3_1_DP_TRANS_P0_MASK                                       0xffff
+# define PGM_PAT_L3_1_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3474              (TRANS_OFFSET + 0x074)
+# define PGM_PAT_L3_2_DP_TRANS_P0_MASK                                       0xff
+# define PGM_PAT_L3_2_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_3478              (TRANS_OFFSET + 0x078)
+# define CP2520_PATTERN1_DP_TRANS_P0_MASK                                    0x1
+# define CP2520_PATTERN1_DP_TRANS_P0_SHIFT                                   0
+# define CP2520_PATTERN2_DP_TRANS_P0_MASK                                    0x2
+# define CP2520_PATTERN2_DP_TRANS_P0_SHIFT                                   1
+# define CP2520_PATTERN1_KCODE_ERROR_LANE0_DP_TRANS_P0_MASK                  0x10
+# define CP2520_PATTERN1_KCODE_ERROR_LANE0_DP_TRANS_P0_SHIFT                 4
+# define CP2520_PATTERN1_KCODE_ERROR_LANE1_DP_TRANS_P0_MASK                  0x20
+# define CP2520_PATTERN1_KCODE_ERROR_LANE1_DP_TRANS_P0_SHIFT                 5
+# define CP2520_PATTERN1_KCODE_ERROR_LANE2_DP_TRANS_P0_MASK                  0x40
+# define CP2520_PATTERN1_KCODE_ERROR_LANE2_DP_TRANS_P0_SHIFT                 6
+# define CP2520_PATTERN1_KCODE_ERROR_LANE3_DP_TRANS_P0_MASK                  0x80
+# define CP2520_PATTERN1_KCODE_ERROR_LANE3_DP_TRANS_P0_SHIFT                 7
+# define CP2520_PATTERN1_DCODE_ERROR_LANE0_DP_TRANS_P0_MASK                  0x100
+# define CP2520_PATTERN1_DCODE_ERROR_LANE0_DP_TRANS_P0_SHIFT                 8
+# define CP2520_PATTERN1_DCODE_ERROR_LANE1_DP_TRANS_P0_MASK                  0x200
+# define CP2520_PATTERN1_DCODE_ERROR_LANE1_DP_TRANS_P0_SHIFT                 9
+# define CP2520_PATTERN1_DCODE_ERROR_LANE2_DP_TRANS_P0_MASK                  0x400
+# define CP2520_PATTERN1_DCODE_ERROR_LANE2_DP_TRANS_P0_SHIFT                 10
+# define CP2520_PATTERN1_DCODE_ERROR_LANE3_DP_TRANS_P0_MASK                  0x800
+# define CP2520_PATTERN1_DCODE_ERROR_LANE3_DP_TRANS_P0_SHIFT                 11
+
+#define MTK_DP_TRANS_P0_347C              (TRANS_OFFSET + 0x07C)
+# define CP2520_PATTERN2_KCODE_ERROR_LANE0_DP_TRANS_P0_MASK                  0x1
+# define CP2520_PATTERN2_KCODE_ERROR_LANE0_DP_TRANS_P0_SHIFT                 0
+# define CP2520_PATTERN2_KCODE_ERROR_LANE1_DP_TRANS_P0_MASK                  0x2
+# define CP2520_PATTERN2_KCODE_ERROR_LANE1_DP_TRANS_P0_SHIFT                 1
+# define CP2520_PATTERN2_KCODE_ERROR_LANE2_DP_TRANS_P0_MASK                  0x4
+# define CP2520_PATTERN2_KCODE_ERROR_LANE2_DP_TRANS_P0_SHIFT                 2
+# define CP2520_PATTERN2_KCODE_ERROR_LANE3_DP_TRANS_P0_MASK                  0x8
+# define CP2520_PATTERN2_KCODE_ERROR_LANE3_DP_TRANS_P0_SHIFT                 3
+# define CP2520_PATTERN2_DCODE_ERROR_LANE0_DP_TRANS_P0_MASK                  0x10
+# define CP2520_PATTERN2_DCODE_ERROR_LANE0_DP_TRANS_P0_SHIFT                 4
+# define CP2520_PATTERN2_DCODE_ERROR_LANE1_DP_TRANS_P0_MASK                  0x20
+# define CP2520_PATTERN2_DCODE_ERROR_LANE1_DP_TRANS_P0_SHIFT                 5
+# define CP2520_PATTERN2_DCODE_ERROR_LANE2_DP_TRANS_P0_MASK                  0x40
+# define CP2520_PATTERN2_DCODE_ERROR_LANE2_DP_TRANS_P0_SHIFT                 6
+# define CP2520_PATTERN2_DCODE_ERROR_LANE3_DP_TRANS_P0_MASK                  0x80
+# define CP2520_PATTERN2_DCODE_ERROR_LANE3_DP_TRANS_P0_SHIFT                 7
+# define CP2520_PATTERN3_KCODE_ERROR_LANE0_DP_TRANS_P0_MASK                  0x100
+# define CP2520_PATTERN3_KCODE_ERROR_LANE0_DP_TRANS_P0_SHIFT                 8
+# define CP2520_PATTERN3_KCODE_ERROR_LANE1_DP_TRANS_P0_MASK                  0x200
+# define CP2520_PATTERN3_KCODE_ERROR_LANE1_DP_TRANS_P0_SHIFT                 9
+# define CP2520_PATTERN3_KCODE_ERROR_LANE2_DP_TRANS_P0_MASK                  0x400
+# define CP2520_PATTERN3_KCODE_ERROR_LANE2_DP_TRANS_P0_SHIFT                 10
+# define CP2520_PATTERN3_KCODE_ERROR_LANE3_DP_TRANS_P0_MASK                  0x800
+# define CP2520_PATTERN3_KCODE_ERROR_LANE3_DP_TRANS_P0_SHIFT                 11
+# define CP2520_PATTERN3_DCODE_ERROR_LANE0_DP_TRANS_P0_MASK                  0x1000
+# define CP2520_PATTERN3_DCODE_ERROR_LANE0_DP_TRANS_P0_SHIFT                 12
+# define CP2520_PATTERN3_DCODE_ERROR_LANE1_DP_TRANS_P0_MASK                  0x2000
+# define CP2520_PATTERN3_DCODE_ERROR_LANE1_DP_TRANS_P0_SHIFT                 13
+# define CP2520_PATTERN3_DCODE_ERROR_LANE2_DP_TRANS_P0_MASK                  0x4000
+# define CP2520_PATTERN3_DCODE_ERROR_LANE2_DP_TRANS_P0_SHIFT                 14
+# define CP2520_PATTERN3_DCODE_ERROR_LANE3_DP_TRANS_P0_MASK                  0x8000
+# define CP2520_PATTERN3_DCODE_ERROR_LANE3_DP_TRANS_P0_SHIFT                 15
+
+#define MTK_DP_TRANS_P0_3480              (TRANS_OFFSET + 0x080)
+# define DP_EN_DP_TRANS_P0_MASK                                              0x1
+# define DP_EN_DP_TRANS_P0_SHIFT                                             0
+# define HDCP_CAPABLE_DP_TRANS_P0_MASK                                       0x2
+# define HDCP_CAPABLE_DP_TRANS_P0_SHIFT                                      1
+# define SELECT_INTERNAL_AN_DP_TRANS_P0_MASK                                 0x4
+# define SELECT_INTERNAL_AN_DP_TRANS_P0_SHIFT                                2
+# define AN_FREERUN_DP_TRANS_P0_MASK                                         0x8
+# define AN_FREERUN_DP_TRANS_P0_SHIFT                                        3
+# define KM_GENERATED_DP_TRANS_P0_MASK                                       0x10
+# define KM_GENERATED_DP_TRANS_P0_SHIFT                                      4
+# define REQ_BLOCK_CIPHER_AUTH_DP_TRANS_P0_MASK                              0x1000
+# define REQ_BLOCK_CIPHER_AUTH_DP_TRANS_P0_SHIFT                             12
+# define HDCP_1LANE_SEL_DP_TRANS_P0_MASK                                     0x2000
+# define HDCP_1LANE_SEL_DP_TRANS_P0_SHIFT                                    13
+# define HDCP_24LANE_SEL_DP_TRANS_P0_MASK                                    0x4000
+# define HDCP_24LANE_SEL_DP_TRANS_P0_SHIFT                                   14
+# define MST_EN_DP_TRANS_P0_MASK                                             0x8000
+# define MST_EN_DP_TRANS_P0_SHIFT                                            15
+
+#define MTK_DP_TRANS_P0_34A4              (TRANS_OFFSET + 0x0A4)
+# define EN_COPY_2LANE_MSA_DP_TRANS_P0_MASK                                  0x1
+# define EN_COPY_2LANE_MSA_DP_TRANS_P0_SHIFT                                 0
+# define EN_COPY_4LANE_MSA_DP_TRANS_P0_MASK                                  0x2
+# define EN_COPY_4LANE_MSA_DP_TRANS_P0_SHIFT                                 1
+# define LANE_NUM_DP_TRANS_P0_MASK                                           0xc
+# define LANE_NUM_DP_TRANS_P0_SHIFT                                          2
+# define HDCP22_AUTH_DONE_DP_TRANS_P0_MASK                                   0x10
+# define HDCP22_AUTH_DONE_DP_TRANS_P0_SHIFT                                  4
+# define DISCARD_UNUSED_CIPHER_DP_TRANS_P0_MASK                              0x20
+# define DISCARD_UNUSED_CIPHER_DP_TRANS_P0_SHIFT                             5
+# define HDCP22_CIPHER_REVERSE_DP_TRANS_P0_MASK                              0x40
+# define HDCP22_CIPHER_REVERSE_DP_TRANS_P0_SHIFT                             6
+# define MST_DELAY_CYCLE_FLAG_SEL_DP_TRANS_P0_MASK                           0x80
+# define MST_DELAY_CYCLE_FLAG_SEL_DP_TRANS_P0_SHIFT                          7
+# define TEST_CONFIG_HDCP22_DP_TRANS_P0_MASK                                 0xf00
+# define TEST_CONFIG_HDCP22_DP_TRANS_P0_SHIFT                                8
+# define R0_AVAILABLE_DP_TRANS_P0_MASK                                       0x1000
+# define R0_AVAILABLE_DP_TRANS_P0_SHIFT                                      12
+# define DPES_TX_HDCP22_DP_TRANS_P0_MASK                                     0x2000
+# define DPES_TX_HDCP22_DP_TRANS_P0_SHIFT                                    13
+# define DP_AES_OUT_RDY_L_DP_TRANS_P0_MASK                                   0x4000
+# define DP_AES_OUT_RDY_L_DP_TRANS_P0_SHIFT                                  14
+# define REPEATER_I_DP_TRANS_P0_MASK                                         0x8000
+# define REPEATER_I_DP_TRANS_P0_SHIFT                                        15
+
+#define MTK_DP_TRANS_P0_34A8              (TRANS_OFFSET + 0x0A8)
+# define TEST_CONFIG_HDCP13_DP_TRANS_P0_MASK                                 0xff00
+# define TEST_CONFIG_HDCP13_DP_TRANS_P0_SHIFT                                8
+
+#define MTK_DP_TRANS_P0_34D0              (TRANS_OFFSET + 0x0D0)
+# define TX_HDCP22_TYPE_DP_TRANS_P0_MASK                                     0xff
+# define TX_HDCP22_TYPE_DP_TRANS_P0_SHIFT                                    0
+# define PIPE_DELAY_EN_CNT_DP_TRANS_P0_MASK                                  0xf00
+# define PIPE_DELAY_EN_CNT_DP_TRANS_P0_SHIFT                                 8
+# define PIPE_DELAY_DP_TRANS_P0_MASK                                         0xf000
+# define PIPE_DELAY_DP_TRANS_P0_SHIFT                                        12
+
+#define MTK_DP_TRANS_P0_34D4              (TRANS_OFFSET + 0x0D4)
+# define DP_AES_INCTR_L_0_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_L_0_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_34D8              (TRANS_OFFSET + 0x0D8)
+# define DP_AES_INCTR_L_1_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_L_1_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_34DC              (TRANS_OFFSET + 0x0DC)
+# define DP_AES_INCTR_L_2_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_L_2_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_34E0              (TRANS_OFFSET + 0x0E0)
+# define DP_AES_INCTR_L_3_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_L_3_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_34E4              (TRANS_OFFSET + 0x0E4)
+# define HDCP_TYPE_TX_0_DP_TRANS_P0_MASK                                     0xffff
+# define HDCP_TYPE_TX_0_DP_TRANS_P0_SHIFT                                    0
+
+#define MTK_DP_TRANS_P0_34E8              (TRANS_OFFSET + 0x0E8)
+# define HDCP_TYPE_TX_1_DP_TRANS_P0_MASK                                     0xffff
+# define HDCP_TYPE_TX_1_DP_TRANS_P0_SHIFT                                    0
+
+#define MTK_DP_TRANS_P0_34EC              (TRANS_OFFSET + 0x0EC)
+# define HDCP_TYPE_TX_2_DP_TRANS_P0_MASK                                     0xffff
+# define HDCP_TYPE_TX_2_DP_TRANS_P0_SHIFT                                    0
+
+#define MTK_DP_TRANS_P0_34F0              (TRANS_OFFSET + 0x0F0)
+# define HDCP_TYPE_TX_3_DP_TRANS_P0_MASK                                     0xffff
+# define HDCP_TYPE_TX_3_DP_TRANS_P0_SHIFT                                    0
+
+#define MTK_DP_TRANS_P0_34F4              (TRANS_OFFSET + 0x0F4)
+# define SST_HDCP_TYPE_TX_DP_TRANS_P0_MASK                                   0xff
+# define SST_HDCP_TYPE_TX_DP_TRANS_P0_SHIFT                                  0
+# define PIPE_OV_VALUE_DP_TRANS_P0_MASK                                      0xf00
+# define PIPE_OV_VALUE_DP_TRANS_P0_SHIFT                                     8
+# define PIPE_OV_ENABLE_DP_TRANS_P0_MASK                                     0x1000
+# define PIPE_OV_ENABLE_DP_TRANS_P0_SHIFT                                    12
+
+#define MTK_DP_TRANS_P0_34F8              (TRANS_OFFSET + 0x0F8)
+# define DP_AES_OUT_RDY_H_DP_TRANS_P0_MASK                                   0x4000
+# define DP_AES_OUT_RDY_H_DP_TRANS_P0_SHIFT                                  14
+
+#define MTK_DP_TRANS_P0_34FC              (TRANS_OFFSET + 0x0FC)
+# define HDCP_4P_TO_2P_FIFO_RST_CHK_DP_TRANS_P0_MASK                         0xff
+# define HDCP_4P_TO_2P_FIFO_RST_CHK_DP_TRANS_P0_SHIFT                        0
+# define HDCP_2P_TO_4P_FIFO_RST_CHK_DP_TRANS_P0_MASK                         0xff00
+# define HDCP_2P_TO_4P_FIFO_RST_CHK_DP_TRANS_P0_SHIFT                        8
+
+#define MTK_DP_TRANS_P0_3500              (TRANS_OFFSET + 0x100)
+# define DP_AES_INCTR_H_0_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_H_0_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_3504              (TRANS_OFFSET + 0x104)
+# define DP_AES_INCTR_H_1_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_H_1_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_3508              (TRANS_OFFSET + 0x108)
+# define DP_AES_INCTR_H_2_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_H_2_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_350C              (TRANS_OFFSET + 0x10C)
+# define DP_AES_INCTR_H_3_DP_TRANS_P0_MASK                                   0xffff
+# define DP_AES_INCTR_H_3_DP_TRANS_P0_SHIFT                                  0
+
+#define MTK_DP_TRANS_P0_3510              (TRANS_OFFSET + 0x110)
+# define HDCP22_TYPE_DP_TRANS_P0_MASK                                        0xff
+# define HDCP22_TYPE_DP_TRANS_P0_SHIFT                                       0
+
+#define MTK_DP_TRANS_P0_3540              (TRANS_OFFSET + 0x140)
+# define FEC_EN_DP_TRANS_P0_MASK                                             0x1
+# define FEC_EN_DP_TRANS_P0_SHIFT                                            0
+# define FEC_END_MODE_DP_TRANS_P0_MASK                                       0x6
+# define FEC_END_MODE_DP_TRANS_P0_SHIFT                                      1
+# define FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK                                  0x8
+# define FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT                                 3
+# define FEC_FIFO_READ_START_DP_TRANS_P0_MASK                                0xf0
+# define FEC_FIFO_READ_START_DP_TRANS_P0_SHIFT                               4
+# define FEC_FIFO_UNDER_POINT_DP_TRANS_P0_MASK                               0xf00
+# define FEC_FIFO_UNDER_POINT_DP_TRANS_P0_SHIFT                              8
+# define FEC_FIFO_OVER_POINT_DP_TRANS_P0_MASK                                0xf000
+# define FEC_FIFO_OVER_POINT_DP_TRANS_P0_SHIFT                               12
+
+#define MTK_DP_TRANS_P0_3544              (TRANS_OFFSET + 0x144)
+# define FEC_FIFO_RST_DP_TRANS_P0_MASK                                       0x1
+# define FEC_FIFO_RST_DP_TRANS_P0_SHIFT                                      0
+# define FEC_SUPPORT_DP_TRANS_P0_MASK                                        0x2
+# define FEC_SUPPORT_DP_TRANS_P0_SHIFT                                       1
+# define FEC_PATTERN_NEW_DP_TRANS_P0_MASK                                    0x4
+# define FEC_PATTERN_NEW_DP_TRANS_P0_SHIFT                                   2
+# define FEC_INSERT_FIFO_EMPTY_DP_TRANS_P0_MASK                              0x10
+# define FEC_INSERT_FIFO_EMPTY_DP_TRANS_P0_SHIFT                             4
+# define FEC_INSERT_FIFO_EMPTY_CLR_DP_TRANS_P0_MASK                          0x20
+# define FEC_INSERT_FIFO_EMPTY_CLR_DP_TRANS_P0_SHIFT                         5
+# define FEC_INSERT_FIFO_FULL_DP_TRANS_P0_MASK                               0x40
+# define FEC_INSERT_FIFO_FULL_DP_TRANS_P0_SHIFT                              6
+# define FEC_INSERT_FIFO_FULL_CLR_DP_TRANS_P0_MASK                           0x80
+# define FEC_INSERT_FIFO_FULL_CLR_DP_TRANS_P0_SHIFT                          7
+# define PARITY_INTERLEAVER_DATA_INVERT_PIPE_SEL_DP_TRANS_P0_MASK            0x700
+# define PARITY_INTERLEAVER_DATA_INVERT_PIPE_SEL_DP_TRANS_P0_SHIFT           8
+# define PAT_INIT_DISPARITY_FEC_DP_TRANS_P0_MASK                             0x800
+# define PAT_INIT_DISPARITY_FEC_DP_TRANS_P0_SHIFT                            11
+# define FEC_PARITY_DATA_LANE_SWAP_DP_TRANS_P0_MASK                          0x1000
+# define FEC_PARITY_DATA_LANE_SWAP_DP_TRANS_P0_SHIFT                         12
+
+#define MTK_DP_TRANS_P0_3548              (TRANS_OFFSET + 0x148)
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE0_DP_TRANS_P0_MASK                  0x7
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE0_DP_TRANS_P0_SHIFT                 0
+# define FEC_INSERT_SYMBOL_ERROR_LANE0_DP_TRANS_P0_MASK                      0x8
+# define FEC_INSERT_SYMBOL_ERROR_LANE0_DP_TRANS_P0_SHIFT                     3
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE1_DP_TRANS_P0_MASK                  0x70
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE1_DP_TRANS_P0_SHIFT                 4
+# define FEC_INSERT_SYMBOL_ERROR_LANE1_DP_TRANS_P0_MASK                      0x80
+# define FEC_INSERT_SYMBOL_ERROR_LANE1_DP_TRANS_P0_SHIFT                     7
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE2_DP_TRANS_P0_MASK                  0x700
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE2_DP_TRANS_P0_SHIFT                 8
+# define FEC_INSERT_SYMBOL_ERROR_LANE2_DP_TRANS_P0_MASK                      0x800
+# define FEC_INSERT_SYMBOL_ERROR_LANE2_DP_TRANS_P0_SHIFT                     11
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE3_DP_TRANS_P0_MASK                  0x7000
+# define FEC_INSERT_SYMBOL_ERROR_CNT_LANE3_DP_TRANS_P0_SHIFT                 12
+# define FEC_INSERT_SYMBOL_ERROR_LANE3_DP_TRANS_P0_MASK                      0x8000
+# define FEC_INSERT_SYMBOL_ERROR_LANE3_DP_TRANS_P0_SHIFT                     15
+
+#define MTK_DP_TRANS_P0_354C              (TRANS_OFFSET + 0x14C)
+# define FEC_CP_HIT_LANE0_DP_TRANS_P0_MASK                                   0x1
+# define FEC_CP_HIT_LANE0_DP_TRANS_P0_SHIFT                                  0
+# define FEC_CP_HIT_LANE1_DP_TRANS_P0_MASK                                   0x2
+# define FEC_CP_HIT_LANE1_DP_TRANS_P0_SHIFT                                  1
+# define FEC_CP_HIT_LANE2_DP_TRANS_P0_MASK                                   0x4
+# define FEC_CP_HIT_LANE2_DP_TRANS_P0_SHIFT                                  2
+# define FEC_CP_HIT_LANE3_DP_TRANS_P0_MASK                                   0x8
+# define FEC_CP_HIT_LANE3_DP_TRANS_P0_SHIFT                                  3
+# define FEC_CP_HIT_CLR_DP_TRANS_P0_MASK                                     0x10
+# define FEC_CP_HIT_CLR_DP_TRANS_P0_SHIFT                                    4
+# define FEC_ENCODE_TOP_TESTBUS_SEL_DP_TRANS_P0_MASK                         0x300
+# define FEC_ENCODE_TOP_TESTBUS_SEL_DP_TRANS_P0_SHIFT                        8
+# define FEC_INSERT_TOP_TESTBUS_SEL_DP_TRANS_P0_MASK                         0xc00
+# define FEC_INSERT_TOP_TESTBUS_SEL_DP_TRANS_P0_SHIFT                        10
+
+#define MTK_DP_TRANS_P0_3550              (TRANS_OFFSET + 0x150)
+# define FEC_INSERT_FIFO_WCNT_DP_TRANS_P0_MASK                               0x1f
+# define FEC_INSERT_FIFO_WCNT_DP_TRANS_P0_SHIFT                              0
+# define FEC_INSERT_FIFO_RCNT_DP_TRANS_P0_MASK                               0x1f00
+# define FEC_INSERT_FIFO_RCNT_DP_TRANS_P0_SHIFT                              8
+
+#define MTK_DP_TRANS_P0_3554              (TRANS_OFFSET + 0x154)
+# define FEC_CLK_GATE_DATA_CNT_0_DP_TRANS_P0_MASK                            0x7f
+# define FEC_CLK_GATE_DATA_CNT_0_DP_TRANS_P0_SHIFT                           0
+
+#define MTK_DP_TRANS_P0_3558              (TRANS_OFFSET + 0x158)
+# define FEC_CLK_GATE_DATA_CNT_1_0_DP_TRANS_P0_MASK                          0xffff
+# define FEC_CLK_GATE_DATA_CNT_1_0_DP_TRANS_P0_SHIFT                         0
+
+#define MTK_DP_TRANS_P0_355C              (TRANS_OFFSET + 0x15C)
+# define FEC_CLK_GATE_DATA_CNT_1_1_DP_TRANS_P0_MASK                          0x3
+# define FEC_CLK_GATE_DATA_CNT_1_1_DP_TRANS_P0_SHIFT                         0
+
+#define MTK_DP_TRANS_P0_3580              (TRANS_OFFSET + 0x180)
+# define DP_TX_TRANS_TESTBUS_SEL_DP_TRANS_P0_MASK                            0x1f
+# define DP_TX_TRANS_TESTBUS_SEL_DP_TRANS_P0_SHIFT                           0
+# define POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK                            0x100
+# define POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_SHIFT                           8
+# define POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK                            0x200
+# define POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_SHIFT                           9
+# define POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK                            0x400
+# define POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_SHIFT                           10
+# define POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK                            0x800
+# define POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_SHIFT                           11
+
+#define MTK_DP_TRANS_P0_3584              (TRANS_OFFSET + 0x184)
+# define POST_MISC_DATA_LANE0_0_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE0_0_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_3588              (TRANS_OFFSET + 0x188)
+# define POST_MISC_DATA_LANE0_1_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE0_1_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_358C              (TRANS_OFFSET + 0x18C)
+# define POST_MISC_DATA_LANE0_2_DP_TRANS_P0_MASK                             0xff
+# define POST_MISC_DATA_LANE0_2_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_3590              (TRANS_OFFSET + 0x190)
+# define POST_MISC_DATA_LANE1_0_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE1_0_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_3594              (TRANS_OFFSET + 0x194)
+# define POST_MISC_DATA_LANE1_1_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE1_1_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_3598              (TRANS_OFFSET + 0x198)
+# define POST_MISC_DATA_LANE1_2_DP_TRANS_P0_MASK                             0xff
+# define POST_MISC_DATA_LANE1_2_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_359C              (TRANS_OFFSET + 0x19C)
+# define POST_MISC_DATA_LANE2_0_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE2_0_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_35A0              (TRANS_OFFSET + 0x1A0)
+# define POST_MISC_DATA_LANE2_1_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE2_1_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_35A4              (TRANS_OFFSET + 0x1A4)
+# define POST_MISC_DATA_LANE2_2_DP_TRANS_P0_MASK                             0xff
+# define POST_MISC_DATA_LANE2_2_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_35A8              (TRANS_OFFSET + 0x1A8)
+# define POST_MISC_DATA_LANE3_0_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE3_0_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_35AC              (TRANS_OFFSET + 0x1AC)
+# define POST_MISC_DATA_LANE3_1_DP_TRANS_P0_MASK                             0xffff
+# define POST_MISC_DATA_LANE3_1_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_35B0              (TRANS_OFFSET + 0x1B0)
+# define POST_MISC_DATA_LANE3_2_DP_TRANS_P0_MASK                             0xff
+# define POST_MISC_DATA_LANE3_2_DP_TRANS_P0_SHIFT                            0
+
+#define MTK_DP_TRANS_P0_35C0              (TRANS_OFFSET + 0x1C0)
+# define SW_IRQ_SRC_DP_TRANS_P0_MASK                                         0xffff
+# define SW_IRQ_SRC_DP_TRANS_P0_SHIFT                                        0
+
+#define MTK_DP_TRANS_P0_35C4              (TRANS_OFFSET + 0x1C4)
+# define SW_IRQ_MASK_DP_TRANS_P0_MASK                                        0xffff
+# define SW_IRQ_MASK_DP_TRANS_P0_SHIFT                                       0
+
+#define MTK_DP_TRANS_P0_35C8              (TRANS_OFFSET + 0x1C8)
+# define SW_IRQ_CLR_DP_TRANS_P0_MASK                                         0xffff
+# define SW_IRQ_CLR_DP_TRANS_P0_SHIFT                                        0
+
+#define MTK_DP_TRANS_P0_35CC              (TRANS_OFFSET + 0x1CC)
+# define SW_IRQ_STATUS_DP_TRANS_P0_MASK                                      0xffff
+# define SW_IRQ_STATUS_DP_TRANS_P0_SHIFT                                     0
+
+#define MTK_DP_TRANS_P0_35D0              (TRANS_OFFSET + 0x1D0)
+# define SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK                                0xffff
+# define SW_IRQ_FINAL_STATUS_DP_TRANS_P0_SHIFT                               0
+
+#define MTK_DP_TRANS_P0_35D4              (TRANS_OFFSET + 0x1D4)
+# define SW_IRQ_RAW_STATUS_DP_TRANS_P0_MASK                                  0xffff
+# define SW_IRQ_RAW_STATUS_DP_TRANS_P0_SHIFT                                 0
+
+#define MTK_DP_TRANS_P0_35D8              (TRANS_OFFSET + 0x1D8)
+# define SW_IRQ_FORCE_DP_TRANS_P0_MASK                                       0xffff
+# define SW_IRQ_FORCE_DP_TRANS_P0_SHIFT                                      0
+
+#define MTK_DP_TRANS_P0_35F0              (TRANS_OFFSET + 0x1F0)
+# define DP_TRANSMITTER_DUMMY_RW_0_DP_TRANS_P0_MASK                          0xffff
+# define DP_TRANSMITTER_DUMMY_RW_0_DP_TRANS_P0_SHIFT                         0
+
+#define MTK_DP_TRANS_P0_35F4              (TRANS_OFFSET + 0x1F4)
+# define DP_TRANSMITTER_DUMMY_RW_1_DP_TRANS_P0_MASK                          0xffff
+# define DP_TRANSMITTER_DUMMY_RW_1_DP_TRANS_P0_SHIFT                         0
+
+#define MTK_DP_TRANS_P0_35F8              (TRANS_OFFSET + 0x1F8)
+# define DP_TRANSMITTER_DUMMY_R_0_DP_TRANS_P0_MASK                           0xffff
+# define DP_TRANSMITTER_DUMMY_R_0_DP_TRANS_P0_SHIFT                          0
+
+#define MTK_DP_TRANS_P0_35FC              (TRANS_OFFSET + 0x1FC)
+# define DP_TRANSMITTER_DUMMY_R_1_DP_TRANS_P0_MASK                           0xffff
+# define DP_TRANSMITTER_DUMMY_R_1_DP_TRANS_P0_SHIFT                          0
+
+#define MTK_DP_AUX_P0_3600              (AUX_OFFSET + 0x000)
+# define DP_TX_SW_RESET_AUX_TX_P0_MASK                                       0x1
+# define DP_TX_SW_RESET_AUX_TX_P0_SHIFT                                      0
+# define AUX_TOP_RESET_AUX_TX_P0_MASK                                        0x2
+# define AUX_TOP_RESET_AUX_TX_P0_SHIFT                                       1
+# define SOFTWARE_RESET_RESERVED_AUX_TX_P0_MASK                              0x1c
+# define SOFTWARE_RESET_RESERVED_AUX_TX_P0_SHIFT                             2
+# define AUX_CLK_EN_AUX_TX_P0_MASK                                           0x100
+# define AUX_CLK_EN_AUX_TX_P0_SHIFT                                          8
+# define AUX_CLK_INV_AUX_TX_P0_MASK                                          0x200
+# define AUX_CLK_INV_AUX_TX_P0_SHIFT                                         9
+# define AUX_CLK_SEL_AUX_TX_P0_MASK                                          0xc00
+# define AUX_CLK_SEL_AUX_TX_P0_SHIFT                                         10
+
+#define MTK_DP_AUX_P0_3604              (AUX_OFFSET + 0x004)
+# define AUX_TX_FSM_SOFTWARE_RESET_AUX_TX_P0_MASK                            0x8000
+# define AUX_TX_FSM_SOFTWARE_RESET_AUX_TX_P0_SHIFT                           15
+# define AUX_TX_PHY_SOFTWARE_RESET_AUX_TX_P0_MASK                            0x4000
+# define AUX_TX_PHY_SOFTWARE_RESET_AUX_TX_P0_SHIFT                           14
+# define AUX_RX_FSM_SOFTWARE_RESET_AUX_TX_P0_MASK                            0x2000
+# define AUX_RX_FSM_SOFTWARE_RESET_AUX_TX_P0_SHIFT                           13
+# define AUX_RX_PHY_SOFTWARE_RESET_AUX_TX_P0_MASK                            0x1000
+# define AUX_RX_PHY_SOFTWARE_RESET_AUX_TX_P0_SHIFT                           12
+# define DP_TX_TESTBUS_SEL_AUX_TX_P0_MASK                                    0xff
+# define DP_TX_TESTBUS_SEL_AUX_TX_P0_SHIFT                                   0
+
+#define MTK_DP_AUX_P0_3608              (AUX_OFFSET + 0x008)
+# define DP_TX_INT_STATUS_AUX_TX_P0_MASK                                     0xffff
+# define DP_TX_INT_STATUS_AUX_TX_P0_SHIFT                                    0
+
+#define MTK_DP_AUX_P0_360C              (AUX_OFFSET + 0x00C)
+# define AUX_SWAP_AUX_TX_P0_MASK                                             0x8000
+# define AUX_SWAP_AUX_TX_P0_SHIFT                                            15
+# define AUX_AUX_REPLY_MCU_AUX_TX_P0_MASK                                    0x4000
+# define AUX_AUX_REPLY_MCU_AUX_TX_P0_SHIFT                                   14
+# define AUX_TIMEOUT_CMP_MASK_AUX_TX_P0_MASK                                 0x2000
+# define AUX_TIMEOUT_CMP_MASK_AUX_TX_P0_SHIFT                                13
+# define AUX_TIMEOUT_THR_AUX_TX_P0_MASK                                      0x1fff
+# define AUX_TIMEOUT_THR_AUX_TX_P0_SHIFT                                     0
+
+#define MTK_DP_AUX_P0_3610              (AUX_OFFSET + 0x010)
+# define AUX_EDID_REPLY_MCU_AUX_TX_P0_MASK                                   0x8000
+# define AUX_EDID_REPLY_MCU_AUX_TX_P0_SHIFT                                  15
+# define AUX_EDID_ADDR_AUX_TX_P0_MASK                                        0x7f00
+# define AUX_EDID_ADDR_AUX_TX_P0_SHIFT                                       8
+# define AUX_MCCS_REPLY_MCU_AUX_TX_P0_MASK                                   0x80
+# define AUX_MCCS_REPLY_MCU_AUX_TX_P0_SHIFT                                  7
+# define AUX_MCCS_ADDR_AUX_TX_P0_MASK                                        0x7f
+# define AUX_MCCS_ADDR_AUX_TX_P0_SHIFT                                       0
+
+#define MTK_DP_AUX_P0_3614              (AUX_OFFSET + 0x014)
+# define AUX_TIMEOUT_THR_EXTEN_AUX_TX_P0_MASK                                0x4000
+# define AUX_TIMEOUT_THR_EXTEN_AUX_TX_P0_SHIFT                               14
+# define AUX_RX_AVERAGE_SEL_AUX_TX_P0_MASK                                   0x3000
+# define AUX_RX_AVERAGE_SEL_AUX_TX_P0_SHIFT                                  12
+# define AUX_RX_SYNC_PATTERN_THR_AUX_TX_P0_MASK                              0xf00
+# define AUX_RX_SYNC_PATTERN_THR_AUX_TX_P0_SHIFT                             8
+# define AUX_RX_DECODE_SEL_AUX_TX_P0_MASK                                    0x80
+# define AUX_RX_DECODE_SEL_AUX_TX_P0_SHIFT                                   7
+# define AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK                                    0x7f
+# define AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT                                   0
+
+#define MTK_DP_AUX_P0_3618              (AUX_OFFSET + 0x018)
+# define AUX_RX_DP_REV_AUX_TX_P0_MASK                                        0x400
+# define AUX_RX_DP_REV_AUX_TX_P0_SHIFT                                       10
+# define AUX_RX_FIFO_FULL_AUX_TX_P0_MASK                                     0x200
+# define AUX_RX_FIFO_FULL_AUX_TX_P0_SHIFT                                    9
+# define AUX_RX_FIFO_EMPTY_AUX_TX_P0_MASK                                    0x100
+# define AUX_RX_FIFO_EMPTY_AUX_TX_P0_SHIFT                                   8
+# define AUX_RX_FIFO_READ_POINTER_AUX_TX_P0_MASK                             0xf0
+# define AUX_RX_FIFO_READ_POINTER_AUX_TX_P0_SHIFT                            4
+# define AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK                            0xf
+# define AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_SHIFT                           0
+
+#define MTK_DP_AUX_P0_361C              (AUX_OFFSET + 0x01C)
+# define AUX_RX_DATA_BYTE_CNT_AUX_TX_P0_MASK                                 0xff00
+# define AUX_RX_DATA_BYTE_CNT_AUX_TX_P0_SHIFT                                8
+# define AUX_RESERVED_RO_0_AUX_TX_P0_MASK                                    0xff
+# define AUX_RESERVED_RO_0_AUX_TX_P0_SHIFT                                   0
+
+#define MTK_DP_AUX_P0_3620              (AUX_OFFSET + 0x020)
+# define AUX_RD_MODE_AUX_TX_P0_MASK                                          0x200
+# define AUX_RD_MODE_AUX_TX_P0_SHIFT                                         9
+# define AUX_RX_FIFO_READ_PULSE_TX_P0_MASK                                   0x100
+# define AUX_RX_FIFO_R_PULSE_TX_P0_SHIFT                                     8
+# define AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK                                0xff
+# define AUX_RX_FIFO_READ_DATA_AUX_TX_P0_SHIFT                               0
+
+#define MTK_DP_AUX_P0_3624              (AUX_OFFSET + 0x024)
+# define AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK                                 0xf
+# define AUX_RX_REPLY_COMMAND_AUX_TX_P0_SHIFT                                0
+# define AUX_RX_REPLY_ADDRESS_NONE_AUX_TX_P0_MASK                            0xf00
+# define AUX_RX_REPLY_ADDRESS_NONE_AUX_TX_P0_SHIFT                           8
+
+#define MTK_DP_AUX_P0_3628              (AUX_OFFSET + 0x028)
+# define AUX_RESERVED_RO_1_AUX_TX_P0_MASK                                    0xfc00
+# define AUX_RESERVED_RO_1_AUX_TX_P0_SHIFT                                   10
+# define AUX_RX_PHY_STATE_AUX_TX_P0_MASK                                     0x3ff
+# define AUX_RX_PHY_STATE_AUX_TX_P0_SHIFT                                    0
+# define AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE                                  (BIT(1) << AUX_RX_PHY_STATE_AUX_TX_P0_SHIFT)
+
+#define MTK_DP_AUX_P0_362C              (AUX_OFFSET + 0x02C)
+# define AUX_NO_LENGTH_AUX_TX_P0_MASK                                        0x1
+# define AUX_NO_LENGTH_AUX_TX_P0_SHIFT                                       0
+# define AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK                                   0x2
+# define AUX_TX_AUXTX_OV_EN_AUX_TX_P0_SHIFT                                  1
+# define AUX_RESERVED_RW_0_AUX_TX_P0_MASK                                    0xfffc
+# define AUX_RESERVED_RW_0_AUX_TX_P0_SHIFT                                   2
+
+#define MTK_DP_AUX_P0_3630              (AUX_OFFSET + 0x030)
+# define AUX_TX_REQUEST_READY_AUX_TX_P0_MASK                                 0x8
+# define AUX_TX_REQUEST_READY_AUX_TX_P0_SHIFT                                3
+# define AUX_TX_PRE_NUM_AUX_TX_P0_MASK                                       0xff00
+# define AUX_TX_PRE_NUM_AUX_TX_P0_SHIFT                                      8
+
+#define MTK_DP_AUX_P0_3634              (AUX_OFFSET + 0x034)
+# define AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK                              0xff00
+# define AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT                             8
+# define AUX_TX_FIFO_WRITE_DATA_AUX_TX_P0_MASK                               0xff
+# define AUX_TX_FIFO_WRITE_DATA_AUX_TX_P0_SHIFT                              0
+
+#define MTK_DP_AUX_P0_3638              (AUX_OFFSET + 0x038)
+# define AUX_TX_FIFO_READ_POINTER_AUX_TX_P0_MASK                             0xf0
+# define AUX_TX_FIFO_READ_POINTER_AUX_TX_P0_SHIFT                            4
+# define AUX_TX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK                            0xf
+# define AUX_TX_FIFO_WRITE_POINTER_AUX_TX_P0_SHIFT                           0
+
+#define MTK_DP_AUX_P0_363C              (AUX_OFFSET + 0x03C)
+# define AUX_TX_FIFO_FULL_AUX_TX_P0_MASK                                     0x1000
+# define AUX_TX_FIFO_FULL_AUX_TX_P0_SHIFT                                    12
+# define AUX_TX_FIFO_EMPTY_AUX_TX_P0_MASK                                    0x800
+# define AUX_TX_FIFO_EMPTY_AUX_TX_P0_SHIFT                                   11
+# define AUX_TX_PHY_STATE_AUX_TX_P0_MASK                                     0x7ff
+# define AUX_TX_PHY_STATE_AUX_TX_P0_SHIFT                                    0
+
+#define MTK_DP_AUX_P0_3640              (AUX_OFFSET + 0x040)
+# define AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK                                 0x40
+# define AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT                        6
+# define AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_MASK                        0x20
+# define AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT                       5
+# define AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_MASK                        0x10
+# define AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT                       4
+# define AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_MASK                                  0x8
+# define AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_SHIFT                                 3
+# define AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_MASK                                 0x4
+# define AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT                                2
+# define AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_MASK                                 0x2
+# define AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT                                1
+# define AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK                                0x1
+# define AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT                               0
+
+#define MTK_DP_AUX_P0_3644              (AUX_OFFSET + 0x044)
+# define MCU_REQUEST_COMMAND_AUX_TX_P0_MASK                                  0xf
+# define MCU_REQUEST_COMMAND_AUX_TX_P0_SHIFT                                 0
+# define AUX_STATE_AUX_TX_P0_MASK                                            0xf00
+# define AUX_STATE_AUX_TX_P0_SHIFT                                           8
+
+#define MTK_DP_AUX_P0_3648              (AUX_OFFSET + 0x048)
+# define MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK                              0xffff
+# define MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_SHIFT                             0
+
+#define MTK_DP_AUX_P0_364C              (AUX_OFFSET + 0x04C)
+# define MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK                              0xf
+# define MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_SHIFT                             0
+
+#define MTK_DP_AUX_P0_3650              (AUX_OFFSET + 0x050)
+# define MCU_REQ_DATA_NUM_AUX_TX_P0_MASK                                     0xf000
+# define MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT                                    12
+# define PHY_FIFO_RST_AUX_TX_P0_MASK                                         0x200
+# define PHY_FIFO_RST_AUX_TX_P0_SHIFT                                        9
+# define MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_MASK                                0x100
+# define MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_SHIFT                               8
+# define AUX_TEST_CONFIG_AUX_TX_P0_MASK                                      0xff
+# define AUX_TEST_CONFIG_AUX_TX_P0_SHIFT                                     0
+
+#define MTK_DP_AUX_P0_3654              (AUX_OFFSET + 0x054)
+# define TST_AUXRX_AUX_TX_P0_MASK                                            0xff
+# define TST_AUXRX_AUX_TX_P0_SHIFT                                           0
+
+#define MTK_DP_AUX_P0_3658              (AUX_OFFSET + 0x058)
+# define AUX_TX_OV_EN_AUX_TX_P0_MASK                                         0x1
+# define AUX_TX_OV_EN_AUX_TX_P0_SHIFT                                        0
+# define AUX_TX_VALUE_SET_AUX_TX_P0_MASK                                     0x2
+# define AUX_TX_VALUE_SET_AUX_TX_P0_SHIFT                                    1
+# define AUX_TX_OEN_SET_AUX_TX_P0_MASK                                       0x4
+# define AUX_TX_OEN_SET_AUX_TX_P0_SHIFT                                      2
+# define AUX_TX_OV_MODE_AUX_TX_P0_MASK                                       0x8
+# define AUX_TX_OV_MODE_AUX_TX_P0_SHIFT                                      3
+# define AUX_TX_OFF_AUX_TX_P0_MASK                                           0x10
+# define AUX_TX_OFF_AUX_TX_P0_SHIFT                                          4
+# define EXT_AUX_PHY_MODE_AUX_TX_P0_MASK                                     0x20
+# define EXT_AUX_PHY_MODE_AUX_TX_P0_SHIFT                                    5
+# define EXT_TX_OEN_POLARITY_AUX_TX_P0_MASK                                  0x40
+# define EXT_TX_OEN_POLARITY_AUX_TX_P0_SHIFT                                 6
+# define AUX_RX_OEN_SET_AUX_TX_P0_MASK                                       0x80
+# define AUX_RX_OEN_SET_AUX_TX_P0_SHIFT                                      7
+
+#define MTK_DP_AUX_P0_365C              (AUX_OFFSET + 0x05C)
+# define AUX_RCTRL_AUX_TX_P0_MASK                                            0x1f
+# define AUX_RCTRL_AUX_TX_P0_SHIFT                                           0
+# define AUX_RPD_AUX_TX_P0_MASK                                              0x20
+# define AUX_RPD_AUX_TX_P0_SHIFT                                             5
+# define AUX_RX_SEL_AUX_TX_P0_MASK                                           0x40
+# define AUX_RX_SEL_AUX_TX_P0_SHIFT                                          6
+# define AUXRX_DEBOUNCE_SEL_AUX_TX_P0_MASK                                   0x80
+# define AUXRX_DEBOUNCE_SEL_AUX_TX_P0_SHIFT                                  7
+# define AUXRXVALID_DEBOUNCE_SEL_AUX_TX_P0_MASK                              0x100
+# define AUXRXVALID_DEBOUNCE_SEL_AUX_TX_P0_SHIFT                             8
+# define AUX_DEBOUNCE_CLKSEL_AUX_TX_P0_MASK                                  0xe00
+# define AUX_DEBOUNCE_CLKSEL_AUX_TX_P0_SHIFT                                 9
+# define DATA_VALID_DEBOUNCE_SEL_AUX_TX_P0_MASK                              0x1000
+# define DATA_VALID_DEBOUNCE_SEL_AUX_TX_P0_SHIFT                             12
+
+#define MTK_DP_AUX_P0_3660              (AUX_OFFSET + 0x060)
+# define DP_TX_INT_MASK_AUX_TX_P0_MASK                                       0xffff
+# define DP_TX_INT_MASK_AUX_TX_P0_SHIFT                                      0
+
+#define MTK_DP_AUX_P0_3664              (AUX_OFFSET + 0x064)
+# define DP_TX_INT_FORCE_AUX_TX_P0_MASK                                      0xffff
+# define DP_TX_INT_FORCE_AUX_TX_P0_SHIFT                                     0
+
+#define MTK_DP_AUX_P0_3668              (AUX_OFFSET + 0x068)
+# define DP_TX_INT_CLR_AUX_TX_P0_MASK                                        0xffff
+# define DP_TX_INT_CLR_AUX_TX_P0_SHIFT                                       0
+
+#define MTK_DP_AUX_P0_366C              (AUX_OFFSET + 0x06C)
+# define XTAL_FREQ_AUX_TX_P0_MASK                                            0xff00
+# define XTAL_FREQ_AUX_TX_P0_SHIFT                                           8
+
+#define MTK_DP_AUX_P0_3670              (AUX_OFFSET + 0x070)
+# define DPTX_GPIO_OEN_AUX_TX_P0_MASK                                        0x7
+# define DPTX_GPIO_OEN_AUX_TX_P0_SHIFT                                       0
+# define DPTX_GPIO_OUT_AUX_TX_P0_MASK                                        0x38
+# define DPTX_GPIO_OUT_AUX_TX_P0_SHIFT                                       3
+# define DPTX_GPIO_IN_AUX_TX_P0_MASK                                         0x1c0
+# define DPTX_GPIO_IN_AUX_TX_P0_SHIFT                                        6
+# define AUX_IN_AUX_TX_P0_MASK                                               0x200
+# define AUX_IN_AUX_TX_P0_SHIFT                                              9
+# define PD_AUX_RTERM_AUX_TX_P0_MASK                                         0x400
+# define PD_AUX_RTERM_AUX_TX_P0_SHIFT                                        10
+# define DPTX_GPIO_EN_AUX_TX_P0_MASK                                         0x7000
+# define DPTX_GPIO_EN_AUX_TX_P0_SHIFT                                        12
+
+#define MTK_DP_AUX_P0_3674              (AUX_OFFSET + 0x074)
+# define AUXTX_ISEL_AUX_TX_P0_MASK                                           0x1f
+# define AUXTX_ISEL_AUX_TX_P0_SHIFT                                          0
+# define AUXRX_VTH_AUX_TX_P0_MASK                                            0x60
+# define AUXRX_VTH_AUX_TX_P0_SHIFT                                           5
+# define EN_RXCM_BOOST_AUX_TX_P0_MASK                                        0x80
+# define EN_RXCM_BOOST_AUX_TX_P0_SHIFT                                       7
+# define DPTX_AUX_R_CTRL_AUX_TX_P0_MASK                                      0x1f00
+# define DPTX_AUX_R_CTRL_AUX_TX_P0_SHIFT                                     8
+# define I2C_EN_AUXN_AUX_TX_P0_MASK                                          0x2000
+# define I2C_EN_AUXN_AUX_TX_P0_SHIFT                                         13
+# define I2C_EN_AUXP_AUX_TX_P0_MASK                                          0x4000
+# define I2C_EN_AUXP_AUX_TX_P0_SHIFT                                         14
+
+#define MTK_DP_AUX_P0_3678              (AUX_OFFSET + 0x078)
+# define TEST_AUXTX_AUX_TX_P0_MASK                                           0xff00
+# define TEST_AUXTX_AUX_TX_P0_SHIFT                                          8
+
+#define MTK_DP_AUX_P0_367C              (AUX_OFFSET + 0x07C)
+# define DPTX_AUXRX_AUX_TX_P0_MASK                                           0x4
+# define DPTX_AUXRX_AUX_TX_P0_SHIFT                                          2
+# define DPTX_AUXRX_VALID_AUX_TX_P0_MASK                                     0x8
+# define DPTX_AUXRX_VALID_AUX_TX_P0_SHIFT                                    3
+# define DPTX_AUXRX_WO_TH_AUX_TX_P0_MASK                                     0x10
+# define DPTX_AUXRX_WO_TH_AUX_TX_P0_SHIFT                                    4
+# define DPTX_AUXRX_L_TEST_AUX_TX_P0_MASK                                    0x20
+# define DPTX_AUXRX_L_TEST_AUX_TX_P0_SHIFT                                   5
+# define EN_AUXRX_AUX_TX_P0_MASK                                             0x400
+# define EN_AUXRX_AUX_TX_P0_SHIFT                                            10
+# define EN_AUXTX_AUX_TX_P0_MASK                                             0x800
+# define EN_AUXTX_AUX_TX_P0_SHIFT                                            11
+# define EN_AUX_AUX_TX_P0_MASK                                               0x1000
+# define EN_AUX_AUX_TX_P0_SHIFT                                              12
+# define EN_5V_TOL_AUX_TX_P0_MASK                                            0x2000
+# define EN_5V_TOL_AUX_TX_P0_SHIFT                                           13
+# define AUXP_I_AUX_TX_P0_MASK                                               0x4000
+# define AUXP_I_AUX_TX_P0_SHIFT                                              14
+# define AUXN_I_AUX_TX_P0_MASK                                               0x8000
+# define AUXN_I_AUX_TX_P0_SHIFT                                              15
+
+#define MTK_DP_AUX_P0_3680              (AUX_OFFSET + 0x080)
+# define AUX_SWAP_TX_AUX_TX_P0_MASK                                          0x1
+# define AUX_SWAP_TX_AUX_TX_P0_SHIFT                                         0
+
+#define MTK_DP_AUX_P0_3684              (AUX_OFFSET + 0x084)
+# define TEST_IO_LOOPBK_AUX_TX_P0_MASK                                       0x1f
+# define TEST_IO_LOOPBK_AUX_TX_P0_SHIFT                                      0
+# define RO_IO_LOOPBKT_AUX_TX_P0_MASK                                        0x300
+# define RO_IO_LOOPBKT_AUX_TX_P0_SHIFT                                       8
+# define SEL_TCLK_AUX_TX_P0_MASK                                             0x3000
+# define SEL_TCLK_AUX_TX_P0_SHIFT                                            12
+# define TESTEN_ASIO_AUX_TX_P0_MASK                                          0x4000
+# define TESTEN_ASIO_AUX_TX_P0_SHIFT                                         14
+
+#define MTK_DP_AUX_P0_3688              (AUX_OFFSET + 0x088)
+# define TEST_AUXRX_VTH_AUX_TX_P0_MASK                                       0x7
+# define TEST_AUXRX_VTH_AUX_TX_P0_SHIFT                                      0
+
+#define MTK_DP_AUX_P0_368C              (AUX_OFFSET + 0x08C)
+# define RX_FIFO_DONE_AUX_TX_P0_MASK                                         0x1
+# define RX_FIFO_DONE_AUX_TX_P0_SHIFT                                        0
+# define RX_FIFO_DONE_CLR_AUX_TX_P0_MASK                                     0x2
+# define RX_FIFO_DONE_CLR_AUX_TX_P0_SHIFT                                    1
+# define TX_FIFO_DONE_AUX_TX_P0_MASK                                         0x4
+# define TX_FIFO_DONE_AUX_TX_P0_SHIFT                                        2
+# define TX_FIFO_DONE_CLR_AUX_TX_P0_MASK                                     0x8
+# define TX_FIFO_DONE_CLR_AUX_TX_P0_SHIFT                                    3
+
+#define MTK_DP_AUX_P0_3690              (AUX_OFFSET + 0x090)
+# define DATA_LOW_CNT_THRD_AUX_TX_P0_MASK                                    0x7f
+# define DATA_LOW_CNT_THRD_AUX_TX_P0_SHIFT                                   0
+# define RX_REPLY_COMPLETE_MODE_AUX_TX_P0_MASK                               0x100
+# define RX_REPLY_COMPLETE_MODE_AUX_TX_P0_SHIFT                              8
+
+#define MTK_DP_AUX_P0_36C0              (AUX_OFFSET + 0x0C0)
+# define RX_GTC_VALUE_0_AUX_TX_P0_MASK                                       0xffff
+# define RX_GTC_VALUE_0_AUX_TX_P0_SHIFT                                      0
+
+#define MTK_DP_AUX_P0_36C4              (AUX_OFFSET + 0x0C4)
+# define RX_GTC_VALUE_1_AUX_TX_P0_MASK                                       0xffff
+# define RX_GTC_VALUE_1_AUX_TX_P0_SHIFT                                      0
+
+#define MTK_DP_AUX_P0_36C8              (AUX_OFFSET + 0x0C8)
+# define RX_GTC_MASTER_REQ_AUX_TX_P0_MASK                                    0x1
+# define RX_GTC_MASTER_REQ_AUX_TX_P0_SHIFT                                   0
+# define TX_GTC_VALUE_PHASE_SKEW_EN_AUX_TX_P0_MASK                           0x2
+# define TX_GTC_VALUE_PHASE_SKEW_EN_AUX_TX_P0_SHIFT                          1
+# define RX_GTC_FREQ_LOCK_DONE_AUX_TX_P0_MASK                                0x4
+# define RX_GTC_FREQ_LOCK_DONE_AUX_TX_P0_SHIFT                               2
+
+#define MTK_DP_AUX_P0_36CC              (AUX_OFFSET + 0x0CC)
+# define RX_GTC_PHASE_SKEW_OFFSET_AUX_TX_P0_MASK                             0xffff
+# define RX_GTC_PHASE_SKEW_OFFSET_AUX_TX_P0_SHIFT                            0
+
+#define MTK_DP_AUX_P0_36D0              (AUX_OFFSET + 0x0D0)
+# define TX_GTC_VALUE_0_AUX_TX_P0_MASK                                       0xffff
+# define TX_GTC_VALUE_0_AUX_TX_P0_SHIFT                                      0
+
+#define MTK_DP_AUX_P0_36D4              (AUX_OFFSET + 0x0D4)
+# define TX_GTC_VALUE_1_AUX_TX_P0_MASK                                       0xffff
+# define TX_GTC_VALUE_1_AUX_TX_P0_SHIFT                                      0
+
+#define MTK_DP_AUX_P0_36D8              (AUX_OFFSET + 0x0D8)
+# define RX_GTC_VALUE_PHASE_SKEW_EN_AUX_TX_P0_MASK                           0x1
+# define RX_GTC_VALUE_PHASE_SKEW_EN_AUX_TX_P0_SHIFT                          0
+# define TX_GTC_FREQ_LOCK_DONE_AUX_TX_P0_MASK                                0x2
+# define TX_GTC_FREQ_LOCK_DONE_AUX_TX_P0_SHIFT                               1
+# define TX_GTC_VALUE_PHASE_ADJUST_EN_AUX_TX_P0_MASK                         0x4
+# define TX_GTC_VALUE_PHASE_ADJUST_EN_AUX_TX_P0_SHIFT                        2
+
+#define MTK_DP_AUX_P0_36DC              (AUX_OFFSET + 0x0DC)
+# define TX_GTC_PHASE_SKEW_OFFSET_AUX_TX_P0_MASK                             0xffff
+# define TX_GTC_PHASE_SKEW_OFFSET_AUX_TX_P0_SHIFT                            0
+
+#define MTK_DP_AUX_P0_36E0              (AUX_OFFSET + 0x0E0)
+# define GTC_STATE_AUX_TX_P0_MASK                                            0xf
+# define GTC_STATE_AUX_TX_P0_SHIFT                                           0
+# define RX_MASTER_LOCK_ACCQUI_CHKTIME_AUX_TX_P0_MASK                        0xf0
+# define RX_MASTER_LOCK_ACCQUI_CHKTIME_AUX_TX_P0_SHIFT                       4
+# define FREQ_AUX_TX_P0_MASK                                                 0xff00
+# define FREQ_AUX_TX_P0_SHIFT                                                8
+
+#define MTK_DP_AUX_P0_36E4              (AUX_OFFSET + 0x0E4)
+# define GTC_TX_1M_ADD_VAL_AUX_TX_P0_MASK                                    0x3ff
+# define GTC_TX_1M_ADD_VAL_AUX_TX_P0_SHIFT                                   0
+# define GTC_TX_10M_ADD_VAL_AUX_TX_P0_MASK                                   0xf000
+# define GTC_TX_10M_ADD_VAL_AUX_TX_P0_SHIFT                                  12
+
+#define MTK_DP_AUX_P0_36E8              (AUX_OFFSET + 0x0E8)
+# define CHK_TX_PH_ADJUST_CHK_EN_AUX_TX_P0_MASK                              0x1
+# define CHK_TX_PH_ADJUST_CHK_EN_AUX_TX_P0_SHIFT                             0
+# define TX_SLAVE_WAIT_SKEW_EN_AUX_TX_P0_MASK                                0x2
+# define TX_SLAVE_WAIT_SKEW_EN_AUX_TX_P0_SHIFT                               1
+# define GTC_SEND_RCV_EN_AUX_TX_P0_MASK                                      0x4
+# define GTC_SEND_RCV_EN_AUX_TX_P0_SHIFT                                     2
+# define AUXTX_HW_ACCS_EN_AUX_TX_P0_MASK                                     0x8
+# define AUXTX_HW_ACCS_EN_AUX_TX_P0_SHIFT                                    3
+# define GTC_TX_MASTER_EN_AUX_TX_P0_MASK                                     0x10
+# define GTC_TX_MASTER_EN_AUX_TX_P0_SHIFT                                    4
+# define GTC_TX_SLAVE_EN_AUX_TX_P0_MASK                                      0x20
+# define GTC_TX_SLAVE_EN_AUX_TX_P0_SHIFT                                     5
+# define OFFSET_TRY_NUM_AUX_TX_P0_MASK                                       0xf00
+# define OFFSET_TRY_NUM_AUX_TX_P0_SHIFT                                      8
+# define HW_SW_ARBIT_AUX_TX_P0_MASK                                          0xc000
+# define HW_SW_ARBIT_AUX_TX_P0_SHIFT                                         14
+
+#define MTK_DP_AUX_P0_36EC              (AUX_OFFSET + 0x0EC)
+# define GTC_DB_OPTION_AUX_TX_P0_MASK                                        0x7
+# define GTC_DB_OPTION_AUX_TX_P0_SHIFT                                       0
+# define TX_SLAVE_CHK_RX_LCK_EN_AUX_TX_P0_MASK                               0x8
+# define TX_SLAVE_CHK_RX_LCK_EN_AUX_TX_P0_SHIFT                              3
+# define GTC_PUL_DELAY_AUX_TX_P0_MASK                                        0xff00
+# define GTC_PUL_DELAY_AUX_TX_P0_SHIFT                                       8
+
+#define MTK_DP_AUX_P0_36F0              (AUX_OFFSET + 0x0F0)
+# define GTC_TX_LCK_ACQ_SEND_NUM_AUX_TX_P0_MASK                              0x1f
+# define GTC_TX_LCK_ACQ_SEND_NUM_AUX_TX_P0_SHIFT                             0
+
+#define MTK_DP_AUX_P0_3700              (AUX_OFFSET + 0x100)
+# define AUX_PHYWAKE_MODE_AUX_TX_P0_MASK                                     0x1
+# define AUX_PHYWAKE_MODE_AUX_TX_P0_SHIFT                                    0
+# define AUX_PHYWAKE_ONLY_AUX_TX_P0_MASK                                     0x2
+# define AUX_PHYWAKE_ONLY_AUX_TX_P0_SHIFT                                    1
+# define PHYWAKE_PRE_NUM_AUX_TX_P0_MASK                                      0x70
+# define PHYWAKE_PRE_NUM_AUX_TX_P0_SHIFT                                     4
+
+#define MTK_DP_AUX_P0_3704              (AUX_OFFSET + 0x104)
+# define AUX_PHYWAKE_ACK_RECV_COMPLETE_IRQ_AUX_TX_P0_MASK                    0x1
+# define AUX_PHYWAKE_ACK_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT                   0
+# define AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK               0x2
+# define AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_SHIFT              1
+# define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MASK                              0x4
+# define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT                             2
+
+#define MTK_DP_AUX_P0_3708              (AUX_OFFSET + 0x108)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE0_AUX_TX_P0_MASK                         0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE0_AUX_TX_P0_SHIFT                        0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE1_AUX_TX_P0_MASK                         0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE1_AUX_TX_P0_SHIFT                        8
+
+#define MTK_DP_AUX_P0_370C              (AUX_OFFSET + 0x10C)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE2_AUX_TX_P0_MASK                         0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE2_AUX_TX_P0_SHIFT                        0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE3_AUX_TX_P0_MASK                         0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE3_AUX_TX_P0_SHIFT                        8
+
+#define MTK_DP_AUX_P0_3710              (AUX_OFFSET + 0x110)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE4_AUX_TX_P0_MASK                         0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE4_AUX_TX_P0_SHIFT                        0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE5_AUX_TX_P0_MASK                         0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE5_AUX_TX_P0_SHIFT                        8
+
+#define MTK_DP_AUX_P0_3714              (AUX_OFFSET + 0x114)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE6_AUX_TX_P0_MASK                         0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE6_AUX_TX_P0_SHIFT                        0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE7_AUX_TX_P0_MASK                         0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE7_AUX_TX_P0_SHIFT                        8
+
+#define MTK_DP_AUX_P0_3718              (AUX_OFFSET + 0x118)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE8_AUX_TX_P0_MASK                         0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE8_AUX_TX_P0_SHIFT                        0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE9_AUX_TX_P0_MASK                         0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE9_AUX_TX_P0_SHIFT                        8
+
+#define MTK_DP_AUX_P0_371C              (AUX_OFFSET + 0x11C)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE10_AUX_TX_P0_MASK                        0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE10_AUX_TX_P0_SHIFT                       0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE11_AUX_TX_P0_MASK                        0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE11_AUX_TX_P0_SHIFT                       8
+
+#define MTK_DP_AUX_P0_3720              (AUX_OFFSET + 0x120)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE12_AUX_TX_P0_MASK                        0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE12_AUX_TX_P0_SHIFT                       0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE13_AUX_TX_P0_MASK                        0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE13_AUX_TX_P0_SHIFT                       8
+
+#define MTK_DP_AUX_P0_3724              (AUX_OFFSET + 0x124)
+# define AUX_TX_FIFO_WRITE_DATA_BYTE14_AUX_TX_P0_MASK                        0xff
+# define AUX_TX_FIFO_WRITE_DATA_BYTE14_AUX_TX_P0_SHIFT                       0
+# define AUX_TX_FIFO_WRITE_DATA_BYTE15_AUX_TX_P0_MASK                        0xff00
+# define AUX_TX_FIFO_WRITE_DATA_BYTE15_AUX_TX_P0_SHIFT                       8
+
+#define MTK_DP_AUX_P0_3740              (AUX_OFFSET + 0x140)
+# define HPD_OEN_AUX_TX_P0_MASK                                              0x1
+# define HPD_OEN_AUX_TX_P0_SHIFT                                             0
+# define HPD_I_AUX_TX_P0_MASK                                                0x2
+# define HPD_I_AUX_TX_P0_SHIFT                                               1
+
+#define MTK_DP_AUX_P0_3744              (AUX_OFFSET + 0x144)
+# define TEST_AUXRX_AUX_TX_P0_MASK                                           0xffff
+# define TEST_AUXRX_AUX_TX_P0_SHIFT                                          0
+
+#define MTK_DP_AUX_P0_3748              (AUX_OFFSET + 0x148)
+# define CK_XTAL_AUX_TX_P0_MASK                                              0x1
+# define CK_XTAL_AUX_TX_P0_SHIFT                                             0
+# define EN_FT_MUX_AUX_TX_P0_MASK                                            0x2
+# define EN_FT_MUX_AUX_TX_P0_SHIFT                                           1
+# define EN_GPIO_AUX_TX_P0_MASK                                              0x4
+# define EN_GPIO_AUX_TX_P0_SHIFT                                             2
+# define EN_HBR3_AUX_TX_P0_MASK                                              0x8
+# define EN_HBR3_AUX_TX_P0_SHIFT                                             3
+# define PD_NGATE_OV_AUX_TX_P0_MASK                                          0x10
+# define PD_NGATE_OV_AUX_TX_P0_SHIFT                                         4
+# define PD_NGATE_OVEN_AUX_TX_P0_MASK                                        0x20
+# define PD_NGATE_OVEN_AUX_TX_P0_SHIFT                                       5
+# define PD_VCM_OP_AUX_TX_P0_MASK                                            0x40
+# define PD_VCM_OP_AUX_TX_P0_SHIFT                                           6
+# define CK_XTAL_SW_AUX_TX_P0_MASK                                           0x80
+# define CK_XTAL_SW_AUX_TX_P0_SHIFT                                          7
+# define SEL_FTMUX_AUX_TX_P0_MASK                                            0x300
+# define SEL_FTMUX_AUX_TX_P0_SHIFT                                           8
+# define GTC_EN_AUX_TX_P0_MASK                                               0x400
+# define GTC_EN_AUX_TX_P0_SHIFT                                              10
+# define GTC_DATA_IN_MODE_AUX_TX_P0_MASK                                     0x800
+# define GTC_DATA_IN_MODE_AUX_TX_P0_SHIFT                                    11
+
+#define MTK_DP_AUX_P0_374C              (AUX_OFFSET + 0x14C)
+# define AUX_VALID_DB_TH_AUX_TX_P0_MASK                                      0xf
+# define AUX_VALID_DB_TH_AUX_TX_P0_SHIFT                                     0
+# define CLK_AUX_MUX_VALID_EN_AUX_TX_P0_MASK                                 0x100
+# define CLK_AUX_MUX_VALID_EN_AUX_TX_P0_SHIFT                                8
+# define CLK_AUX_MUX_VALID_INV_AUX_TX_P0_MASK                                0x200
+# define CLK_AUX_MUX_VALID_INV_AUX_TX_P0_SHIFT                               9
+# define CLK_AUX_MUX_VALID_SEL_AUX_TX_P0_MASK                                0xc00
+# define CLK_AUX_MUX_VALID_SEL_AUX_TX_P0_SHIFT                               10
+# define CLK_AUX_MUX_DATA_EN_AUX_TX_P0_MASK                                  0x1000
+# define CLK_AUX_MUX_DATA_EN_AUX_TX_P0_SHIFT                                 12
+# define CLK_AUX_MUX_DATA_INV_AUX_TX_P0_MASK                                 0x2000
+# define CLK_AUX_MUX_DATA_INV_AUX_TX_P0_SHIFT                                13
+# define CLK_AUX_MUX_DATA_SEL_AUX_TX_P0_MASK                                 0xc000
+# define CLK_AUX_MUX_DATA_SEL_AUX_TX_P0_SHIFT                                14
+
+#define MTK_DP_AUX_P0_3780              (AUX_OFFSET + 0x180)
+# define AUX_RX_FIFO_DATA0_AUX_TX_P0_MASK                                    0xff
+# define AUX_RX_FIFO_DATA0_AUX_TX_P0_SHIFT                                   0
+# define AUX_RX_FIFO_DATA1_AUX_TX_P0_MASK                                    0xff00
+# define AUX_RX_FIFO_DATA1_AUX_TX_P0_SHIFT                                   8
+
+#define MTK_DP_AUX_P0_3784              (AUX_OFFSET + 0x184)
+# define AUX_RX_FIFO_DATA2_AUX_TX_P0_MASK                                    0xff
+# define AUX_RX_FIFO_DATA2_AUX_TX_P0_SHIFT                                   0
+# define AUX_RX_FIFO_DATA3_AUX_TX_P0_MASK                                    0xff00
+# define AUX_RX_FIFO_DATA3_AUX_TX_P0_SHIFT                                   8
+
+#define MTK_DP_AUX_P0_3788              (AUX_OFFSET + 0x188)
+# define AUX_RX_FIFO_DATA4_AUX_TX_P0_MASK                                    0xff
+# define AUX_RX_FIFO_DATA4_AUX_TX_P0_SHIFT                                   0
+# define AUX_RX_FIFO_DATA5_AUX_TX_P0_MASK                                    0xff00
+# define AUX_RX_FIFO_DATA5_AUX_TX_P0_SHIFT                                   8
+
+#define MTK_DP_AUX_P0_378C              (AUX_OFFSET + 0x18C)
+# define AUX_RX_FIFO_DATA6_AUX_TX_P0_MASK                                    0xff
+# define AUX_RX_FIFO_DATA6_AUX_TX_P0_SHIFT                                   0
+# define AUX_RX_FIFO_DATA7_AUX_TX_P0_MASK                                    0xff00
+# define AUX_RX_FIFO_DATA7_AUX_TX_P0_SHIFT                                   8
+
+#define MTK_DP_AUX_P0_3790              (AUX_OFFSET + 0x190)
+# define AUX_RX_FIFO_DATA8_AUX_TX_P0_MASK                                    0xff
+# define AUX_RX_FIFO_DATA8_AUX_TX_P0_SHIFT                                   0
+# define AUX_RX_FIFO_DATA9_AUX_TX_P0_MASK                                    0xff00
+# define AUX_RX_FIFO_DATA9_AUX_TX_P0_SHIFT                                   8
+
+#define MTK_DP_AUX_P0_3794              (AUX_OFFSET + 0x194)
+# define AUX_RX_FIFO_DATA10_AUX_TX_P0_MASK                                   0xff
+# define AUX_RX_FIFO_DATA10_AUX_TX_P0_SHIFT                                  0
+# define AUX_RX_FIFO_DATA11_AUX_TX_P0_MASK                                   0xff00
+# define AUX_RX_FIFO_DATA11_AUX_TX_P0_SHIFT                                  8
+
+#define MTK_DP_AUX_P0_3798              (AUX_OFFSET + 0x198)
+# define AUX_RX_FIFO_DATA12_AUX_TX_P0_MASK                                   0xff
+# define AUX_RX_FIFO_DATA12_AUX_TX_P0_SHIFT                                  0
+# define AUX_RX_FIFO_DATA13_AUX_TX_P0_MASK                                   0xff00
+# define AUX_RX_FIFO_DATA13_AUX_TX_P0_SHIFT                                  8
+
+#define MTK_DP_AUX_P0_379C              (AUX_OFFSET + 0x19C)
+# define AUX_RX_FIFO_DATA14_AUX_TX_P0_MASK                                   0xff
+# define AUX_RX_FIFO_DATA14_AUX_TX_P0_SHIFT                                  0
+# define AUX_RX_FIFO_DATA15_AUX_TX_P0_MASK                                   0xff00
+# define AUX_RX_FIFO_DATA15_AUX_TX_P0_SHIFT                                  8
+
+#define MTK_DP_AUX_P0_37C0              (AUX_OFFSET + 0x1C0)
+# define AUX_DRV_EN_TIME_THRD_AUX_TX_P0_MASK                                 0x1f
+# define AUX_DRV_EN_TIME_THRD_AUX_TX_P0_SHIFT                                0
+# define AUX_DRV_DIS_TIME_THRD_AUX_TX_P0_MASK                                0x1f00
+# define AUX_DRV_DIS_TIME_THRD_AUX_TX_P0_SHIFT                               8
+
+#define MTK_DP_AUX_P0_37C4              (AUX_OFFSET + 0x1C4)
+# define AUX_WAIT_TRANSFER_TIME_THRD_AUX_TX_P0_MASK                          0xff
+# define AUX_WAIT_TRANSFER_TIME_THRD_AUX_TX_P0_SHIFT                         0
+# define AUX_WAIT_RECEIVE_TIME_THRD_AUX_TX_P0_MASK                           0xff00
+# define AUX_WAIT_RECEIVE_TIME_THRD_AUX_TX_P0_SHIFT                          8
+
+#define MTK_DP_AUX_P0_37C8              (AUX_OFFSET + 0x1C8)
+# define MTK_ATOP_EN_AUX_TX_P0_MASK                                          0x1
+# define MTK_ATOP_EN_AUX_TX_P0_SHIFT                                         0
+
+#define MTK_DP_TOP_PWR_STATE              (TOP_OFFSET + 0x00)
+# define DP_PWR_STATE_MASK                                                   0x3
+# define DP_PWR_STATE_SHIFT                                                  0
+# define DP_PWR_STATE_OFF                                                    0
+# define DP_PWR_STATE_BANDGAP                                                1
+# define DP_PWR_STATE_BANDGAP_TPLL                                           2
+# define DP_PWR_STATE_BANDGAP_TPLL_LANE                                      3
+# define DP_SCRAMB_EN_MASK                                                   0x4
+# define DP_SCRAMB_EN_SHIFT                                                  2
+# define DP_DISP_RST_MASK                                                    0x8
+# define DP_DISP_RST_SHIFT                                                   3
+
+#define MTK_DP_TOP_SWING_EMP              (TOP_OFFSET + 0x04)
+# define DP_TX0_VOLT_SWING_MASK                                              0x3
+# define DP_TX0_VOLT_SWING_SHIFT                                             0
+# define DP_TX0_PRE_EMPH_MASK                                                0xc
+# define DP_TX0_PRE_EMPH_SHIFT                                               2
+# define DP_TX0_DATAK_MASK                                                   0xf0
+# define DP_TX0_DATAK_SHIFT                                                  4
+# define DP_TX1_VOLT_SWING_MASK                                              0x300
+# define DP_TX1_VOLT_SWING_SHIFT                                             8
+# define DP_TX1_PRE_EMPH_MASK                                                0xc00
+# define DP_TX1_PRE_EMPH_SHIFT                                               10
+# define DP_TX1_DATAK_MASK                                                   0xf000
+# define DP_TX1_DATAK_SHIFT                                                  12
+# define DP_TX2_VOLT_SWING_MASK                                              0x30000
+# define DP_TX2_VOLT_SWING_SHIFT                                             16
+# define DP_TX2_PRE_EMPH_MASK                                                0xc0000
+# define DP_TX2_PRE_EMPH_SHIFT                                               18
+# define DP_TX2_DATAK_MASK                                                   0xf00000
+# define DP_TX2_DATAK_SHIFT                                                  20
+# define DP_TX3_VOLT_SWING_MASK                                              0x3000000
+# define DP_TX3_VOLT_SWING_SHIFT                                             24
+# define DP_TX3_PRE_EMPH_MASK                                                0xc000000
+# define DP_TX3_PRE_EMPH_SHIFT                                               26
+# define DP_TX3_DATAK_MASK                                                   0xf0000000L
+# define DP_TX3_DATAK_SHIFT                                                  28
+
+#define MTK_DP_TOP_APB_WSTRB              (TOP_OFFSET + 0x10)
+# define APB_WSTRB_MASK                                           0xf
+# define APB_WSTRB_SHIFT                                          0
+# define APB_WSTRB_EN_MASK                                        0x10
+# define APB_WSTRB_EN_SHIFT                                       4
+
+#define MTK_DP_TOP_RESERVED              (TOP_OFFSET + 0x14)
+# define RESERVED_MASK                                            0xffffffffL
+# define RESERVED_SHIFT                                           0
+
+#define MTK_DP_TOP_RESET_AND_PROBE              (TOP_OFFSET + 0x20)
+# define SW_RST_B_MASK                                            0x1f
+# define SW_RST_B_SHIFT                                           0
+# define SW_RST_B_PHYD                                          (BIT(4) << SW_RST_B_SHIFT)
+# define PROBE_LOW_SEL_MASK                                       0x38000
+# define PROBE_LOW_SEL_SHIFT                                      15
+# define PROBE_HIGH_SEL_MASK                                      0x1c0000
+# define PROBE_HIGH_SEL_SHIFT                                     18
+# define PROBE_LOW_HIGH_SWAP_MASK                                 0x200000
+# define PROBE_LOW_HIGH_SWAP_SHIFT                                21
+
+#define MTK_DP_TOP_SOFT_PROBE              (TOP_OFFSET + 0x24)
+# define SW_PROBE_VALUE_MASK                                      0xffffffffL
+# define SW_PROBE_VALUE_SHIFT                                     0
+
+#define MTK_DP_TOP_IRQ_STATUS              (TOP_OFFSET + 0x28)
+# define RGS_IRQ_STATUS_MASK                                      0x7
+# define RGS_IRQ_STATUS_SHIFT                                     0
+# define RGS_IRQ_STATUS_ENCODER                                   (BIT(0) << RGS_IRQ_STATUS_SHIFT)
+# define RGS_IRQ_STATUS_TRANSMITTER                               (BIT(1) << RGS_IRQ_STATUS_SHIFT)
+# define RGS_IRQ_STATUS_AUX_TOP                                   (BIT(2) << RGS_IRQ_STATUS_SHIFT)
+
+#define MTK_DP_TOP_IRQ_MASK              (TOP_OFFSET + 0x2C)
+# define IRQ_MASK_MASK                                            0x7
+# define IRQ_MASK_SHIFT                                           0
+# define IRQ_MASK_ENCODER_IRQ                                     BIT(0)
+# define IRQ_MASK_TRANSMITTER_IRQ                                 BIT(1)
+# define IRQ_MASK_AUX_TOP_IRQ                                     BIT(2)
+# define IRQ_OUT_HIGH_ACTIVE_MASK                                 0x100
+# define IRQ_OUT_HIGH_ACTIVE_SHIFT                                8
+
+#define MTK_DP_TOP_BLACK_SCREEN              (TOP_OFFSET + 0x30)
+# define BLACK_SCREEN_ENABLE_MASK                                 0x1
+# define BLACK_SCREEN_ENABLE_SHIFT                                0
+
+#define MTK_DP_TOP_MEM_PD              (TOP_OFFSET + 0x38)
+# define MEM_ISO_EN_MASK                                          0x1
+# define MEM_ISO_EN_SHIFT                                         0
+# define MEM_PD_MASK                                              0x2
+# define MEM_PD_SHIFT                                             1
+# define FUSE_SEL_MASK                                            0x4
+# define FUSE_SEL_SHIFT                                           2
+# define LOAD_PREFUSE_MASK                                        0x8
+# define LOAD_PREFUSE_SHIFT                                       3
+
+#define MTK_DP_TOP_MBIST_PREFUSE              (TOP_OFFSET + 0x3C)
+# define RGS_PREFUSE_MASK                                          0xffff
+# define RGS_PREFUSE_SHIFT                                         0
+
+#define MTK_DP_TOP_MEM_DELSEL_0              (TOP_OFFSET + 0x40)
+# define DELSEL_0_MASK                                             0xfffff
+# define DELSEL_0_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_0_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_0_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_1              (TOP_OFFSET + 0x44)
+# define DELSEL_1_MASK                                             0xfffff
+# define DELSEL_1_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_1_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_1_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_2              (TOP_OFFSET + 0x48)
+# define DELSEL_2_MASK                                             0xfffff
+# define DELSEL_2_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_2_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_2_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_3              (TOP_OFFSET + 0x4C)
+# define DELSEL_3_MASK                                             0xfffff
+# define DELSEL_3_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_3_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_3_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_4              (TOP_OFFSET + 0x50)
+# define DELSEL_4_MASK                                             0xfffff
+# define DELSEL_4_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_4_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_4_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_5              (TOP_OFFSET + 0x54)
+# define DELSEL_5_MASK                                             0xfffff
+# define DELSEL_5_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_5_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_5_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_6              (TOP_OFFSET + 0x58)
+# define DELSEL_6_MASK                                             0xfffff
+# define DELSEL_6_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_6_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_6_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_7              (TOP_OFFSET + 0x5C)
+# define DELSEL_7_MASK                                             0xfffff
+# define DELSEL_7_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_7_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_7_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_8              (TOP_OFFSET + 0x60)
+# define DELSEL_8_MASK                                             0xfffff
+# define DELSEL_8_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_8_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_8_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_9              (TOP_OFFSET + 0x64)
+# define DELSEL_9_MASK                                             0xfffff
+# define DELSEL_9_SHIFT                                            0
+# define USE_DEFAULT_DELSEL_9_MASK                                 0x100000
+# define USE_DEFAULT_DELSEL_9_SHIFT                                20
+
+#define MTK_DP_TOP_MEM_DELSEL_10              (TOP_OFFSET + 0x68)
+# define DELSEL_10_MASK                                            0xfffff
+# define DELSEL_10_SHIFT                                           0
+# define USE_DEFAULT_DELSEL_10_MASK                                0x100000
+# define USE_DEFAULT_DELSEL_10_SHIFT                               20
+
+#define MTK_DP_TOP_MEM_DELSEL_11              (TOP_OFFSET + 0x6C)
+# define DELSEL_11_MASK                                            0xfffff
+# define DELSEL_11_SHIFT                                           0
+# define USE_DEFAULT_DELSEL_11_MASK                                0x100000
+# define USE_DEFAULT_DELSEL_11_SHIFT                               20
+
+#define MTK_DP_TOP_MEM_DELSEL_12              (TOP_OFFSET + 0x70)
+# define DELSEL_12_MASK                                            0xfffff
+# define DELSEL_12_SHIFT                                           0
+# define USE_DEFAULT_DELSEL_12_MASK                                0x100000
+# define USE_DEFAULT_DELSEL_12_SHIFT                               20
+
+#define MTK_DP_TOP_PWR_ACK              (TOP_OFFSET + 0x80)
+# define RGS_DP_TX_PWR_ACK_MASK                                    0x1
+# define RGS_DP_TX_PWR_ACK_SHIFT                                   0
+# define RGS_DP_TX_PWR_ACK_2ND_MASK                                0x2
+# define RGS_DP_TX_PWR_ACK_2ND_SHIFT                               1
+
+#define MTK_DP_SECUREREG0              (SEC_OFFSET + 0x00)
+# define HDCP22_KS_XOR_LC128_KEY_0_MASK                            0xffffffffL
+# define HDCP22_KS_XOR_LC128_KEY_0_SHIFT                           0
+
+#define MTK_DP_SECUREREG1              (SEC_OFFSET + 0x04)
+# define HDCP22_KS_XOR_LC128_KEY_1_MASK                            0xffffffffL
+# define HDCP22_KS_XOR_LC128_KEY_1_SHIFT                           0
+
+#define MTK_DP_SECUREREG2              (SEC_OFFSET + 0x08)
+# define HDCP22_KS_XOR_LC128_KEY_2_MASK                            0xffffffffL
+# define HDCP22_KS_XOR_LC128_KEY_2_SHIFT                           0
+
+#define MTK_DP_SECUREREG3              (SEC_OFFSET + 0x0c)
+# define HDCP22_KS_XOR_LC128_KEY_3_MASK                            0xffffffffL
+# define HDCP22_KS_XOR_LC128_KEY_3_SHIFT                           0
+
+#define MTK_DP_SECUREREG4              (SEC_OFFSET + 0x10)
+# define HDCP22_RIV_0_MASK                                         0xffffffffL
+# define HDCP22_RIV_0_SHIFT                                        0
+
+#define MTK_DP_SECUREREG5              (SEC_OFFSET + 0x14)
+# define HDCP22_RIV_1_MASK                                         0xffffffffL
+# define HDCP22_RIV_1_SHIFT                                        0
+
+#define MTK_DP_SECUREREG6              (SEC_OFFSET + 0x18)
+# define HDCP13_LN_SEED_MASK                                       0xff
+# define HDCP13_LN_SEED_SHIFT                                      0
+
+#define MTK_DP_SECUREREG7              (SEC_OFFSET + 0x1C)
+# define HDCP13_LN_CODE_0_MASK                                     0xffffffffL
+# define HDCP13_LN_CODE_0_SHIFT                                    0
+
+#define MTK_DP_SECUREREG8              (SEC_OFFSET + 0x20)
+# define HDCP13_LN_CODE_1_MASK                                     0xffffff
+# define HDCP13_LN_CODE_1_SHIFT                                    0
+
+#define MTK_DP_SECUREREG9              (SEC_OFFSET + 0x24)
+# define HDCP13_AN_CODE_0_MASK                                     0xffffffffL
+# define HDCP13_AN_CODE_0_SHIFT                                    0
+
+#define MTK_DP_SECUREREG10              (SEC_OFFSET + 0x28)
+# define HDCP13_AN_CODE_1_MASK                                     0xffffffffL
+# define HDCP13_AN_CODE_1_SHIFT                                    0
+
+#define MTK_DP_SECUREREG11              (SEC_OFFSET + 0x2C)
+# define DP_TX_TRANSMITTER_4P_RESET_SW_SECURE_MASK                 0x1
+# define DP_TX_TRANSMITTER_4P_RESET_SW_SECURE_SHIFT                0
+# define HDCP22_RST_SW_SECURE_MASK                                 0x2
+# define HDCP22_RST_SW_SECURE_SHIFT                                1
+# define HDCP13_RST_SW_SECURE_MASK                                 0x4
+# define HDCP13_RST_SW_SECURE_SHIFT                                2
+# define VIDEO_MUTE_SW_SECURE_MASK                                 0x8
+# define VIDEO_MUTE_SW_SECURE_SHIFT                                3
+# define VIDEO_MUTE_SEL_SECURE_MASK                                0x10
+# define VIDEO_MUTE_SEL_SECURE_SHIFT                               4
+# define HDCP_FRAME_EN_SECURE_MASK                                 0x20
+# define HDCP_FRAME_EN_SECURE_SHIFT                                5
+# define HDCP_FRAME_EN_SEL_SECURE_MASK                             0x40
+# define HDCP_FRAME_EN_SEL_SECURE_SHIFT                            6
+# define VSC_SEL_SECURE_MASK                                       0x80
+# define VSC_SEL_SECURE_SHIFT                                      7
+# define VSC_DATA_TOGGLE_VESA_SECURE_MASK                          0x100
+# define VSC_DATA_TOGGLE_VESA_SECURE_SHIFT                         8
+# define VSC_DATA_RDY_VESA_SECURE_MASK                             0x200
+# define VSC_DATA_RDY_VESA_SECURE_SHIFT                            9
+# define VSC_DATA_TOGGLE_CEA_SECURE_MASK                           0x400
+# define VSC_DATA_TOGGLE_CEA_SECURE_SHIFT                          10
+# define VSC_DATA_RDY_CEA_SECURE_MASK                              0x800
+# define VSC_DATA_RDY_CEA_SECURE_SHIFT                             11
+
+#define MTK_DP_SECUREREG12              (SEC_OFFSET + 0x30)
+# define VSC_DATA_BYTE7_CEA_SECURE_MASK                            0xff000000L
+# define VSC_DATA_BYTE7_CEA_SECURE_SHIFT                           24
+# define VSC_DATA_BYTE6_CEA_SECURE_MASK                            0xff0000
+# define VSC_DATA_BYTE6_CEA_SECURE_SHIFT                           16
+# define VSC_DATA_BYTE5_CEA_SECURE_MASK                            0xff00
+# define VSC_DATA_BYTE5_CEA_SECURE_SHIFT                           8
+# define VSC_DATA_BYTE4_CEA_SECURE_MASK                            0xff
+# define VSC_DATA_BYTE4_CEA_SECURE_SHIFT                           0
+
+#define MTK_DP_SECUREREG13              (SEC_OFFSET + 0x34)
+# define VSC_DATA_BYTE3_CEA_SECURE_MASK                            0xff000000L
+# define VSC_DATA_BYTE3_CEA_SECURE_SHIFT                           24
+# define VSC_DATA_BYTE2_CEA_SECURE_MASK                            0xff0000
+# define VSC_DATA_BYTE2_CEA_SECURE_SHIFT                           16
+# define VSC_DATA_BYTE1_CEA_SECURE_MASK                            0xff00
+# define VSC_DATA_BYTE1_CEA_SECURE_SHIFT                           8
+# define VSC_DATA_BYTE0_CEA_SECURE_MASK                            0xff
+# define VSC_DATA_BYTE0_CEA_SECURE_SHIFT                           0
+
+#define MTK_DP_SECUREREG14              (SEC_OFFSET + 0x38)
+# define VSC_DATA_BYTE7_VESA_SECURE_MASK                           0xff000000L
+# define VSC_DATA_BYTE7_VESA_SECURE_SHIFT                          24
+# define VSC_DATA_BYTE6_VESA_SECURE_MASK                           0xff0000
+# define VSC_DATA_BYTE6_VESA_SECURE_SHIFT                          16
+# define VSC_DATA_BYTE5_VESA_SECURE_MASK                           0xff00
+# define VSC_DATA_BYTE5_VESA_SECURE_SHIFT                          8
+# define VSC_DATA_BYTE4_VESA_SECURE_MASK                           0xff
+# define VSC_DATA_BYTE4_VESA_SECURE_SHIFT                          0
+
+#define MTK_DP_SECUREREG15              (SEC_OFFSET + 0x3C)
+# define VSC_DATA_BYTE3_VESA_SECURE_MASK                           0xff000000L
+# define VSC_DATA_BYTE3_VESA_SECURE_SHIFT                          24
+# define VSC_DATA_BYTE2_VESA_SECURE_MASK                           0xff0000
+# define VSC_DATA_BYTE2_VESA_SECURE_SHIFT                          16
+# define VSC_DATA_BYTE1_VESA_SECURE_MASK                           0xff00
+# define VSC_DATA_BYTE1_VESA_SECURE_SHIFT                          8
+# define VSC_DATA_BYTE0_VESA_SECURE_MASK                           0xff
+# define VSC_DATA_BYTE0_VESA_SECURE_SHIFT                          0
+
+#define MTK_DP_SECURESTATUS_0              (SEC_OFFSET + 0x80)
+# define RGS_DP_TX_HDCP13_HDCP_AN_0_MASK                           0xffffffffL
+# define RGS_DP_TX_HDCP13_HDCP_AN_0_SHIFT                          0
+
+#define MTK_DP_SECURESTATUS_1              (SEC_OFFSET + 0x84)
+# define RGS_DP_TX_HDCP13_HDCP_AN_1_MASK                           0xffffffffL
+# define RGS_DP_TX_HDCP13_HDCP_AN_1_SHIFT                          0
+
+#define MTK_DP_SECURESTATUS_2              (SEC_OFFSET + 0x88)
+# define RGS_DP_TX_HDCP13_HDCP_R0_MASK                             0xffff
+# define RGS_DP_TX_HDCP13_HDCP_R0_SHIFT                            0
+
+#define MTK_DP_SECURESTATUS_3              (SEC_OFFSET + 0x8C)
+# define RGS_DP_TX_HDCP13_HDCP_M0_0_MASK                           0xffffffffL
+# define RGS_DP_TX_HDCP13_HDCP_M0_0_SHIFT                          0
+
+#define MTK_DP_SECURESTATUS_4              (SEC_OFFSET + 0x90)
+# define RGS_DP_TX_HDCP13_HDCP_M0_1_MASK                           0xffffffffL
+# define RGS_DP_TX_HDCP13_HDCP_M0_1_SHIFT                          0
+
+#define MTK_DP_SECUREACC_FAIL              (SEC_OFFSET + 0xf0)
+# define NO_AUTH_READ_VALUE_MASK                                   0xffffffffL
+# define NO_AUTH_READ_VALUE_SHIFT                                  0
+
+#define DP_PHY_DIG_PLL_CTL_1					0x1014
+# define SKIP_SPLL_ON						BIT(0)
+# define BIAS_LPF_EN						BIT(1)
+# define SPLL_SSC_EN						BIT(2)
+# define TPLL_SSC_EN						BIT(3)
+
+#define DP_PHY_DIG_BIT_RATE					0x103C
+# define BIT_RATE_RBR						0
+# define BIT_RATE_HBR						1
+# define BIT_RATE_HBR2						2
+# define BIT_RATE_HBR3						3
+
+#define DP_PHY_DIG_SW_RST					0x1038
+# define DP_GLB_SW_RST_PHYD					BIT(0)
+# define DP_GLB_SW_RST_TFIFO					BIT(1)
+# define DP_GLB_SW_RST_XTAL					BIT(2)
+# define DP_GLB_SW_RST_LINK					BIT(3)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_3				0x1138
+#define MTK_DP_LANE1_DRIVING_PARAM_3				0x1238
+#define MTK_DP_LANE2_DRIVING_PARAM_3				0x1338
+#define MTK_DP_LANE3_DRIVING_PARAM_3				0x1438
+# define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT			0x10
+# define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT			(0x14 << 8)
+# define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT			(0x18 << 16)
+# define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT			(0x20 << 24)
+# define DRIVING_PARAM_3_DEFAULT				(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
+								 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
+								 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
+								 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_4				0x113C
+#define MTK_DP_LANE1_DRIVING_PARAM_4				0x123C
+#define MTK_DP_LANE2_DRIVING_PARAM_4				0x133C
+#define MTK_DP_LANE3_DRIVING_PARAM_4				0x143C
+# define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT			0x18
+# define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT			(0x1e << 8)
+# define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT			(0x24 << 16)
+# define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT			(0x20 << 24)
+# define DRIVING_PARAM_4_DEFAULT				(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
+								 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
+								 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
+								 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_5				0x1140
+#define MTK_DP_LANE1_DRIVING_PARAM_5				0x1240
+#define MTK_DP_LANE2_DRIVING_PARAM_5				0x1340
+#define MTK_DP_LANE3_DRIVING_PARAM_5				0x1440
+# define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT			0x28
+# define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT			(0x30 << 8)
+# define DRIVING_PARAM_5_DEFAULT				(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
+								 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_6				0x1144
+#define MTK_DP_LANE1_DRIVING_PARAM_6				0x1244
+#define MTK_DP_LANE2_DRIVING_PARAM_6				0x1344
+#define MTK_DP_LANE3_DRIVING_PARAM_6				0x1444
+# define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT			0x00
+# define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT			(0x04 << 8)
+# define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT			(0x08 << 16)
+# define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT			(0x10 << 24)
+# define DRIVING_PARAM_6_DEFAULT				(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
+								 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
+								 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
+								 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_7				0x1148
+#define MTK_DP_LANE1_DRIVING_PARAM_7				0x1248
+#define MTK_DP_LANE2_DRIVING_PARAM_7				0x1348
+#define MTK_DP_LANE3_DRIVING_PARAM_7				0x1448
+# define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT			0x00
+# define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT			(0x06 << 8)
+# define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT			(0x0c << 16)
+# define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT			(0x00 << 24)
+# define DRIVING_PARAM_7_DEFAULT				(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
+								 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
+								 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
+								 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_8				0x114C
+#define MTK_DP_LANE1_DRIVING_PARAM_8				0x214C
+#define MTK_DP_LANE2_DRIVING_PARAM_8				0x314C
+#define MTK_DP_LANE3_DRIVING_PARAM_8				0x414C
+# define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT			0x08
+# define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT			(0x00 << 8)
+# define DRIVING_PARAM_8_DEFAULT				(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
+								 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
+
+#endif /*_MTK_DP_REG_H_*/
-- 
2.32.0

