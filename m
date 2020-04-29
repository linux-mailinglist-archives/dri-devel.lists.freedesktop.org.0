Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF61BE110
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B686EEB0;
	Wed, 29 Apr 2020 14:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6156EEA9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:32:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B31EAE63;
 Wed, 29 Apr 2020 14:32:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH 06/17] drm/mgag200: Clean up mga_crtc_do_set_base()
Date: Wed, 29 Apr 2020 16:32:27 +0200
Message-Id: <20200429143238.10115-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200429143238.10115-1-tzimmermann@suse.de>
References: <20200429143238.10115-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function now only takes the device structure, and the old and new
framebuffers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index b16a73c8617d6..12df809d64f7c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -861,21 +861,20 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
-static int mga_crtc_do_set_base(struct drm_crtc *crtc,
-				struct drm_framebuffer *fb,
-				int x, int y, int atomic)
+static int mga_crtc_do_set_base(struct mga_device *mdev,
+				const struct drm_framebuffer *fb,
+				const struct drm_framebuffer *old_fb)
 {
-	struct mga_device *mdev = crtc->dev->dev_private;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	s64 gpu_addr;
 
-	if (!atomic && fb) {
-		gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	if (old_fb) {
+		gbo = drm_gem_vram_of_gem(old_fb->obj[0]);
 		drm_gem_vram_unpin(gbo);
 	}
 
-	gbo = drm_gem_vram_of_gem(crtc->primary->fb->obj[0]);
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 
 	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 	if (ret)
@@ -900,6 +899,7 @@ static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = dev->dev_private;
+	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int count;
 
 	while (RREG8(0x1fda) & 0x08) { }
@@ -908,7 +908,7 @@ static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	count = RREG8(MGAREG_VCOUNT) + 2;
 	while (RREG8(MGAREG_VCOUNT) < count) { }
 
-	return mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
+	return mga_crtc_do_set_base(mdev, fb, old_fb);
 }
 
 static int mga_crtc_mode_set(struct drm_crtc *crtc,
@@ -1150,7 +1150,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 
 	WREG8(MGA_MISC_OUT, misc);
 
-	mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
+	mga_crtc_do_set_base(mdev, fb, old_fb);
 
 	/* reset tagfifo */
 	if (mdev->type == G200_ER) {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
