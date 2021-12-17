Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F247816D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1E110E13E;
	Fri, 17 Dec 2021 00:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19F110E192
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXrPLKHkj9hSvtJ2AHjE/yBMtVQMtgWT388e8DCoaeE=;
 b=N/0SvsPRQkN4/nP1k9VXpUD7C4faxMm+q81Q8A8PpOIbuDxBoMxzAIohHkZ5I6AE4ZGMFB
 KvN3s07b6dz1APtUPtcF+WLqNULk1glYVlIiWMnHE4sFbzkctKEtM1OWZy1N9V0miZo3eo
 4CvmyMTkXL5aN4ELlYncM0hI3G0wG0w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-MZFF7pNbPsSga1qHIvUyeQ-1; Thu, 16 Dec 2021 19:38:00 -0500
X-MC-Unique: MZFF7pNbPsSga1qHIvUyeQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so144033wrr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXrPLKHkj9hSvtJ2AHjE/yBMtVQMtgWT388e8DCoaeE=;
 b=SrWU++8IdmSIaRMaN/JOArrhjnTy5ZkaM1zXrrhTeJHCcjbWoLTinK6AmxHKQk5V9h
 4yUNP7cjbcQcyxGEhBla+RYyabb9XDzQSCKMp6OXU9hfvC6pwQkFSk1JW/pnFwH0HXAY
 yLd826QboQOMzL8Qt9OynWTN06dVPLTWHeEWH19X147zb3DJDRkSpyvw8yonMQk/Z/SU
 oCCsC/ccwvugrD+MeH+U2dtJUzfN3kaOda7s0bV9YPqMhYx4CO5kwMg85xm6y7WVfpEO
 Kf5YQDalgvuKRyNajGwyjUc0dhrPh0nIViw7Kf5HFkvGG2SI+hoCgCx9VywoQg8635bV
 NXMw==
X-Gm-Message-State: AOAM5305v1KarF2E7sTKNcNXzPaOejoUEcbVQ7rHMU0p4GV0GRCQgWzN
 vNExbTecg1CFEqvTmON2AtPol8xl7P5brPoHa08MOqCb3y2acj5zrcYxAM7pP1JzojTsVSEqX63
 JCtm+i9vW2BwSR80ucskK28Cudffz
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr6988714wmb.28.1639701479222;
 Thu, 16 Dec 2021 16:37:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXlo6FfstO8WIBxtUT+l0qYJ9trpsz9hQRn5Kxt8vi+S6wBpB0/8cDKIlyx5IsLtqZhpQOyg==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr6988702wmb.28.1639701478950;
 Thu, 16 Dec 2021 16:37:58 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:37:58 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/37] drm: Add drm_module_{pci,
 platform}_driver() helper macros
Date: Fri, 17 Dec 2021 01:37:16 +0100
Message-Id: <20211217003752.3946210-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, the
nomodeset parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, so let's add two
helper macros that can be used by DRM drivers for PCI and platform devices
to have module init functions that checks if the drivers could be loaded.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 include/drm/drm_drv.h | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..4001d73428c5 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -29,6 +29,8 @@
 
 #include <linux/list.h>
 #include <linux/irqreturn.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include <drm/drm_device.h>
 
@@ -604,4 +606,52 @@ int drm_dev_set_unique(struct drm_device *dev, const char *name);
 
 extern bool drm_firmware_drivers_only(void);
 
+/**
+ * drm_pci_register_driver() - register a DRM driver for PCI devices
+ * @drv: PCI driver structure
+ *
+ * Returns zero on success or a negative errno code on failure.
+ */
+static inline int drm_pci_register_driver(struct pci_driver *drv)
+{
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	return pci_register_driver(drv);
+}
+
+/**
+ * drm_module_pci_driver() - helper macro for registering a DRM PCI driver
+ *
+ * Helper macro for DRM PCI drivers which do not do anything special in their
+ * module init/exit and just need the DRM specific module init.
+ */
+#define drm_module_pci_driver(__pci_driver) \
+	module_driver(__pci_driver, drm_pci_register_driver, \
+		      pci_unregister_driver)
+
+/**
+ * drm_platform_driver_register - register a DRM driver for platform devices
+ * @drv: platform driver structure
+ *
+ * Returns zero on success or a negative errno code on failure.
+ */
+static inline int drm_platform_driver_register(struct platform_driver *drv)
+{
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	return platform_driver_register(drv);
+}
+
+/**
+ * drm_module_platform_driver() - helper macro for registering a DRM platform driver
+ *
+ * Helper macro for DRM platform drivers which do not do anything special in their
+ * module init/exit and just need the DRM specific module init.
+ */
+#define drm_module_platform_driver(__platform_driver) \
+	module_driver(__platform_driver, drm_platform_driver_register, \
+		      platform_driver_unregister)
+
 #endif
-- 
2.33.1

