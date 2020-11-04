Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D62A6120
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FC86E981;
	Wed,  4 Nov 2020 10:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F86E98A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:04:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b8so21395732wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EAU5l9kGmRt6s3wyRhKN4Nd3WjBNuiB7ITAboktR2vk=;
 b=NcR0WmWVeCPU9Jaw8QbegSGKZn7QFUXZMYKB4DRI/qv4lB8vHcsDxgsYuuDB+sUO4k
 C8Nl7k+1Hs27bpO/Yrph945SkiEcTXd3TkGHUUjI6xqn8n3NjCQVhYoL5UVpfLLmmGyc
 B8qmkQFjEBZjYfqAfj6qPDiP7FaRWRAvSyQ4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EAU5l9kGmRt6s3wyRhKN4Nd3WjBNuiB7ITAboktR2vk=;
 b=Ix7KoxSnI6rITDhTDzgiB4mexnCpNLo7WuFdi70+Qyf73RU11tCRL3r8GqEu2RHpCc
 f+0wBjDXjKXg5hXXHIioV9eQa9ZJzQ4OOGdnVlD+gSa/GOuZFilLjVUqtwKJCSj8jNQ9
 2rLtfnUtA9L2gnV2ihMwYTDQADC0tX/H1MQvYxbyynpfov3U046mPaE6xTk623I5i0PE
 xb7Q9rExyItli3rk1IjjUsmIbex94xOgkMrkYyPkHurS07NTgL+6jM0OgzYDujkS3XZO
 OhLsiFSZ86L9iok0fJ7AYuxNulQxZsIuePXeHPdRnIKf+tNcuuFiV3TBldVU4SjOMukD
 qSnA==
X-Gm-Message-State: AOAM533cGpo5ZW+/tICtNUipZ9Op5sX/vGY51IQJmhAJZjgkjrAgjXpJ
 KiLUzyjRlpaMRkI9YOJXFkNlPUQ/m+Qmb9XY
X-Google-Smtp-Source: ABdhPJymw+K3vDpCsGWqXHv8u53GXN6uYcO/gYCCPOGgcOGdhGGrqUki+fvBUZZFyl23Tc4HAzXqYg==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr31031372wrr.304.1604484275702; 
 Wed, 04 Nov 2020 02:04:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm120113wmk.24.2020.11.04.02.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 02:04:35 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm: Allow const struct drm_driver
Date: Wed,  4 Nov 2020 11:04:23 +0100
Message-Id: <20201104100425.1922351-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
References: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's nice if a big function/ioctl table like this is const. Only
downside here is that we need a few more #ifdef to paper over the
differences when CONFIG_DRM_LEGACY is enabled. Maybe provides more
motivation to sunset that horror show :-)

v2:
- Fix super important checkpatch warning (Sam)
- Update the kerneldoc example too (Sam)

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_drv.c | 17 +++++++++++------
 include/drm/drm_device.h  |  4 ++++
 include/drm/drm_drv.h     |  5 +++--
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 457ac0f82be2..0371d1f095b2 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -284,7 +284,7 @@ void drm_minor_release(struct drm_minor *minor)
  *		struct clk *pclk;
  *	};
  *
- *	static struct drm_driver driver_drm_driver = {
+ *	static const struct drm_driver driver_drm_driver = {
  *		[...]
  *	};
  *
@@ -574,7 +574,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 }
 
 static int drm_dev_init(struct drm_device *dev,
-			struct drm_driver *driver,
+			const struct drm_driver *driver,
 			struct device *parent)
 {
 	int ret;
@@ -589,7 +589,11 @@ static int drm_dev_init(struct drm_device *dev,
 
 	kref_init(&dev->ref);
 	dev->dev = get_device(parent);
+#ifdef CONFIG_DRM_LEGACY
+	dev->driver = (struct drm_driver *)driver;
+#else
 	dev->driver = driver;
+#endif
 
 	INIT_LIST_HEAD(&dev->managed.resources);
 	spin_lock_init(&dev->managed.lock);
@@ -663,7 +667,7 @@ static void devm_drm_dev_init_release(void *data)
 
 static int devm_drm_dev_init(struct device *parent,
 			     struct drm_device *dev,
-			     struct drm_driver *driver)
+			     const struct drm_driver *driver)
 {
 	int ret;
 
@@ -678,7 +682,8 @@ static int devm_drm_dev_init(struct device *parent,
 	return ret;
 }
 
-void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
+void *__devm_drm_dev_alloc(struct device *parent,
+			   const struct drm_driver *driver,
 			   size_t size, size_t offset)
 {
 	void *container;
@@ -713,7 +718,7 @@ EXPORT_SYMBOL(__devm_drm_dev_alloc);
  * RETURNS:
  * Pointer to new DRM device, or ERR_PTR on failure.
  */
-struct drm_device *drm_dev_alloc(struct drm_driver *driver,
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent)
 {
 	struct drm_device *dev;
@@ -858,7 +863,7 @@ static void remove_compat_control_link(struct drm_device *dev)
  */
 int drm_dev_register(struct drm_device *dev, unsigned long flags)
 {
-	struct drm_driver *driver = dev->driver;
+	const struct drm_driver *driver = dev->driver;
 	int ret;
 
 	if (!driver->load)
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index f4f68e7a9149..2c361964aee7 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -83,7 +83,11 @@ struct drm_device {
 	} managed;
 
 	/** @driver: DRM driver managing the device */
+#ifdef CONFIG_DRM_LEGACY
 	struct drm_driver *driver;
+#else
+	const struct drm_driver *driver;
+#endif
 
 	/**
 	 * @dev_private:
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 7af220226a25..cc9da43b6eda 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -516,7 +516,8 @@ struct drm_driver {
 #endif
 };
 
-void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
+void *__devm_drm_dev_alloc(struct device *parent,
+			   const struct drm_driver *driver,
 			   size_t size, size_t offset);
 
 /**
@@ -549,7 +550,7 @@ void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
 	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
 				       offsetof(type, member)))
 
-struct drm_device *drm_dev_alloc(struct drm_driver *driver,
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent);
 int drm_dev_register(struct drm_device *dev, unsigned long flags);
 void drm_dev_unregister(struct drm_device *dev);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
