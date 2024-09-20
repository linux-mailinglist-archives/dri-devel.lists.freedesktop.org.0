Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2942A97D290
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5867810E7DC;
	Fri, 20 Sep 2024 08:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="kpO6RUvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D7B710E7DC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=YF4IX
 iwSA9TAaPW947dg3/6HfjKE0T8O5IcQwAmdgkA=; b=kpO6RUvIOFZI4NPWffD4K
 YJ+kLW04RiMwNDBd2VoNlpNA//BjaGzfrQeWsXwDEpQUSq+8jZ313E9oGm//Hmve
 c4iycugCl9Z/o020OpV+Pgvmv8GaNVYdyIox11KqJZ8/MVt7PF3+keaN0z2BbBNE
 o2CO4W7ltT/BfBNxgqvQxo=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wD3H8y7MO1mK66fCQ--.6610S2; 
 Fri, 20 Sep 2024 16:22:23 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, minhuadotchen@gmail.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 11/15] drm/rockchip: vop2: Register the primary plane and
 overlay plane separately
Date: Fri, 20 Sep 2024 16:22:17 +0800
Message-ID: <20240920082218.6893-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920081626.6433-1-andyshrk@163.com>
References: <20240920081626.6433-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H8y7MO1mK66fCQ--.6610S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWxtw4kKr43tFyrKryxuFg_yoWrCr1Upa
 13ta90vr17WF42gry8JF4jyFWYyan2ka17Crs8Kw1a934fKr93ur4rKFn8AF1ruFnrWFya
 kFW3K39YgFWjgr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7fHUUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gNgXmWX0hs3pAAAsH
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

In the upcoming VOP of rk3576, a Window cannot attach to all Video Ports,
so make sure all VP find it's suitable primary plane, then register the
remain windows as overlay plane will make code easier.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- Add comments for why we should treat rk3566 with special care.

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 100 +++++++++++--------
 1 file changed, 61 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b4964c70149f..e293310b3042 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2024,22 +2024,29 @@ static int vop2_plane_init(struct vop2 *vop2, struct vop2_win *win,
 	return 0;
 }
 
-static struct vop2_video_port *find_vp_without_primary(struct vop2 *vop2)
+/*
+ * On RK3566 these windows don't have an independent
+ * framebuffer. They can only share/mirror the framebuffer
+ * with smart0, esmart0 and cluster0 respectively.
+ * And RK3566 share the same vop version with Rk3568, so we
+ * need to use soc_id for identification here.
+ */
+static bool vop2_is_mirror_win(struct vop2_win *win)
 {
-	int i;
-
-	for (i = 0; i < vop2->data->nr_vps; i++) {
-		struct vop2_video_port *vp = &vop2->vps[i];
-
-		if (!vp->crtc.port)
-			continue;
-		if (vp->primary_plane)
-			continue;
+	struct vop2 *vop2 = win->vop2;
 
-		return vp;
+	if (vop2->data->soc_id == 3566) {
+		switch (win->data->phys_id) {
+		case ROCKCHIP_VOP2_SMART1:
+		case ROCKCHIP_VOP2_ESMART1:
+		case ROCKCHIP_VOP2_CLUSTER1:
+			return true;
+		default:
+			return false;
+		}
+	} else {
+		return false;
 	}
-
-	return NULL;
 }
 
 static int vop2_create_crtcs(struct vop2 *vop2)
@@ -2050,7 +2057,9 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 	struct drm_plane *plane;
 	struct device_node *port;
 	struct vop2_video_port *vp;
-	int i, nvp, nvps = 0;
+	struct vop2_win *win;
+	u32 possible_crtcs;
+	int i, j, nvp, nvps = 0;
 	int ret;
 
 	for (i = 0; i < vop2_data->nr_vps; i++) {
@@ -2089,42 +2098,55 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 	}
 
 	nvp = 0;
-	for (i = 0; i < vop2->registered_num_wins; i++) {
-		struct vop2_win *win = &vop2->win[i];
-		u32 possible_crtcs = 0;
-
-		if (vop2->data->soc_id == 3566) {
-			/*
-			 * On RK3566 these windows don't have an independent
-			 * framebuffer. They share the framebuffer with smart0,
-			 * esmart0 and cluster0 respectively.
-			 */
-			switch (win->data->phys_id) {
-			case ROCKCHIP_VOP2_SMART1:
-			case ROCKCHIP_VOP2_ESMART1:
-			case ROCKCHIP_VOP2_CLUSTER1:
+	/* Register a primary plane for every crtc */
+	for (i = 0; i < vop2_data->nr_vps; i++) {
+		vp = &vop2->vps[i];
+
+		if (!vp->crtc.port)
+			continue;
+
+		for (j = 0; j < vop2->registered_num_wins; j++) {
+			win = &vop2->win[j];
+
+			/* Aready registered as primary plane */
+			if (win->base.type == DRM_PLANE_TYPE_PRIMARY)
+				continue;
+
+			if (vop2_is_mirror_win(win))
 				continue;
-			}
-		}
 
-		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
-			vp = find_vp_without_primary(vop2);
-			if (vp) {
+			if (win->type == DRM_PLANE_TYPE_PRIMARY) {
 				possible_crtcs = BIT(nvp);
 				vp->primary_plane = win;
+				ret = vop2_plane_init(vop2, win, possible_crtcs);
+				if (ret) {
+					drm_err(vop2->drm, "failed to init primary plane %s: %d\n",
+						win->data->name, ret);
+					return ret;
+				}
 				nvp++;
-			} else {
-				/* change the unused primary window to overlay window */
-				win->type = DRM_PLANE_TYPE_OVERLAY;
+				break;
 			}
 		}
+	}
+
+	/* Register all unused window as overlay plane */
+	for (i = 0; i < vop2->registered_num_wins; i++) {
+		win = &vop2->win[i];
+
+		/* Aready registered as primary plane */
+		if (win->base.type == DRM_PLANE_TYPE_PRIMARY)
+			continue;
+
+		if (vop2_is_mirror_win(win))
+			continue;
 
-		if (win->type == DRM_PLANE_TYPE_OVERLAY)
-			possible_crtcs = (1 << nvps) - 1;
+		win->type = DRM_PLANE_TYPE_OVERLAY;
 
+		possible_crtcs = (1 << nvps) - 1;
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
 		if (ret) {
-			drm_err(vop2->drm, "failed to init plane %s: %d\n",
+			drm_err(vop2->drm, "failed to init overlay plane %s: %d\n",
 				win->data->name, ret);
 			return ret;
 		}
-- 
2.34.1

