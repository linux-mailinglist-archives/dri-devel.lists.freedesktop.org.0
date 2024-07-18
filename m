Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22269349D5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 10:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7224810E072;
	Thu, 18 Jul 2024 08:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2v0nAgkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAA210E08F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721291119;
 bh=89eygFmnv7fnoScWyve+SwrE7rlZmWG+C4XF1WW1nLE=;
 h=From:To:Cc:Subject:Date:From;
 b=2v0nAgkIbSzaxpv1BTleKVSzfGwm1gJxuZE2JJSLnsiCUcLYI+frzTvgvAKan+bth
 uHmmKOVbMuiYnzxMx1ecPgENRdMUmiTEmhugyKykbHMKJtdPt9+LV+e/8NZeIac9pB
 bD1o25H0rd1INIF64BiIl4gG2/tClhnSvz7IKoIwcpXBYB9vb/YtXlXntDnTuG1k6O
 BwPUY4DGIIGY9MmhZBmSi6Sw5jNWbOWQ1nIHcUU1Ao5qHkMn170ZIeKK8gTREbmkVn
 DrmN9m5RLR9ODnnIexicR+ow8raLbkzCwC67n5cLPWHTP0Ta4oWu6rQOs2/K6has8Q
 TggjAYnqFPOoQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B06A43782167;
 Thu, 18 Jul 2024 08:25:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 shawn.sung@mediatek.com, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: [PATCH] drm/mediatek: Declare Z Position for all planes
Date: Thu, 18 Jul 2024 10:25:07 +0200
Message-ID: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MediaTek SoCs support multiple planes, one of which is the primary
and all the others are overlays (and CURSOR is the last overlay).

In all currently supported SoCs, the Z order of the overlays can't
be changed with any fast muxing action, and can only be changed by
swapping the contents of the entire register set of one overlay
with the other to internally reorder the layer properties, which
is indeed feasible, but probably more expensive than desired.

Declare the Z position for all planes with an immutable property
at least for now, so that the userspace can take its decisions
accordingly.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c  |  2 +-
 drivers/gpu/drm/mediatek/mtk_plane.c | 18 +++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_plane.h |  3 +--
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 072b2fdae87b..327214721b4d 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -874,7 +874,7 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 				mtk_crtc_plane_type(mtk_crtc->layer_nr, num_planes),
 				mtk_ddp_comp_supported_rotations(comp),
 				mtk_ddp_comp_get_formats(comp),
-				mtk_ddp_comp_get_num_formats(comp));
+				mtk_ddp_comp_get_num_formats(comp), i);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 5bf757a3ef20..7d2cb4e0fafa 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -321,7 +321,7 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-		   size_t num_formats)
+		   size_t num_formats, unsigned int plane_idx)
 {
 	int err;
 
@@ -338,6 +338,22 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		return err;
 	}
 
+	/*
+	 * The hardware does not support repositioning planes by muxing: their
+	 * Z-position is infact fixed and the only way to change the actual
+	 * order is to swap the contents of the entire register set of one
+	 * overlay with another, which may be more expensive than desired.
+	 *
+	 * With no repositioning, the caller of this function guarantees that
+	 * the plane_idx is correct. This means that, for example, the PRIMARY
+	 * plane fed to this function will always have plane_idx zero.
+	 */
+	err = drm_plane_create_zpos_immutable_property(plane, plane_idx);
+	if (err) {
+		DRM_ERROR("Failed to create zpos property for plane %u\n", plane_idx);
+		return err;
+	}
+
 	if (supported_rotations) {
 		err = drm_plane_create_rotation_property(plane,
 							 DRM_MODE_ROTATE_0,
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 231bb7aac947..5b177eac67b7 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -49,6 +49,5 @@ to_mtk_plane_state(struct drm_plane_state *state)
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-		   size_t num_formats);
-
+		   size_t num_formats, unsigned int plane_idx);
 #endif
-- 
2.45.2

