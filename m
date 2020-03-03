Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE9B177595
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 13:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9526E997;
	Tue,  3 Mar 2020 12:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3766E855
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 12:01:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 64DEB29132A
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv6 1/6] drm/core: Allow drivers allocate a subclass of struct
 drm_framebuffer
Date: Tue,  3 Mar 2020 13:01:31 +0100
Message-Id: <20200303120136.18294-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303120136.18294-1-andrzej.p@collabora.com>
References: <20200303120136.18294-1-andrzej.p@collabora.com>
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
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 65 +++++++++++++++-----
 include/drm/drm_gem_framebuffer_helper.h     |  5 ++
 2 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 3a7ace19a902..388a080cd2df 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -55,18 +55,14 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
 
 static struct drm_framebuffer *
-drm_gem_fb_alloc(struct drm_device *dev,
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
@@ -123,10 +119,13 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
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
@@ -134,18 +133,21 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
  * This function can be used to set &drm_framebuffer_funcs for drivers that need
  * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
  * change &drm_framebuffer_funcs. The function does buffer size validation.
+ * The buffer size validation is for a general case, though, so users should
+ * pay attention to the checks being appropriate for them or, at least,
+ * non-conflicting.
  *
  * Returns:
  * Pointer to a &drm_framebuffer on success or an error pointer on failure.
  */
 struct drm_framebuffer *
-drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
-			     const struct drm_mode_fb_cmd2 *mode_cmd,
-			     const struct drm_framebuffer_funcs *funcs)
+drm_gem_fb_init_with_funcs(struct drm_device *dev, struct drm_framebuffer *fb,
+			   struct drm_file *file,
+			   const struct drm_mode_fb_cmd2 *mode_cmd,
+			   const struct drm_framebuffer_funcs *funcs)
 {
 	const struct drm_format_info *info;
 	struct drm_gem_object *objs[4];
-	struct drm_framebuffer *fb;
 	int ret, i;
 
 	info = drm_get_format_info(dev, mode_cmd);
@@ -175,7 +177,7 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 		}
 	}
 
-	fb = drm_gem_fb_alloc(dev, mode_cmd, objs, i, funcs);
+	fb = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
 	if (IS_ERR(fb)) {
 		ret = PTR_ERR(fb);
 		goto err_gem_object_put;
@@ -189,6 +191,41 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 
 	return ERR_PTR(ret);
 }
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
+	struct drm_framebuffer *fb, *ret;
+
+	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
+	if (!fb)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
+	if (IS_ERR_OR_NULL(ret))
+		kfree(fb);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_funcs);
 
 static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index d9f13fd25b0a..3f61d9f832ee 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -19,6 +19,11 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
 			     unsigned int *handle);
 
 struct drm_framebuffer *
+drm_gem_fb_init_with_funcs(struct drm_device *dev, struct drm_framebuffer *fb,
+			   struct drm_file *file,
+			   const struct drm_mode_fb_cmd2 *mode_cmd,
+			   const struct drm_framebuffer_funcs *funcs);
+struct drm_framebuffer *
 drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd,
 			     const struct drm_framebuffer_funcs *funcs);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
