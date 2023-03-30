Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAA6CFCC1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6985510E150;
	Thu, 30 Mar 2023 07:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6833A10ED04
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:30:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F2711FE8F;
 Thu, 30 Mar 2023 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9OZ38+bm6jZeiS9LqKr2sD9S1IgjysCBOLblvU7vNg=;
 b=TxVcg92vL3AFP8WYfAsND3TOV1FnRMaSobgcyi+kqOTI+unwPz3CaJYSmgFXik70xraCAM
 wyR+wuxPbUi9PEhQj+wSYNB/ib2hDuoLnTvUNSbMzF0fOXJOVQH5BzoJsuiCNVYR56WE0H
 sh53Uo824Sqn5Ml6JmPFF+MtL/4rQe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9OZ38+bm6jZeiS9LqKr2sD9S1IgjysCBOLblvU7vNg=;
 b=sme6w4wozFw17LAPmhrIAVioIB3qf+biebvd3FWuhZQC3hy+xXk2NUN8zKNHvliftyk8iA
 l+uECMtRq4j6C0DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC5DE1348E;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cBriOKk6JWRNeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:30:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux@armlinux.org.uk, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 4/4] drm/armada: Implement fbdev emulation as in-kernel client
Date: Thu, 30 Mar 2023 09:30:46 +0200
Message-Id: <20230330073046.7150-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073046.7150-1-tzimmermann@suse.de>
References: <20230330073046.7150-1-tzimmermann@suse.de>
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

Move code from ad-hoc fbdev callbacks into DRM client functions
and remove the old callbacks. The functions instruct the client
to poll for changed output or restore the display. The DRM core
calls both, the old callbacks and the new client helpers, from
the same places. The new functions perform the same operation as
before, so there's no change in functionality.

Replace all code that initializes or releases fbdev emulation
throughout the driver. Instead initialize the fbdev client by a
single call to armada_fbdev_setup() after armada has registered its
DRM device. As in most drivers, aramda's fbdev emulation now acts
like a regular DRM client.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_dev_unregister() releases the client automatically.
No further action is required within armada. If the fbdev framebuffer
has been fully set up, struct fb_ops.fb_destroy implements the
release. For partially initialized emulation, the fbdev client
reverts the initial setup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/armada_drm.h   |  12 +--
 drivers/gpu/drm/armada/armada_drv.c   |  11 +--
 drivers/gpu/drm/armada/armada_fb.c    |   1 -
 drivers/gpu/drm/armada/armada_fbdev.c | 118 +++++++++++++++-----------
 4 files changed, 73 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
index 1475146b1c47..c303e8c7ff6c 100644
--- a/drivers/gpu/drm/armada/armada_drm.h
+++ b/drivers/gpu/drm/armada/armada_drm.h
@@ -16,7 +16,6 @@ struct armada_crtc;
 struct armada_gem_object;
 struct clk;
 struct drm_display_mode;
-struct drm_fb_helper;
 
 static inline void
 armada_updatel(uint32_t val, uint32_t mask, void __iomem *ptr)
@@ -55,7 +54,6 @@ extern const struct armada_variant armada510_ops;
 
 struct armada_private {
 	struct drm_device	drm;
-	struct drm_fb_helper	*fbdev;
 	struct armada_crtc	*dcrtc[2];
 	struct drm_mm		linear; /* protected by linear_lock */
 	struct mutex		linear_lock;
@@ -76,15 +74,9 @@ struct armada_private {
 #define drm_to_armada_dev(dev) container_of(dev, struct armada_private, drm)
 
 #if defined(CONFIG_DRM_FBDEV_EMULATION)
-int armada_fbdev_init(struct drm_device *dev);
-void armada_fbdev_fini(struct drm_device *dev);
+void armada_fbdev_setup(struct drm_device *dev);
 #else
-static inline int armada_fbdev_init(struct drm_device *dev)
-{
-	return 0;
-}
-
-static inline void armada_fbdev_fini(struct drm_device *dev)
+static inline void armada_fbdev_setup(struct drm_device *dev)
 { }
 #endif
 
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index fd9842740a08..4d7ca9d461e4 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -17,7 +17,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_vblank.h>
 
@@ -38,7 +37,6 @@ static const struct drm_ioctl_desc armada_ioctls[] = {
 DEFINE_DRM_GEM_FOPS(armada_drm_fops);
 
 static const struct drm_driver armada_drm_driver = {
-	.lastclose		= drm_fb_helper_lastclose,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import	= armada_gem_prime_import,
@@ -56,7 +54,6 @@ static const struct drm_driver armada_drm_driver = {
 
 static const struct drm_mode_config_funcs armada_drm_mode_config_funcs = {
 	.fb_create		= armada_fb_create,
-	.output_poll_changed	= drm_fb_helper_output_poll_changed,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 };
@@ -133,10 +130,6 @@ static int armada_drm_bind(struct device *dev)
 
 	drm_mode_config_reset(&priv->drm);
 
-	ret = armada_fbdev_init(&priv->drm);
-	if (ret)
-		goto err_comp;
-
 	drm_kms_helper_poll_init(&priv->drm);
 
 	ret = drm_dev_register(&priv->drm, 0);
@@ -147,11 +140,12 @@ static int armada_drm_bind(struct device *dev)
 	armada_drm_debugfs_init(priv->drm.primary);
 #endif
 
+	armada_fbdev_setup(&priv->drm);
+
 	return 0;
 
  err_poll:
 	drm_kms_helper_poll_fini(&priv->drm);
-	armada_fbdev_fini(&priv->drm);
  err_comp:
 	component_unbind_all(dev, &priv->drm);
  err_kms:
@@ -166,7 +160,6 @@ static void armada_drm_unbind(struct device *dev)
 	struct armada_private *priv = drm_to_armada_dev(drm);
 
 	drm_kms_helper_poll_fini(&priv->drm);
-	armada_fbdev_fini(&priv->drm);
 
 	drm_dev_unregister(&priv->drm);
 
diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index b87c71703c85..cf2e88218dc0 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -4,7 +4,6 @@
  */
 
 #include <drm/drm_modeset_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 303c55704225..0a5fd1aa86eb 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -8,6 +8,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 
@@ -16,6 +18,19 @@
 #include "armada_fb.h"
 #include "armada_gem.h"
 
+static void armada_fbdev_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *fbh = info->par;
+
+	drm_fb_helper_fini(fbh);
+
+	fbh->fb->funcs->destroy(fbh->fb);
+
+	drm_client_release(&fbh->client);
+	drm_fb_helper_unprepare(fbh);
+	kfree(fbh);
+}
+
 static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -24,6 +39,7 @@ static const struct fb_ops armada_fb_ops = {
 	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
 	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
 	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
+	.fb_destroy	= armada_fbdev_fb_destroy,
 };
 
 static int armada_fbdev_create(struct drm_fb_helper *fbh,
@@ -122,7 +138,17 @@ static const struct drm_fb_helper_funcs armada_fb_helper_funcs = {
  */
 
 static void armada_fbdev_client_unregister(struct drm_client_dev *client)
-{ }
+{
+	struct drm_fb_helper *fbh = drm_fb_helper_from_client(client);
+
+	if (fbh->info) {
+		drm_fb_helper_unregister_info(fbh);
+	} else {
+		drm_client_release(&fbh->client);
+		drm_fb_helper_unprepare(fbh);
+		kfree(fbh);
+	}
+}
 
 static int armada_fbdev_client_restore(struct drm_client_dev *client)
 {
@@ -133,7 +159,31 @@ static int armada_fbdev_client_restore(struct drm_client_dev *client)
 
 static int armada_fbdev_client_hotplug(struct drm_client_dev *client)
 {
+	struct drm_fb_helper *fbh = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
+
+	ret = drm_fb_helper_init(dev, fbh);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fbh);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
 	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fbh);
+err_drm_err:
+	drm_err(dev, "armada: Failed to setup fbdev emulation (ret=%d)\n", ret);
+	return ret;
 }
 
 static const struct drm_client_funcs armada_fbdev_client_funcs = {
@@ -143,65 +193,35 @@ static const struct drm_client_funcs armada_fbdev_client_funcs = {
 	.hotplug	= armada_fbdev_client_hotplug,
 };
 
-int armada_fbdev_init(struct drm_device *dev)
+void armada_fbdev_setup(struct drm_device *dev)
 {
-	struct armada_private *priv = drm_to_armada_dev(dev);
 	struct drm_fb_helper *fbh;
 	int ret;
 
-	fbh = devm_kzalloc(dev->dev, sizeof(*fbh), GFP_KERNEL);
-	if (!fbh)
-		return -ENOMEM;
-
-	priv->fbdev = fbh;
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
 
+	fbh = kzalloc(sizeof(*fbh), GFP_KERNEL);
+	if (!fbh)
+		return;
 	drm_fb_helper_prepare(dev, fbh, 32, &armada_fb_helper_funcs);
 
-	ret = drm_client_init(dev, &fbh->client, "armada-fbdev",
-			      &armada_fbdev_client_funcs);
-	if (ret)
-		goto err_drm_fb_helper_unprepare;
-
-	ret = drm_fb_helper_init(dev, fbh);
+	ret = drm_client_init(dev, &fbh->client, "fbdev", &armada_fbdev_client_funcs);
 	if (ret) {
-		DRM_ERROR("failed to initialize drm fb helper\n");
-		goto err_drm_client_release;
+		drm_err(dev, "Failed to register client: %d\n", ret);
+		goto err_drm_client_init;
 	}
 
-	ret = drm_fb_helper_initial_config(fbh);
-	if (ret) {
-		DRM_ERROR("failed to set initial config\n");
-		goto err_drm_fb_helper_fini;
-	}
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fbh);
-err_drm_client_release:
-	drm_client_release(&fbh->client);
-err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(fbh);
-	priv->fbdev = NULL;
-	return ret;
-}
-
-void armada_fbdev_fini(struct drm_device *dev)
-{
-	struct armada_private *priv = drm_to_armada_dev(dev);
-	struct drm_fb_helper *fbh = priv->fbdev;
-
-	if (fbh) {
-		drm_fb_helper_unregister_info(fbh);
+	ret = armada_fbdev_client_hotplug(&fbh->client);
+	if (ret)
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-		drm_fb_helper_fini(fbh);
-		drm_client_release(&fbh->client);
+	drm_client_register(&fbh->client);
 
-		if (fbh->fb)
-			fbh->fb->funcs->destroy(fbh->fb);
+	return;
 
-		drm_fb_helper_unprepare(fbh);
-
-		priv->fbdev = NULL;
-	}
+err_drm_client_init:
+	drm_fb_helper_unprepare(fbh);
+	kfree(fbh);
+	return;
 }
-- 
2.40.0

