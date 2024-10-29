Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE09B461D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD23610E5FF;
	Tue, 29 Oct 2024 09:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="W0qonfrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B3F910E5FB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ckN+C
 I+XvxtAc4aLpkYX8g6tnnWLc/g+v0ub9LUeR+c=; b=W0qonfrOL+NbdHPQ8X6c9
 +RplHHZiTzZ2/IyVI30ClQ0uVBhaNDVzbCtGnZgaufUAhOlgG1JldzF+tj6EfRdt
 tMtpdP/UMuOBo+4CcbF2QJ0Q+swOh8mhIOXjTo3CL+N55IaYw+xJbqXFvSCV+Y3r
 bW+JnlMbaIto/56yaKZjC0=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3nxoCsSBn8+3dEA--.3291S6; 
 Tue, 29 Oct 2024 17:55:23 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 minhuadotchen@gmail.com, detlev.casanova@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v4 04/14] drm/rockchip: vop2: Fix the windows switch between
 different layers
Date: Tue, 29 Oct 2024 17:54:57 +0800
Message-ID: <20241029095513.391006-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029095513.391006-1-andyshrk@163.com>
References: <20241029095513.391006-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nxoCsSBn8+3dEA--.3291S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4fWF4DAFW7Gw15KryfWFg_yoW5ZFy3pF
 15WrWjgw4UKFsIqr9rtr48uF4ayws7Gay7W3Z7tw1rGFyrtr1DJwn8Cr9ayryUGFn3uryY
 yr1j9r909FWqyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jF2NtUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwqHXmcgqJmjwgACs1
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

Every layer of vop2 should bind a window, and we also need to make
sure that this window is not used by other layer.

0x5 is a reserved layer sel value on rk3568, but it will select
Cluster3 on rk3588, configure unused layers to 0x5  will lead
alpha blending error on rk3588.

When we bind a window from layerM to layerN, we move the old window
on layerN to layerM.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Derek Foreman <derek.foreman@collabora.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 38 +++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index c50d93df84046..4776a227e62c8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2364,7 +2364,9 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	struct drm_plane *plane;
 	u32 layer_sel = 0;
 	u32 port_sel;
-	unsigned int nlayer, ofs;
+	u8 old_layer_id;
+	u8 layer_sel_id;
+	unsigned int ofs;
 	u32 ovl_ctrl;
 	int i;
 	struct vop2_video_port *vp0 = &vop2->vps[0];
@@ -2408,9 +2410,28 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	for (i = 0; i < vp->id; i++)
 		ofs += vop2->vps[i].nlayers;
 
-	nlayer = 0;
 	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
 		struct vop2_win *win = to_vop2_win(plane);
+		struct vop2_win *old_win;
+
+		/*
+		 * Find the layer this win bind in old state.
+		 */
+		for (old_layer_id = 0; old_layer_id < vop2->data->win_size; old_layer_id++) {
+			layer_sel_id = (layer_sel >> (4 * old_layer_id)) & 0xf;
+			if (layer_sel_id == win->data->layer_sel_id)
+				break;
+		}
+
+		/*
+		 * Find the win bind to this layer in old state
+		 */
+		for (i = 0; i < vop2->data->win_size; i++) {
+			old_win = &vop2->win[i];
+			layer_sel_id = (layer_sel >> (4 * (plane->state->normalized_zpos + ofs))) & 0xf;
+			if (layer_sel_id == old_win->data->layer_sel_id)
+				break;
+		}
 
 		switch (win->data->phys_id) {
 		case ROCKCHIP_VOP2_CLUSTER0:
@@ -2459,13 +2480,12 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 							  0x7);
 		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos + ofs,
 							 win->data->layer_sel_id);
-		nlayer++;
-	}
-
-	/* configure unused layers to 0x5 (reserved) */
-	for (; nlayer < vp->nlayers; nlayer++) {
-		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 0x7);
-		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 5);
+		/*
+		 * When we bind a window from layerM to layerN, we also need to move the old
+		 * window on layerN to layerM to avoid one window selected by two or more layers.
+		 */
+		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, 0x7);
+		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, old_win->data->layer_sel_id);
 	}
 
 	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
-- 
2.34.1

