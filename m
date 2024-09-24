Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E79983EF3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35F110E641;
	Tue, 24 Sep 2024 07:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iNejM4Pw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DFTQ1mwF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iNejM4Pw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DFTQ1mwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF9510E5A7;
 Tue, 24 Sep 2024 07:18:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 66AAF21BB7;
 Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f21nGON9v5HheJ0ElDt/7rIGpi/A79zQYv4pyJScr+8=;
 b=iNejM4PwPizVt27zhcgs8YnWnC6sCSaNnHtV2+9P0cFDpFIlOxlfC9dWoK26bssg+wBRjH
 TbXksMr5gFKGo/fYOuuKBQWflSXFDhczV6n/ORcEO3u19vviGNt+djKozCjqmhpN+nPJw0
 pnMQoh/VDPggRIOufQ5dkYAsYzeX30s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f21nGON9v5HheJ0ElDt/7rIGpi/A79zQYv4pyJScr+8=;
 b=DFTQ1mwFmhEOCYTkSEnczTKktbLjQcbbws4X4OzSVmEut6IpwgBg7hIrjFx05bkC3xjeGq
 Bn7P24B3YZ+fNyAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iNejM4Pw;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DFTQ1mwF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f21nGON9v5HheJ0ElDt/7rIGpi/A79zQYv4pyJScr+8=;
 b=iNejM4PwPizVt27zhcgs8YnWnC6sCSaNnHtV2+9P0cFDpFIlOxlfC9dWoK26bssg+wBRjH
 TbXksMr5gFKGo/fYOuuKBQWflSXFDhczV6n/ORcEO3u19vviGNt+djKozCjqmhpN+nPJw0
 pnMQoh/VDPggRIOufQ5dkYAsYzeX30s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f21nGON9v5HheJ0ElDt/7rIGpi/A79zQYv4pyJScr+8=;
 b=DFTQ1mwFmhEOCYTkSEnczTKktbLjQcbbws4X4OzSVmEut6IpwgBg7hIrjFx05bkC3xjeGq
 Bn7P24B3YZ+fNyAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25D4E13AE2;
 Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eEgUCKpn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:18:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v5 75/80] drm/gma500: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:13 +0200
Message-ID: <20240924071734.98201-76-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 66AAF21BB7
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/gma500/Kconfig   |   1 +
 drivers/gpu/drm/gma500/fbdev.c   | 100 +++----------------------------
 drivers/gpu/drm/gma500/psb_drv.c |   4 +-
 drivers/gpu/drm/gma500/psb_drv.h |  12 +++-
 4 files changed, 20 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index efb4a2dd2f80..c2927c37c40b 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -2,6 +2,7 @@
 config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select I2C
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 98b44974d42d..8edefea2ef59 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -143,12 +143,15 @@ static const struct fb_ops psb_fbdev_fb_ops = {
 	.fb_destroy = psb_fbdev_fb_destroy,
 };
 
+static const struct drm_fb_helper_funcs psb_fbdev_fb_helper_funcs = {
+};
+
 /*
- * struct drm_fb_helper_funcs
+ * struct drm_driver
  */
 
-static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
-			      struct drm_fb_helper_surface_size *sizes)
+int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				 struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -206,6 +209,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 		goto err_drm_gem_object_put;
 	}
 
+	fb_helper->funcs = &psb_fbdev_fb_helper_funcs;
 	fb_helper->fb = fb;
 
 	info = drm_fb_helper_alloc_info(fb_helper);
@@ -246,93 +250,3 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	drm_gem_object_put(obj);
 	return ret;
 }
-
-static const struct drm_fb_helper_funcs psb_fbdev_fb_helper_funcs = {
-	.fb_probe = psb_fbdev_fb_probe,
-};
-
-/*
- * struct drm_client_funcs and setup code
- */
-
-static void psb_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-
-	if (fb_helper->info) {
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_fb_helper_unprepare(fb_helper);
-		drm_client_release(&fb_helper->client);
-		kfree(fb_helper);
-	}
-}
-
-static int psb_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int psb_fbdev_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
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
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "Failed to setup gma500 fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs psb_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= psb_fbdev_client_unregister,
-	.restore	= psb_fbdev_client_restore,
-	.hotplug	= psb_fbdev_client_hotplug,
-};
-
-void psb_fbdev_setup(struct drm_psb_private *dev_priv)
-{
-	struct drm_device *dev = &dev_priv->dev;
-	struct drm_fb_helper *fb_helper;
-	int ret;
-
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fbdev_fb_helper_funcs);
-
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev-gma500", &psb_fbdev_client_funcs);
-	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
-		goto err_drm_fb_helper_unprepare;
-	}
-
-	drm_client_register(&fb_helper->client);
-
-	return;
-
-err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(fb_helper);
-	kfree(fb_helper);
-}
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 8b64f61ffaf9..43deefef6ad2 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -20,6 +20,7 @@
 #include <acpi/video.h>
 
 #include <drm/drm.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -475,7 +476,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	psb_fbdev_setup(dev_priv);
+	drm_client_setup(dev, NULL);
 
 	return 0;
 }
@@ -506,6 +507,7 @@ static const struct drm_driver driver = {
 	.num_ioctls = ARRAY_SIZE(psb_ioctls),
 
 	.dumb_create = psb_gem_dumb_create,
+	PSB_FBDEV_DRIVER_OPS,
 	.ioctls = psb_ioctls,
 	.fops = &psb_gem_fops,
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index bddf89b82fec..de62cbfcdc72 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -184,6 +184,9 @@
 #define KSEL_BYPASS_25 6
 #define KSEL_BYPASS_83_100 7
 
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+
 struct opregion_header;
 struct opregion_acpi;
 struct opregion_swsci;
@@ -597,10 +600,13 @@ struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
 
 /* fbdev */
 #if defined(CONFIG_DRM_FBDEV_EMULATION)
-void psb_fbdev_setup(struct drm_psb_private *dev_priv);
+int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				 struct drm_fb_helper_surface_size *sizes);
+#define PSB_FBDEV_DRIVER_OPS \
+	.fbdev_probe = psb_fbdev_driver_fbdev_probe
 #else
-static inline void psb_fbdev_setup(struct drm_psb_private *dev_priv)
-{ }
+#define PSB_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 #endif
 
 /* backlight.c */
-- 
2.46.0

