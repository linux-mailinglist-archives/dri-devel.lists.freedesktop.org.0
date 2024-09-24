Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B5983ED5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4404810E614;
	Tue, 24 Sep 2024 07:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="K2WQKqXd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yXAVtXvO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K2WQKqXd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yXAVtXvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713E110E5B6;
 Tue, 24 Sep 2024 07:18:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 211C61FCEE;
 Tue, 24 Sep 2024 07:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4in74Ek7mUzloVNAGtVHmhWr+Pf/1gX3VhN7e2nHTXg=;
 b=K2WQKqXdutp7wKZBTipL5XpXx6QcshTUKycbIGQqGXz6VO99MJAtwUkiryiFf7Zr4YDXcd
 RIs3u512dzuyp/CxU8BibrvbEVTVn7jUDKDWDeoUMIjZbCr1ZTyOR8H2lDJCqZ94cvD6zm
 cqNLfYAp0z2KJy2m9joH/bGbwzASwPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4in74Ek7mUzloVNAGtVHmhWr+Pf/1gX3VhN7e2nHTXg=;
 b=yXAVtXvONMxR4wULu70ukNysIMfVvsYEbTx5cl9QNlOPLlfUxHkdj59kDMwNFZxB8aJq5+
 L06++4TJoLz+zhBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4in74Ek7mUzloVNAGtVHmhWr+Pf/1gX3VhN7e2nHTXg=;
 b=K2WQKqXdutp7wKZBTipL5XpXx6QcshTUKycbIGQqGXz6VO99MJAtwUkiryiFf7Zr4YDXcd
 RIs3u512dzuyp/CxU8BibrvbEVTVn7jUDKDWDeoUMIjZbCr1ZTyOR8H2lDJCqZ94cvD6zm
 cqNLfYAp0z2KJy2m9joH/bGbwzASwPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4in74Ek7mUzloVNAGtVHmhWr+Pf/1gX3VhN7e2nHTXg=;
 b=yXAVtXvONMxR4wULu70ukNysIMfVvsYEbTx5cl9QNlOPLlfUxHkdj59kDMwNFZxB8aJq5+
 L06++4TJoLz+zhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA1E313AE2;
 Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YF4bMKpn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:18:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH v5 77/80] drm/radeon: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:15 +0200
Message-ID: <20240924071734.98201-78-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO
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

Rework fbdev probing to support fbdev_probe in struct drm_driver
and remove the old fb_probe callback. Provide an initializer macro
for struct drm_driver that sets the callback according to the kernel
configuration.

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The radeon driver specifies a preferred color mode depending on
the available video memory, with a default of 32. Adapt this for
the new client interface.

v5:
- select DRM_CLIENT_SELECTION
v2:
- style changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/radeon/Kconfig        |   1 +
 drivers/gpu/drm/radeon/radeon_drv.c   |  14 +++-
 drivers/gpu/drm/radeon/radeon_fbdev.c | 114 ++------------------------
 drivers/gpu/drm/radeon/radeon_mode.h  |  12 ++-
 4 files changed, 28 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index f98356be0af2..9c6c74a75778 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -5,6 +5,7 @@ config DRM_RADEON
 	depends on DRM && PCI && MMU
 	depends on AGP || !AGP
 	select FW_LOADER
+	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
         select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index f36aa71c57c7..eae79f02d254 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -38,8 +38,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_pciids.h>
@@ -261,6 +263,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	unsigned long flags = 0;
 	struct drm_device *ddev;
 	struct radeon_device *rdev;
+	const struct drm_format_info *format;
 	int ret;
 
 	if (!ent)
@@ -324,7 +327,14 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_agp;
 
-	radeon_fbdev_setup(ddev->dev_private);
+	if (rdev->mc.real_vram_size <= (8 * 1024 * 1024))
+		format = drm_format_info(DRM_FORMAT_C8);
+	else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <= (32 * 1024 * 1024))
+		format = drm_format_info(DRM_FORMAT_RGB565);
+	else
+		format = NULL;
+
+	drm_client_setup(ddev, format);
 
 	return 0;
 
@@ -590,6 +600,8 @@ static const struct drm_driver kms_driver = {
 
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
 
+	RADEON_FBDEV_DRIVER_OPS,
+
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index fb70de29545c..0aa20c8df546 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -198,12 +198,11 @@ static const struct fb_ops radeon_fbdev_fb_ops = {
 	.fb_destroy = radeon_fbdev_fb_destroy,
 };
 
-/*
- * Fbdev helpers and struct drm_fb_helper_funcs
- */
+static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
+};
 
-static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
-					   struct drm_fb_helper_surface_size *sizes)
+int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
@@ -243,6 +242,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	}
 
 	/* setup helper */
+	fb_helper->funcs = &radeon_fbdev_fb_helper_funcs;
 	fb_helper->fb = fb;
 
 	/* okay we have an object now allocate the framebuffer */
@@ -288,110 +288,6 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
-	.fb_probe = radeon_fbdev_fb_helper_fb_probe,
-};
-
-/*
- * Fbdev client and struct drm_client_funcs
- */
-
-static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = fb_helper->dev;
-	struct radeon_device *rdev = dev->dev_private;
-
-	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
-		drm_helper_force_disable_all(dev);
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_client_release(&fb_helper->client);
-		drm_fb_helper_unprepare(fb_helper);
-		kfree(fb_helper);
-	}
-}
-
-static int radeon_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-	vga_switcheroo_process_delayed_switch();
-
-	return 0;
-}
-
-static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
-	struct radeon_device *rdev = dev->dev_private;
-	int ret;
-
-	if (dev->fb_helper)
-		return drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	ret = drm_fb_helper_init(dev, fb_helper);
-	if (ret)
-		goto err_drm_err;
-
-	if (!drm_drv_uses_atomic_modeset(dev))
-		drm_helper_disable_unused_functions(dev);
-
-	ret = drm_fb_helper_initial_config(fb_helper);
-	if (ret)
-		goto err_drm_fb_helper_fini;
-
-	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "Failed to setup radeon fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs radeon_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= radeon_fbdev_client_unregister,
-	.restore	= radeon_fbdev_client_restore,
-	.hotplug	= radeon_fbdev_client_hotplug,
-};
-
-void radeon_fbdev_setup(struct radeon_device *rdev)
-{
-	struct drm_fb_helper *fb_helper;
-	int bpp_sel = 32;
-	int ret;
-
-	if (rdev->mc.real_vram_size <= (8 * 1024 * 1024))
-		bpp_sel = 8;
-	else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <= (32 * 1024 * 1024))
-		bpp_sel = 16;
-
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(rdev_to_drm(rdev), fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
-
-	ret = drm_client_init(rdev_to_drm(rdev), &fb_helper->client, "radeon-fbdev",
-			      &radeon_fbdev_client_funcs);
-	if (ret) {
-		drm_err(rdev_to_drm(rdev), "Failed to register client: %d\n", ret);
-		goto err_drm_client_init;
-	}
-
-	drm_client_register(&fb_helper->client);
-
-	return;
-
-err_drm_client_init:
-	drm_fb_helper_unprepare(fb_helper);
-	kfree(fb_helper);
-}
-
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 {
 	if (rdev_to_drm(rdev)->fb_helper)
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 421c83fc70dc..12a1d99a1815 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -38,6 +38,9 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+
 struct edid;
 struct drm_edid;
 struct radeon_bo;
@@ -935,12 +938,15 @@ void dce8_program_fmt(struct drm_encoder *encoder);
 
 /* fbdev layer */
 #if defined(CONFIG_DRM_FBDEV_EMULATION)
-void radeon_fbdev_setup(struct radeon_device *rdev);
+int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				    struct drm_fb_helper_surface_size *sizes);
+#define RADEON_FBDEV_DRIVER_OPS \
+	.fbdev_probe = radeon_fbdev_driver_fbdev_probe
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
 #else
-static inline void radeon_fbdev_setup(struct radeon_device *rdev)
-{ }
+#define RADEON_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 static inline void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 { }
 static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
-- 
2.46.0

