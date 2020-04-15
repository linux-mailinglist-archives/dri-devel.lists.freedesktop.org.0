Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D11A94CB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C4E6E8CA;
	Wed, 15 Apr 2020 07:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7514D6E894
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x25so16192061wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mq7mUngIckfcEE9WC/4T/qM1cP9pIF5xh8y8wZH0Buk=;
 b=hfKOLKvGCrcmAqlf1nldoN/neOAjYC0MgFAB+oS1a+kV5XWYU/Bs85ivBqtafsFQQQ
 I20HEMBnvI6ltjqH7Fy0CvDq7fhc0IVt1yEGHGRNnFNWM9kv37mawGHT84vx70o/sIng
 G1gevxTLn6/umF9jmije4RxAEq9EUyQeSir3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mq7mUngIckfcEE9WC/4T/qM1cP9pIF5xh8y8wZH0Buk=;
 b=p23407R6jO67pCd1Ojbwgc5lQXSkRjjaCk86XSzLgot0eLpuwduSW8z3AcQbBY3wlJ
 UMHSfs8YnSy9LZk3auoDjr1vo5k8B2XepjCt/88lgxJEQeLGetM/AL5r9ie2hG+xRnAa
 hMLFRK1+oP7/JF0RckRCcE02ha9NYehPG/QcxcjjvM0KyRWnx0Qw4YaOToL59LNzd6jy
 CIuWQvUSCJmmHi5NGZTPFfQ3o+Z5suirm6ZGmmMnXC/Er9m66COFBU5RVAuMNtR0qndn
 APD/iDPz2Z9JWthD93pL40a3pvS/cFJxaZV28b3I19SDt4Qaa989qJMlS6ZleP576Xn5
 8Biw==
X-Gm-Message-State: AGi0PuaBE7YeePdBF6Tm6kCjrbCZPYVp39aQJx7Knkbck/NHHj/1X2mj
 V0KM09XT8UrNfuz4OIfjMNBnSKKHtWc=
X-Google-Smtp-Source: APiQypKzmqMHGE1aeZ5gsK7mFtTPkzm4RyN84r8DThbKDYi73wUOaYc9msgKVG6pQBme5CZWZ9P3Rw==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr3565522wmc.64.1586936466014; 
 Wed, 15 Apr 2020 00:41:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 24/59] drm/tidss: Don't use drm_device->dev_private
Date: Wed, 15 Apr 2020 09:39:59 +0200
Message-Id: <20200415074034.175360-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

Tested-by: Jyri Sarha <jsarha@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
