Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ADD30A0AC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 04:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC2A6E3DB;
	Mon,  1 Feb 2021 03:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA60B6E3DB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 03:48:05 +0000 (UTC)
X-UUID: 5e1ee2eb50a74496b375a3ef7e447988-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ycki3f22lu0G/Y5pcD1WAXwXxWSc4abbISJZOTSNMNc=; 
 b=pDOFhhxmjFLzOmwmHC4x9N38et/+Q01E1gSTzVtbD/xVJLLYDaoSXHkNsVS3sI1srpQ0GSORnxDwTEwdyvH3MBv+ELeNA98fRQUjHCZF9qvgP4cmRkLawcHYAjCffp6Vdr7HNcQnW61jSbxw6ws3DtrXsvP4NLROvku/oxEc4NY=;
X-UUID: 5e1ee2eb50a74496b375a3ef7e447988-20210201
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1357974449; Mon, 01 Feb 2021 11:48:02 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Feb 2021 11:47:58 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 1 Feb 2021 11:47:57 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/mediatek: fine tune the data lane trail by project dts
Date: Mon, 1 Feb 2021 11:47:55 +0800
Message-ID: <20210201034755.15793-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: C09D5F74431AB1B049045EEA52CC4FCA78AF2ACAE1755FA553EE30718D904CAA2000:8
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
 cawa.cheng@mediatek.com, shuijing.li@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panels or bridges require customized hs_da_trail time.
So add a property in devicetree for this panels and bridges.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8c70ec39bfe1..6e7092fa2fee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -194,6 +194,7 @@ struct mtk_dsi {
 	struct clk *hs_clk;
 
 	u32 data_rate;
+	u32 da_trail_delta;
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
@@ -234,7 +235,7 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
 	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
 			     timing->da_hs_prepare;
-	timing->da_hs_trail = timing->da_hs_prepare + 1;
+	timing->da_hs_trail = timing->da_hs_prepare + 1 + dsi->da_trail_delta;
 
 	timing->ta_go = 4 * timing->lpx - 2;
 	timing->ta_sure = timing->lpx + 2;
@@ -1094,6 +1095,13 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
+	ret = of_property_read_u32_index(dev->of_node, "da_trail_delta", 0,
+					 &dsi->da_trail_delta);
+	if (ret) {
+		dev_info(dev, "Can't get da_trail_delta, keep it as 0: %d\n", ret);
+		dsi->da_trail_delta = 0;
+	}
+
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DSI);
 	if (comp_id < 0) {
 		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
