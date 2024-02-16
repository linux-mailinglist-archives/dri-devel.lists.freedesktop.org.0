Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737368585EE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 20:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C563610E28C;
	Fri, 16 Feb 2024 19:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="nUwsUe0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25710E23B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 19:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708110272; bh=uzKMXjjq7BG1HYmZl0eI5qf80DkNCMB7h+IPh76Lj54=;
 h=From:To:Cc:Subject:Date:References:From;
 b=nUwsUe0QEANu2kbsZsrowAFvpi+xFFj9SJlbP2HVCoJRmbsWigqDayg0fQCm5R5xx
 1jtij7Mio9o0nKE0r7ID69N8kRNPwFYzVNoxojksmecKlzJnu+nSLOMscmBr5CIP0d
 m5DmY3glskZ00xuYPVZ4QIbclFLETueHDxVbzg/w=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/sun4i: Unify sun8i_*_layer structs
Date: Fri, 16 Feb 2024 20:04:24 +0100
Message-ID: <20240216190430.1374132-2-megi@xff.cz>
In-Reply-To: <20240216190430.1374132-1-megi@xff.cz>
References: <20240216190430.1374132-1-megi@xff.cz>
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

From: Ondrej Jirman <megi@xff.cz>

These structs are identical, use a single struct to represent private
data for the DRM plane. This is a preparation for configuring layer
routing from the CRTC (mixer) instead of current approach of setting
up routing from individual layer's atomic_update callback.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h    | 14 ++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 14 +++++++-------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++++----------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 +++++++-------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++++----------------
 6 files changed, 38 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 01382860aaee..1e681314e379 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -271,7 +271,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < mixer->cfg->vi_num; i++) {
-		struct sun8i_vi_layer *layer;
+		struct sun8i_layer *layer;
 
 		layer = sun8i_vi_layer_init_one(drm, mixer, i);
 		if (IS_ERR(layer)) {
@@ -284,7 +284,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	}
 
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
-		struct sun8i_ui_layer *layer;
+		struct sun8i_layer *layer;
 
 		layer = sun8i_ui_layer_init_one(drm, mixer, i);
 		if (IS_ERR(layer)) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 85c94884fb9a..5a610ee30301 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <drm/drm_plane.h>
 
 #include "sunxi_engine.h"
 
@@ -185,6 +186,19 @@ struct sun8i_mixer {
 	struct clk			*mod_clk;
 };
 
+struct sun8i_layer {
+	struct drm_plane	plane;
+	struct sun8i_mixer	*mixer;
+	int			channel;
+	int			overlay;
+};
+
+static inline struct sun8i_layer *
+plane_to_sun8i_layer(struct drm_plane *plane)
+{
+	return container_of(plane, struct sun8i_layer, plane);
+}
+
 static inline struct sun8i_mixer *
 engine_to_sun8i_mixer(struct sunxi_engine *engine)
 {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index ca75ca0835a6..248fbb606ede 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -232,7 +232,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
+	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
@@ -264,7 +264,7 @@ static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
+	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
@@ -279,7 +279,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
-	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
+	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
@@ -345,13 +345,13 @@ static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
-struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					       struct sun8i_mixer *mixer,
-					       int index)
+struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
+					    struct sun8i_mixer *mixer,
+					    int index)
 {
 	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	int channel = mixer->cfg->vi_num + index;
-	struct sun8i_ui_layer *layer;
+	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
 	int ret;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index e3e32ee1178d..83892f6ff211 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -47,21 +47,9 @@
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)
 
 struct sun8i_mixer;
+struct sun8i_layer;
 
-struct sun8i_ui_layer {
-	struct drm_plane	plane;
-	struct sun8i_mixer	*mixer;
-	int			channel;
-	int			overlay;
-};
-
-static inline struct sun8i_ui_layer *
-plane_to_sun8i_ui_layer(struct drm_plane *plane)
-{
-	return container_of(plane, struct sun8i_ui_layer, plane);
-}
-
-struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					       struct sun8i_mixer *mixer,
-					       int index);
+struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
+					    struct sun8i_mixer *mixer,
+					    int index);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f9c0a56d3a14..0c0f1ac80517 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -366,7 +366,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
+	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
@@ -398,7 +398,7 @@ static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
+	struct sun8i_layer *layer = plane_to_sun8i_vi_layer(plane);
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
@@ -413,7 +413,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
-	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
+	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
@@ -539,14 +539,14 @@ static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
-struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					       struct sun8i_mixer *mixer,
-					       int index)
+struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
+					    struct sun8i_mixer *mixer,
+					    int index)
 {
 	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
-	struct sun8i_vi_layer *layer;
+	struct sun8i_layer *layer;
 	const u32 *formats;
 	int ret;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 48c399e1c86d..655440cdc78f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -52,21 +52,9 @@
 #define SUN8I_MIXER_CHAN_VI_DS_M(x)			((x) << 0)
 
 struct sun8i_mixer;
+struct sun8i_layer;
 
-struct sun8i_vi_layer {
-	struct drm_plane	plane;
-	struct sun8i_mixer	*mixer;
-	int			channel;
-	int			overlay;
-};
-
-static inline struct sun8i_vi_layer *
-plane_to_sun8i_vi_layer(struct drm_plane *plane)
-{
-	return container_of(plane, struct sun8i_vi_layer, plane);
-}
-
-struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					       struct sun8i_mixer *mixer,
-					       int index);
+struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
+					    struct sun8i_mixer *mixer,
+					    int index);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.43.0

