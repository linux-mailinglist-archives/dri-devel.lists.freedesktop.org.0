Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BE198E09
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDED89C52;
	Tue, 31 Mar 2020 08:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F1189C52
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:11:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 98D38AC46;
 Tue, 31 Mar 2020 08:11:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, sam@ravnborg.org, kraxel@redhat.com
Subject: [PATCH] drm/vram-helpers: Set plane fence for display update
Date: Tue, 31 Mar 2020 10:11:30 +0200
Message-Id: <20200331081130.24600-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
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

Calling the VRAM helper's prepare_fb() helper now sets the plane's
fence object. The helper still has to synchronize with other users
of the GEM object. Leave a related TODO comment in the code.

This will be useful for PRIME support. VRAM helpers don't support
buffer sharing ATM, so there are no drivers requiring this change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b3201a70cbfcb..d4e4f80d3a6c1 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -5,6 +5,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_mode.h>
@@ -670,9 +671,9 @@ EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset);
  * @plane:	a DRM plane
  * @new_state:	the plane's new state
  *
- * During plane updates, this function pins the GEM VRAM
- * objects of the plane's new framebuffer to VRAM. Call
- * drm_gem_vram_plane_helper_cleanup_fb() to unpin them.
+ * During plane updates, this function sets the plane's fence and
+ * pins the GEM VRAM objects of the plane's new framebuffer to VRAM.
+ * Call drm_gem_vram_plane_helper_cleanup_fb() to unpin them.
  *
  * Returns:
  *	0 on success, or
@@ -689,6 +690,13 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
 	if (!new_state->fb)
 		return 0;
 
+	/*
+	 * TODO: Synchronize with other users of the buffer. Buffers
+	 *       cannot be pinned to VRAM while they are in use by other
+	 *       drivers for DMA. We should probably wait for each GEM
+	 *       object's fence before attempting to pin the buffer.
+	 *       There are currently no users of this functionality.
+	 */
 	for (i = 0; i < ARRAY_SIZE(new_state->fb->obj); ++i) {
 		if (!new_state->fb->obj[i])
 			continue;
@@ -698,6 +706,10 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
 			goto err_drm_gem_vram_unpin;
 	}
 
+	ret = drm_gem_fb_prepare_fb(plane, new_state);
+	if (ret)
+		goto err_drm_gem_vram_unpin;
+
 	return 0;
 
 err_drm_gem_vram_unpin:
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
