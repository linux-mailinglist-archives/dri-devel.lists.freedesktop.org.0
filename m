Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30E87BA9C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 10:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B56010F9FB;
	Thu, 14 Mar 2024 09:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="NEZVlngE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAD810F9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 09:41:51 +0000 (UTC)
X-UUID: 128c7898e1e711eeb8927bc1f75efef4-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YlZ5XiSrQtfZyIf42XjcQHUar2YIBT2LQ8deb92YJ2g=; 
 b=NEZVlngEWXZZ7VwOVwilUmTjauAAw6FQTE5qH56xL8lxdCv9rDirIWZpM5G/gMd17xV544dT2tsFJx6Eo5K6Cs8eLoouITd5b/gLGGbYG3ThAVNHeU6KCwqglaUDvYyt3xQqg52vKZF8V/2BvX+4iZhB8m4n11xBmhPHYLayGo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:9026bdd4-1420-4a9d-ade9-a089e5b744bc, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:4b446690-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 128c7898e1e711eeb8927bc1f75efef4-20240314
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 788159177; Thu, 14 Mar 2024 17:41:45 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 17:41:44 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 17:41:44 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
 <shuijing.li@mediatek.com>
Subject: [PATCH] mediatek: dsi: Add dsi per-frame lp code for mt8188
Date: Thu, 14 Mar 2024 17:41:55 +0800
Message-ID: <20240314094238.3315-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.397200-8.000000
X-TMASE-MatchedRID: S534RugKI8kwKP61E4rxu1VN8laWo90M5TpDO1WKs2mYQOVjVNfbbkeC
 RUBS/4NPo5qw/iFKtvYWHIQM6TbbE5Rho78T5P9D4pdq9sdj8LXlNvCpVWkX4+8+PNqCaHTUQ5K
 Zv/QHc1GfUW6RBS3uLULpsu+J7FFsoT61G3YSs7mQ+gWwzffozrn7V+KB+3cumyiLZetSf8lRN1
 j+Z19Ne0kpbiYOUmwxwrbXMGDYqV/Ix3Icp6zuW/Y8Q+obMpZDGRigQm9wRcMFWmWkIG9aWWkGC
 AUz36Zl
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.397200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 967D6EFB6CEC7F978B2E6FDC292789DF1CF8A4A7AC9EBA50C3B0564A1B37B9FE2000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding the per-frame lp function of mt8188, which can keep HFP in HS and
reduce the time required for each line to enter and exit low power.
Per Frame LP:
  |<----------One Active Frame-------->|
--______________________________________----___________________
  ^HSA+HBP^^RGB^^HFP^^HSA+HBP^^RGB^^HFP^    ^HSA+HBP^^RGB^^HFP^

Per Line LP:
  |<---------------One Active Frame----------->|
--______________--______________--______________----______________
  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^    ^HSA+HBP^^RGB^

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 100 +++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a2fdfc8ddb15..e6f4807c8711 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -83,6 +83,7 @@
 #define DSI_HSA_WC		0x50
 #define DSI_HBP_WC		0x54
 #define DSI_HFP_WC		0x58
+#define DSI_BLLP_WC		0x5C
 
 #define DSI_CMDQ_SIZE		0x60
 #define CMDQ_SIZE			0x3f
@@ -180,6 +181,7 @@ struct mtk_dsi_driver_data {
 	bool has_shadow_ctl;
 	bool has_size_ctl;
 	bool cmdq_long_packet_ctl;
+	bool support_per_frame_lp;
 };
 
 struct mtk_dsi {
@@ -516,6 +518,103 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
 	}
 
+	if (dsi->driver_data->support_per_frame_lp) {
+		unsigned int lpx = 0, da_hs_exit = 0, da_hs_prep = 0, da_hs_trail = 0;
+		unsigned int da_hs_zero = 0, ps_wc = 0, hs_vb_ps_wc = 0;
+		u32 bllp_wc, bllp_en, v_active_roundup, hstx_cklp_wc;
+		u32 hstx_cklp_wc_max, hstx_cklp_wc_min;
+
+		da_hs_trail = (readl(dsi->regs + DSI_PHY_TIMECON0) >> 24) & 0xff;
+		bllp_en = (readl(dsi->regs + DSI_TXRX_CTRL) >> 7) & 0x1;
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+			horizontal_sync_active_byte =
+				(vm->hsync_len * dsi_tmp_buf_bpp - 10);
+			horizontal_backporch_byte =
+				(vm->hback_porch * dsi_tmp_buf_bpp - 10);
+			horizontal_frontporch_byte =
+				(vm->hfront_porch * dsi_tmp_buf_bpp - 12);
+
+			ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
+			v_active_roundup = (32 + horizontal_sync_active_byte +
+				horizontal_backporch_byte + ps_wc +
+				horizontal_frontporch_byte) % dsi->lanes;
+			if (v_active_roundup)
+				horizontal_backporch_byte = horizontal_backporch_byte +
+					dsi->lanes - v_active_roundup;
+			hstx_cklp_wc_min = (DIV_ROUND_UP((12 + 2 + 4 +
+				horizontal_sync_active_byte), dsi->lanes) + da_hs_trail + 1)
+				* dsi->lanes / 6 - 1;
+			hstx_cklp_wc_max = (DIV_ROUND_UP((20 + 6 + 4 +
+				horizontal_sync_active_byte + horizontal_backporch_byte +
+				ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+		} else {
+			horizontal_sync_active_byte = vm->hsync_len * dsi_tmp_buf_bpp - 4;
+
+			horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+				dsi_tmp_buf_bpp - 10;
+			hstx_cklp_wc_min = (DIV_ROUND_UP(4, dsi->lanes) + da_hs_trail + 1)
+				* dsi->lanes / 6 - 1;
+
+			if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+				ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
+				bllp_wc = readl(dsi->regs + DSI_BLLP_WC) & 0xfff;
+				horizontal_frontporch_byte = (vm->hfront_porch *
+					dsi_tmp_buf_bpp - 18);
+
+				v_active_roundup = (28 + horizontal_backporch_byte + ps_wc +
+					horizontal_frontporch_byte + bllp_wc) % dsi->lanes;
+				if (v_active_roundup)
+					horizontal_backporch_byte = horizontal_backporch_byte +
+					dsi->lanes - v_active_roundup;
+				if (bllp_en) {
+					hstx_cklp_wc_max = (DIV_ROUND_UP((16 + 6 + 4 +
+						horizontal_backporch_byte + bllp_wc + ps_wc),
+						dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+				} else {
+					hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
+						horizontal_backporch_byte + bllp_wc + ps_wc),
+						dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+				}
+			} else {
+				ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
+				horizontal_frontporch_byte = (vm->hfront_porch *
+					dsi_tmp_buf_bpp - 12);
+
+				v_active_roundup = (22 + horizontal_backporch_byte + ps_wc +
+					horizontal_frontporch_byte) % dsi->lanes;
+				if (v_active_roundup)
+					horizontal_backporch_byte = horizontal_backporch_byte +
+					dsi->lanes - v_active_roundup;
+
+				hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
+					horizontal_backporch_byte + ps_wc),
+					dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+			}
+		}
+		hstx_cklp_wc = (readl(dsi->regs + DSI_HSTX_CKL_WC) >> 2) & 0x3fff;
+		if (hstx_cklp_wc <= hstx_cklp_wc_min ||
+			hstx_cklp_wc >= hstx_cklp_wc_max) {
+			hstx_cklp_wc = (hstx_cklp_wc_max / 2) << 2;
+			writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
+		}
+		hstx_cklp_wc = hstx_cklp_wc >> 2;
+		if (hstx_cklp_wc <= hstx_cklp_wc_min ||
+			hstx_cklp_wc >= hstx_cklp_wc_max) {
+			DRM_WARN("Wrong setting of hstx_ckl_wc\n");
+		}
+
+		lpx = readl(dsi->regs + DSI_PHY_TIMECON0) & 0xff;
+		da_hs_exit = (readl(dsi->regs + DSI_PHY_TIMECON1) >> 24) & 0xff;
+		da_hs_prep = (readl(dsi->regs + DSI_PHY_TIMECON0) >> 8) & 0xff;
+		da_hs_zero = (readl(dsi->regs + DSI_PHY_TIMECON0) >> 16) & 0xff;
+		ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
+		hs_vb_ps_wc = ps_wc -
+			(lpx + da_hs_exit + da_hs_prep + da_hs_zero + 2)
+			* dsi->lanes;
+		horizontal_frontporch_byte = (1 << 31)
+			| (hs_vb_ps_wc << 16)
+			| (horizontal_frontporch_byte);
+	}
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
@@ -1246,6 +1345,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-- 
2.43.0

