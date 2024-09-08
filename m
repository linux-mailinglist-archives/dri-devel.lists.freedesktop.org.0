Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62D970731
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29E010E1AE;
	Sun,  8 Sep 2024 12:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gpNfLXFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E2A10E1AE
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:10:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42bb8cf8a5bso30346225e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725797432; x=1726402232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Nbn0l4wlTXHZb83y8qDFs7SRfrOJtYaW6IfgziccBQ4=;
 b=gpNfLXFXw5/HkaZKyhvYK4Tqu/quy9OgxXb3DHEp3hNg+1S6Ie3RHqMAf0izZx8C55
 oALyoNnPtsnncWcVcOt3Cwi9ELQglftxjSLCP2azzUhEEgb5aSi3169lFcKitkCnpRQL
 w+RDnv7zEeBHOvewaTvJ/df3KiLq8yTx4fc9HDmZjK6y6MN7AX5X57n3qvxHMtiDb7fV
 TdA/1dxVK3KgOt6OpSRYDEugfgrlRxRGlAtYCeHnbWiKgP5XYD78hEFUxQ+88coT/Tsv
 laWzlXU9pnlzYs3ULkzbtkDstyJhX8wBjA1giJfyo51uzix7azNFMTFUBuvtUIPBjF/B
 7hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725797432; x=1726402232;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nbn0l4wlTXHZb83y8qDFs7SRfrOJtYaW6IfgziccBQ4=;
 b=KUresHKyLhTuZOZN6RhRHNBn1Z0uUvw8jliMkMSENZMeVMo/j7je96AgK3E8n6eDel
 u6ZRMKgHnYk5YglkqwK8QoqMSSxGHZ4CbIaCx/EjdtlNXjPdH/fSCxkmgNBKGjkWYYiq
 uA6+VclHg5Sf9njGE9REHDVQo7o5PEl6OYESVSLLY/iOTlYyGTVaq8k7foqszCbrZHl6
 t2jkbqPStsebDYvyvNdR8HJWn6N7d2EXCpJubjTeUPj0DUyBbgzUEq561ZHdiHpl03yA
 n2wtG1W7DGyzTJMlpERLJ/veRJSqvMuCI+i4hiL3maYoheKevC7cl6xvlcNHmC9kmaa8
 u2mw==
X-Gm-Message-State: AOJu0YzB23hhmpzz4J1UylH+F3D5mZr6Up0rByb4XAKMMZfuM9WIjSUH
 tGZ54okJRimjtUi0BcShf4lAUdwJdIyVACWgSlvjkp1dxhlFT7EAPwKSIXu5
X-Google-Smtp-Source: AGHT+IFfFsbPP1tIvszdwWSp8SkR2oBRXiMVImSqpBGVyKbNzd+s/5kYtm9Z3X0kIMqCFepHRDPPcg==
X-Received: by 2002:a05:600c:154a:b0:42c:b377:3f5f with SMTP id
 5b1f17b1804b1-42cb377413bmr12728555e9.14.1725797431602; 
 Sun, 08 Sep 2024 05:10:31 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd18:a600:88fa:9e17:3532:fcf4?
 (dynamic-2a01-0c23-bd18-a600-88fa-9e17-3532-fcf4.c23.pool.telefonica.de.
 [2a01:c23:bd18:a600:88fa:9e17:3532:fcf4])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42caeb45c81sm42584885e9.28.2024.09.08.05.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Sep 2024 05:10:31 -0700 (PDT)
Message-ID: <3a659ed0-4072-4f01-9676-65d6b1a42678@gmail.com>
Date: Sun, 8 Sep 2024 14:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/6] drm: Refactor drm_core_init error path
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

These changes make the error path a little more robust, because exit
steps in drm_core_exit() don't have to ensure any longer that they
work properly even if the associated init step wasn't executed.
In addition these changes allow to annotate a few functions as __exit,
saving some memory if drm is built-in.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/accel/drm_accel.c                |  2 +-
 drivers/gpu/drm/drm_drv.c                | 18 ++++++++++++------
 drivers/gpu/drm/drm_panic.c              |  4 ++--
 drivers/gpu/drm/drm_privacy_screen_x86.c |  2 +-
 drivers/gpu/drm/drm_sysfs.c              |  2 --
 5 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index aa826033b..25fdbea36 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -191,7 +191,7 @@ static const struct file_operations accel_stub_fops = {
 	.llseek = noop_llseek,
 };
 
-void accel_core_exit(void)
+void __exit accel_core_exit(void)
 {
 	unregister_chrdev(ACCEL_MAJOR, "accel");
 	debugfs_remove(accel_debugfs_root);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index ac30b0ec9..ea59994e5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1062,7 +1062,7 @@ static const struct file_operations drm_stub_fops = {
 	.llseek = noop_llseek,
 };
 
-static void drm_core_exit(void)
+static void __exit drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
 	drm_panic_exit();
@@ -1084,18 +1084,18 @@ static int __init drm_core_init(void)
 	ret = drm_sysfs_init();
 	if (ret < 0) {
 		DRM_ERROR("Cannot create DRM class: %d\n", ret);
-		goto error;
+		goto err_ida;
 	}
 
 	drm_debugfs_root = debugfs_create_dir("dri", NULL);
 
 	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
 	if (ret < 0)
-		goto error;
+		goto err_debugfs;
 
 	ret = accel_core_init();
 	if (ret < 0)
-		goto error;
+		goto err_chrdev;
 
 	drm_panic_init();
 
@@ -1106,8 +1106,14 @@ static int __init drm_core_init(void)
 	DRM_DEBUG("Initialized\n");
 	return 0;
 
-error:
-	drm_core_exit();
+err_chrdev:
+	unregister_chrdev(DRM_MAJOR, "drm");
+err_debugfs:
+	debugfs_remove(drm_debugfs_root);
+	drm_sysfs_destroy();
+err_ida:
+	WARN_ON(!xa_empty(&drm_minors_xa));
+	drm_connector_ida_destroy();
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 74412b7bf..d00fdb12d 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -679,7 +679,7 @@ static void __init drm_panic_qr_init(void)
 				   GFP_KERNEL);
 }
 
-static void drm_panic_qr_exit(void)
+static void __exit drm_panic_qr_exit(void)
 {
 	kfree(qrbuf1);
 	qrbuf1 = NULL;
@@ -1058,7 +1058,7 @@ void __init drm_panic_init(void)
 /**
  * drm_panic_exit() - Free the resources taken by drm_panic_exit()
  */
-void drm_panic_exit(void)
+void __exit drm_panic_exit(void)
 {
 	drm_panic_qr_exit();
 }
diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
index 72ed40e49..6be96a0cc 100644
--- a/drivers/gpu/drm/drm_privacy_screen_x86.c
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -98,7 +98,7 @@ void __init drm_privacy_screen_lookup_init(void)
 	}
 }
 
-void drm_privacy_screen_lookup_exit(void)
+void __exit drm_privacy_screen_lookup_exit(void)
 {
 	if (arch_lookup.provider)
 		drm_privacy_screen_lookup_remove(&arch_lookup);
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index a713f0500..f8577043e 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -155,8 +155,6 @@ int drm_sysfs_init(void)
  */
 void drm_sysfs_destroy(void)
 {
-	if (IS_ERR_OR_NULL(drm_class))
-		return;
 	drm_sysfs_acpi_unregister();
 	class_destroy(drm_class);
 	drm_class = NULL;
-- 
2.46.0


