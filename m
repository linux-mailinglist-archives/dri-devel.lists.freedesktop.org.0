Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B8C5B8176
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 08:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EC310E560;
	Wed, 14 Sep 2022 06:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF2B10E560
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 06:18:42 +0000 (UTC)
X-UUID: 63190785607141fe86f1c6d7e2674836-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=12q/9kAgDbtDNeYaVuoRij+LJ/FfRHkEvUxv5OfPjGI=; 
 b=THGett3rtiTyFyzMAKx7feTLWPRSuK/QIPzlSzNcpR+O+kdURXwHcyebwFzqKiR7Rm5O8/5aUDH7ZJqSE957pRy8a/6llykLNpCc3WgHwxd4jlEpJdxl71hyV9Rd9Kfn6AXIlQ+Yl2zgPPwKN48QgedMRhuleX/eclogkWDFwEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:134cc709-dcf9-4873-be9e-fa65bd5f5aab, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:134cc709-dcf9-4873-be9e-fa65bd5f5aab, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:2efc965d-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:220914141837UPWPJ80P,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
 Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 63190785607141fe86f1c6d7e2674836-20220914
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 378197761; Wed, 14 Sep 2022 14:18:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 14 Sep 2022 14:18:33 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Sep 2022 14:18:31 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm: mediatek: Fix display vblank timeout when disable dsi
Date: Wed, 14 Sep 2022 14:18:29 +0800
Message-ID: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
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
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

Dsi is turned off at bridge.disable, causing crtc to wait for vblank timeout.
It is necessary to add count protection to turn off dsi, and turn off at post_disable.

Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
Base on linux-next.
---
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9cc406e1eee1..157248309c32 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -768,14 +768,6 @@ static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	drm_display_mode_to_videomode(adjusted, &dsi->vm);
 }
 
-static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-
-	mtk_output_dsi_disable(dsi);
-}
-
 static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_bridge_state *old_bridge_state)
 {
@@ -803,12 +795,14 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
+	if (dsi->refcount == 1)
+		mtk_output_dsi_disable(dsi);
+
 	mtk_dsi_poweroff(dsi);
 }
 
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
-	.atomic_disable = mtk_dsi_bridge_atomic_disable,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
@@ -826,6 +820,9 @@ void mtk_dsi_ddp_stop(struct device *dev)
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	if (dsi->refcount == 1)
+		mtk_output_dsi_disable(dsi);
+
 	mtk_dsi_poweroff(dsi);
 }
 
-- 
2.18.0

