Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB941222B3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 04:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E64A6E930;
	Tue, 17 Dec 2019 03:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B66F6E930;
 Tue, 17 Dec 2019 03:47:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 19:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,324,1571727600"; d="scan'208";a="209549750"
Received: from jhli-desk1.jf.intel.com ([10.7.198.163])
 by orsmga008.jf.intel.com with ESMTP; 16 Dec 2019 19:47:15 -0800
From: Juston Li <juston.li@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH v3] drm: Add getfb2 ioctl
Date: Mon, 16 Dec 2019 19:46:43 -0800
Message-Id: <20191217034642.3814-1-juston.li@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, tutankhamen@google.com,
 dcastagna@google.com, Juston Li <juston.li@intel.com>, markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Stone <daniels@collabora.com>

getfb2 allows us to pass multiple planes and modifiers, just like addfb2
over addfb.

Changes since v2:
 - add privilege checks from getfb1 since handles should only be
   returned to master/root

Changes since v1:
 - unused modifiers set to 0 instead of DRM_FORMAT_MOD_INVALID
 - update ioctl number

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Juston Li <juston.li@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_crtc_internal.h |   2 +
 drivers/gpu/drm/drm_framebuffer.c   | 122 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c         |   1 +
 include/uapi/drm/drm.h              |   2 +
 4 files changed, 127 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index c7d5e4c21423..16f2413403aa 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -216,6 +216,8 @@ int drm_mode_rmfb_ioctl(struct drm_device *dev,
 			void *data, struct drm_file *file_priv);
 int drm_mode_getfb(struct drm_device *dev,
 		   void *data, struct drm_file *file_priv);
+int drm_mode_getfb2_ioctl(struct drm_device *dev,
+			  void *data, struct drm_file *file_priv);
 int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 			   void *data, struct drm_file *file_priv);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 57564318ceea..57ac94ce9b9e 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -31,6 +31,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
@@ -548,7 +549,128 @@ int drm_mode_getfb(struct drm_device *dev,
 
 out:
 	drm_framebuffer_put(fb);
+	return ret;
+}
+
+/**
+ * drm_mode_getfb2 - get extended FB info
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
+ *
+ * Lookup the FB given its ID and return info about it.
+ *
+ * Called by the user via ioctl.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_getfb2_ioctl(struct drm_device *dev,
+			  void *data, struct drm_file *file_priv)
+{
+	struct drm_mode_fb_cmd2 *r = data;
+	struct drm_framebuffer *fb;
+	unsigned int i;
+	int ret;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return -EINVAL;
+
+	fb = drm_framebuffer_lookup(dev, file_priv, r->fb_id);
+	if (!fb)
+		return -ENOENT;
+
+	/* For multi-plane framebuffers, we require the driver to place the
+	 * GEM objects directly in the drm_framebuffer. For single-plane
+	 * framebuffers, we can fall back to create_handle.
+	 */
+	if (!fb->obj[0] &&
+	    (fb->format->num_planes > 1 || !fb->funcs->create_handle)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	r->height = fb->height;
+	r->width = fb->width;
+	r->pixel_format = fb->format->format;
+
+	r->flags = 0;
+	if (dev->mode_config.allow_fb_modifiers)
+		r->flags |= DRM_MODE_FB_MODIFIERS;
+
+	for (i = 0; i < ARRAY_SIZE(r->handles); i++) {
+		r->handles[i] = 0;
+		r->pitches[i] = 0;
+		r->offsets[i] = 0;
+		r->modifier[i] = 0;
+	}
+
+	for (i = 0; i < fb->format->num_planes; i++) {
+		r->pitches[i] = fb->pitches[i];
+		r->offsets[i] = fb->offsets[i];
+		if (dev->mode_config.allow_fb_modifiers)
+			r->modifier[i] = fb->modifier;
+	}
+
+	/* GET_FB2() is an unprivileged ioctl so we must not return a
+	 * buffer-handle to non master/root processes! To match GET_FB()
+	 * just return invalid handles (0) for non masters/root
+	 * rather than making GET_FB2() privileged.
+	 */
+	if (!drm_is_current_master(file_priv) && !capable(CAP_SYS_ADMIN)) {
+		ret = 0;
+		goto out;
+	}
 
+	for (i = 0; i < fb->format->num_planes; i++) {
+		int j;
+
+		/* If we reuse the same object for multiple planes, also
+		 * return the same handle.
+		 */
+		for (j = 0; j < i; j++) {
+			if (fb->obj[i] == fb->obj[j]) {
+				r->handles[i] = r->handles[j];
+				break;
+			}
+		}
+
+		if (r->handles[i])
+			continue;
+
+		if (fb->obj[i]) {
+			ret = drm_gem_handle_create(file_priv, fb->obj[i],
+						    &r->handles[i]);
+		} else {
+			WARN_ON(i > 0);
+			ret = fb->funcs->create_handle(fb, file_priv,
+						       &r->handles[i]);
+		}
+
+		if (ret != 0)
+			goto out;
+	}
+
+out:
+	if (ret != 0) {
+		/* Delete any previously-created handles on failure. */
+		for (i = 0; i < ARRAY_SIZE(r->handles); i++) {
+			int j;
+
+			if (r->handles[i])
+				drm_gem_handle_delete(file_priv, r->handles[i]);
+
+			/* Zero out any handles identical to the one we just
+			 * deleted.
+			 */
+			for (j = i + 1; j < ARRAY_SIZE(r->handles); j++) {
+				if (r->handles[j] == r->handles[i])
+					r->handles[j] = 0;
+			}
+		}
+	}
+
+	drm_framebuffer_put(fb);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 5afb39688b55..9e41972c4bbc 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -671,6 +671,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETPROPERTY, drm_connector_property_set_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPROPBLOB, drm_mode_getblob_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETFB, drm_mode_getfb, 0),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETFB2, drm_mode_getfb2_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB, drm_mode_addfb_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB2, drm_mode_addfb2_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_RMFB, drm_mode_rmfb_ioctl, 0),
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 868bf7996c0f..808b48a93330 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -948,6 +948,8 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
 
+#define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
+
 /**
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
