Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E4581F29
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 06:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB51B1690;
	Wed, 27 Jul 2022 04:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86BC1219
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 04:50:44 +0000 (UTC)
X-UUID: a281cf18aa514473a8cf1ddd6a5010a1-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:4928f49d-2377-4677-af50-715a2630429e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:a2dc7bc9-5f65-4fda-abe9-f2436fed4c72,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: a281cf18aa514473a8cf1ddd6a5010a1-20220727
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 61687357; Wed, 27 Jul 2022 12:50:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 12:50:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 27 Jul 2022 12:50:39 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v15 07/11] drm/mediatek: Add retry to prevent misjudgment for
 sink devices
Date: Wed, 27 Jul 2022 12:50:31 +0800
Message-ID: <20220727045035.32225-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For some DP dungles, we need to train more than onece to confirm that we
don't misjudge the status of sink device.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index ce817cb59445..80d7d6488105 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -42,6 +42,7 @@
 #define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
 #define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
+#define MTK_DP_TRAIN_CLEAR_RETRY 50
 
 struct mtk_dp_train_info {
 	bool tps3;
@@ -1431,11 +1432,25 @@ static int mtk_dp_video_config(struct mtk_dp *mtk_dp)
 
 static int mtk_dp_training(struct mtk_dp *mtk_dp)
 {
+	short max_retry = MTK_DP_TRAIN_CLEAR_RETRY;
 	int ret;
 
-	ret = mtk_dp_train_start(mtk_dp);
-	if (ret)
-		return ret;
+	/*
+	 * We do retry to confirm that we don't misjudge the sink status.
+	 * If it is still failed, we can confirm there are some issues for the
+	 * sink device.
+	 */
+	do {
+		ret = mtk_dp_train_start(mtk_dp);
+		if (!ret)
+			break;
+	} while (--max_retry);
+
+	dev_info(mtk_dp->dev, "dp training clear retry times: %d\n",
+		 MTK_DP_TRAIN_CLEAR_RETRY - max_retry);
+
+	if (!max_retry)
+		return -ETIMEDOUT;
 
 	ret = mtk_dp_video_config(mtk_dp);
 	if (ret)
-- 
2.18.0

