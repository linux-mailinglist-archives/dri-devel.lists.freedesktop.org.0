Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD032C42374
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3495810E190;
	Sat,  8 Nov 2025 01:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="cBUBWn8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5865E10E1B1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010508euoutp01dc2b67d14c1b53928a16c8684ecf6d73~14ok6O3y_2865928659euoutp01D;
 Sat,  8 Nov 2025 01:05:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251108010508euoutp01dc2b67d14c1b53928a16c8684ecf6d73~14ok6O3y_2865928659euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563908;
 bh=/eyZIya/HIfK89auuWlHX84i/8cBpJh5L9ub7bFaqG8=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=cBUBWn8uVSJzCxa4NgR1ygGTnu5WDyC0HEYLj8v4mSTykTOhQ8I7I0CstTkcIxWkv
 3Oh9ZW3bVZNK7uAEMhxhjo4JEz8yZXkVSMoxF6xRnOw1R8cYMwAfE4+weO/q5rfsEi
 ax3PSVUCVIW/hakc7ilTrtOnh0KYywO24WGl73XE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010507eucas1p2aa5a2604f24e4cee2c116dd35f1132d5~14okorMVd2536425364eucas1p2w;
 Sat,  8 Nov 2025 01:05:07 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010506eusmtip2847c7391dcf190be3df6da4bb4c52597~14ojQJ1QU0912409124eusmtip2X;
 Sat,  8 Nov 2025 01:05:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:44 +0100
Subject: [PATCH RFC 10/13] clk: starfive: voutcrg: Update the voutcrg
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-10-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010507eucas1p2aa5a2604f24e4cee2c116dd35f1132d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010507eucas1p2aa5a2604f24e4cee2c116dd35f1132d5
X-EPHeader: CA
X-CMS-RootMailID: 20251108010507eucas1p2aa5a2604f24e4cee2c116dd35f1132d5
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010507eucas1p2aa5a2604f24e4cee2c116dd35f1132d5@eucas1p2.samsung.com>
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

Update the voutcrg driver to support the new MFD HDMI model. The
hdmitx0_pixelclk is now supplied by the starfive-inno-hdmi-phy driver.

This patch updates the MUX definitions for dc8200_pix0 and dc8200_pix1
to add the CLK_SET_RATE_PARENT flag. This allows the dc8200 driver to
set the pixel clock rate, which will be correctly propagated to the
parent.

Remove the pm_runtime calls, as power management is now handled by the
vout-subsystem parent wrapper.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-vout.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index bad20d5d794a72f071b4d547b7304786a8ba9afa..6175f94ff4113088696ba1dfbe5080609733fb76 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -9,7 +9,6 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
@@ -40,10 +39,10 @@ static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
-	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", CLK_SET_RATE_PARENT, 2,
 		    JH7110_VOUTCLK_DC8200_PIX,
 		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
-	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", CLK_SET_RATE_PARENT, 2,
 		    JH7110_VOUTCLK_DC8200_PIX,
 		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
 	/* LCD */
@@ -133,12 +132,6 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
 		return dev_err_probe(priv->dev, ret, "failed to get top clocks\n");
 	dev_set_drvdata(priv->dev, top);
 
-	/* enable power domain and clocks */
-	pm_runtime_enable(priv->dev);
-	ret = pm_runtime_resume_and_get(priv->dev);
-	if (ret < 0)
-		return dev_err_probe(priv->dev, ret, "failed to turn on power\n");
-
 	ret = jh7110_vout_top_rst_init(priv);
 	if (ret)
 		goto err_exit;
@@ -194,17 +187,9 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
 	return 0;
 
 err_exit:
-	pm_runtime_put_sync(priv->dev);
-	pm_runtime_disable(priv->dev);
 	return ret;
 }
 
-static void jh7110_voutcrg_remove(struct platform_device *pdev)
-{
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-}
-
 static const struct of_device_id jh7110_voutcrg_match[] = {
 	{ .compatible = "starfive,jh7110-voutcrg" },
 	{ /* sentinel */ }
@@ -213,7 +198,6 @@ MODULE_DEVICE_TABLE(of, jh7110_voutcrg_match);
 
 static struct platform_driver jh7110_voutcrg_driver = {
 	.probe = jh7110_voutcrg_probe,
-	.remove = jh7110_voutcrg_remove,
 	.driver = {
 		.name = "clk-starfive-jh7110-vout",
 		.of_match_table = jh7110_voutcrg_match,

-- 
2.34.1

