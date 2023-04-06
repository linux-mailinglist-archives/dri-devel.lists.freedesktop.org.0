Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EBD6D91B3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE5B10EB29;
	Thu,  6 Apr 2023 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B00B10EB1F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:32:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C2FE420057;
 Thu,  6 Apr 2023 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680769963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9w174vM2/GGaDM8tpa2DWmxQTtrOo+/cbdvvpZtEGtE=;
 b=i4Sf3L0VX5nUubU7M1MUf/QaQKl+EZI5o0Cz38yvCkcTUbyIRDfqEQbkwDkJ6OJ4x+Oj8P
 8XNGf+rrzqvOYLEeu9jHENCmlydizQ95FwcA2+TIql+PjGwUTgJs9S/SpEd/bdloOKSbtc
 8ocOkHUyXDhLHuH7srLwNBON0Q7EC9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680769963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9w174vM2/GGaDM8tpa2DWmxQTtrOo+/cbdvvpZtEGtE=;
 b=yW0clr8lNPsyEzklGxfMGq5cjyC6Ewz3SW6JZshUcBBz/c6w5dj/roSr3kPmCL6wnHbsgv
 GGhRKgqGE9uY9eDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EC10133E5;
 Thu,  6 Apr 2023 08:32:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cN4QHquDLmQZZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 08:32:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel.vetter@ffwll.ch, patrik.r.jakobsson@gmail.com
Subject: [PATCH v4 6/9] video/aperture: Drop primary argument
Date: Thu,  6 Apr 2023 10:32:37 +0200
Message-Id: <20230406083240.14031-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406083240.14031-1-tzimmermann@suse.de>
References: <20230406083240.14031-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, Helge Deller <deller@gmx.de>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

With the preceding patches it's become defunct. Also I'm about to add
a different boolean argument, so it's better to keep the confusion
down to the absolute minimum.

v2: Since the hypervfb patch got droppped (it's only a pci device for
gen1 vm, not for gen2) there is one leftover user in an actual driver
left to touch.

v4:
- fixes to commit message
- fix Daniel's S-o-b address

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: linux-hyperv@vger.kernel.org
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_aperture.c  | 2 +-
 drivers/video/aperture.c        | 7 +++----
 drivers/video/fbdev/hyperv_fb.c | 2 +-
 include/linux/aperture.h        | 9 ++++-----
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 697cffbfd603..5729f3bb4398 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -168,7 +168,7 @@ EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 const struct drm_driver *req_driver)
 {
-	return aperture_remove_conflicting_devices(base, size, false, req_driver->name);
+	return aperture_remove_conflicting_devices(base, size, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 3aad10ab620e..1356f0e88241 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -43,7 +43,7 @@
  *		base = mem->start;
  *		size = resource_size(mem);
  *
- *		ret = aperture_remove_conflicting_devices(base, size, false, "example");
+ *		ret = aperture_remove_conflicting_devices(base, size, "example");
  *		if (ret)
  *			return ret;
  *
@@ -274,7 +274,6 @@ static void aperture_detach_devices(resource_size_t base, resource_size_t size)
  * aperture_remove_conflicting_devices - remove devices in the given range
  * @base: the aperture's base address in physical memory
  * @size: aperture size in bytes
- * @primary: also kick vga16fb if present; only relevant for VGA devices
  * @name: a descriptive name of the requesting driver
  *
  * This function removes devices that own apertures within @base and @size.
@@ -283,7 +282,7 @@ static void aperture_detach_devices(resource_size_t base, resource_size_t size)
  * 0 on success, or a negative errno code otherwise
  */
 int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
-					bool primary, const char *name)
+					const char *name)
 {
 	/*
 	 * If a driver asked to unregister a platform device registered by
@@ -329,7 +328,7 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 
 		base = pci_resource_start(pdev, bar);
 		size = pci_resource_len(pdev, bar);
-		ret = aperture_remove_conflicting_devices(base, size, primary, name);
+		ret = aperture_remove_conflicting_devices(base, size, name);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index ec3f6cf05f8c..54f433e09ab8 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1073,7 +1073,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	info->screen_size = dio_fb_size;
 
 getmem_done:
-	aperture_remove_conflicting_devices(base, size, false, KBUILD_MODNAME);
+	aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME);
 
 	if (gen2vm) {
 		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
diff --git a/include/linux/aperture.h b/include/linux/aperture.h
index 442f15a57cad..7248727753be 100644
--- a/include/linux/aperture.h
+++ b/include/linux/aperture.h
@@ -14,7 +14,7 @@ int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
 					      resource_size_t size);
 
 int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
-					bool primary, const char *name);
+					const char *name);
 
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
 #else
@@ -26,7 +26,7 @@ static inline int devm_aperture_acquire_for_platform_device(struct platform_devi
 }
 
 static inline int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
-						      bool primary, const char *name)
+						      const char *name)
 {
 	return 0;
 }
@@ -39,7 +39,6 @@ static inline int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
 
 /**
  * aperture_remove_all_conflicting_devices - remove all existing framebuffers
- * @primary: also kick vga16fb if present; only relevant for VGA devices
  * @name: a descriptive name of the requesting driver
  *
  * This function removes all graphics device drivers. Use this function on systems
@@ -48,9 +47,9 @@ static inline int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
  * Returns:
  * 0 on success, or a negative errno code otherwise
  */
-static inline int aperture_remove_all_conflicting_devices(bool primary, const char *name)
+static inline int aperture_remove_all_conflicting_devices(const char *name)
 {
-	return aperture_remove_conflicting_devices(0, (resource_size_t)-1, primary, name);
+	return aperture_remove_conflicting_devices(0, (resource_size_t)-1, name);
 }
 
 #endif
-- 
2.40.0

