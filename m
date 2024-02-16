Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E008585ED
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 20:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D97510E23B;
	Fri, 16 Feb 2024 19:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="Xo8yth0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAEC10E28C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 19:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708110272; bh=gzfy6/vvZoRzl37dLBsm+GqehoPej8h+i37amwWN5NI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Xo8yth0bF7rUSZmk11Hj53wBnA1Xn/wKDTaBoqI1mMdTeZA5q1BJAB+Rb/Clos5/w
 +3MQZb/LOFPPTW4G6XLlf8pZ/pB5IdN7bMQjDTlKIwBMMufN4Yt+iRS7nVLoDisEqd
 X0aV5Ck/scC1Zv+0PXoVsRCtPDw1OiR3Ej/ZyXc0=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/sun4i: Add more parameters to sunxi_engine commit
 callback
Date: Fri, 16 Feb 2024 20:04:25 +0100
Message-ID: <20240216190430.1374132-3-megi@xff.cz>
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

These will be needed later on when we move layer configuration to
crtc update.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c |  4 +++-
 drivers/gpu/drm/sun4i/sun4i_crtc.c    |  2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c   |  5 ++++-
 drivers/gpu/drm/sun4i/sunxi_engine.h  | 13 ++++++++++---
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 335fd0edb904..e89eb96d3131 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -69,7 +69,9 @@ static void sun4i_backend_disable_color_correction(struct sunxi_engine *engine)
 			   SUN4I_BACKEND_OCCTL_ENABLE, 0);
 }
 
-static void sun4i_backend_commit(struct sunxi_engine *engine)
+static void sun4i_backend_commit(struct sunxi_engine *engine,
+				 struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
 {
 	DRM_DEBUG_DRIVER("Committing changes\n");
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index c06d7cd45388..18e74047b0f5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -91,7 +91,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	DRM_DEBUG_DRIVER("Committing plane changes\n");
 
-	sunxi_engine_commit(scrtc->engine);
+	sunxi_engine_commit(scrtc->engine, crtc, state);
 
 	if (event) {
 		crtc->state->event = NULL;
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 1e681314e379..bdeb9b80e038 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
@@ -249,7 +250,9 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 	return -EINVAL;
 }
 
-static void sun8i_mixer_commit(struct sunxi_engine *engine)
+static void sun8i_mixer_commit(struct sunxi_engine *engine,
+			       struct drm_crtc *crtc,
+			       struct drm_atomic_state *state)
 {
 	DRM_DEBUG_DRIVER("Committing changes\n");
 
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec8cf9b2bda4..ec0c4932f15c 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -7,6 +7,7 @@
 #define _SUNXI_ENGINE_H_
 
 struct drm_plane;
+struct drm_crtc;
 struct drm_device;
 struct drm_crtc_state;
 struct drm_display_mode;
@@ -59,7 +60,9 @@ struct sunxi_engine_ops {
 	 *
 	 * This function is optional.
 	 */
-	void (*commit)(struct sunxi_engine *engine);
+	void (*commit)(struct sunxi_engine *engine,
+		       struct drm_crtc *crtc,
+		       struct drm_atomic_state *state);
 
 	/**
 	 * @layers_init:
@@ -144,12 +147,16 @@ struct sunxi_engine {
 /**
  * sunxi_engine_commit() - commit all changes of the engine
  * @engine:	pointer to the engine
+ * @crtc:	pointer to crtc the engine is associated with
+ * @state:	atomic state
  */
 static inline void
-sunxi_engine_commit(struct sunxi_engine *engine)
+sunxi_engine_commit(struct sunxi_engine *engine,
+		    struct drm_crtc *crtc,
+		    struct drm_atomic_state *state)
 {
 	if (engine->ops && engine->ops->commit)
-		engine->ops->commit(engine);
+		engine->ops->commit(engine, crtc, state);
 }
 
 /**
-- 
2.43.0

