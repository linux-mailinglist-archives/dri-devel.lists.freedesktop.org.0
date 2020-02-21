Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54D167C3C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BFC6F41D;
	Fri, 21 Feb 2020 11:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 324236F41D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 11:33:44 +0000 (UTC)
X-UUID: 930a4b4ddf6244fcb9076d480a603978-20200221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EXe7y+o2d7iRqWPavTvifj5buUeUDoNRZjUZQ38OTRs=; 
 b=NnLryxhD7hWPE9mnEDLPB+C6iqEmL1G+JR2DwT07Nw1nOSILg87GT0/B0GrXYFVumR4I65f9HxR45hlIJo8mVE1YvLeV6cN1ExpxJ7lUiBRh6RQznltIlwnCEroWVAvUNgToKHH+RdMh/hQt9/bhWiy7SUVZklEzzBLQj/RwaeI=;
X-UUID: 930a4b4ddf6244fcb9076d480a603978-20200221
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1200173710; Fri, 21 Feb 2020 19:28:39 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 21 Feb 2020 19:24:02 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 21 Feb 2020 19:27:37 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 4/4] drm/mediatek: set dpi pin mode to gpio low to avoid
 leakage current
Date: Fri, 21 Feb 2020 19:28:28 +0800
Message-ID: <20200221112828.55837-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200221112828.55837-1-jitao.shi@mediatek.com>
References: <20200221112828.55837-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A8E6822595FF18CCA96293E9D8AAB0CAD367449040DC0B45EFD2AD7116372492000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pull dpi pins low when dpi has nothing to display. Aovid leakage
current from some dpi pins (Hsync Vsync DE ... ).

Some chips have dpi pins, but there are some chip don't have pins.
So this function is controlled by device tree.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e1a33254dfbe..41712e5a721a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -10,7 +10,9 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
@@ -74,8 +76,12 @@ struct mtk_dpi {
 	enum mtk_dpi_out_yc_map yc_map;
 	enum mtk_dpi_out_bit_num bit_num;
 	enum mtk_dpi_out_channel_swap channel_swap;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pins_gpio;
+	struct pinctrl_state *pins_dpi;
 	int refcount;
 	bool dual_edge;
+	bool dpi_pin_ctrl;
 };
 
 static inline struct mtk_dpi *mtk_dpi_from_encoder(struct drm_encoder *e)
@@ -387,6 +393,9 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	if (--dpi->refcount != 0)
 		return;
 
+	if (dpi->dpi_pin_ctrl)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
+
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
@@ -411,6 +420,9 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_pixel;
 	}
 
+	if (dpi->dpi_pin_ctrl)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
+
 	mtk_dpi_enable(dpi);
 	return 0;
 
@@ -716,6 +728,31 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	dpi->dev = dev;
 	dpi->conf = (struct mtk_dpi_conf *)of_device_get_match_data(dev);
 	dpi->dual_edge = of_property_read_bool(dev->of_node, "dpi_dual_edge");
+	dpi->dpi_pin_ctrl = of_property_read_bool(dev->of_node,
+						  "dpi_pin_mode_swap");
+
+	if (dpi->dpi_pin_ctrl) {
+		dpi->pinctrl = devm_pinctrl_get(&pdev->dev);
+		if (IS_ERR(dpi->pinctrl)) {
+			dev_err(&pdev->dev, "Cannot find pinctrl!\n");
+			return PTR_ERR(dpi->pinctrl);
+		}
+
+		dpi->pins_gpio = pinctrl_lookup_state(dpi->pinctrl,
+						      "gpiomode");
+		if (IS_ERR(dpi->pins_gpio)) {
+			dev_err(&pdev->dev, "Cannot find pinctrl gpiomode!\n");
+			return PTR_ERR(dpi->pins_gpio);
+		}
+
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
+
+		dpi->pins_dpi = pinctrl_lookup_state(dpi->pinctrl, "dpimode");
+		if (IS_ERR(dpi->pins_dpi)) {
+			dev_err(&pdev->dev, "Cannot find pinctrl dpimode!\n");
+			return PTR_ERR(dpi->pins_dpi);
+		}
+	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dpi->regs = devm_ioremap_resource(dev, mem);
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
