Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368C312464
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 13:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C396E10B;
	Sun,  7 Feb 2021 12:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD3C66E10B
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 12:59:08 +0000 (UTC)
X-UUID: 0dedf375d7e64c299f0d6356f2f19682-20210207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=a310sQCUgDOdkn7zckKGWmxpMKVjRJUxcAXM3gBCOzs=; 
 b=RGqreRw9mprX/j4W47Zfg6TY/gGhBDJbTPv1OqerSXImXNrGes3XJrMmThCzkF83YMKp/d4YEloZe6IxA1CgXwzMteTR7WMKaEpkdkG5wU966Z8JTJpO/51//P9WOG8JNO3a6CjTAWpy0+QFunuv2PKZbhA/NG8sWGAdbqhsO1Y=;
X-UUID: 0dedf375d7e64c299f0d6356f2f19682-20210207
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 991204185; Sun, 07 Feb 2021 20:58:59 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 7 Feb 2021 20:58:53 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 7 Feb 2021 20:58:52 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: [PATCH 1/3] drm/mediatek: mtk_dpi: Add check for max clock rate in
 mode_valid
Date: Sun, 7 Feb 2021 20:58:48 +0800
Message-ID: <20210207125850.155979-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210207125850.155979-1-jitao.shi@mediatek.com>
References: <20210207125850.155979-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C54BD919B85FF8900CD6F4AF46479ECE6B27F0B8370B8FE00BFC5F265680C9362000:8
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
 srv_heupstream@mediatek.com, shuijing.li@mediatek.com, airlied@linux.ie,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add per-platform max clock rate check in mtk_dpi_bridge_mode_valid.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 52f11a63a330..ffa4a0f1989f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -118,6 +118,7 @@ struct mtk_dpi_yc_limit {
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
 	u32 reg_h_fre_con;
+	u32 max_clock_khz;
 	bool edge_sel_en;
 };
 
@@ -555,9 +556,22 @@ static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
 }
 
+static enum drm_mode_status
+mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_mode *mode)
+{
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+
+	if (dpi->conf->max_clock_khz && mode->clock > dpi->conf->max_clock_khz)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.attach = mtk_dpi_bridge_attach,
 	.mode_set = mtk_dpi_bridge_mode_set,
+	.mode_valid = mtk_dpi_bridge_mode_valid,
 	.disable = mtk_dpi_bridge_disable,
 	.enable = mtk_dpi_bridge_enable,
 };
@@ -673,17 +687,20 @@ static unsigned int mt8183_calculate_factor(int clock)
 static const struct mtk_dpi_conf mt8173_conf = {
 	.cal_factor = mt8173_calculate_factor,
 	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 300000,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
 	.cal_factor = mt2701_calculate_factor,
 	.reg_h_fre_con = 0xb0,
 	.edge_sel_en = true,
+	.max_clock_khz = 150000,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
 	.cal_factor = mt8183_calculate_factor,
 	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 100000,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
