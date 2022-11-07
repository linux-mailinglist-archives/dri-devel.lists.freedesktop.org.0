Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7F661FC34
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DC310E895;
	Mon,  7 Nov 2022 17:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5448F10E895
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843718; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Avu5fJwFdzpUBtBfpMkuNkz3r3lpjviSJgLf/PyNnc=;
 b=huAr+yEhaapVak5VdJsZEjw6FhHlbHjj9cw1yDTXRmmOmWOxokR6MaxcutJxHadCPlfuVU
 cQyoZBwM561D8HHH6qLIKm0bnyxcUJTKyws3fl8xgPEEtpiAOsO8TBNGrQTxfs6VzdBSrF
 E6JJBEfpaJGmUU5eTdAzJ+u7c4Cx1sc=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 24/26] drm: gm12u320: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:55:08 +0000
Message-Id: <20221107175510.361051-1-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the pm_ptr() macro to handle the .suspend / .resume / .reset_resume
callbacks.

This macro allows the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_PM is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch. It also allows to drop the
__maybe_unused tags.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 7441d992a5d7..0a901201142e 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pm.h>
 #include <linux/usb.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -718,15 +719,15 @@ static void gm12u320_usb_disconnect(struct usb_interface *interface)
 	drm_atomic_helper_shutdown(dev);
 }
 
-static __maybe_unused int gm12u320_suspend(struct usb_interface *interface,
-					   pm_message_t message)
+static int gm12u320_suspend(struct usb_interface *interface,
+			    pm_message_t message)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
 
 	return drm_mode_config_helper_suspend(dev);
 }
 
-static __maybe_unused int gm12u320_resume(struct usb_interface *interface)
+static int gm12u320_resume(struct usb_interface *interface)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
 	struct gm12u320_device *gm12u320 = to_gm12u320(dev);
@@ -747,11 +748,9 @@ static struct usb_driver gm12u320_usb_driver = {
 	.probe = gm12u320_usb_probe,
 	.disconnect = gm12u320_usb_disconnect,
 	.id_table = id_table,
-#ifdef CONFIG_PM
-	.suspend = gm12u320_suspend,
-	.resume = gm12u320_resume,
-	.reset_resume = gm12u320_resume,
-#endif
+	.suspend = pm_ptr(gm12u320_suspend),
+	.resume = pm_ptr(gm12u320_resume),
+	.reset_resume = pm_ptr(gm12u320_resume),
 };
 
 module_usb_driver(gm12u320_usb_driver);
-- 
2.35.1

