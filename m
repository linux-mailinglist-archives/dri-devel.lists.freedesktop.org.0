Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF96F199239
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 11:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B376A6E5BB;
	Tue, 31 Mar 2020 09:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99776E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 218C2AFC3;
 Tue, 31 Mar 2020 09:27:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, sam@ravnborg.org, kraxel@redhat.com
Subject: [PATCH v2] drm/vram-helpers: Set plane fence for display update
Date: Tue, 31 Mar 2020 11:27:40 +0200
Message-Id: <20200331092740.29282-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling the VRAM helper's prepare_fb() helper now sets the plane's
fence object. This will be useful for PRIME support. VRAM helpers
don't support buffer sharing ATM, so for now there are no drivers
requiring this change.

v2:
	* removed a TODO comment about buffer synchronization

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b3201a70cbfcb..cdf710be39da4 100644
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
@@ -698,6 +699,10 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
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
