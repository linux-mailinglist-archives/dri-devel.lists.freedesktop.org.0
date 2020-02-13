Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C027E15CC07
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 21:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B226F877;
	Thu, 13 Feb 2020 20:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5186F877
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 20:21:00 +0000 (UTC)
Received: from ziggy.cz (unknown [37.223.145.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DA9A246F0;
 Thu, 13 Feb 2020 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581625260;
 bh=QWH8uHfa04WTzsuK5InTTol9f23wneBlj2cLpRPgIgk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PhhsXLa3KmlJkZJuDXZmmiheCpqFjqlziN12X6Wxxm/7Aa3v7WHGgv/j1BMhY9+6X
 jGdwf2PZ8UhV/oKBqKTZbekPSDV+jeMxt2a+0e3yMXEwAe9pQoeoN/hG8KWIxjfMg7
 XP8wooTwiuzzAhQKeiOPMjQqgWVmYlO92pEJMpxk=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v7 11/13] clk: mediatek: mt8183: switch mmsys to platform
 device probing
Date: Thu, 13 Feb 2020 21:19:51 +0100
Message-Id: <20200213201953.15268-12-matthias.bgg@kernel.org>
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 rdunlap@infradead.org, matthias.bgg@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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
- free clk_data->clks as well
- get rid of private data structure

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/clk/mediatek/clk-mt8183-mm.c | 30 ++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
index 720c696b506d..7576cd231be3 100644
--- a/drivers/clk/mediatek/clk-mt8183-mm.c
+++ b/drivers/clk/mediatek/clk-mt8183-mm.c
@@ -3,8 +3,10 @@
 // Copyright (c) 2018 MediaTek Inc.
 // Author: Weiyi Lu <weiyi.lu@mediatek.com>
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -85,27 +87,35 @@ static const struct mtk_gate mm_clks[] = {
 static int clk_mt8183_mm_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.parent->of_node;
+
+	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	platform_set_drvdata(pdev, clk_data);
 
-	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-			clk_data);
+	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
 
 	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
 
-static const struct of_device_id of_match_clk_mt8183_mm[] = {
-	{ .compatible = "mediatek,mt8183-mmsys", },
-	{}
-};
+static int clk_mt8183_mm_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	kfree(clk_data->clks);
+	kfree(clk_data);
+
+	return 0;
+}
 
 static struct platform_driver clk_mt8183_mm_drv = {
 	.probe = clk_mt8183_mm_probe,
+	.remove = clk_mt8183_mm_remove,
 	.driver = {
 		.name = "clk-mt8183-mm",
-		.of_match_table = of_match_clk_mt8183_mm,
 	},
 };
-
-builtin_platform_driver(clk_mt8183_mm_drv);
+module_platform_driver(clk_mt8183_mm_drv);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
