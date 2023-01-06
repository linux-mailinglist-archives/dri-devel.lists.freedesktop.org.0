Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E9B65F9EA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 04:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EEE10E82D;
	Fri,  6 Jan 2023 03:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E651B10E82D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 03:05:36 +0000 (UTC)
X-UUID: f65cad4b7d694fb9b51fd19c05521070-20230106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vjjQa6tfGqAYgeZlc/YDNnK2piaGCELP74Iq2RoJg9U=; 
 b=eLa6Q+GeXAaIjv3urHuHTkZjc0fqxuAmBaJRT9bdsCPpeOzT6mLmrk6c7U7SWIRBVQCRmuQwAAZc0T4KhryNE/ItFF/+A6SL/lzICLrpIyWaz2K9a+9geCbYDuDp/+PBfBqBziAp7Ya8l2MZ668Vvxp+xXd+8o4QR2ol1aXEg98=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:f7352c0c-78e5-4c84-9c76-0bdecc274a8b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:543e81c, CLOUDID:f566698b-8530-4eff-9f77-222cf6e2895b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: f65cad4b7d694fb9b51fd19c05521070-20230106
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 631864107; Fri, 06 Jan 2023 11:05:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 6 Jan 2023 11:05:27 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 11:05:26 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>
Subject: [PATCH 1/2] drm/mediatek: dsi: Reduce the time of dsi from LP11 to
 sending cmd
Date: Fri, 6 Jan 2023 11:05:20 +0800
Message-ID: <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Xinlei Lee <xinlei.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

According to Figure 16 Turnaround Procedure on page 36 in [1], you
can see the status of LP-00 -> LP10 -> LP11. This state can correspond
to the state of DSI from LP00 -> LP11 in mtk_dsi_lane_ready function
in mtk_dsi.c.

LP-00 -> LP10 -> LP11 takes about 2*TLPX time (refer to [1] page 51
to see that TLPX is 50ns).

The delay at the end of the mtk_dsi_lane_ready function should be
greater than the 2*TLPX specified by the DSI spec, and less than
the time specified by the DSI_RX (generally 6ms to 40ms), to avoid
problems caused by the RX specification.

[1]:mipi_D-PHY_specification_v1-1

Fixes: 39e8d062b03c ("drm/mediatek: Keep dsi as LP00 before dcs cmds transfer")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7d13028fb6..9e1363c9fcdb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -721,7 +721,7 @@ static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
 		mtk_dsi_clk_ulp_mode_leave(dsi);
 		mtk_dsi_lane0_ulp_mode_leave(dsi);
 		mtk_dsi_clk_hs_mode(dsi, 0);
-		msleep(20);
+		usleep_range(1000, 3000);
 		/* The reaction time after pulling up the mipi signal for dsi_rx */
 	}
 }
-- 
2.18.0

