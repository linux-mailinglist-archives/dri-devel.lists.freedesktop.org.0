Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CFB3CA4E9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4446E88A;
	Thu, 15 Jul 2021 18:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D9C6E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:01:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 171C922AE3;
 Thu, 15 Jul 2021 18:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626372096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgXRADfXViWd1mlD86xN94x8bi78mY0GryH+z9/obvo=;
 b=baUJVwJOPVefeDS3Om6n8kzwenlRcdO4Uc33KSPlVOaqmkdo1p+Bv18iW4rNEn5rA0itvX
 gqTCQu6bqn0cjTh1elADWwvdDEdC3TkkMaO5Gl8FSf1fAi4r4nTWMcQPjEFHWifdZYoomi
 yuocoCMbegi4B2ep6wOgEY8VIlg59bI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626372096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgXRADfXViWd1mlD86xN94x8bi78mY0GryH+z9/obvo=;
 b=A4APjalT/OSpXh0fw2qvd/Ac6r8zn6JNqFh87Ly0ug/1/qp2yLyiMkWXNoqE0utpDYnsaL
 wqomLqm3aysudZBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2EC413C45;
 Thu, 15 Jul 2021 18:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cAiMMv938GBoIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 18:01:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH 1/5] drm: Define DRM_FORMAT_MAX_PLANES
Date: Thu, 15 Jul 2021 20:01:29 +0200
Message-Id: <20210715180133.3675-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715180133.3675-1-tzimmermann@suse.de>
References: <20210715180133.3675-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM uses a magic number of 4 for the maximum number of planes per color
format. Declare this constant via DRM_FORMAT_MAX_PLANES and update the
related code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 14 ++++++++------
 include/drm/drm_fourcc.h                     | 13 +++++++++----
 include/drm/drm_framebuffer.h                |  8 ++++----
 include/drm/drm_gem_atomic_helper.h          |  2 +-
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index e2c68822e05c..975a3df0561e 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -48,7 +48,7 @@
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 					  unsigned int plane)
 {
-	if (plane >= 4)
+	if (plane >= ARRAY_SIZE(fb->obj))
 		return NULL;
 
 	return fb->obj[plane];
@@ -62,7 +62,8 @@ drm_gem_fb_init(struct drm_device *dev,
 		 struct drm_gem_object **obj, unsigned int num_planes,
 		 const struct drm_framebuffer_funcs *funcs)
 {
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
 
@@ -86,9 +87,9 @@ drm_gem_fb_init(struct drm_device *dev,
  */
 void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 {
-	int i;
+	size_t i;
 
-	for (i = 0; i < 4; i++)
+	for (i = 0; i < ARRAY_SIZE(fb->obj); i++)
 		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
@@ -145,8 +146,9 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			       const struct drm_framebuffer_funcs *funcs)
 {
 	const struct drm_format_info *info;
-	struct drm_gem_object *objs[4];
-	int ret, i;
+	struct drm_gem_object *objs[DRM_FORMAT_MAX_PLANES];
+	unsigned int i;
+	int ret;
 
 	info = drm_get_format_info(dev, mode_cmd);
 	if (!info) {
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 3b138d4ae67e..22aa64d07c79 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -25,6 +25,11 @@
 #include <linux/types.h>
 #include <uapi/drm/drm_fourcc.h>
 
+/**
+ * DRM_FORMAT_MAX_PLANES - maximum number of planes a DRM format can have
+ */
+#define DRM_FORMAT_MAX_PLANES	4u
+
 /*
  * DRM formats are little endian.  Define host endian variants for the
  * most common formats here, to reduce the #ifdefs needed in drivers.
@@ -78,7 +83,7 @@ struct drm_format_info {
 		 * triplet @char_per_block, @block_w, @block_h for better
 		 * describing the pixel format.
 		 */
-		u8 cpp[4];
+		u8 cpp[DRM_FORMAT_MAX_PLANES];
 
 		/**
 		 * @char_per_block:
@@ -104,7 +109,7 @@ struct drm_format_info {
 		 * information from their drm_mode_config.get_format_info hook
 		 * if they want the core to be validating the pitch.
 		 */
-		u8 char_per_block[4];
+		u8 char_per_block[DRM_FORMAT_MAX_PLANES];
 	};
 
 	/**
@@ -113,7 +118,7 @@ struct drm_format_info {
 	 * Block width in pixels, this is intended to be accessed through
 	 * drm_format_info_block_width()
 	 */
-	u8 block_w[4];
+	u8 block_w[DRM_FORMAT_MAX_PLANES];
 
 	/**
 	 * @block_h:
@@ -121,7 +126,7 @@ struct drm_format_info {
 	 * Block height in pixels, this is intended to be accessed through
 	 * drm_format_info_block_height()
 	 */
-	u8 block_h[4];
+	u8 block_h[DRM_FORMAT_MAX_PLANES];
 
 	/** @hsub: Horizontal chroma subsampling factor */
 	u8 hsub;
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index be658ebbec72..f67c5b7bcb68 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -27,12 +27,12 @@
 #include <linux/list.h>
 #include <linux/sched.h>
 
+#include <drm/drm_fourcc.h>
 #include <drm/drm_mode_object.h>
 
 struct drm_clip_rect;
 struct drm_device;
 struct drm_file;
-struct drm_format_info;
 struct drm_framebuffer;
 struct drm_gem_object;
 
@@ -147,7 +147,7 @@ struct drm_framebuffer {
 	 * @pitches: Line stride per buffer. For userspace created object this
 	 * is copied from drm_mode_fb_cmd2.
 	 */
-	unsigned int pitches[4];
+	unsigned int pitches[DRM_FORMAT_MAX_PLANES];
 	/**
 	 * @offsets: Offset from buffer start to the actual pixel data in bytes,
 	 * per buffer. For userspace created object this is copied from
@@ -165,7 +165,7 @@ struct drm_framebuffer {
 	 * data (even for linear buffers). Specifying an x/y pixel offset is
 	 * instead done through the source rectangle in &struct drm_plane_state.
 	 */
-	unsigned int offsets[4];
+	unsigned int offsets[DRM_FORMAT_MAX_PLANES];
 	/**
 	 * @modifier: Data layout modifier. This is used to describe
 	 * tiling, or also special layouts (like compression) of auxiliary
@@ -210,7 +210,7 @@ struct drm_framebuffer {
 	 * This is used by the GEM framebuffer helpers, see e.g.
 	 * drm_gem_fb_create().
 	 */
-	struct drm_gem_object *obj[4];
+	struct drm_gem_object *obj[DRM_FORMAT_MAX_PLANES];
 };
 
 #define obj_to_fb(x) container_of(x, struct drm_framebuffer, base)
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index d82c23622156..b2b441361051 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -40,7 +40,7 @@ struct drm_shadow_plane_state {
 	 * The memory mappings stored in map should be established in the plane's
 	 * prepare_fb callback and removed in the cleanup_fb callback.
 	 */
-	struct dma_buf_map map[4];
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 };
 
 /**
-- 
2.32.0

