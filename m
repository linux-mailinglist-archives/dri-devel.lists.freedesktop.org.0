Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA623CF57D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 09:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A606E29D;
	Tue, 20 Jul 2021 07:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3249A6E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:47:46 +0000 (UTC)
X-UUID: 1a04f2fdfaaf471d9bed0c58035ed88e-20210720
X-UUID: 1a04f2fdfaaf471d9bed0c58035ed88e-20210720
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1554712753; Tue, 20 Jul 2021 15:47:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 15:47:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Jul 2021 15:47:36 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 <enric.balletbo@collabora.com>
Subject: [PATCH v3 1/1] drm/mediatek: Fix cursor plane didn't update
Date: Tue, 20 Jul 2021 15:47:34 +0800
Message-ID: <20210720074734.22287-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210720074734.22287-1-jason-jh.lin@mediatek.com>
References: <20210720074734.22287-1-jason-jh.lin@mediatek.com>
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jason-jh.lin@mediatek.com,
 David-YH.Chiu@mediatek.com, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cursor plane should use the current plane state hook in
atomic_async_update because it would not be the new plane state in
the global atomic state, since drm_atomic_helper_swap_state happened
when those plane state hook are run.

Fix cursor plane didn't update issue by below modification:
1. Remove plane_helper_funcs->atomic_update(plane, state) in
   mtk_drm_crtc_async_update.
2. Add mtk_drm_update_new_state into mtk_plane_atomic_async_update to
   update the cursor plane by current plane state hook and add it into 
   mtk_plane_atomic_update to update others plane by the new_state.

Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++----------
 2 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..063c75bab3a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -538,7 +538,6 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 	if (!mtk_crtc->enabled)
 		return;
 
-	plane_helper_funcs->atomic_update(plane, state);
 	mtk_drm_crtc_update_config(mtk_crtc, false);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index b5582dcf564c..e6dcb34d3052 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -110,6 +110,35 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 						   true, true);
 }
 
+static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
+				       struct mtk_plane_state *mtk_plane_state)
+{
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_gem_object *gem;
+	struct mtk_drm_gem_obj *mtk_gem;
+	unsigned int pitch, format;
+	dma_addr_t addr;
+
+	gem = fb->obj[0];
+	mtk_gem = to_mtk_gem_obj(gem);
+	addr = mtk_gem->dma_addr;
+	pitch = fb->pitches[0];
+	format = fb->format->format;
+
+	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
+	addr += (new_state->src.y1 >> 16) * pitch;
+
+	mtk_plane_state->pending.enable = true;
+	mtk_plane_state->pending.pitch = pitch;
+	mtk_plane_state->pending.format = format;
+	mtk_plane_state->pending.addr = addr;
+	mtk_plane_state->pending.x = new_state->dst.x1;
+	mtk_plane_state->pending.y = new_state->dst.y1;
+	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
+	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
+	mtk_plane_state->pending.rotation = new_state->rotation;
+}
+
 static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
@@ -126,8 +155,10 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_h = new_state->src_h;
 	plane->state->src_w = new_state->src_w;
 	swap(plane->state->fb, new_state->fb);
-	new_plane_state->pending.async_dirty = true;
 
+	mtk_plane_update_new_state(new_state, new_plane_state);
+	wmb(); /* Make sure the above parameters are set before update */
+	new_plane_state->pending.async_dirty = true;
 	mtk_drm_crtc_async_update(new_state->crtc, plane, state);
 }
 
@@ -189,14 +220,8 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
-	struct drm_crtc *crtc = new_state->crtc;
-	struct drm_framebuffer *fb = new_state->fb;
-	struct drm_gem_object *gem;
-	struct mtk_drm_gem_obj *mtk_gem;
-	unsigned int pitch, format;
-	dma_addr_t addr;
 
-	if (!crtc || WARN_ON(!fb))
+	if (!new_state->crtc || WARN_ON(!new_state->fb))
 		return;
 
 	if (!new_state->visible) {
@@ -204,24 +229,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	gem = fb->obj[0];
-	mtk_gem = to_mtk_gem_obj(gem);
-	addr = mtk_gem->dma_addr;
-	pitch = fb->pitches[0];
-	format = fb->format->format;
-
-	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
-	addr += (new_state->src.y1 >> 16) * pitch;
-
-	mtk_plane_state->pending.enable = true;
-	mtk_plane_state->pending.pitch = pitch;
-	mtk_plane_state->pending.format = format;
-	mtk_plane_state->pending.addr = addr;
-	mtk_plane_state->pending.x = new_state->dst.x1;
-	mtk_plane_state->pending.y = new_state->dst.y1;
-	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
-	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
-	mtk_plane_state->pending.rotation = new_state->rotation;
+	mtk_plane_update_new_state(new_state, mtk_plane_state);
 	wmb(); /* Make sure the above parameters are set before update */
 	mtk_plane_state->pending.dirty = true;
 }
-- 
2.18.0

