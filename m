Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7B61FBE9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8AD10E86D;
	Mon,  7 Nov 2022 17:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E4C10E86D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843472; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+IpH1Q1dYPVKyLaxilWX5S98yicXsHBkC9S23qvx10=;
 b=0tiKwTfjj4UhOpeAevLbvl402I7D2NMWgngf1Q/iHCa1FNymftekv38ReVkSCMcp2rxzwa
 IM3Zhe0MlmSK6UO4Xyh3Udg2YJvZeIfJF5lhtnGRf4QYf992QMXJNQTJXwNc2UzExMP9wJ
 a7UjBsnLWx/CAYHgDcoX6uCq4V8Gpp4=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 01/26] drm: modeset-helper: Export dev_pm_ops for simple
 drivers
Date: Mon,  7 Nov 2022 17:50:41 +0000
Message-Id: <20221107175106.360578-2-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export a dev_pm_ops meant to be used with simple drivers, which have
their struct drm_device registered as their struct device's drvdata, and
only call drm_mode_config_pm_{suspend,resume}.

The symbol is conditionally exported if IS_ENABLED(CONFIG_PM_SLEEP), and
therefore it should always be referenced using the pm_sleep_ptr() macro.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_modeset_helper.c | 32 ++++++++++++++++++++++++++++
 include/drm/drm_modeset_helper.h     |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index f858dfedf2cf..0bc9f9228a60 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -20,6 +20,9 @@
  * OF THIS SOFTWARE.
  */
 
+#include <linux/device.h>
+#include <linux/pm.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
@@ -244,3 +247,32 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
 	return ret;
 }
 EXPORT_SYMBOL(drm_mode_config_helper_resume);
+
+static int drm_mode_config_pm_suspend(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(drm);
+}
+
+static int drm_mode_config_pm_resume(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(drm);
+}
+
+/**
+ * drm_mode_config_pm_ops - Exported dev_pm_ops helper for simple drivers
+ *
+ * This dev_pm_ops can be used for simple drivers that would otherwise only call
+ * drm_mode_config_helper_suspend / drm_mode_config_helper_resume in their PM
+ * callbacks. It is only valid if the driver's drm_device has been registered as
+ * the struct device's drvdata.
+ *
+ * The exported symbol must always be used with the pm_sleep_ptr() macro, like
+ * this:
+ * .pm = pm_sleep_ptr(&drm_mode_config_pm_ops),
+ */
+EXPORT_SIMPLE_DEV_PM_OPS(drm_mode_config_pm_ops,
+			 drm_mode_config_pm_suspend, drm_mode_config_pm_resume);
diff --git a/include/drm/drm_modeset_helper.h b/include/drm/drm_modeset_helper.h
index 995fd981cab0..85f29637e9c1 100644
--- a/include/drm/drm_modeset_helper.h
+++ b/include/drm/drm_modeset_helper.h
@@ -23,6 +23,8 @@
 #ifndef __DRM_KMS_HELPER_H__
 #define __DRM_KMS_HELPER_H__
 
+#include <linux/pm.h>
+
 struct drm_crtc;
 struct drm_crtc_funcs;
 struct drm_device;
@@ -41,4 +43,6 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 int drm_mode_config_helper_suspend(struct drm_device *dev);
 int drm_mode_config_helper_resume(struct drm_device *dev);
 
+extern const struct dev_pm_ops drm_mode_config_pm_ops;
+
 #endif
-- 
2.35.1

