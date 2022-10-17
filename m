Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BE600D8B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 13:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B368110ED45;
	Mon, 17 Oct 2022 11:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919B810ED45
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:15:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02B4F2045D;
 Mon, 17 Oct 2022 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666005313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bd42Sav1iiVhvuvhLiOePZhcH1A9XylIQTVirv5jepE=;
 b=BGaYVaUyGuStQMFm+tCMNxjmdKzmDwt2tK3PApyNmtadYjsald2pUWL8n2u1w+Go+2AWYe
 lajzLPAtcekstDYKRZUL8MBTPGrvch2WfB4I4JkNbY9zikHej4aJI3vOMgWOr4o5oVFO3Z
 d8jasP5kRi2vue2zVUy9DoGiP5+xFOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666005313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bd42Sav1iiVhvuvhLiOePZhcH1A9XylIQTVirv5jepE=;
 b=2Rk+vBTSrMB0lSYVN6psWiuzf7HL+NFueLlOI/yF5Y2GAb7SFWa09sA5Itsx9potOciaD1
 4RGsVfplaanLd0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B652913ACD;
 Mon, 17 Oct 2022 11:15:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4OdrK0A5TWOgBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Oct 2022 11:15:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, hdegoede@redhat.com,
 noralf@tronnes.org, david@lechnology.com, airlied@redhat.com,
 sean@poorly.run
Subject: [PATCH 3/5] drm/gem: Handle drm_gem_{begin,
 end}_cpu_access() in shadow-plane helpers
Date: Mon, 17 Oct 2022 13:15:08 +0200
Message-Id: <20221017111510.20818-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221017111510.20818-1-tzimmermann@suse.de>
References: <20221017111510.20818-1-tzimmermann@suse.de>
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

Handle drm_gem_{begin,end}_cpu_access() in shadow-plane helpers during
a commit. The functions synchronizes imported dma-buf objects with the
exporter's state. If this fail (as signalled by an error code), atomic-
commit helpers can now still abort the commit.

Several drivers already reserved CPU access in their atomic update
handlers. Remove the respective calls, as they are no longer required.
All other drivers with shadow planes that never bothered with these
functions now correctly reserve CPU access to the framebuffer memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 26 ++++++++++++++++++++-----
 drivers/gpu/drm/solomon/ssd130x.c       | 10 +---------
 drivers/gpu/drm/tiny/gm12u320.c         | 10 +---------
 drivers/gpu/drm/tiny/ofdrm.c            |  8 +-------
 drivers/gpu/drm/tiny/simpledrm.c        | 10 ++--------
 drivers/gpu/drm/udl/udl_modeset.c       | 11 ++---------
 6 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e42800718f515..eac47f1668f43 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -364,10 +364,12 @@ EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
  * @plane: the plane
  * @plane_state: the plane state of type struct drm_shadow_plane_state
  *
- * This function implements struct &drm_plane_helper_funcs.begin_fb_access. It
- * maps all buffer objects of the plane's framebuffer into kernel address
- * space and stores them in struct &drm_shadow_plane_state.map. The first data
- * bytes are available in struct &drm_shadow_plane_state.data.
+ * This function implements struct &drm_plane_helper_funcs.begin_fb_access.
+ * It reserves CPU read access to the framebuffer memory by calling
+ * drm_gem_fb_begin_cpu_access(). It further maps all buffer objects of the
+ * plane's framebuffer into kernel address space and stores them in struct
+ * &drm_shadow_plane_state.map. The first data bytes are available in struct
+ * &drm_shadow_plane_state.data.
  *
  * See drm_gem_end_shadow_fb_access() for cleanup.
  *
@@ -378,11 +380,24 @@ int drm_gem_begin_shadow_fb_access(struct drm_plane *plane, struct drm_plane_sta
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
+	int ret;
 
 	if (!fb)
 		return 0;
 
-	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	ret = drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
+	if (ret)
+		goto drm_gem_fb_end_cpu_access;
+
+	return 0;
+
+drm_gem_fb_end_cpu_access:
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_begin_shadow_fb_access);
 
@@ -404,6 +419,7 @@ void drm_gem_end_shadow_fb_access(struct drm_plane *plane, struct drm_plane_stat
 	if (!fb)
 		return;
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
 }
 EXPORT_SYMBOL(drm_gem_end_shadow_fb_access);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index f2795f90ea693..51e06eb76c613 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -544,7 +544,6 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	struct iosys_map dst;
 	unsigned int dst_pitch;
-	int ret = 0;
 	u8 *buf = NULL;
 
 	/* Align y to display page boundaries */
@@ -556,21 +555,14 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	if (!buf)
 		return -ENOMEM;
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		goto out_free;
-
 	iosys_map_set_vaddr(&dst, buf);
 	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
 
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-
 	ssd130x_update_rect(ssd130x, buf, rect);
 
-out_free:
 	kfree(buf);
 
-	return ret;
+	return 0;
 }
 
 static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 7441d992a5d7a..b721ed6452fbf 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -252,7 +252,7 @@ static void gm12u320_32bpp_to_24bpp_packed(u8 *dst, u8 *src, int len)
 
 static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 {
-	int block, dst_offset, len, remain, ret, x1, x2, y1, y2;
+	int block, dst_offset, len, remain, x1, x2, y1, y2;
 	struct drm_framebuffer *fb;
 	void *vaddr;
 	u8 *src;
@@ -269,12 +269,6 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	y2 = gm12u320->fb_update.rect.y2;
 	vaddr = gm12u320->fb_update.src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret) {
-		GM12U320_ERR("drm_gem_fb_begin_cpu_access err: %d\n", ret);
-		goto put_fb;
-	}
-
 	src = vaddr + y1 * fb->pitches[0] + x1 * 4;
 
 	x1 += (GM12U320_REAL_WIDTH - GM12U320_USER_WIDTH) / 2;
@@ -309,8 +303,6 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 		src += fb->pitches[0];
 	}
 
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
 unlock:
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 0e1cc2369afcc..6584485bce951 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -817,12 +817,8 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_rect damage;
 	int ret, idx;
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return;
-
 	if (!drm_dev_enter(dev, &idx))
-		goto out_drm_gem_fb_end_cpu_access;
+		return;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
@@ -838,8 +834,6 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	}
 
 	drm_dev_exit(idx);
-out_drm_gem_fb_end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 }
 
 static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index cbb100753154e..a05da02b96a25 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -481,14 +481,10 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
-	int ret, idx;
-
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return;
+	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
-		goto out_drm_gem_fb_end_cpu_access;
+		return;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
@@ -504,8 +500,6 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	}
 
 	drm_dev_exit(idx);
-out_drm_gem_fb_end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 }
 
 static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 4b79d44752c92..022b18aa3f486 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -271,17 +271,13 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
-	int ret, idx;
+	int idx;
 
 	if (!fb)
 		return; /* no framebuffer; plane is disabled */
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return;
-
 	if (!drm_dev_enter(dev, &idx))
-		goto out_drm_gem_fb_end_cpu_access;
+		return;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
@@ -289,9 +285,6 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	}
 
 	drm_dev_exit(idx);
-
-out_drm_gem_fb_end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 }
 
 static const struct drm_plane_helper_funcs udl_primary_plane_helper_funcs = {
-- 
2.38.0

