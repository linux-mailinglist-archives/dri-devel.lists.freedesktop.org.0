Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE36117F59
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 06:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F716E7EC;
	Tue, 10 Dec 2019 05:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7039A6E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 05:05:33 +0000 (UTC)
X-UUID: c318433ed47b49988ddaf10e6c69dd06-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vLJdxaH2MWrmzj2S/id6q7QDiTMGmRbVBP51VcvkaCA=; 
 b=o2nFEYSlnBSV5LlvmLCp1wkJGowY/QwmAYRKzwALnRH2yoorCI6LBy4eV9k6h4+G2pQBj3dLq+Gn/NtpFuH23QkVgntKXPSxxelvvakjUFpQKCbszAq6dU+elVePAE55FHCZZpEYDnbt2AbyCGWuV+HaHs+5g8vk+LL3bRZphNg=;
X-UUID: c318433ed47b49988ddaf10e6c69dd06-20191210
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 740814321; Tue, 10 Dec 2019 13:05:30 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 13:04:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 13:05:22 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 3/7] drm/mediatek: update cursors by using async atomic
 update
Date: Tue, 10 Dec 2019 13:05:22 +0800
Message-ID: <20191210050526.4437-4-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 25289DC1C7CD5B2C4C889A1F72A6B1AA536FCC2607E5A6F6A90018A918158CB82000:8
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support to async updates of cursors by using the new atomic
interface for that.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 98 +++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h  |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 47 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +
 4 files changed, 128 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index af097b7db72f..b771ee05968b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -41,12 +41,16 @@ struct mtk_drm_crtc {
 	struct drm_plane		*planes;
 	unsigned int			layer_nr;
 	bool				pending_planes;
+	bool				pending_async_planes;
 
 	void __iomem			*config_regs;
 	const struct mtk_mmsys_reg_data *mmsys_reg_data;
 	struct mtk_disp_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+
+	/* lock for display hardware access */
+	struct mutex			hw_lock;
 };
 
 struct mtk_crtc_state {
@@ -412,6 +416,63 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 		}
 		mtk_crtc->pending_planes = false;
 	}
+
+	if (mtk_crtc->pending_async_planes) {
+		for (i = 0; i < mtk_crtc->layer_nr; i++) {
+			struct drm_plane *plane = &mtk_crtc->planes[i];
+			struct mtk_plane_state *plane_state;
+
+			plane_state = to_mtk_plane_state(plane->state);
+
+			if (!plane_state->pending.async_config)
+				continue;
+
+			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
+							  &local_layer);
+
+			if (comp)
+				mtk_ddp_comp_layer_config(comp, local_layer,
+							  plane_state);
+			plane_state->pending.async_config = false;
+		}
+		mtk_crtc->pending_async_planes = false;
+	}
+}
+
+static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
+{
+	struct drm_crtc *crtc = &mtk_crtc->base;
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	unsigned int pending_planes = 0, pending_async_planes = 0;
+	int i;
+
+	mutex_lock(&mtk_crtc->hw_lock);
+	for (i = 0; i < mtk_crtc->layer_nr; i++) {
+		struct drm_plane *plane = &mtk_crtc->planes[i];
+		struct mtk_plane_state *plane_state;
+
+		plane_state = to_mtk_plane_state(plane->state);
+		if (plane_state->pending.dirty) {
+			plane_state->pending.config = true;
+			plane_state->pending.dirty = false;
+			pending_planes |= BIT(i);
+		} else if (plane_state->pending.async_dirty) {
+			plane_state->pending.async_config = true;
+			plane_state->pending.async_dirty = false;
+			pending_async_planes |= BIT(i);
+		}
+	}
+	if (pending_planes)
+		mtk_crtc->pending_planes = true;
+	if (pending_async_planes)
+		mtk_crtc->pending_async_planes = true;
+
+	if (priv->data->shadow_register) {
+		mtk_disp_mutex_acquire(mtk_crtc->mutex);
+		mtk_crtc_ddp_config(crtc);
+		mtk_disp_mutex_release(mtk_crtc->mutex);
+	}
+	mutex_unlock(&mtk_crtc->hw_lock);
 }
 
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
@@ -426,6 +487,20 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 	return 0;
 }
 
+void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
+			       struct drm_plane_state *new_state)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	const struct drm_plane_helper_funcs *plane_helper_funcs =
+			plane->helper_private;
+
+	if (!mtk_crtc->enabled)
+		return;
+
+	plane_helper_funcs->atomic_update(plane, new_state);
+	mtk_drm_crtc_hw_config(mtk_crtc);
+}
+
 static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_crtc_state *old_state)
 {
@@ -507,34 +582,14 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
-	unsigned int pending_planes = 0;
 	int i;
 
 	if (mtk_crtc->event)
 		mtk_crtc->pending_needs_vblank = true;
-	for (i = 0; i < mtk_crtc->layer_nr; i++) {
-		struct drm_plane *plane = &mtk_crtc->planes[i];
-		struct mtk_plane_state *plane_state;
-
-		plane_state = to_mtk_plane_state(plane->state);
-		if (plane_state->pending.dirty) {
-			plane_state->pending.config = true;
-			plane_state->pending.dirty = false;
-			pending_planes |= BIT(i);
-		}
-	}
-	if (pending_planes)
-		mtk_crtc->pending_planes = true;
 	if (crtc->state->color_mgmt_changed)
 		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
 			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
-
-	if (priv->data->shadow_register) {
-		mtk_disp_mutex_acquire(mtk_crtc->mutex);
-		mtk_crtc_ddp_config(crtc);
-		mtk_disp_mutex_release(mtk_crtc->mutex);
-	}
+	mtk_drm_crtc_hw_config(mtk_crtc);
 }
 
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
@@ -726,6 +781,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
 	priv->num_pipes++;
+	mutex_init(&mtk_crtc->hw_lock);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 6afe1c19557a..a2b4677a451c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -21,5 +21,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			unsigned int path_len);
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
+void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
+			       struct drm_plane_state *plane_state);
 
 #endif /* MTK_DRM_CRTC_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 3b0cc91c7023..189744d34f53 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 
@@ -76,6 +77,50 @@ static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
 	kfree(to_mtk_plane_state(state));
 }
 
+static int mtk_plane_atomic_async_check(struct drm_plane *plane,
+					struct drm_plane_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+
+	if (plane != state->crtc->cursor)
+		return -EINVAL;
+
+	if (!plane->state)
+		return -EINVAL;
+
+	if (!plane->state->fb)
+		return -EINVAL;
+
+	if (state->state)
+		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
+								state->crtc);
+	else /* Special case for asynchronous cursor updates. */
+		crtc_state = state->crtc->state;
+
+	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   true, true);
+}
+
+static void mtk_plane_atomic_async_update(struct drm_plane *plane,
+					  struct drm_plane_state *new_state)
+{
+	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
+
+	plane->state->crtc_x = new_state->crtc_x;
+	plane->state->crtc_y = new_state->crtc_y;
+	plane->state->crtc_h = new_state->crtc_h;
+	plane->state->crtc_w = new_state->crtc_w;
+	plane->state->src_x = new_state->src_x;
+	plane->state->src_y = new_state->src_y;
+	plane->state->src_h = new_state->src_h;
+	plane->state->src_w = new_state->src_w;
+	state->pending.async_dirty = true;
+
+	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
+}
+
 static const struct drm_plane_funcs mtk_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -164,6 +209,8 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 	.atomic_check = mtk_plane_atomic_check,
 	.atomic_update = mtk_plane_atomic_update,
 	.atomic_disable = mtk_plane_atomic_disable,
+	.atomic_async_update = mtk_plane_atomic_async_update,
+	.atomic_async_check = mtk_plane_atomic_async_check,
 };
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 760885e35b27..d454bece9535 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -22,6 +22,8 @@ struct mtk_plane_pending_state {
 	unsigned int			height;
 	unsigned int			rotation;
 	bool				dirty;
+	bool				async_dirty;
+	bool				async_config;
 };
 
 struct mtk_plane_state {
-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
