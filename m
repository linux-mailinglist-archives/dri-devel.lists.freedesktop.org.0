Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A41553DE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 09:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D316FBC3;
	Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83036FBC1;
 Fri,  7 Feb 2020 08:41:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 601B2B147;
 Fri,  7 Feb 2020 08:41:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH 4/6] drm/mgag200: Use simple encoder
Date: Fri,  7 Feb 2020 09:41:33 +0100
Message-Id: <20200207084135.4524-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207084135.4524-1-tzimmermann@suse.de>
References: <20200207084135.4524-1-tzimmermann@suse.de>
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mgag200 driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  7 ---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 60 +-------------------------
 2 files changed, 2 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index aa32aad222c2..9bb9e8e14539 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -95,7 +95,6 @@
 #define MATROX_DPMS_CLEARED (-1)
 
 #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
-#define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
 #define to_mga_connector(x) container_of(x, struct mga_connector, base)
 
 struct mga_crtc {
@@ -110,12 +109,6 @@ struct mga_mode_info {
 	struct mga_crtc *crtc;
 };
 
-struct mga_encoder {
-	struct drm_encoder base;
-	int last_dpms;
-};
-
-
 struct mga_i2c_chan {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 62a8e9ccb16d..d8f1a552f8ac 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1449,72 +1449,16 @@ static void mga_crtc_init(struct mga_device *mdev)
 	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
 }
 
-/*
- * The encoder comes after the CRTC in the output pipeline, but before
- * the connector. It's responsible for ensuring that the digital
- * stream is appropriately converted into the output format. Setup is
- * very simple in this case - all we have to do is inform qemu of the
- * colour depth in order to ensure that it displays appropriately
- */
-
-/*
- * These functions are analagous to those in the CRTC code, but are intended
- * to handle any encoder-specific limitations
- */
-static void mga_encoder_mode_set(struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
-{
-
-}
-
-static void mga_encoder_dpms(struct drm_encoder *encoder, int state)
-{
-	return;
-}
-
-static void mga_encoder_prepare(struct drm_encoder *encoder)
-{
-}
-
-static void mga_encoder_commit(struct drm_encoder *encoder)
-{
-}
-
-static void mga_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mga_encoder *mga_encoder = to_mga_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mga_encoder);
-}
-
-static const struct drm_encoder_helper_funcs mga_encoder_helper_funcs = {
-	.dpms = mga_encoder_dpms,
-	.mode_set = mga_encoder_mode_set,
-	.prepare = mga_encoder_prepare,
-	.commit = mga_encoder_commit,
-};
-
-static const struct drm_encoder_funcs mga_encoder_encoder_funcs = {
-	.destroy = mga_encoder_destroy,
-};
-
 static struct drm_encoder *mga_encoder_init(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
-	struct mga_encoder *mga_encoder;
 
-	mga_encoder = kzalloc(sizeof(struct mga_encoder), GFP_KERNEL);
-	if (!mga_encoder)
+	encoder = drm_simple_encoder_create(dev, DRM_MODE_ENCODER_DAC, NULL);
+	if (IS_ERR(encoder))
 		return NULL;
 
-	encoder = &mga_encoder->base;
 	encoder->possible_crtcs = 0x1;
 
-	drm_encoder_init(dev, encoder, &mga_encoder_encoder_funcs,
-			 DRM_MODE_ENCODER_DAC, NULL);
-	drm_encoder_helper_add(encoder, &mga_encoder_helper_funcs);
-
 	return encoder;
 }
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
