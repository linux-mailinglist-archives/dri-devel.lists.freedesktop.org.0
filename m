Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6327A6348DC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D055F10E480;
	Tue, 22 Nov 2022 20:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F336888D9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 20:59:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 754C5618EA;
 Tue, 22 Nov 2022 20:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D758C43147;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669150745;
 bh=nVv1hkxJ2+4nX/nMC43hHkgCx1Vuqwr2glTEXhrdtUQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Reply-To:From;
 b=kARPzZTLQubYbtjANkc4zUoGV+pFgEeOFvvjeraFuF2P64l4v5gRsKIgWo4Vln03d
 XCpc+zvVNbeXGaKYHom+O3qrkFHVCVedP3vzyQoBd2PePvPjMytizBkQpwuOR7A1uD
 yTo4hPiU3/UG1qsH2txP+fEYe6z9/QGYs9BRtfhRbvb5kA2KLMfBg8I4pqUOV/2mOz
 oI5TOcudE1RDvf/r0c2+IHQVW9WrQUc2ylEUadzNe4VDPAICd7thQpVPiOxyGpcIPD
 +lNXQUFE1xu9zCB/Xc/SltoCSKW2biQgzn/9p3FRZtwB7KL+PfDqUc8yWNRjV4cHP9
 +0EOWl2mVRWRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 19B1FC4321E;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
From: Noralf Trønnes via B4 Submission Endpoint <devnull@kernel.org>
Date: Tue, 22 Nov 2022 21:58:43 +0100
Subject: [PATCH 5/6] drm/gud: Prepare buffer for CPU access in gud_flush_work()
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221122-gud-shadow-plane-v1-5-9de3afa3383e@tronnes.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Noralf Trønnes <noralf@tronnes.org>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669150743; l=6426;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=qj9BuXQxfDYEZkNa1F8b2yr4Iw9kNnKDH/tZ6QR6+8U=;
 b=4lsgk4C9SAIK17Wwfnz4FnMPmXTVuxQrVw40cr2rRESubxvM0+c63XhGB2o32F3BBA8EX1beCLTl
 Pm8TdXQ5AHZg75Tvbvi7DlMGtvNhOkFVfnsm2Oe6uE29RTs/ibtp
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

In preparation for moving to the shadow plane helper prepare the
framebuffer for CPU access as early as possible.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 67 +++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index d2af9947494f..dfada6eedc58 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -15,6 +15,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
@@ -152,32 +153,21 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
 }
 
 static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
+			  const struct iosys_map *map, bool cached_reads,
 			  const struct drm_format_info *format, struct drm_rect *rect,
 			  struct gud_set_buffer_req *req)
 {
-	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
 	u8 compression = gdrm->compression;
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES] = { };
-	struct iosys_map map_data[DRM_FORMAT_MAX_PLANES] = { };
 	struct iosys_map dst;
 	void *vaddr, *buf;
 	size_t pitch, len;
-	int ret = 0;
 
 	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(rect));
 	len = pitch * drm_rect_height(rect);
 	if (len > gdrm->bulk_len)
 		return -E2BIG;
 
-	ret = drm_gem_fb_vmap(fb, map, map_data);
-	if (ret)
-		return ret;
-
-	vaddr = map_data[0].vaddr;
-
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		goto vunmap;
+	vaddr = map[0].vaddr;
 retry:
 	if (compression)
 		buf = gdrm->compress_buf;
@@ -192,29 +182,27 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	if (format != fb->format) {
 		if (format->format == GUD_DRM_FORMAT_R1) {
 			len = gud_xrgb8888_to_r124(buf, format, vaddr, fb, rect);
-			if (!len) {
-				ret = -ENOMEM;
-				goto end_cpu_access;
-			}
+			if (!len)
+				return -ENOMEM;
 		} else if (format->format == DRM_FORMAT_R8) {
-			drm_fb_xrgb8888_to_gray8(&dst, NULL, map_data, fb, rect);
+			drm_fb_xrgb8888_to_gray8(&dst, NULL, map, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB332) {
-			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map_data, fb, rect);
+			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(&dst, NULL, map_data, fb, rect,
+			drm_fb_xrgb8888_to_rgb565(&dst, NULL, map, fb, rect,
 						  gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(&dst, NULL, map_data, fb, rect);
+			drm_fb_xrgb8888_to_rgb888(&dst, NULL, map, fb, rect);
 		} else {
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
 	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
-		drm_fb_swab(&dst, NULL, map_data, fb, rect, !import_attach);
-	} else if (compression && !import_attach && pitch == fb->pitches[0]) {
+		drm_fb_swab(&dst, NULL, map, fb, rect, cached_reads);
+	} else if (compression && cached_reads && pitch == fb->pitches[0]) {
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
 	} else {
-		drm_fb_memcpy(&dst, NULL, map_data, fb, rect);
+		drm_fb_memcpy(&dst, NULL, map, fb, rect);
 	}
 
 	memset(req, 0, sizeof(*req));
@@ -237,12 +225,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		req->compressed_length = cpu_to_le32(complen);
 	}
 
-end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-vunmap:
-	drm_gem_fb_vunmap(fb, map);
-
-	return ret;
+	return 0;
 }
 
 struct gud_usb_bulk_context {
@@ -285,6 +268,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
 }
 
 static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffer *fb,
+			  const struct iosys_map *map, bool cached_reads,
 			  const struct drm_format_info *format, struct drm_rect *rect)
 {
 	struct gud_set_buffer_req req;
@@ -293,7 +277,7 @@ static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffer *fb,
 
 	drm_dbg(&gdrm->drm, "Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
 
-	ret = gud_prep_flush(gdrm, fb, format, rect, &req);
+	ret = gud_prep_flush(gdrm, fb, map, cached_reads, format, rect, &req);
 	if (ret)
 		return ret;
 
@@ -334,6 +318,7 @@ void gud_clear_damage(struct gud_device *gdrm)
 }
 
 static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb,
+			     const struct iosys_map *map, bool cached_reads,
 			     struct drm_rect *damage)
 {
 	const struct drm_format_info *format;
@@ -358,7 +343,7 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 		rect.y1 += i * lines;
 		rect.y2 = min_t(u32, rect.y1 + lines, damage->y2);
 
-		ret = gud_flush_rect(gdrm, fb, format, &rect);
+		ret = gud_flush_rect(gdrm, fb, map, cached_reads, format, &rect);
 		if (ret) {
 			if (ret != -ENODEV && ret != -ECONNRESET &&
 			    ret != -ESHUTDOWN && ret != -EPROTO)
@@ -373,9 +358,10 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 void gud_flush_work(struct work_struct *work)
 {
 	struct gud_device *gdrm = container_of(work, struct gud_device, work);
+	struct iosys_map gem_map = { }, fb_map = { };
 	struct drm_framebuffer *fb;
 	struct drm_rect damage;
-	int idx;
+	int idx, ret;
 
 	if (!drm_dev_enter(&gdrm->drm, &idx))
 		return;
@@ -390,8 +376,21 @@ void gud_flush_work(struct work_struct *work)
 	if (!fb)
 		goto out;
 
-	gud_flush_damage(gdrm, fb, &damage);
+	ret = drm_gem_fb_vmap(fb, &gem_map, &fb_map);
+	if (ret)
+		goto fb_put;
 
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		goto vunmap;
+
+	/* Imported buffers are assumed to be WriteCombined with uncached reads */
+	gud_flush_damage(gdrm, fb, &fb_map, !fb->obj[0]->import_attach, &damage);
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+vunmap:
+	drm_gem_fb_vunmap(fb, &gem_map);
+fb_put:
 	drm_framebuffer_put(fb);
 out:
 	drm_dev_exit(idx);

-- 
b4 0.10.1

