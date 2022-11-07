Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6D61FC1B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A12A10E85B;
	Mon,  7 Nov 2022 17:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EADF10E520
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843593; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCJ8ZGsBKBthoKA4jzLPBZ2ybOb/+gNvRRdW1QwBz4Y=;
 b=x/cHs9n23E7v0YHvlDCnlvm5lAxyTNY8LuZdAnJgsMnlHn7GFX3CrEwVo8nVDfdzrpwSlO
 yyJsTchR+f58Ymg5S70kxHNP28/T3Sey+nowqoSYIloJpjPz63x99ppQTGwrXXl2HKtRzZ
 KrksU6FRmue0BZFvuTDnrdil5MimVUM=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 19/26] drm: shmobile: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:52:49 +0000
Message-Id: <20221107175256.360839-9-paul@crapouillou.net>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 3d511fa38913..337040fa6438 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -143,7 +143,6 @@ static const struct drm_driver shmob_drm_driver = {
  * Power management
  */
 
-#ifdef CONFIG_PM_SLEEP
 static int shmob_drm_pm_suspend(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
@@ -165,11 +164,9 @@ static int shmob_drm_pm_resume(struct device *dev)
 	drm_kms_helper_poll_enable(sdev->ddev);
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops shmob_drm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(shmob_drm_pm_suspend, shmob_drm_pm_resume)
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
+				shmob_drm_pm_suspend, shmob_drm_pm_resume);
 
 /* -----------------------------------------------------------------------------
  * Platform driver
@@ -292,7 +289,7 @@ static struct platform_driver shmob_drm_platform_driver = {
 	.remove		= shmob_drm_remove,
 	.driver		= {
 		.name	= "shmob-drm",
-		.pm	= &shmob_drm_pm_ops,
+		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
 	},
 };
 
-- 
2.35.1

