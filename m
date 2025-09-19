Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C655EB8A71C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF47510EA4C;
	Fri, 19 Sep 2025 15:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DzipiV+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0305A10EA49;
 Fri, 19 Sep 2025 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yNnUWKt/txj24BSvHVBvLoS00bZocYWqSuS6LeDOYPw=; b=DzipiV+MUUE7mYqtKS3d2JzVUz
 BKxWDDemXPc55yxJi6zJvgv5HdIqpUGnNnrx62K8xUf9jOedycWI09hzSW+dnLPNtCm9HhRHmCwr1
 0Gc54XdKRwA5kWlkPCtyv8tJDsYgNsZ9k0H7nYghWrQ2F1mXK6mq5hiGWUYqRCHvJooFBMMzCGQSI
 QTdvqLJiDTC2i4yz7v3JmvCuG7+WIM235VWsZxq/CMiILYcmFbsBE11pPASPyEGfIxyAc1fvSslMi
 LSl8zWiPOSnIyNsC1EHjGnMnK3mVd63M5NQwlI2Mi+deJcf2NLOfLY9QSTr5GSM5lAqsBaMTYbLYo
 97Hm+ZyQ==;
Received: from [189.6.16.239] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzdSN-00E9aV-Sg; Fri, 19 Sep 2025 17:55:32 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 1/2] Revert "drm/framebuffer: Acquire internal references on
 GEM handles"
Date: Fri, 19 Sep 2025 12:54:28 -0300
Message-ID: <20250919155519.1104256-2-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250919155519.1104256-1-mwen@igalia.com>
References: <20250919155519.1104256-1-mwen@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit f6bfc9afc7510cb5e6fbe0a17c507917b0120280.

since we are going to revert commit 5307dce878d4 ("drm/gem: Acquire
references on GEM handles for framebuffers"), which it was fixing, this
commit won't be needed anymore.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_framebuffer.c            | 31 ++--------------
 drivers/gpu/drm/drm_gem.c                    | 38 ++++++++------------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++++----
 drivers/gpu/drm/drm_internal.h               |  2 +-
 include/drm/drm_framebuffer.h                |  7 ----
 5 files changed, 26 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index adbb73f00d68..61a7213f2389 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -863,23 +863,11 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
 int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 			 const struct drm_framebuffer_funcs *funcs)
 {
-	unsigned int i;
 	int ret;
-	bool exists;
 
 	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
 		return -EINVAL;
 
-	for (i = 0; i < fb->format->num_planes; i++) {
-		if (drm_WARN_ON_ONCE(dev, fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))
-			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
-		if (fb->obj[i]) {
-			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
-			if (exists)
-				fb->internal_flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
-		}
-	}
-
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
@@ -888,7 +876,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
 	if (ret)
-		goto err;
+		goto out;
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	dev->mode_config.num_fb++;
@@ -896,16 +884,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	mutex_unlock(&dev->mode_config.fb_lock);
 
 	drm_mode_object_register(dev, &fb->base);
-
-	return 0;
-
-err:
-	for (i = 0; i < fb->format->num_planes; i++) {
-		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
-			drm_gem_object_handle_put_unlocked(fb->obj[i]);
-			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
-		}
-	}
+out:
 	return ret;
 }
 EXPORT_SYMBOL(drm_framebuffer_init);
@@ -982,12 +961,6 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
-	unsigned int i;
-
-	for (i = 0; i < fb->format->num_planes; i++) {
-		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
-			drm_gem_object_handle_put_unlocked(fb->obj[i]);
-	}
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_del(&fb->head);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index cbeb76b2124f..09f80a84d61a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -224,34 +224,23 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
+ * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
  * @obj: GEM object
  *
- * Acquires a reference on the GEM buffer object's handle. Required to keep
- * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
- * to release the reference. Does nothing if the buffer object has no handle.
- *
- * Returns:
- * True if a handle exists, or false otherwise
+ * Acquires a reference on the GEM buffer object's handle. Required
+ * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
+ * to release the reference.
  */
-bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 
 	guard(mutex)(&dev->object_name_lock);
 
-	/*
-	 * First ref taken during GEM object creation, if any. Some
-	 * drivers set up internal framebuffers with GEM objects that
-	 * do not have a GEM handle. Hence, this counter can be zero.
-	 */
-	if (!obj->handle_count)
-		return false;
-
+	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
 	drm_gem_object_handle_get(obj);
-
-	return true;
 }
+EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
 
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
@@ -284,7 +273,7 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
+ * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
  * @obj: GEM object
  *
  * Releases a reference on the GEM buffer object's handle. Possibly releases
@@ -295,14 +284,14 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
+	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
 		return;
 
 	/*
-	 * Must bump handle count first as this may be the last
-	 * ref, in which case the object would disappear before
-	 * we checked for a name.
-	 */
+	* Must bump handle count first as this may be the last
+	* ref, in which case the object would disappear before we
+	* checked for a name
+	*/
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
@@ -315,6 +304,7 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	if (final)
 		drm_gem_object_put(obj);
 }
+EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 4bc89d33df59..e364fa36ee36 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -101,7 +101,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 	unsigned int i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_put(fb->obj[i]);
+		drm_gem_object_handle_put_unlocked(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -179,8 +179,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 		if (!objs[i]) {
 			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
 			ret = -ENOENT;
-			goto err_gem_object_put;
+			goto err_gem_object_handle_put_unlocked;
 		}
+		drm_gem_object_handle_get_unlocked(objs[i]);
+		drm_gem_object_put(objs[i]);
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
@@ -190,22 +192,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			drm_dbg_kms(dev,
 				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
 				    objs[i]->size, min_size, i);
-			drm_gem_object_put(objs[i]);
+			drm_gem_object_handle_put_unlocked(objs[i]);
 			ret = -EINVAL;
-			goto err_gem_object_put;
+			goto err_gem_object_handle_put_unlocked;
 		}
 	}
 
 	ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
 	if (ret)
-		goto err_gem_object_put;
+		goto err_gem_object_handle_put_unlocked;
 
 	return 0;
 
-err_gem_object_put:
+err_gem_object_handle_put_unlocked:
 	while (i > 0) {
 		--i;
-		drm_gem_object_put(objs[i]);
+		drm_gem_object_handle_put_unlocked(objs[i]);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 5a3bed48ab1f..ec1bf58e5714 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -163,7 +163,7 @@ void drm_sysfs_lease_event(struct drm_device *dev);
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
-bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
 void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..668077009fce 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -23,7 +23,6 @@
 #ifndef __DRM_FRAMEBUFFER_H__
 #define __DRM_FRAMEBUFFER_H__
 
-#include <linux/bits.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/sched.h>
@@ -101,8 +100,6 @@ struct drm_framebuffer_funcs {
 		     unsigned num_clips);
 };
 
-#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)	BIT(0u + (_i))
-
 /**
  * struct drm_framebuffer - frame buffer object
  *
@@ -191,10 +188,6 @@ struct drm_framebuffer {
 	 * DRM_MODE_FB_MODIFIERS.
 	 */
 	int flags;
-	/**
-	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
-	 */
-	unsigned int internal_flags;
 	/**
 	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
 	 */
-- 
2.47.2

