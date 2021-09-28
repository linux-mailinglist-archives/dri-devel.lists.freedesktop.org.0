Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4641AADC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664F26E0DB;
	Tue, 28 Sep 2021 08:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661A389DC2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:44:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA6BD201E0;
 Tue, 28 Sep 2021 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632818688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88miFgFDPG5ykH2ICdxTBjf/CoD061KmqJpi1/td0Sk=;
 b=Vg0ijgA4KcJ5ons7A20VE1g8++LQU1DfEkmvhgcN6U3ZFwB8XUcgsz4qA48DpmXVw2572Y
 zeyJ6/DwR9LH30vv6o164OPzTmo1fr+jp7WJxkAVGcLd4hi6/Gxl3033pw+L9CwotYB9hI
 9Llhcclae0oKSV8JzaIz2rM2YSWJ0L8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632818688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88miFgFDPG5ykH2ICdxTBjf/CoD061KmqJpi1/td0Sk=;
 b=rkkc0mvF1JZonkEkBw7R7b2dDaL+OmBUECn36Ly8RBgpUcmGmOSiWYd99cQ5TiCAJLnsPq
 Tmtyh9Lhi88OWiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7D7B13B94;
 Tue, 28 Sep 2021 08:44:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YG7dKwDWUmEIDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Sep 2021 08:44:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/10] drm/gma500: Allocate GTT ranges in stolen memory with
 psb_gem_create()
Date: Tue, 28 Sep 2021 10:44:40 +0200
Message-Id: <20210928084446.22580-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928084446.22580-1-tzimmermann@suse.de>
References: <20210928084446.22580-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support private objects for stolen memory in psb_gem_create() and
convert users to psb_gem_create(). For stolen memory, psb_gem_create()
now initializes the GEM object via drm_gem_private_object_init().

In the fbdev setup, replace the open-coded initialization of struct
gtt_range with a call to psb_gem_create(). Use drm_gem_object_put()
for release.

In the cursor setup, use psb_gem_create() and get a real GEM object.
Previously the allocated instance of struct gtt_range was only partially
initialized. Release the cursor GEM object in gma_crtc_destroy(). The
release was missing from the original code.

With the conversion of all callers to psb_gem_create(), the extern
declarations of psb_gtt_alloc_range, psb_gtt_free_range and
psb_gem_object_func are not required any longer. Declare them as
static inline.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/framebuffer.c       | 44 ++++++----------------
 drivers/gpu/drm/gma500/gem.c               | 22 ++++++-----
 drivers/gpu/drm/gma500/gem.h               |  5 ---
 drivers/gpu/drm/gma500/gma_display.c       |  3 ++
 drivers/gpu/drm/gma500/psb_intel_display.c |  5 +--
 5 files changed, 29 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index ce92d11bd20f..3ea6679ccd38 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -224,31 +224,6 @@ static struct drm_framebuffer *psb_framebuffer_create
 	return fb;
 }
 
-/**
- *	psbfb_alloc		-	allocate frame buffer memory
- *	@dev: the DRM device
- *	@aligned_size: space needed
- *
- *	Allocate the frame buffer. In the usual case we get a GTT range that
- *	is stolen memory backed and life is simple. If there isn't sufficient
- *	we fail as we don't have the virtual mapping space to really vmap it
- *	and the kernel console code can't handle non linear framebuffers.
- *
- *	Re-address this as and if the framebuffer layer grows this ability.
- */
-static struct gtt_range *psbfb_alloc(struct drm_device *dev, int aligned_size)
-{
-	struct gtt_range *backing;
-	/* Begin by trying to use stolen memory backing */
-	backing = psb_gtt_alloc_range(dev, aligned_size, "fb", 1, PAGE_SIZE);
-	if (backing) {
-		backing->gem.funcs = &psb_gem_object_funcs;
-		drm_gem_private_object_init(dev, &backing->gem, aligned_size);
-		return backing;
-	}
-	return NULL;
-}
-
 /**
  *	psbfb_create		-	create a framebuffer
  *	@fb_helper: the framebuffer helper
@@ -268,6 +243,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 	int size;
 	int ret;
 	struct gtt_range *backing;
+	struct drm_gem_object *obj;
 	u32 bpp, depth;
 
 	mode_cmd.width = sizes->surface_width;
@@ -285,24 +261,25 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 	size = ALIGN(size, PAGE_SIZE);
 
 	/* Allocate the framebuffer in the GTT with stolen page backing */
-	backing = psbfb_alloc(dev, size);
-	if (backing == NULL)
-		return -ENOMEM;
+	backing = psb_gem_create(dev, size, "fb", true, PAGE_SIZE);
+	if (IS_ERR(backing))
+		return PTR_ERR(backing);
+	obj = &backing->gem;
 
 	memset(dev_priv->vram_addr + backing->offset, 0, size);
 
 	info = drm_fb_helper_alloc_fbi(fb_helper);
 	if (IS_ERR(info)) {
 		ret = PTR_ERR(info);
-		goto out;
+		goto err_drm_gem_object_put;
 	}
 
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
 
-	fb = psb_framebuffer_create(dev, &mode_cmd, &backing->gem);
+	fb = psb_framebuffer_create(dev, &mode_cmd, obj);
 	if (IS_ERR(fb)) {
 		ret = PTR_ERR(fb);
-		goto out;
+		goto err_drm_gem_object_put;
 	}
 
 	fb_helper->fb = fb;
@@ -333,8 +310,9 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 	dev_dbg(dev->dev, "allocated %dx%d fb\n", fb->width, fb->height);
 
 	return 0;
-out:
-	psb_gtt_free_range(dev, backing);
+
+err_drm_gem_object_put:
+	drm_gem_object_put(obj);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 8f4bcf9cf912..4acab39a583a 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -90,7 +90,7 @@ void psb_gtt_unpin(struct gtt_range *gt)
 	mutex_unlock(&dev_priv->gtt_mutex);
 }
 
-void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt)
+static void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt)
 {
 	/* Undo the mmap pin if we are destroying the object */
 	if (gt->mmapping) {
@@ -122,13 +122,13 @@ static const struct vm_operations_struct psb_gem_vm_ops = {
 	.close = drm_gem_vm_close,
 };
 
-const struct drm_gem_object_funcs psb_gem_object_funcs = {
+static const struct drm_gem_object_funcs psb_gem_object_funcs = {
 	.free = psb_gem_free_object,
 	.vm_ops = &psb_gem_vm_ops,
 };
 
-struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
-				      const char *name, int backed, u32 align)
+static struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
+					     const char *name, int backed, u32 align)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gtt_range *gt;
@@ -182,12 +182,16 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
 
 	obj->funcs = &psb_gem_object_funcs;
 
-	ret = drm_gem_object_init(dev, obj, size);
-	if (ret)
-		goto err_psb_gtt_free_range;
+	if (stolen) {
+		drm_gem_private_object_init(dev, obj, size);
+	} else {
+		ret = drm_gem_object_init(dev, obj, size);
+		if (ret)
+			goto err_psb_gtt_free_range;
 
-	/* Limit the object to 32-bit mappings */
-	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
+		/* Limit the object to 32-bit mappings */
+		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
+	}
 
 	return gt;
 
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index ad76127dc719..6b67c58cbed5 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -12,14 +12,9 @@
 
 struct drm_device;
 
-extern const struct drm_gem_object_funcs psb_gem_object_funcs;
-
 struct gtt_range *
 psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align);
 
-struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len, const char *name,
-				      int backed, u32 align);
-void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt);
 int psb_gtt_pin(struct gtt_range *gt);
 void psb_gtt_unpin(struct gtt_range *gt);
 
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 8285358fac01..8c95b50034a5 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -498,6 +498,9 @@ void gma_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 
+	if (gma_crtc->cursor_gt)
+		drm_gem_object_put(&gma_crtc->cursor_gt->gem);
+
 	kfree(gma_crtc->crtc_state);
 	drm_crtc_cleanup(crtc);
 	kfree(gma_crtc);
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 18d5f7e5889e..b5e9118c01a4 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -461,9 +461,8 @@ static void psb_intel_cursor_init(struct drm_device *dev,
 		/* Allocate 4 pages of stolen mem for a hardware cursor. That
 		 * is enough for the 64 x 64 ARGB cursors we support.
 		 */
-		cursor_gt = psb_gtt_alloc_range(dev, 4 * PAGE_SIZE, "cursor", 1,
-						PAGE_SIZE);
-		if (!cursor_gt) {
+		cursor_gt = psb_gem_create(dev, 4 * PAGE_SIZE, "cursor", true, PAGE_SIZE);
+		if (IS_ERR(cursor_gt)) {
 			gma_crtc->cursor_gt = NULL;
 			goto out;
 		}
-- 
2.33.0

