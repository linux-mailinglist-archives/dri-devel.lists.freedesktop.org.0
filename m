Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE267181BCE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251136E999;
	Wed, 11 Mar 2020 14:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAEC6E996
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:55:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id CEE3C29614E
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv7 1/6] drm/core: Allow drivers allocate a subclass of struct
 drm_framebuffer
Date: Wed, 11 Mar 2020 15:55:36 +0100
Message-Id: <20200311145541.29186-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311145541.29186-1-andrzej.p@collabora.com>
References: <20200311145541.29186-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow allocating a specialized version of struct drm_framebuffer
by moving the actual fb allocation out of drm_gem_fb_create_with_funcs();
the respective functions names are adjusted to reflect that fact.
Please note, though, that standard size checks are performed on buffers,
so the drm_gem_fb_init_with_funcs() is useful for cases where those
standard size checks are appropriate or at least don't conflict the
checks to be performed in the specialized case.

Thanks to this change the drivers can call drm_gem_fb_init_with_funcs()
having allocated their special version of struct drm_framebuffer, exactly
the way the new version of drm_gem_fb_create_with_funcs() does.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 87 ++++++++++++++------
 include/drm/drm_gem_framebuffer_helper.h     |  5 ++
 2 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 3a7ace19a902..86c1907c579a 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -54,19 +54,15 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
 
-static struct drm_framebuffer *
-drm_gem_fb_alloc(struct drm_device *dev,
+static int
+drm_gem_fb_init(struct drm_device *dev,
+		 struct drm_framebuffer *fb,
 		 const struct drm_mode_fb_cmd2 *mode_cmd,
 		 struct drm_gem_object **obj, unsigned int num_planes,
 		 const struct drm_framebuffer_funcs *funcs)
 {
-	struct drm_framebuffer *fb;
 	int ret, i;
 
-	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
-	if (!fb)
-		return ERR_PTR(-ENOMEM);
-
 	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
 
 	for (i = 0; i < num_planes; i++)
@@ -76,10 +72,9 @@ drm_gem_fb_alloc(struct drm_device *dev,
 	if (ret) {
 		drm_err(dev, "Failed to init framebuffer: %d\n", ret);
 		kfree(fb);
-		return ERR_PTR(ret);
 	}
 
-	return fb;
+	return ret;
 }
 
 /**
@@ -123,10 +118,13 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
 EXPORT_SYMBOL(drm_gem_fb_create_handle);
 
 /**
- * drm_gem_fb_create_with_funcs() - Helper function for the
- *                                  &drm_mode_config_funcs.fb_create
- *                                  callback
+ * drm_gem_fb_init_with_funcs() - Helper function for implementing
+ *				  &drm_mode_config_funcs.fb_create
+ *				  callback in cases when the driver
+ *				  allocates a subclass of
+ *				  struct drm_framebuffer
  * @dev: DRM device
+ * @fb: framebuffer object
  * @file: DRM file that holds the GEM handle(s) backing the framebuffer
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  * @funcs: vtable to be used for the new framebuffer object
@@ -134,23 +132,26 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
  * This function can be used to set &drm_framebuffer_funcs for drivers that need
  * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
  * change &drm_framebuffer_funcs. The function does buffer size validation.
+ * The buffer size validation is for a general case, though, so users should
+ * pay attention to the checks being appropriate for them or, at least,
+ * non-conflicting.
  *
  * Returns:
- * Pointer to a &drm_framebuffer on success or an error pointer on failure.
+ * Zero or a negative error code.
  */
-struct drm_framebuffer *
-drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
-			     const struct drm_mode_fb_cmd2 *mode_cmd,
-			     const struct drm_framebuffer_funcs *funcs)
+int drm_gem_fb_init_with_funcs(struct drm_device *dev,
+			       struct drm_framebuffer *fb,
+			       struct drm_file *file,
+			       const struct drm_mode_fb_cmd2 *mode_cmd,
+			       const struct drm_framebuffer_funcs *funcs)
 {
 	const struct drm_format_info *info;
 	struct drm_gem_object *objs[4];
-	struct drm_framebuffer *fb;
 	int ret, i;
 
 	info = drm_get_format_info(dev, mode_cmd);
 	if (!info)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
@@ -175,19 +176,55 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 		}
 	}
 
-	fb = drm_gem_fb_alloc(dev, mode_cmd, objs, i, funcs);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
+	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
+	if (ret)
 		goto err_gem_object_put;
-	}
 
-	return fb;
+	return 0;
 
 err_gem_object_put:
 	for (i--; i >= 0; i--)
 		drm_gem_object_put_unlocked(objs[i]);
 
-	return ERR_PTR(ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
+
+/**
+ * drm_gem_fb_create_with_funcs() - Helper function for the
+ *                                  &drm_mode_config_funcs.fb_create
+ *                                  callback
+ * @dev: DRM device
+ * @file: DRM file that holds the GEM handle(s) backing the framebuffer
+ * @mode_cmd: Metadata from the userspace framebuffer creation request
+ * @funcs: vtable to be used for the new framebuffer object
+ *
+ * This function can be used to set &drm_framebuffer_funcs for drivers that need
+ * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
+ * change &drm_framebuffer_funcs. The function does buffer size validation.
+ *
+ * Returns:
+ * Pointer to a &drm_framebuffer on success or an error pointer on failure.
+ */
+struct drm_framebuffer *
+drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
+			     const struct drm_mode_fb_cmd2 *mode_cmd,
+			     const struct drm_framebuffer_funcs *funcs)
+{
+	struct drm_framebuffer *fb;
+	int ret;
+
+	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
+	if (!fb)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
+	if (ret) {
+		kfree(fb);
+		return ERR_PTR(ret);
+	}
+
+	return fb;
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_funcs);
 
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index d9f13fd25b0a..c029c1618661 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -18,6 +18,11 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb);
 int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
 			     unsigned int *handle);
 
+int drm_gem_fb_init_with_funcs(struct drm_device *dev,
+			       struct drm_framebuffer *fb,
+			       struct drm_file *file,
+			       const struct drm_mode_fb_cmd2 *mode_cmd,
+			       const struct drm_framebuffer_funcs *funcs);
 struct drm_framebuffer *
 drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
