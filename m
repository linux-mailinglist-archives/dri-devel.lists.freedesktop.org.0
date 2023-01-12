Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CBC66735E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD2610E8E4;
	Thu, 12 Jan 2023 13:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7D410E8E4;
 Thu, 12 Jan 2023 13:39:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B91442210B;
 Thu, 12 Jan 2023 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673530739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bz+TEZ5CGgKqgB1SMbVEVQAVMvTH9Ufcgu1xTO6CXqc=;
 b=BmgjcapjFIKwcdb3qrjjjF2qsM315gQ0QzQPqbke03U4kAZURF9rTGlVFfOvUgKI6VyYTi
 yhMD5ya021RHeFizjIaMlV3imY6ShPDKnIY2uhlb1a3DDQeD7M3OWJ9b8rHmcFyfVtQiuW
 L8lEcH7btur793r9KTX/Yiyc3i/CRJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673530739;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bz+TEZ5CGgKqgB1SMbVEVQAVMvTH9Ufcgu1xTO6CXqc=;
 b=XkjsPboU+8ctEPituCUpyemp380lTwN8gaRJOi94H+pl6kxyJccSTX3OSmAJhVlnLRlN8a
 RUKP+TY1yVZuc9Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 828B813585;
 Thu, 12 Jan 2023 13:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QDoAH3MNwGM4awAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 13:38:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kherbst@redhat.com, bskeggs@redhat.com, lyude@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/nouveau: Remove support for legacy contexts/buffers
Date: Thu, 12 Jan 2023 14:38:58 +0100
Message-Id: <20230112133858.17087-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
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
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove nouveau's support for legacy contexts and buffers. It was
required by libdrm earlier than 2.4.33, released in March 2012. A
previous attempt in 2013 to remove the functionality [1] had to be
reverted [2] as there were still users left. Libdrm 2.4.33 is now
almost 11 years old and it is time for userspace to move on.

With the nouveau code gone, we can also remove the driver-feature
bit DRIVER_KMS_LEGACY_CONTEXT.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7c510133d93dd6f15ca040733ba7b2891ed61fd1 # 1
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c21eb21cb50d58e7cbdcb8b9e7ff68b85cfa5095 # 2
---
 drivers/gpu/drm/drm_bufs.c            | 12 +++------
 drivers/gpu/drm/drm_context.c         | 36 +++++++++------------------
 drivers/gpu/drm/nouveau/Kconfig       | 12 ---------
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 +++-----
 include/drm/drm_drv.h                 |  7 ------
 5 files changed, 19 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..86700560fea2 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -423,8 +423,7 @@ int drm_legacy_addmap_ioctl(struct drm_device *dev, void *data,
 	if (!(capable(CAP_SYS_ADMIN) || map->type == _DRM_AGP || map->type == _DRM_SHM))
 		return -EPERM;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	err = drm_addmap_core(dev, map->offset, map->size, map->type,
@@ -469,8 +468,7 @@ int drm_legacy_getmap_ioctl(struct drm_device *dev, void *data,
 	int idx;
 	int i;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	idx = map->offset;
@@ -570,8 +568,7 @@ EXPORT_SYMBOL(drm_legacy_rmmap_locked);
 
 void drm_legacy_rmmap(struct drm_device *dev, struct drm_local_map *map)
 {
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return;
 
 	mutex_lock(&dev->struct_mutex);
@@ -628,8 +625,7 @@ int drm_legacy_rmmap_ioctl(struct drm_device *dev, void *data,
 	struct drm_map_list *r_list;
 	int ret;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	mutex_lock(&dev->struct_mutex);
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index c6e6a3e7219a..a0fc779e5e1e 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -59,8 +59,7 @@ struct drm_ctx_list {
  */
 void drm_legacy_ctxbitmap_free(struct drm_device * dev, int ctx_handle)
 {
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return;
 
 	mutex_lock(&dev->struct_mutex);
@@ -97,8 +96,7 @@ static int drm_legacy_ctxbitmap_next(struct drm_device * dev)
  */
 void drm_legacy_ctxbitmap_init(struct drm_device * dev)
 {
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return;
 
 	idr_init(&dev->ctx_idr);
@@ -114,8 +112,7 @@ void drm_legacy_ctxbitmap_init(struct drm_device * dev)
  */
 void drm_legacy_ctxbitmap_cleanup(struct drm_device * dev)
 {
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return;
 
 	mutex_lock(&dev->struct_mutex);
@@ -136,8 +133,7 @@ void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm_file *file)
 {
 	struct drm_ctx_list *pos, *tmp;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return;
 
 	mutex_lock(&dev->ctxlist_mutex);
@@ -182,8 +178,7 @@ int drm_legacy_getsareactx(struct drm_device *dev, void *data,
 	struct drm_local_map *map;
 	struct drm_map_list *_entry;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	mutex_lock(&dev->struct_mutex);
@@ -230,8 +225,7 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
 	struct drm_local_map *map = NULL;
 	struct drm_map_list *r_list = NULL;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	mutex_lock(&dev->struct_mutex);
@@ -335,8 +329,7 @@ int drm_legacy_resctx(struct drm_device *dev, void *data,
 	struct drm_ctx ctx;
 	int i;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	if (res->count >= DRM_RESERVED_CONTEXTS) {
@@ -370,8 +363,7 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
 	struct drm_ctx *ctx = data;
 	int tmp_handle;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	tmp_handle = drm_legacy_ctxbitmap_next(dev);
@@ -419,8 +411,7 @@ int drm_legacy_getctx(struct drm_device *dev, void *data,
 {
 	struct drm_ctx *ctx = data;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	/* This is 0, because we don't handle any context flags */
@@ -445,8 +436,7 @@ int drm_legacy_switchctx(struct drm_device *dev, void *data,
 {
 	struct drm_ctx *ctx = data;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	DRM_DEBUG("%d\n", ctx->handle);
@@ -469,8 +459,7 @@ int drm_legacy_newctx(struct drm_device *dev, void *data,
 {
 	struct drm_ctx *ctx = data;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	DRM_DEBUG("%d\n", ctx->handle);
@@ -495,8 +484,7 @@ int drm_legacy_rmctx(struct drm_device *dev, void *data,
 {
 	struct drm_ctx *ctx = data;
 
-	if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
-	    !drm_core_check_feature(dev, DRIVER_LEGACY))
+	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
 	DRM_DEBUG("%d\n", ctx->handle);
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 03d12caf9e26..ee92890d3266 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -24,18 +24,6 @@ config DRM_NOUVEAU
 	help
 	  Choose this option for open-source NVIDIA support.
 
-config NOUVEAU_LEGACY_CTX_SUPPORT
-	bool "Nouveau legacy context support"
-	depends on DRM_NOUVEAU
-	select DRM_LEGACY
-	default y
-	help
-	  There was a version of the nouveau DDX that relied on legacy
-	  ctx ioctls not erroring out. But that was back in time a long
-	  ways, so offer a way to disable it now. For uapi compat with
-	  old nouveau ddx this should be on by default, but modern distros
-	  should consider turning it off.
-
 config NOUVEAU_PLATFORM_DRIVER
 	bool "Nouveau (NVIDIA) SoC GPUs"
 	depends on DRM_NOUVEAU && ARCH_TEGRA
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 80f154b6adab..80562177b581 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1221,13 +1221,9 @@ nouveau_driver_fops = {
 
 static struct drm_driver
 driver_stub = {
-	.driver_features =
-		DRIVER_GEM | DRIVER_MODESET | DRIVER_RENDER
-#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
-		| DRIVER_KMS_LEGACY_CONTEXT
-#endif
-		,
-
+	.driver_features = DRIVER_GEM |
+			   DRIVER_MODESET |
+			   DRIVER_RENDER,
 	.open = nouveau_drm_open,
 	.postclose = nouveau_drm_postclose,
 	.lastclose = nouveau_vga_lastclose,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index d7c521e8860f..1d76d0686b03 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -149,13 +149,6 @@ enum drm_driver_feature {
 	 * Legacy irq support. Only for legacy drivers. Do not use.
 	 */
 	DRIVER_HAVE_IRQ			= BIT(30),
-	/**
-	 * @DRIVER_KMS_LEGACY_CONTEXT:
-	 *
-	 * Used only by nouveau for backwards compatibility with existing
-	 * userspace.  Do not use.
-	 */
-	DRIVER_KMS_LEGACY_CONTEXT	= BIT(31),
 };
 
 /**
-- 
2.39.0

