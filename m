Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8C739CBC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09D710E536;
	Thu, 22 Jun 2023 09:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7F410E50D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by andre.telenet-ops.be with bizsmtp
 id C9Nj2A00d1yfRTD019NjNq; Thu, 22 Jun 2023 11:22:43 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWX-000BwY-Rs;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003Vx8-EB;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 20/39] drm: renesas: shmobile: Replace .dev_private with
 container_of()
Date: Thu, 22 Jun 2023 11:21:32 +0200
Message-Id: <48a0d1dcdf18ca07b97e2813ba26f9e52198a716.1687423204.git.geert+renesas@glider.be>
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

Now that drm_device is embedded in shmob_drm_device, we can use
a container_of()-based helper to get the shmob_drm_device pointer from
the drm_device, instead of using the deprecated drm_device.dev_private
field.

While at it, restore reverse Xmas tree ordering of local variable
declarations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 20 +++++++++----------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  4 +---
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  5 +++++
 .../drm/renesas/shmobile/shmob_drm_plane.c    |  6 +++---
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 40948b56017ff2df..291b3a5014c24f08 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -63,7 +63,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
 static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct drm_display_mode *mode = &crtc->mode;
 	u32 value;
@@ -102,7 +102,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 
 static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 {
-	struct shmob_drm_device *sdev = scrtc->crtc.dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(scrtc->crtc.dev);
 	u32 value;
 
 	value = lcdc_read(sdev, LDCNT2R);
@@ -136,7 +136,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct shmob_drm_format_info *format;
 	struct drm_device *dev = &sdev->ddev;
@@ -223,7 +223,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
 	if (!scrtc->started)
 		return;
@@ -280,7 +280,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
 	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
 
@@ -322,8 +322,8 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
 				   int x, int y,
 				   struct drm_framebuffer *old_fb)
 {
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
 	const struct shmob_drm_format_info *format;
 
 	format = shmob_drm_format_info(crtc->primary->fb->format->format);
@@ -428,7 +428,7 @@ static void shmob_drm_crtc_enable_vblank(struct shmob_drm_device *sdev,
 
 static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
 {
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
 	shmob_drm_crtc_enable_vblank(sdev, true);
 
@@ -437,7 +437,7 @@ static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
 
 static void shmob_drm_disable_vblank(struct drm_crtc *crtc)
 {
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
 	shmob_drm_crtc_enable_vblank(sdev, false);
 }
@@ -511,7 +511,7 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 					 struct drm_display_mode *adjusted_mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct shmob_drm_device *sdev = dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(dev);
 	struct drm_connector *connector = &sdev->connector.connector;
 	const struct drm_display_mode *panel_mode;
 
@@ -581,7 +581,7 @@ static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connecto
 
 static int shmob_drm_connector_get_modes(struct drm_connector *connector)
 {
-	struct shmob_drm_device *sdev = connector->dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(connector->dev);
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_create(connector->dev);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 2b77af3a8c97ef8c..1a1d66c6e817e227 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -95,7 +95,7 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
 static irqreturn_t shmob_drm_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
-	struct shmob_drm_device *sdev = dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(dev);
 	unsigned long flags;
 	u32 status;
 
@@ -217,8 +217,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ddev->dev_private = sdev;
-
 	ret = shmob_drm_modeset_init(sdev);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
index 77bb0da48f37ace8..5e55ba7a207865bd 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
@@ -39,4 +39,9 @@ struct shmob_drm_device {
 	struct shmob_drm_connector connector;
 };
 
+static inline struct shmob_drm_device *to_shmob_device(struct drm_device *dev)
+{
+	return container_of(dev, struct shmob_drm_device, ddev);
+}
+
 #endif /* __SHMOB_DRM_DRV_H__ */
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 258288c80756bf16..c58b9dca34736342 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -63,7 +63,7 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 				    struct drm_framebuffer *fb)
 {
-	struct shmob_drm_device *sdev = splane->plane.dev->dev_private;
+	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
 	u32 format;
 
 	/* TODO: Support ROP3 mode */
@@ -135,8 +135,8 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
 		       uint32_t src_w, uint32_t src_h,
 		       struct drm_modeset_acquire_ctx *ctx)
 {
+	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
 	struct shmob_drm_plane *splane = to_shmob_plane(plane);
-	struct shmob_drm_device *sdev = plane->dev->dev_private;
 	const struct shmob_drm_format_info *format;
 
 	format = shmob_drm_format_info(fb->format->format);
@@ -167,8 +167,8 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
 static int shmob_drm_plane_disable(struct drm_plane *plane,
 				   struct drm_modeset_acquire_ctx *ctx)
 {
+	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
 	struct shmob_drm_plane *splane = to_shmob_plane(plane);
-	struct shmob_drm_device *sdev = plane->dev->dev_private;
 
 	splane->format = NULL;
 
-- 
2.34.1

