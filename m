Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C579E989DEA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DD710E3D3;
	Mon, 30 Sep 2024 09:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="anWrLSmY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69310E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 09:20:11 +0000 (UTC)
X-UUID: 2d8216447f0d11efb66947d174671e26-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yqgHKnptu5bK43gGLrnEqqpfwTrlY1ULN7Za2e2rfGM=; 
 b=anWrLSmYD1+3k4rZ20foGTgJzeg6I44Xk67A341xP3ORVfqRKoi8pGVGkxWaURuSVjuekGi6Z0EUyNn+KXIZ09mhSpR63EfBAJBf+rKr5nKi7Uezx0YUJx62hqUNx5SWlNo4OsuGdOrcbe1LkOn3n3qydIk+UcIm7JxT08CJIHo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:6053cd2a-f12a-4a58-bf0f-ddf7d4b8cc71, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:53617918-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2d8216447f0d11efb66947d174671e26-20240930
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 412980901; Mon, 30 Sep 2024 17:20:04 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 17:20:03 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Sep 2024 17:20:02 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <msp@baylibre.com>,
 <rex-bc.chen@mediatek.com>, <dmitry.osipenko@collabora.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
 <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/1] drm/mediatek: Add return value check when reading DPCD
Date: Mon, 30 Sep 2024 17:17:41 +0800
Message-ID: <20240930092000.5385-1-liankun.yang@mediatek.com>
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

Returns the number of bytes transferred (1) on success.
Check the return value to confirm that AUX communication is successful.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..3cab65345d1e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2018,6 +2018,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
+	size_t value;
 
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
@@ -2032,7 +2033,12 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	 * function, we just need to check the HPD connection to check
 	 * whether we connect to a sink device.
 	 */
-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	value = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	if (value < 0) {
+		drm_err(mtk_dp->drm_dev, "Failed to read DP Sink Count: %zd\n", value);
+		return ret;
+	}
+
 	if (DP_GET_SINK_COUNT(sink_count))
 		ret = connector_status_connected;
 
-- 
2.45.2

