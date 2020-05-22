Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5301DE40D
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 12:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E536E9B9;
	Fri, 22 May 2020 10:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Fri, 22 May 2020 10:17:35 UTC
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id D24416E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 10:17:35 +0000 (UTC)
X-UUID: aa7538676fed4a19805128da08b1b442-20200522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6VbmeS/yrB1shYHBD+b0ArTurRXYrmNDPa81/IwQ/tI=; 
 b=rORpKnmyumfflCfytKRhmTVJuOy37KS2lD8cDOBpUqY+wnPY2vyfA2ykKfT5mf2A+X1gqZnpTFpVToJy2FBBiKVq2Zo71jMj/70kcdFcwmol6zDWei2libtTVIoeHsKl3/oiu96t94bSBQVHcgHCQU2Xcm9n3I3Tzx7Ep5jP0lw=;
X-UUID: aa7538676fed4a19805128da08b1b442-20200522
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1393466909; Fri, 22 May 2020 18:12:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 May 2020 18:12:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 22 May 2020 18:12:24 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/mediatek: dsi: fix scrolling of panel with small hfp or
 hbp
Date: Fri, 22 May 2020 18:12:25 +0800
Message-ID: <20200522101225.62571-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9EFD99E22082E0674480556A643F1BD34B12751A45F5F49297FAC1342418AC822000:8
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

If panel has too small hfp or hbp, horizontal_frontporch_byte or
horizontal_backporch_byte may become very small value or negative
value. This patch adjusts their values so that they are greater
than minimum value and keep total of them unchanged.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0ede69830a9d..aebaafd90ceb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -148,6 +148,9 @@
 	(type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
 	(type == MIPI_DSI_DCS_READ))
 
+#define MIN_HFP_BYTE		0x02
+#define MIN_HBP_BYTE		0x02
+
 struct mtk_phy_timing {
 	u32 lpx;
 	u32 da_hs_prepare;
@@ -450,6 +453,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	u32 horizontal_sync_active_byte;
 	u32 horizontal_backporch_byte;
 	u32 horizontal_frontporch_byte;
+	s32 signed_hfp_byte, signed_hbp_byte;
 	u32 dsi_tmp_buf_bpp, data_phy_cycles;
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
@@ -519,6 +523,20 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 		}
 	}
 
+	signed_hfp_byte = (s32)horizontal_frontporch_byte;
+	signed_hbp_byte = (s32)horizontal_backporch_byte;
+
+	if (signed_hfp_byte + signed_hbp_byte < MIN_HFP_BYTE + MIN_HBP_BYTE) {
+		DRM_WARN("Calculated hfp_byte and hbp_byte are too small, "
+			 "panel may not work properly.\n");
+	} else if (signed_hfp_byte < MIN_HFP_BYTE) {
+		horizontal_frontporch_byte = MIN_HFP_BYTE;
+		horizontal_backporch_byte -= MIN_HFP_BYTE - signed_hfp_byte;
+	} else if (signed_hbp_byte < MIN_HBP_BYTE) {
+		horizontal_frontporch_byte -= MIN_HBP_BYTE - signed_hbp_byte;
+		horizontal_backporch_byte = MIN_HBP_BYTE;
+	}
+
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
