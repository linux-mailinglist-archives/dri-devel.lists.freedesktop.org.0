Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA19C63C81B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A573910E2FC;
	Tue, 29 Nov 2022 19:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3675B10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749598; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93KzSvS5igs3S+cAbvCYD4WLcuFTokGvoynUcK5Icnw=;
 b=vF6P0PbFzl3XQTIIeBBWk33b7nBsalJsw5sWVgBOpfAglBFB67FxzQSWsQwUrn2sbPwcof
 PDY5kynsihQ8MxQeQgm+f5SiDXDvYvV/eVpATZ8/VubDNplHqon2MmXPAUM8vuVxOUCMkq
 AZkSjDXGGJMWeM8hlCJbk6T5DeNVhzY=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 19/26] drm: shmobile: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:35 +0000
Message-Id: <20221129191942.138244-6-paul@crapouillou.net>
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
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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

