Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CA98A442
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BA910E4A6;
	Mon, 30 Sep 2024 13:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SSGoZM57";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7OAu1nNP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2Xn3QBT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5dxy05zG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2D10E4B7;
 Mon, 30 Sep 2024 13:09:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4DF521A58;
 Mon, 30 Sep 2024 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMPWRGvfyXD1L9wAG+tjlM6UqEm7t+wNoWAgBBCik1A=;
 b=SSGoZM57kZPQEP/BwtQ4QVCLWKGQu+k59Ui/I8ch8kA3JHLHvaxDjPLM2vtAjqyqGUA7yH
 AwnSuqnLuAQzr0OFNB7i7tofA+s9D+FbQVbr7wumqkgvcUFjqIbJOJ09lN5vruvphE6NCK
 2ThDYZ3xnnYeameLu/BQDG2Y9NZjzTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMPWRGvfyXD1L9wAG+tjlM6UqEm7t+wNoWAgBBCik1A=;
 b=7OAu1nNPsoq7yBDwSrjDuAkafWDtaIIIdXoq/2l/JRkqJ30ZmCtJ2wlyZUGTQ4o6m+3kCf
 7N92nDA9fAYxz0BA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N2Xn3QBT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5dxy05zG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMPWRGvfyXD1L9wAG+tjlM6UqEm7t+wNoWAgBBCik1A=;
 b=N2Xn3QBTOWyjbOeHttzWsa2KWvYZBCuumN53uzBS4t+tPj0uhdWOv21amWvPD2yrog0pJQ
 vygI75qRfeyJwuenkhMMbgowghH77R1zZUYmWYimRHCS6YlUmCLUG79GiuTTECsFdw/2m+
 Ad92IpqHCfeJvHWmp36/M+qBYlyIyqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMPWRGvfyXD1L9wAG+tjlM6UqEm7t+wNoWAgBBCik1A=;
 b=5dxy05zGzS4xM7AnecjRwgMOI9EWzgbwU6VEFFEwH6FTtxLuMmF8RmuPlw1TBffkN3hKpR
 vZ1UvDMx3BoFMbCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54BD413AB0;
 Mon, 30 Sep 2024 13:09:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wMl2Ew6j+mb2dQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Sep 2024 13:09:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 28/28] drm: Remove DRM aperture helpers
Date: Mon, 30 Sep 2024 15:03:26 +0200
Message-ID: <20240930130921.689876-29-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A4DF521A58
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid,lists.freedesktop.org:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

The DRM aperture helpers are wrappers around video helpers from
<linux/aperture.h>. There are no callers of these functions. Remove
them entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/gpu/drm-internals.rst |  12 --
 MAINTAINERS                         |   2 -
 drivers/gpu/drm/Makefile            |   1 -
 drivers/gpu/drm/drm_aperture.c      | 192 ----------------------------
 include/drm/drm_aperture.h          |  38 ------
 5 files changed, 245 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_aperture.c
 delete mode 100644 include/drm/drm_aperture.h

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 11d9a5730fb2..cb9ae282771c 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -75,18 +75,6 @@ Module Initialization
 .. kernel-doc:: include/drm/drm_module.h
    :doc: overview
 
-Managing Ownership of the Framebuffer Aperture
-----------------------------------------------
-
-.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
-   :doc: overview
-
-.. kernel-doc:: include/drm/drm_aperture.h
-   :internal:
-
-.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
-   :export:
-
 Device Instance and Driver Handling
 -----------------------------------
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 5a0b7bfb6315..e71e12085a9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7097,12 +7097,10 @@ M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	drivers/gpu/drm/drm_aperture.c
 F:	drivers/gpu/drm/tiny/ofdrm.c
 F:	drivers/gpu/drm/tiny/simpledrm.c
 F:	drivers/video/aperture.c
 F:	drivers/video/nomodeset.c
-F:	include/drm/drm_aperture.h
 F:	include/linux/aperture.h
 F:	include/video/nomodeset.h
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 3894f43f6d47..31d8bf60a2fd 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -34,7 +34,6 @@ endif
 subdir-ccflags-$(CONFIG_DRM_WERROR) += -Werror
 
 drm-y := \
-	drm_aperture.o \
 	drm_atomic.o \
 	drm_atomic_uapi.o \
 	drm_auth.o \
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
deleted file mode 100644
index 5729f3bb4398..000000000000
--- a/drivers/gpu/drm/drm_aperture.c
+++ /dev/null
@@ -1,192 +0,0 @@
-// SPDX-License-Identifier: MIT
-
-#include <linux/aperture.h>
-#include <linux/platform_device.h>
-
-#include <drm/drm_aperture.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_print.h>
-
-/**
- * DOC: overview
- *
- * A graphics device might be supported by different drivers, but only one
- * driver can be active at any given time. Many systems load a generic
- * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
- * During later boot stages, they replace the generic driver with a dedicated,
- * hardware-specific driver. To take over the device the dedicated driver
- * first has to remove the generic driver. DRM aperture functions manage
- * ownership of DRM framebuffer memory and hand-over between drivers.
- *
- * DRM drivers should call drm_aperture_remove_conflicting_framebuffers()
- * at the top of their probe function. The function removes any generic
- * driver that is currently associated with the given framebuffer memory.
- * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the
- * example given below.
- *
- * .. code-block:: c
- *
- *	static const struct drm_driver example_driver = {
- *		...
- *	};
- *
- *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
- *	{
- *		resource_size_t base, size;
- *		int ret;
- *
- *		base = pci_resource_start(pdev, 0);
- *		size = pci_resource_len(pdev, 0);
- *
- *		return drm_aperture_remove_conflicting_framebuffers(base, size,
- *		                                                    &example_driver);
- *	}
- *
- *	static int probe(struct pci_dev *pdev)
- *	{
- *		int ret;
- *
- *		// Remove any generic drivers...
- *		ret = remove_conflicting_framebuffers(pdev);
- *		if (ret)
- *			return ret;
- *
- *		// ... and initialize the hardware.
- *		...
- *
- *		drm_dev_register();
- *
- *		return 0;
- *	}
- *
- * PCI device drivers should call
- * drm_aperture_remove_conflicting_pci_framebuffers() and let it detect the
- * framebuffer apertures automatically. Device drivers without knowledge of
- * the framebuffer's location shall call drm_aperture_remove_framebuffers(),
- * which removes all drivers for known framebuffer.
- *
- * Drivers that are susceptible to being removed by other drivers, such as
- * generic EFI or VESA drivers, have to register themselves as owners of their
- * given framebuffer memory. Ownership of the framebuffer memory is achieved
- * by calling devm_aperture_acquire_from_firmware(). On success, the driver
- * is the owner of the framebuffer range. The function fails if the
- * framebuffer is already owned by another driver. See below for an example.
- *
- * .. code-block:: c
- *
- *	static int acquire_framebuffers(struct drm_device *dev, struct platform_device *pdev)
- *	{
- *		resource_size_t base, size;
- *
- *		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
- *		if (!mem)
- *			return -EINVAL;
- *		base = mem->start;
- *		size = resource_size(mem);
- *
- *		return devm_acquire_aperture_from_firmware(dev, base, size);
- *	}
- *
- *	static int probe(struct platform_device *pdev)
- *	{
- *		struct drm_device *dev;
- *		int ret;
- *
- *		// ... Initialize the device...
- *		dev = devm_drm_dev_alloc();
- *		...
- *
- *		// ... and acquire ownership of the framebuffer.
- *		ret = acquire_framebuffers(dev, pdev);
- *		if (ret)
- *			return ret;
- *
- *		drm_dev_register(dev, 0);
- *
- *		return 0;
- *	}
- *
- * The generic driver is now subject to forced removal by other drivers. This
- * only works for platform drivers that support hot unplug.
- * When a driver calls drm_aperture_remove_conflicting_framebuffers() et al.
- * for the registered framebuffer range, the aperture helpers call
- * platform_device_unregister() and the generic driver unloads itself. It
- * may not access the device's registers, framebuffer memory, ROM, etc
- * afterwards.
- */
-
-/**
- * devm_aperture_acquire_from_firmware - Acquires ownership of a firmware framebuffer
- *                                       on behalf of a DRM driver.
- * @dev:	the DRM device to own the framebuffer memory
- * @base:	the framebuffer's byte offset in physical memory
- * @size:	the framebuffer size in bytes
- *
- * Installs the given device as the new owner of the framebuffer. The function
- * expects the framebuffer to be provided by a platform device that has been
- * set up by firmware. Firmware can be any generic interface, such as EFI,
- * VESA, VGA, etc. If the native hardware driver takes over ownership of the
- * framebuffer range, the firmware state gets lost. Aperture helpers will then
- * unregister the platform device automatically. Acquired apertures are
- * released automatically if the underlying device goes away.
- *
- * The function fails if the framebuffer range, or parts of it, is currently
- * owned by another driver. To evict current owners, callers should use
- * drm_aperture_remove_conflicting_framebuffers() et al. before calling this
- * function. The function also fails if the given device is not a platform
- * device.
- *
- * Returns:
- * 0 on success, or a negative errno value otherwise.
- */
-int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
-					resource_size_t size)
-{
-	struct platform_device *pdev;
-
-	if (drm_WARN_ON(dev, !dev_is_platform(dev->dev)))
-		return -EINVAL;
-
-	pdev = to_platform_device(dev->dev);
-
-	return devm_aperture_acquire_for_platform_device(pdev, base, size);
-}
-EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
-
-/**
- * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
- * @base: the aperture's base address in physical memory
- * @size: aperture size in bytes
- * @req_driver: requesting DRM driver
- *
- * This function removes graphics device drivers which use the memory range described by
- * @base and @size.
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise
- */
-int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 const struct drm_driver *req_driver)
-{
-	return aperture_remove_conflicting_devices(base, size, req_driver->name);
-}
-EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
-
-/**
- * drm_aperture_remove_conflicting_pci_framebuffers - remove existing framebuffers for PCI devices
- * @pdev: PCI device
- * @req_driver: requesting DRM driver
- *
- * This function removes graphics device drivers using the memory range configured
- * for any of @pdev's memory bars. The function assumes that a PCI device with
- * shadowed ROM drives a primary display and so kicks out vga16fb.
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise
- */
-int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-						     const struct drm_driver *req_driver)
-{
-	return aperture_remove_conflicting_pci_devices(pdev, req_driver->name);
-}
-EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
deleted file mode 100644
index cbe33b49fd5d..000000000000
--- a/include/drm/drm_aperture.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-
-#ifndef _DRM_APERTURE_H_
-#define _DRM_APERTURE_H_
-
-#include <linux/types.h>
-
-struct drm_device;
-struct drm_driver;
-struct pci_dev;
-
-int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
-					resource_size_t size);
-
-int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 const struct drm_driver *req_driver);
-
-int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-						     const struct drm_driver *req_driver);
-
-/**
- * drm_aperture_remove_framebuffers - remove all existing framebuffers
- * @req_driver: requesting DRM driver
- *
- * This function removes all graphics device drivers. Use this function on systems
- * that can have their framebuffer located anywhere in memory.
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise
- */
-static inline int
-drm_aperture_remove_framebuffers(const struct drm_driver *req_driver)
-{
-	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1,
-							    req_driver);
-}
-
-#endif
-- 
2.46.0

