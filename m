Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB598409F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989C510E250;
	Tue, 24 Sep 2024 08:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Ww8nzr5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4C010E250
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:37:27 +0000 (UTC)
X-UUID: 37da9c867a5011ef8b96093e013ec31c-20240924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RFKse33bVyj6tr/j2FmmM+PywrwloeXvcVJpsb1oyjI=; 
 b=Ww8nzr5NEwSPb1Spl+Vfctlxu4sxNV9+n3GwMZNChOetZjodMz4e4KlsZwDzR/NoRw/TxRC69Wi6S9SNq3sp7hW/KtWtFccBw/7q/9vEKitL0VitG9+OFCeFwqZ83y16u6DTfBFFA2E5BgDDWhwlIkAl1tplX1ysU5CYH5iNGN4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:c5ac257f-48f2-4de5-879f-0172a461e47e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:99cc799e-8e9a-4ac1-b510-390a86b53c0a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 37da9c867a5011ef8b96093e013ec31c-20240924
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1191929754; Tue, 24 Sep 2024 16:37:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Sep 2024 16:37:19 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Sep 2024 16:37:18 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <mac.shen@mediatek.com>, <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/1] drm/mediatek: dp: Add sdp path reset
Date: Tue, 24 Sep 2024 16:36:54 +0800
Message-ID: <20240924083715.18620-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.384900-8.000000
X-TMASE-MatchedRID: WY68sLfT96+vhOOX3csmVw0QY5VnQyAN9Nx/wC/5BIBo5YsPsbyLXXXd
 7xOm1pHBYANd3JpXt1kfa5XD5KFxZiQVVteP90CtA9lly13c/gH0O7M3lSnTWxhaPDHak0t0SiQ
 Px3glce+z5IDnlmXN1tGOOjWlEJnP5VtV90uxxtevnWBILruGlb8+q17GFLKRmyiLZetSf8mfop
 0ytGwvXiq2rl3dzGQ1TrlEol4h4lC3oCWJhxIRfcXeCu11IsYu6FPo4fJ/22M2UV6B6JBSbQwuN
 BCUbKSDoIyPQP1QgCU+ezTX+dvNJYf5V4Hq5oCJIy3mhHtdzn7zYaPZALfIbSyZdUr8fx4fMbuy
 vvGhtIDNwMS8lpRKBQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.384900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 02FFDA97D622B77700B36D1EABF147460371935D6AA372804DCA03058C13B0F02000:8
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

When using type-c to type-c to connect to the monitor,
the sound plays normally. If you unplug the type-c and
connect the type-c to hdmi dongle to the monitor, there will be noise.

By capturing the audio data, it is found that
the data position is messy, and there is no error in the data.

Through experiments, it can be restored by resetting the SDP path
when unplugging it.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Changes in V2:
- Fix build error.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240923133610.23728-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 15 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..4003bd83f64e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1052,6 +1052,18 @@ static void mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
 			   0, DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0);
 }
 
+static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
+				SDP_RESET_SW_DP_ENC0_P0,
+				SDP_RESET_SW_DP_ENC0_P0);
+
+	/* Wait for sdp path reset to complete */
+	usleep_range(1000, 5000);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
+				0, SDP_RESET_SW_DP_ENC0_P0);
+}
+
 static void mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35F0,
@@ -2314,6 +2326,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 			   DP_PWR_STATE_BANDGAP_TPLL,
 			   DP_PWR_STATE_MASK);
 
+	/* SDP path reset sw*/
+	mtk_dp_sdp_path_reset(mtk_dp);
+
 	/* Ensure the sink is muted */
 	msleep(20);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 709b79480693..47b283fcb341 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -86,6 +86,7 @@
 #define MTK_DP_ENC0_P0_3004			0x3004
 #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK		BIT(8)
 #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0		BIT(9)
+#define SDP_RESET_SW_DP_ENC0_P0			BIT(13)
 #define MTK_DP_ENC0_P0_3010			0x3010
 #define HTOTAL_SW_DP_ENC0_P0_MASK			GENMASK(15, 0)
 #define MTK_DP_ENC0_P0_3014			0x3014
-- 
2.45.2

