Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A840561FC05
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E7110E892;
	Mon,  7 Nov 2022 17:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1AE10E890
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843587; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLSCl2S+9wY6fS7zP08oeDENmUBhHAKrTQR+Y/08Bpk=;
 b=mkU8crk9GOxL+1sgtDd44aIHu0bKdSFagIj6jsS5LZTBSPEADcbkgw8s6BhFogPq2tcldO
 iav9GnlhcJ44bH9vGqch8LPPes0swuLY7a6IAjYtAiUedYLWzyhvgKepOI4GNi9cYl9kPl
 02S63wx2+svEZJQnFySuzCQtLgO6IIc=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 13/26] drm: fsl-dcu: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:52:43 +0000
Message-Id: <20221107175256.360839-3-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Alison Wang <alison.wang@nxp.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index b4acc3422ba4..5aa6ca451ddc 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -164,7 +164,6 @@ static const struct drm_driver fsl_dcu_drm_driver = {
 	.minor			= 1,
 };
 
-#ifdef CONFIG_PM_SLEEP
 static int fsl_dcu_drm_pm_suspend(struct device *dev)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev_get_drvdata(dev);
@@ -209,11 +208,9 @@ static int fsl_dcu_drm_pm_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops fsl_dcu_drm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_dcu_drm_pm_suspend, fsl_dcu_drm_pm_resume)
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(fsl_dcu_drm_pm_ops,
+				fsl_dcu_drm_pm_suspend, fsl_dcu_drm_pm_resume);
 
 static const struct fsl_dcu_soc_data fsl_dcu_ls1021a_data = {
 	.name = "ls1021a",
@@ -363,7 +360,7 @@ static struct platform_driver fsl_dcu_drm_platform_driver = {
 	.remove		= fsl_dcu_drm_remove,
 	.driver		= {
 		.name	= "fsl-dcu",
-		.pm	= &fsl_dcu_drm_pm_ops,
+		.pm	= pm_sleep_ptr(&fsl_dcu_drm_pm_ops),
 		.of_match_table = fsl_dcu_of_match,
 	},
 };
-- 
2.35.1

