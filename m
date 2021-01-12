Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C1B2F2A3E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C826E147;
	Tue, 12 Jan 2021 08:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51DE6E139
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n16so1315800wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmrQC6alLLAWP17MoNHkPxL0iJLFbL+7QwTD8zCh7bc=;
 b=E3trlPdfKLwNDv5EktNR+gMHmurIkqG8R+UX1Z/JPeCUd6M6S4Xpnzd5sF32aqeN+7
 H7HMxa+/fFkAeGEUh1VsOjDlxZahc/R9JluCwTb3BnGG+cibUiNhULhDUry60CS6hvCw
 84XtquLnU/GPH2mr13vzRI2nW5BdywgFAa7RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmrQC6alLLAWP17MoNHkPxL0iJLFbL+7QwTD8zCh7bc=;
 b=iiZqHN/MTXBav9RmE1dZYASNY0a/AmiE26UB679rlW1uhDm1FW70S8qfaYkj6ORJa6
 XZkX6QDbBwb4DUXpGSdVgNZep/LsgRMnNkBMGOvkRTF/DrrX8L3trnGVo+O/miWORn5R
 I0SzGMNsWJpI0N5JYvv7PXCM46p3rIPGdVB48kgZz16ap6Fv6svOGlv0+414jGuV/EMO
 rPFhYRmBz1JiKAkSuont7zcXMvQh1DuSLcvOHPKtNvpasxMdbwxJdtIvwo3VyyrOHjBe
 cyI6u0lgLutWd1JCeDU6MjdhYv3hF0sCL2kIlDp5bi24WQ7Muw9WMp8KooXZyUyssdCO
 jlPA==
X-Gm-Message-State: AOAM532vQgd7py2sbGHd/z0/oiI0ANuV8oVmxoqLWl43R89ylIknRrkp
 VS+utJvJ6vTP6pCWYjo0c1ghC9HGW+Ux9YmN
X-Google-Smtp-Source: ABdhPJzD18RGIvXPalobljNrMBCrw9r9RFETDfFZzJwGorSf3+La/3pA03kXsuHFoEjetnkAe0cWfA==
X-Received: by 2002:a1c:e4c5:: with SMTP id b188mr1914265wmh.78.1610441056823; 
 Tue, 12 Jan 2021 00:44:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:16 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/15] drm/arc: Inline arcpgu_crtc.c
Date: Tue, 12 Jan 2021 09:43:54 +0100
Message-Id: <20210112084358.2771527-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, tiantao6@hisilicon.com,
 Daniel Vetter <daniel.vetter@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Really not big anymore.

Note that we no longer clamp all errors to ENODEV, highlighted by Sam.

v2: Fixup update function, bug reported by Eugeniy

v3: Delete now unused crtc funcs (0day)

v4: Move encoder removal to right patch (Sam).

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/Makefile      |   2 +-
 drivers/gpu/drm/arc/arcpgu.h      |   1 -
 drivers/gpu/drm/arc/arcpgu_crtc.c | 160 ------------------------------
 drivers/gpu/drm/arc/arcpgu_drv.c  | 141 +++++++++++++++++++++++++-
 4 files changed, 140 insertions(+), 164 deletions(-)
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c

diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
index c7028b7427b3..c686e0287a71 100644
--- a/drivers/gpu/drm/arc/Makefile
+++ b/drivers/gpu/drm/arc/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
+arcpgu-y := arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
 obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index b5c699d14f27..cee2448a07d6 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -34,7 +34,6 @@ static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
 	return ioread32(arcpgu->regs + reg);
 }
 
-int arc_pgu_setup_pipe(struct drm_device *dev);
 int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
 int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np);
 
diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
deleted file mode 100644
index 30fbb3052bc7..000000000000
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ /dev/null
@@ -1,160 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ARC PGU DRM driver.
- *
- * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
- */
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
-#include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
-#include <drm/drm_probe_helper.h>
-#include <linux/clk.h>
-#include <linux/platform_data/simplefb.h>
-
-#include "arcpgu.h"
-#include "arcpgu_regs.h"
-
-#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
-
-static const u32 arc_pgu_supported_formats[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-};
-
-static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
-{
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
-	uint32_t pixel_format = fb->format->format;
-	u32 format = DRM_FORMAT_INVALID;
-	int i;
-	u32 reg_ctrl;
-
-	for (i = 0; i < ARRAY_SIZE(arc_pgu_supported_formats); i++) {
-		if (arc_pgu_supported_formats[i] == pixel_format)
-			format = arc_pgu_supported_formats[i];
-	}
-
-	if (WARN_ON(format == DRM_FORMAT_INVALID))
-		return;
-
-	reg_ctrl = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
-	if (format == DRM_FORMAT_RGB565)
-		reg_ctrl &= ~ARCPGU_MODE_XRGB8888;
-	else
-		reg_ctrl |= ARCPGU_MODE_XRGB8888;
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
-}
-
-static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
-					       const struct drm_display_mode *mode)
-{
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
-	long rate, clk_rate = mode->clock * 1000;
-	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
-
-	rate = clk_round_rate(arcpgu->clk, clk_rate);
-	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))
-		return MODE_OK;
-
-	return MODE_NOCLOCK;
-}
-
-static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
-{
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
-	u32 val;
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
-		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
-		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
-				    m->crtc_hsync_end - m->crtc_hdisplay));
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
-		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
-				    m->crtc_vsync_end - m->crtc_vdisplay));
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
-		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
-				    m->crtc_vblank_end - m->crtc_vblank_start));
-
-	val = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
-
-	if (m->flags & DRM_MODE_FLAG_PVSYNC)
-		val |= ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST;
-	else
-		val &= ~(ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST);
-
-	if (m->flags & DRM_MODE_FLAG_PHSYNC)
-		val |= ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST;
-	else
-		val &= ~(ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST);
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, val);
-	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
-	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
-
-	arc_pgu_set_pxl_fmt(arcpgu);
-
-	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
-}
-
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
-{
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
-
-	arc_pgu_mode_set(arcpgu);
-
-	clk_prepare_enable(arcpgu->clk);
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
-		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
-		      ARCPGU_CTRL_ENABLE_MASK);
-}
-
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
-{
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
-
-	clk_disable_unprepare(arcpgu->clk);
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
-			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
-			      ~ARCPGU_CTRL_ENABLE_MASK);
-}
-
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
-{
-	struct arcpgu_drm_private *arcpgu;
-	struct drm_gem_cma_object *gem;
-
-	if (!pipe->plane.state->fb)
-		return;
-
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
-	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
-}
-
-static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
-	.update = arc_pgu_update,
-	.mode_valid = arc_pgu_mode_valid,
-	.enable	= arc_pgu_enable,
-	.disable = arc_pgu_disable,
-};
-
-int arc_pgu_setup_pipe(struct drm_device *drm)
-{
-	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-
-	return drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					    arc_pgu_supported_formats,
-					    ARRAY_SIZE(arc_pgu_supported_formats),
-					    NULL, NULL);
-}
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 222ab28efbd0..e49e80b8b089 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -12,6 +12,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
@@ -24,6 +25,138 @@
 #include "arcpgu.h"
 #include "arcpgu_regs.h"
 
+#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
+
+static const u32 arc_pgu_supported_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+};
+
+static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
+{
+	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
+	uint32_t pixel_format = fb->format->format;
+	u32 format = DRM_FORMAT_INVALID;
+	int i;
+	u32 reg_ctrl;
+
+	for (i = 0; i < ARRAY_SIZE(arc_pgu_supported_formats); i++) {
+		if (arc_pgu_supported_formats[i] == pixel_format)
+			format = arc_pgu_supported_formats[i];
+	}
+
+	if (WARN_ON(format == DRM_FORMAT_INVALID))
+		return;
+
+	reg_ctrl = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
+	if (format == DRM_FORMAT_RGB565)
+		reg_ctrl &= ~ARCPGU_MODE_XRGB8888;
+	else
+		reg_ctrl |= ARCPGU_MODE_XRGB8888;
+	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
+}
+
+static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
+					       const struct drm_display_mode *mode)
+{
+	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	long rate, clk_rate = mode->clock * 1000;
+	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
+
+	rate = clk_round_rate(arcpgu->clk, clk_rate);
+	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))
+		return MODE_OK;
+
+	return MODE_NOCLOCK;
+}
+
+static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
+{
+	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	u32 val;
+
+	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
+		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
+
+	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
+		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
+				    m->crtc_hsync_end - m->crtc_hdisplay));
+
+	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
+		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
+				    m->crtc_vsync_end - m->crtc_vdisplay));
+
+	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
+		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
+				    m->crtc_vblank_end - m->crtc_vblank_start));
+
+	val = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
+
+	if (m->flags & DRM_MODE_FLAG_PVSYNC)
+		val |= ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST;
+	else
+		val &= ~(ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST);
+
+	if (m->flags & DRM_MODE_FLAG_PHSYNC)
+		val |= ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST;
+	else
+		val &= ~(ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST);
+
+	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, val);
+	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
+	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
+
+	arc_pgu_set_pxl_fmt(arcpgu);
+
+	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
+}
+
+static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
+			   struct drm_crtc_state *crtc_state,
+			   struct drm_plane_state *plane_state)
+{
+	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+
+	arc_pgu_mode_set(arcpgu);
+
+	clk_prepare_enable(arcpgu->clk);
+	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
+		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
+		      ARCPGU_CTRL_ENABLE_MASK);
+}
+
+static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+
+	clk_disable_unprepare(arcpgu->clk);
+	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
+			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
+			      ~ARCPGU_CTRL_ENABLE_MASK);
+}
+
+static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
+			   struct drm_plane_state *state)
+{
+	struct arcpgu_drm_private *arcpgu;
+	struct drm_gem_cma_object *gem;
+
+	if (!pipe->plane.state->fb)
+		return;
+
+	arcpgu = pipe_to_arcpgu_priv(pipe);
+	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
+	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
+}
+
+static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
+	.update = arc_pgu_update,
+	.mode_valid = arc_pgu_mode_valid,
+	.enable	= arc_pgu_enable,
+	.disable = arc_pgu_disable,
+};
+
 static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
 	.fb_create  = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -70,8 +203,12 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
-	if (arc_pgu_setup_pipe(drm) < 0)
-		return -ENODEV;
+	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
+					   arc_pgu_supported_formats,
+					   ARRAY_SIZE(arc_pgu_supported_formats),
+					   NULL, NULL);
+	if (ret)
+		return ret;
 
 	/*
 	 * There is only one output port inside each device. It is linked with
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
