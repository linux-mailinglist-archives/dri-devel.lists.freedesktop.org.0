Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F628CB65
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1716E8B6;
	Tue, 13 Oct 2020 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B6B06E8B6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:06:37 +0000 (UTC)
X-UUID: c6152e5b48e4459aa240ee66ed384361-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IdZVCR93POltzpR5uqVn2DxtLqlhGyIYZmIkhZH+wys=; 
 b=H1r5m/r/lLfBOOOXwYwTKx7JKRArPDoiyn6Qp+urvT08Q/7YoGxMVsbNVg0Mnv3raU6JjWQ0ccOzB94FDnxUd6X8lvSRXhXh8B49xmBPXpcble53CzRwZhUVt5D0ppon2eIPAxkK21TEaO37NrJl6J97iHaV/g7UoEpxo8grxbE=;
X-UUID: c6152e5b48e4459aa240ee66ed384361-20201013
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1930931102; Tue, 13 Oct 2020 18:06:31 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Oct 2020 18:06:29 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 13 Oct 2020 18:06:28 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/1] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
Date: Tue, 13 Oct 2020 18:06:25 +0800
Message-ID: <20201013100625.13056-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20201013100625.13056-1-jitao.shi@mediatek.com>
References: <20201013100625.13056-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 011E660719FE93D9230AC69411231753C59D8B81CDE7FE0ED9AB557A7C9E98D52000:8
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

Replace horizontal_backporch_byte with vm->hback_porch * bpp to aovid
flowing judgement negative number.

if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
	data_phy_cycles * dsi->lanes + delta)

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 65 +++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 80b7a082e874..ddddf69ebeaf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -445,6 +445,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	u32 horizontal_backporch_byte;
 	u32 horizontal_frontporch_byte;
 	u32 dsi_tmp_buf_bpp, data_phy_cycles;
+	u32 delta;
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
 	struct videomode *vm = &dsi->vm;
@@ -466,50 +467,34 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
+		horizontal_backporch_byte =
+			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
 	else
-		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
-					    dsi_tmp_buf_bpp;
+		horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
+			dsi_tmp_buf_bpp - 10);
 
 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-			  timing->da_hs_zero + timing->da_hs_exit;
-
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
-		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-		    data_phy_cycles * dsi->lanes + 18) {
-			horizontal_frontporch_byte =
-				vm->hfront_porch * dsi_tmp_buf_bpp -
-				(data_phy_cycles * dsi->lanes + 18) *
-				vm->hfront_porch /
-				(vm->hfront_porch + vm->hback_porch);
-
-			horizontal_backporch_byte =
-				horizontal_backporch_byte -
-				(data_phy_cycles * dsi->lanes + 18) *
-				vm->hback_porch /
-				(vm->hfront_porch + vm->hback_porch);
-		} else {
-			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp;
-		}
+			  timing->da_hs_zero + timing->da_hs_exit + 3;
+
+	delta = (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) ? 18 : 12;
+
+	if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
+	    data_phy_cycles * dsi->lanes + delta) {
+		horizontal_frontporch_byte =
+			vm->hfront_porch * dsi_tmp_buf_bpp -
+			(data_phy_cycles * dsi->lanes + delta) *
+			vm->hfront_porch /
+			(vm->hfront_porch + vm->hback_porch);
+
+		horizontal_backporch_byte =
+			horizontal_backporch_byte -
+			(data_phy_cycles * dsi->lanes + delta) *
+			vm->hback_porch /
+			(vm->hfront_porch + vm->hback_porch);
 	} else {
-		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-		    data_phy_cycles * dsi->lanes + 12) {
-			horizontal_frontporch_byte =
-				vm->hfront_porch * dsi_tmp_buf_bpp -
-				(data_phy_cycles * dsi->lanes + 12) *
-				vm->hfront_porch /
-				(vm->hfront_porch + vm->hback_porch);
-			horizontal_backporch_byte = horizontal_backporch_byte -
-				(data_phy_cycles * dsi->lanes + 12) *
-				vm->hback_porch /
-				(vm->hfront_porch + vm->hback_porch);
-		} else {
-			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp;
-		}
+		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
+		horizontal_frontporch_byte = vm->hfront_porch *
+					     dsi_tmp_buf_bpp;
 	}
 
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
