Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD94E600D85
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 13:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AAF10ED46;
	Mon, 17 Oct 2022 11:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E84410ED42
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:15:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84F60204DB;
 Mon, 17 Oct 2022 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666005313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOrvWqoP/S1EsB4oFEsFyliT1JAx5vg+i7hmk0KHfu4=;
 b=V4hQpgqeJpV6/9K9jX5KgNsGlT12qTVTCRG9naf3+RhH9W+eRKXh/PZHqBbe36BHF0jYjT
 OezuxMmnAo/RBvqaXSy0C2Khyx4IAXpTVBoGzZMHqhBHtEJ4vBCUF1nMz8E2eHT4wMijmG
 0HguPYSoGL2U/gbGoaQZIQB+FrupLio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666005313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOrvWqoP/S1EsB4oFEsFyliT1JAx5vg+i7hmk0KHfu4=;
 b=lozOdO4FZ07yhxHbYxyFUBuizfQdHxT/4iBhSZ+9h2WmgYSfbwx7qPvGmbsQQbPoVvh2H+
 UY4/pM17Q6hSzRAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A32313ACD;
 Mon, 17 Oct 2022 11:15:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kEYxEUE5TWOgBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Oct 2022 11:15:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, hdegoede@redhat.com,
 noralf@tronnes.org, david@lechnology.com, airlied@redhat.com,
 sean@poorly.run
Subject: [PATCH 5/5] drm/st7586: Implement {begin,end}_fb_access helpers
Date: Mon, 17 Oct 2022 13:15:10 +0200
Message-Id: <20221017111510.20818-6-tzimmermann@suse.de>
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

Call drm_gem_fb_begin_cpu_access() and drm_gem_fb_end_cpu_access() in
the simple pipe's {begin,end}_fb_access helpers. This allows to abort
commits correctly after observing an error.

Remove the corresponding CPU-access calls from the driver's damage
handler. It runs during the atomic-apply phase when it's already too
late to handle errors.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/st7586.c | 44 ++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index b6f620b902e6d..bd61e0d22ca2d 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -92,29 +92,20 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 	kfree(buf);
 }
 
-static int st7586_buf_copy(void *dst, struct drm_framebuffer *fb,
-			   struct drm_rect *clip)
+static void st7586_buf_copy(void *dst, struct drm_framebuffer *fb,
+			    struct drm_rect *clip)
 {
 	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	void *src = dma_obj->vaddr;
-	int ret = 0;
-
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return ret;
 
 	st7586_xrgb8888_to_gray332(dst, src, fb, clip);
-
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-
-	return 0;
 }
 
 static void st7586_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
-	int start, end, idx, ret = 0;
+	int start, end, idx, ret;
 
 	if (!drm_dev_enter(fb->dev, &idx))
 		return;
@@ -125,9 +116,7 @@ static void st7586_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
 
-	ret = st7586_buf_copy(dbidev->tx_buf, fb, rect);
-	if (ret)
-		goto err_msg;
+	st7586_buf_copy(dbidev->tx_buf, fb, rect);
 
 	/* Pixels are packed 3 per byte */
 	start = rect->x1 / 3;
@@ -143,7 +132,6 @@ static void st7586_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 	ret = mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_START,
 				   (u8 *)dbidev->tx_buf,
 				   (end - start) * (rect->y2 - rect->y1));
-err_msg:
 	if (ret)
 		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
 
@@ -258,6 +246,28 @@ static void st7586_pipe_disable(struct drm_simple_display_pipe *pipe)
 	mipi_dbi_command(&dbidev->dbi, MIPI_DCS_SET_DISPLAY_OFF);
 }
 
+static int st7586_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
+				       struct drm_plane_state *plane_state)
+{
+	struct drm_framebuffer *fb = plane_state->fb;
+
+	if (!fb)
+		return 0;
+
+	return drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+}
+
+static void st7586_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
+				      struct drm_plane_state *plane_state)
+{
+	struct drm_framebuffer *fb = plane_state->fb;
+
+	if (!fb)
+		return;
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+}
+
 static const u32 st7586_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
@@ -266,6 +276,8 @@ static const struct drm_simple_display_pipe_funcs st7586_pipe_funcs = {
 	.enable		= st7586_pipe_enable,
 	.disable	= st7586_pipe_disable,
 	.update		= st7586_pipe_update,
+	.begin_fb_access = st7586_pipe_begin_fb_access,
+	.end_fb_access	= st7586_pipe_end_fb_access,
 };
 
 static const struct drm_display_mode st7586_mode = {
-- 
2.38.0

