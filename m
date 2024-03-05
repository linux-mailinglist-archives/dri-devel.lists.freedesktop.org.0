Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCC0871DF0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B3B112A4B;
	Tue,  5 Mar 2024 11:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="XZ4tYvqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A0D112A4C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:34:23 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2997a92e23bso3517962a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709638463; x=1710243263;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/dcQghrlt499tRG4k7pSkJgfZTHsndNjCFgJHR4E/Nw=;
 b=IUum4AxaAZDIC6XPF4Ct4CWX+bPHWPU3Ohp+AaGa86J17KMkLEXUWWyr8c1NvGa/sa
 tID7ITOSR5gODsS+INZhBT1kB3EkkHSoa1YfqL9YyFbqP09IdJ7YPGJQgMXJzJ4jngex
 HYOX6Nomvmc4orWxBLLo+HG+ySXCqEEza4sMJr1D5pSY3QnAYD1Yj5g/DxRC5MvcvEb8
 D6lsxQCBeJWOj/Tv9mjcb9yh23Bv2TwA8hFxziHIQt5XhQcVdhcGG+Wg9XYUAqh1BGMC
 CVyzkc8dCa2YidJUSNNaQMQYGYYeLB+/s/pkCvhQCWTixjnM8Yk7rekbiPFadBOh8Lmn
 zC/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYmRUfuYgkrP8NXoM/LpjaRzGzf0SZhd2IzyNUPqlAzna0jgVd1yPzxSV9YP7sRUP/DtvmbwsIna5vTh4wja+8GigrvFkV5+qfi54AG6uj
X-Gm-Message-State: AOJu0YxPT3xgK2BtBi7ZALdjom6VFgkRLFrCG7tgSOEKUAvD0H4jELVV
 ksO2+OwvyCo8+1XwjjnUnXeTGHlGYjTW7Tle18AZh3WBzOjLloFF
X-Google-Smtp-Source: AGHT+IFcyb6MXz9bVUK2zcEKo8hC5CPMTtI/yp9MTxCAoF4zMPOkBO3dIzwpzNBPxsC8I9lzyEVifw==
X-Received: by 2002:a17:90a:4813:b0:29a:5c44:2d03 with SMTP id
 a19-20020a17090a481300b0029a5c442d03mr8091761pjh.27.1709638463275; 
 Tue, 05 Mar 2024 03:34:23 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 il18-20020a17090b165200b0029b6a3e1794sm768448pjb.28.2024.03.05.03.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:34:22 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709638461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dcQghrlt499tRG4k7pSkJgfZTHsndNjCFgJHR4E/Nw=;
 b=XZ4tYvqvlEXbwIiTnfnpVNU+/nPGkQx33TMQ2CFokzbx5DbGVJ5SYlfuWzFXV+9KNbGpKd
 gU1hlJqRrGf86RYCUCpM3dJidFCXucKL6bawyl1EinFYYSY569Vn3P0IcDD6lYRykrtc7b
 jgb6kTcCMpN22cU6wI2EGuQPknF/B/vHmqHa6yVpPVQQNsUNIM/KSqcDI0eFEjlGXLPMdi
 eeYRFDX3WxchdPRRR8xvkTpic+8AexW79kaq81UwJ6066xWkjtOo6xqr7ATrXf8t2THUC/
 0OPp5zT/Z1SbJpsA18GVbkp67mkUFjpcwc8lLatmChISqx4dFe0Z2oDFB4xL5A==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 08:34:11 -0300
Subject: [PATCH RESEND drm-misc 2/4] drm/sysfs: make drm_class constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-class_cleanup-drm-v1-2-94f82740525a@marliere.net>
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
In-Reply-To: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4750; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=TWafS46/cOn388vLX3knlaGbqPHumfrCMMRy3Z1uooE=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5wMzQiBiCjclrlZHoTJxk8xMwKf6UskNaNTXW
 9W/YR9DQ+iJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecDMwAKCRDJC4p8Y4ZY
 pv9pEACqUoH8iCZERpLB/OOzKOxqO6vTE6izkQWDbLe9hbraXujYS5JyxW1s0rDffD/x5NU1BNB
 /njL5VMvSDIGflxGdslrgRzhBb/MedUSM1HcTDZlapNvtu23peHPD2iNsCWER4w9Ak/rnc3xMak
 DTXA2p1sRJ1eKhgmmSJVmDQb3JBZPAUAuwe7HlxKIHkotWT5ahUd/mXOWM8n847jNJPZN3R4dc0
 QcbEA7a7905yz1xrRiMPHIbK5K7ND5BOMERb+YXYdF8OlS7UynJdibJ2SKScThvoD09EBLDe0v5
 ASAq8mBNzevgD118DLXHibbdHXm8et/InLSLFnIzxTeM2MRRj43J50YJPo2TSQbjYnio9c8Q6mm
 9ohwiOl5HG7fXnZieehZUkVWKwY/2hmyk8x3M9Ypin0CgPPsd/wPpg1ecICY5GPXiK7I9aa8BZv
 sSoMttQsrvImjcMk+xnuM+KLTOK/I0LdxKMevjjMXki15kXG8FVTUA0p3Uwf47fbu3V0OgbR3JG
 J1vG6FHo3oVS9Q4lctIwQENlX0lqED+i0ThU2sL/1uremnVo7TU5XU/HYBoIZJ2dQ0V57NnGaw/
 b9Cogbxadf93lskA1kIAsmNdofdEhrmj0wSzjvTsgY6aNe8VIzDcwzkLv7tNMwEXlVmFkeynnSJ
 QPNGH9n3xWVJM5g==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the drm_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/gpu/drm/drm_internal.h       |  2 +-
 drivers/gpu/drm/drm_privacy_screen.c |  2 +-
 drivers/gpu/drm/drm_sysfs.c          | 44 ++++++++++++++++--------------------
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 8e4faf0a28e6..a881cd442a9b 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -142,7 +142,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
 void drm_master_internal_release(struct drm_device *dev);
 
 /* drm_sysfs.c */
-extern struct class *drm_class;
+extern const struct class drm_class;
 
 int drm_sysfs_init(void);
 void drm_sysfs_destroy(void);
diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index 6cc39e30781f..2fbd24ba5818 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 	mutex_init(&priv->lock);
 	BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
 
-	priv->dev.class = drm_class;
+	priv->dev.class = &drm_class;
 	priv->dev.type = &drm_privacy_screen_type;
 	priv->dev.parent = parent;
 	priv->dev.release = drm_privacy_screen_device_release;
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index a953f69a34b6..90145f9256a2 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -58,7 +58,15 @@ static struct device_type drm_sysfs_device_connector = {
 	.name = "drm_connector",
 };
 
-struct class *drm_class;
+static char *drm_devnode(const struct device *dev, umode_t *mode)
+{
+	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
+}
+
+const struct class drm_class = {
+	.name = "drm",
+	.devnode = drm_devnode,
+};
 
 #ifdef CONFIG_ACPI
 static bool drm_connector_acpi_bus_match(struct device *dev)
@@ -93,11 +101,6 @@ static void drm_sysfs_acpi_register(void) { }
 static void drm_sysfs_acpi_unregister(void) { }
 #endif
 
-static char *drm_devnode(const struct device *dev, umode_t *mode)
-{
-	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
-}
-
 static int typec_connector_bind(struct device *dev,
 				struct device *typec_connector, void *data)
 {
@@ -142,19 +145,16 @@ int drm_sysfs_init(void)
 {
 	int err;
 
-	drm_class = class_create("drm");
-	if (IS_ERR(drm_class))
-		return PTR_ERR(drm_class);
+	err = class_register(&drm_class);
+	if (err)
+		return err;
 
-	err = class_create_file(drm_class, &class_attr_version.attr);
+	err = class_create_file(&drm_class, &class_attr_version.attr);
 	if (err) {
-		class_destroy(drm_class);
-		drm_class = NULL;
+		class_unregister(&drm_class);
 		return err;
 	}
 
-	drm_class->devnode = drm_devnode;
-
 	drm_sysfs_acpi_register();
 	return 0;
 }
@@ -166,12 +166,9 @@ int drm_sysfs_init(void)
  */
 void drm_sysfs_destroy(void)
 {
-	if (IS_ERR_OR_NULL(drm_class))
-		return;
 	drm_sysfs_acpi_unregister();
-	class_remove_file(drm_class, &class_attr_version.attr);
-	class_destroy(drm_class);
-	drm_class = NULL;
+	class_remove_file(&drm_class, &class_attr_version.attr);
+	class_unregister(&drm_class);
 }
 
 static void drm_sysfs_release(struct device *dev)
@@ -372,7 +369,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 		return -ENOMEM;
 
 	device_initialize(kdev);
-	kdev->class = drm_class;
+	kdev->class = &drm_class;
 	kdev->type = &drm_sysfs_device_connector;
 	kdev->parent = dev->primary->kdev;
 	kdev->groups = connector_dev_groups;
@@ -550,7 +547,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 			minor_str = "card%d";
 
 		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
-		kdev->class = drm_class;
+		kdev->class = &drm_class;
 		kdev->type = &drm_sysfs_device_minor;
 	}
 
@@ -579,10 +576,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
  */
 int drm_class_device_register(struct device *dev)
 {
-	if (!drm_class || IS_ERR(drm_class))
-		return -ENOENT;
-
-	dev->class = drm_class;
+	dev->class = &drm_class;
 	return device_register(dev);
 }
 EXPORT_SYMBOL_GPL(drm_class_device_register);

-- 
2.43.0

