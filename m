Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C14263C81D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141710E323;
	Tue, 29 Nov 2022 19:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA410E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749595; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXo8DZzDmBVu1/2mkqAKNKUU5qOBP3khsqxV1Edxc1Y=;
 b=Z3LZdktAxTcmLL1IE7KpG3dZoRAt6TjhkgpYiR2bkB5IQFOshRWQmQ6Ek/52OcPGQqQSOQ
 UnthQermtDUVb2aLFusE8hE6UOtSVNrPwSgp32BZtpyGvAWMSc99fd+fYaqWXPzHBykfGQ
 Gr2gdfqwWO2E+vlCe25rlnNpGgCFl7Y=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 16/26] drm: panfrost: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:32 +0000
Message-Id: <20221129191942.138244-3-paul@crapouillou.net>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the EXPORT_GPL_RUNTIME_DEV_PM_OPS() and pm_ptr() macros to handle
the PM callbacks.

These macros allow the PM functions to be automatically dropped by the
compiler when CONFIG_PM is disabled, without having to use #ifdef
guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Steven Price <steven.price@arm.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 10 ++++++----
 drivers/gpu/drm/panfrost/panfrost_device.h |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  7 +------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index ee612303f076..fa1a086a862b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -6,6 +6,7 @@
 #include <linux/reset.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
 #include "panfrost_device.h"
@@ -400,8 +401,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 	panfrost_job_enable_interrupts(pfdev);
 }
 
-#ifdef CONFIG_PM
-int panfrost_device_resume(struct device *dev)
+static int panfrost_device_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
@@ -411,7 +411,7 @@ int panfrost_device_resume(struct device *dev)
 	return 0;
 }
 
-int panfrost_device_suspend(struct device *dev)
+static int panfrost_device_suspend(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
@@ -423,4 +423,6 @@ int panfrost_device_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
+
+EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
+			      panfrost_device_resume, NULL);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 8b25278f34c8..d9ba68cffb77 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -7,6 +7,7 @@
 
 #include <linux/atomic.h>
 #include <linux/io-pgtable.h>
+#include <linux/pm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
 #include <drm/drm_device.h>
@@ -172,8 +173,7 @@ int panfrost_device_init(struct panfrost_device *pfdev);
 void panfrost_device_fini(struct panfrost_device *pfdev);
 void panfrost_device_reset(struct panfrost_device *pfdev);
 
-int panfrost_device_resume(struct device *dev);
-int panfrost_device_suspend(struct device *dev);
+extern const struct dev_pm_ops panfrost_pm_ops;
 
 enum drm_panfrost_exception_type {
 	DRM_PANFROST_EXCEPTION_OK = 0x00,
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 2fa5afe21288..fa619fe72086 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -676,17 +676,12 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
-static const struct dev_pm_ops panfrost_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(panfrost_device_suspend, panfrost_device_resume, NULL)
-};
-
 static struct platform_driver panfrost_driver = {
 	.probe		= panfrost_probe,
 	.remove		= panfrost_remove,
 	.driver		= {
 		.name	= "panfrost",
-		.pm	= &panfrost_pm_ops,
+		.pm	= pm_ptr(&panfrost_pm_ops),
 		.of_match_table = dt_match,
 	},
 };
-- 
2.35.1

