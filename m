Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF11897EC5E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 15:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DD110E3F9;
	Mon, 23 Sep 2024 13:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="EPjRaj/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056FC10E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 13:36:20 +0000 (UTC)
X-UUID: ce27fb3479b011efb66947d174671e26-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=awc4i9nMPrTPIYiJ1Q5PrfLytY/PFn2fXwvwl1Rwcs4=; 
 b=EPjRaj/66gUq8kBfjkydiip+a4gjSZZF2DN7Dx8UJrtl0dsG/d89y+s5wy9NAhrVHvrCZT4aNnhP7knq7PLLtT21Mbir7ZgD9/FpsxQ7q4qOFfn5rAb0NYQU52mO+E52F0lkw+vaHhSW1RKZG67/yZytnw6wllCtqnOuGmJr8vE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:4b0809a1-fda1-43e9-aee0-17e3e45ce3b8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:764aa1d0-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ce27fb3479b011efb66947d174671e26-20240923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 992786734; Mon, 23 Sep 2024 21:36:15 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 21:36:13 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Sep 2024 21:36:13 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <mac.shen@mediatek.com>, <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/1] drm/mediatek: dp: Add sdp path reset
Date: Mon, 23 Sep 2024 21:35:44 +0800
Message-ID: <20240923133610.23728-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
-- 
2.45.2

