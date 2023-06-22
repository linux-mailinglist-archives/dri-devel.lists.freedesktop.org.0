Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56E739CB0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F85B10E521;
	Thu, 22 Jun 2023 09:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029F910E505
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by michel.telenet-ops.be with bizsmtp
 id C9Nj2A00T1yfRTD069NjDD; Thu, 22 Jun 2023 11:22:43 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWX-000Bws-Vm;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003VxX-In;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 25/39] drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
Date: Thu, 22 Jun 2023 11:21:37 +0200
Message-Id: <b3daca80f82625ba14e3aeaf2fca6dcefa056e47.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the "crtc" member of the shmob_drm_crtc subclass structure to
"base", to improve readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 26 +++++++++----------
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 3f6af12f45988124..3f0b71253ed929c9 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -64,7 +64,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
 
 static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 {
-	struct drm_crtc *crtc = &scrtc->crtc;
+	struct drm_crtc *crtc = &scrtc->base;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	const struct drm_display_info *info = &sdev->connector->display_info;
 	const struct drm_display_mode *mode = &crtc->mode;
@@ -152,7 +152,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 
 static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 {
-	struct shmob_drm_device *sdev = to_shmob_device(scrtc->crtc.dev);
+	struct shmob_drm_device *sdev = to_shmob_device(scrtc->base.dev);
 	u32 value;
 
 	value = lcdc_read(sdev, LDCNT2R);
@@ -185,7 +185,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
  */
 static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 {
-	struct drm_crtc *crtc = &scrtc->crtc;
+	struct drm_crtc *crtc = &scrtc->base;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct shmob_drm_format_info *format;
@@ -272,7 +272,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 
 static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 {
-	struct drm_crtc *crtc = &scrtc->crtc;
+	struct drm_crtc *crtc = &scrtc->base;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
 	if (!scrtc->started)
@@ -308,7 +308,7 @@ void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc)
 static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 					int x, int y)
 {
-	struct drm_crtc *crtc = &scrtc->crtc;
+	struct drm_crtc *crtc = &scrtc->base;
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	struct drm_gem_dma_object *gem;
 	unsigned int bpp;
@@ -329,7 +329,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 
 static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 {
-	struct drm_crtc *crtc = &scrtc->crtc;
+	struct drm_crtc *crtc = &scrtc->base;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
 	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
@@ -343,7 +343,7 @@ static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 
 static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
 {
-	return container_of(crtc, struct shmob_drm_crtc, crtc);
+	return container_of(crtc, struct shmob_drm_crtc, base);
 }
 
 static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
@@ -415,15 +415,15 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
 void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_pending_vblank_event *event;
-	struct drm_device *dev = scrtc->crtc.dev;
+	struct drm_device *dev = scrtc->base.dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
 	event = scrtc->event;
 	scrtc->event = NULL;
 	if (event) {
-		drm_crtc_send_vblank_event(&scrtc->crtc, event);
-		drm_crtc_vblank_put(&scrtc->crtc);
+		drm_crtc_send_vblank_event(&scrtc->base, event);
+		drm_crtc_vblank_put(&scrtc->base);
 	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
@@ -435,7 +435,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
 				    struct drm_modeset_acquire_ctx *ctx)
 {
 	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-	struct drm_device *dev = scrtc->crtc.dev;
+	struct drm_device *dev = scrtc->base.dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -450,7 +450,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
 
 	if (event) {
 		event->pipe = 0;
-		drm_crtc_vblank_get(&scrtc->crtc);
+		drm_crtc_vblank_get(&scrtc->base);
 		spin_lock_irqsave(&dev->event_lock, flags);
 		scrtc->event = event;
 		spin_unlock_irqrestore(&dev->event_lock, flags);
@@ -502,7 +502,7 @@ static const struct drm_crtc_funcs crtc_funcs = {
 
 int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 {
-	struct drm_crtc *crtc = &sdev->crtc.crtc;
+	struct drm_crtc *crtc = &sdev->crtc.base;
 	struct drm_plane *primary, *plane;
 	unsigned int i;
 	int ret;
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index f507eaf912e16a22..79cce0a0ada4cfce 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -21,7 +21,7 @@ struct shmob_drm_device;
 struct shmob_drm_format_info;
 
 struct shmob_drm_crtc {
-	struct drm_crtc crtc;
+	struct drm_crtc base;
 
 	struct drm_pending_vblank_event *event;
 	int dpms;
-- 
2.34.1

