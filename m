Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3463C822
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC9710E32C;
	Tue, 29 Nov 2022 19:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C6D10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749596; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJkd7RTlZ/tYJRcRZWVNstn3toofhEeX9u1GcJR6nBQ=;
 b=frKJZENcWkEdn/Szt43naXV3W7zH6A8igNeDsUNMGtmkuXxJ8WxVxGdQH6Zlc50iytxAOY
 +6Y5NpLVwk6vHosTN874YUgdEAmr5uTuVCRHeL12Ey8RppruudcW6Z1GTNBK7hkHJXrL1i
 j+GSCiaPXxIIEZQ+t3/eBOuyi2Geaqo=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 17/26] drm: rcar-du: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:33 +0000
Message-Id: <20221129191942.138244-4-paul@crapouillou.net>
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
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d003e8d9e7a2..eeec1e02446f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -599,7 +599,6 @@ static const struct drm_driver rcar_du_driver = {
  * Power management
  */
 
-#ifdef CONFIG_PM_SLEEP
 static int rcar_du_pm_suspend(struct device *dev)
 {
 	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
@@ -613,11 +612,9 @@ static int rcar_du_pm_resume(struct device *dev)
 
 	return drm_mode_config_helper_resume(&rcdu->ddev);
 }
-#endif
 
-static const struct dev_pm_ops rcar_du_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(rcar_du_pm_suspend, rcar_du_pm_resume)
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(rcar_du_pm_ops,
+				rcar_du_pm_suspend, rcar_du_pm_resume);
 
 /* -----------------------------------------------------------------------------
  * Platform driver
@@ -712,7 +709,7 @@ static struct platform_driver rcar_du_platform_driver = {
 	.shutdown	= rcar_du_shutdown,
 	.driver		= {
 		.name	= "rcar-du",
-		.pm	= &rcar_du_pm_ops,
+		.pm	= pm_sleep_ptr(&rcar_du_pm_ops),
 		.of_match_table = rcar_du_of_table,
 	},
 };
-- 
2.35.1

