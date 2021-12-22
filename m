Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7247CE37
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB40112702;
	Wed, 22 Dec 2021 08:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4698110F4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQ6XtD20XG1EILVnbhVJNr5Jw2nThRr8sIpMKb8E/Wg=;
 b=iIZpeeGX2rv/RclERVUt5y4vlgPXm3K3XX8PIhbcQXdM9ONvrsI1P15DuXSCD+e0pd2qnr
 39UQNWdQ8zshhfNLSYEsBAyHqriDP/i2TtFIgi1CzeQq31ANOtyxxMgiFQ3TdJN1e9VFrr
 Sh4wQMctc0y1TbF6FDPK1XAZ67NtBMA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-YmNA0HV6MUOhiHtrO8kxpg-1; Wed, 22 Dec 2021 03:28:43 -0500
X-MC-Unique: YmNA0HV6MUOhiHtrO8kxpg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so363356wme.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQ6XtD20XG1EILVnbhVJNr5Jw2nThRr8sIpMKb8E/Wg=;
 b=tJucw5t6EbRu3pGvOhS+xAsc82X/ns0xF6oLdEsOqkrVpON8+Sn/+YFtmNyW0vYmxf
 MsGhsXHbu/BqQU1fRqSCRzFFpVknzHlgMaBD1LOc3uirmWb1Pve7I/bovZWzj6pvxy6r
 SEOv/DiK/EFV4ZYZwsc0de/E+D8DfFmDTwC8syz+PmqcKhZkbNqvmi4oE7VzG1MreOf9
 +st+3V8wdEQk/yCSvgFmKrA/+BDmzc+GBdQaniSznxbL1pVb0T1oiK6iiNTzwOdahtx4
 O4LGTRNjpuPAFcT01WU4NulCsf8VMiZTcNJ61RliiCMUG0RdEg/fcOMSGnplt+eVdxux
 XpaA==
X-Gm-Message-State: AOAM532FmrlHrdlfCfX6DPXtrAG202/LMCa6vN4OLns8Oqi5ieHpn7bH
 4RvXzf1tNXop50m/E5EenBPxJtFhd8Tb5A5sfuCC53CyYeJuUwZN4SPzX8rQJ4He/MhHMq37EFF
 +qNzVuRml2mJH1llnfDj+otRfKcx7
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr101525wmk.33.1640161721849; 
 Wed, 22 Dec 2021 00:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBH22gXld28rnt/TMJZsw2cU9PK2Y6h1QwrH7n0X9igVQwkJGQTXog3ZD10Wn09ZlKplL59Q==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr101513wmk.33.1640161721658; 
 Wed, 22 Dec 2021 00:28:41 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:41 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/10] drm: Provide PCI module-init macros
Date: Wed, 22 Dec 2021 09:28:22 +0100
Message-Id: <20211222082831.196562-2-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Provide helper macros to register PCI-based DRM drivers. The new
macros behave like module_pci_driver() with an additional test if
DRM modesetting has been enabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 Documentation/gpu/drm-internals.rst |  6 ++
 include/drm/drm_module.h            | 95 +++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 include/drm/drm_module.h

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 607f78f0f189..38afed24a75c 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -75,6 +75,12 @@ update it, its value is mostly useless. The DRM core prints it to the
 kernel log at initialization time and passes it to userspace through the
 DRM_IOCTL_VERSION ioctl.
 
+Module Initialization
+---------------------
+
+.. kernel-doc:: include/drm/drm_module.h
+   :doc: overview
+
 Managing Ownership of the Framebuffer Aperture
 ----------------------------------------------
 
diff --git a/include/drm/drm_module.h b/include/drm/drm_module.h
new file mode 100644
index 000000000000..eb3fd7bcbec9
--- /dev/null
+++ b/include/drm/drm_module.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_MODULE_H
+#define DRM_MODULE_H
+
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
+
+/**
+ * DOC: overview
+ *
+ * This library provides helpers registering DRM drivers during module
+ * initialization and shutdown. The provided helpers act like bus-specific
+ * module helpers, such as module_pci_driver(), but respect additional
+ * parameters that control DRM driver registration.
+ *
+ * Below is an example of initializing a DRM driver for a device on the
+ * PCI bus.
+ *
+ * .. code-block:: c
+ *
+ *	struct pci_driver my_pci_drv = {
+ *	};
+ *
+ *	drm_module_pci_driver(my_pci_drv);
+ *
+ * The generated code will test if DRM drivers are enabled and register
+ * the PCI driver my_pci_drv. For more complex module initialization, you
+ * can still use module_init() and module_exit() in your driver.
+ */
+
+/*
+ * PCI drivers
+ */
+
+static inline int __init drm_pci_register_driver(struct pci_driver *pci_drv)
+{
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	return pci_register_driver(pci_drv);
+}
+
+/**
+ * drm_module_pci_driver - Register a DRM driver for PCI-based devices
+ * @__pci_drv: the PCI driver structure
+ *
+ * Registers a DRM driver for devices on the PCI bus. The helper
+ * macro behaves like module_pci_driver() but tests the state of
+ * drm_firmware_drivers_only(). For more complex module initialization,
+ * use module_init() and module_exit() directly.
+ *
+ * Each module may only use this macro once. Calling it replaces
+ * module_init() and module_exit().
+ */
+#define drm_module_pci_driver(__pci_drv) \
+	module_driver(__pci_drv, drm_pci_register_driver, pci_unregister_driver)
+
+static inline int __init
+drm_pci_register_driver_if_modeset(struct pci_driver *pci_drv, int modeset)
+{
+	if (drm_firmware_drivers_only() && modeset == -1)
+		return -ENODEV;
+	if (modeset == 0)
+		return -ENODEV;
+
+	return pci_register_driver(pci_drv);
+}
+
+static inline void __exit
+drm_pci_unregister_driver_if_modeset(struct pci_driver *pci_drv, int modeset)
+{
+	pci_unregister_driver(pci_drv);
+}
+
+/**
+ * drm_module_pci_driver_if_modeset - Register a DRM driver for PCI-based devices
+ * @__pci_drv: the PCI driver structure
+ * @__modeset: an additional parameter that disables the driver
+ *
+ * This macro is deprecated and only provided for existing drivers. For
+ * new drivers, use drm_module_pci_driver().
+ *
+ * Registers a DRM driver for devices on the PCI bus. The helper macro
+ * behaves like drm_module_pci_driver() with an additional driver-specific
+ * flag. If __modeset is 0, the driver has been disabled, if __modeset is
+ * -1 the driver state depends on the global DRM state. For all other
+ * values, the PCI driver has been enabled. The default should be -1.
+ */
+#define drm_module_pci_driver_if_modeset(__pci_drv, __modeset) \
+	module_driver(__pci_drv, drm_pci_register_driver_if_modeset, \
+		      drm_pci_unregister_driver_if_modeset, __modeset)
+
+#endif
-- 
2.33.1

