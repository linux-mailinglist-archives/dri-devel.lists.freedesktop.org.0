Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BAA4FB1E0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 04:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691B610EB0A;
	Mon, 11 Apr 2022 02:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C4710EB0A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 02:32:22 +0000 (UTC)
X-UUID: 115ad731c38946e28dab2a178787e77e-20220411
X-UUID: 115ad731c38946e28dab2a178787e77e-20220411
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1005308082; Mon, 11 Apr 2022 10:32:16 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 10:32:16 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 11 Apr 2022 10:32:14 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 11 Apr 2022 10:32:09 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
Subject: [PATCH v4,
 2/4] drm/mediatek: Separate poweron/poweroff from enable/disable and
 define new funcs
Date: Mon, 11 Apr 2022 10:31:46 +0800
Message-ID: <1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jitao Shi <jitao.shi@mediatek.com>

In order to match the changes of "Use the drm_panel_bridge API",
the poweron/poweroff of dsi is extracted from enable/disable and
defined as new funcs (pre_enable/post_disable).

Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 51 +++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 262c027d8c2f..cf76c53a1af6 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -679,16 +679,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
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
@@ -703,17 +693,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 
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
 
@@ -727,7 +709,16 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
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
@@ -762,13 +753,35 @@ static void mtk_dsi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
+	if (dsi->refcount == 0)
+		return;
+
 	mtk_output_dsi_enable(dsi);
 }
 
+static void mtk_dsi_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+	int ret;
+
+	ret = mtk_dsi_poweron(dsi);
+	if (ret < 0)
+		DRM_ERROR("failed to power on dsi\n");
+}
+
+static void mtk_dsi_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+
+	mtk_dsi_poweroff(dsi);
+}
+
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
 	.disable = mtk_dsi_bridge_disable,
 	.enable = mtk_dsi_bridge_enable,
+	.pre_enable = mtk_dsi_bridge_pre_enable,
+	.post_disable = mtk_dsi_bridge_post_disable,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-- 
2.18.0

