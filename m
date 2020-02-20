Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F1167BBD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEED6F404;
	Fri, 21 Feb 2020 11:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C526EE0F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 17:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 93ECD295293
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v8 6/6] clk/drm: mediatek: Fix mediatek-drm device probing
Date: Thu, 20 Feb 2020 18:21:47 +0100
Message-Id: <20200220172147.919996-7-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220172147.919996-1-enric.balletbo@collabora.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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

In the actual implementation the same compatible string
"mediatek,<chip>-mmsys" is used to bind the clock drivers
(drivers/clk/mediatek) as well as to the gpu driver
(drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
that the only probed driver is the clock driver and there is no display
at all.

In any case having the same compatible string for two drivers is not
correct and should be fixed. To fix this, and maintain backward
compatibility, we can consider that the clk-<chip>-mm driver is the
top-level entry point for the MMSYS subsystem, so is not a pure clock
controller but a system controller, and the drm driver is instantiated
by that MMSYS driver.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v8:
- New patch introduced in this series.

Changes in v7: None

 drivers/clk/mediatek/clk-mt2701-mm.c   |  30 ++++++++
 drivers/clk/mediatek/clk-mt2712-mm.c   |  44 +++++++++++
 drivers/clk/mediatek/clk-mt8173-mm.c   |  35 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 102 ++-----------------------
 4 files changed, 115 insertions(+), 96 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
index 054b597d4a73..b1281680d5bf 100644
--- a/drivers/clk/mediatek/clk-mt2701-mm.c
+++ b/drivers/clk/mediatek/clk-mt2701-mm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/platform_data/mtk_mmsys.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
@@ -79,6 +80,27 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_DISP1(CLK_MM_TVE_FMM, "mm_tve_fmm", "mm_sel", 14),
 };
 
+static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_BLS,
+	DDP_COMPONENT_DSI0,
+};
+
+static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
+static struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
+	.main_path = mt2701_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
+	.ext_path = mt2701_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
+	.shadow_register = true,
+};
+
 static const struct of_device_id of_match_clk_mt2701_mm[] = {
 	{ .compatible = "mediatek,mt2701-mmsys", },
 	{}
@@ -87,6 +109,7 @@ static const struct of_device_id of_match_clk_mt2701_mm[] = {
 static int clk_mt2701_mm_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
+	struct platform_device *drm;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -101,6 +124,13 @@ static int clk_mt2701_mm_probe(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
+	platform_set_drvdata(pdev, &mt2701_mmsys_driver_data);
+
+	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
+					    PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
 	return r;
 }
 
diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
index 1c5948be35f3..0ae971783997 100644
--- a/drivers/clk/mediatek/clk-mt2712-mm.c
+++ b/drivers/clk/mediatek/clk-mt2712-mm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/platform_data/mtk_mmsys.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
@@ -126,9 +127,45 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM2(CLK_MM_DSI3_DIGITAL, "mm_dsi3_digital", "dsi1_lntc", 6),
 };
 
+static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_OD0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_DPI0,
+	DDP_COMPONENT_PWM0,
+};
+
+static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
+	DDP_COMPONENT_OVL1,
+	DDP_COMPONENT_COLOR1,
+	DDP_COMPONENT_AAL1,
+	DDP_COMPONENT_OD1,
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI1,
+	DDP_COMPONENT_PWM1,
+};
+
+static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
+	DDP_COMPONENT_RDMA2,
+	DDP_COMPONENT_DSI3,
+	DDP_COMPONENT_PWM2,
+};
+
+static struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
+	.main_path = mt2712_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
+	.ext_path = mt2712_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
+	.third_path = mt2712_mtk_ddp_third,
+	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
+};
+
 static int clk_mt2712_mm_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
+	struct platform_device *drm;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -143,6 +180,13 @@ static int clk_mt2712_mm_probe(struct platform_device *pdev)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
 
+	platform_set_drvdata(pdev, &mt2712_mmsys_driver_data);
+
+	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
+					    PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
 	return r;
 }
 
diff --git a/drivers/clk/mediatek/clk-mt8173-mm.c b/drivers/clk/mediatek/clk-mt8173-mm.c
index 83884fd5a750..9136c7f543f1 100644
--- a/drivers/clk/mediatek/clk-mt8173-mm.c
+++ b/drivers/clk/mediatek/clk-mt8173-mm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/platform_data/mtk_mmsys.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
@@ -99,10 +100,37 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
 };
 
+static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_OD0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_UFOE,
+	DDP_COMPONENT_DSI0,
+	DDP_COMPONENT_PWM0,
+};
+
+static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
+	DDP_COMPONENT_OVL1,
+	DDP_COMPONENT_COLOR1,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
+static struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
+	.main_path = mt8173_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
+	.ext_path = mt8173_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
+};
+
 static int clk_mt8173_mm_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct clk_onecell_data *clk_data;
+	struct platform_device *drm;
 	int ret;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
@@ -118,6 +146,13 @@ static int clk_mt8173_mm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	platform_set_drvdata(pdev, &mt8173_mmsys_driver_data);
+
+	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
+					    PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b68837ea02b3..5b60f6b7d710 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -61,88 +61,6 @@ static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
-	DDP_COMPONENT_OVL0,
-	DDP_COMPONENT_RDMA0,
-	DDP_COMPONENT_COLOR0,
-	DDP_COMPONENT_BLS,
-	DDP_COMPONENT_DSI0,
-};
-
-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
-	DDP_COMPONENT_RDMA1,
-	DDP_COMPONENT_DPI0,
-};
-
-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
-	DDP_COMPONENT_OVL0,
-	DDP_COMPONENT_COLOR0,
-	DDP_COMPONENT_AAL0,
-	DDP_COMPONENT_OD0,
-	DDP_COMPONENT_RDMA0,
-	DDP_COMPONENT_DPI0,
-	DDP_COMPONENT_PWM0,
-};
-
-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
-	DDP_COMPONENT_OVL1,
-	DDP_COMPONENT_COLOR1,
-	DDP_COMPONENT_AAL1,
-	DDP_COMPONENT_OD1,
-	DDP_COMPONENT_RDMA1,
-	DDP_COMPONENT_DPI1,
-	DDP_COMPONENT_PWM1,
-};
-
-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
-	DDP_COMPONENT_RDMA2,
-	DDP_COMPONENT_DSI3,
-	DDP_COMPONENT_PWM2,
-};
-
-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
-	DDP_COMPONENT_OVL0,
-	DDP_COMPONENT_COLOR0,
-	DDP_COMPONENT_AAL0,
-	DDP_COMPONENT_OD0,
-	DDP_COMPONENT_RDMA0,
-	DDP_COMPONENT_UFOE,
-	DDP_COMPONENT_DSI0,
-	DDP_COMPONENT_PWM0,
-};
-
-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
-	DDP_COMPONENT_OVL1,
-	DDP_COMPONENT_COLOR1,
-	DDP_COMPONENT_GAMMA,
-	DDP_COMPONENT_RDMA1,
-	DDP_COMPONENT_DPI0,
-};
-
-static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
-	.main_path = mt2701_mtk_ddp_main,
-	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
-	.ext_path = mt2701_mtk_ddp_ext,
-	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
-	.shadow_register = true,
-};
-
-static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
-	.main_path = mt2712_mtk_ddp_main,
-	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
-	.ext_path = mt2712_mtk_ddp_ext,
-	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
-	.third_path = mt2712_mtk_ddp_third,
-	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
-};
-
-static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-	.main_path = mt8173_mtk_ddp_main,
-	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
-	.ext_path = mt8173_mtk_ddp_ext,
-	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
-};
-
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -425,6 +343,7 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *phandle = dev->parent->of_node;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
@@ -435,14 +354,16 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private)
 		return -ENOMEM;
 
-	private->data = of_device_get_match_data(dev);
+	private->data = dev_get_drvdata(dev->parent);
+	if (!private->data)
+		return -ENODEV;
 
-	private->config_regs = syscon_node_to_regmap(dev->of_node);
+	private->config_regs = syscon_node_to_regmap(phandle);
 	if (IS_ERR(private->config_regs))
 		return PTR_ERR(private->config_regs);
 
 	/* Iterate over sibling DISP function blocks */
-	for_each_child_of_node(dev->of_node->parent, node) {
+	for_each_child_of_node(phandle->parent, node) {
 		const struct of_device_id *of_id;
 		enum mtk_ddp_comp_type comp_type;
 		int comp_id;
@@ -576,22 +497,11 @@ static int mtk_drm_sys_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
 			 mtk_drm_sys_resume);
 
-static const struct of_device_id mtk_drm_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_driver_data},
-	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_driver_data},
-	{ }
-};
-
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove	= mtk_drm_remove,
 	.driver	= {
 		.name	= "mediatek-drm",
-		.of_match_table = mtk_drm_of_ids,
 		.pm     = &mtk_drm_pm_ops,
 	},
 };
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
