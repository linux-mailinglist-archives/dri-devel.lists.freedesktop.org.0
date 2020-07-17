Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA42237B5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F46ED7E;
	Fri, 17 Jul 2020 09:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F166ED6A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z13so10197380wrw.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pR9YKHp5+Lt/Q2+ufTvkK6NQ4xGvhYIWxEzAYNCfaE=;
 b=alN5kWHvKisa3LtUu/hdBUcVwrR4W41191KcfSFdWqVO1VLRGuDC4D44lW2PdfEQvT
 i04If4uIKv8iQKLxQ9ug7w27FWz5ZKi1FhXrxGiVgOtlFlyI5oUURwewQZB58vZcdvlm
 J5t/h0mWoUnsZsHg3uCqC2NvrEP2TRvfb0CE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pR9YKHp5+Lt/Q2+ufTvkK6NQ4xGvhYIWxEzAYNCfaE=;
 b=hzlejfHgPc9+vn3wJHxmGo1pkSpJOMq67VTGuxSGz6+wrnCaCoK+S6s1NBwpEppyQz
 Cbc5rSkUCGOMm3eo8uep+b6cKM1bV8P6ERbfFhjHJ2KTp7uQp0N6igmwnjcq0wlrMB4L
 HuQCq5lgj31R95jH5IgolD4lnJEd7IxNzC9JDCuwRcOYUxfRYSHW+xSMG3WP/3KJoss3
 0IgawjaW21aOHJ/flehmBdA1B1jV9hZKMjnOGj+08X120RQYd0EhHajKNQYVaCt9x0mV
 QUBhXff63KDgWoNHDczPkSGWTRf7aRlWhNexZhb5wrueJwNzqkTHgrsCQMwtjd7j0CSW
 w3Ag==
X-Gm-Message-State: AOAM5337iEIWPo289wNG28+XQBycApNA8lLMwyb/DoSOLeSyRkid9+2j
 Y3zs4zqjFejoSWGSYsWMDP64oY5jVUw=
X-Google-Smtp-Source: ABdhPJxn+2kS3JgxgFpGi74qpgmrL8hzCXVUUERKP4qt/HDESLtXEi/50aUxOthGL78p/M+WdVQDqQ==
X-Received: by 2002:adf:ef46:: with SMTP id c6mr9261399wrp.34.1594976685787;
 Fri, 17 Jul 2020 02:04:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/18] drm/arc: Convert to drm_simple_kms_pipe_helper
Date: Fri, 17 Jul 2020 11:04:23 +0200
Message-Id: <20200717090430.1146256-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Really straighforward, only slight issue is that the sim connector is
created after the pipe is set up, so can't use the helpers perfectly
yet. Subsequent patches will fix that.

Aside from lots of deleting code no functional changes in here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h      |   4 +-
 drivers/gpu/drm/arc/arcpgu_crtc.c | 102 ++++++++----------------------
 drivers/gpu/drm/arc/arcpgu_drv.c  |   2 +-
 drivers/gpu/drm/arc/arcpgu_hdmi.c |  18 +-----
 4 files changed, 31 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index c52cdd2274e1..b5c699d14f27 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -20,7 +20,7 @@ struct arcpgu_drm_private {
 
 #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
 
-#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe.crtc)
+#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
@@ -34,7 +34,7 @@ static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
 	return ioread32(arcpgu->regs + reg);
 }
 
-int arc_pgu_setup_crtc(struct drm_device *dev);
+int arc_pgu_setup_pipe(struct drm_device *dev);
 int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
 int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np);
 
diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index c7769edeefdf..5c6d7e34ca73 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -25,10 +25,9 @@ static const u32 arc_pgu_supported_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
-static void arc_pgu_set_pxl_fmt(struct drm_crtc *crtc)
+static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
-	const struct drm_framebuffer *fb = crtc->primary->state->fb;
+	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
 	uint32_t pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
@@ -59,10 +58,10 @@ static const struct drm_crtc_funcs arc_pgu_crtc_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 };
 
-static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
-						    const struct drm_display_mode *mode)
+static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
+					       const struct drm_display_mode *mode)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
+	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
 	long rate, clk_rate = mode->clock * 1000;
 	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
 
@@ -109,15 +108,16 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
 
-	arc_pgu_set_pxl_fmt(&arcpgu->pipe.crtc);
+	arc_pgu_set_pxl_fmt(arcpgu);
 
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
 
-static void arc_pgu_crtc_atomic_enable(struct drm_crtc *crtc,
-				       struct drm_crtc_state *old_state)
+static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
+			   struct drm_crtc_state *crtc_state,
+			   struct drm_plane_state *plane_state)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
+	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
 
 	arc_pgu_mode_set(arcpgu);
 
@@ -127,10 +127,9 @@ static void arc_pgu_crtc_atomic_enable(struct drm_crtc *crtc,
 		      ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
-					struct drm_crtc_state *old_state)
+static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
+	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
 
 	clk_disable_unprepare(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -138,80 +137,33 @@ static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
-	.mode_valid	= arc_pgu_crtc_mode_valid,
-	.atomic_enable	= arc_pgu_crtc_atomic_enable,
-	.atomic_disable	= arc_pgu_crtc_atomic_disable,
-};
-
-static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
-					struct drm_plane_state *state)
+static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
+			   struct drm_plane_state *state)
 {
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_cma_object *gem;
 
-	if (!plane->state->crtc || !plane->state->fb)
+	if (!pipe->plane.state->crtc || !pipe->plane.state->fb)
 		return;
 
-	arcpgu = crtc_to_arcpgu_priv(plane->state->crtc);
-	gem = drm_fb_cma_get_gem_obj(plane->state->fb, 0);
+	arcpgu = pipe_to_arcpgu_priv(pipe);
+	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
 }
 
-static const struct drm_plane_helper_funcs arc_pgu_plane_helper_funcs = {
-	.atomic_update = arc_pgu_plane_atomic_update,
+static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
+	.update = arc_pgu_update,
+	.mode_valid = arc_pgu_mode_valid,
+	.enable	= arc_pgu_enable,
+	.disable = arc_pgu_disable,
 };
 
-static void arc_pgu_plane_destroy(struct drm_plane *plane)
-{
-	drm_plane_cleanup(plane);
-}
-
-static const struct drm_plane_funcs arc_pgu_plane_funcs = {
-	.update_plane		= drm_atomic_helper_update_plane,
-	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= arc_pgu_plane_destroy,
-	.reset			= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
-};
-
-static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
+int arc_pgu_setup_pipe(struct drm_device *drm)
 {
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-	struct drm_plane *plane = NULL;
-	int ret;
-
-	plane = &arcpgu->pipe.plane;
-
-	ret = drm_universal_plane_init(drm, plane, 0xff, &arc_pgu_plane_funcs,
-				       arc_pgu_supported_formats,
-				       ARRAY_SIZE(arc_pgu_supported_formats),
-				       NULL,
-				       DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret)
-		return ERR_PTR(ret);
-
-	drm_plane_helper_add(plane, &arc_pgu_plane_helper_funcs);
-
-	return plane;
-}
-
-int arc_pgu_setup_crtc(struct drm_device *drm)
-{
-	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-	struct drm_plane *primary;
-	int ret;
-
-	primary = arc_pgu_plane_init(drm);
-	if (IS_ERR(primary))
-		return PTR_ERR(primary);
-
-	ret = drm_crtc_init_with_planes(drm, &arcpgu->pipe.crtc, primary, NULL,
-					&arc_pgu_crtc_funcs, NULL);
-	if (ret)
-		return ret;
 
-	drm_crtc_helper_add(&arcpgu->pipe.crtc, &arc_pgu_crtc_helper_funcs);
-	return 0;
+	return drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
+					    arc_pgu_supported_formats,
+					    ARRAY_SIZE(arc_pgu_supported_formats),
+					    NULL, NULL);
 }
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 6349e9dc770e..222ab28efbd0 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -70,7 +70,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
-	if (arc_pgu_setup_crtc(drm) < 0)
+	if (arc_pgu_setup_pipe(drm) < 0)
 		return -ENODEV;
 
 	/*
diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
index 925d6d31bb78..d430af686cbc 100644
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
@@ -12,32 +12,16 @@
 
 #include "arcpgu.h"
 
-static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 {
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
 
-	int ret = 0;
-
-	encoder = &arcpgu->pipe.encoder;
-
 	/* Locate drm bridge from the hdmi encoder DT node */
 	bridge = of_drm_find_bridge(np);
 	if (!bridge)
 		return -EPROBE_DEFER;
 
-	encoder->possible_crtcs = 1;
-	encoder->possible_clones = 0;
-	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
-	if (ret)
-		return ret;
-
 	/* Link drm_bridge to encoder */
-	return drm_bridge_attach(encoder, bridge, NULL, 0);
+	return drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
