Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210168032C8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D05E10E35D;
	Mon,  4 Dec 2023 12:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 262FC10E1BF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:33:21 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id D971524E25A;
 Mon,  4 Dec 2023 20:33:18 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:18 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:18 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Keith Zhao <keith.zhao@starfivetech.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: [v3 5/6] drm/vs: Add hdmi driver
Date: Mon, 4 Dec 2023 20:33:14 +0800
Message-ID: <20231204123315.28456-6-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204123315.28456-1-keith.zhao@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
Cc: aou@eecs.berkeley.edu, suijingfeng@loongson.cn, tzimmermann@suse.de,
 paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com,
 jack.zhu@starfivetech.com, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add hdmi driver as encoder and connect

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Kconfig         |   8 +
 drivers/gpu/drm/verisilicon/Makefile        |   1 +
 drivers/gpu/drm/verisilicon/starfive_hdmi.c | 849 ++++++++++++++++++++
 drivers/gpu/drm/verisilicon/starfive_hdmi.h | 304 +++++++
 drivers/gpu/drm/verisilicon/vs_drv.c        |   3 +
 drivers/gpu/drm/verisilicon/vs_drv.h        |   4 +
 6 files changed, 1169 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisi=
licon/Kconfig
index e10fa97635aa..122c786e3948 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -11,3 +11,11 @@ config DRM_VERISILICON
 	  This driver provides VeriSilicon kernel mode
 	  setting and buffer management. It does not
 	  provide 2D or 3D acceleration.
+
+config DRM_VERISILICON_STARFIVE_HDMI
+	bool "Starfive HDMI extensions"
+	depends on DRM_VERISILICON
+	help
+	   This selects support for StarFive soc specific extensions
+	   for the Innosilicon HDMI driver. If you want to enable
+	   HDMI on JH7110 based soc, you should select this option.
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
index bf6f2b7ee480..71fadafcee13 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -6,4 +6,5 @@ vs_drm-objs :=3D vs_dc_hw.o \
 		vs_drv.o \
 		vs_modeset.o \
 		vs_plane.o
+vs_drm-$(CONFIG_DRM_VERISILICON_STARFIVE_HDMI) +=3D starfive_hdmi.o
 obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.c b/drivers/gpu/dr=
m/verisilicon/starfive_hdmi.c
new file mode 100644
index 000000000000..aa621db0dee0
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
@@ -0,0 +1,849 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/irq.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "starfive_hdmi.h"
+#include "vs_drv.h"
+#include "vs_crtc.h"
+
+static const char * const hdmi_clocks[] =3D {
+	"sysclk",
+	"mclk",
+	"bclk"
+};
+
+static struct starfive_hdmi_encoder *encoder_to_hdmi(struct drm_encoder =
*encoder)
+{
+	return container_of(encoder, struct starfive_hdmi_encoder, encoder);
+}
+
+static struct starfive_hdmi *connector_to_hdmi(struct drm_connector *con=
nector)
+{
+	return container_of(connector, struct starfive_hdmi, connector);
+}
+
+static const struct post_pll_config post_pll_cfg_table[] =3D {
+	{25200000,	1, 80, 13, 3, 1},
+	{27000000,	1, 40, 11, 3, 1},
+	{33750000,	1, 40, 11, 3, 1},
+	{49000000,	1, 20, 1, 3, 3},
+	{241700000, 1, 20, 1, 3, 3},
+	{297000000, 4, 20, 0, 0, 3},
+	{594000000, 4, 20, 0, 0, 0},
+	{ /* sentinel */ }
+};
+
+inline u8 hdmi_readb(struct starfive_hdmi *hdmi, u16 offset)
+{
+	return readl_relaxed(hdmi->regs + (offset) * 0x04);
+}
+
+inline void hdmi_writeb(struct starfive_hdmi *hdmi, u16 offset, u32 val)
+{
+	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
+}
+
+inline void hdmi_writew(struct starfive_hdmi *hdmi, u16 offset, u32 val)
+{
+	writew_relaxed(val & 0xFF, hdmi->regs + (offset) * 0x04);
+	writew_relaxed((val >> 8) & 0xFF, hdmi->regs + (offset + 1) * 0x04);
+}
+
+inline void hdmi_modb(struct starfive_hdmi *hdmi, u16 offset,
+			     u32 msk, u32 val)
+{
+	u8 temp =3D hdmi_readb(hdmi, offset) & ~msk;
+
+	temp |=3D val & msk;
+	hdmi_writeb(hdmi, offset, temp);
+}
+
+static int starfive_hdmi_enable_clk_deassert_rst(struct device *dev, str=
uct starfive_hdmi *hdmi)
+{
+	int ret;
+
+	ret =3D clk_bulk_prepare_enable(hdmi->nclks, hdmi->clk_hdmi);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	ret =3D reset_control_deassert(hdmi->tx_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert tx_rst\n");
+		return ret;
+	}
+	return 0;
+}
+
+static void starfive_hdmi_disable_clk_assert_rst(struct device *dev, str=
uct starfive_hdmi *hdmi)
+{
+	int ret;
+
+	ret =3D reset_control_assert(hdmi->tx_rst);
+	if (ret < 0)
+		dev_err(dev, "failed to assert tx_rst\n");
+
+	clk_bulk_disable_unprepare(hdmi->nclks, hdmi->clk_hdmi);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int hdmi_system_pm_suspend(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int hdmi_system_pm_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
+#endif
+
+#ifdef CONFIG_PM
+static int hdmi_runtime_suspend(struct device *dev)
+{
+	struct starfive_hdmi *hdmi =3D dev_get_drvdata(dev);
+
+	starfive_hdmi_disable_clk_assert_rst(dev, hdmi);
+
+	return 0;
+}
+
+static int hdmi_runtime_resume(struct device *dev)
+{
+	struct starfive_hdmi *hdmi =3D dev_get_drvdata(dev);
+
+	return starfive_hdmi_enable_clk_deassert_rst(dev, hdmi);
+}
+#endif
+
+static void starfive_hdmi_tx_phy_power_down(struct starfive_hdmi *hdmi)
+{
+	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_OFF);
+}
+
+static void starfive_hdmi_tx_phy_power_on(struct starfive_hdmi *hdmi)
+{
+	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_ON);
+}
+
+static void starfive_hdmi_config_pll(struct starfive_hdmi *hdmi)
+{
+	u32 val;
+	u8 reg_1ad_value =3D hdmi->post_cfg->post_div_en ?
+		 hdmi->post_cfg->postdiv : 0x00;
+	u8 reg_1aa_value =3D hdmi->post_cfg->post_div_en ?
+		 0x0e : 0x02;
+
+	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_CONTROL, STARFIVE_PRE_PLL_POWER_DOWN=
);
+	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_1,
+		    STARFIVE_POST_PLL_POST_DIV_ENABLE |
+		    STARFIVE_POST_PLL_REFCLK_SEL_TMDS |
+		    STARFIVE_POST_PLL_POWER_DOWN);
+	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_1, STARFIVE_PRE_PLL_PRE_DIV(hdmi=
->pre_cfg.prediv));
+
+	val =3D STARFIVE_SPREAD_SPECTRUM_MOD_DISABLE | STARFIVE_SPREAD_SPECTRUM=
_MOD_DOWN;
+	if (!hdmi->pre_cfg.fracdiv)
+		val |=3D STARFIVE_PRE_PLL_FRAC_DIV_DISABLE;
+	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_2,
+		    STARFIVE_PRE_PLL_FB_DIV_11_8(hdmi->pre_cfg.fbdiv) | val);
+	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_3,
+		    STARFIVE_PRE_PLL_FB_DIV_7_0(hdmi->pre_cfg.fbdiv));
+	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_4,
+		    STARFIVE_PRE_PLL_TMDSCLK_DIV_C(hdmi->pre_cfg.tmds_div_c) |
+		    STARFIVE_PRE_PLL_TMDSCLK_DIV_A(hdmi->pre_cfg.tmds_div_a) |
+		    STARFIVE_PRE_PLL_TMDSCLK_DIV_B(hdmi->pre_cfg.tmds_div_b));
+
+	if (hdmi->pre_cfg.fracdiv) {
+		hdmi_writeb(hdmi, STARFIVE_PRE_PLL_FRAC_DIV_L,
+			    STARFIVE_PRE_PLL_FRAC_DIV_7_0(hdmi->pre_cfg.fracdiv));
+		hdmi_writeb(hdmi, STARFIVE_PRE_PLL_FRAC_DIV_M,
+			    STARFIVE_PRE_PLL_FRAC_DIV_15_8(hdmi->pre_cfg.fracdiv));
+		hdmi_writeb(hdmi, STARFIVE_PRE_PLL_FRAC_DIV_H,
+			    STARFIVE_PRE_PLL_FRAC_DIV_23_16(hdmi->pre_cfg.fracdiv));
+	}
+
+	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_5,
+		    STARFIVE_PRE_PLL_PCLK_DIV_A(hdmi->pre_cfg.pclk_div_a) |
+		    STARFIVE_PRE_PLL_PCLK_DIV_B(hdmi->pre_cfg.pclk_div_b));
+	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_6,
+		    STARFIVE_PRE_PLL_PCLK_DIV_C(hdmi->pre_cfg.pclk_div_c) |
+		    STARFIVE_PRE_PLL_PCLK_DIV_D(hdmi->pre_cfg.pclk_div_d));
+
+	/*pre-pll power down*/
+	hdmi_modb(hdmi, STARFIVE_PRE_PLL_CONTROL, STARFIVE_PRE_PLL_POWER_DOWN, =
0);
+
+	hdmi_modb(hdmi, STARFIVE_POST_PLL_DIV_2, STARFIVE_POST_PLL_Pre_DIV_MASK=
,
+		  STARFIVE_POST_PLL_PRE_DIV(hdmi->post_cfg->prediv));
+	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_3, hdmi->post_cfg->fbdiv & 0xff=
);
+	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_4, reg_1ad_value);
+	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_1, reg_1aa_value);
+}
+
+static void starfive_hdmi_tmds_driver_on(struct starfive_hdmi *hdmi)
+{
+	hdmi_modb(hdmi, STARFIVE_TMDS_CONTROL,
+		  STARFIVE_TMDS_DRIVER_ENABLE, STARFIVE_TMDS_DRIVER_ENABLE);
+}
+
+static void starfive_hdmi_sync_tmds(struct starfive_hdmi *hdmi)
+{
+	/*first send 0 to this bit, then send 1 and keep 1 into this bit*/
+	hdmi_writeb(hdmi, HDMI_SYNC, 0x0);
+	hdmi_writeb(hdmi, HDMI_SYNC, 0x1);
+}
+
+static void starfive_hdmi_i2c_init(struct starfive_hdmi *hdmi)
+{
+	int ddc_bus_freq;
+
+	ddc_bus_freq =3D (clk_get_rate(hdmi->clk_hdmi[CLK_SYS].clk) >> 2) / HDM=
I_SCL_RATE;
+
+	hdmi_writeb(hdmi, DDC_BUS_FREQ_L, ddc_bus_freq & 0xFF);
+	hdmi_writeb(hdmi, DDC_BUS_FREQ_H, (ddc_bus_freq >> 8) & 0xFF);
+
+	/* Clear the EDID interrupt flag and mute the interrupt */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
+}
+
+static void starfive_hdmi_phy_get_pre_pll_cfg(struct starfive_hdmi *hdmi=
)
+{
+	if (hdmi->tmds_rate > 30000000) {
+		hdmi->pre_cfg.pixclock =3D hdmi->tmds_rate;
+		hdmi->pre_cfg.tmdsclock =3D hdmi->tmds_rate;
+		hdmi->pre_cfg.prediv =3D 1;
+		hdmi->pre_cfg.fbdiv =3D hdmi->tmds_rate / 3000000;
+		hdmi->pre_cfg.tmds_div_a =3D 0;
+		hdmi->pre_cfg.tmds_div_b =3D 1;
+		hdmi->pre_cfg.tmds_div_c =3D 1;
+		hdmi->pre_cfg.pclk_div_a =3D 1;
+		hdmi->pre_cfg.pclk_div_b =3D 0;
+		hdmi->pre_cfg.pclk_div_c =3D 2;
+		hdmi->pre_cfg.pclk_div_d =3D 2;
+		hdmi->pre_cfg.vco_div_5_en =3D hdmi->tmds_rate % 3000000 ? 1 : 0;
+
+		if (hdmi->pre_cfg.vco_div_5_en) {
+			hdmi->pre_cfg.fracdiv =3D (hdmi->tmds_rate % 3000000) *
+						 0xffffff / 1000000;
+		}
+	} else {
+		hdmi->pre_cfg.pixclock =3D hdmi->tmds_rate;
+		hdmi->pre_cfg.tmdsclock =3D hdmi->tmds_rate;
+		hdmi->pre_cfg.prediv =3D 1;
+		hdmi->pre_cfg.fbdiv =3D hdmi->tmds_rate / 1000000;
+		hdmi->pre_cfg.tmds_div_a =3D 2;
+		hdmi->pre_cfg.tmds_div_b =3D 1;
+		hdmi->pre_cfg.tmds_div_c =3D 1;
+		hdmi->pre_cfg.pclk_div_a =3D 3;
+		hdmi->pre_cfg.pclk_div_b =3D 0;
+		hdmi->pre_cfg.pclk_div_c =3D 3;
+		hdmi->pre_cfg.pclk_div_d =3D 4;
+		hdmi->pre_cfg.vco_div_5_en =3D hdmi->tmds_rate % 1000000 ? 1 : 0;
+
+		if (hdmi->pre_cfg.vco_div_5_en) {
+			hdmi->pre_cfg.fracdiv =3D (hdmi->tmds_rate % 1000000) *
+						 0xffffff / 1000000;
+		}
+	}
+}
+
+static int starfive_hdmi_phy_clk_set_rate(struct starfive_hdmi *hdmi)
+{
+	hdmi->post_cfg =3D post_pll_cfg_table;
+
+	starfive_hdmi_phy_get_pre_pll_cfg(hdmi);
+
+	for (; hdmi->post_cfg->tmdsclock !=3D 0; hdmi->post_cfg++)
+		if (hdmi->tmds_rate <=3D hdmi->post_cfg->tmdsclock)
+			break;
+
+	starfive_hdmi_config_pll(hdmi);
+
+	return 0;
+}
+
+static int starfive_hdmi_config_video_timing(struct starfive_hdmi *hdmi,
+					     struct drm_display_mode *mode)
+{
+	int value;
+	/* Set detail external video timing */
+	value =3D mode->htotal;
+	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HTOTAL_L, value);
+
+	value =3D mode->htotal - mode->hdisplay;
+	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HBLANK_L, value);
+
+	value =3D mode->htotal - mode->hsync_start;
+	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HDELAY_L, value);
+
+	value =3D mode->hsync_end - mode->hsync_start;
+	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HDURATION_L, value);
+
+	value =3D mode->vtotal;
+	hdmi_writew(hdmi, HDMI_VIDEO_EXT_VTOTAL_L, value);
+
+	value =3D mode->vtotal - mode->vdisplay;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VBLANK, value & 0xFF);
+
+	value =3D mode->vtotal - mode->vsync_start;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDELAY, value & 0xFF);
+
+	value =3D mode->vsync_end - mode->vsync_start;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDURATION, value & 0xFF);
+
+	/* Set detail external video timing polarity and interlace mode */
+	value =3D v_EXTERANL_VIDEO(1);
+	value |=3D mode->flags & DRM_MODE_FLAG_PHSYNC ?
+		v_HSYNC_POLARITY(1) : v_HSYNC_POLARITY(0);
+	value |=3D mode->flags & DRM_MODE_FLAG_PVSYNC ?
+		v_VSYNC_POLARITY(1) : v_VSYNC_POLARITY(0);
+	value |=3D mode->flags & DRM_MODE_FLAG_INTERLACE ?
+		v_INETLACE(1) : v_INETLACE(0);
+
+	hdmi_writeb(hdmi, HDMI_VIDEO_TIMING_CTL, value);
+	return 0;
+}
+
+static int starfive_hdmi_setup(struct starfive_hdmi *hdmi,
+			       struct drm_display_mode *mode)
+{
+	int ret;
+	u32 val;
+
+	hdmi_modb(hdmi, STARFIVE_BIAS_CONTROL, STARFIVE_BIAS_ENABLE, STARFIVE_B=
IAS_ENABLE);
+	hdmi_writeb(hdmi, STARFIVE_RX_CONTROL, STARFIVE_RX_ENABLE);
+
+	hdmi->tmds_rate =3D mode->clock * 1000;
+	starfive_hdmi_phy_clk_set_rate(hdmi);
+
+	ret =3D readx_poll_timeout(readl_relaxed,
+				 hdmi->regs + (STARFIVE_PRE_PLL_LOCK_STATUS) * 0x04,
+				 val, val & 0x1, 1000, 100000);
+	if (ret < 0) {
+		dev_err(hdmi->dev, "failed to wait pre-pll lock\n");
+		return ret;
+	}
+
+	ret =3D readx_poll_timeout(readl_relaxed,
+				 hdmi->regs + (STARFIVE_POST_PLL_LOCK_STATUS) * 0x04,
+				 val, val & 0x1, 1000, 100000);
+	if (ret < 0) {
+		dev_err(hdmi->dev, "failed to wait post-pll lock\n");
+		return ret;
+	}
+
+	/*turn on LDO*/
+	hdmi_writeb(hdmi, STARFIVE_LDO_CONTROL, STARFIVE_LDO_ENABLE);
+	/*turn on serializer*/
+	hdmi_writeb(hdmi, STARFIVE_SERIALIER_CONTROL, STARFIVE_SERIALIER_ENABLE=
);
+
+	starfive_hdmi_tx_phy_power_down(hdmi);
+	starfive_hdmi_config_video_timing(hdmi, mode);
+	starfive_hdmi_tx_phy_power_on(hdmi);
+
+	starfive_hdmi_tmds_driver_on(hdmi);
+	starfive_hdmi_sync_tmds(hdmi);
+
+	return 0;
+}
+
+static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder)
+{
+	struct starfive_hdmi_encoder *hdmi_encoder =3D encoder_to_hdmi(encoder)=
;
+	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
+	int ret, idx;
+	struct drm_device *drm =3D hdmi_encoder->hdmi->connector.dev;
+
+	if (drm && !drm_dev_enter(drm, &idx))
+		return;
+
+	ret =3D pm_runtime_get_sync(hdmi_encoder->hdmi->dev);
+	if (ret < 0)
+		return;
+	starfive_hdmi_setup(hdmi_encoder->hdmi, mode);
+
+	if (drm)
+		drm_dev_exit(idx);
+}
+
+static void starfive_hdmi_encoder_disable(struct drm_encoder *encoder)
+{
+	struct starfive_hdmi_encoder *hdmi_encoder =3D encoder_to_hdmi(encoder)=
;
+
+	pm_runtime_put(hdmi_encoder->hdmi->dev);
+}
+
+static int
+starfive_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	bool valid =3D false;
+	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
+	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(crtc_state);
+
+	vs_crtc_state->encoder_type =3D encoder->encoder_type;
+	vs_crtc_state->output_fmt =3D MEDIA_BUS_FMT_RGB888_1X24;
+
+	int pclk =3D mode->clock * 1000;
+
+	if (pclk <=3D PIXCLOCK_4K_30FPS)
+		valid =3D true;
+
+	return (valid) ? 0 : -EINVAL;
+}
+
+static const struct drm_encoder_helper_funcs starfive_hdmi_encoder_helpe=
r_funcs =3D {
+	.enable     =3D starfive_hdmi_encoder_enable,
+	.disable    =3D starfive_hdmi_encoder_disable,
+	.atomic_check =3D starfive_hdmi_encoder_atomic_check,
+};
+
+static enum drm_connector_status
+starfive_hdmi_connector_detect(struct drm_connector *connector, bool for=
ce)
+{
+	struct starfive_hdmi *hdmi =3D connector_to_hdmi(connector);
+	struct drm_device *drm =3D hdmi->connector.dev;
+	int ret;
+	int idx;
+
+	if (drm && !drm_dev_enter(drm, &idx))
+		return connector_status_disconnected;
+
+	ret =3D pm_runtime_get_sync(hdmi->dev);
+	if (ret < 0)
+		return ret;
+
+	ret =3D (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
+		connector_status_connected : connector_status_disconnected;
+	pm_runtime_put(hdmi->dev);
+
+	if (drm)
+		drm_dev_exit(idx);
+
+	return ret;
+}
+
+static int starfive_hdmi_connector_get_modes(struct drm_connector *conne=
ctor)
+{
+	struct starfive_hdmi *hdmi =3D connector_to_hdmi(connector);
+	int ret =3D 0;
+
+	if (!hdmi->ddc)
+		return 0;
+	ret =3D pm_runtime_get_sync(hdmi->dev);
+	if (ret < 0)
+		return ret;
+
+	ret =3D drm_connector_helper_get_modes_from_ddc(connector);
+	pm_runtime_put(hdmi->dev);
+
+	return ret;
+}
+
+static enum drm_mode_status
+starfive_hdmi_connector_mode_valid(struct drm_connector *connector,
+				   struct drm_display_mode *mode)
+{
+	int pclk =3D mode->clock * 1000;
+	bool valid =3D false;
+
+	if (pclk <=3D PIXCLOCK_4K_30FPS)
+		valid =3D true;
+
+	return (valid) ? MODE_OK : MODE_BAD;
+}
+
+static int
+starfive_hdmi_probe_single_connector_modes(struct drm_connector *connect=
or,
+					   u32 maxX, u32 maxY)
+{
+	return drm_helper_probe_single_connector_modes(connector, 3840, 2160);
+}
+
+static const struct drm_connector_funcs starfive_hdmi_connector_funcs =3D=
 {
+	.fill_modes =3D starfive_hdmi_probe_single_connector_modes,
+	.detect =3D starfive_hdmi_connector_detect,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state=
,
+	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
+};
+
+static struct drm_connector_helper_funcs starfive_hdmi_connector_helper_=
funcs =3D {
+	.get_modes =3D starfive_hdmi_connector_get_modes,
+	.mode_valid =3D starfive_hdmi_connector_mode_valid,
+};
+
+static int starfive_hdmi_register(struct drm_device *drm,
+				  struct starfive_hdmi_encoder *hdmi_encoder)
+{
+	struct drm_encoder *encoder =3D &hdmi_encoder->encoder;
+	struct device *dev =3D hdmi_encoder->hdmi->dev;
+
+	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm, dev->of_nod=
e);
+
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet.  Defer probing, and hope that
+	 * the required CRTC is added later.
+	 */
+	if (encoder->possible_crtcs =3D=3D 0)
+		return -EPROBE_DEFER;
+
+	drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_funcs);
+
+	hdmi_encoder->hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_helper_add(&hdmi_encoder->hdmi->connector,
+				 &starfive_hdmi_connector_helper_funcs);
+	drmm_connector_init(drm, &hdmi_encoder->hdmi->connector,
+			    &starfive_hdmi_connector_funcs,
+			    DRM_MODE_CONNECTOR_HDMIA,
+			    hdmi_encoder->hdmi->ddc);
+
+	drm_connector_attach_encoder(&hdmi_encoder->hdmi->connector, encoder);
+
+	return 0;
+}
+
+static irqreturn_t starfive_hdmi_i2c_irq(struct starfive_hdmi *hdmi)
+{
+	struct starfive_hdmi_i2c *i2c =3D hdmi->i2c;
+	u8 stat;
+
+	stat =3D hdmi_readb(hdmi, HDMI_INTERRUPT_STATUS1);
+	if (!(stat & m_INT_EDID_READY))
+		return IRQ_NONE;
+
+	/* Clear HDMI EDID interrupt flag */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
+
+	complete(&i2c->cmp);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t starfive_hdmi_hardirq(int irq, void *dev_id)
+{
+	struct starfive_hdmi *hdmi =3D dev_id;
+	irqreturn_t ret =3D IRQ_NONE;
+	u8 interrupt;
+
+	if (hdmi->i2c)
+		ret =3D starfive_hdmi_i2c_irq(hdmi);
+
+	interrupt =3D hdmi_readb(hdmi, HDMI_STATUS);
+	if (interrupt & m_INT_HOTPLUG) {
+		hdmi_modb(hdmi, HDMI_STATUS, m_INT_HOTPLUG, m_INT_HOTPLUG);
+		ret =3D IRQ_WAKE_THREAD;
+	}
+
+	return ret;
+}
+
+static irqreturn_t starfive_hdmi_irq(int irq, void *dev_id)
+{
+	struct starfive_hdmi *hdmi =3D dev_id;
+
+	drm_connector_helper_hpd_irq_event(&hdmi->connector);
+
+	return IRQ_HANDLED;
+}
+
+static int starfive_hdmi_i2c_read(struct starfive_hdmi *hdmi, struct i2c=
_msg *msgs)
+{
+	int length =3D msgs->len;
+	u8 *buf =3D msgs->buf;
+	int ret;
+
+	ret =3D wait_for_completion_timeout(&hdmi->i2c->cmp, HZ / 10);
+	if (!ret)
+		return -EAGAIN;
+
+	while (length--)
+		*buf++ =3D hdmi_readb(hdmi, HDMI_EDID_FIFO_ADDR);
+
+	return 0;
+}
+
+static int starfive_hdmi_i2c_write(struct starfive_hdmi *hdmi, struct i2=
c_msg *msgs)
+{
+	/*
+	 * The DDC module only support read EDID message, so
+	 * we assume that each word write to this i2c adapter
+	 * should be the offset of EDID word address.
+	 */
+	if (msgs->len !=3D 1 ||
+	    (msgs->addr !=3D DDC_ADDR && msgs->addr !=3D DDC_SEGMENT_ADDR))
+		return -EINVAL;
+
+	reinit_completion(&hdmi->i2c->cmp);
+
+	if (msgs->addr =3D=3D DDC_SEGMENT_ADDR)
+		hdmi->i2c->segment_addr =3D msgs->buf[0];
+	if (msgs->addr =3D=3D DDC_ADDR)
+		hdmi->i2c->ddc_addr =3D msgs->buf[0];
+
+	/* Set edid fifo first addr */
+	hdmi_writeb(hdmi, HDMI_EDID_FIFO_OFFSET, 0x00);
+
+	/* Set edid word address 0x00/0x80 */
+	hdmi_writeb(hdmi, HDMI_EDID_WORD_ADDR, hdmi->i2c->ddc_addr);
+
+	/* Set edid segment pointer */
+	hdmi_writeb(hdmi, HDMI_EDID_SEGMENT_POINTER, hdmi->i2c->segment_addr);
+
+	return 0;
+}
+
+static int starfive_hdmi_i2c_xfer(struct i2c_adapter *adap,
+				  struct i2c_msg *msgs, int num)
+{
+	struct starfive_hdmi *hdmi =3D i2c_get_adapdata(adap);
+	struct starfive_hdmi_i2c *i2c =3D hdmi->i2c;
+	int i, ret =3D 0;
+
+	mutex_lock(&i2c->lock);
+
+	/* Clear the EDID interrupt flag and unmute the interrupt */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, m_INT_EDID_READY);
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
+
+	for (i =3D 0; i < num; i++) {
+		DRM_DEV_DEBUG(hdmi->dev,
+			      "xfer: num: %d/%d, len: %d, flags: %#x\n",
+			      i + 1, num, msgs[i].len, msgs[i].flags);
+
+		if (msgs[i].flags & I2C_M_RD)
+			ret =3D starfive_hdmi_i2c_read(hdmi, &msgs[i]);
+		else
+			ret =3D starfive_hdmi_i2c_write(hdmi, &msgs[i]);
+
+		if (ret < 0)
+			break;
+	}
+
+	if (!ret)
+		ret =3D num;
+
+	/* Mute HDMI EDID interrupt */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
+
+	mutex_unlock(&i2c->lock);
+
+	return ret;
+}
+
+static u32 starfive_hdmi_i2c_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm starfive_hdmi_algorithm =3D {
+	.master_xfer	=3D starfive_hdmi_i2c_xfer,
+	.functionality	=3D starfive_hdmi_i2c_func,
+};
+
+static struct i2c_adapter *starfive_hdmi_i2c_adapter(struct starfive_hdm=
i *hdmi)
+{
+	struct i2c_adapter *adap;
+	struct starfive_hdmi_i2c *i2c;
+	int ret;
+
+	i2c =3D devm_kzalloc(hdmi->dev, sizeof(*i2c), GFP_KERNEL);
+		if (!i2c)
+			return ERR_PTR(-ENOMEM);
+
+	mutex_init(&i2c->lock);
+	init_completion(&i2c->cmp);
+
+	adap =3D &i2c->adap;
+	adap->class =3D I2C_CLASS_DDC;
+	adap->owner =3D THIS_MODULE;
+	adap->dev.parent =3D hdmi->dev;
+	adap->algo =3D &starfive_hdmi_algorithm;
+	strscpy(adap->name, "Starfive HDMI", sizeof(adap->name));
+	i2c_set_adapdata(adap, hdmi);
+
+	ret =3D devm_i2c_add_adapter(hdmi->dev, adap);
+	if (ret) {
+		dev_warn(hdmi->dev, "cannot add %s I2C adapter\n", adap->name);
+		devm_kfree(hdmi->dev, i2c);
+		return ERR_PTR(ret);
+	}
+
+	hdmi->i2c =3D i2c;
+
+	DRM_DEV_INFO(hdmi->dev, "registered %s I2C bus driver success\n", adap-=
>name);
+
+	return adap;
+}
+
+static int starfive_hdmi_get_clk_rst(struct device *dev, struct starfive=
_hdmi *hdmi)
+{
+	int ret;
+
+	hdmi->nclks =3D ARRAY_SIZE(hdmi->clk_hdmi);
+	for (int i =3D 0; i < hdmi->nclks; ++i)
+		hdmi->clk_hdmi[i].id =3D hdmi_clocks[i];
+
+	ret =3D devm_clk_bulk_get(dev, hdmi->nclks, hdmi->clk_hdmi);
+	if (ret) {
+		dev_err(dev, "Failed to get clk controls\n");
+		return ret;
+	}
+
+	hdmi->tx_rst =3D devm_reset_control_get_by_index(dev, 0);
+	if (IS_ERR(hdmi->tx_rst)) {
+		dev_err(dev, "failed to get tx_rst reset\n");
+		return PTR_ERR(hdmi->tx_rst);
+	}
+
+	return 0;
+}
+
+static int starfive_hdmi_bind(struct device *dev, struct device *master,
+			      void *data)
+{
+	struct drm_device *drm =3D dev_get_drvdata(master);
+	struct starfive_hdmi_encoder *hdmi_encoder;
+	int ret;
+
+	hdmi_encoder =3D drmm_simple_encoder_alloc(drm, struct starfive_hdmi_en=
coder,
+						 encoder, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(hdmi_encoder))
+		return PTR_ERR(hdmi_encoder);
+
+	hdmi_encoder->hdmi =3D dev_get_drvdata(dev);
+	hdmi_encoder->hdmi->drm_dev =3D drm;
+
+	ret =3D pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	starfive_hdmi_i2c_init(hdmi_encoder->hdmi);
+
+	ret =3D starfive_hdmi_register(drm, hdmi_encoder);
+	if (ret)
+		goto err_put_adapter;
+
+	/* Unmute hotplug interrupt */
+	hdmi_modb(hdmi_encoder->hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_I=
NT_HOTPLUG(1));
+
+	ret =3D devm_request_threaded_irq(dev, hdmi_encoder->hdmi->irq, starfiv=
e_hdmi_hardirq,
+					starfive_hdmi_irq, IRQF_SHARED,
+					dev_name(dev), hdmi_encoder->hdmi);
+	if (ret < 0)
+		goto err_put_adapter;
+
+	pm_runtime_put_sync(dev);
+
+	return 0;
+
+err_put_adapter:
+	i2c_put_adapter(hdmi_encoder->hdmi->ddc);
+	return ret;
+}
+
+static const struct component_ops starfive_hdmi_ops =3D {
+	.bind	=3D starfive_hdmi_bind,
+};
+
+static int starfive_hdmi_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct starfive_hdmi *hdmi;
+	struct resource *iores;
+
+	hdmi =3D devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, hdmi);
+	hdmi->dev =3D &pdev->dev;
+
+	iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hdmi->regs =3D devm_ioremap_resource(hdmi->dev, iores);
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
+
+	ret =3D starfive_hdmi_get_clk_rst(hdmi->dev, hdmi);
+	if (ret < 0)
+		return ret;
+
+	ret =3D devm_pm_runtime_enable(hdmi->dev);
+	if (ret)
+		return ret;
+
+	hdmi->irq =3D platform_get_irq(pdev, 0);
+	if (hdmi->irq < 0) {
+		ret =3D hdmi->irq;
+		return ret;
+	}
+
+	hdmi->ddc =3D starfive_hdmi_i2c_adapter(hdmi);
+	if (IS_ERR(hdmi->ddc)) {
+		ret =3D PTR_ERR(hdmi->ddc);
+		hdmi->ddc =3D NULL;
+		return ret;
+	}
+
+	return component_add(&pdev->dev, &starfive_hdmi_ops);
+}
+
+static int starfive_hdmi_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &starfive_hdmi_ops);
+
+	return 0;
+}
+
+static const struct dev_pm_ops hdmi_pm_ops =3D {
+	SET_RUNTIME_PM_OPS(hdmi_runtime_suspend, hdmi_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(hdmi_system_pm_suspend, hdmi_system_pm_res=
ume)
+};
+
+static const struct of_device_id starfive_hdmi_dt_ids[] =3D {
+	{ .compatible =3D "starfive,jh7110-inno-hdmi",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_dt_ids);
+
+struct platform_driver starfive_hdmi_driver =3D {
+	.probe  =3D starfive_hdmi_probe,
+	.remove =3D starfive_hdmi_remove,
+	.driver =3D {
+		.name =3D "starfive-hdmi",
+		.of_match_table =3D starfive_hdmi_dt_ids,
+		.pm =3D &hdmi_pm_ops,
+	},
+};
+
+MODULE_AUTHOR("StarFive Corporation");
+MODULE_DESCRIPTION("Starfive HDMI Driver");
diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.h b/drivers/gpu/dr=
m/verisilicon/starfive_hdmi.h
new file mode 100644
index 000000000000..ca5f40be0796
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.h
@@ -0,0 +1,304 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __STARFIVE_HDMI_H__
+#define __STARFIVE_HDMI_H__
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+#define DDC_SEGMENT_ADDR		0x30
+
+#define HDMI_SCL_RATE			(100 * 1000)
+#define DDC_BUS_FREQ_L			0x4b
+#define DDC_BUS_FREQ_H			0x4c
+
+#define HDMI_SYS_CTRL			0x00
+#define m_RST_ANALOG			BIT(6)
+#define v_RST_ANALOG			0
+#define v_NOT_RST_ANALOG		BIT(6)
+#define m_RST_DIGITAL			BIT(5)
+#define v_RST_DIGITAL			0
+#define v_NOT_RST_DIGITAL		BIT(5)
+#define m_REG_CLK_INV			BIT(4)
+#define v_REG_CLK_NOT_INV		0
+#define v_REG_CLK_INV			BIT(4)
+#define m_VCLK_INV				BIT(3)
+#define v_VCLK_NOT_INV			0
+#define v_VCLK_INV				BIT(3)
+#define m_REG_CLK_SOURCE		BIT(2)
+#define v_REG_CLK_SOURCE_TMDS		0
+#define v_REG_CLK_SOURCE_SYS		BIT(2)
+#define m_POWER					BIT(1)
+#define v_PWR_ON				0
+#define v_PWR_OFF				BIT(1)
+#define m_INT_POL				BIT(0)
+#define v_INT_POL_HIGH			1
+#define v_INT_POL_LOW			0
+
+#define HDMI_AV_MUTE			0x05
+#define m_AVMUTE_CLEAR			BIT(7)
+#define m_AVMUTE_ENABLE			BIT(6)
+#define m_AUDIO_MUTE			BIT(1)
+#define m_VIDEO_BLACK			BIT(0)
+#define v_AVMUTE_CLEAR(n)		((n) << 7)
+#define v_AVMUTE_ENABLE(n)		((n) << 6)
+#define v_AUDIO_MUTE(n)			((n) << 1)
+#define v_VIDEO_MUTE(n)			((n) << 0)
+
+#define HDMI_VIDEO_TIMING_CTL		0x08
+#define v_VSYNC_POLARITY(n)		((n) << 3)
+#define v_HSYNC_POLARITY(n)		((n) << 2)
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
+#define HDMI_EDID_SEGMENT_POINTER	0x4d
+#define HDMI_EDID_WORD_ADDR			0x4e
+#define HDMI_EDID_FIFO_OFFSET		0x4f
+#define HDMI_EDID_FIFO_ADDR			0x50
+
+#define HDMI_INTERRUPT_MASK1		0xc0
+#define HDMI_INTERRUPT_STATUS1		0xc1
+#define	m_INT_ACTIVE_VSYNC			BIT(5)
+#define m_INT_EDID_READY			BIT(2)
+
+#define HDMI_STATUS					0xc8
+#define m_HOTPLUG					BIT(7)
+#define m_MASK_INT_HOTPLUG			BIT(5)
+#define m_INT_HOTPLUG				BIT(1)
+#define v_MASK_INT_HOTPLUG(n)		(((n) & 0x1) << 5)
+
+#define HDMI_SYNC					0xce
+
+#define UPDATE(x, h, l)					FIELD_PREP(GENMASK(h, l), x)
+
+/* REG: 0x1a0 */
+#define STARFIVE_PRE_PLL_CONTROL			0x1a0
+#define STARFIVE_PCLK_VCO_DIV_5_MASK		BIT(1)
+#define STARFIVE_PCLK_VCO_DIV_5(x)			UPDATE(x, 1, 1)
+#define STARFIVE_PRE_PLL_POWER_DOWN			BIT(0)
+
+/* REG: 0x1a1 */
+#define STARFIVE_PRE_PLL_DIV_1				0x1a1
+#define STARFIVE_PRE_PLL_PRE_DIV_MASK		GENMASK(5, 0)
+#define STARFIVE_PRE_PLL_PRE_DIV(x)			UPDATE(x, 5, 0)
+
+/* REG: 0x1a2 */
+#define STARFIVE_PRE_PLL_DIV_2					0x1a2
+#define STARFIVE_SPREAD_SPECTRUM_MOD_DOWN		BIT(7)
+#define STARFIVE_SPREAD_SPECTRUM_MOD_DISABLE	BIT(6)
+#define STARFIVE_PRE_PLL_FRAC_DIV_DISABLE		UPDATE(3, 5, 4)
+#define STARFIVE_PRE_PLL_FB_DIV_11_8_MASK		GENMASK(3, 0)
+#define STARFIVE_PRE_PLL_FB_DIV_11_8(x)			UPDATE((x) >> 8, 3, 0)
+
+/* REG: 0x1a3 */
+#define STARFIVE_PRE_PLL_DIV_3					0x1a3
+#define STARFIVE_PRE_PLL_FB_DIV_7_0(x)			UPDATE(x, 7, 0)
+
+/* REG: 0x1a4*/
+#define STARFIVE_PRE_PLL_DIV_4					0x1a4
+#define STARFIVE_PRE_PLL_TMDSCLK_DIV_C_MASK		GENMASK(1, 0)
+#define STARFIVE_PRE_PLL_TMDSCLK_DIV_C(x)		UPDATE(x, 1, 0)
+#define STARFIVE_PRE_PLL_TMDSCLK_DIV_B_MASK		GENMASK(3, 2)
+#define STARFIVE_PRE_PLL_TMDSCLK_DIV_B(x)		UPDATE(x, 3, 2)
+#define STARFIVE_PRE_PLL_TMDSCLK_DIV_A_MASK		GENMASK(5, 4)
+#define STARFIVE_PRE_PLL_TMDSCLK_DIV_A(x)		UPDATE(x, 5, 4)
+
+/* REG: 0x1a5 */
+#define STARFIVE_PRE_PLL_DIV_5					0x1a5
+#define STARFIVE_PRE_PLL_PCLK_DIV_B_SHIFT		5
+#define STARFIVE_PRE_PLL_PCLK_DIV_B_MASK		GENMASK(6, 5)
+#define STARFIVE_PRE_PLL_PCLK_DIV_B(x)			UPDATE(x, 6, 5)
+#define STARFIVE_PRE_PLL_PCLK_DIV_A_MASK		GENMASK(4, 0)
+#define STARFIVE_PRE_PLL_PCLK_DIV_A(x)			UPDATE(x, 4, 0)
+
+/* REG: 0x1a6 */
+#define STARFIVE_PRE_PLL_DIV_6					0x1a6
+#define STARFIVE_PRE_PLL_PCLK_DIV_C_SHIFT		5
+#define STARFIVE_PRE_PLL_PCLK_DIV_C_MASK		GENMASK(6, 5)
+#define STARFIVE_PRE_PLL_PCLK_DIV_C(x)			UPDATE(x, 6, 5)
+#define STARFIVE_PRE_PLL_PCLK_DIV_D_MASK		GENMASK(4, 0)
+#define STARFIVE_PRE_PLL_PCLK_DIV_D(x)			UPDATE(x, 4, 0)
+
+/* REG: 0x1a9 */
+#define STARFIVE_PRE_PLL_LOCK_STATUS			0x1a9
+
+/* REG: 0x1aa */
+#define STARFIVE_POST_PLL_DIV_1					0x1aa
+#define STARFIVE_POST_PLL_POST_DIV_ENABLE		GENMASK(3, 2)
+#define STARFIVE_POST_PLL_REFCLK_SEL_TMDS		BIT(1)
+#define STARFIVE_POST_PLL_POWER_DOWN			BIT(0)
+#define STARFIVE_POST_PLL_FB_DIV_8(x)			UPDATE(((x) >> 8) << 4, 4, 4)
+
+/* REG:0x1ab */
+#define STARFIVE_POST_PLL_DIV_2					0x1ab
+#define STARFIVE_POST_PLL_Pre_DIV_MASK			GENMASK(5, 0)
+#define STARFIVE_POST_PLL_PRE_DIV(x)			UPDATE(x, 5, 0)
+
+/* REG: 0x1ac */
+#define STARFIVE_POST_PLL_DIV_3					0x1ac
+#define STARFIVE_POST_PLL_FB_DIV_7_0(x)			UPDATE(x, 7, 0)
+
+/* REG: 0x1ad */
+#define STARFIVE_POST_PLL_DIV_4					0x1ad
+#define STARFIVE_POST_PLL_POST_DIV_MASK			GENMASK(2, 0)
+#define STARFIVE_POST_PLL_POST_DIV_2			0x0
+#define STARFIVE_POST_PLL_POST_DIV_4			0x1
+#define STARFIVE_POST_PLL_POST_DIV_8			0x3
+
+/* REG: 0x1af */
+#define STARFIVE_POST_PLL_LOCK_STATUS			0x1af
+
+/* REG: 0x1b0 */
+#define STARFIVE_BIAS_CONTROL					0x1b0
+#define STARFIVE_BIAS_ENABLE					BIT(2)
+
+/* REG: 0x1b2 */
+#define STARFIVE_TMDS_CONTROL				0x1b2
+#define STARFIVE_TMDS_CLK_DRIVER_EN			BIT(3)
+#define STARFIVE_TMDS_D2_DRIVER_EN			BIT(2)
+#define STARFIVE_TMDS_D1_DRIVER_EN			BIT(1)
+#define STARFIVE_TMDS_D0_DRIVER_EN			BIT(0)
+#define STARFIVE_TMDS_DRIVER_ENABLE			(STARFIVE_TMDS_CLK_DRIVER_EN | \
+							 STARFIVE_TMDS_D2_DRIVER_EN | \
+							 STARFIVE_TMDS_D1_DRIVER_EN | \
+							 STARFIVE_TMDS_D0_DRIVER_EN)
+
+/* REG: 0x1b4 */
+#define STARFIVE_LDO_CONTROL			0x1b4
+#define STARFIVE_LDO_D2_EN				BIT(2)
+#define STARFIVE_LDO_D1_EN				BIT(1)
+#define STARFIVE_LDO_D0_EN				BIT(0)
+#define STARFIVE_LDO_ENABLE				(STARFIVE_LDO_D2_EN | \
+							 STARFIVE_LDO_D1_EN | \
+							 STARFIVE_LDO_D0_EN)
+
+/* REG: 0x1be */
+#define STARFIVE_SERIALIER_CONTROL			0x1be
+#define STARFIVE_SERIALIER_D2_EN			BIT(6)
+#define STARFIVE_SERIALIER_D1_EN			BIT(5)
+#define STARFIVE_SERIALIER_D0_EN			BIT(4)
+#define STARFIVE_SERIALIER_EN				BIT(0)
+
+#define STARFIVE_SERIALIER_ENABLE			(STARFIVE_SERIALIER_D2_EN | \
+							 STARFIVE_SERIALIER_D1_EN | \
+							 STARFIVE_SERIALIER_D0_EN | \
+							 STARFIVE_SERIALIER_EN)
+
+/* REG: 0x1cc */
+#define STARFIVE_RX_CONTROL				0x1cc
+#define STARFIVE_RX_EN					BIT(3)
+#define STARFIVE_RX_CHANNEL_2_EN			BIT(2)
+#define STARFIVE_RX_CHANNEL_1_EN			BIT(1)
+#define STARFIVE_RX_CHANNEL_0_EN			BIT(0)
+#define STARFIVE_RX_ENABLE				(STARFIVE_RX_EN | \
+							 STARFIVE_RX_CHANNEL_2_EN | \
+							 STARFIVE_RX_CHANNEL_1_EN | \
+							 STARFIVE_RX_CHANNEL_0_EN)
+
+/* REG: 0x1d1 */
+#define STARFIVE_PRE_PLL_FRAC_DIV_H			0x1d1
+#define STARFIVE_PRE_PLL_FRAC_DIV_23_16(x)		UPDATE((x) >> 16, 7, 0)
+/* REG: 0x1d2 */
+#define STARFIVE_PRE_PLL_FRAC_DIV_M			0x1d2
+#define STARFIVE_PRE_PLL_FRAC_DIV_15_8(x)		UPDATE((x) >> 8, 7, 0)
+/* REG: 0x1d3 */
+#define STARFIVE_PRE_PLL_FRAC_DIV_L			0x1d3
+#define STARFIVE_PRE_PLL_FRAC_DIV_7_0(x)		UPDATE(x, 7, 0)
+
+#define PIXCLOCK_4K_30FPS					297000000
+
+enum hdmi_clk {
+	CLK_SYS =3D 0,
+	CLK_M,
+	CLK_B,
+	CLK_HDMI_NUM
+};
+
+struct pre_pll_config {
+	unsigned long pixclock;
+	unsigned long tmdsclock;
+	u8 prediv;
+	u16 fbdiv;
+	u8 tmds_div_a;
+	u8 tmds_div_b;
+	u8 tmds_div_c;
+	u8 pclk_div_a;
+	u8 pclk_div_b;
+	u8 pclk_div_c;
+	u8 pclk_div_d;
+	u8 vco_div_5_en;
+	u32 fracdiv;
+};
+
+struct post_pll_config {
+	unsigned long tmdsclock;
+	u8 prediv;
+	u16 fbdiv;
+	u8 postdiv;
+	u8 post_div_en;
+	u8 version;
+};
+
+struct phy_config {
+	unsigned long	tmdsclock;
+	u8		regs[14];
+};
+
+struct starfive_hdmi_encoder {
+	struct drm_encoder encoder;
+	struct starfive_hdmi *hdmi;
+};
+
+struct starfive_hdmi_i2c {
+	struct i2c_adapter adap;
+
+	u8 ddc_addr;
+	u8 segment_addr;
+	/* protects the edid data when use i2c cmd to read edid */
+	struct mutex lock;
+	struct completion cmp;
+};
+
+struct starfive_hdmi {
+	struct device *dev;
+	struct drm_device *drm_dev;
+	struct drm_connector	connector;
+	void __iomem *regs;
+
+	int irq;
+	struct clk_bulk_data	clk_hdmi[CLK_HDMI_NUM];
+	struct reset_control *tx_rst;
+	int	nclks;
+
+	struct i2c_adapter *ddc;
+	struct starfive_hdmi_i2c *i2c;
+
+	unsigned long tmds_rate;
+	struct pre_pll_config	pre_cfg;
+	const struct post_pll_config	*post_cfg;
+};
+
+#endif /* __STARFIVE_HDMI_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/veris=
ilicon/vs_drv.c
index 3ef90c8238a0..d7e5199fe293 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -214,6 +214,9 @@ static const struct component_master_ops vs_drm_ops =3D=
 {
=20
 static struct platform_driver *drm_sub_drivers[] =3D {
 	&dc_platform_driver,
+#ifdef CONFIG_DRM_VERISILICON_STARFIVE_HDMI
+	&starfive_hdmi_driver,
+#endif
 };
=20
 static struct component_match *vs_drm_match_add(struct device *dev)
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/veris=
ilicon/vs_drv.h
index ea2189772980..9a88cf9a7362 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.h
+++ b/drivers/gpu/drm/verisilicon/vs_drv.h
@@ -39,4 +39,8 @@ to_vs_drm_private(const struct drm_device *dev)
 	return container_of(dev, struct vs_drm_device, base);
 }
=20
+#ifdef CONFIG_DRM_VERISILICON_STARFIVE_HDMI
+extern struct platform_driver starfive_hdmi_driver;
+#endif
+
 #endif /* __VS_DRV_H__ */
--=20
2.34.1

