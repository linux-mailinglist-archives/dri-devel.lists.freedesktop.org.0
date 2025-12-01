Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094A0C9831E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAEA10E429;
	Mon,  1 Dec 2025 16:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CLhzbIrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C812410E429;
 Mon,  1 Dec 2025 16:11:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EC1186016B;
 Mon,  1 Dec 2025 16:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7491C4CEF1;
 Mon,  1 Dec 2025 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764605504;
 bh=hP6L2O0FOWlifqFD5YvpPXkCFTX0ufmIW1euI1UobFE=;
 h=Subject:To:Cc:From:Date:From;
 b=CLhzbIrDgV/5rXVseNlhnHM3u6z8oGrim+xh2g7+i9uAsTmVloDxALHxNYw0ahbxn
 MdTupXhUXdKKGoI/gmJnmm3yd1dpAYERzTINECCkr5+mOMfjpu7Mn7ym/Z95QsXf+3
 FhQ1V5OvgJ7UiLEgzdBvNVXb26eDM/kT5j4BeK3g=
Subject: Patch "drm, fbcon,
 vga_switcheroo: Avoid race condition in fbcon setup" has been added
 to the 6.17-stable tree
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, nouveau@lists.freedesktop.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 01 Dec 2025 17:08:12 +0100
Message-ID: <2025120112-squealing-profound-4cd0@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup

to the 6.17-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-fbcon-vga_switcheroo-avoid-race-condition-in-fbcon-setup.patch
and it can be found in the queue-6.17 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From eb76d0f5553575599561010f24c277cc5b31d003 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 5 Nov 2025 17:14:49 +0100
Subject: drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup

From: Thomas Zimmermann <tzimmermann@suse.de>

commit eb76d0f5553575599561010f24c277cc5b31d003 upstream.

Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
access in fbcon_remap_all(). Without holding the console lock the call
races with switching outputs.

VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
function uses struct fb_info.node, which is set by register_framebuffer().
As the fb-helper code currently sets up VGA switcheroo before registering
the framebuffer, the value of node is -1 and therefore not a legal value.
For example, fbcon uses the value within set_con2fb_map() [1] as an index
into an array.

Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
result in VGA switching that does not switch fbcon correctly.

Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
which already holds the console lock. Fbdev calls fbcon_fb_registered()
from within register_framebuffer(). Serializes the helper with VGA
switcheroo's call to fbcon_remap_all().

Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
as parameter, it really only needs the contained fbcon state. Moving the
call to fbcon initialization is therefore cleaner than before. Only amdgpu,
i915, nouveau and radeon support vga_switcheroo. For all other drivers,
this change does nothing.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
Fixes: 6a9ee8af344e ("vga_switcheroo: initial implementation (v15)")
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v2.6.34+
Link: https://patch.msgid.link/20251105161549.98836-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_fb_helper.c  |   14 --------------
 drivers/video/fbdev/core/fbcon.c |    9 +++++++++
 2 files changed, 9 insertions(+), 14 deletions(-)

--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -31,9 +31,7 @@
 
 #include <linux/console.h>
 #include <linux/export.h>
-#include <linux/pci.h>
 #include <linux/sysrq.h>
-#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -566,11 +564,6 @@ EXPORT_SYMBOL(drm_fb_helper_release_info
  */
 void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
 {
-	struct fb_info *info = fb_helper->info;
-	struct device *dev = info->device;
-
-	if (dev_is_pci(dev))
-		vga_switcheroo_client_fb_set(to_pci_dev(dev), NULL);
 	unregister_framebuffer(fb_helper->info);
 }
 EXPORT_SYMBOL(drm_fb_helper_unregister_info);
@@ -1632,7 +1625,6 @@ static int drm_fb_helper_single_fb_probe
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
-	struct fb_info *info;
 	int ret;
 
 	if (drm_WARN_ON(dev, !dev->driver->fbdev_probe))
@@ -1653,12 +1645,6 @@ static int drm_fb_helper_single_fb_probe
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
 
-	info = fb_helper->info;
-
-	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
-	if (dev_is_pci(info->device))
-		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
-
 	return 0;
 }
 
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -66,6 +66,7 @@
 #include <linux/string.h>
 #include <linux/kd.h>
 #include <linux/panic.h>
+#include <linux/pci.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
@@ -78,6 +79,7 @@
 #include <linux/interrupt.h>
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
+#include <linux/vga_switcheroo.h>
 #include <asm/irq.h>
 
 #include "fbcon.h"
@@ -2906,6 +2908,9 @@ void fbcon_fb_unregistered(struct fb_inf
 
 	console_lock();
 
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
+
 	fbcon_registered_fb[info->node] = NULL;
 	fbcon_num_registered_fb--;
 
@@ -3039,6 +3044,10 @@ static int do_fb_registered(struct fb_in
 		}
 	}
 
+	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
+
 	return ret;
 }
 


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.17/drm-fbcon-vga_switcheroo-avoid-race-condition-in-fbcon-setup.patch
