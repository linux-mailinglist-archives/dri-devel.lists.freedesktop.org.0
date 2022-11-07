Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A761FBEB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D93C10E86E;
	Mon,  7 Nov 2022 17:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6564A10E86D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843473; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDRHgJeXjD/Lfgp6cHobjOELEmX34fviCtkXalmd8+c=;
 b=f0JM/l8sjONQLMbeKaV/13rSiNUmMjvk1GSAMsTvoHb8ClwnThUWo7yB/bPzQpKMojrQtX
 Gh+xqUDRaNWRqQcrKl8qKs/IwLSiuWGYy+8WGZDAG8aG6KtfazclijdWmWPoJ0kmCQY5n5
 I6QP0f4xD6v2Df9PkdLUssmfIjwqs2U=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 02/26] drm: bochs: Use the dev_pm_ops provided by modeset
 helper
Date: Mon,  7 Nov 2022 17:50:42 +0000
Message-Id: <20221107175106.360578-3-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_mode_config_pm_ops structure exported by
drm_modeset_helper.c, which provides the exact same PM callbacks.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/tiny/bochs.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 04682f831544..26e9cba89f68 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -2,6 +2,7 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
@@ -610,30 +611,6 @@ static const struct drm_driver bochs_driver = {
 	DRM_GEM_VRAM_DRIVER,
 };
 
-/* ---------------------------------------------------------------------- */
-/* pm interface                                                           */
-
-#ifdef CONFIG_PM_SLEEP
-static int bochs_pm_suspend(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_suspend(drm_dev);
-}
-
-static int bochs_pm_resume(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_resume(drm_dev);
-}
-#endif
-
-static const struct dev_pm_ops bochs_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(bochs_pm_suspend,
-				bochs_pm_resume)
-};
-
 /* ---------------------------------------------------------------------- */
 /* pci interface                                                          */
 
@@ -721,7 +698,7 @@ static struct pci_driver bochs_pci_driver = {
 	.id_table =	bochs_pci_tbl,
 	.probe =	bochs_pci_probe,
 	.remove =	bochs_pci_remove,
-	.driver.pm =    &bochs_pm_ops,
+	.driver.pm =    pm_sleep_ptr(&drm_mode_config_pm_ops),
 };
 
 /* ---------------------------------------------------------------------- */
-- 
2.35.1

