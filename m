Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A621FA95EE1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D232D10E513;
	Tue, 22 Apr 2025 07:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="R75l9bdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB8B310E50D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=WTbQO
 nPRTy92hnyWMeQ8oqIuOuvUosmbjr5I5n+b7Ao=; b=R75l9bdvKHosuYC/BMHvu
 wtuSlaLRPQao25K4lbj4zYk5MFsSkYrqOU8lvmIWFrToSgJGMmWppdgLK7PfV165
 W6/lkkZRYh5kBnfMmxgD9wDzYpFQeolRbl9VhpBEhZzvKEryR97NtFpkzwPnEuXR
 SH5AO8eO/llh+a5nZMRY1I=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wCHACaZPwdowMxzBg--.7474S9; 
 Tue, 22 Apr 2025 15:05:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 7/7] drm/rockchip: inno-hdmi: Convert to drm bridge
Date: Tue, 22 Apr 2025 15:04:46 +0800
Message-ID: <20250422070455.432666-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHACaZPwdowMxzBg--.7474S9
X-Coremail-Antispam: 1Uf129KBjvAXoWDXr4UJr17ArykJFWrAFy3twb_yoW7tF1kJo
 Z7JFnxXw18Zr1xZr4DG3WI9rsrZ3Wxtrn3Xw1rAFWkZa9rJw4qga47KryFvF9FqFyrKr98
 Cw1kKFn3Gr93AF4Dn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUILZ2UUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA43XmgHPY1a4AAAsS
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

From: Andy Yan <andy.yan@rock-chips.com>

Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v4:
- Do not store colorimetry within inno_hdmi struct

Changes in v3:
- First included in v3

 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 924 ++++++++++--------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
 drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
 include/drm/bridge/inno_hdmi.h                |  33 +
 8 files changed, 735 insertions(+), 769 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index d20f1646dac27..39ba511181d9b 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -98,6 +98,13 @@ config DRM_I2C_NXP_TDA998X
        help
          Support for NXP Semiconductors TDA998X HDMI encoders.
 
+config DRM_INNO_HDMI
+	tristate
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 245e8a27e3fc5..efe049afa4d27 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
 tda998x-y := tda998x_drv.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
 
+obj-$(CONFIG_DRM_INNO_HDMI) += inno-hdmi.o
 obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
similarity index 52%
rename from drivers/gpu/drm/rockchip/inno_hdmi.c
rename to drivers/gpu/drm/bridge/inno-hdmi.c
index db4b4038e51d5..929a27930709c 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -3,12 +3,14 @@
  * Copyright (C) Rockchip Electronics Co., Ltd.
  *    Zheng Yang <zhengyang@rock-chips.com>
  *    Yakir Yang <ykk@rock-chips.com>
+ *    Andy Yan <andyshrk@163.com>
  */
 
 #include <linux/irq.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/hdmi.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
@@ -17,45 +19,370 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <drm/bridge/inno_hdmi.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-#include "rockchip_drm_drv.h"
+#define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
 
-#include "inno_hdmi.h"
+#define DDC_SEGMENT_ADDR		0x30
+
+#define HDMI_SCL_RATE			(100 * 1000)
+#define DDC_BUS_FREQ_L			0x4b
+#define DDC_BUS_FREQ_H			0x4c
+
+#define HDMI_SYS_CTRL			0x00
+#define m_RST_ANALOG			BIT(6)
+#define v_RST_ANALOG			(0 << 6)
+#define v_NOT_RST_ANALOG		BIT(6)
+#define m_RST_DIGITAL			BIT(5)
+#define v_RST_DIGITAL			(0 << 5)
+#define v_NOT_RST_DIGITAL		BIT(5)
+#define m_REG_CLK_INV			BIT(4)
+#define v_REG_CLK_NOT_INV		(0 << 4)
+#define v_REG_CLK_INV			BIT(4)
+#define m_VCLK_INV			BIT(3)
+#define v_VCLK_NOT_INV			(0 << 3)
+#define v_VCLK_INV			BIT(3)
+#define m_REG_CLK_SOURCE		BIT(2)
+#define v_REG_CLK_SOURCE_TMDS		(0 << 2)
+#define v_REG_CLK_SOURCE_SYS		BIT(2)
+#define m_POWER				BIT(1)
+#define v_PWR_ON			(0 << 1)
+#define v_PWR_OFF			BIT(1)
+#define m_INT_POL			(1 << 0)
+#define v_INT_POL_HIGH			1
+#define v_INT_POL_LOW			0
+
+#define HDMI_VIDEO_CONTRL1		0x01
+#define m_VIDEO_INPUT_FORMAT		(7 << 1)
+#define m_DE_SOURCE			(1 << 0)
+#define v_VIDEO_INPUT_FORMAT(n)		((n) << 1)
+#define v_DE_EXTERNAL			1
+#define v_DE_INTERNAL			0
+enum {
+	VIDEO_INPUT_SDR_RGB444 = 0,
+	VIDEO_INPUT_DDR_RGB444 = 5,
+	VIDEO_INPUT_DDR_YCBCR422 = 6
+};
 
-#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
+#define HDMI_VIDEO_CONTRL2		0x02
+#define m_VIDEO_OUTPUT_COLOR		(3 << 6)
+#define m_VIDEO_INPUT_BITS		(3 << 4)
+#define m_VIDEO_INPUT_CSP		(1 << 0)
+#define v_VIDEO_OUTPUT_COLOR(n)		(((n) & 0x3) << 6)
+#define v_VIDEO_INPUT_BITS(n)		((n) << 4)
+#define v_VIDEO_INPUT_CSP(n)		((n) << 0)
+enum {
+	VIDEO_INPUT_12BITS = 0,
+	VIDEO_INPUT_10BITS = 1,
+	VIDEO_INPUT_REVERT = 2,
+	VIDEO_INPUT_8BITS = 3,
+};
 
-#define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
+#define HDMI_VIDEO_CONTRL		0x03
+#define m_VIDEO_AUTO_CSC		BIT(7)
+#define v_VIDEO_AUTO_CSC(n)		((n) << 7)
+#define m_VIDEO_C0_C2_SWAP		(1 << 0)
+#define v_VIDEO_C0_C2_SWAP(n)		((n) << 0)
+enum {
+	C0_C2_CHANGE_ENABLE = 0,
+	C0_C2_CHANGE_DISABLE = 1,
+	AUTO_CSC_DISABLE = 0,
+	AUTO_CSC_ENABLE = 1,
+};
+
+#define HDMI_VIDEO_CONTRL3		0x04
+#define m_COLOR_DEPTH_NOT_INDICATED	BIT(4)
+#define m_SOF				BIT(3)
+#define m_COLOR_RANGE			BIT(2)
+#define m_CSC				(1 << 0)
+#define v_COLOR_DEPTH_NOT_INDICATED(n)	((n) << 4)
+#define v_SOF_ENABLE			(0 << 3)
+#define v_SOF_DISABLE			BIT(3)
+#define v_COLOR_RANGE_FULL		BIT(2)
+#define v_COLOR_RANGE_LIMITED		(0 << 2)
+#define v_CSC_ENABLE			1
+#define v_CSC_DISABLE			0
+
+#define HDMI_AV_MUTE			0x05
+#define m_AVMUTE_CLEAR			BIT(7)
+#define m_AVMUTE_ENABLE			BIT(6)
+#define m_AUDIO_MUTE			BIT(1)
+#define m_VIDEO_BLACK			(1 << 0)
+#define v_AVMUTE_CLEAR(n)		((n) << 7)
+#define v_AVMUTE_ENABLE(n)		((n) << 6)
+#define v_AUDIO_MUTE(n)			((n) << 1)
+#define v_VIDEO_MUTE(n)			((n) << 0)
+
+#define HDMI_VIDEO_TIMING_CTL		0x08
+#define v_HSYNC_POLARITY(n)		((n) << 3)
+#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_INETLACE(n)			((n) << 1)
+#define v_EXTERANL_VIDEO(n)		((n) << 0)
+
+#define HDMI_VIDEO_EXT_HTOTAL_L		0x09
+#define HDMI_VIDEO_EXT_HTOTAL_H		0x0a
+#define HDMI_VIDEO_EXT_HBLANK_L		0x0b
+#define HDMI_VIDEO_EXT_HBLANK_H		0x0c
+#define HDMI_VIDEO_EXT_HDELAY_L		0x0d
+#define HDMI_VIDEO_EXT_HDELAY_H		0x0e
+#define HDMI_VIDEO_EXT_HDURATION_L	0x0f
+#define HDMI_VIDEO_EXT_HDURATION_H	0x10
+#define HDMI_VIDEO_EXT_VTOTAL_L		0x11
+#define HDMI_VIDEO_EXT_VTOTAL_H		0x12
+#define HDMI_VIDEO_EXT_VBLANK		0x13
+#define HDMI_VIDEO_EXT_VDELAY		0x14
+#define HDMI_VIDEO_EXT_VDURATION	0x15
+
+#define HDMI_VIDEO_CSC_COEF		0x18
+
+#define HDMI_AUDIO_CTRL1		0x35
+enum {
+	CTS_SOURCE_INTERNAL = 0,
+	CTS_SOURCE_EXTERNAL = 1,
+};
+
+#define v_CTS_SOURCE(n)			((n) << 7)
+
+enum {
+	DOWNSAMPLE_DISABLE = 0,
+	DOWNSAMPLE_1_2 = 1,
+	DOWNSAMPLE_1_4 = 2,
+};
+
+#define v_DOWN_SAMPLE(n)		((n) << 5)
+
+enum {
+	AUDIO_SOURCE_IIS = 0,
+	AUDIO_SOURCE_SPDIF = 1,
+};
+
+#define v_AUDIO_SOURCE(n)		((n) << 3)
+
+#define v_MCLK_ENABLE(n)		((n) << 2)
+
+enum {
+	MCLK_128FS = 0,
+	MCLK_256FS = 1,
+	MCLK_384FS = 2,
+	MCLK_512FS = 3,
+};
+
+#define v_MCLK_RATIO(n)			(n)
+
+#define AUDIO_SAMPLE_RATE		0x37
+
+enum {
+	AUDIO_32K = 0x3,
+	AUDIO_441K = 0x0,
+	AUDIO_48K = 0x2,
+	AUDIO_882K = 0x8,
+	AUDIO_96K = 0xa,
+	AUDIO_1764K = 0xc,
+	AUDIO_192K = 0xe,
+};
 
-#define RK3036_GRF_SOC_CON2	0x148
-#define RK3036_HDMI_PHSYNC	BIT(4)
-#define RK3036_HDMI_PVSYNC	BIT(5)
+#define AUDIO_I2S_MODE			0x38
 
-enum inno_hdmi_dev_type {
-	RK3036_HDMI,
-	RK3128_HDMI,
+enum {
+	I2S_CHANNEL_1_2 = 1,
+	I2S_CHANNEL_3_4 = 3,
+	I2S_CHANNEL_5_6 = 7,
+	I2S_CHANNEL_7_8 = 0xf
 };
 
-struct inno_hdmi_phy_config {
-	unsigned long pixelclock;
-	u8 pre_emphasis;
-	u8 voltage_level_control;
+#define v_I2S_CHANNEL(n)		((n) << 2)
+
+enum {
+	I2S_STANDARD = 0,
+	I2S_LEFT_JUSTIFIED = 1,
+	I2S_RIGHT_JUSTIFIED = 2,
+};
+
+#define v_I2S_MODE(n)			(n)
+
+#define AUDIO_I2S_MAP			0x39
+#define AUDIO_I2S_SWAPS_SPDIF		0x3a
+#define v_SPIDF_FREQ(n)			(n)
+
+#define N_32K				0x1000
+#define N_441K				0x1880
+#define N_882K				0x3100
+#define N_1764K				0x6200
+#define N_48K				0x1800
+#define N_96K				0x3000
+#define N_192K				0x6000
+
+#define HDMI_AUDIO_CHANNEL_STATUS	0x3e
+#define m_AUDIO_STATUS_NLPCM		BIT(7)
+#define m_AUDIO_STATUS_USE		BIT(6)
+#define m_AUDIO_STATUS_COPYRIGHT	BIT(5)
+#define m_AUDIO_STATUS_ADDITION		(3 << 2)
+#define m_AUDIO_STATUS_CLK_ACCURACY	(2 << 0)
+#define v_AUDIO_STATUS_NLPCM(n)		(((n) & 1) << 7)
+#define AUDIO_N_H			0x3f
+#define AUDIO_N_M			0x40
+#define AUDIO_N_L			0x41
+
+#define HDMI_AUDIO_CTS_H		0x45
+#define HDMI_AUDIO_CTS_M		0x46
+#define HDMI_AUDIO_CTS_L		0x47
+
+#define HDMI_DDC_CLK_L			0x4b
+#define HDMI_DDC_CLK_H			0x4c
+
+#define HDMI_EDID_SEGMENT_POINTER	0x4d
+#define HDMI_EDID_WORD_ADDR		0x4e
+#define HDMI_EDID_FIFO_OFFSET		0x4f
+#define HDMI_EDID_FIFO_ADDR		0x50
+
+#define HDMI_PACKET_SEND_MANUAL		0x9c
+#define HDMI_PACKET_SEND_AUTO		0x9d
+#define m_PACKET_GCP_EN			BIT(7)
+#define m_PACKET_MSI_EN			BIT(6)
+#define m_PACKET_SDI_EN			BIT(5)
+#define m_PACKET_VSI_EN			BIT(4)
+#define v_PACKET_GCP_EN(n)		(((n) & 1) << 7)
+#define v_PACKET_MSI_EN(n)		(((n) & 1) << 6)
+#define v_PACKET_SDI_EN(n)		(((n) & 1) << 5)
+#define v_PACKET_VSI_EN(n)		(((n) & 1) << 4)
+
+#define HDMI_CONTROL_PACKET_BUF_INDEX	0x9f
+
+enum {
+	INFOFRAME_VSI = 0x05,
+	INFOFRAME_AVI = 0x06,
+	INFOFRAME_AAI = 0x08,
 };
 
-struct inno_hdmi_variant {
-	enum inno_hdmi_dev_type dev_type;
-	struct inno_hdmi_phy_config *phy_configs;
-	struct inno_hdmi_phy_config *default_phy_config;
+#define HDMI_CONTROL_PACKET_ADDR	0xa0
+#define HDMI_MAXIMUM_INFO_FRAME_SIZE	0x11
+
+enum {
+	AVI_COLOR_MODE_RGB = 0,
+	AVI_COLOR_MODE_YCBCR422 = 1,
+	AVI_COLOR_MODE_YCBCR444 = 2,
+	AVI_COLORIMETRY_NO_DATA = 0,
+
+	AVI_COLORIMETRY_SMPTE_170M = 1,
+	AVI_COLORIMETRY_ITU709 = 2,
+	AVI_COLORIMETRY_EXTENDED = 3,
+
+	AVI_CODED_FRAME_ASPECT_NO_DATA = 0,
+	AVI_CODED_FRAME_ASPECT_4_3 = 1,
+	AVI_CODED_FRAME_ASPECT_16_9 = 2,
+
+	ACTIVE_ASPECT_RATE_SAME_AS_CODED_FRAME = 0x08,
+	ACTIVE_ASPECT_RATE_4_3 = 0x09,
+	ACTIVE_ASPECT_RATE_16_9 = 0x0A,
+	ACTIVE_ASPECT_RATE_14_9 = 0x0B,
 };
 
+#define HDMI_HDCP_CTRL			0x52
+#define m_HDMI_DVI			BIT(1)
+#define v_HDMI_DVI(n)			((n) << 1)
+
+#define HDMI_INTERRUPT_MASK1		0xc0
+#define HDMI_INTERRUPT_STATUS1		0xc1
+#define	m_INT_ACTIVE_VSYNC		BIT(5)
+#define m_INT_EDID_READY		BIT(2)
+
+#define HDMI_INTERRUPT_MASK2		0xc2
+#define HDMI_INTERRUPT_STATUS2		0xc3
+#define m_INT_HDCP_ERR			BIT(7)
+#define m_INT_BKSV_FLAG			BIT(6)
+#define m_INT_HDCP_OK			BIT(4)
+
+#define HDMI_STATUS			0xc8
+#define m_HOTPLUG			BIT(7)
+#define m_MASK_INT_HOTPLUG		BIT(5)
+#define m_INT_HOTPLUG			BIT(1)
+#define v_MASK_INT_HOTPLUG(n)		(((n) & 0x1) << 5)
+
+#define HDMI_COLORBAR                   0xc9
+
+#define HDMI_PHY_SYNC			0xce
+#define HDMI_PHY_SYS_CTL		0xe0
+#define m_TMDS_CLK_SOURCE		BIT(5)
+#define v_TMDS_FROM_PLL			(0 << 5)
+#define v_TMDS_FROM_GEN			BIT(5)
+#define m_PHASE_CLK			BIT(4)
+#define v_DEFAULT_PHASE			(0 << 4)
+#define v_SYNC_PHASE			BIT(4)
+#define m_TMDS_CURRENT_PWR		BIT(3)
+#define v_TURN_ON_CURRENT		(0 << 3)
+#define v_CAT_OFF_CURRENT		BIT(3)
+#define m_BANDGAP_PWR			BIT(2)
+#define v_BANDGAP_PWR_UP		(0 << 2)
+#define v_BANDGAP_PWR_DOWN		BIT(2)
+#define m_PLL_PWR			BIT(1)
+#define v_PLL_PWR_UP			(0 << 1)
+#define v_PLL_PWR_DOWN			BIT(1)
+#define m_TMDS_CHG_PWR			(1 << 0)
+#define v_TMDS_CHG_PWR_UP		(0 << 0)
+#define v_TMDS_CHG_PWR_DOWN		(1 << 0)
+
+#define HDMI_PHY_CHG_PWR		0xe1
+#define v_CLK_CHG_PWR(n)		(((n) & 1) << 3)
+#define v_DATA_CHG_PWR(n)		(((n) & 7) << 0)
+
+#define HDMI_PHY_DRIVER			0xe2
+#define v_CLK_MAIN_DRIVER(n)		((n) << 4)
+#define v_DATA_MAIN_DRIVER(n)		((n) << 0)
+
+#define HDMI_PHY_PRE_EMPHASIS		0xe3
+#define v_PRE_EMPHASIS(n)		(((n) & 7) << 4)
+#define v_CLK_PRE_DRIVER(n)		(((n) & 3) << 2)
+#define v_DATA_PRE_DRIVER(n)		(((n) & 3) << 0)
+
+#define HDMI_PHY_FEEDBACK_DIV_RATIO_LOW		0xe7
+#define v_FEEDBACK_DIV_LOW(n)			((n) & 0xff)
+#define HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH	0xe8
+#define v_FEEDBACK_DIV_HIGH(n)			((n) & 1)
+
+#define HDMI_PHY_PRE_DIV_RATIO		0xed
+#define v_PRE_DIV_RATIO(n)		((n) & 0x1f)
+
+#define HDMI_CEC_CTRL			0xd0
+#define m_ADJUST_FOR_HISENSE		BIT(6)
+#define m_REJECT_RX_BROADCAST		BIT(5)
+#define m_BUSFREETIME_ENABLE		BIT(2)
+#define m_REJECT_RX			BIT(1)
+#define m_START_TX			(1 << 0)
+
+#define HDMI_CEC_DATA			0xd1
+#define HDMI_CEC_TX_OFFSET		0xd2
+#define HDMI_CEC_RX_OFFSET		0xd3
+#define HDMI_CEC_CLK_H			0xd4
+#define HDMI_CEC_CLK_L			0xd5
+#define HDMI_CEC_TX_LENGTH		0xd6
+#define HDMI_CEC_RX_LENGTH		0xd7
+#define HDMI_CEC_TX_INT_MASK		0xd8
+#define m_TX_DONE			BIT(3)
+#define m_TX_NOACK			BIT(2)
+#define m_TX_BROADCAST_REJ		BIT(1)
+#define m_TX_BUSNOTFREE			(1 << 0)
+
+#define HDMI_CEC_RX_INT_MASK		0xd9
+#define m_RX_LA_ERR			BIT(4)
+#define m_RX_GLITCH			BIT(3)
+#define m_RX_DONE			(1 << 0)
+
+#define HDMI_CEC_TX_INT			0xda
+#define HDMI_CEC_RX_INT			0xdb
+#define HDMI_CEC_BUSFREETIME_L		0xdc
+#define HDMI_CEC_BUSFREETIME_H		0xdd
+#define HDMI_CEC_LOGICADDR		0xde
+
 struct inno_hdmi_i2c {
 	struct i2c_adapter adap;
 
@@ -68,41 +395,17 @@ struct inno_hdmi_i2c {
 
 struct inno_hdmi {
 	struct device *dev;
-
+	struct drm_bridge bridge;
 	struct clk *pclk;
 	struct clk *refclk;
 	void __iomem *regs;
 	struct regmap *grf;
 
-	struct drm_connector	connector;
-	struct rockchip_encoder	encoder;
-
 	struct inno_hdmi_i2c *i2c;
 	struct i2c_adapter *ddc;
-
-	const struct inno_hdmi_variant *variant;
+	const struct inno_hdmi_plat_data *plat_data;
 };
 
-struct inno_hdmi_connector_state {
-	struct drm_connector_state	base;
-	unsigned int			colorimetry;
-};
-
-static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
-{
-	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-	return container_of(rkencoder, struct inno_hdmi, encoder);
-}
-
-static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
-{
-	return container_of(connector, struct inno_hdmi, connector);
-}
-
-#define to_inno_hdmi_conn_state(conn_state) \
-	container_of_const(conn_state, struct inno_hdmi_connector_state, base)
-
 enum {
 	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
 	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
@@ -145,23 +448,15 @@ static const char coeff_csc[][24] = {
 	},
 };
 
-static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] = {
-	{  74250000, 0x3f, 0xbb },
-	{ 165000000, 0x6f, 0xbb },
-	{      ~0UL, 0x00, 0x00 }
-};
-
-static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] = {
-	{  74250000, 0x3f, 0xaa },
-	{ 165000000, 0x5f, 0xaa },
-	{      ~0UL, 0x00, 0x00 }
-};
+static struct inno_hdmi *bridge_to_inno_hdmi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct inno_hdmi, bridge);
+}
 
 static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
 				     unsigned long pixelclk)
 {
-	const struct inno_hdmi_phy_config *phy_configs =
-						hdmi->variant->phy_configs;
+	const struct inno_hdmi_phy_config *phy_configs = hdmi->plat_data->phy_configs;
 	int i;
 
 	for (i = 0; phy_configs[i].pixelclock != ~0UL; i++) {
@@ -233,12 +528,12 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
 
 	if (ret < 0) {
-		phy_config = hdmi->variant->default_phy_config;
+		phy_config = hdmi->plat_data->default_phy_config;
 		DRM_DEV_ERROR(hdmi->dev,
 			      "Using default phy configuration for TMDS rate %lu",
 			      mpixelclock);
 	} else {
-		phy_config = &hdmi->variant->phy_configs[ret];
+		phy_config = &hdmi->plat_data->phy_configs[ret];
 	}
 
 	inno_hdmi_sys_power(hdmi, false);
@@ -255,32 +550,46 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	inno_hdmi_sys_power(hdmi, true);
 };
 
-static void inno_hdmi_reset(struct inno_hdmi *hdmi)
+static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 {
 	u32 val;
 	u32 msk;
 
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_DIGITAL, v_NOT_RST_DIGITAL);
-	udelay(100);
+	usleep_range(100, 150);
 
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_ANALOG, v_NOT_RST_ANALOG);
-	udelay(100);
+	usleep_range(100, 150);
 
 	msk = m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
 	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
 
 	inno_hdmi_standby(hdmi);
+
+	/*
+	 * When the controller isn't configured to an accurate
+	 * video timing and there is no reference clock available,
+	 * then the TMDS clock source would be switched to PCLK_HDMI,
+	 * so we need to init the TMDS rate to PCLK rate, and
+	 * reconfigure the DDC clock.
+	 */
+	if (hdmi->refclk)
+		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->refclk));
+	else
+		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->pclk));
+
+	/* Unmute hotplug interrupt */
+	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
 }
 
-static int inno_hdmi_disable_frame(struct drm_connector *connector,
-				   enum hdmi_infoframe_type type)
+static int inno_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
+					    enum hdmi_infoframe_type type)
 {
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
+		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
 		return 0;
 	}
 
@@ -289,20 +598,19 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 	return 0;
 }
 
-static int inno_hdmi_upload_frame(struct drm_connector *connector,
-				  enum hdmi_infoframe_type type,
-				  const u8 *buffer, size_t len)
+static int inno_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
 {
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 	ssize_t i;
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
+		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
 		return 0;
 	}
 
-	inno_hdmi_disable_frame(connector, type);
+	inno_hdmi_bridge_clear_infoframe(bridge, type);
 
 	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);
@@ -310,23 +618,26 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
-static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
-	.clear_infoframe	= inno_hdmi_disable_frame,
-	.write_infoframe	= inno_hdmi_upload_frame,
-};
-
-static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
+static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi,
+				      struct drm_connector *connector,
+				      struct drm_display_mode *mode)
 {
-	struct drm_connector *connector = &hdmi->connector;
 	struct drm_connector_state *conn_state = connector->state;
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
 	int c0_c2_change = 0;
 	int csc_enable = 0;
 	int csc_mode = 0;
 	int auto_csc = 0;
 	int value;
 	int i;
+	int colorimetry;
+	u8 vic = drm_match_cea_mode(mode);
+
+	if (vic == 6 || vic == 7 || vic == 21 || vic == 22 ||
+	    vic == 2 || vic == 3 || vic == 17 || vic == 18)
+		colorimetry = HDMI_COLORIMETRY_ITU_601;
+	else
+		colorimetry = HDMI_COLORIMETRY_ITU_709;
+
 
 	/* Input video mode is SDR RGB24bit, data enable signal from external */
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
@@ -356,7 +667,7 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 			return 0;
 		}
 	} else {
-		if (inno_conn_state->colorimetry == HDMI_COLORIMETRY_ITU_601) {
+		if (colorimetry == HDMI_COLORIMETRY_ITU_601) {
 			if (conn_state->hdmi.output_format == HDMI_COLORSPACE_YUV444) {
 				csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
 				auto_csc = AUTO_CSC_DISABLE;
@@ -374,8 +685,7 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 	}
 
 	for (i = 0; i < 24; i++)
-		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
-			    coeff_csc[csc_mode][i]);
+		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i, coeff_csc[csc_mode][i]);
 
 	value = v_SOF_DISABLE | csc_enable | v_COLOR_DEPTH_NOT_INDICATED(1);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
@@ -389,15 +699,11 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 					 struct drm_display_mode *mode)
 {
-	int value, psync;
-
-	if (hdmi->variant->dev_type == RK3036_HDMI) {
-		psync = mode->flags & DRM_MODE_FLAG_PHSYNC ? RK3036_HDMI_PHSYNC : 0;
-		value = HIWORD_UPDATE(psync, RK3036_HDMI_PHSYNC);
-		psync = mode->flags & DRM_MODE_FLAG_PVSYNC ? RK3036_HDMI_PVSYNC : 0;
-		value |= HIWORD_UPDATE(psync, RK3036_HDMI_PVSYNC);
-		regmap_write(hdmi->grf, RK3036_GRF_SOC_CON2, value);
-	}
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
+	u32 value;
+
+	if (plat_ops && plat_ops->enable)
+		plat_ops->enable(hdmi->dev, mode);
 
 	/* Set detail external video timing polarity and interlace mode */
 	value = v_EXTERANL_VIDEO(1);
@@ -446,14 +752,16 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static int inno_hdmi_setup(struct inno_hdmi *hdmi,
-			   struct drm_atomic_state *state)
+static int inno_hdmi_setup(struct inno_hdmi *hdmi, struct drm_atomic_state *state)
 {
-	struct drm_connector *connector = &hdmi->connector;
-	struct drm_display_info *display = &connector->display_info;
+	struct drm_bridge *bridge = &hdmi->bridge;
+	struct drm_connector *connector;
+	struct drm_display_info *info;
 	struct drm_connector_state *new_conn_state;
 	struct drm_crtc_state *new_crtc_state;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+
 	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
 	if (WARN_ON(!new_conn_state))
 		return -EINVAL;
@@ -462,17 +770,18 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	if (WARN_ON(!new_crtc_state))
 		return -EINVAL;
 
+	info = &connector->display_info;
+
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
 		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
 
 	/* Set HDMI Mode */
-	hdmi_writeb(hdmi, HDMI_HDCP_CTRL,
-		    v_HDMI_DVI(display->is_hdmi));
+	hdmi_writeb(hdmi, HDMI_HDCP_CTRL, v_HDMI_DVI(info->is_hdmi));
 
 	inno_hdmi_config_video_timing(hdmi, &new_crtc_state->adjusted_mode);
 
-	inno_hdmi_config_video_csc(hdmi);
+	inno_hdmi_config_video_csc(hdmi, connector, &new_crtc_state->adjusted_mode);
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
@@ -493,9 +802,11 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
-							 const struct drm_display_mode *mode)
+static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+							const struct drm_display_info *info,
+							const struct drm_display_mode *mode)
 {
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 	unsigned long mpixelclk, max_tolerance;
 	long rounded_refclk;
 
@@ -525,189 +836,56 @@ static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
 	return MODE_OK;
 }
 
-static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
-				     struct drm_atomic_state *state)
+static enum drm_connector_status inno_hdmi_bridge_detect(struct drm_bridge *bridge)
 {
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-
-	inno_hdmi_setup(hdmi, state);
-}
-
-static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
-				      struct drm_atomic_state *state)
-{
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-
-	inno_hdmi_standby(hdmi);
-}
-
-static int
-inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_connector_state *conn_state)
-{
-	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	u8 vic = drm_match_cea_mode(mode);
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
-
-	s->output_mode = ROCKCHIP_OUT_MODE_P888;
-	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
-
-	if (vic == 6 || vic == 7 ||
-	    vic == 21 || vic == 22 ||
-	    vic == 2 || vic == 3 ||
-	    vic == 17 || vic == 18)
-		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_601;
-	else
-		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
-
-	return 0;
-}
-
-static const struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
-	.atomic_check	= inno_hdmi_encoder_atomic_check,
-	.atomic_enable	= inno_hdmi_encoder_enable,
-	.atomic_disable	= inno_hdmi_encoder_disable,
-};
-
-static enum drm_connector_status
-inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
 	return (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
 		connector_status_connected : connector_status_disconnected;
 }
 
-static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
+static const struct drm_edid *
+inno_hdmi_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 	const struct drm_edid *drm_edid;
-	int ret = 0;
-
-	if (!hdmi->ddc)
-		return 0;
 
-	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
+	drm_edid = drm_edid_read_ddc(connector, bridge->ddc);
+	if (!drm_edid)
+		dev_dbg(hdmi->dev, "failed to get edid\n");
 
-	return ret;
-}
-
-static enum drm_mode_status
-inno_hdmi_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
-
-	return  inno_hdmi_display_mode_valid(hdmi, mode);
+	return drm_edid;
 }
 
-static void
-inno_hdmi_connector_destroy_state(struct drm_connector *connector,
-				  struct drm_connector_state *state)
+static void inno_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					   struct drm_atomic_state *state)
 {
-	struct inno_hdmi_connector_state *inno_conn_state =
-						to_inno_hdmi_conn_state(state);
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
-	__drm_atomic_helper_connector_destroy_state(&inno_conn_state->base);
-	kfree(inno_conn_state);
-}
-
-static void inno_hdmi_connector_reset(struct drm_connector *connector)
-{
-	struct inno_hdmi_connector_state *inno_conn_state;
-
-	if (connector->state) {
-		inno_hdmi_connector_destroy_state(connector, connector->state);
-		connector->state = NULL;
-	}
-
-	inno_conn_state = kzalloc(sizeof(*inno_conn_state), GFP_KERNEL);
-	if (!inno_conn_state)
-		return;
-
-	__drm_atomic_helper_connector_reset(connector, &inno_conn_state->base);
-	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
-
-	inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
+	inno_hdmi_setup(hdmi, state);
 }
 
-static struct drm_connector_state *
-inno_hdmi_connector_duplicate_state(struct drm_connector *connector)
+static void inno_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					    struct drm_atomic_state *state)
 {
-	struct inno_hdmi_connector_state *inno_conn_state;
-
-	if (WARN_ON(!connector->state))
-		return NULL;
-
-	inno_conn_state = kmemdup(to_inno_hdmi_conn_state(connector->state),
-				  sizeof(*inno_conn_state), GFP_KERNEL);
-
-	if (!inno_conn_state)
-		return NULL;
+	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
-	__drm_atomic_helper_connector_duplicate_state(connector,
-						      &inno_conn_state->base);
-
-	return &inno_conn_state->base;
+	inno_hdmi_standby(hdmi);
 }
 
-static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = inno_hdmi_connector_detect,
-	.reset = inno_hdmi_connector_reset,
-	.atomic_duplicate_state = inno_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = inno_hdmi_connector_destroy_state,
-};
-
-static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
-	.get_modes = inno_hdmi_connector_get_modes,
-	.mode_valid = inno_hdmi_connector_mode_valid,
+static const struct drm_bridge_funcs inno_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_enable = inno_hdmi_bridge_atomic_enable,
+	.atomic_disable = inno_hdmi_bridge_atomic_disable,
+	.detect = inno_hdmi_bridge_detect,
+	.edid_read = inno_hdmi_bridge_edid_read,
+	.hdmi_clear_infoframe = inno_hdmi_bridge_clear_infoframe,
+	.hdmi_write_infoframe = inno_hdmi_bridge_write_infoframe,
+	.mode_valid = inno_hdmi_bridge_mode_valid,
 };
 
-static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
-{
-	struct drm_encoder *encoder = &hdmi->encoder.encoder;
-	struct device *dev = hdmi->dev;
-
-	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-
-	/*
-	 * If we failed to find the CRTC(s) which this encoder is
-	 * supposed to be connected to, it's because the CRTC has
-	 * not been registered yet.  Defer probing, and hope that
-	 * the required CRTC is added later.
-	 */
-	if (encoder->possible_crtcs == 0)
-		return -EPROBE_DEFER;
-
-	drm_encoder_helper_add(encoder, &inno_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-
-	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(&hdmi->connector,
-				 &inno_hdmi_connector_helper_funcs);
-	drmm_connector_hdmi_init(drm, &hdmi->connector,
-				 "Rockchip", "Inno HDMI",
-				 &inno_hdmi_connector_funcs,
-				 &inno_hdmi_hdmi_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA,
-				 hdmi->ddc,
-				 BIT(HDMI_COLORSPACE_RGB),
-				 8);
-
-	drm_connector_attach_encoder(&hdmi->connector, encoder);
-
-	return 0;
-}
-
 static irqreturn_t inno_hdmi_i2c_irq(struct inno_hdmi *hdmi)
 {
 	struct inno_hdmi_i2c *i2c = hdmi->i2c;
@@ -725,6 +903,15 @@ static irqreturn_t inno_hdmi_i2c_irq(struct inno_hdmi *hdmi)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
+{
+	struct inno_hdmi *hdmi = dev_id;
+
+	drm_helper_hpd_irq_event(hdmi->bridge.dev);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t inno_hdmi_hardirq(int irq, void *dev_id)
 {
 	struct inno_hdmi *hdmi = dev_id;
@@ -743,15 +930,6 @@ static irqreturn_t inno_hdmi_hardirq(int irq, void *dev_id)
 	return ret;
 }
 
-static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
-{
-	struct inno_hdmi *hdmi = dev_id;
-
-	drm_helper_hpd_irq_event(hdmi->connector.dev);
-
-	return IRQ_HANDLED;
-}
-
 static int inno_hdmi_i2c_read(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
 {
 	int length = msgs->len;
@@ -775,8 +953,7 @@ static int inno_hdmi_i2c_write(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
 	 * we assume that each word write to this i2c adapter
 	 * should be the offset of EDID word address.
 	 */
-	if ((msgs->len != 1) ||
-	    ((msgs->addr != DDC_ADDR) && (msgs->addr != DDC_SEGMENT_ADDR)))
+	if (msgs->len != 1 || (msgs->addr != DDC_ADDR && msgs->addr != DDC_SEGMENT_ADDR))
 		return -EINVAL;
 
 	reinit_completion(&hdmi->i2c->cmp);
@@ -867,7 +1044,7 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	strscpy(adap->name, "Inno HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
-	ret = i2c_add_adapter(adap);
+	ret = devm_i2c_add_adapter(hdmi->dev, adap);
 	if (ret) {
 		dev_warn(hdmi->dev, "cannot add %s I2C adapter\n", adap->name);
 		devm_kfree(hdmi->dev, i2c);
@@ -876,177 +1053,86 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 
 	hdmi->i2c = i2c;
 
-	DRM_DEV_INFO(hdmi->dev, "registered %s I2C bus driver\n", adap->name);
+	dev_info(hdmi->dev, "registered %s I2C bus driver\n", adap->name);
 
 	return adap;
 }
 
-static int inno_hdmi_bind(struct device *dev, struct device *master,
-				 void *data)
+struct inno_hdmi *inno_hdmi_bind(struct device *dev,
+				 struct drm_encoder *encoder,
+				 const struct inno_hdmi_plat_data *plat_data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = data;
 	struct inno_hdmi *hdmi;
-	const struct inno_hdmi_variant *variant;
 	int irq;
 	int ret;
 
+	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
+		dev_err(dev, "Missing platform PHY ops\n");
+		return ERR_PTR(-ENODEV);
+	}
+
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	hdmi->dev = dev;
-
-	variant = of_device_get_match_data(hdmi->dev);
-	if (!variant)
-		return -EINVAL;
-
-	hdmi->variant = variant;
+	hdmi->plat_data = plat_data;
 
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
-		return PTR_ERR(hdmi->regs);
-
-	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
-	if (IS_ERR(hdmi->pclk))
-		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
-
-	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot enable HDMI pclk: %d\n", ret);
+		return ERR_CAST(hdmi->regs);
 
-	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
-	if (IS_ERR(hdmi->refclk)) {
-		ret = dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
-		goto err_disable_pclk;
+	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
+	if (IS_ERR(hdmi->pclk)) {
+		dev_err(dev, "Unable to get HDMI pclk\n");
+		return ERR_CAST(hdmi->pclk);
 	}
 
-	ret = clk_prepare_enable(hdmi->refclk);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "Cannot enable HDMI refclk: %d\n", ret);
-		goto err_disable_pclk;
+	hdmi->refclk = devm_clk_get_enabled(hdmi->dev, "ref");
+	if (IS_ERR(hdmi->refclk)) {
+		dev_err(dev, "Unable to get HDMI refclk\n");
+		return ERR_CAST(hdmi->refclk);
 	}
 
-	if (hdmi->variant->dev_type == RK3036_HDMI) {
-		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
-		if (IS_ERR(hdmi->grf)) {
-			ret = dev_err_probe(dev, PTR_ERR(hdmi->grf),
-					    "Unable to get rockchip,grf\n");
-			goto err_disable_clk;
-		}
-	}
+	inno_hdmi_init_hw(hdmi);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_disable_clk;
-	}
-
-	inno_hdmi_reset(hdmi);
-
-	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
-	if (IS_ERR(hdmi->ddc)) {
-		ret = PTR_ERR(hdmi->ddc);
-		hdmi->ddc = NULL;
-		goto err_disable_clk;
-	}
-
-	/*
-	 * When the controller isn't configured to an accurate
-	 * video timing and there is no reference clock available,
-	 * then the TMDS clock source would be switched to PCLK_HDMI,
-	 * so we need to init the TMDS rate to PCLK rate, and
-	 * reconfigure the DDC clock.
-	 */
-	if (hdmi->refclk)
-		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->refclk));
-	else
-		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->pclk));
-
-	ret = inno_hdmi_register(drm, hdmi);
-	if (ret)
-		goto err_put_adapter;
-
-	dev_set_drvdata(dev, hdmi);
-
-	/* Unmute hotplug interrupt */
-	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
+	if (irq < 0)
+		return ERR_PTR(ret);
 
 	ret = devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
 					inno_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
-	if (ret < 0)
-		goto err_cleanup_hdmi;
-
-	return 0;
-err_cleanup_hdmi:
-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_put_adapter:
-	i2c_put_adapter(hdmi->ddc);
-err_disable_clk:
-	clk_disable_unprepare(hdmi->refclk);
-err_disable_pclk:
-	clk_disable_unprepare(hdmi->pclk);
-	return ret;
-}
-
-static void inno_hdmi_unbind(struct device *dev, struct device *master,
-			     void *data)
-{
-	struct inno_hdmi *hdmi = dev_get_drvdata(dev);
-
-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-
-	i2c_put_adapter(hdmi->ddc);
-	clk_disable_unprepare(hdmi->refclk);
-	clk_disable_unprepare(hdmi->pclk);
-}
+	if (ret)
+		return ERR_PTR(ret);
 
-static const struct component_ops inno_hdmi_ops = {
-	.bind	= inno_hdmi_bind,
-	.unbind	= inno_hdmi_unbind,
-};
+	hdmi->bridge.driver_private = hdmi;
+	hdmi->bridge.funcs = &inno_hdmi_bridge_funcs;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
+			   DRM_BRIDGE_OP_EDID |
+			   DRM_BRIDGE_OP_HDMI |
+			   DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.vendor = "Inno";
+	hdmi->bridge.product = "Inno HDMI";
+
+	hdmi->bridge.ddc = inno_hdmi_i2c_adapter(hdmi);
+	if (IS_ERR(hdmi->bridge.ddc))
+		return ERR_CAST(hdmi->bridge.ddc);
+
+	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
+	if (ret)
+		return ERR_PTR(ret);
 
-static int inno_hdmi_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &inno_hdmi_ops);
-}
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ERR_PTR(ret);
 
-static void inno_hdmi_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &inno_hdmi_ops);
+	return hdmi;
 }
-
-static const struct inno_hdmi_variant rk3036_inno_hdmi_variant = {
-	.dev_type = RK3036_HDMI,
-	.phy_configs = rk3036_hdmi_phy_configs,
-	.default_phy_config = &rk3036_hdmi_phy_configs[1],
-};
-
-static const struct inno_hdmi_variant rk3128_inno_hdmi_variant = {
-	.dev_type = RK3128_HDMI,
-	.phy_configs = rk3128_hdmi_phy_configs,
-	.default_phy_config = &rk3128_hdmi_phy_configs[1],
-};
-
-static const struct of_device_id inno_hdmi_dt_ids[] = {
-	{ .compatible = "rockchip,rk3036-inno-hdmi",
-	  .data = &rk3036_inno_hdmi_variant,
-	},
-	{ .compatible = "rockchip,rk3128-inno-hdmi",
-	  .data = &rk3128_inno_hdmi_variant,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, inno_hdmi_dt_ids);
-
-struct platform_driver inno_hdmi_driver = {
-	.probe  = inno_hdmi_probe,
-	.remove = inno_hdmi_remove,
-	.driver = {
-		.name = "innohdmi-rockchip",
-		.of_match_table = inno_hdmi_dt_ids,
-	},
-};
+EXPORT_SYMBOL_GPL(inno_hdmi_bind);
+MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
+MODULE_DESCRIPTION("INNOSILICON HDMI transmitter library");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 26c4410b2407c..06cd969ce4f85 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -10,6 +10,7 @@ config DRM_ROCKCHIP
 	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
 	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
+	select DRM_INNO_HDMI if ROCKCHIP_INNO_HDMI
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
 	select DRM_DW_MIPI_DSI2 if ROCKCHIP_DW_MIPI_DSI2
 	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
index 2b867cebbc121..11176db14af6e 100644
--- a/drivers/gpu/drm/rockchip/Makefile
+++ b/drivers/gpu/drm/rockchip/Makefile
@@ -14,7 +14,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI_QP) += dw_hdmi_qp-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI2) += dw-mipi-dsi2-rockchip.o
-rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
+rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) += rockchip_lvds.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RGB) += rockchip_rgb.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RK3066_HDMI) += rk3066_hdmi.o
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
new file mode 100644
index 0000000000000..d1f37bd92b89c
--- /dev/null
+++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) Rockchip Electronics Co., Ltd.
+ *    Zheng Yang <zhengyang@rock-chips.com>
+ *    Andy Yan <andy.yan@rock-chips.com>
+ */
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/bridge/inno_hdmi.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_of.h>
+
+#include "rockchip_drm_drv.h"
+
+#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
+
+#define RK3036_GRF_SOC_CON2	0x148
+#define RK3036_HDMI_PHSYNC	BIT(4)
+#define RK3036_HDMI_PVSYNC	BIT(5)
+
+enum inno_hdmi_dev_type {
+	RK3036_HDMI,
+	RK3128_HDMI,
+};
+
+struct inno_hdmi_connector_state {
+	struct drm_connector_state	base;
+	unsigned int			colorimetry;
+};
+
+struct rockchip_inno_hdmi {
+	struct inno_hdmi *base;
+	struct device *dev;
+	struct regmap *grf;
+	struct rockchip_encoder encoder;
+};
+
+static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] = {
+	{  74250000, 0x3f, 0xbb },
+	{ 165000000, 0x6f, 0xbb },
+	{      ~0UL, 0x00, 0x00 }
+};
+
+static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] = {
+	{  74250000, 0x3f, 0xaa },
+	{ 165000000, 0x5f, 0xaa },
+	{      ~0UL, 0x00, 0x00 }
+};
+
+static void inno_hdmi_rk3036_enable(struct device *dev, struct drm_display_mode *mode)
+{
+	struct rockchip_inno_hdmi *hdmi = dev_get_drvdata(dev);
+	int value, psync;
+
+	psync = mode->flags & DRM_MODE_FLAG_PHSYNC ? RK3036_HDMI_PHSYNC : 0;
+	value = HIWORD_UPDATE(psync, RK3036_HDMI_PHSYNC);
+	psync = mode->flags & DRM_MODE_FLAG_PVSYNC ? RK3036_HDMI_PVSYNC : 0;
+	value |= HIWORD_UPDATE(psync, RK3036_HDMI_PVSYNC);
+	regmap_write(hdmi->grf, RK3036_GRF_SOC_CON2, value);
+}
+
+static int inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+
+	s->output_mode = ROCKCHIP_OUT_MODE_P888;
+	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs inno_hdmi_rockchip_encoder_helper_funcs = {
+	.atomic_check	= inno_hdmi_encoder_atomic_check,
+};
+
+static int inno_hdmi_rockchip_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct rockchip_inno_hdmi *hdmi;
+	const struct inno_hdmi_plat_data *plat_data;
+	int ret;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->dev = dev;
+
+	plat_data = of_device_get_match_data(hdmi->dev);
+	if (!plat_data)
+		return -EINVAL;
+
+	if (of_device_is_compatible(dev->of_node, "rockchip,rk3036-inno-hdmi")) {
+		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
+		if (IS_ERR(hdmi->grf))
+			return dev_err_probe(dev, PTR_ERR(hdmi->grf), "Unable to get rockchip,grf\n");
+	}
+
+	encoder = &hdmi->encoder.encoder;
+	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
+
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet.  Defer probing, and hope that
+	 * the required CRTC is added later.
+	 */
+	if (encoder->possible_crtcs == 0)
+		return -EPROBE_DEFER;
+
+	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
+
+	drm_encoder_helper_add(encoder, &inno_hdmi_rockchip_encoder_helper_funcs);
+
+	dev_set_drvdata(dev, hdmi);
+
+	hdmi->base = inno_hdmi_bind(dev, encoder, plat_data);
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
+		return ret;
+	}
+
+	return drm_connector_attach_encoder(connector, encoder);
+}
+
+static const struct component_ops inno_hdmi_rockchip_ops = {
+	.bind	= inno_hdmi_rockchip_bind,
+};
+
+static int inno_hdmi_rockchip_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &inno_hdmi_rockchip_ops);
+}
+
+static void inno_hdmi_rockchip_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &inno_hdmi_rockchip_ops);
+}
+
+static const struct inno_hdmi_plat_ops rk3036_inno_hdmi_plat_ops = {
+	.enable = inno_hdmi_rk3036_enable,
+};
+
+static const struct inno_hdmi_plat_data rk3036_inno_hdmi_plat_data = {
+	.ops = &rk3036_inno_hdmi_plat_ops,
+	.phy_configs = rk3036_hdmi_phy_configs,
+	.default_phy_config = &rk3036_hdmi_phy_configs[1],
+};
+
+static const struct inno_hdmi_plat_data rk3128_inno_hdmi_plat_data = {
+	.phy_configs = rk3128_hdmi_phy_configs,
+	.default_phy_config = &rk3128_hdmi_phy_configs[1],
+};
+
+static const struct of_device_id inno_hdmi_rockchip_dt_ids[] = {
+	{ .compatible = "rockchip,rk3036-inno-hdmi",
+	  .data = &rk3036_inno_hdmi_plat_data,
+	},
+	{ .compatible = "rockchip,rk3128-inno-hdmi",
+	  .data = &rk3128_inno_hdmi_plat_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, inno_hdmi_rockchip_dt_ids);
+
+struct platform_driver inno_hdmi_driver = {
+	.probe  = inno_hdmi_rockchip_probe,
+	.remove = inno_hdmi_rockchip_remove,
+	.driver = {
+		.name = "innohdmi-rockchip",
+		.of_match_table = inno_hdmi_rockchip_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.h b/drivers/gpu/drm/rockchip/inno_hdmi.h
deleted file mode 100644
index 8b7ef3fac4853..0000000000000
--- a/drivers/gpu/drm/rockchip/inno_hdmi.h
+++ /dev/null
@@ -1,349 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) Rockchip Electronics Co., Ltd.
- *    Zheng Yang <zhengyang@rock-chips.com>
- *    Yakir Yang <ykk@rock-chips.com>
- */
-
-#ifndef __INNO_HDMI_H__
-#define __INNO_HDMI_H__
-
-#define DDC_SEGMENT_ADDR		0x30
-
-#define HDMI_SCL_RATE			(100*1000)
-#define DDC_BUS_FREQ_L			0x4b
-#define DDC_BUS_FREQ_H			0x4c
-
-#define HDMI_SYS_CTRL			0x00
-#define m_RST_ANALOG			(1 << 6)
-#define v_RST_ANALOG			(0 << 6)
-#define v_NOT_RST_ANALOG		(1 << 6)
-#define m_RST_DIGITAL			(1 << 5)
-#define v_RST_DIGITAL			(0 << 5)
-#define v_NOT_RST_DIGITAL		(1 << 5)
-#define m_REG_CLK_INV			(1 << 4)
-#define v_REG_CLK_NOT_INV		(0 << 4)
-#define v_REG_CLK_INV			(1 << 4)
-#define m_VCLK_INV			(1 << 3)
-#define v_VCLK_NOT_INV			(0 << 3)
-#define v_VCLK_INV			(1 << 3)
-#define m_REG_CLK_SOURCE		(1 << 2)
-#define v_REG_CLK_SOURCE_TMDS		(0 << 2)
-#define v_REG_CLK_SOURCE_SYS		(1 << 2)
-#define m_POWER				(1 << 1)
-#define v_PWR_ON			(0 << 1)
-#define v_PWR_OFF			(1 << 1)
-#define m_INT_POL			(1 << 0)
-#define v_INT_POL_HIGH			1
-#define v_INT_POL_LOW			0
-
-#define HDMI_VIDEO_CONTRL1		0x01
-#define m_VIDEO_INPUT_FORMAT		(7 << 1)
-#define m_DE_SOURCE			(1 << 0)
-#define v_VIDEO_INPUT_FORMAT(n)		(n << 1)
-#define v_DE_EXTERNAL			1
-#define v_DE_INTERNAL			0
-enum {
-	VIDEO_INPUT_SDR_RGB444 = 0,
-	VIDEO_INPUT_DDR_RGB444 = 5,
-	VIDEO_INPUT_DDR_YCBCR422 = 6
-};
-
-#define HDMI_VIDEO_CONTRL2		0x02
-#define m_VIDEO_OUTPUT_COLOR		(3 << 6)
-#define m_VIDEO_INPUT_BITS		(3 << 4)
-#define m_VIDEO_INPUT_CSP		(1 << 0)
-#define v_VIDEO_OUTPUT_COLOR(n)		(((n) & 0x3) << 6)
-#define v_VIDEO_INPUT_BITS(n)		(n << 4)
-#define v_VIDEO_INPUT_CSP(n)		(n << 0)
-enum {
-	VIDEO_INPUT_12BITS = 0,
-	VIDEO_INPUT_10BITS = 1,
-	VIDEO_INPUT_REVERT = 2,
-	VIDEO_INPUT_8BITS = 3,
-};
-
-#define HDMI_VIDEO_CONTRL		0x03
-#define m_VIDEO_AUTO_CSC		(1 << 7)
-#define v_VIDEO_AUTO_CSC(n)		(n << 7)
-#define m_VIDEO_C0_C2_SWAP		(1 << 0)
-#define v_VIDEO_C0_C2_SWAP(n)		(n << 0)
-enum {
-	C0_C2_CHANGE_ENABLE = 0,
-	C0_C2_CHANGE_DISABLE = 1,
-	AUTO_CSC_DISABLE = 0,
-	AUTO_CSC_ENABLE = 1,
-};
-
-#define HDMI_VIDEO_CONTRL3		0x04
-#define m_COLOR_DEPTH_NOT_INDICATED	(1 << 4)
-#define m_SOF				(1 << 3)
-#define m_COLOR_RANGE			(1 << 2)
-#define m_CSC				(1 << 0)
-#define v_COLOR_DEPTH_NOT_INDICATED(n)	((n) << 4)
-#define v_SOF_ENABLE			(0 << 3)
-#define v_SOF_DISABLE			(1 << 3)
-#define v_COLOR_RANGE_FULL		(1 << 2)
-#define v_COLOR_RANGE_LIMITED		(0 << 2)
-#define v_CSC_ENABLE			1
-#define v_CSC_DISABLE			0
-
-#define HDMI_AV_MUTE			0x05
-#define m_AVMUTE_CLEAR			(1 << 7)
-#define m_AVMUTE_ENABLE			(1 << 6)
-#define m_AUDIO_MUTE			(1 << 1)
-#define m_VIDEO_BLACK			(1 << 0)
-#define v_AVMUTE_CLEAR(n)		(n << 7)
-#define v_AVMUTE_ENABLE(n)		(n << 6)
-#define v_AUDIO_MUTE(n)			(n << 1)
-#define v_VIDEO_MUTE(n)			(n << 0)
-
-#define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		(n << 3)
-#define v_VSYNC_POLARITY(n)		(n << 2)
-#define v_INETLACE(n)			(n << 1)
-#define v_EXTERANL_VIDEO(n)		(n << 0)
-
-#define HDMI_VIDEO_EXT_HTOTAL_L		0x09
-#define HDMI_VIDEO_EXT_HTOTAL_H		0x0a
-#define HDMI_VIDEO_EXT_HBLANK_L		0x0b
-#define HDMI_VIDEO_EXT_HBLANK_H		0x0c
-#define HDMI_VIDEO_EXT_HDELAY_L		0x0d
-#define HDMI_VIDEO_EXT_HDELAY_H		0x0e
-#define HDMI_VIDEO_EXT_HDURATION_L	0x0f
-#define HDMI_VIDEO_EXT_HDURATION_H	0x10
-#define HDMI_VIDEO_EXT_VTOTAL_L		0x11
-#define HDMI_VIDEO_EXT_VTOTAL_H		0x12
-#define HDMI_VIDEO_EXT_VBLANK		0x13
-#define HDMI_VIDEO_EXT_VDELAY		0x14
-#define HDMI_VIDEO_EXT_VDURATION	0x15
-
-#define HDMI_VIDEO_CSC_COEF		0x18
-
-#define HDMI_AUDIO_CTRL1		0x35
-enum {
-	CTS_SOURCE_INTERNAL = 0,
-	CTS_SOURCE_EXTERNAL = 1,
-};
-#define v_CTS_SOURCE(n)			(n << 7)
-
-enum {
-	DOWNSAMPLE_DISABLE = 0,
-	DOWNSAMPLE_1_2 = 1,
-	DOWNSAMPLE_1_4 = 2,
-};
-#define v_DOWN_SAMPLE(n)		(n << 5)
-
-enum {
-	AUDIO_SOURCE_IIS = 0,
-	AUDIO_SOURCE_SPDIF = 1,
-};
-#define v_AUDIO_SOURCE(n)		(n << 3)
-
-#define v_MCLK_ENABLE(n)		(n << 2)
-enum {
-	MCLK_128FS = 0,
-	MCLK_256FS = 1,
-	MCLK_384FS = 2,
-	MCLK_512FS = 3,
-};
-#define v_MCLK_RATIO(n)			(n)
-
-#define AUDIO_SAMPLE_RATE		0x37
-enum {
-	AUDIO_32K = 0x3,
-	AUDIO_441K = 0x0,
-	AUDIO_48K = 0x2,
-	AUDIO_882K = 0x8,
-	AUDIO_96K = 0xa,
-	AUDIO_1764K = 0xc,
-	AUDIO_192K = 0xe,
-};
-
-#define AUDIO_I2S_MODE			0x38
-enum {
-	I2S_CHANNEL_1_2 = 1,
-	I2S_CHANNEL_3_4 = 3,
-	I2S_CHANNEL_5_6 = 7,
-	I2S_CHANNEL_7_8 = 0xf
-};
-#define v_I2S_CHANNEL(n)		((n) << 2)
-enum {
-	I2S_STANDARD = 0,
-	I2S_LEFT_JUSTIFIED = 1,
-	I2S_RIGHT_JUSTIFIED = 2,
-};
-#define v_I2S_MODE(n)			(n)
-
-#define AUDIO_I2S_MAP			0x39
-#define AUDIO_I2S_SWAPS_SPDIF		0x3a
-#define v_SPIDF_FREQ(n)			(n)
-
-#define N_32K				0x1000
-#define N_441K				0x1880
-#define N_882K				0x3100
-#define N_1764K				0x6200
-#define N_48K				0x1800
-#define N_96K				0x3000
-#define N_192K				0x6000
-
-#define HDMI_AUDIO_CHANNEL_STATUS	0x3e
-#define m_AUDIO_STATUS_NLPCM		(1 << 7)
-#define m_AUDIO_STATUS_USE		(1 << 6)
-#define m_AUDIO_STATUS_COPYRIGHT	(1 << 5)
-#define m_AUDIO_STATUS_ADDITION		(3 << 2)
-#define m_AUDIO_STATUS_CLK_ACCURACY	(2 << 0)
-#define v_AUDIO_STATUS_NLPCM(n)		((n & 1) << 7)
-#define AUDIO_N_H			0x3f
-#define AUDIO_N_M			0x40
-#define AUDIO_N_L			0x41
-
-#define HDMI_AUDIO_CTS_H		0x45
-#define HDMI_AUDIO_CTS_M		0x46
-#define HDMI_AUDIO_CTS_L		0x47
-
-#define HDMI_DDC_CLK_L			0x4b
-#define HDMI_DDC_CLK_H			0x4c
-
-#define HDMI_EDID_SEGMENT_POINTER	0x4d
-#define HDMI_EDID_WORD_ADDR		0x4e
-#define HDMI_EDID_FIFO_OFFSET		0x4f
-#define HDMI_EDID_FIFO_ADDR		0x50
-
-#define HDMI_PACKET_SEND_MANUAL		0x9c
-#define HDMI_PACKET_SEND_AUTO		0x9d
-#define m_PACKET_GCP_EN			(1 << 7)
-#define m_PACKET_MSI_EN			(1 << 6)
-#define m_PACKET_SDI_EN			(1 << 5)
-#define m_PACKET_VSI_EN			(1 << 4)
-#define v_PACKET_GCP_EN(n)		((n & 1) << 7)
-#define v_PACKET_MSI_EN(n)		((n & 1) << 6)
-#define v_PACKET_SDI_EN(n)		((n & 1) << 5)
-#define v_PACKET_VSI_EN(n)		((n & 1) << 4)
-
-#define HDMI_CONTROL_PACKET_BUF_INDEX	0x9f
-enum {
-	INFOFRAME_VSI = 0x05,
-	INFOFRAME_AVI = 0x06,
-	INFOFRAME_AAI = 0x08,
-};
-
-#define HDMI_CONTROL_PACKET_ADDR	0xa0
-#define HDMI_MAXIMUM_INFO_FRAME_SIZE	0x11
-enum {
-	AVI_COLOR_MODE_RGB = 0,
-	AVI_COLOR_MODE_YCBCR422 = 1,
-	AVI_COLOR_MODE_YCBCR444 = 2,
-	AVI_COLORIMETRY_NO_DATA = 0,
-
-	AVI_COLORIMETRY_SMPTE_170M = 1,
-	AVI_COLORIMETRY_ITU709 = 2,
-	AVI_COLORIMETRY_EXTENDED = 3,
-
-	AVI_CODED_FRAME_ASPECT_NO_DATA = 0,
-	AVI_CODED_FRAME_ASPECT_4_3 = 1,
-	AVI_CODED_FRAME_ASPECT_16_9 = 2,
-
-	ACTIVE_ASPECT_RATE_SAME_AS_CODED_FRAME = 0x08,
-	ACTIVE_ASPECT_RATE_4_3 = 0x09,
-	ACTIVE_ASPECT_RATE_16_9 = 0x0A,
-	ACTIVE_ASPECT_RATE_14_9 = 0x0B,
-};
-
-#define HDMI_HDCP_CTRL			0x52
-#define m_HDMI_DVI			(1 << 1)
-#define v_HDMI_DVI(n)			(n << 1)
-
-#define HDMI_INTERRUPT_MASK1		0xc0
-#define HDMI_INTERRUPT_STATUS1		0xc1
-#define	m_INT_ACTIVE_VSYNC		(1 << 5)
-#define m_INT_EDID_READY		(1 << 2)
-
-#define HDMI_INTERRUPT_MASK2		0xc2
-#define HDMI_INTERRUPT_STATUS2		0xc3
-#define m_INT_HDCP_ERR			(1 << 7)
-#define m_INT_BKSV_FLAG			(1 << 6)
-#define m_INT_HDCP_OK			(1 << 4)
-
-#define HDMI_STATUS			0xc8
-#define m_HOTPLUG			(1 << 7)
-#define m_MASK_INT_HOTPLUG		(1 << 5)
-#define m_INT_HOTPLUG			(1 << 1)
-#define v_MASK_INT_HOTPLUG(n)		((n & 0x1) << 5)
-
-#define HDMI_COLORBAR                   0xc9
-
-#define HDMI_PHY_SYNC			0xce
-#define HDMI_PHY_SYS_CTL		0xe0
-#define m_TMDS_CLK_SOURCE		(1 << 5)
-#define v_TMDS_FROM_PLL			(0 << 5)
-#define v_TMDS_FROM_GEN			(1 << 5)
-#define m_PHASE_CLK			(1 << 4)
-#define v_DEFAULT_PHASE			(0 << 4)
-#define v_SYNC_PHASE			(1 << 4)
-#define m_TMDS_CURRENT_PWR		(1 << 3)
-#define v_TURN_ON_CURRENT		(0 << 3)
-#define v_CAT_OFF_CURRENT		(1 << 3)
-#define m_BANDGAP_PWR			(1 << 2)
-#define v_BANDGAP_PWR_UP		(0 << 2)
-#define v_BANDGAP_PWR_DOWN		(1 << 2)
-#define m_PLL_PWR			(1 << 1)
-#define v_PLL_PWR_UP			(0 << 1)
-#define v_PLL_PWR_DOWN			(1 << 1)
-#define m_TMDS_CHG_PWR			(1 << 0)
-#define v_TMDS_CHG_PWR_UP		(0 << 0)
-#define v_TMDS_CHG_PWR_DOWN		(1 << 0)
-
-#define HDMI_PHY_CHG_PWR		0xe1
-#define v_CLK_CHG_PWR(n)		((n & 1) << 3)
-#define v_DATA_CHG_PWR(n)		((n & 7) << 0)
-
-#define HDMI_PHY_DRIVER			0xe2
-#define v_CLK_MAIN_DRIVER(n)		(n << 4)
-#define v_DATA_MAIN_DRIVER(n)		(n << 0)
-
-#define HDMI_PHY_PRE_EMPHASIS		0xe3
-#define v_PRE_EMPHASIS(n)		((n & 7) << 4)
-#define v_CLK_PRE_DRIVER(n)		((n & 3) << 2)
-#define v_DATA_PRE_DRIVER(n)		((n & 3) << 0)
-
-#define HDMI_PHY_FEEDBACK_DIV_RATIO_LOW		0xe7
-#define v_FEEDBACK_DIV_LOW(n)			(n & 0xff)
-#define HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH	0xe8
-#define v_FEEDBACK_DIV_HIGH(n)			(n & 1)
-
-#define HDMI_PHY_PRE_DIV_RATIO		0xed
-#define v_PRE_DIV_RATIO(n)		(n & 0x1f)
-
-#define HDMI_CEC_CTRL			0xd0
-#define m_ADJUST_FOR_HISENSE		(1 << 6)
-#define m_REJECT_RX_BROADCAST		(1 << 5)
-#define m_BUSFREETIME_ENABLE		(1 << 2)
-#define m_REJECT_RX			(1 << 1)
-#define m_START_TX			(1 << 0)
-
-#define HDMI_CEC_DATA			0xd1
-#define HDMI_CEC_TX_OFFSET		0xd2
-#define HDMI_CEC_RX_OFFSET		0xd3
-#define HDMI_CEC_CLK_H			0xd4
-#define HDMI_CEC_CLK_L			0xd5
-#define HDMI_CEC_TX_LENGTH		0xd6
-#define HDMI_CEC_RX_LENGTH		0xd7
-#define HDMI_CEC_TX_INT_MASK		0xd8
-#define m_TX_DONE			(1 << 3)
-#define m_TX_NOACK			(1 << 2)
-#define m_TX_BROADCAST_REJ		(1 << 1)
-#define m_TX_BUSNOTFREE			(1 << 0)
-
-#define HDMI_CEC_RX_INT_MASK		0xd9
-#define m_RX_LA_ERR			(1 << 4)
-#define m_RX_GLITCH			(1 << 3)
-#define m_RX_DONE			(1 << 0)
-
-#define HDMI_CEC_TX_INT			0xda
-#define HDMI_CEC_RX_INT			0xdb
-#define HDMI_CEC_BUSFREETIME_L		0xdc
-#define HDMI_CEC_BUSFREETIME_H		0xdd
-#define HDMI_CEC_LOGICADDR		0xde
-
-#endif /* __INNO_HDMI_H__ */
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
new file mode 100644
index 0000000000000..20eec29bd2a27
--- /dev/null
+++ b/include/drm/bridge/inno_hdmi.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef __INNO_HDMI_QP__
+#define __INNO_HDMI_QP__
+
+struct device;
+struct drm_encoder;
+struct drm_display_mode;
+struct inno_hdmi;
+
+struct inno_hdmi_plat_ops {
+	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
+};
+
+struct inno_hdmi_phy_config {
+	unsigned long pixelclock;
+	u8 pre_emphasis;
+	u8 voltage_level_control;
+};
+
+struct inno_hdmi_plat_data {
+	const struct inno_hdmi_plat_ops *ops;
+	struct inno_hdmi_phy_config *phy_configs;
+	struct inno_hdmi_phy_config *default_phy_config;
+};
+
+struct inno_hdmi *inno_hdmi_bind(struct device *pdev,
+				 struct drm_encoder *encoder,
+				 const struct inno_hdmi_plat_data *plat_data);
+#endif /* __INNO_HDMI__ */
-- 
2.43.0

