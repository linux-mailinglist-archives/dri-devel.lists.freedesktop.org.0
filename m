Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE3B8A722
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0242B10EA4F;
	Fri, 19 Sep 2025 15:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sJ1wjstA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D819810EA4B;
 Fri, 19 Sep 2025 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Cfq+M17ntcanS8Cw+F6xZg/jiCN/9Ct/eBvzgkpy68=; b=sJ1wjstAIW4ls/ArDqFDnQ4Vkz
 G66v8b3SvwUYiL9cgfGV5U2gOA4XRvyyF/q2XF+uV6E9hyOn+WO8qouofoCURwjaYNG1ovaYtBOCy
 uTte+X+uCpuKJV3rIu+v65HLxEAeW2c/OScoxsFqvnMJ4ZyD7cikNEjv0Egr5pYHSEIJept7AGcZT
 kbsG8QzdGShDT6fM7Qi++R1Ot86Wp2hlOrwzD+6mXfXeBZ60Q9zlCP7MWugZlzfJFqDxBOIgUbZ50
 H3JuCtXMt8j+Ry3lHjMruBInFvENuB018D4JMyHOzUb2C4vuM6LTqQaSlRRBkRON7LCMmbaq1Sdgl
 o/5l5UXA==;
Received: from [189.6.16.239] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzdSS-00E9aV-Hd; Fri, 19 Sep 2025 17:55:37 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 2/2] Revert "drm/gem: Acquire references on GEM handles for
 framebuffers"
Date: Fri, 19 Sep 2025 12:54:29 -0300
Message-ID: <20250919155519.1104256-3-mwen@igalia.com>
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

This reverts commit 5307dce878d4126e1b375587318955bd019c3741.

We've already reverted all other commits related to dma_bug handling and
there is still something wrong with this approach that does not allow
unloading a driver. By reverting this commit, we'd just go back ot the
old behavior.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
 drivers/gpu/drm/drm_internal.h               |  2 -
 3 files changed, 11 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09f80a84d61a..12efc04fb896 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_private_object_fini);
 
-static void drm_gem_object_handle_get(struct drm_gem_object *obj)
-{
-	struct drm_device *dev = obj->dev;
-
-	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
-
-	if (obj->handle_count++ == 0)
-		drm_gem_object_get(obj);
-}
-
-/**
- * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
- * @obj: GEM object
- *
- * Acquires a reference on the GEM buffer object's handle. Required
- * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
- * to release the reference.
- */
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
-{
-	struct drm_device *dev = obj->dev;
-
-	guard(mutex)(&dev->object_name_lock);
-
-	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
-	drm_gem_object_handle_get(obj);
-}
-EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
-
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
  * @obj: GEM object to clean up.
@@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
 	}
 }
 
-/**
- * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
- * @obj: GEM object
- *
- * Releases a reference on the GEM buffer object's handle. Possibly releases
- * the GEM buffer object and associated dma-buf objects.
- */
-void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
+static void
+drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	bool final = false;
@@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	if (final)
 		drm_gem_object_put(obj);
 }
-EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
@@ -434,8 +398,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
-
-	drm_gem_object_handle_get(obj);
+	if (obj->handle_count++ == 0)
+		drm_gem_object_get(obj);
 
 	/*
 	 * Get the user-visible handle using idr.  Preload and perform
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index e364fa36ee36..4bc89d33df59 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -101,7 +101,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 	unsigned int i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_handle_put_unlocked(fb->obj[i]);
+		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -179,10 +179,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
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
@@ -192,22 +190,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
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
 
 	ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
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
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ec1bf58e5714..5265eac81077 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -163,8 +163,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
-void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
 			       u32 *handlep);
-- 
2.47.2

