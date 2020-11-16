Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B12B51E1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386036EA54;
	Mon, 16 Nov 2020 20:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587B989CC1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:04:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90533AEBE;
 Mon, 16 Nov 2020 20:04:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com
Subject: [PATCH 10/10] drm/fb-helper: Acquire modeset lock around
 shadow-buffer flushing
Date: Mon, 16 Nov 2020 21:04:37 +0100
Message-Id: <20201116200437.17977-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116200437.17977-1-tzimmermann@suse.de>
References: <20201116200437.17977-1-tzimmermann@suse.de>
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

Flushing the fbdev's shadow buffer requires vmap'ing the BO memory, which
in turn requires pinning the BO. While being pinned, the BO cannot be moved
into VRAM for scanout. Consequently, a concurrent modeset operation that
involves the fbdev framebuffer would likely fail.

Resolve this problem be acquiring the modeset lock of the planes that use
the fbdev framebuffer. On non-atomic drivers, also acquire the mode-config
lock. This serializes the flushing of the framebuffer with concurrent
modeset operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 43 +++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 5a22c744378c..af485c71a42a 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -394,20 +394,59 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
 static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 				     struct drm_clip_rect *clip)
 {
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_framebuffer *fb = fb_helper->fb;
 	struct drm_client_buffer *buffer = fb_helper->buffer;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_framebuffer *plane_fb;
+	struct drm_plane *plane;
 	struct dma_buf_map map, dst;
 	int ret;
 
+	if (!drm_drv_uses_atomic_modeset(dev))
+		mutex_lock(&dev->mode_config.mutex);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry:
+	drm_for_each_plane(plane, dev) {
+		ret = drm_modeset_lock(&plane->mutex, &ctx);
+		if (ret == -EDEADLK) {
+			ret = drm_modeset_backoff(&ctx);
+			if (!ret)
+				goto retry;
+		} else if (ret) {
+			goto out;
+		}
+
+		if (drm_drv_uses_atomic_modeset(dev))
+			plane_fb = plane->state->fb;
+		else
+			plane_fb = plane->fb;
+
+		if (plane_fb != fb) {
+			drm_modeset_unlock(&plane->mutex);
+			continue;
+		}
+	}
+
 	ret = drm_client_buffer_vmap(buffer, &map);
 	if (ret)
-		return ret;
+		goto out;
 
 	dst = map;
 	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
 
 	drm_client_buffer_vunmap(buffer);
 
-	return 0;
+out:
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		mutex_unlock(&dev->mode_config.mutex);
+
+	return ret;
 }
 
 static void drm_fb_helper_damage_work(struct work_struct *work)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
