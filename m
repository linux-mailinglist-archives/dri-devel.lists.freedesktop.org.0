Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660D618222
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 16:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3313710E685;
	Thu,  3 Nov 2022 15:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3FB10E620;
 Thu,  3 Nov 2022 15:14:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27E9A1F8DC;
 Thu,  3 Nov 2022 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667488496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4aPgzZZorCQLl3vAvSSMp+NdFC9o0tszL97E4EWDSk=;
 b=I/+haJyfr+gENHgrb5PmCYXiaIqSiRlc6gzw3E11wcwkELm+bxwmry634/+fD/O1hXtiY2
 3IJ7AOUJ6wo0W34ZbqvRpJrStx6TtNCANoQzS4TIU++Nsq9eRFXG2AoxtzUM6gNEZmAxPn
 xbFTzGILmwQadcevn2+sH38LPYW4QkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667488496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4aPgzZZorCQLl3vAvSSMp+NdFC9o0tszL97E4EWDSk=;
 b=JReK5h56PGHBX9lsa3CqhzBTgE6WBJBvk5ZBwQ5LfSS97qrXGbiVWzt/wN10p1acycBkLN
 /04HGKYEusyunADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD01B13ADB;
 Thu,  3 Nov 2022 15:14:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8D5wKe/aY2PBGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:14:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 13/23] drm/fb-helper: Rename drm_fb_helper_alloc_fbi() to
 use _info postfix
Date: Thu,  3 Nov 2022 16:14:36 +0100
Message-Id: <20221103151446.2638-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-hyperv@vger.kernel.orglinux-hyperv"@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename drm_fb_helper_alloc_fbi() to drm_fb_helper_alloc_info() as
part of unifying the naming within fbdev helpers. Adapt drivers. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/armada/armada_fbdev.c      | 2 +-
 drivers/gpu/drm/drm_fb_helper.c            | 8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  | 2 +-
 drivers/gpu/drm/gma500/framebuffer.c       | 2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
 drivers/gpu/drm/msm/msm_fbdev.c            | 2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c    | 2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c       | 2 +-
 drivers/gpu/drm/radeon/radeon_fb.c         | 2 +-
 drivers/gpu/drm/tegra/fb.c                 | 2 +-
 include/drm/drm_fb_helper.h                | 4 ++--
 11 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 38f5170c0fea6..eaae98d9377ae 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -72,7 +72,7 @@ static int armada_fbdev_create(struct drm_fb_helper *fbh,
 	if (IS_ERR(dfb))
 		return PTR_ERR(dfb);
 
-	info = drm_fb_helper_alloc_fbi(fbh);
+	info = drm_fb_helper_alloc_info(fbh);
 	if (IS_ERR(info)) {
 		ret = PTR_ERR(info);
 		goto err_fballoc;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 480bf4f568b7b..881e6a04fa706 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -558,7 +558,7 @@ int drm_fb_helper_init(struct drm_device *dev,
 EXPORT_SYMBOL(drm_fb_helper_init);
 
 /**
- * drm_fb_helper_alloc_fbi - allocate fb_info and some of its members
+ * drm_fb_helper_alloc_info - allocate fb_info and some of its members
  * @fb_helper: driver-allocated fbdev helper
  *
  * A helper to alloc fb_info and the members cmap and apertures. Called
@@ -570,7 +570,7 @@ EXPORT_SYMBOL(drm_fb_helper_init);
  * fb_info pointer if things went okay, pointer containing error code
  * otherwise
  */
-struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
+struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 {
 	struct device *dev = fb_helper->dev->dev;
 	struct fb_info *info;
@@ -609,7 +609,7 @@ struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
 	framebuffer_release(info);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL(drm_fb_helper_alloc_fbi);
+EXPORT_SYMBOL(drm_fb_helper_alloc_info);
 
 /**
  * drm_fb_helper_unregister_fbi - unregister fb_info framebuffer device
@@ -2440,7 +2440,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->fb = buffer->fb;
 	fb = buffer->fb;
 
-	fbi = drm_fb_helper_alloc_fbi(fb_helper);
+	fbi = drm_fb_helper_alloc_info(fb_helper);
 	if (IS_ERR(fbi))
 		return PTR_ERR(fbi);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 767afd2bfa822..8741eb0b1b604 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -63,7 +63,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
 	unsigned long offset;
 
-	fbi = drm_fb_helper_alloc_fbi(helper);
+	fbi = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(fbi)) {
 		DRM_DEV_ERROR(to_dma_dev(helper->dev),
 			      "failed to allocate fb info.\n");
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 5f502a0048ab8..6d0e3bf6435ee 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -268,7 +268,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 
 	memset(dev_priv->vram_addr + backing->offset, 0, size);
 
-	info = drm_fb_helper_alloc_fbi(fb_helper);
+	info = drm_fb_helper_alloc_info(fb_helper);
 	if (IS_ERR(info)) {
 		ret = PTR_ERR(info);
 		goto err_drm_gem_object_put;
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index d533ecd451025..05b841343ea3e 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -254,7 +254,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		goto out_unlock;
 	}
 
-	info = drm_fb_helper_alloc_fbi(helper);
+	info = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(info)) {
 		drm_err(&dev_priv->drm, "Failed to allocate fb_info (%pe)\n", info);
 		ret = PTR_ERR(info);
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index b373e30003203..4d9a0fcbf95b6 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -93,7 +93,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 		goto fail;
 	}
 
-	fbi = drm_fb_helper_alloc_fbi(helper);
+	fbi = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(fbi)) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate fb info\n");
 		ret = PTR_ERR(fbi);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index ac4bd529ae2e8..fca40124fc17c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -362,7 +362,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 		}
 	}
 
-	info = drm_fb_helper_alloc_fbi(helper);
+	info = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(info)) {
 		ret = PTR_ERR(info);
 		goto out_unlock;
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 92d505be53e06..ab30c64e97043 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -161,7 +161,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 		goto fail;
 	}
 
-	fbi = drm_fb_helper_alloc_fbi(helper);
+	fbi = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(fbi)) {
 		dev_err(dev->dev, "failed to allocate fb info\n");
 		ret = PTR_ERR(fbi);
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index cc6754d88b819..0c6a227929db2 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -243,7 +243,7 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	rbo = gem_to_radeon_bo(gobj);
 
 	/* okay we have an object now allocate the framebuffer */
-	info = drm_fb_helper_alloc_fbi(helper);
+	info = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(info)) {
 		ret = PTR_ERR(info);
 		goto out;
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 6fe24535d0e43..a09c071f35120 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -243,7 +243,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	info = drm_fb_helper_alloc_fbi(helper);
+	info = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(info)) {
 		dev_err(drm->dev, "failed to allocate framebuffer info\n");
 		drm_gem_object_put(&bo->gem);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index d83e2d8e92eb9..5ec9d9c68d144 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -222,7 +222,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 
 int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
 
-struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper);
+struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper);
 void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper);
 void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
@@ -320,7 +320,7 @@ drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 }
 
 static inline struct fb_info *
-drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
+drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 {
 	return NULL;
 }
-- 
2.38.0

