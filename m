Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58111E737
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDAD6EA18;
	Fri, 13 Dec 2019 15:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590156E915
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 763E9292C7A
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 03/36] drm/gem-fb-helper: Allow drivers to allocate struct
 drm_framebuffer on their own
Date: Fri, 13 Dec 2019 16:58:34 +0100
Message-Id: <20191213155907.16581-4-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213155907.16581-1-andrzej.p@collabora.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
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
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare tools for drivers which need to allocate a struct drm_framebuffer
(or a container of struct drm_framebuffer) explicitly, before calling
helpers. In such a case we need new helpers which omit allocating the
struct drm_framebuffer and this patch provides them. Consequently, they
are used also inside the helpers themselves.

The interested drivers will likely need to be able to perform object
lookups and size checks in separate invocations and this patch provides
that as well. Helpers themselves are updated, too.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 184 ++++++++++++++-----
 include/drm/drm_gem_framebuffer_helper.h     |  17 ++
 2 files changed, 153 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index b9bcd310ca2d..787edb9a916b 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -54,6 +54,44 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
 
+int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
+			       struct drm_device *dev,
+			       const struct drm_mode_fb_cmd2 *mode_cmd,
+			       struct drm_gem_object **obj,
+			       unsigned int num_planes,
+			       const struct drm_framebuffer_funcs *funcs)
+{
+	int ret, i;
+
+	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+
+	for (i = 0; i < num_planes; i++)
+		fb->obj[i] = obj[i];
+
+	ret = drm_framebuffer_init(dev, fb, funcs);
+	if (ret)
+		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
+			      ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
+
+static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
+	.destroy	= drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+};
+
+int drm_gem_fb_init(struct drm_framebuffer *fb,
+		    struct drm_device *dev,
+		    const struct drm_mode_fb_cmd2 *mode_cmd,
+		    struct drm_gem_object **obj, unsigned int num_planes)
+{
+	return drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes,
+					  &drm_gem_fb_funcs);
+}
+EXPORT_SYMBOL_GPL(drm_gem_fb_init);
+
 static struct drm_framebuffer *
 drm_gem_fb_alloc(struct drm_device *dev,
 		 const struct drm_mode_fb_cmd2 *mode_cmd,
@@ -61,21 +99,15 @@ drm_gem_fb_alloc(struct drm_device *dev,
 		 const struct drm_framebuffer_funcs *funcs)
 {
 	struct drm_framebuffer *fb;
-	int ret, i;
+	int ret;
 
 	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
-
-	for (i = 0; i < num_planes; i++)
-		fb->obj[i] = obj[i];
-
-	ret = drm_framebuffer_init(dev, fb, funcs);
+	ret = drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes,
+					 funcs);
 	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
-			      ret);
 		kfree(fb);
 		return ERR_PTR(ret);
 	}
@@ -124,79 +156,135 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
 EXPORT_SYMBOL(drm_gem_fb_create_handle);
 
 /**
- * drm_gem_fb_create_with_funcs() - Helper function for the
- *                                  &drm_mode_config_funcs.fb_create
- *                                  callback
+ * drm_gem_fb_lookup() - Helper function for use in
+ *			 &drm_mode_config_funcs.fb_create implementations
  * @dev: DRM device
  * @file: DRM file that holds the GEM handle(s) backing the framebuffer
  * @mode_cmd: Metadata from the userspace framebuffer creation request
- * @funcs: vtable to be used for the new framebuffer object
  *
- * This function can be used to set &drm_framebuffer_funcs for drivers that need
- * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
- * change &drm_framebuffer_funcs. The function does buffer size validation.
+ * This function can be used to look up the objects for all planes.
+ * In case an error is returned all the objects are put by the
+ * function before returning.
  *
  * Returns:
- * Pointer to a &drm_framebuffer on success or an error pointer on failure.
+ * Number of planes on success or a negative error code on failure.
  */
-struct drm_framebuffer *
-drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
-			     const struct drm_mode_fb_cmd2 *mode_cmd,
-			     const struct drm_framebuffer_funcs *funcs)
+int drm_gem_fb_lookup(struct drm_device *dev,
+		      struct drm_file *file,
+		      const struct drm_mode_fb_cmd2 *mode_cmd,
+		      struct drm_gem_object **objs)
 {
 	const struct drm_format_info *info;
-	struct drm_gem_object *objs[4];
-	struct drm_framebuffer *fb;
 	int ret, i;
 
 	info = drm_get_format_info(dev, mode_cmd);
 	if (!info)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	for (i = 0; i < info->num_planes; i++) {
-		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
-		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
-		unsigned int min_size;
-
 		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
 		if (!objs[i]) {
 			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
 			ret = -ENOENT;
 			goto err_gem_object_put;
 		}
+	}
+
+	return i;
+
+err_gem_object_put:
+	for (i--; i >= 0; i--)
+		drm_gem_object_put_unlocked(objs[i]);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
+
+/**
+ * drm_gem_fb_size_check() - Helper function for use in
+ *			     &drm_mode_config_funcs.fb_create implementations
+ * @dev: DRM device
+ * @mode_cmd: Metadata from the userspace framebuffer creation request
+ *
+ * This function can be used to verify buffer sizes for all planes.
+ * It is caller's responsibility to put the objects on failure.
+ *
+ * Returns:
+ * Zero on success or a negative error code on failure.
+ */
+int drm_gem_fb_size_check(struct drm_device *dev,
+			  const struct drm_mode_fb_cmd2 *mode_cmd,
+			  struct drm_gem_object **objs)
+{
+	const struct drm_format_info *info;
+	int i;
+
+	info = drm_get_format_info(dev, mode_cmd);
+	if (!info)
+		return -EINVAL;
+
+	for (i = 0; i < info->num_planes; i++) {
+		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
+		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
+		unsigned int min_size;
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
 			 + mode_cmd->offsets[i];
 
-		if (objs[i]->size < min_size) {
-			drm_gem_object_put_unlocked(objs[i]);
-			ret = -EINVAL;
-			goto err_gem_object_put;
-		}
+		if (objs[i]->size < min_size)
+			return -EINVAL;
 	}
 
-	fb = drm_gem_fb_alloc(dev, mode_cmd, objs, i, funcs);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
-		goto err_gem_object_put;
-	}
+	return 0;
 
-	return fb;
+}
+EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
 
-err_gem_object_put:
-	for (i--; i >= 0; i--)
-		drm_gem_object_put_unlocked(objs[i]);
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
+	struct drm_gem_object *objs[4];
+	struct drm_framebuffer *fb;
+	int ret, num_planes;
+
+	ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
+	if (ret < 0)
+		return ERR_PTR(ret);
+	num_planes = ret;
+
+	ret = drm_gem_fb_size_check(dev, mode_cmd, objs);
+	if (ret)
+		fb = ERR_PTR(ret);
+	else
+		fb = drm_gem_fb_alloc(dev, mode_cmd, objs, num_planes, funcs);
 
-	return ERR_PTR(ret);
+	if (IS_ERR(fb))
+		for (num_planes--; num_planes >= 0; num_planes--)
+			drm_gem_object_put_unlocked(objs[num_planes]);
+
+	return fb;
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_funcs);
 
-static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
-	.destroy	= drm_gem_fb_destroy,
-	.create_handle	= drm_gem_fb_create_handle,
-};
-
 /**
  * drm_gem_fb_create() - Helper function for the
  *                       &drm_mode_config_funcs.fb_create callback
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index d9f13fd25b0a..c85d4b152e91 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -14,10 +14,27 @@ struct drm_simple_display_pipe;
 
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 					  unsigned int plane);
+int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
+			       struct drm_device *dev,
+			       const struct drm_mode_fb_cmd2 *mode_cmd,
+			       struct drm_gem_object **obj,
+			       unsigned int num_planes,
+			       const struct drm_framebuffer_funcs *funcs);
+int drm_gem_fb_init(struct drm_framebuffer *fb,
+		    struct drm_device *dev,
+		    const struct drm_mode_fb_cmd2 *mode_cmd,
+		    struct drm_gem_object **obj, unsigned int num_planes);
 void drm_gem_fb_destroy(struct drm_framebuffer *fb);
 int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
 			     unsigned int *handle);
 
+int drm_gem_fb_lookup(struct drm_device *dev,
+		      struct drm_file *file,
+		      const struct drm_mode_fb_cmd2 *mode_cmd,
+		      struct drm_gem_object **objs);
+int drm_gem_fb_size_check(struct drm_device *dev,
+			  const struct drm_mode_fb_cmd2 *mode_cmd,
+			  struct drm_gem_object **objs);
 struct drm_framebuffer *
 drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
