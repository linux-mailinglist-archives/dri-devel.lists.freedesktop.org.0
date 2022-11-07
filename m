Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127861FC10
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0FF10E544;
	Mon,  7 Nov 2022 17:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DE710E539
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843595; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJBAdivZchmEtJwMCV+Ir3IdI2sK9lAdweiG3PvAk1M=;
 b=gbQ52Peys2tN5G9YAucMuOQ/E9FwpYYiTaey3zV+AzjXvtY5Pqygg9DUs2xBvjQg0DlWlz
 4tGvGmoadQ1ochh2n3uL6P0JgRf8/OJYjRywOYuwSYTUOzg1qGnmwJhOOBIdsEwE0NbE7c
 vTVRPFI5+nMWEh2n17Kbo6Ix3CF3yBA=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 21/26] drm: tilcdc: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:52:51 +0000
Message-Id: <20221107175256.360839-11-paul@crapouillou.net>
In-Reply-To: <20221107175256.360839-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomba@kernel.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index f72755b8ea14..cd5bdc2f803a 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -496,7 +496,6 @@ static const struct drm_driver tilcdc_driver = {
  * Power management:
  */
 
-#ifdef CONFIG_PM_SLEEP
 static int tilcdc_pm_suspend(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
@@ -518,11 +517,9 @@ static int tilcdc_pm_resume(struct device *dev)
 	pinctrl_pm_select_default_state(dev);
 	return  drm_mode_config_helper_resume(ddev);
 }
-#endif
 
-static const struct dev_pm_ops tilcdc_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tilcdc_pm_suspend, tilcdc_pm_resume)
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
+				tilcdc_pm_suspend, tilcdc_pm_resume);
 
 /*
  * Platform driver:
@@ -597,7 +594,7 @@ static struct platform_driver tilcdc_platform_driver = {
 	.remove     = tilcdc_pdev_remove,
 	.driver     = {
 		.name   = "tilcdc",
-		.pm     = &tilcdc_pm_ops,
+		.pm     = pm_sleep_ptr(&tilcdc_pm_ops),
 		.of_match_table = tilcdc_of_match,
 	},
 };
-- 
2.35.1

