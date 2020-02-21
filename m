Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8A167C3E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57136F41F;
	Fri, 21 Feb 2020 11:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE3076F41F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 11:33:42 +0000 (UTC)
X-UUID: 052b074eb7614261a01c8e5279b70408-20200221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FEmqX8k1XxKtpg6LtV267K/kVK82s0J/+1oiECAtDr8=; 
 b=eiVtWza7lzxEFCLndw31k7qJIWOII6gD5pjTPkjq/6wrO8p1+SXSIDEU4d+sQdcYZflsnpyx5f0FyhTtRO5o15kP27VGaj+YJFzX3f/1jDUqVL7WuFHyDNDfsJhDCaNLVSR/g9MF9i4E8NNFnZB7U6ykVxUol6xQ2o+9CwF/l8s=;
X-UUID: 052b074eb7614261a01c8e5279b70408-20200221
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 582895744; Fri, 21 Feb 2020 19:28:35 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 21 Feb 2020 19:29:09 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 21 Feb 2020 19:27:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/4] drm/mediatek: dpi dual edge support
Date: Fri, 21 Feb 2020 19:28:26 +0800
Message-ID: <20200221112828.55837-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200221112828.55837-1-jitao.shi@mediatek.com>
References: <20200221112828.55837-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 636B543D83D9CE9FA7A8E41EE0DC7016EB30FCD39AC3129F92B4388D8A2F89C72000:8
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

DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 01fa8b8d763d..36e4dbd27d1b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -75,6 +75,7 @@ struct mtk_dpi {
 	enum mtk_dpi_out_bit_num bit_num;
 	enum mtk_dpi_out_channel_swap channel_swap;
 	int refcount;
+	bool dual_edge;
 };
 
 static inline struct mtk_dpi *mtk_dpi_from_encoder(struct drm_encoder *e)
@@ -348,6 +349,13 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
 }
 
+static void mtk_dpi_enable_dual_edge(struct mtk_dpi *dpi)
+{
+	mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
+		     DDR_EN | DDR_4PHASE);
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, EDGE_SEL, EDGE_SEL);
+}
+
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
@@ -439,7 +447,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	pll_rate = clk_get_rate(dpi->tvd_clk);
 
 	vm.pixelclock = pll_rate / factor;
-	clk_set_rate(dpi->pixel_clk, vm.pixelclock);
+	clk_set_rate(dpi->pixel_clk,
+		     vm.pixelclock * (dpi->dual_edge ? 2 : 1));
 	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
 
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
@@ -504,6 +513,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	mtk_dpi_config_color_format(dpi, dpi->color_format);
 	mtk_dpi_config_2n_h_fre(dpi);
 	mtk_dpi_config_disable_edge(dpi);
+	if (dpi->dual_edge)
+		mtk_dpi_enable_dual_edge(dpi);
 	mtk_dpi_sw_reset(dpi, false);
 
 	return 0;
@@ -689,6 +700,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 	dpi->dev = dev;
 	dpi->conf = (struct mtk_dpi_conf *)of_device_get_match_data(dev);
+	dpi->dual_edge = of_property_read_bool(dev->of_node, "dpi_dual_edge");
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dpi->regs = devm_ioremap_resource(dev, mem);
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
