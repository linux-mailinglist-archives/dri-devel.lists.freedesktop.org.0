Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE811E73C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FF96EA37;
	Fri, 13 Dec 2019 15:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D426EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 5AB4F292C76
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 06/36] drm/gem-fb-helper: Add method to allocate struct
 drm_framebuffer
Date: Fri, 13 Dec 2019 16:58:37 +0100
Message-Id: <20191213155907.16581-7-andrzej.p@collabora.com>
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

Some drivers might want to use the modifier_info field of struct
drm_framebuffer to hold struct drm_afbc. The memory for the latter must
be managed by the driver. To eliminate the need to modify existing
invocations of kfree(fb), add a function to allocate struct drm_framebuffer
and its associated struct drm_afbc in one chunk.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 32 ++++++++++++++++++++
 include/drm/drm_gem_framebuffer_helper.h     |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index e20f4d00b0a5..0338f303f988 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -21,6 +21,13 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#define DRM_ALIGN_MASK(type) \
+	(__alignof__(type) - 1)
+#define DRM_INFO_OFFSET(type1, type2)	\
+	((sizeof(type1) + DRM_ALIGN_MASK(type2)) & ~DRM_ALIGN_MASK(type2))
+#define DRM_COMPOUND_SIZE(type1, type2) \
+	(DRM_INFO_OFFSET(type1, type2) + sizeof(type2))
+
 #define AFBC_HEADER_SIZE		16
 #define AFBC_TH_LAYOUT_ALIGNMENT	8
 #define AFBC_SUPERBLOCK_PIXELS		256
@@ -59,6 +66,31 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
 
+/**
+ * drm_gem_fb_alloc_with_afbc() - Allocate struct drm_framebuffer together
+ *				  with a struct drm_afbc for easier freeing
+ *				  and assign drm_framebuffer's modifier_info
+ *
+ * Returns:
+ * Pointer to drm_framebuffer on success or NULL
+ */
+struct drm_framebuffer *drm_gem_fb_alloc_with_afbc(void)
+{
+	struct drm_framebuffer *fb;
+
+	/* alloc in one chunk to ease freeing */
+	fb = kzalloc(DRM_COMPOUND_SIZE(struct drm_framebuffer, struct drm_afbc),
+		     GFP_KERNEL);
+	if (!fb)
+		return NULL;
+
+	fb->modifier_info =
+		fb + DRM_INFO_OFFSET(struct drm_framebuffer, struct drm_afbc);
+
+	return fb;
+}
+EXPORT_SYMBOL_GPL(drm_gem_fb_alloc_with_afbc);
+
 int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
 			       struct drm_device *dev,
 			       const struct drm_mode_fb_cmd2 *mode_cmd,
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 3d6015194b3c..4e7b1e2c765b 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -42,6 +42,7 @@ struct drm_afbc {
 
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 					  unsigned int plane);
+struct drm_framebuffer *drm_gem_fb_alloc_with_afbc(void);
 int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
 			       struct drm_device *dev,
 			       const struct drm_mode_fb_cmd2 *mode_cmd,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
