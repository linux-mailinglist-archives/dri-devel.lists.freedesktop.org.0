Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA33909C88
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 10:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4289910E270;
	Sun, 16 Jun 2024 08:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NjIUKCEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4636510E1BA
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 08:29:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D217DCE0B5A;
 Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D91CC4AF52;
 Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718526555;
 bh=rAKjaNMehdyg0txw6oCrP0nD11AXCjGACRzpm1pgFmo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=NjIUKCEx6T5XPVkB1nsdc410RWn57GkeOD5hQNfK9KT3KmWctPw1VqHfVelLkok6Y
 zheXB0bZzRghiepw1oiK/TA5IYXopiokhmY/qSjjnM24KCGVQ83x77qqkA0OyxTJz2
 cu6jQ/pWfZecnwkKOBh4lx5PYI81NxBCAe6tMgB9X4feyJoAjvGUCfraJltagGc9bu
 7RM+IvXTYuoBw73C38/+/xTSruftWrphaWyQReeUSKSwyIw6qC3ZWOul24X6oyupKu
 r1PHsAxHr0wB4rFq7+mr1WZiIlEXTJAwqy5/DfbSCn/bd3nVF5aGIi8qEsCojnSJoE
 ocW0UYaJS9AwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 00D3BC2BA18;
 Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:14 +0800
Subject: [PATCH 04/13] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-4-7e8f9cf785d8@mediatek.com>
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
In-Reply-To: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, 
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=3032;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=aRjZW9oV7zkNAPoyKvtjvlu+gI5cJW/IgIkY1vL8GJU=;
 b=N4CHHmRZFm2ntcHpjitJWn39vupntoqiBBkKiDpXz8pS+F/c5ngZcLGIFj5DG1vX4G/3GCQ8L
 ZfAIwQHuT5ECQwwAHpQhoDYY7z4KSOY6Q1gVbxfdoQIHjj81mx23bg1
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
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
Reply-To: shawn.sung@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Always add DRM_MODE_ROTATE_0 to rotation property to meet
IGT's (Intel GPU Tools) requirement.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  6 +++++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++------------
 drivers/gpu/drm/mediatek/mtk_plane.c    |  2 +-
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 26236691ce4c..f7fe2e08dc8e 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -192,7 +192,11 @@ unsigned int mtk_ddp_comp_supported_rotations(struct mtk_ddp_comp *comp)
 	if (comp->funcs && comp->funcs->supported_rotations)
 		return comp->funcs->supported_rotations(comp->dev);
 
-	return 0;
+	/*
+	 * In order to pass IGT tests, DRM_MODE_ROTATE_0 is required when
+	 * rotation is not supported.
+	 */
+	return DRM_MODE_ROTATE_0;
 }
 
 static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *comp)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index b552a02d7eae..862ab683ed1b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -296,27 +296,20 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 			struct mtk_plane_state *mtk_state)
 {
 	struct drm_plane_state *state = &mtk_state->base;
-	unsigned int rotation = 0;
 
-	rotation = drm_rotation_simplify(state->rotation,
-					 DRM_MODE_ROTATE_0 |
-					 DRM_MODE_REFLECT_X |
-					 DRM_MODE_REFLECT_Y);
-	rotation &= ~DRM_MODE_ROTATE_0;
-
-	/* We can only do reflection, not rotation */
-	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
+	/* check if any unsupported rotation is set */
+	if (state->rotation & ~mtk_ovl_supported_rotations(dev))
 		return -EINVAL;
 
 	/*
 	 * TODO: Rotating/reflecting YUV buffers is not supported at this time.
 	 *	 Only RGB[AX] variants are supported.
+	 *	 Since DRM_MODE_ROTATE_0 means "no rotation", we should not
+	 *	 reject layers with this property.
 	 */
-	if (state->fb->format->is_yuv && rotation != 0)
+	if (state->fb->format->is_yuv && (state->rotation & ~DRM_MODE_ROTATE_0))
 		return -EINVAL;
 
-	state->rotation = rotation;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index a74b26d35985..1723d4333f37 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -338,7 +338,7 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		return err;
 	}
 
-	if (supported_rotations & ~DRM_MODE_ROTATE_0) {
+	if (supported_rotations) {
 		err = drm_plane_create_rotation_property(plane,
 							 DRM_MODE_ROTATE_0,
 							 supported_rotations);

-- 
Git-146)


