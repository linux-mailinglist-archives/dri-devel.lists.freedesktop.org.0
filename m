Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C1983EB1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA510E5ED;
	Tue, 24 Sep 2024 07:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OisRuEZm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mQhblgo7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OisRuEZm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mQhblgo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0451F10E5B4;
 Tue, 24 Sep 2024 07:18:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 72D8121BB9;
 Tue, 24 Sep 2024 07:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4YNqjuOz+zZ41invWV6KfzXbw7RjW6wvBC0gWe3ryE=;
 b=OisRuEZm6mJoWAO/ZFNRoqBoVkeZwTR8V91lFTXeYRvXkhRYsXtNRiOZV0twwxNs7GHJy+
 hYZZUpPIPm0BohUZn8GGZvU8O7odC1QFPKVA0X4GxS+frhJ+GivmDZJhEXnvlKpNXq6dFT
 R2EphkxjP1HAaJY00WUQpnAZpsL1ASo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4YNqjuOz+zZ41invWV6KfzXbw7RjW6wvBC0gWe3ryE=;
 b=mQhblgo7jC4BIs59yKt3/wKbUZdDFazJOg5Lps+ZvyaMCZ6hkl2Ag6oEZN2crzLlyrTw+n
 Y+EKcnIpDUzk3LBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OisRuEZm;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mQhblgo7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4YNqjuOz+zZ41invWV6KfzXbw7RjW6wvBC0gWe3ryE=;
 b=OisRuEZm6mJoWAO/ZFNRoqBoVkeZwTR8V91lFTXeYRvXkhRYsXtNRiOZV0twwxNs7GHJy+
 hYZZUpPIPm0BohUZn8GGZvU8O7odC1QFPKVA0X4GxS+frhJ+GivmDZJhEXnvlKpNXq6dFT
 R2EphkxjP1HAaJY00WUQpnAZpsL1ASo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4YNqjuOz+zZ41invWV6KfzXbw7RjW6wvBC0gWe3ryE=;
 b=mQhblgo7jC4BIs59yKt3/wKbUZdDFazJOg5Lps+ZvyaMCZ6hkl2Ag6oEZN2crzLlyrTw+n
 Y+EKcnIpDUzk3LBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25EDC1386E;
 Tue, 24 Sep 2024 07:18:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SGIRCKtn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:18:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v5 78/80] drm/tegra: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:16 +0200
Message-ID: <20240924071734.98201-79-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 72D8121BB9
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12];
 DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc),to(RLbwen1niosrcqbxsafh1)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,nvidia.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Rework fbdev probing to support fbdev_probe in struct drm_driver
and remove the old fb_probe callback. Provide an initializer macro
for struct drm_driver that sets the callback according to the kernel
configuration.

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The tegra driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tegra/Kconfig |  1 +
 drivers/gpu/drm/tegra/drm.c   |  5 +-
 drivers/gpu/drm/tegra/drm.h   | 12 +++--
 drivers/gpu/drm/tegra/fbdev.c | 98 +++--------------------------------
 4 files changed, 20 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index e688d8104652..8a3b16aac5d6 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -5,6 +5,7 @@ config DRM_TEGRA
 	depends on COMMON_CLK
 	depends on DRM
 	depends on OF
+	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4938960b5025..a013eb12b91c 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -15,6 +15,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
@@ -891,6 +892,8 @@ static const struct drm_driver tegra_drm_driver = {
 
 	.dumb_create = tegra_bo_dumb_create,
 
+	TEGRA_FBDEV_DRIVER_OPS,
+
 	.ioctls = tegra_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(tegra_drm_ioctls),
 	.fops = &tegra_drm_fops,
@@ -1269,7 +1272,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	if (err < 0)
 		goto hub;
 
-	tegra_fbdev_setup(drm);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 2f3781e04b0a..0b65e69f3a8a 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -25,6 +25,9 @@
 /* XXX move to include/uapi/drm/drm_fourcc.h? */
 #define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT_ULL(22)
 
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+
 struct edid;
 struct reset_control;
 
@@ -190,10 +193,13 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 					const struct drm_mode_fb_cmd2 *cmd);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-void tegra_fbdev_setup(struct drm_device *drm);
+int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				   struct drm_fb_helper_surface_size *sizes);
+#define TEGRA_FBDEV_DRIVER_OPS \
+	.fbdev_probe = tegra_fbdev_driver_fbdev_probe
 #else
-static inline void tegra_fbdev_setup(struct drm_device *drm)
-{ }
+#define TEGRA_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 #endif
 
 extern struct platform_driver tegra_display_hub_driver;
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index db6eaac3d30e..cd9d798f8870 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -66,8 +66,11 @@ static const struct fb_ops tegra_fb_ops = {
 	.fb_destroy = tegra_fbdev_fb_destroy,
 };
 
-static int tegra_fbdev_probe(struct drm_fb_helper *helper,
-			     struct drm_fb_helper_surface_size *sizes)
+static const struct drm_fb_helper_funcs tegra_fbdev_helper_funcs = {
+};
+
+int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				   struct drm_fb_helper_surface_size *sizes)
 {
 	struct tegra_drm *tegra = helper->dev->dev_private;
 	struct drm_device *drm = helper->dev;
@@ -112,6 +115,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 		return PTR_ERR(fb);
 	}
 
+	helper->funcs = &tegra_fbdev_helper_funcs;
 	helper->fb = fb;
 	helper->info = info;
 
@@ -144,93 +148,3 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	drm_framebuffer_remove(fb);
 	return err;
 }
-
-static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
-	.fb_probe = tegra_fbdev_probe,
-};
-
-/*
- * struct drm_client
- */
-
-static void tegra_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-
-	if (fb_helper->info) {
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_client_release(&fb_helper->client);
-		drm_fb_helper_unprepare(fb_helper);
-		kfree(fb_helper);
-	}
-}
-
-static int tegra_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int tegra_fbdev_client_hotplug(struct drm_client_dev *client)
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
-	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs tegra_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= tegra_fbdev_client_unregister,
-	.restore	= tegra_fbdev_client_restore,
-	.hotplug	= tegra_fbdev_client_hotplug,
-};
-
-void tegra_fbdev_setup(struct drm_device *dev)
-{
-	struct drm_fb_helper *helper;
-	int ret;
-
-	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
-	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
-
-	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
-	if (!helper)
-		return;
-	drm_fb_helper_prepare(dev, helper, 32, &tegra_fb_helper_funcs);
-
-	ret = drm_client_init(dev, &helper->client, "fbdev", &tegra_fbdev_client_funcs);
-	if (ret)
-		goto err_drm_client_init;
-
-	drm_client_register(&helper->client);
-
-	return;
-
-err_drm_client_init:
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
-}
-- 
2.46.0

