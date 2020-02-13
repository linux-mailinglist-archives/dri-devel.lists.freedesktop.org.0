Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD5915CC0A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 21:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510D86F878;
	Thu, 13 Feb 2020 20:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AE66F878
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 20:21:05 +0000 (UTC)
Received: from ziggy.cz (unknown [37.223.145.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EABA246DF;
 Thu, 13 Feb 2020 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581625265;
 bh=ZI/tFb4x6BCv4qfNVX2na4bTFi0YfD64Z9m/NH97qQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vHNzG2xuW6p2FjjQpvav07lNS2YWexoCTHtkSi9fwBnskGlWiRoZxGCGiy1zB5x+c
 o9tOQSGQcdPRTltYj5Eg9hXgumtjOxmzTU6xFbmpnv2Weehhb6vVVA3b5Zn0RPz9Gf
 GEoANlEkYBHOLpqlMo+3THVsElZlrtgBUXavWcr4=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v7 12/13] clk: mediatek: mt8173: switch mmsys to platform
 device probing
Date: Thu, 13 Feb 2020 21:19:52 +0100
Message-Id: <20200213201953.15268-13-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213201953.15268-1-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, devicetree@vger.kernel.org,
 drinkcat@chromium.org, Thomas Gleixner <tglx@linutronix.de>,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Richard Fontana <rfontana@redhat.com>,
 wens@csie.org, Matthias Brugger <mbrugger@suse.com>,
 linux-mediatek@lists.infradead.org, rdunlap@infradead.org,
 matthias.bgg@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Brugger <mbrugger@suse.com>

Switch probing for the MMSYS to support invocation to a
plain paltform device. The driver will be probed by the DRM subsystem.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

Changes in v7:
- add blank line after declaration
- free clk_data->clks as well
- get rid of private data structure

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/clk/mediatek/clk-mt8173.c | 45 ++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 537a7f49b0f7..0608d9fffef7 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -5,8 +5,11 @@
  */
 
 #include <linux/clk.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -783,7 +786,7 @@ static const struct mtk_gate_regs mm1_cg_regs __initconst = {
 		.ops = &mtk_clk_gate_ops_setclr,		\
 	}
 
-static const struct mtk_gate mm_clks[] __initconst = {
+static const struct mtk_gate mm_clks[] = {
 	/* MM0 */
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
@@ -1144,22 +1147,52 @@ static void __init mtk_imgsys_init(struct device_node *node)
 }
 CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
 
-static void __init mtk_mmsys_init(struct device_node *node)
+static int mtk_mmsys_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
 	int r;
+	struct device_node *node;
+	struct clk_onecell_data *clk_data;
+
+	node = pdev->dev.parent->of_node;
+
+	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
 
-	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-						clk_data);
+	platform_set_drvdata(pdev, clk_data);
+
+	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+
+	return r;
+}
+
+static int mtk_mmsys_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+
+	clk_data = platform_get_drvdata(pdev);
+
+	kfree(clk_data->clks);
+	kfree(clk_data);
+
+	return 0;
 }
-CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
+
+static struct platform_driver clk_mt8173_mm_drv = {
+	.probe = mtk_mmsys_probe,
+	.remove = mtk_mmsys_remove,
+	.driver = {
+		.name = "clk-mt8173-mm",
+	},
+};
+module_platform_driver(clk_mt8173_mm_drv);
 
 static void __init mtk_vdecsys_init(struct device_node *node)
 {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
