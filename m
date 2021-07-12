Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECCB3C627A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 20:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75C289D64;
	Mon, 12 Jul 2021 18:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5147A89D73
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 18:12:22 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 784C11F422BE;
 Mon, 12 Jul 2021 19:12:17 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Test component initialization earlier in the
 function mtk_drm_crtc_create
Date: Mon, 12 Jul 2021 20:12:09 +0200
Message-Id: <20210712181209.27023-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: chunkuang.hu@kernel.org, dafna.hirschfeld@collabora.com, airlied@linux.ie,
 dafna3@gmail.com, laurent.pinchart@ideasonboard.com,
 enric.balletbo@collabora.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initialization is currently tested in a later stage in
the function for no reason.
In addition, the test '!comp' will never fail since comp is
set with the '&' operator. Instead, test if a comp was not
initialized by testing "!comp->dev".

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..06f40e589922 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -755,14 +755,22 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	for (i = 0; i < path_len; i++) {
 		enum mtk_ddp_comp_id comp_id = path[i];
 		struct device_node *node;
+		struct mtk_ddp_comp *comp;
 
 		node = priv->comp_node[comp_id];
+		comp = &priv->ddp_comp[comp_id];
+
 		if (!node) {
 			dev_info(dev,
 				 "Not creating crtc %d because component %d is disabled or missing\n",
 				 pipe, comp_id);
 			return 0;
 		}
+
+		if (!comp->dev) {
+			dev_err(dev, "Component %pOF not initialized\n", node);
+			return -ENODEV;
+		}
 	}
 
 	mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
@@ -787,16 +795,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		enum mtk_ddp_comp_id comp_id = path[i];
 		struct mtk_ddp_comp *comp;
-		struct device_node *node;
 
-		node = priv->comp_node[comp_id];
 		comp = &priv->ddp_comp[comp_id];
-		if (!comp) {
-			dev_err(dev, "Component %pOF not initialized\n", node);
-			ret = -ENODEV;
-			return ret;
-		}
-
 		mtk_crtc->ddp_comp[i] = comp;
 
 		if (comp->funcs) {
-- 
2.17.1

