Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6D478E48
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A72811277E;
	Fri, 17 Dec 2021 14:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9557011277D;
 Fri, 17 Dec 2021 14:46:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 14DC221116;
 Fri, 17 Dec 2021 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639752378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHGSW5BITf+RHcCpKES0UwM3Jz1jjS3fGs0RRZwjbGY=;
 b=ApzqbOJI0N/GiP+F/YwcIhNe7miOsgsQku3hS8httNdmJ/nGxYgr+o0x5APU6/dwFq0d2L
 uR1VyqNRu6f8gzXwuBl3LhUSTC28S5gp15sH642akzGSJEt3zLqpK1WAu5bzwchvOowSpV
 UOIu+3gmYY/Us51aHWsx1MPoSuPNia4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639752378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHGSW5BITf+RHcCpKES0UwM3Jz1jjS3fGs0RRZwjbGY=;
 b=hxxTRAlSd6YFHPJ25MalHeaMnrS4nxQQN1mXVpYfkI1FQ/8N7DMeX03lVGZkcwEa3IWx2Y
 TaXUt2MfqxAORWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7F4513E4E;
 Fri, 17 Dec 2021 14:46:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eAPTM7mivGH9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Dec 2021 14:46:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 01/10] drm: Provide PCI module-init macros
Date: Fri, 17 Dec 2021 15:46:06 +0100
Message-Id: <20211217144615.32733-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217144615.32733-1-tzimmermann@suse.de>
References: <20211217144615.32733-1-tzimmermann@suse.de>
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide helper macros to register PCI-based DRM drivers. The new
macros behave like module_pci_driver() with an additional test if
DRM modesetting has been enabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
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
2.34.1

