Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DAC0C408
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ED910E35A;
	Mon, 27 Oct 2025 08:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SSxlLkNf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kTZaCj6p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y891gA6B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o3F2/LXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296E10E35B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:12:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EAE0E21903;
 Mon, 27 Oct 2025 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761552771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oaIYY61zIJJU/OezQlKKqsHdBy/GoI1TUvv82e5rkwo=;
 b=SSxlLkNf9cq/o2lgDnUPZmZjZCz9MoW5d1rXdJOtsX++aOKXP6Pjkoj6uTueNEBIhloxQz
 aE+E107+hu1rR7tEPz29aqUqFuvMtJFPwTDZ4behx1xkJWhy13lUEJJbGFDrAdKg3CADZU
 vDGEDE8PxSkpskt/4+WNWgP4eebVOfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761552771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oaIYY61zIJJU/OezQlKKqsHdBy/GoI1TUvv82e5rkwo=;
 b=kTZaCj6p5iO43pSUMr2nu4NikmXn2gjFoP804coQDbRLhrmf+fEo978xctIGp5asZ7u6sG
 sGht42RwWkC0mLAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761552770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oaIYY61zIJJU/OezQlKKqsHdBy/GoI1TUvv82e5rkwo=;
 b=Y891gA6BnHseB5hBqEfETO41zyIJft6Xlxh1mJsLA6AUx+CKeUbL9U42yXR2zMqYyMhcYN
 jvHWioP2Z6+VuYHE0Lgy1irhU9wcRa4+S2/yd86humZ6I3nHxJcq8tWCqe2aUNfUtQsBCO
 mMQ18EIbAWMSiVY1QGS5sTiqDCBqo+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761552770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oaIYY61zIJJU/OezQlKKqsHdBy/GoI1TUvv82e5rkwo=;
 b=o3F2/LXliEbhhcsygTDRbIEOjOFOcIx2tQYGqvbN2299Qr57kaE33L0OoSL+SP/nSO+Nah
 pFzJuJffUVzxKRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3437613693;
 Mon, 27 Oct 2025 08:12:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7TCMC4Ip/2jKDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 08:12:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm/fb-helper: Allocate and release fb_info in single place
Date: Mon, 27 Oct 2025 09:12:17 +0100
Message-ID: <20251027081245.80262-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCPT_COUNT_TWELVE(0.00)[31]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,armlinux.org.uk,linux.intel.com,kernel.org,samsung.com,intel.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,amd.com,nvidia.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLq3cifbxyhc6qbbynzfc6amns)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spam-Level: 
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

Move the calls to drm_fb_helper_alloc_info() from drivers into a
single place in fbdev helpers. Allocates struct fb_info for a new
framebuffer device. Then call drm_fb_helper_single_fb_probe() to
create an fbdev screen buffer. Also release the instance on errors
by calling drm_fb_helper_release_info().

Simplifies the code and fixes the error cleanup for some of the
drivers.

Regular release of the struct fb_info instance still happens in
drm_fb_helper_fini() as before.

v2:
- remove error rollback in driver implementations (kernel test robot)
- initialize info in TTM implementation (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/armada_fbdev.c      | 12 +------
 drivers/gpu/drm/drm_fb_helper.c            | 39 +++++++---------------
 drivers/gpu/drm/drm_fbdev_dma.c            | 12 ++-----
 drivers/gpu/drm/drm_fbdev_shmem.c          | 12 ++-----
 drivers/gpu/drm/drm_fbdev_ttm.c            | 12 ++-----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  9 +----
 drivers/gpu/drm/gma500/fbdev.c             | 12 +------
 drivers/gpu/drm/i915/display/intel_fbdev.c |  9 +----
 drivers/gpu/drm/msm/msm_fbdev.c            |  9 +----
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  9 +----
 drivers/gpu/drm/radeon/radeon_fbdev.c      | 13 +-------
 drivers/gpu/drm/tegra/fbdev.c              |  9 +----
 include/drm/drm_fb_helper.h                | 12 -------
 13 files changed, 26 insertions(+), 143 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 22e2081bfa04..601b2aad243b 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -43,10 +43,10 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
 				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_device *dev = fbh->dev;
+	struct fb_info *info = fbh->info;
 	struct drm_mode_fb_cmd2 mode;
 	struct armada_framebuffer *dfb;
 	struct armada_gem_object *obj;
-	struct fb_info *info;
 	int size, ret;
 	void *ptr;
 
@@ -90,12 +90,6 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
 	if (IS_ERR(dfb))
 		return PTR_ERR(dfb);
 
-	info = drm_fb_helper_alloc_info(fbh);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_fballoc;
-	}
-
 	info->fbops = &armada_fb_ops;
 	info->fix.smem_start = obj->phys_addr;
 	info->fix.smem_len = obj->obj.size;
@@ -111,8 +105,4 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
 		(unsigned long long)obj->phys_addr);
 
 	return 0;
-
- err_fballoc:
-	dfb->fb.funcs->destroy(&dfb->fb);
-	return ret;
 }
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 53e9dc0543de..dd80f5c5feec 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -495,20 +495,7 @@ int drm_fb_helper_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_fb_helper_init);
 
-/**
- * drm_fb_helper_alloc_info - allocate fb_info and some of its members
- * @fb_helper: driver-allocated fbdev helper
- *
- * A helper to alloc fb_info and the member cmap. Called by the driver
- * within the struct &drm_driver.fbdev_probe callback function. Drivers do
- * not need to release the allocated fb_info structure themselves, this is
- * automatically done when calling drm_fb_helper_fini().
- *
- * RETURNS:
- * fb_info pointer if things went okay, pointer containing error code
- * otherwise
- */
-struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
+static struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 {
 	struct device *dev = fb_helper->dev->dev;
 	struct fb_info *info;
@@ -535,17 +522,8 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 	framebuffer_release(info);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL(drm_fb_helper_alloc_info);
 
-/**
- * drm_fb_helper_release_info - release fb_info and its members
- * @fb_helper: driver-allocated fbdev helper
- *
- * A helper to release fb_info and the member cmap.  Drivers do not
- * need to release the allocated fb_info structure themselves, this is
- * automatically done when calling drm_fb_helper_fini().
- */
-void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
+static void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
 {
 	struct fb_info *info = fb_helper->info;
 
@@ -558,7 +536,6 @@ void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
 		fb_dealloc_cmap(&info->cmap);
 	framebuffer_release(info);
 }
-EXPORT_SYMBOL(drm_fb_helper_release_info);
 
 /**
  * drm_fb_helper_unregister_info - unregister fb_info framebuffer device
@@ -1809,6 +1786,11 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 	height = dev->mode_config.max_height;
 
 	drm_client_modeset_probe(&fb_helper->client, width, height);
+
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
 	ret = drm_fb_helper_single_fb_probe(fb_helper);
 	if (ret < 0) {
 		if (ret == -EAGAIN) {
@@ -1817,13 +1799,12 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 		}
 		mutex_unlock(&fb_helper->lock);
 
-		return ret;
+		goto err_drm_fb_helper_release_info;
 	}
 	drm_setup_crtcs_fb(fb_helper);
 
 	fb_helper->deferred_setup = false;
 
-	info = fb_helper->info;
 	info->var.pixclock = 0;
 
 	/* Need to drop locks to avoid recursive deadlock in
@@ -1846,6 +1827,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 	mutex_unlock(&kernel_fb_helper_lock);
 
 	return 0;
+
+err_drm_fb_helper_release_info:
+	drm_fb_helper_release_info(fb_helper);
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index c6196293e424..442d964039b7 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -268,9 +268,9 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
+	struct fb_info *info = fb_helper->info;
 	struct drm_client_buffer *buffer;
 	struct drm_framebuffer *fb;
-	struct fb_info *info;
 	u32 format;
 	struct iosys_map map;
 	int ret;
@@ -300,12 +300,6 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->buffer = buffer;
 	fb_helper->fb = fb;
 
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_drm_client_buffer_vunmap;
-	}
-
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	if (fb->funcs->dirty)
@@ -313,12 +307,10 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	else
 		ret = drm_fbdev_dma_driver_fbdev_probe_tail(fb_helper, sizes);
 	if (ret)
-		goto err_drm_fb_helper_release_info;
+		goto err_drm_client_buffer_vunmap;
 
 	return 0;
 
-err_drm_fb_helper_release_info:
-	drm_fb_helper_release_info(fb_helper);
 err_drm_client_buffer_vunmap:
 	fb_helper->fb = NULL;
 	fb_helper->buffer = NULL;
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 51573058df6f..2190e2230b83 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -134,10 +134,10 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
+	struct fb_info *info = fb_helper->info;
 	struct drm_client_buffer *buffer;
 	struct drm_gem_shmem_object *shmem;
 	struct drm_framebuffer *fb;
-	struct fb_info *info;
 	u32 format;
 	struct iosys_map map;
 	int ret;
@@ -167,12 +167,6 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->buffer = buffer;
 	fb_helper->fb = fb;
 
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_drm_client_buffer_vunmap;
-	}
-
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fbops = &drm_fbdev_shmem_fb_ops;
@@ -193,12 +187,10 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	info->fbdefio = &fb_helper->fbdefio;
 	ret = fb_deferred_io_init(info);
 	if (ret)
-		goto err_drm_fb_helper_release_info;
+		goto err_drm_client_buffer_vunmap;
 
 	return 0;
 
-err_drm_fb_helper_release_info:
-	drm_fb_helper_release_info(fb_helper);
 err_drm_client_buffer_vunmap:
 	fb_helper->fb = NULL;
 	fb_helper->buffer = NULL;
diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index ccf460fbc1f0..3a06c2b59a8d 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -174,8 +174,8 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
+	struct fb_info *info = fb_helper->info;
 	struct drm_client_buffer *buffer;
-	struct fb_info *info;
 	size_t screen_size;
 	void *screen_buffer;
 	u32 format;
@@ -203,12 +203,6 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 		goto err_drm_client_framebuffer_delete;
 	}
 
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_vfree;
-	}
-
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fbops = &drm_fbdev_ttm_fb_ops;
@@ -225,12 +219,10 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	info->fbdefio = &fb_helper->fbdefio;
 	ret = fb_deferred_io_init(info);
 	if (ret)
-		goto err_drm_fb_helper_release_info;
+		goto err_vfree;
 
 	return 0;
 
-err_drm_fb_helper_release_info:
-	drm_fb_helper_release_info(fb_helper);
 err_vfree:
 	vfree(screen_buffer);
 err_drm_client_framebuffer_delete:
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index a3bd21a827ad..539ce0a87886 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -57,18 +57,11 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 				   struct drm_fb_helper_surface_size *sizes,
 				   struct exynos_drm_gem *exynos_gem)
 {
-	struct fb_info *fbi;
+	struct fb_info *fbi = helper->info;
 	struct drm_framebuffer *fb = helper->fb;
 	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
 	unsigned long offset;
 
-	fbi = drm_fb_helper_alloc_info(helper);
-	if (IS_ERR(fbi)) {
-		DRM_DEV_ERROR(to_dma_dev(helper->dev),
-			      "failed to allocate fb info.\n");
-		return PTR_ERR(fbi);
-	}
-
 	fbi->fbops = &exynos_drm_fb_ops;
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index bc92fa24a1e2..c26926babc2a 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -108,7 +108,7 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct fb_info *info;
+	struct fb_info *info = fb_helper->info;
 	struct drm_framebuffer *fb;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
 	int size;
@@ -167,12 +167,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->funcs = &psb_fbdev_fb_helper_funcs;
 	fb_helper->fb = fb;
 
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_drm_framebuffer_unregister_private;
-	}
-
 	info->fbops = &psb_fbdev_fb_ops;
 
 	/* Accessed stolen memory directly */
@@ -196,10 +190,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	return 0;
 
-err_drm_framebuffer_unregister_private:
-	drm_framebuffer_unregister_private(fb);
-	drm_framebuffer_cleanup(fb);
-	kfree(fb);
 err_drm_gem_object_put:
 	drm_gem_object_put(obj);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index e5449c41cfa1..9cd03e2adeb2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -267,8 +267,8 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	struct intel_display *display = to_intel_display(helper->dev);
 	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
 	struct intel_framebuffer *fb = ifbdev->fb;
+	struct fb_info *info = helper->info;
 	struct ref_tracker *wakeref;
-	struct fb_info *info;
 	struct i915_vma *vma;
 	unsigned long flags = 0;
 	bool prealloc = false;
@@ -318,13 +318,6 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		goto out_unlock;
 	}
 
-	info = drm_fb_helper_alloc_info(helper);
-	if (IS_ERR(info)) {
-		drm_err(display->drm, "Failed to allocate fb_info (%pe)\n", info);
-		ret = PTR_ERR(info);
-		goto out_unpin;
-	}
-
 	helper->funcs = &intel_fb_helper_funcs;
 	helper->fb = &fb->base;
 
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index aad6fb77f0de..fd19995b12b5 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -91,9 +91,9 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 {
 	struct drm_device *dev = helper->dev;
 	struct msm_drm_private *priv = dev->dev_private;
+	struct fb_info *fbi = helper->info;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_gem_object *bo;
-	struct fb_info *fbi = NULL;
 	uint64_t paddr;
 	uint32_t format;
 	int ret, pitch;
@@ -126,13 +126,6 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		goto fail;
 	}
 
-	fbi = drm_fb_helper_alloc_info(helper);
-	if (IS_ERR(fbi)) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate fb info\n");
-		ret = PTR_ERR(fbi);
-		goto fail;
-	}
-
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
 	helper->funcs = &msm_fbdev_helper_funcs;
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b5df2923d2a6..c4671ab87f9c 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -153,9 +153,9 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	struct omap_fbdev *fbdev = priv->fbdev;
+	struct fb_info *fbi = helper->info;
 	struct drm_framebuffer *fb = NULL;
 	union omap_gem_size gsize;
-	struct fb_info *fbi = NULL;
 	struct drm_mode_fb_cmd2 mode_cmd = {0};
 	struct drm_gem_object *bo;
 	dma_addr_t dma_addr;
@@ -224,13 +224,6 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		goto fail;
 	}
 
-	fbi = drm_fb_helper_alloc_info(helper);
-	if (IS_ERR(fbi)) {
-		dev_err(dev->dev, "failed to allocate fb info\n");
-		ret = PTR_ERR(fbi);
-		goto fail;
-	}
-
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
 	helper->funcs = &omap_fbdev_helper_funcs;
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 4df6c9167bf0..1b469b2b4b04 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -204,7 +204,7 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	const struct drm_format_info *format_info;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
-	struct fb_info *info;
+	struct fb_info *info = fb_helper->info;
 	struct drm_gem_object *gobj;
 	struct radeon_bo *rbo;
 	struct drm_framebuffer *fb;
@@ -245,13 +245,6 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->funcs = &radeon_fbdev_fb_helper_funcs;
 	fb_helper->fb = fb;
 
-	/* okay we have an object now allocate the framebuffer */
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_drm_framebuffer_unregister_private;
-	}
-
 	info->fbops = &radeon_fbdev_fb_ops;
 
 	/* radeon resume is fragile and needs a vt switch to help it along */
@@ -277,10 +270,6 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	return 0;
 
-err_drm_framebuffer_unregister_private:
-	fb_helper->fb = NULL;
-	drm_framebuffer_unregister_private(fb);
-	drm_framebuffer_cleanup(fb);
 err_kfree:
 	kfree(fb);
 err_radeon_fbdev_destroy_pinned_object:
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 91aece6f34e0..8f40882aa76e 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -73,10 +73,10 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	struct tegra_drm *tegra = helper->dev->dev_private;
 	struct drm_device *drm = helper->dev;
 	struct drm_mode_fb_cmd2 cmd = { 0 };
+	struct fb_info *info = helper->info;
 	unsigned int bytes_per_pixel;
 	struct drm_framebuffer *fb;
 	unsigned long offset;
-	struct fb_info *info;
 	struct tegra_bo *bo;
 	size_t size;
 	int err;
@@ -97,13 +97,6 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	info = drm_fb_helper_alloc_info(helper);
-	if (IS_ERR(info)) {
-		dev_err(drm->dev, "failed to allocate framebuffer info\n");
-		drm_gem_object_put(&bo->gem);
-		return PTR_ERR(info);
-	}
-
 	fb = tegra_fb_alloc(drm,
 			    drm_get_format_info(drm, cmd.pixel_format, cmd.modifier[0]),
 			    &cmd, &bo, 1);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index c1d38d54a112..2faf8aaf98dc 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -256,8 +256,6 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 
 int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
 
-struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper);
-void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper);
 void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper);
 void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
@@ -340,16 +338,6 @@ drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 	return 0;
 }
 
-static inline struct fb_info *
-drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
-{
-	return NULL;
-}
-
-static inline void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
-{
-}
-
 static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
 {
 }

base-commit: c03916cb446b6eefe91538599775bb54bf98238c
-- 
2.51.1

