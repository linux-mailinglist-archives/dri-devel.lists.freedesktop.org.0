Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C89BDE24F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26D10E28A;
	Wed, 15 Oct 2025 11:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VC/FDf3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1517410E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526044;
 bh=6eNa9uBS8W1GG4cusjlap5SfffIEh5B0us4CiG/OvZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VC/FDf3q1izhNl3UbeRSlym6qmj+/yg3Ms83qBEMVa0yMQnEXyvqBwlDZ+6OFlvt0
 QToE0IhAMH/ur7dQhvs+5xej9qoo1usoPRh4hgb6k66pua2uIo8N0Y0lxPzII4d/XF
 kvEZ+5kZkGRV3XUpqrWIU70GWp6l9jP/kljrqQRANkStSZLdioFQ2lm4G9cvsbAs8E
 B3+hN8VfCn0nJIsqVEbVgjAHoFHruwxq45AJJkvmkrhZOV29iz9OBqgPR8XQUzKMEU
 G+ke0FWXWgrhVQDpYFy/Txbr7w7jqD6/WBRGyKFMZb4LUhy8NMoUFpVdctGIPfJb2U
 qo5pA7+FlSuzg==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DC0117E1407;
 Wed, 15 Oct 2025 13:00:44 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 04/13] drm/rockchip: Rename variables for clarity
Date: Wed, 15 Oct 2025 12:00:33 +0100
Message-ID: <20251015110042.41273-5-daniels@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015110042.41273-1-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
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

actual_w and actual_h were the clipped source width, so rename them to
fit the use.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 38 ++++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 659b2565dee4..e2bf2dbd882b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1139,7 +1139,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	struct vop2 *vop2 = win->vop2;
 	struct drm_framebuffer *fb = pstate->fb;
 	u32 bpp = vop2_get_bpp(fb->format);
-	u32 actual_w, actual_h, dsp_w, dsp_h;
+	u32 src_w, src_h, dsp_w, dsp_h;
 	u32 act_info, dsp_info;
 	u32 format;
 	u32 afbc_format;
@@ -1203,8 +1203,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		uv_mst = rk_obj->dma_addr + offset + fb->offsets[1];
 	}
 
-	actual_w = drm_rect_width(src) >> 16;
-	actual_h = drm_rect_height(src) >> 16;
+	src_w = drm_rect_width(src) >> 16;
+	src_h = drm_rect_height(src) >> 16;
 	dsp_w = drm_rect_width(dest);
 
 	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
@@ -1214,7 +1214,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		dsp_w = adjusted_mode->hdisplay - dest->x1;
 		if (dsp_w < 4)
 			dsp_w = 4;
-		actual_w = dsp_w * actual_w / drm_rect_width(dest);
+		src_w = dsp_w * src_w / drm_rect_width(dest);
 	}
 
 	dsp_h = drm_rect_height(dest);
@@ -1226,35 +1226,35 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		dsp_h = adjusted_mode->vdisplay - dest->y1;
 		if (dsp_h < 4)
 			dsp_h = 4;
-		actual_h = dsp_h * actual_h / drm_rect_height(dest);
+		src_h = dsp_h * src_h / drm_rect_height(dest);
 	}
 
 	/*
 	 * This is workaround solution for IC design:
-	 * esmart can't support scale down when actual_w % 16 == 1.
+	 * esmart can't support scale down when src_w % 16 == 1.
 	 */
 	if (!(win->data->feature & WIN_FEATURE_AFBDC)) {
-		if (actual_w > dsp_w && (actual_w & 0xf) == 1) {
+		if (src_w > dsp_w && (src_w & 0xf) == 1) {
 			drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
-				    vp->id, win->data->name, actual_w);
-			actual_w -= 1;
+				    vp->id, win->data->name, src_w);
+			src_w -= 1;
 		}
 	}
 
-	if (afbc_en && actual_w % 4) {
-		drm_dbg_kms(vop2->drm, "vp%d %s actual_w[%d] not 4 pixel aligned\n",
-			    vp->id, win->data->name, actual_w);
-		actual_w = ALIGN_DOWN(actual_w, 4);
+	if (afbc_en && src_w % 4) {
+		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
+			    vp->id, win->data->name, src_w);
+		src_w = ALIGN_DOWN(src_w, 4);
 	}
 
-	act_info = (actual_h - 1) << 16 | ((actual_w - 1) & 0xffff);
+	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
 	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
 
 	format = vop2_convert_format(fb->format->format);
 	half_block_en = vop2_half_block_enable(pstate);
 
 	drm_dbg(vop2->drm, "vp%d update %s[%dx%d->%dx%d@%dx%d] fmt[%p4cc_%s] addr[%pad]\n",
-		vp->id, win->data->name, actual_w, actual_h, dsp_w, dsp_h,
+		vp->id, win->data->name, src_w, src_h, dsp_w, dsp_h,
 		dest->x1, dest->y1,
 		&fb->format->format,
 		afbc_en ? "AFBC" : "", &yrgb_mst);
@@ -1283,7 +1283,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		if (fb->modifier & AFBC_FORMAT_MOD_YTR)
 			afbc_format |= (1 << 4);
 
-		afbc_tile_num = ALIGN(actual_w, block_w) / block_w;
+		afbc_tile_num = ALIGN(src_w, block_w) / block_w;
 
 		/*
 		 * AFBC pic_vir_width is count by pixel, this is different
@@ -1361,8 +1361,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	if (rotate_90 || rotate_270) {
 		act_info = swahw32(act_info);
-		actual_w = drm_rect_height(src) >> 16;
-		actual_h = drm_rect_width(src) >> 16;
+		src_w = drm_rect_height(src) >> 16;
+		src_h = drm_rect_width(src) >> 16;
 	}
 
 	vop2_win_write(win, VOP2_WIN_FORMAT, format);
@@ -1378,7 +1378,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		vop2_win_write(win, VOP2_WIN_UV_MST, uv_mst);
 	}
 
-	vop2_setup_scale(vop2, win, actual_w, actual_h, dsp_w, dsp_h, fb->format->format);
+	vop2_setup_scale(vop2, win, src_w, src_h, dsp_w, dsp_h, fb->format->format);
 	if (!vop2_cluster_window(win))
 		vop2_plane_setup_color_key(plane, 0);
 	vop2_win_write(win, VOP2_WIN_ACT_INFO, act_info);
-- 
2.51.0

