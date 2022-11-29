Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC8E63C7EF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9486310E1DD;
	Tue, 29 Nov 2022 19:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD0B10E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749469; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gAnxaoVqEWoM5vi/BaBgxdiGzKVxjjTsGqnEeIglYs=;
 b=Lb3U8DMaMv86BzMM+cDyhB6ZOmgECsaSU4wa2llVOeq8427YF/e+LM6bLEc1eB2cFI1SR4
 cHxQpiRDgnycev9zdcpVoeoXS8zV88XDwRPGji+L3Mg5C3mOXy4zBHGWVfl5/M/4DS7Aw9
 BVcFIFgpdnmmm+0yq9xtiNKl35K8Sfs=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 01/26] drm: modeset-helper: Add
 DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS macro
Date: Tue, 29 Nov 2022 19:17:08 +0000
Message-Id: <20221129191733.137897-2-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This macro can be used with simple drivers, which have their
"struct drm_device" registered as their "struct device"'s drvdata, and
only call drm_mode_config_pm_{suspend,resume}.

The macro will define a "struct dev_pm_ops" with the name passed as
argument. This object cannot be referenced directly; instead, the
pm_sleep_ptr() macro should be used, like this:

DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(foo_pm_ops);

static struct platform_driver foo_driver = {
    .driver.pm = pm_sleep_ptr(&foo_pm_ops),
    ...
};

This ensures that the generated code will be dropped by the compiler in
the case where CONFIG_PM has been disabled in the config.

v2: instead of exporting a dev_pm_ops, introduce the
    DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/drm/drm_modeset_helper.h | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/drm/drm_modeset_helper.h b/include/drm/drm_modeset_helper.h
index 995fd981cab0..2ecf0e5c2e16 100644
--- a/include/drm/drm_modeset_helper.h
+++ b/include/drm/drm_modeset_helper.h
@@ -41,4 +41,42 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 int drm_mode_config_helper_suspend(struct drm_device *dev);
 int drm_mode_config_helper_resume(struct drm_device *dev);
 
+/**
+ * DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS - Generate simple PM callbacks
+ *
+ * This macro can be used by simple drivers that would otherwise only call
+ * drm_mode_config_helper_suspend / drm_mode_config_helper_resume in their PM
+ * callbacks. It will generate a struct dev_pm_ops of the given name, that can
+ * then be referenced in the device_driver structure.
+ *
+ * Note that it is only valid if the driver's drm_device has been registered as
+ * the struct device's drvdata.
+ *
+ * Additionally, the generated dev_pm_ops structure should not be referenced
+ * directly; instead, the pm_sleep_ptr() macro should be used, like this:
+ *
+ * DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(foo_pm_ops);
+ *
+ * static struct platform_driver foo_driver = {
+ *	.driver.pm = pm_sleep_ptr(&foo_pm_ops),
+ *	...
+ * };
+ *
+ * This ensures that the generated code will be dropped by the compiler in the
+ * case where CONFIG_PM has been disabled in the config.
++ */
+
+#define DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(_name) \
+	static int __##_name##_drm_mode_config_pm_suspend(struct device *dev) \
+	{ \
+		return drm_mode_config_helper_suspend(dev_get_drvdata(dev)); \
+	} \
+	static int __##_name##_drm_mode_config_pm_resume(struct device *dev) \
+	{ \
+		return drm_mode_config_helper_resume(dev_get_drvdata(dev)); \
+	} \
+	static DEFINE_SIMPLE_DEV_PM_OPS(_name, \
+					__##_name##_drm_mode_config_pm_suspend, \
+					__##_name##_drm_mode_config_pm_resume)
+
 #endif
-- 
2.35.1

