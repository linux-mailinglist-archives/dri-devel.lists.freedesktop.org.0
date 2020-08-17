Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC57A246715
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 15:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E31F6E0D4;
	Mon, 17 Aug 2020 13:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D4BC6E0D4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:11:44 +0000 (UTC)
X-UUID: cc3a7c998d4e41beb86266ca4ca0c93f-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Kc2wbQ5/5ctPeZ+MBcGEqqORVXhdRTfyC3iZHOQDq5c=; 
 b=ja8TmubBv78/qB7FOeuvo3C9/tBdX+EV2uq7cuJQ58QN9JBAue9/G6c44JFV5RF0z6Ido+6i4SoKC0/GiDsGql08SsZ39U+1kAL58NXVp+9yt8NXU5RT+/bfXvHePAEhlR8NQ5Rq6UWPYlSMRiuNE2FD601f//1hTUIjCXEEkLU=;
X-UUID: cc3a7c998d4e41beb86266ca4ca0c93f-20200817
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1227788580; Mon, 17 Aug 2020 21:06:38 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Aug 2020 21:06:36 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 17 Aug 2020 21:06:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small hfp
 or hbp
Date: Mon, 17 Aug 2020 21:06:40 +0800
Message-ID: <20200817130640.18021-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4BE646BE1621BC9DA9C810CAA548159897D201F4DC13F4A0D86FCF88B04C65B62000:8
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

horizontal_backporch_byte should be hbp * bpp - hbp extra bytes.
So remove the wrong subtraction 10.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 270bf22c98fe..5d031e634571 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -473,14 +473,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		horizontal_backporch_byte =
-			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
+		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
 	else
-		horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
-			dsi_tmp_buf_bpp - 10);
+		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+					    dsi_tmp_buf_bpp;
 
 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-			  timing->da_hs_zero + timing->da_hs_exit + 3;
+			  timing->da_hs_zero + timing->da_hs_exit;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
 		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
