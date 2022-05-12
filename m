Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988B5245C9
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 08:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FF010E5C0;
	Thu, 12 May 2022 06:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC3510E3F8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 06:30:25 +0000 (UTC)
X-UUID: d191059cde8742f8bb9e173833a27648-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:6210e0bb-7a77-4aa8-8470-0354b09a5a2e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:bd38eff1-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d191059cde8742f8bb9e173833a27648-20220512
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 139098106; Thu, 12 May 2022 14:30:20 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 14:30:19 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 14:30:19 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 12 May 2022 14:30:18 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [PATCH v6,
 2/4] drm/mediatek: Separate poweron/poweroff from enable/disable and
 define new funcs
Date: Thu, 12 May 2022 14:30:10 +0800
Message-ID: <1652337012-9053-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
References: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, Xinlei Lee <xinlei.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jitao Shi <jitao.shi@mediatek.com>

In order to match the changes of "Use the drm_panel_bridge API",
the poweron/poweroff of dsi is extracted from enable/disable and
defined as new funcs (atomic_pre_enable/atomic_post_disable).

Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index f880136cec09..d9a6b928dba8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	if (--dsi->refcount != 0)
 		return;
 
-	/*
-	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
-	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
-	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
-	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
-	 * after dsi is fully set.
-	 */
-	mtk_dsi_stop(dsi);
-
-	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
@@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 {
-	int ret;
-
 	if (dsi->enabled)
 		return;
 
-	ret = mtk_dsi_poweron(dsi);
-	if (ret < 0) {
-		DRM_ERROR("failed to power on dsi\n");
-		return;
-	}
-
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
 
@@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 	if (!dsi->enabled)
 		return;
 
-	mtk_dsi_poweroff(dsi);
+	/*
+	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
+	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
+	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
+	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
+	 * after dsi is fully set.
+	 */
+	mtk_dsi_stop(dsi);
+
+	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 
 	dsi->enabled = false;
 }
@@ -776,13 +767,37 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
+	if (dsi->refcount == 0)
+		return;
+
 	mtk_output_dsi_enable(dsi);
 }
 
+static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+	int ret;
+
+	ret = mtk_dsi_poweron(dsi);
+	if (ret < 0)
+		DRM_ERROR("failed to power on dsi\n");
+}
+
+static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					       struct drm_bridge_state *old_bridge_state)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+
+	mtk_dsi_poweroff(dsi);
+}
+
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
 	.atomic_disable = mtk_dsi_bridge_atomic_disable,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
+	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
+	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-- 
2.18.0

