Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C563C837
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ABF10E341;
	Tue, 29 Nov 2022 19:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE8F10E333
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749651; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTAcbDsSnpHtQLYEYbOOugt9xH+f+oTO9ezz+BdhRZw=;
 b=eSSEN8JvJtkcQpLhZiF7dYIrv23KzHI1PDfUftUkizJw6CJpc2fz6gg2JpHVYM25b1bdp1
 6gEv/7b4uA9vcjfqGCpzFU53cZr8tNN0DDt2Thm7n/45lYH/vjl0kMe6GbUHzjuFsbbSFU
 afDtSsIWNkd3bhotmWt5AsyjSsC4JHI=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 24/26] drm: gm12u320: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:40 +0000
Message-Id: <20221129191942.138244-11-paul@crapouillou.net>
In-Reply-To: <20221129191942.138244-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 130fd07a967d..c5bb683e440c 100644
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

