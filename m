Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56549B461A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31210E5FC;
	Tue, 29 Oct 2024 09:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="qLRwsqLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 413EC10E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=gO972
 vPWIhe4zly4yr2H4uC4lZBv1i4XKsX7IhxkJlo=; b=qLRwsqLD+LZ64UuOjTQ7S
 jZhHh0zdl4gyADooNULb6KVqrtU84LWyc+oBej7LwUMP4USXbyOgYXMmaHHoWZrE
 Rvf2B91txhPyYPvEO2U7jPE6Wp6YkL0jXp81/trNnX7hn0IvFo1LLJBC5QcvQz5K
 +HKzu1eTejTDRZncZjHSe4=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3nxoCsSBn8+3dEA--.3291S10; 
 Tue, 29 Oct 2024 17:55:27 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 minhuadotchen@gmail.com, detlev.casanova@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v4 08/14] drm/rockchip: vop2: Support for different layer
 select configuration between VPs
Date: Tue, 29 Oct 2024 17:55:01 +0800
Message-ID: <20241029095513.391006-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029095513.391006-1-andyshrk@163.com>
References: <20241029095513.391006-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nxoCsSBn8+3dEA--.3291S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrW8JF4UZF47CF4UWFy8Zrb_yoWfGF43pa
 yUursIg3Z8Cr45tryUJay8Zr4rGwnxtay3uan3Kw1xGF1rKrWDJF4ktF93A3Z8KF93Zry8
 Xw1YgryDZrZrtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jF38nUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hyHXmcgp1S+TwAAsS
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

From: Andy Yan <andy.yan@rock-chips.com>

In the upcoming VOP for rk3576, every VP has it's own LAYER_SEL
register, and the configuration value of each VP for the same
window maybe different, so extend the layer_sel_id to array,
let it can descption the layer select configuration value for
different VP.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

---

Changes in v4:
- Typo fix: selet->select

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +--
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 38 ++++++++++----------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index b27163f561dea..9b269f6e576e8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -163,9 +163,9 @@ struct vop2_win_data {
 	const unsigned int supported_rotations;
 
 	/**
-	 * @layer_sel_id: defined by register OVERLAY_LAYER_SEL of VOP2
+	 * @layer_sel_id: defined by register OVERLAY_LAYER_SEL or PORTn_LAYER_SEL
 	 */
-	unsigned int layer_sel_id;
+	unsigned int layer_sel_id[ROCKCHIP_MAX_CRTC];
 	uint64_t feature;
 
 	unsigned int max_upscale_factor;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 0e577aabc9e49..8473dc9c232c1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -342,7 +342,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.formats = formats_smart,
 		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
-		.layer_sel_id = 3,
+		/* 0xf means this layer can't attached to this VP */
+		.layer_sel_id = { 3, 3, 3, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -355,7 +356,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1e00,
-		.layer_sel_id = 7,
+		.layer_sel_id = { 7, 7, 7, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -368,7 +369,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1a00,
-		.layer_sel_id = 6,
+		.layer_sel_id = { 6, 6, 6, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -381,7 +382,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1800,
-		.layer_sel_id = 2,
+		.layer_sel_id = { 2, 2, 2, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -394,7 +395,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 0,
+		.layer_sel_id = { 0, 0, 0, 0xf },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 					DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.max_upscale_factor = 4,
@@ -409,7 +410,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 1,
+		.layer_sel_id = { 1, 1, 1, 0xf },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 					DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
@@ -574,7 +575,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 0,
+		.layer_sel_id = { 0, 0, 0, 0 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.max_upscale_factor = 4,
@@ -589,7 +590,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 1,
+		.layer_sel_id = { 1, 1, 1, 1 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
@@ -604,7 +605,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 4,
+		.layer_sel_id = { 4, 4, 4, 4 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
@@ -619,7 +620,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 5,
+		.layer_sel_id =  { 5, 5, 5, 5 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
@@ -634,7 +635,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1800,
-		.layer_sel_id = 2,
+		.layer_sel_id = { 2, 2, 2, 2 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.max_upscale_factor = 8,
@@ -647,7 +648,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1a00,
-		.layer_sel_id = 3,
+		.layer_sel_id = { 3, 3, 3, 3 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.max_upscale_factor = 8,
@@ -660,7 +661,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_esmart,
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
-		.layer_sel_id = 6,
+		.layer_sel_id =  { 6, 6, 6, 6 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.max_upscale_factor = 8,
@@ -673,7 +674,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1e00,
-		.layer_sel_id = 7,
+		.layer_sel_id =  { 7, 7, 7, 7 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.max_upscale_factor = 8,
@@ -1420,7 +1421,7 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		 */
 		for (old_layer_id = 0; old_layer_id < vop2->data->win_size; old_layer_id++) {
 			layer_sel_id = (layer_sel >> (4 * old_layer_id)) & 0xf;
-			if (layer_sel_id == win->data->layer_sel_id)
+			if (layer_sel_id == win->data->layer_sel_id[vp->id])
 				break;
 		}
 
@@ -1430,7 +1431,7 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		for (i = 0; i < vop2->data->win_size; i++) {
 			old_win = &vop2->win[i];
 			layer_sel_id = (layer_sel >> (4 * (plane->state->normalized_zpos + ofs))) & 0xf;
-			if (layer_sel_id == old_win->data->layer_sel_id)
+			if (layer_sel_id == old_win->data->layer_sel_id[vp->id])
 				break;
 		}
 
@@ -1480,13 +1481,14 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos + ofs,
 							  0x7);
 		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos + ofs,
-							 win->data->layer_sel_id);
+							 win->data->layer_sel_id[vp->id]);
 		/*
 		 * When we bind a window from layerM to layerN, we also need to move the old
 		 * window on layerN to layerM to avoid one window selected by two or more layers.
 		 */
 		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, 0x7);
-		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, old_win->data->layer_sel_id);
+		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id,
+			     old_win->data->layer_sel_id[vp->id]);
 	}
 
 	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
-- 
2.34.1

