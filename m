Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130A193A72
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 09:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7966E2D8;
	Thu, 26 Mar 2020 08:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F006E0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 17:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 699BD296A72
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
Subject: [RESEND PATCH v12 5/5] soc / drm: mediatek: Fix mediatek-drm device
 probing
Date: Wed, 25 Mar 2020 18:31:23 +0100
Message-Id: <20200325173123.3569606-6-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200325173123.3569606-1-enric.balletbo@collabora.com>
References: <20200325173123.3569606-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:08:32 +0000
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
(drivers/soc/mediatek) as well as to the gpu driver
(drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
that the only probed driver is the clock driver and there is no display
at all.

In any case having the same compatible string for two drivers is not
correct and should be fixed. To fix this, and maintain backward
compatibility, we can consider that the mmsys driver is the top-level
entry point for the multimedia subsystem, so is not a pure clock
controller but a system controller, and the drm driver is instantiated
by that MMSYS driver.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Acked-by: CK Hu <ck.hu@mediatek.com>
---

Changes in v12: None
Changes in v10:
- Match driver data to get display routing.

Changes in v9:
- Do not move the display routing from the drm driver (CK)

Changes in v8:
- New patch introduced in this series.

Changes in v7: None

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 31 ++++++++++++++++----------
 drivers/soc/mediatek/mtk-mmsys.c       |  6 +++++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index f2f07098265d..e2bb0d19ef99 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -422,9 +422,21 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	{ }
 };
 
+static const struct of_device_id mtk_drm_of_ids[] = {
+	{ .compatible = "mediatek,mt2701-mmsys",
+	  .data = &mt2701_mmsys_driver_data},
+	{ .compatible = "mediatek,mt2712-mmsys",
+	  .data = &mt2712_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8173-mmsys",
+	  .data = &mt8173_mmsys_driver_data},
+	{ }
+};
+
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *phandle = dev->parent->of_node;
+	const struct of_device_id *of_id;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
@@ -442,8 +454,14 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	of_id = of_match_node(mtk_drm_of_ids, phandle);
+	if (!of_id)
+		return -ENODEV;
+
+	private->data = of_id->data;
+
 	/* Iterate over sibling DISP function blocks */
-	for_each_child_of_node(dev->of_node->parent, node) {
+	for_each_child_of_node(phandle->parent, node) {
 		const struct of_device_id *of_id;
 		enum mtk_ddp_comp_type comp_type;
 		int comp_id;
@@ -577,22 +595,11 @@ static int mtk_drm_sys_resume(struct device *dev)
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
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 4b286b525cd3..32a92ec447c5 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -285,6 +285,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	const struct mtk_mmsys_driver_data *data;
 	struct device *dev = &pdev->dev;
 	struct platform_device *clks;
+	struct platform_device *drm;
 	void __iomem *config_regs;
 	struct resource *mem;
 	int ret;
@@ -307,6 +308,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
 
+	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
+					    PLATFORM_DEVID_AUTO, NULL, 0);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
