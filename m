Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3BB02B7C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 16:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D4D10E242;
	Sat, 12 Jul 2025 14:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yS9Ndd0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307EC10E242
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 14:45:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC6B9452F8;
 Sat, 12 Jul 2025 14:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C059C4CEEF;
 Sat, 12 Jul 2025 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752331518;
 bh=PziI6z5NGKSwrIbTpnBoyrnRBVkaVtpcYx529z/AuqM=;
 h=Subject:To:Cc:From:Date:From;
 b=yS9Ndd0E43cAqKlG2SuF+64uNhMgt+mQAjVOEs4vI3mN3oRLkyHO/nyyTky1Jx8a3
 sYDlRnzJ5NEK1156SNqyh0dvyeOANtRKcXck7BzKF4FZY3kva1lhpjagRXpvmBQ23P
 vZIdubwGuXLgUe7aVNu4S7ZCA7s3LHADrtTcfMCE=
Subject: Patch "drm/framebuffer: Acquire internal references on GEM handles"
 has been added to the 6.6-stable tree
To: asrivats@redhat.com, bp@alien8.de, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 linaro-mm-sig@lists.linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, spasswolf@web.de, sumit.semwal@linaro.org,
 superm1@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2025 16:45:16 +0200
Message-ID: <2025071216-quintuple-sincere-b0c7@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/framebuffer: Acquire internal references on GEM handles

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-framebuffer-acquire-internal-references-on-gem-handles.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From f6bfc9afc7510cb5e6fbe0a17c507917b0120280 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 7 Jul 2025 15:11:55 +0200
Subject: drm/framebuffer: Acquire internal references on GEM handles
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit f6bfc9afc7510cb5e6fbe0a17c507917b0120280 upstream.

Acquire GEM handles in drm_framebuffer_init() and release them in
the corresponding drm_framebuffer_cleanup(). Ties the handle's
lifetime to the framebuffer. Not all GEM buffer objects have GEM
handles. If not set, no refcounting takes place. This is the case
for some fbdev emulation. This is not a problem as these GEM objects
do not use dma-bufs and drivers will not release them while fbdev
emulation is running. Framebuffer flags keep a bit per color plane
of which the framebuffer holds a GEM handle reference.

As all drivers use drm_framebuffer_init(), they will now all hold
dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
references on GEM handles for framebuffers").

In the GEM framebuffer helpers, restore the original ref counting
on buffer objects. As the helpers for handle refcounting are now
no longer called from outside the DRM core, unexport the symbols.

v3:
- don't mix internal flags with mode flags (Christian)
v2:
- track framebuffer handle refs by flag
- drop gma500 cleanup (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
Tested-by: Bert Karwatzki <spasswolf@web.de>
Tested-by: Mario Limonciello <superm1@kernel.org>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/20250707131224.249496-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_framebuffer.c            |   31 ++++++++++++++++++++--
 drivers/gpu/drm/drm_gem.c                    |   38 +++++++++++++++++----------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |   16 ++++-------
 drivers/gpu/drm/drm_internal.h               |    2 -
 include/drm/drm_framebuffer.h                |    7 ++++
 5 files changed, 68 insertions(+), 26 deletions(-)

--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -844,11 +844,23 @@ void drm_framebuffer_free(struct kref *k
 int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 			 const struct drm_framebuffer_funcs *funcs)
 {
+	unsigned int i;
 	int ret;
+	bool exists;
 
 	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
 		return -EINVAL;
 
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (drm_WARN_ON_ONCE(dev, fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))
+			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		if (fb->obj[i]) {
+			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
+			if (exists)
+				fb->internal_flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		}
+	}
+
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
@@ -857,7 +869,7 @@ int drm_framebuffer_init(struct drm_devi
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
 	if (ret)
-		goto out;
+		goto err;
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	dev->mode_config.num_fb++;
@@ -865,7 +877,16 @@ int drm_framebuffer_init(struct drm_devi
 	mutex_unlock(&dev->mode_config.fb_lock);
 
 	drm_mode_object_register(dev, &fb->base);
-out:
+
+	return 0;
+
+err:
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
+			drm_gem_object_handle_put_unlocked(fb->obj[i]);
+			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		}
+	}
 	return ret;
 }
 EXPORT_SYMBOL(drm_framebuffer_init);
@@ -942,6 +963,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
+	unsigned int i;
+
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
+			drm_gem_object_handle_put_unlocked(fb->obj[i]);
+	}
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_del(&fb->head);
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -197,23 +197,34 @@ static void drm_gem_object_handle_get(st
 }
 
 /**
- * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
+ * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
  * @obj: GEM object
  *
- * Acquires a reference on the GEM buffer object's handle. Required
- * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
- * to release the reference.
+ * Acquires a reference on the GEM buffer object's handle. Required to keep
+ * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
+ * to release the reference. Does nothing if the buffer object has no handle.
+ *
+ * Returns:
+ * True if a handle exists, or false otherwise
  */
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
+bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 
 	guard(mutex)(&dev->object_name_lock);
 
-	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
+	/*
+	 * First ref taken during GEM object creation, if any. Some
+	 * drivers set up internal framebuffers with GEM objects that
+	 * do not have a GEM handle. Hence, this counter can be zero.
+	 */
+	if (!obj->handle_count)
+		return false;
+
 	drm_gem_object_handle_get(obj);
+
+	return true;
 }
-EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
 
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
@@ -246,7 +257,7 @@ static void drm_gem_object_exported_dma_
 }
 
 /**
- * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
+ * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
  * @obj: GEM object
  *
  * Releases a reference on the GEM buffer object's handle. Possibly releases
@@ -257,14 +268,14 @@ void drm_gem_object_handle_put_unlocked(
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
+	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
 		return;
 
 	/*
-	* Must bump handle count first as this may be the last
-	* ref, in which case the object would disappear before we
-	* checked for a name
-	*/
+	 * Must bump handle count first as this may be the last
+	 * ref, in which case the object would disappear before
+	 * we checked for a name.
+	 */
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
@@ -277,7 +288,6 @@ void drm_gem_object_handle_put_unlocked(
 	if (final)
 		drm_gem_object_put(obj);
 }
-EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -99,7 +99,7 @@ void drm_gem_fb_destroy(struct drm_frame
 	unsigned int i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_handle_put_unlocked(fb->obj[i]);
+		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -182,10 +182,8 @@ int drm_gem_fb_init_with_funcs(struct dr
 		if (!objs[i]) {
 			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
 			ret = -ENOENT;
-			goto err_gem_object_handle_put_unlocked;
+			goto err_gem_object_put;
 		}
-		drm_gem_object_handle_get_unlocked(objs[i]);
-		drm_gem_object_put(objs[i]);
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
@@ -195,22 +193,22 @@ int drm_gem_fb_init_with_funcs(struct dr
 			drm_dbg_kms(dev,
 				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
 				    objs[i]->size, min_size, i);
-			drm_gem_object_handle_put_unlocked(objs[i]);
+			drm_gem_object_put(objs[i]);
 			ret = -EINVAL;
-			goto err_gem_object_handle_put_unlocked;
+			goto err_gem_object_put;
 		}
 	}
 
 	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
 	if (ret)
-		goto err_gem_object_handle_put_unlocked;
+		goto err_gem_object_put;
 
 	return 0;
 
-err_gem_object_handle_put_unlocked:
+err_gem_object_put:
 	while (i > 0) {
 		--i;
-		drm_gem_object_handle_put_unlocked(objs[i]);
+		drm_gem_object_put(objs[i]);
 	}
 	return ret;
 }
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -155,7 +155,7 @@ void drm_sysfs_lease_event(struct drm_de
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
+bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
 void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -23,6 +23,7 @@
 #ifndef __DRM_FRAMEBUFFER_H__
 #define __DRM_FRAMEBUFFER_H__
 
+#include <linux/bits.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/sched.h>
@@ -100,6 +101,8 @@ struct drm_framebuffer_funcs {
 		     unsigned num_clips);
 };
 
+#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)	BIT(0u + (_i))
+
 /**
  * struct drm_framebuffer - frame buffer object
  *
@@ -189,6 +192,10 @@ struct drm_framebuffer {
 	 */
 	int flags;
 	/**
+	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
+	 */
+	unsigned int internal_flags;
+	/**
 	 * @hot_x: X coordinate of the cursor hotspot. Used by the legacy cursor
 	 * IOCTL when the driver supports cursor through a DRM_PLANE_TYPE_CURSOR
 	 * universal plane.


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.6/drm-gem-fix-race-in-drm_gem_handle_create_tail.patch
queue-6.6/drm-gem-acquire-references-on-gem-handles-for-framebuffers.patch
queue-6.6/drm-framebuffer-acquire-internal-references-on-gem-handles.patch
