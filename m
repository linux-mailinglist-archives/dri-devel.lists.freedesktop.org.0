Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C0F971832
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8BE10E4D5;
	Mon,  9 Sep 2024 11:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kJVQ03Ba";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="prJ60DJH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kJVQ03Ba";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="prJ60DJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EB610E3CE;
 Mon,  9 Sep 2024 11:37:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 222E41FC23;
 Mon,  9 Sep 2024 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GO1Wr+HBcSw76Boa5ti1M3P83Wp5V6TXW21AJZI24MU=;
 b=kJVQ03Bao2TEmLPFLN2/LwPVx3T3zTJxoeah3OMEE1ro//dyVLMUQ2rWrx82TiQ9rlXTh1
 uXHX7LQ+zVLm0qDyVUl4FwwOR/T0emohcrKtGk85JnpWydUdUUG4YZLfB34X64udSzYYO5
 4ucNkGjnOT0hfmtRDtzZhtc6QCPXDuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881826;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GO1Wr+HBcSw76Boa5ti1M3P83Wp5V6TXW21AJZI24MU=;
 b=prJ60DJH5XmmPVTxnqp1IOTggALrH+uIjfqRCgW9fM7zLTCXjU2/1nBPswnjapQqPwI5El
 5uHUnIK908LPPzBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GO1Wr+HBcSw76Boa5ti1M3P83Wp5V6TXW21AJZI24MU=;
 b=kJVQ03Bao2TEmLPFLN2/LwPVx3T3zTJxoeah3OMEE1ro//dyVLMUQ2rWrx82TiQ9rlXTh1
 uXHX7LQ+zVLm0qDyVUl4FwwOR/T0emohcrKtGk85JnpWydUdUUG4YZLfB34X64udSzYYO5
 4ucNkGjnOT0hfmtRDtzZhtc6QCPXDuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881826;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GO1Wr+HBcSw76Boa5ti1M3P83Wp5V6TXW21AJZI24MU=;
 b=prJ60DJH5XmmPVTxnqp1IOTggALrH+uIjfqRCgW9fM7zLTCXjU2/1nBPswnjapQqPwI5El
 5uHUnIK908LPPzBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCE1313312;
 Mon,  9 Sep 2024 11:37:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CB3gLOHd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:37:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 76/80] drm/msm: Run DRM default client setup
Date: Mon,  9 Sep 2024 13:31:22 +0200
Message-ID: <20240909113633.595465-77-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_TWO(0.00)[2];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[14];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,suse.de:email,suse.de:mid,linaro.org:email];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,quicinc.com,linaro.org,poorly.run,somainline.org];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

The msm driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c   |   4 +-
 drivers/gpu/drm/msm/msm_drv.h   |  13 ++-
 drivers/gpu/drm/msm/msm_fbdev.c | 144 ++++++--------------------------
 3 files changed, 38 insertions(+), 123 deletions(-)

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
index be016d7b4ef1..63675a3b7097 100644
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
@@ -298,11 +301,13 @@ struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
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

