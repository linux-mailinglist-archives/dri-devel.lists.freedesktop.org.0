Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7E3CE8EB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 19:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E326E204;
	Mon, 19 Jul 2021 17:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Mon, 19 Jul 2021 08:13:36 UTC
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654586E0BC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 08:13:36 +0000 (UTC)
X-UUID: 15719b307738430e8140c30d602a280c-20210719
X-UUID: 15719b307738430e8140c30d602a280c-20210719
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1896844528; Mon, 19 Jul 2021 16:08:29 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 16:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Jul 2021 16:08:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] Fix cursor plane didn't update
Date: Mon, 19 Jul 2021 16:08:27 +0800
Message-ID: <20210719080827.25902-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 19 Jul 2021 17:43:09 +0000
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

The cursor plane should use the current plane state in atomic_async_update
because it would not be the new plane state in the global atomic state
since _swap_state happened when those hook are run.

Fix cursor plane issue by below modification:
1. Remove plane_helper_funcs->atomic_update(plane, state) in
   mtk_drm_crtc_async_update.
2. Add mtk_drm_update_new_state in to mtk_plane_atomic_async_update to
   update the cursor plane by current plan hook and update the normal
   plane by the new_state.

Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
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

