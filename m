Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F60122F4A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674AE6EA00;
	Tue, 17 Dec 2019 14:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C196EA00
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 12AD22927A8
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 03/34] drm/gem-fb-helper: Add special version of
 drm_gem_fb_size_check
Date: Tue, 17 Dec 2019 15:49:49 +0100
Message-Id: <20191217145020.14645-4-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 46 ++++++++++++++++----
 include/drm/drm_gem_framebuffer_helper.h     | 16 +++++++
 2 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index b3494f6b66bb..d2fce1ec8f37 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -300,8 +300,8 @@ int drm_gem_fb_lookup(struct drm_device *dev,
 EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
 
 /**
- * drm_gem_fb_size_check() - Helper function for use in
- *			     &drm_mode_config_funcs.fb_create implementations
+ * drm_gem_fb_size_check2() - Helper function for use in
+ *			      &drm_mode_config_funcs.fb_create implementations
  * @dev: DRM device
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  *
@@ -311,9 +311,10 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
  * Returns:
  * Zero on success or a negative error code on failure.
  */
-int drm_gem_fb_size_check(struct drm_device *dev,
-			  const struct drm_mode_fb_cmd2 *mode_cmd,
-			  struct drm_gem_object **objs)
+int drm_gem_fb_size_check2(struct drm_device *dev,
+			   const struct drm_mode_fb_cmd2 *mode_cmd,
+			   const struct drm_size_check *check,
+			   struct drm_gem_object **objs)
 {
 	const struct drm_format_info *info;
 	int i;
@@ -326,10 +327,19 @@ int drm_gem_fb_size_check(struct drm_device *dev,
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
@@ -338,6 +348,26 @@ int drm_gem_fb_size_check(struct drm_device *dev,
 	return 0;
 
 }
+EXPORT_SYMBOL_GPL(drm_gem_fb_size_check2);
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
+	return drm_gem_fb_size_check2(dev, mode_cmd, NULL, objs);
+}
 EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
 
 static const struct drm_framebuffer_funcs drm_gem_fb_funcs_dirtyfb = {
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index c85d4b152e91..4955af96d6c3 100644
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
+int drm_gem_fb_size_check2(struct drm_device *dev,
+			   const struct drm_mode_fb_cmd2 *mode_cmd,
+			   const struct drm_size_check *check,
+			   struct drm_gem_object **objs);
 int drm_gem_fb_size_check(struct drm_device *dev,
 			  const struct drm_mode_fb_cmd2 *mode_cmd,
 			  struct drm_gem_object **objs);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
