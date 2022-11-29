Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0AC63C828
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8347410E331;
	Tue, 29 Nov 2022 19:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C22710E327
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749648; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byA101qNki62ObkCL8sU230sS3WvAvBk1eSOioaQ+Uo=;
 b=xqxyzatqfCp2mjbE69daFfXtIjZ4QvdVLh2PYEeHXgWkb3ZrlKAU17Gcn7E/yncUJGdXTD
 arvHBFkJyfH25CtDPs+dv84vwOhZ7Cyn8/NhBWVnL+iZj1WgOjaCAw/PzKdYQ0XVxGhwgX
 4d5Wok+WXHlhY7ju3rpmaCRY+80POEA=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 21/26] drm: tilcdc: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:37 +0000
Message-Id: <20221129191942.138244-8-paul@crapouillou.net>
In-Reply-To: <20221129191942.138244-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tomi Valkeinen <tomba@kernel.org>, linux-kernel@vger.kernel.org,
 Jyri Sarha <jyri.sarhai@iki.fi>, Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>
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
Acked-by: Jyri Sarha <jyri.sarhaı@iki.fi>
---
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomba@kernel.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 80615ecdae0b..4ca426007dc8 100644
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

