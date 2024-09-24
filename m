Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A651F983EF9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C7F10E571;
	Tue, 24 Sep 2024 07:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Up48Kiv5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vza4NA/g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Up48Kiv5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vza4NA/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF0210E4F9;
 Tue, 24 Sep 2024 07:18:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3FB81FCED;
 Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljjSzFp1baFbgP0rAoRQSSAFvyduQm2MJ58M3Ea60Lg=;
 b=Up48Kiv5fQHlj7u8GhzYxjZJXm/ILfZyJDEqGbl/xgI2Pbqhpxe7bXWQK+0asFLT6ld1vu
 sWGSQ97SLbn/tHmYiwzfdqA040wq5br7ZY3mBidDNSJJezrldRbOtTRXtEWhtHydqGT36f
 tob74m3doDW5Es5mkTXF2Awy+d6epvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljjSzFp1baFbgP0rAoRQSSAFvyduQm2MJ58M3Ea60Lg=;
 b=vza4NA/gwn0mcLoWFAfxq5lmy1uj1OJ1aJSQEMGkcfZoWw3ZTe3HeXvJsC7a0/QCPKFqMD
 KHFefm7V6rilr9Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljjSzFp1baFbgP0rAoRQSSAFvyduQm2MJ58M3Ea60Lg=;
 b=Up48Kiv5fQHlj7u8GhzYxjZJXm/ILfZyJDEqGbl/xgI2Pbqhpxe7bXWQK+0asFLT6ld1vu
 sWGSQ97SLbn/tHmYiwzfdqA040wq5br7ZY3mBidDNSJJezrldRbOtTRXtEWhtHydqGT36f
 tob74m3doDW5Es5mkTXF2Awy+d6epvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljjSzFp1baFbgP0rAoRQSSAFvyduQm2MJ58M3Ea60Lg=;
 b=vza4NA/gwn0mcLoWFAfxq5lmy1uj1OJ1aJSQEMGkcfZoWw3ZTe3HeXvJsC7a0/QCPKFqMD
 KHFefm7V6rilr9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D4221386E;
 Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8J1YGapn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:18:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 76/80] drm/msm: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:14 +0200
Message-ID: <20240924071734.98201-77-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_TWO(0.00)[2];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[14];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,quicinc.com:email];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,quicinc.com,linaro.org,poorly.run,somainline.org];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The msm driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig     |   1 +
 drivers/gpu/drm/msm/msm_drv.c   |   4 +-
 drivers/gpu/drm/msm/msm_drv.h   |  13 ++-
 drivers/gpu/drm/msm/msm_fbdev.c | 144 ++++++--------------------------
 4 files changed, 39 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index c8dda0ebd043..f16d7c00e089 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -14,6 +14,7 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
+	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..22fe0716d18b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -10,6 +10,7 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -292,7 +293,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	if (priv->kms_init) {
 		drm_kms_helper_poll_init(ddev);
-		msm_fbdev_setup(ddev);
+		drm_client_setup(ddev, NULL);
 	}
 
 	return 0;
@@ -903,6 +904,7 @@ static const struct drm_driver msm_driver = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
+	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
 	.ioctls             = msm_ioctls,
 	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 0d3adf398bc1..15de89b3cd3e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -40,6 +40,9 @@ extern struct fault_attr fail_gem_iova;
 #  define should_fail(attr, size) 0
 #endif
 
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+
 struct msm_kms;
 struct msm_gpu;
 struct msm_mmu;
@@ -294,11 +297,13 @@ struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-void msm_fbdev_setup(struct drm_device *dev);
+int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				 struct drm_fb_helper_surface_size *sizes);
+#define MSM_FBDEV_DRIVER_OPS \
+	.fbdev_probe = msm_fbdev_driver_fbdev_probe
 #else
-static inline void msm_fbdev_setup(struct drm_device *dev)
-{
-}
+#define MSM_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 #endif
 
 struct hdmi;
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 030bedac632d..c62249b1ab3d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -65,8 +65,31 @@ static const struct fb_ops msm_fb_ops = {
 	.fb_destroy = msm_fbdev_fb_destroy,
 };
 
-static int msm_fbdev_create(struct drm_fb_helper *helper,
-		struct drm_fb_helper_surface_size *sizes)
+static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
+			      struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct drm_fb_helper_funcs msm_fbdev_helper_funcs = {
+	.fb_dirty = msm_fbdev_fb_dirty,
+};
+
+int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				 struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_device *dev = helper->dev;
 	struct msm_drm_private *priv = dev->dev_private;
@@ -114,6 +137,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
+	helper->funcs = &msm_fbdev_helper_funcs;
 	helper->fb = fb;
 
 	fbi->fbops = &msm_fb_ops;
@@ -138,119 +162,3 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	drm_framebuffer_remove(fb);
 	return ret;
 }
-
-static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
-			      struct drm_clip_rect *clip)
-{
-	struct drm_device *dev = helper->dev;
-	int ret;
-
-	/* Call damage handlers only if necessary */
-	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
-		return 0;
-
-	if (helper->fb->funcs->dirty) {
-		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
-		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
-			return ret;
-	}
-
-	return 0;
-}
-
-static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
-	.fb_probe = msm_fbdev_create,
-	.fb_dirty = msm_fbdev_fb_dirty,
-};
-
-/*
- * struct drm_client
- */
-
-static void msm_fbdev_client_unregister(struct drm_client_dev *client)
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
-static int msm_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
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
-static const struct drm_client_funcs msm_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= msm_fbdev_client_unregister,
-	.restore	= msm_fbdev_client_restore,
-	.hotplug	= msm_fbdev_client_hotplug,
-};
-
-/* initialize fbdev helper */
-void msm_fbdev_setup(struct drm_device *dev)
-{
-	struct drm_fb_helper *helper;
-	int ret;
-
-	if (!fbdev)
-		return;
-
-	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
-	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
-
-	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
-	if (!helper)
-		return;
-	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
-
-	ret = drm_client_init(dev, &helper->client, "fbdev", &msm_fbdev_client_funcs);
-	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
-		goto err_drm_fb_helper_unprepare;
-	}
-
-	drm_client_register(&helper->client);
-
-	return;
-
-err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
-}
-- 
2.46.0

