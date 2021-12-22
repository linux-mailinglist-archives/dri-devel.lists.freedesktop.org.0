Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500C47CE46
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09461126E2;
	Wed, 22 Dec 2021 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B885D10F4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=916gpQ5TQZBxXpPApgtQW0I1UIGKedMg/4PyltH33/c=;
 b=Q3CRxsSfY8u4zOdrDTprSWbkAEbi7ckCpBQ0n3agRLhZmKn7tDGV4QIx02oiuJIqp3DRsc
 GqmW3GgKOYLBOsRw0n23o+DNi8KJ3cdMYRKVBM2kv93djauUB9bQPelLrdwUYPBZq+Mq6b
 8kkC2ELMI2fQaayg+aOmR9qdqE2wlvc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-F9FFKaUgNGify1eGGxplGw-1; Wed, 22 Dec 2021 03:28:48 -0500
X-MC-Unique: F9FFKaUgNGify1eGGxplGw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n3-20020a05600c3b8300b00345c3fc40b0so669674wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=916gpQ5TQZBxXpPApgtQW0I1UIGKedMg/4PyltH33/c=;
 b=1SnYQxHsZaX8qdMPIXJ+nUDDUPK1lk7iBxrzG0sg/JqI73fGBSb6AAE01Y2kTDTnA5
 V3uGPz+C4Qs6YjG28PLnT11mD96BpPyabH1gfZY7lavBxuMXb9QVHaHNA3/8mlh/0a1B
 s445xUUYWlFbQrX9sKk++lQSTVYE0osxfQA7xqR+FJhjl35pQ63AUemWxJfOYcrZYEIq
 Idhi1k4DR4uF4tFI9jFOFlX/fVvyNuVCz97b07vcdDp9ZUTAWKJRfqCQV2478Kf409zX
 5M4QMsD253goz7SNy+wuDCh/G1n3Pot+VvzJJLSIwybLas/FFVxiWhlEGnktH2Xij+hw
 HG+g==
X-Gm-Message-State: AOAM5339XtGIRkvG7s//PbfY4LvdiOXDOoZ3FfTFt3kUap+uh2S3Lcb5
 Ih3NE651KF/9x0Zc/ZZuHoLuMufeV19H2wHBjDQICxsC1TLzfGZXsoO+NJlOUb6bDuPa4mcaNKT
 bA/q1ARnTTN0FxuYhxQRb7xGNfWlt
X-Received: by 2002:a5d:4144:: with SMTP id c4mr1323683wrq.702.1640161727454; 
 Wed, 22 Dec 2021 00:28:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyArIqTBpIbNGxmI4/yEpmZMeqf+tgNqKacNBC/CgC6jGtAWwEbfkMrIM/wDbmBhbs8PlGrlg==
X-Received: by 2002:a5d:4144:: with SMTP id c4mr1323670wrq.702.1640161727213; 
 Wed, 22 Dec 2021 00:28:47 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/10] drm: Provide platform module-init macro
Date: Wed, 22 Dec 2021 09:28:27 +0100
Message-Id: <20211222082831.196562-7-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide a helper macro to register platform DRM drivers. The new
macro behaves like module_platform_driver() with an additional
test if DRM modesetting has been enabled.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 include/drm/drm_module.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/drm/drm_module.h b/include/drm/drm_module.h
index eb3fd7bcbec9..4db1ae03d9a5 100644
--- a/include/drm/drm_module.h
+++ b/include/drm/drm_module.h
@@ -4,6 +4,7 @@
 #define DRM_MODULE_H
 
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include <drm/drm_drv.h>
 
@@ -92,4 +93,33 @@ drm_pci_unregister_driver_if_modeset(struct pci_driver *pci_drv, int modeset)
 	module_driver(__pci_drv, drm_pci_register_driver_if_modeset, \
 		      drm_pci_unregister_driver_if_modeset, __modeset)
 
+/*
+ * Platform drivers
+ */
+
+static inline int __init
+drm_platform_driver_register(struct platform_driver *platform_drv)
+{
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	return platform_driver_register(platform_drv);
+}
+
+/**
+ * drm_module_platform_driver - Register a DRM driver for platform devices
+ * @__platform_drv: the platform driver structure
+ *
+ * Registers a DRM driver for devices on the platform bus. The helper
+ * macro behaves like module_platform_driver() but tests the state of
+ * drm_firmware_drivers_only(). For more complex module initialization,
+ * use module_init() and module_exit() directly.
+ *
+ * Each module may only use this macro once. Calling it replaces
+ * module_init() and module_exit().
+ */
+#define drm_module_platform_driver(__platform_drv) \
+	module_driver(__platform_drv, drm_platform_driver_register, \
+		      platform_driver_unregister)
+
 #endif
-- 
2.33.1

