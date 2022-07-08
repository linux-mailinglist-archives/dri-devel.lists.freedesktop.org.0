Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40156C16A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C44210EAD3;
	Fri,  8 Jul 2022 20:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139BC10EAC4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657313667; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/je/yixPYeA/QHCrkMiLMxqQF45GlsX63kQIV1/14JU=;
 b=N5DYcY6vfio+hGOYhjp5KGAwIn0xck8GrJpptyYgr9A91DSQmVmuginnSV4Tm1tHgHorjd
 GRdvIpaxt+DL7FnRb4LbfStQe34uwvlnsGWaWwcYODG2lPUjTLRv0YmqTLctf6/TOQavsq
 bZ5+cg9MeLHh8hcb+Wsy+QSRfyEqE2k=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/6] drm/ingenic: Use the new PM macros
Date: Fri,  8 Jul 2022 21:54:06 +0100
Message-Id: <20220708205406.96473-7-paul@crapouillou.net>
In-Reply-To: <20220708205406.96473-1-paul@crapouillou.net>
References: <20220708205406.96473-1-paul@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use DEFINE_SIMPLE_DEV_PM_OPS() instead of the SIMPLE_DEV_PM_OPS()
  macro. This makes it possible to remove the __maybe_unused flags on
  the callback functions.
- Since we only have callbacks for suspend/resume, we can conditionally
  compile the dev_pm_ops structure for when CONFIG_PM_SLEEP is enabled;
  so use the pm_sleep_ptr() macro instead of pm_ptr().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 98ff038d95d6..d5dcff59b9a8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1470,21 +1470,22 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused ingenic_drm_suspend(struct device *dev)
+static int ingenic_drm_suspend(struct device *dev)
 {
 	struct ingenic_drm *priv = dev_get_drvdata(dev);
 
 	return drm_mode_config_helper_suspend(&priv->drm);
 }
 
-static int __maybe_unused ingenic_drm_resume(struct device *dev)
+static int ingenic_drm_resume(struct device *dev)
 {
 	struct ingenic_drm *priv = dev_get_drvdata(dev);
 
 	return drm_mode_config_helper_resume(&priv->drm);
 }
 
-static SIMPLE_DEV_PM_OPS(ingenic_drm_pm_ops, ingenic_drm_suspend, ingenic_drm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ingenic_drm_pm_ops,
+				ingenic_drm_suspend, ingenic_drm_resume);
 
 static const u32 jz4740_formats[] = {
 	DRM_FORMAT_XRGB1555,
@@ -1615,7 +1616,7 @@ MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
 static struct platform_driver ingenic_drm_driver = {
 	.driver = {
 		.name = "ingenic-drm",
-		.pm = pm_ptr(&ingenic_drm_pm_ops),
+		.pm = pm_sleep_ptr(&ingenic_drm_pm_ops),
 		.of_match_table = of_match_ptr(ingenic_drm_of_match),
 	},
 	.probe = ingenic_drm_probe,
-- 
2.35.1

