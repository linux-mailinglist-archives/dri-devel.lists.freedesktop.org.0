Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72163C7F1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05E710E220;
	Tue, 29 Nov 2022 19:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A01B10E211
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749470; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIthVPfRqMzRLHonB9Z3+9yNKc8FhZTyJnewRLDcrPs=;
 b=v6cI95cKHZF7JRsW6yCZyviPrYgL1hUQg6mGKb3+uSwSQT68AJ3ZblHdt2FXdYjVdF2lxU
 YhUSzbi1grVPHthQtkb3JWgqIRU8fEVCYtMlY3+3ITbHhcGY6uZfFk5LsBbEBlxgN4TgmX
 0FTfc9J1QbkFBazrASWsvhNoZ8uol00=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 02/26] drm: bochs: Define and use generic PM ops
Date: Tue, 29 Nov 2022 19:17:09 +0000
Message-Id: <20221129191733.137897-3-paul@crapouillou.net>
In-Reply-To: <20221129191733.137897-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro to create a
"struct dev_pm_ops" that can be used by this driver, instead of using
custom PM callbacks with the same behaviour.

v2: Use the DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro instead of an
    exported dev_pm_ops.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/tiny/bochs.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 024346054c70..598488905607 100644
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
 
@@ -716,12 +693,14 @@ static const struct pci_device_id bochs_pci_tbl[] = {
 	{ /* end of list */ }
 };
 
+DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(bochs_pm_ops);
+
 static struct pci_driver bochs_pci_driver = {
 	.name =		"bochs-drm",
 	.id_table =	bochs_pci_tbl,
 	.probe =	bochs_pci_probe,
 	.remove =	bochs_pci_remove,
-	.driver.pm =    &bochs_pm_ops,
+	.driver.pm =    pm_sleep_ptr(&bochs_pm_ops),
 };
 
 /* ---------------------------------------------------------------------- */
-- 
2.35.1

