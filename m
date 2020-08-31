Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA62578F3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 14:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9476E1AA;
	Mon, 31 Aug 2020 12:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861176E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:08:40 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDB6F20866;
 Mon, 31 Aug 2020 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598875720;
 bh=7ySE+s8SxcPLUeWuSY40nJF3j0I+QWf2EY3nriSZ27c=;
 h=Subject:To:Cc:From:Date:From;
 b=N8+CArwZRAWqcdr3UAMLaVAZx1+3HfIm+TZaaPsUPpT6zek0UdkK8/dqVA5h2HJ6x
 /qd8H4ytnBtXesGIigUu6QCIibMc5yDAvqS7qVvt7SyDjLMuOQBBioourlSdZoNMGu
 wS7j1oCQCubkuP5mjlV8hOpVWBALpPHqLZHxKh0Y=
Subject: Patch "drm/modeset-lock: Take the modeset BKL for legacy drivers" has
 been added to the 5.8-stable tree
To: airlied@linux.ie, alexander.deucher@amd.com, alexdeucher@gmail.com,
 daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 maarten.lankhorst@linux.intel.com, michalorzel.eng@gmail.com,
 mripard@kernel.org, tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Mon, 31 Aug 2020 14:08:04 +0200
Message-ID: <1598875684169197@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/modeset-lock: Take the modeset BKL for legacy drivers

to the 5.8-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-modeset-lock-take-the-modeset-bkl-for-legacy-drivers.patch
and it can be found in the queue-5.8 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 77ef38574beb3e0b414db48e9c0f04633df68ba6 Mon Sep 17 00:00:00 2001
From: Daniel Vetter <daniel.vetter@intel.com>
Date: Fri, 14 Aug 2020 11:38:42 +0200
Subject: drm/modeset-lock: Take the modeset BKL for legacy drivers

From: Daniel Vetter <daniel.vetter@intel.com>

commit 77ef38574beb3e0b414db48e9c0f04633df68ba6 upstream.

This fell off in the conversion in

commit 9bcaa3fe58ab7559e71df798bcff6e0795158695
Author: Michal Orzel <michalorzel.eng@gmail.com>
Date:   Tue Apr 28 19:10:04 2020 +0200

    drm: Replace drm_modeset_lock/unlock_all with DRM_MODESET_LOCK_ALL_* helpers

but it's caught by the drm_warn_on_modeset_not_all_locked() that the
legacy modeset code uses. Since this is the bkl and it's unclear
what's all protected, play it safe and grab it again for legacy
drivers.

Unfortunately this means we need to sprinkle a few more #includes
around.

Also we need to add the drm_device as a parameter to the _END macro.

Finally remove the mute_lock() from setcrtc, since that's now done by
the macro.

Cc: Alex Deucher <alexdeucher@gmail.com>
References: https://gitlab.freedesktop.org/drm/amd/-/issues/1224
Fixes: 9bcaa3fe58ab ("drm: Replace drm_modeset_lock/unlock_all with DRM_MODESET_LOCK_ALL_* helpers")
Cc: Michal Orzel <michalorzel.eng@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.8+
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200814093842.3048472-1-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/drm_atomic_helper.c |    7 ++++---
 drivers/gpu/drm/drm_color_mgmt.c    |    2 +-
 drivers/gpu/drm/drm_crtc.c          |    4 +---
 drivers/gpu/drm/drm_mode_object.c   |    4 ++--
 drivers/gpu/drm/drm_plane.c         |    2 +-
 include/drm/drm_modeset_lock.h      |    9 +++++++--
 6 files changed, 16 insertions(+), 12 deletions(-)

--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -34,6 +34,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_self_refresh_helper.h>
@@ -3105,7 +3106,7 @@ void drm_atomic_helper_shutdown(struct d
 	if (ret)
 		DRM_ERROR("Disabling all crtc's during unload failed with %i\n", ret);
 
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 EXPORT_SYMBOL(drm_atomic_helper_shutdown);
 
@@ -3245,7 +3246,7 @@ struct drm_atomic_state *drm_atomic_help
 	}
 
 unlock:
-	DRM_MODESET_LOCK_ALL_END(ctx, err);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
 	if (err)
 		return ERR_PTR(err);
 
@@ -3326,7 +3327,7 @@ int drm_atomic_helper_resume(struct drm_
 
 	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);
 
-	DRM_MODESET_LOCK_ALL_END(ctx, err);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
 	drm_atomic_state_put(state);
 
 	return err;
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -294,7 +294,7 @@ int drm_mode_gamma_set_ioctl(struct drm_
 				     crtc->gamma_size, &ctx);
 
 out:
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	return ret;
 
 }
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -561,7 +561,6 @@ int drm_mode_setcrtc(struct drm_device *
 	if (crtc_req->mode_valid && !drm_lease_held(file_priv, plane->base.id))
 		return -EACCES;
 
-	mutex_lock(&crtc->dev->mode_config.mutex);
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
 				   DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 
@@ -728,8 +727,7 @@ out:
 	fb = NULL;
 	mode = NULL;
 
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
-	mutex_unlock(&crtc->dev->mode_config.mutex);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return ret;
 }
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -428,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(st
 out_unref:
 	drm_mode_object_put(obj);
 out:
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	return ret;
 }
 
@@ -470,7 +470,7 @@ static int set_property_legacy(struct dr
 		break;
 	}
 	drm_property_change_valid_put(prop, ref);
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return ret;
 }
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -791,7 +791,7 @@ static int setplane_internal(struct drm_
 					  crtc_x, crtc_y, crtc_w, crtc_h,
 					  src_x, src_y, src_w, src_h, &ctx);
 
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(plane->dev, ctx, ret);
 
 	return ret;
 }
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -164,6 +164,8 @@ int drm_modeset_lock_all_ctx(struct drm_
  * is 0, so no error checking is necessary
  */
 #define DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, flags, ret)		\
+	if (!drm_drv_uses_atomic_modeset(dev))				\
+		mutex_lock(&dev->mode_config.mutex);			\
 	drm_modeset_acquire_init(&ctx, flags);				\
 modeset_lock_retry:							\
 	ret = drm_modeset_lock_all_ctx(dev, &ctx);			\
@@ -172,6 +174,7 @@ modeset_lock_retry:							\
 
 /**
  * DRM_MODESET_LOCK_ALL_END - Helper to release and cleanup modeset locks
+ * @dev: drm device
  * @ctx: local modeset acquire context, will be dereferenced
  * @ret: local ret/err/etc variable to track error status
  *
@@ -188,7 +191,7 @@ modeset_lock_retry:							\
  * to that failure. In both of these cases the code between BEGIN/END will not
  * be run, so the failure will reflect the inability to grab the locks.
  */
-#define DRM_MODESET_LOCK_ALL_END(ctx, ret)				\
+#define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)				\
 modeset_lock_fail:							\
 	if (ret == -EDEADLK) {						\
 		ret = drm_modeset_backoff(&ctx);			\
@@ -196,6 +199,8 @@ modeset_lock_fail:							\
 			goto modeset_lock_retry;			\
 	}								\
 	drm_modeset_drop_locks(&ctx);					\
-	drm_modeset_acquire_fini(&ctx);
+	drm_modeset_acquire_fini(&ctx);					\
+	if (!drm_drv_uses_atomic_modeset(dev))				\
+		mutex_unlock(&dev->mode_config.mutex);
 
 #endif /* DRM_MODESET_LOCK_H_ */


Patches currently in stable-queue which might be from daniel.vetter@intel.com are

queue-5.8/drm-modeset-lock-take-the-modeset-bkl-for-legacy-drivers.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
