Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D1151F673
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 10:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E30510E1CA;
	Mon,  9 May 2022 08:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F347110E1CA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 08:16:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2162C1F9BF;
 Mon,  9 May 2022 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652084165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQ+HwQipAhU7Z1epRcm6h8rPOoQWaZQNi/Llz7gZOAU=;
 b=YfwriCcIjZQL7kBxHoENl+MoHavpjF8j/MtiBACffjIbI6cEmytqJ8EwDIiDxHOUxvIzpv
 wgrZ/9fsR3DlzR+FW/7706R0WxvoLJLbqKa9DGdX/sNWCvYuM3Hye6OCWo+Wo+NFmwD8mQ
 6yebZrP4g7UHi3N8UAOcG/dW/+vpowE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652084165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQ+HwQipAhU7Z1epRcm6h8rPOoQWaZQNi/Llz7gZOAU=;
 b=Gjjnu/NXXT0D20xTQrWzmCi93536fuKPttm6m+982nfx2GwrAhz//zLlCL2KvWMxx3MtCz
 wNeiGrdDeMtVjeCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB1F9132C0;
 Mon,  9 May 2022 08:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OLyROMTNeGL5OgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 08:16:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH 2/4] drm/gem: Ignore color planes that are unused by
 framebuffer format
Date: Mon,  9 May 2022 10:16:00 +0200
Message-Id: <20220509081602.474-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509081602.474-1-tzimmermann@suse.de>
References: <20220509081602.474-1-tzimmermann@suse.de>
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

Only handle color planes that exist in a framebuffer's color format.
Ignore non-existing planes.

So far, several helpers assumed that all 4 planes are available and
silently ignored non-existing planes. This lead to subtil bugs with
uninitialized data in instances of struct iosys_map. [1]

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/20210730183511.20080-1-tzimmermann@suse.de/T/#md0172b10bb588d8f20f4f456e304f08d2a4505f7 # 1
---
 drivers/gpu/drm/drm_gem_atomic_helper.c      |  6 ++--
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 37 +++++++++++---------
 include/drm/drm_gem_framebuffer_helper.h     | 10 ++----
 3 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index a5026f617739..f16d60217c6c 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -169,8 +169,10 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
 		struct drm_gem_object *obj = drm_gem_fb_get_obj(state->fb, i);
 		struct dma_fence *new;
 
-		if (WARN_ON_ONCE(!obj))
-			continue;
+		if (!obj) {
+			ret = -EINVAL;
+			goto error;
+		}
 
 		ret = dma_resv_get_singleton(obj->resv, usage, &new);
 		if (ret)
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 2fcacab9f812..09e90e19cd93 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -92,9 +92,9 @@ drm_gem_fb_init(struct drm_device *dev,
  */
 void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 {
-	size_t i;
+	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(fb->obj); i++)
+	for (i = 0; i < fb->format->num_planes; i++)
 		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
@@ -329,24 +329,26 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
  * The argument returns the addresses of the data stored in each BO. This
  * is different from @map if the framebuffer's offsets field is non-zero.
  *
+ * Both, @map and @data, must each refer to arrays with at least
+ * fb->format->num_planes elements.
+ *
  * See drm_gem_fb_vunmap() for unmapping.
  *
  * Returns:
  * 0 on success, or a negative errno code otherwise.
  */
-int drm_gem_fb_vmap(struct drm_framebuffer *fb,
-		    struct iosys_map map[static DRM_FORMAT_MAX_PLANES],
-		    struct iosys_map data[DRM_FORMAT_MAX_PLANES])
+int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
+		    struct iosys_map *data)
 {
 	struct drm_gem_object *obj;
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
+	for (i = 0; i < fb->format->num_planes; ++i) {
 		obj = drm_gem_fb_get_obj(fb, i);
 		if (!obj) {
-			iosys_map_clear(&map[i]);
-			continue;
+			ret = -EINVAL;
+			goto err_drm_gem_vunmap;
 		}
 		ret = drm_gem_vmap(obj, &map[i]);
 		if (ret)
@@ -354,7 +356,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
 	}
 
 	if (data) {
-		for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
+		for (i = 0; i < fb->format->num_planes; ++i) {
 			memcpy(&data[i], &map[i], sizeof(data[i]));
 			if (iosys_map_is_null(&data[i]))
 				continue;
@@ -385,10 +387,9 @@ EXPORT_SYMBOL(drm_gem_fb_vmap);
  *
  * See drm_gem_fb_vmap() for more information.
  */
-void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
-		       struct iosys_map map[static DRM_FORMAT_MAX_PLANES])
+void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map)
 {
-	unsigned int i = DRM_FORMAT_MAX_PLANES;
+	unsigned int i = fb->format->num_planes;
 	struct drm_gem_object *obj;
 
 	while (i) {
@@ -442,13 +443,15 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
 {
 	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
-	size_t i;
+	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(fb->obj); ++i) {
+	for (i = 0; i < fb->format->num_planes; ++i) {
 		obj = drm_gem_fb_get_obj(fb, i);
-		if (!obj)
-			continue;
+		if (!obj) {
+			ret = -EINVAL;
+			goto err___drm_gem_fb_end_cpu_access;
+		}
 		import_attach = obj->import_attach;
 		if (!import_attach)
 			continue;
@@ -478,7 +481,7 @@ EXPORT_SYMBOL(drm_gem_fb_begin_cpu_access);
  */
 void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
 {
-	__drm_gem_fb_end_cpu_access(fb, dir, ARRAY_SIZE(fb->obj));
+	__drm_gem_fb_end_cpu_access(fb, dir, fb->format->num_planes);
 }
 EXPORT_SYMBOL(drm_gem_fb_end_cpu_access);
 
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 1091e4fa08cb..d302521f3dd4 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -4,8 +4,6 @@
 #include <linux/dma-buf.h>
 #include <linux/iosys-map.h>
 
-#include <drm/drm_fourcc.h>
-
 struct drm_afbc_framebuffer;
 struct drm_device;
 struct drm_fb_helper_surface_size;
@@ -39,11 +37,9 @@ struct drm_framebuffer *
 drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd);
 
-int drm_gem_fb_vmap(struct drm_framebuffer *fb,
-		    struct iosys_map map[static DRM_FORMAT_MAX_PLANES],
-		    struct iosys_map data[DRM_FORMAT_MAX_PLANES]);
-void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
-		       struct iosys_map map[static DRM_FORMAT_MAX_PLANES]);
+int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
+		    struct iosys_map *data);
+void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map);
 int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
 void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
 
-- 
2.36.0

