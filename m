Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13511E739
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E875B6E9B9;
	Fri, 13 Dec 2019 15:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85346E915
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 16C70292C8C
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 04/36] drm/gem-fb-helper: Add special version of
 drm_gem_fb_size_check
Date: Fri, 13 Dec 2019 16:58:35 +0100
Message-Id: <20191213155907.16581-5-andrzej.p@collabora.com>
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

The new version accepts a struct describing deviations from standard way of
doing the size checks. The caller must provide the respective values.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 47 ++++++++++++++++----
 include/drm/drm_gem_framebuffer_helper.h     | 16 +++++++
 2 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 787edb9a916b..4201dc1f32a5 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -201,8 +201,9 @@ int drm_gem_fb_lookup(struct drm_device *dev,
 EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
 
 /**
- * drm_gem_fb_size_check() - Helper function for use in
- *			     &drm_mode_config_funcs.fb_create implementations
+ * drm_gem_fb_size_check_special() - Helper function for use in
+ *				     &drm_mode_config_funcs.fb_create
+ *				     implementations
  * @dev: DRM device
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  *
@@ -212,9 +213,10 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
  * Returns:
  * Zero on success or a negative error code on failure.
  */
-int drm_gem_fb_size_check(struct drm_device *dev,
-			  const struct drm_mode_fb_cmd2 *mode_cmd,
-			  struct drm_gem_object **objs)
+int drm_gem_fb_size_check_special(struct drm_device *dev,
+				  const struct drm_mode_fb_cmd2 *mode_cmd,
+				  const struct drm_size_check *check,
+				  struct drm_gem_object **objs)
 {
 	const struct drm_format_info *info;
 	int i;
@@ -227,10 +229,19 @@ int drm_gem_fb_size_check(struct drm_device *dev,
 		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
 		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
 		unsigned int min_size;
+		u32 pitch = mode_cmd->pitches[i];
+
+		if (check && check->use_pitch_multiplier)
+			if ((pitch * check->pitch_multiplier[i]) %
+			    check->pitch_modulo)
+				return -EINVAL;
 
-		min_size = (height - 1) * mode_cmd->pitches[i]
-			 + drm_format_info_min_pitch(info, i, width)
-			 + mode_cmd->offsets[i];
+		if (check && check->use_min_size)
+			min_size = check->min_size[i];
+		else
+			min_size = (height - 1) * pitch
+				 + drm_format_info_min_pitch(info, i, width)
+				 + mode_cmd->offsets[i];
 
 		if (objs[i]->size < min_size)
 			return -EINVAL;
@@ -239,6 +250,26 @@ int drm_gem_fb_size_check(struct drm_device *dev,
 	return 0;
 
 }
+EXPORT_SYMBOL_GPL(drm_gem_fb_size_check_special);
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
+	return drm_gem_fb_size_check_special(dev, mode_cmd, NULL, objs);
+}
 EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
 
 /**
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index c85d4b152e91..74304a268694 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -11,6 +11,18 @@ struct drm_mode_fb_cmd2;
 struct drm_plane;
 struct drm_plane_state;
 struct drm_simple_display_pipe;
+struct drm_size_check;
+
+/**
+ * struct drm_size_check - Description of special requirements for size checks.
+ */
+struct drm_size_check {
+	unsigned int min_size[4];
+	bool use_min_size;
+	u32 pitch_multiplier[4];
+	u32 pitch_modulo;
+	bool use_pitch_multiplier;
+};
 
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 					  unsigned int plane);
@@ -32,6 +44,10 @@ int drm_gem_fb_lookup(struct drm_device *dev,
 		      struct drm_file *file,
 		      const struct drm_mode_fb_cmd2 *mode_cmd,
 		      struct drm_gem_object **objs);
+int drm_gem_fb_size_check_special(struct drm_device *dev,
+				  const struct drm_mode_fb_cmd2 *mode_cmd,
+				  const struct drm_size_check *check,
+				  struct drm_gem_object **objs);
 int drm_gem_fb_size_check(struct drm_device *dev,
 			  const struct drm_mode_fb_cmd2 *mode_cmd,
 			  struct drm_gem_object **objs);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
