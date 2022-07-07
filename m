Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42C56A71E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 17:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8713911200E;
	Thu,  7 Jul 2022 15:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AD21127C7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 15:40:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA3891FF60;
 Thu,  7 Jul 2022 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657208400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y30RSTpJRsVYDg4al3S7htzFrpSCpxtaFqiM1kvJZ8Y=;
 b=eMve//6zDfOQ7b6QrguOxjD+3jXMsWTED5Vz2UwVUljRfLTcaCZr5mE0h64+0G8MbYuiaL
 jXh/er30WOgDvWlKcgSt+K0qNw0Tw5BlQ4unFHvRwwGtv+uaXMJiaVjTaqkKQXBncZ3jFJ
 QEb4AIBQ+dqFEQronECfhitvaYtrsbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657208400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y30RSTpJRsVYDg4al3S7htzFrpSCpxtaFqiM1kvJZ8Y=;
 b=Xh266f56nGg4leywjUhgYMu3Mq7qjb32tpOzTS25VR6HafJOIkqTkbS9OMQvDz0DbAj8Xe
 uG/3yd1KElIYY0Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99A3B13A33;
 Thu,  7 Jul 2022 15:40:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ACJGJFD+xmI9UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:40:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH 11/11] fbdev: Remove conflict-handling code
Date: Thu,  7 Jul 2022 17:39:52 +0200
Message-Id: <20220707153952.32264-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707153952.32264-1-tzimmermann@suse.de>
References: <20220707153952.32264-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the call to do_remove_conflicting_framebuffers() from the
framebuffer registration. Aperture helpers take care of removing
conflicting devices. With all ownership information stored in the
aperture datastrcutures, remove remove_conflicting_framebuffers()
entirely.

This change also rectifies DRM generic-framebuffer registration, which
tried to unregister conflicting framebuffers, even though it's entirely
build on top of DRM.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/aperture.c         | 21 -------
 drivers/video/fbdev/core/fbmem.c | 99 --------------------------------
 include/linux/fb.h               |  2 -
 3 files changed, 122 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index abc691284a77..9e6bcc03a1a4 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -2,7 +2,6 @@
 
 #include <linux/aperture.h>
 #include <linux/device.h>
-#include <linux/fb.h> /* for old fbdev helpers */
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
@@ -286,11 +285,6 @@ static void aperture_detach_devices(resource_size_t base, resource_size_t size)
 int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
 					bool primary, const char *name)
 {
-#if IS_REACHABLE(CONFIG_FB)
-	struct apertures_struct *a;
-	int ret;
-#endif
-
 	/*
 	 * If a driver asked to unregister a platform device registered by
 	 * sysfb, then can be assumed that this is a driver for a display
@@ -312,21 +306,6 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 	if (primary)
 		aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
 
-#if IS_REACHABLE(CONFIG_FB)
-	a = alloc_apertures(1);
-	if (!a)
-		return -ENOMEM;
-
-	a->ranges[0].base = base;
-	a->ranges[0].size = size;
-
-	ret = remove_conflicting_framebuffers(a, name, primary);
-	kfree(a);
-
-	if (ret)
-		return ret;
-#endif
-
 	return 0;
 }
 EXPORT_SYMBOL(aperture_remove_conflicting_devices);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index e556ad69f48f..9d3d0ed479d2 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1551,65 +1551,6 @@ static bool fb_do_apertures_overlap(struct apertures_struct *gena,
 
 static void do_unregister_framebuffer(struct fb_info *fb_info);
 
-static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
-					       const char *name, bool primary)
-{
-	int i;
-
-restart_removal:
-	/* check all firmware fbs and kick off if the base addr overlaps */
-	for_each_registered_fb(i) {
-		struct apertures_struct *gen_aper;
-		struct device *device;
-
-		if (!(registered_fb[i]->flags & FBINFO_MISC_FIRMWARE))
-			continue;
-
-		gen_aper = registered_fb[i]->apertures;
-		device = registered_fb[i]->device;
-		if (fb_do_apertures_overlap(gen_aper, a) ||
-			(primary && gen_aper && gen_aper->count &&
-			 gen_aper->ranges[0].base == VGA_FB_PHYS_BASE)) {
-
-			printk(KERN_INFO "fb%d: switching to %s from %s\n",
-			       i, name, registered_fb[i]->fix.id);
-
-			/*
-			 * If we kick-out a firmware driver, we also want to remove
-			 * the underlying platform device, such as simple-framebuffer,
-			 * VESA, EFI, etc. A native driver will then be able to
-			 * allocate the memory range.
-			 *
-			 * If it's not a platform device, at least print a warning. A
-			 * fix would add code to remove the device from the system. For
-			 * framebuffers without any Linux device, print a warning as
-			 * well.
-			 */
-			if (!device) {
-				pr_warn("fb%d: no device set\n", i);
-				do_unregister_framebuffer(registered_fb[i]);
-			} else if (dev_is_platform(device)) {
-				/*
-				 * Drop the lock because if the device is unregistered, its
-				 * driver will call to unregister_framebuffer(), that takes
-				 * this lock.
-				 */
-				mutex_unlock(&registration_lock);
-				platform_device_unregister(to_platform_device(device));
-				mutex_lock(&registration_lock);
-			} else {
-				pr_warn("fb%d: cannot remove device\n", i);
-				do_unregister_framebuffer(registered_fb[i]);
-			}
-			/*
-			 * Restart the removal loop now that the device has been
-			 * unregistered and its associated framebuffer gone.
-			 */
-			goto restart_removal;
-		}
-	}
-}
-
 static int do_register_framebuffer(struct fb_info *fb_info)
 {
 	int i;
@@ -1618,10 +1559,6 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	if (fb_check_foreignness(fb_info))
 		return -ENOSYS;
 
-	do_remove_conflicting_framebuffers(fb_info->apertures,
-					   fb_info->fix.id,
-					   fb_is_primary_device(fb_info));
-
 	if (num_registered_fb == FB_MAX)
 		return -ENXIO;
 
@@ -1766,42 +1703,6 @@ static int fbm_aperture_acquire_for_platform_device(struct fb_info *fb_info)
 	return ret;
 }
 
-/**
- * remove_conflicting_framebuffers - remove firmware-configured framebuffers
- * @a: memory range, users of which are to be removed
- * @name: requesting driver name
- * @primary: also kick vga16fb if present
- *
- * This function removes framebuffer devices (initialized by firmware/bootloader)
- * which use memory range described by @a. If @a is NULL all such devices are
- * removed.
- */
-int remove_conflicting_framebuffers(struct apertures_struct *a,
-				    const char *name, bool primary)
-{
-	bool do_free = false;
-
-	if (!a) {
-		a = alloc_apertures(1);
-		if (!a)
-			return -ENOMEM;
-
-		a->ranges[0].base = 0;
-		a->ranges[0].size = ~0;
-		do_free = true;
-	}
-
-	mutex_lock(&registration_lock);
-	do_remove_conflicting_framebuffers(a, name, primary);
-	mutex_unlock(&registration_lock);
-
-	if (do_free)
-		kfree(a);
-
-	return 0;
-}
-EXPORT_SYMBOL(remove_conflicting_framebuffers);
-
 /**
  *	register_framebuffer - registers a frame buffer device
  *	@fb_info: frame buffer info structure
diff --git a/include/linux/fb.h b/include/linux/fb.h
index b91c77016560..453c3b2b6b8e 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -615,8 +615,6 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
-extern int remove_conflicting_framebuffers(struct apertures_struct *a,
-					   const char *name, bool primary);
 extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
 extern int fb_show_logo(struct fb_info *fb_info, int rotate);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
-- 
2.36.1

