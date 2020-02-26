Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D335617123E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4656EC2E;
	Thu, 27 Feb 2020 08:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B096E266
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:54:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id BBF66293F30
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform driver
Date: Wed, 26 Feb 2020 11:54:18 +0100
Message-Id: <20200226105419.632771-4-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226105419.632771-1-enric.balletbo@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Brugger <mbrugger@suse.com>

There is no strong reason for this to use CLK_OF_DECLARE instead of
being a platform driver. Plus, this driver provides clocks but also
a shared register space for the mediatek-drm and the mediatek-mdp
driver. So move to drivers/soc/mediatek as a platform driver.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v9:
- Move mmsys to drivers/soc/mediatek (CK)

Changes in v8:
- Be a builtin_platform_driver like other mediatek mmsys drivers.

Changes in v7:
- Free clk_data->clks as well
- Get rid of private data structure

 drivers/clk/mediatek/clk-mt8173.c   | 104 ---------------------
 drivers/soc/mediatek/Kconfig        |   7 ++
 drivers/soc/mediatek/Makefile       |   1 +
 drivers/soc/mediatek/mt8173-mmsys.c | 137 ++++++++++++++++++++++++++++
 4 files changed, 145 insertions(+), 104 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8173-mmsys.c

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 537a7f49b0f7..8f898ac476c0 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -753,93 +753,6 @@ static const struct mtk_gate img_clks[] __initconst = {
 	GATE_IMG(CLK_IMG_FD, "img_fd", "mm_sel", 11),
 };
 
-static const struct mtk_gate_regs mm0_cg_regs __initconst = {
-	.set_ofs = 0x0104,
-	.clr_ofs = 0x0108,
-	.sta_ofs = 0x0100,
-};
-
-static const struct mtk_gate_regs mm1_cg_regs __initconst = {
-	.set_ofs = 0x0114,
-	.clr_ofs = 0x0118,
-	.sta_ofs = 0x0110,
-};
-
-#define GATE_MM0(_id, _name, _parent, _shift) {			\
-		.id = _id,					\
-		.name = _name,					\
-		.parent_name = _parent,				\
-		.regs = &mm0_cg_regs,				\
-		.shift = _shift,				\
-		.ops = &mtk_clk_gate_ops_setclr,		\
-	}
-
-#define GATE_MM1(_id, _name, _parent, _shift) {			\
-		.id = _id,					\
-		.name = _name,					\
-		.parent_name = _parent,				\
-		.regs = &mm1_cg_regs,				\
-		.shift = _shift,				\
-		.ops = &mtk_clk_gate_ops_setclr,		\
-	}
-
-static const struct mtk_gate mm_clks[] __initconst = {
-	/* MM0 */
-	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
-	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
-	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
-	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
-	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
-	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
-	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
-	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
-	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
-	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
-	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
-	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
-	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
-	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
-	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
-	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
-	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
-	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
-	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
-	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
-	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
-	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
-	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
-	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
-	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
-	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
-	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
-	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
-	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
-	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
-	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
-	/* MM1 */
-	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
-	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
-	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
-	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
-	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
-	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
-	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
-	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
-	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
-	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
-	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
-	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
-	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
-	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
-	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
-	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
-	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
-	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
-	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
-	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
-	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
-};
-
 static const struct mtk_gate_regs vdec0_cg_regs __initconst = {
 	.set_ofs = 0x0000,
 	.clr_ofs = 0x0004,
@@ -1144,23 +1057,6 @@ static void __init mtk_imgsys_init(struct device_node *node)
 }
 CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
 
-static void __init mtk_mmsys_init(struct device_node *node)
-{
-	struct clk_onecell_data *clk_data;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
-
-	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-						clk_data);
-
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-}
-CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
-
 static void __init mtk_vdecsys_init(struct device_node *node)
 {
 	struct clk_onecell_data *clk_data;
diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 2114b563478c..dcd6481a14d0 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -44,4 +44,11 @@ config MTK_SCPSYS
 	  Say yes here to add support for the MediaTek SCPSYS power domain
 	  driver.
 
+config MT8173_MMSYS
+	bool "MediaTek MT8173 MMSYS Support"
+	depends on COMMON_CLK_MT8173
+	help
+	  Say yes here to add support for the MediaTek MT8173 Multimedia
+	  Subsystem (MMSYS).
+
 endmenu
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index b01733074ad6..a185e4ee7601 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
+obj-$(CONFIG_MT8173_MMSYS) += mt8173-mmsys.o
diff --git a/drivers/soc/mediatek/mt8173-mmsys.c b/drivers/soc/mediatek/mt8173-mmsys.c
new file mode 100644
index 000000000000..48e6c157d28e
--- /dev/null
+++ b/drivers/soc/mediatek/mt8173-mmsys.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: James Liao <jamesjj.liao@mediatek.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "../../clk/mediatek/clk-gate.h"
+#include "../../clk/mediatek/clk-mtk.h"
+
+#include <dt-bindings/clock/mt8173-clk.h>
+
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x0104,
+	.clr_ofs = 0x0108,
+	.sta_ofs = 0x0100,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x0114,
+	.clr_ofs = 0x0118,
+	.sta_ofs = 0x0110,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift) {			\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _parent,				\
+		.regs = &mm0_cg_regs,				\
+		.shift = _shift,				\
+		.ops = &mtk_clk_gate_ops_setclr,		\
+	}
+
+#define GATE_MM1(_id, _name, _parent, _shift) {			\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _parent,				\
+		.regs = &mm1_cg_regs,				\
+		.shift = _shift,				\
+		.ops = &mtk_clk_gate_ops_setclr,		\
+	}
+
+static const struct mtk_gate mm_clks[] = {
+	/* MM0 */
+	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
+	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
+	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
+	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
+	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
+	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
+	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
+	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
+	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
+	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
+	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
+	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
+	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
+	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
+	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
+	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
+	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
+	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
+	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
+	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
+	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
+	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
+	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
+	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
+	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
+	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
+	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
+	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
+	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
+	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
+	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
+	/* MM1 */
+	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
+	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
+	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
+	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
+	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
+	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
+	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
+	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
+	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
+	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
+	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
+	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
+	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
+	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
+	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
+	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
+	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
+	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
+	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
+	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
+	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
+};
+
+static int mt8173_mmsys_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_onecell_data *clk_data;
+	int ret;
+
+	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	ret = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
+				     clk_data);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id of_match_mt8173_mmsys[] = {
+	{ .compatible = "mediatek,mt8173-mmsys", },
+	{ }
+};
+
+static struct platform_driver mt8173_mmsys_drv = {
+	.driver = {
+		.name = "mt8173-mmsys",
+		.of_match_table = of_match_mt8173_mmsys,
+	},
+	.probe = mt8173_mmsys_probe,
+};
+
+builtin_platform_driver(mt8173_mmsys_drv);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
