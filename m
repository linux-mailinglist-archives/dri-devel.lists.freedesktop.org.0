Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01334ED02
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318606E92D;
	Tue, 30 Mar 2021 15:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A07E66E92B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 15:58:50 +0000 (UTC)
X-UUID: cdfcb64d03e249b68ac9cf69be0be67d-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Wr7OqfMZ053MusTJu/z+VocLvngnE0TDREtT13ee894=; 
 b=P6AF6UVnsg5ccVpaHqw+Mv/WrX1xihFP/yybTX4o9QcJCjy9Xh/CJRK6Duuso6slZMXPuEOzaNgdhKONRk6zxU9bd7wErdsWaHUv8q0u6OU3f10FMydKKNbCsjqteZZbO3EvYtE9EG+tN6EPjBQ+UPrT4pL63ndwXRue1uIDCpQ=;
X-UUID: cdfcb64d03e249b68ac9cf69be0be67d-20210330
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1627379242; Tue, 30 Mar 2021 23:53:44 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Mar 2021 23:53:34 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 30 Mar 2021 23:53:34 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
Date: Tue, 30 Mar 2021 23:53:28 +0800
Message-ID: <20210330155330.28759-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20210330155330.28759-1-jitao.shi@mediatek.com>
References: <20210330155330.28759-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4E04AEDD8294558B6CA67C7A5725B4939BD2C14C727429A5AA679777471F38242000:8
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
 cawa.cheng@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPI can sample on falling, rising or both edge.
When DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 52f11a63a330..ccd681a2a4c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -81,6 +81,7 @@ struct mtk_dpi {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_gpio;
 	struct pinctrl_state *pins_dpi;
+	bool ddr_edge_sel;
 	int refcount;
 };
 
@@ -119,6 +120,7 @@ struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
 	u32 reg_h_fre_con;
 	bool edge_sel_en;
+	bool dual_edge;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -378,6 +380,15 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	}
 }
 
+static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
+{
+	if (dpi->conf->dual_edge) {
+		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
+			     DDR_EN | DDR_4PHASE);
+		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, dpi->ddr_edge_sel ? EDGE_SEL : 0, EDGE_SEL);
+	}
+}
+
 static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 {
 	if (WARN_ON(dpi->refcount == 0))
@@ -516,6 +527,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 	mtk_dpi_config_color_format(dpi, dpi->color_format);
 	mtk_dpi_config_2n_h_fre(dpi);
+	mtk_dpi_dual_edge(dpi);
 	mtk_dpi_config_disable_edge(dpi);
 	mtk_dpi_sw_reset(dpi, false);
 
-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
