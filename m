Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97A6638E6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 06:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFEB10E53D;
	Tue, 10 Jan 2023 05:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CA310E53D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 05:55:07 +0000 (UTC)
X-UUID: af46edba9bec47c0a3473f4aad2cb6a2-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LY4G6QzuBSZZIXQ8TTtTbpZjrWuqx7+js+6/78ZfUYM=; 
 b=cVCHp3JtxJne7COAK8VeVtmMNT78Czxb+5iskzVJTeoBp0a5obkmAI5z1iAnOuA6CD769nFRtPj6RG7pbpobkzqJ5o8pZ3m3fJ0DoS2ptxx9+OPXWZrKx9yj/P+JKSxMgdLt0BPSDWI5TlFEq8MIHU17Ez7as6gOHdkjX2kNMWU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:f2e0d6e4-a9cf-4a29-8b3a-bc501aa0f2d5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.17, REQID:f2e0d6e4-a9cf-4a29-8b3a-bc501aa0f2d5, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:543e81c, CLOUDID:8d4c3154-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:230110135504TINQT6ZI,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0
X-CID-BVR: 0
X-UUID: af46edba9bec47c0a3473f4aad2cb6a2-20230110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2100449791; Tue, 10 Jan 2023 13:55:02 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 13:54:58 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 13:54:57 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>
Subject: [PATCH v2 1/3] drm/mediatek: dsi: Reduce the time of dsi from LP11 to
 sending cmd
Date: Tue, 10 Jan 2023 13:54:51 +0800
Message-ID: <1673330093-6771-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
References: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
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
to see that TLPX is 50ns)

The delay at the end of the mtk_dsi_lane_ready function should be
greater than the 2*TLPX specified by the DSI spec, and less than
the time specified by the DSI_RX (generally 6ms to 40ms), to avoid
problems caused by the RX specification

[1]:mipi_D-PHY_specification_v1-1

Fixes: 39e8d062b03c ("drm/mediatek: Keep dsi as LP00 before dcs cmds transfer")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

