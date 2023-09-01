Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A2B78FB88
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2449C10E76F;
	Fri,  1 Sep 2023 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5774A10E76F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:59:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A89562B36;
 Fri,  1 Sep 2023 09:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8ECC433CC;
 Fri,  1 Sep 2023 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693562368;
 bh=MCxcvPe7knGMaYt1Jtizlmz+R6LJpOaJGjbJJhZK6bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GA1YwEU3VH5nYETgRRFa+H2KhzO/6AeBueaJNaFrLhNj4oYVUrFlG31/kmDpBLfRN
 KdVdzl2z/1BnkOMivBAS/6T+XPYkzXOTvsxPcbU9MIIYd8aUuyjxmnemAWS+MU5o87
 fcGo8kewyUkF4I7AwSdoDpAsP3/r/9nveK4GRIPBzah5737y3oGL7+eG4WTSqh8zqB
 I85097wIdGopqxEzor65wgSNmlLfntteEIlwPilu7+Rl8dMm7SJpbO7aMeFFCDgSVi
 bfMT1EVAaQiwlNfX43Y5NN2EFiE2jV0y66q8U8AtR+A1KBidHkIFVV3R4OcOPrWmfN
 m3cHUMKH7EWsw==
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
Date: Fri,  1 Sep 2023 11:59:16 +0200
Message-Id: <20230901095916.3599320-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901095916.3599320-1-mwalle@kernel.org>
References: <20230901095916.3599320-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>,
 Michael Walle <mwalle@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
always have the CRTC with id 0, the ext id 1 and the third id 2. This
is only true if the paths are all available. But paths are optional (see
also comment in mtk_drm_kms_init()), e.g. the main path might not be
enabled or available at all. Then the CRTC IDs will shift one up, e.g.
ext will be 1 and the third path will be 2.

To fix that, dynamically calculate the IDs by the precence of the paths.

Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v2:
 - iterate over all_drm_private[] to get any vdosys
 - new check if a path is available
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 72 +++++++++++++++++----
 1 file changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 771f4e173353..9f0f12740fb0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -507,6 +507,27 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
+static bool mtk_ddp_path_available(const unsigned int *path,
+				   unsigned int path_len,
+				   struct device_node **comp_node)
+{
+	unsigned int i;
+
+	if (!path)
+		return false;
+
+	for (i = 0U; i < path_len; i++) {
+		/* OVL_ADAPTOR doesn't have a device node */
+		if (path[i] == DDP_COMPONENT_DRM_OVL_ADAPTOR)
+			continue;
+
+		if (!comp_node[path[i]])
+			return false;
+	}
+
+	return true;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -526,21 +547,44 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
-	unsigned int ret = 0;
-
-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
-				     private->ddp_comp))
-		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
-		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
-		ret = BIT(2);
-	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+	const struct mtk_mmsys_driver_data *data;
+	struct mtk_drm_private *priv_n;
+	int i = 0, j;
+
+	for (j = 0; j < private->data->mmsys_dev_num; j++) {
+		priv_n = private->all_drm_private[j];
+		data = priv_n->data;
+
+		if (mtk_ddp_path_available(data->main_path, data->main_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, priv_n->data->main_path,
+						     priv_n->data->main_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->ext_path, data->ext_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, priv_n->data->ext_path,
+						     priv_n->data->ext_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->third_path, data->third_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, priv_n->data->third_path,
+						     priv_n->data->third_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+	}
 
-	return ret;
+	DRM_INFO("Failed to find comp in ddp table\n");
+	return 0;
 }
 
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
-- 
2.39.2

