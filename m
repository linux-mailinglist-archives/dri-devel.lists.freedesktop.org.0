Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8583F19D857
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ACC6EBD5;
	Fri,  3 Apr 2020 13:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9939A6EBD7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m17so8610726wrw.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+g5KtXBmKHLKcJuRZDGZSq0nikDbAKglCC+lLBd+Rc=;
 b=g0nWEJTXyQ9cN6t7R7d5N/RZwuhklTjM0CyB3SvwbX+ob41Oof5m476Rre2Yo3F3jB
 VYiQOkWRuxjG9SDM4o40FgvWimzmf5jeQONSEigksWcZlZY2Lns4c7mt/BYtjN7g04M4
 A+hWx+FkypGyr3H4KLFJhgDFlYDg4Sl1fI3gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+g5KtXBmKHLKcJuRZDGZSq0nikDbAKglCC+lLBd+Rc=;
 b=YeilXHYIEV/A0WLgH0nok9ZKx2oL5K/TxCnd679NpAWRqa/09ENMGO3mQqmM8Cyr5L
 CXTtEvbm4k460X0xuXyWphUVvmH/g0qYZx/Ongt5GkTioxFIqykDsMdOySE6LYy8Js+R
 C/fXigc78c1pXtUYRM8KEabXkeVE/eug9ZS2ShwdsEDZiMqzD6o+94edEFhPKl7vmUui
 Xk+E8pX/l4smES7ztK9gvc57fjJ1MK4SIIPdQ+WopA4vtq8qeX7a/atHuZrzMxHph/x1
 dcEWm+Jd8qa0R9cGP6JVlrV6XqtSvkvPesrdn52a9bHxgbKlUVZrukAMD+MyWjFc0eZJ
 VoFg==
X-Gm-Message-State: AGi0PuapIJ+FeCVhxwR//2TRR6gySIrKyc9MPhRoVPGF7B9lQoh/eKbu
 H0F4d5/EWIEvXrzhlsMIF5tvb8pgrlFexw==
X-Google-Smtp-Source: APiQypLPNWm63Im+uh2brIIVnuEvjSiVzZByY+1O3ioy+jsmsxp1oavSGfJS2QNEgXyy+IsOd3UBkQ==
X-Received: by 2002:a5d:4bc1:: with SMTP id l1mr9870049wrt.103.1585922346846; 
 Fri, 03 Apr 2020 06:59:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/44] drm/tidss: Don't use drm_device->dev_private
Date: Fri,  3 Apr 2020 15:58:12 +0200
Message-Id: <20200403135828.2542770-29-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 16 ++++++++--------
 drivers/gpu/drm/tidss/tidss_drv.c   |  2 --
 drivers/gpu/drm/tidss/tidss_drv.h   |  2 ++
 drivers/gpu/drm/tidss/tidss_irq.c   | 12 ++++++------
 drivers/gpu/drm/tidss/tidss_kms.c   |  2 +-
 drivers/gpu/drm/tidss/tidss_plane.c |  6 +++---
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index d4ce9bab8c7e..2396262c09e4 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -24,7 +24,7 @@
 static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
 {
 	struct drm_device *ddev = tcrtc->crtc.dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	struct drm_pending_vblank_event *event;
 	unsigned long flags;
 	bool busy;
@@ -88,7 +88,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_crtc_state *state)
 {
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	struct dispc_device *dispc = tidss->dispc;
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
@@ -165,7 +165,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
 	dev_dbg(ddev->dev,
@@ -216,7 +216,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	unsigned long flags;
 	int r;
@@ -259,7 +259,7 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
 	dev_dbg(ddev->dev, "%s, event %p\n", __func__, crtc->state->event);
@@ -295,7 +295,7 @@ enum drm_mode_status tidss_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 
 	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
 }
@@ -314,7 +314,7 @@ static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
 static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
@@ -328,7 +328,7 @@ static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
 static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 7d4465d58be8..99edc66ebdef 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -147,8 +147,6 @@ static int tidss_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tidss);
 
-	ddev->dev_private = tidss;
-
 	ret = dispc_init(tidss);
 	if (ret) {
 		dev_err(dev, "failed to initialize dispc: %d\n", ret);
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index e2aa6436ad18..b23cd95c8d78 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -33,6 +33,8 @@ struct tidss_device {
 	struct drm_atomic_state *saved_state;
 };
 
+#define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
+
 int tidss_runtime_get(struct tidss_device *tidss);
 void tidss_runtime_put(struct tidss_device *tidss);
 
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 612c046738e5..1b80f2d62e0a 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -23,7 +23,7 @@ static void tidss_irq_update(struct tidss_device *tidss)
 void tidss_irq_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
 	unsigned long flags;
@@ -38,7 +38,7 @@ void tidss_irq_enable_vblank(struct drm_crtc *crtc)
 void tidss_irq_disable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *ddev = crtc->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
 	unsigned long flags;
@@ -53,7 +53,7 @@ void tidss_irq_disable_vblank(struct drm_crtc *crtc)
 irqreturn_t tidss_irq_handler(int irq, void *arg)
 {
 	struct drm_device *ddev = (struct drm_device *)arg;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned int id;
 	dispc_irq_t irqstatus;
 
@@ -95,7 +95,7 @@ void tidss_irq_resume(struct tidss_device *tidss)
 
 void tidss_irq_preinstall(struct drm_device *ddev)
 {
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 
 	spin_lock_init(&tidss->wait_lock);
 
@@ -109,7 +109,7 @@ void tidss_irq_preinstall(struct drm_device *ddev)
 
 int tidss_irq_postinstall(struct drm_device *ddev)
 {
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 	unsigned int i;
 
@@ -138,7 +138,7 @@ int tidss_irq_postinstall(struct drm_device *ddev)
 
 void tidss_irq_uninstall(struct drm_device *ddev)
 {
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 
 	tidss_runtime_get(tidss);
 	dispc_set_irqenable(tidss->dispc, 0);
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 4bd339a467a4..4b99e9fa84a5 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -25,7 +25,7 @@
 static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *ddev = old_state->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index ff99b2dd4a17..23bb3e59504b 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -22,7 +22,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
 	struct drm_device *ddev = plane->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
 	const struct drm_format_info *finfo;
 	struct drm_crtc_state *crtc_state;
@@ -101,7 +101,7 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
 	struct drm_device *ddev = plane->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	u32 hw_videoport;
@@ -133,7 +133,7 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
 	struct drm_device *ddev = plane->dev;
-	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
