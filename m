Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2A19FC17
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 19:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF696E46F;
	Mon,  6 Apr 2020 17:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC346E46F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 17:54:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8781BB1A9;
 Mon,  6 Apr 2020 17:54:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
Subject: [PATCH 10/10] drm/fb-helper: Remove return value from
 drm_fbdev_generic_setup()
Date: Mon,  6 Apr 2020 15:44:05 +0200
Message-Id: <20200406134405.6232-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406134405.6232-1-tzimmermann@suse.de>
References: <20200406134405.6232-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic fbdev emulation is a DRM client. Drivers should invoke the
setup function, but not depend on its success. Hence remove the return
value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 18 ++++++++----------
 include/drm/drm_fb_helper.h     |  5 +++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 165c8dab50797..24db97eee53d4 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2186,11 +2186,9 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  * Setup will be retried on the next hotplug event.
  *
  * The fbdev is destroyed by drm_dev_unregister().
- *
- * Returns:
- * Zero on success or negative error code on failure.
  */
-int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
+void drm_fbdev_generic_setup(struct drm_device *dev,
+			     unsigned int preferred_bpp)
 {
 	struct drm_fb_helper *fb_helper;
 	int ret;
@@ -2198,17 +2196,19 @@ int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 	WARN(dev->fb_helper, "fb_helper is already set!\n");
 
 	if (!drm_fbdev_emulation)
-		return 0;
+		return;
 
 	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return -ENOMEM;
+	if (!fb_helper) {
+		drm_err(dev, "Failed to allocate fb_helper\n");
+		return;
+	}
 
 	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
 	if (ret) {
 		kfree(fb_helper);
 		drm_err(dev, "Failed to register client: %d\n", ret);
-		return ret;
+		return;
 	}
 
 	if (!preferred_bpp)
@@ -2222,8 +2222,6 @@ int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
 	drm_client_register(&fb_helper->client);
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_fbdev_generic_setup);
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 208dbf87afa3e..fb037be83997d 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -269,7 +269,8 @@ int drm_fb_helper_debug_leave(struct fb_info *info);
 void drm_fb_helper_lastclose(struct drm_device *dev);
 void drm_fb_helper_output_poll_changed(struct drm_device *dev);
 
-int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp);
+void drm_fbdev_generic_setup(struct drm_device *dev,
+			     unsigned int preferred_bpp);
 #else
 static inline void drm_fb_helper_prepare(struct drm_device *dev,
 					struct drm_fb_helper *helper,
@@ -443,7 +444,7 @@ static inline void drm_fb_helper_output_poll_changed(struct drm_device *dev)
 {
 }
 
-static inline int
+static inline void
 drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 {
 	return 0;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
