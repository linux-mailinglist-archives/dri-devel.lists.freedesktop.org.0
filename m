Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16D6348CF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5559F10E473;
	Tue, 22 Nov 2022 20:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFE210E473
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 20:59:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA2526151F;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15E49C433B5;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669150745;
 bh=37FT5oeWH0T840SgkpouZDFx8r7l1qyOleOYoh7qb08=;
 h=From:Date:Subject:References:In-Reply-To:To:Reply-To:From;
 b=lw/BvEH7ccB08hOIoXwBfqaLtzktIEhxAg2DHwW/+XbjFoJH5R/Hhid4FMP8RBkr9
 sjcohQxSAh4CufUg2Mkuko3k6KkkwJSifxUDJavuFdIU6yojvTk/KEaH/6zBar7UiO
 JcZCqWW5to6rzUcxb0QrASsc9jQMSrgyom10n99oDP0DaTwUnLIjOjUqP7e5wR/w/g
 8QR/jAMy0EO/5ckMAixo+konZYsiHPuRJMsVvez44+LMhZwrRqMFSWZObQuc6Pfu1Z
 7xlBHELeGiJQEnh5He43X8ABw72LSlT3SrmCxKMx9V3cc2TrW4UptN3g4PnsWx/f0/
 dPU0z9M5XXtVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E45DEC433FE;
 Tue, 22 Nov 2022 20:59:04 +0000 (UTC)
From: Noralf Trønnes via B4 Submission Endpoint <devnull@kernel.org>
Date: Tue, 22 Nov 2022 21:58:39 +0100
Subject: [PATCH 1/6] drm/gem: shadow_fb_access: Prepare imported buffers for
 CPU access
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221122-gud-shadow-plane-v1-1-9de3afa3383e@tronnes.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Noralf Trønnes <noralf@tronnes.org>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669150743; l=8308;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=ponExjB/P5LwYsrtT3RrfCtiLufQBSDUukOcGcdNTxI=;
 b=GUJbBrvVRAkiwHE7wrUrq9iy9dikDfcAB8w2IjjzPUqerkrDGcJB5pIrsl7Vvpd8STXsj2xDjVeq
 LqpoWTRVAqOkHRPK1/oYq67sdeIYSFbRgSsiYkZx1Bdg6HMmVqHF
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf Trønnes <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

Complete the shadow fb access functions by also preparing imported buffers
for CPU access. Update the affected drivers that currently use
drm_gem_fb_begin_cpu_access().

Through this change the following SHMEM drivers will now also make sure
their imported buffers are prepared for CPU access: cirrus, hyperv,
mgag200, vkms

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 ++++++++++++-
 drivers/gpu/drm/solomon/ssd130x.c       | 10 +---------
 drivers/gpu/drm/tiny/gm12u320.c         | 10 +---------
 drivers/gpu/drm/tiny/ofdrm.c            | 10 ++--------
 drivers/gpu/drm/tiny/simpledrm.c        | 10 ++--------
 drivers/gpu/drm/udl/udl_modeset.c       | 11 ++---------
 6 files changed, 20 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e42800718f51..0eef4bb30d25 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -368,6 +368,7 @@ EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
  * maps all buffer objects of the plane's framebuffer into kernel address
  * space and stores them in struct &drm_shadow_plane_state.map. The first data
  * bytes are available in struct &drm_shadow_plane_state.data.
+ * It also prepares imported buffers for CPU access.
  *
  * See drm_gem_end_shadow_fb_access() for cleanup.
  *
@@ -378,11 +379,20 @@ int drm_gem_begin_shadow_fb_access(struct drm_plane *plane, struct drm_plane_sta
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
+	int ret;
 
 	if (!fb)
 		return 0;
 
-	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
+	ret = drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
+	if (ret)
+		return ret;
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		drm_gem_fb_vunmap(fb, shadow_plane_state->map);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_begin_shadow_fb_access);
 
@@ -404,6 +414,7 @@ void drm_gem_end_shadow_fb_access(struct drm_plane *plane, struct drm_plane_stat
 	if (!fb)
 		return;
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
 }
 EXPORT_SYMBOL(drm_gem_end_shadow_fb_access);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 53464afc2b9a..58a2f0113f24 100644
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
index 130fd07a967d..59aad4b468cc 100644
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
index dc9e4d71b12a..ed3072563db9 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -820,14 +820,10 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	const struct drm_format_info *dst_format = odev->format;
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
@@ -843,8 +839,6 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	}
 
 	drm_dev_exit(idx);
-out_drm_gem_fb_end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 }
 
 static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 162eb44dcba8..1c0d9e277dc3 100644
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
index 4b79d44752c9..022b18aa3f48 100644
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
b4 0.10.1

