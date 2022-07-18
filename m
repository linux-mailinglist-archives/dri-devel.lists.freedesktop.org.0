Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB4577C76
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 09:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18A3AB7B9;
	Mon, 18 Jul 2022 07:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA314AB7B1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4388620BCD;
 Mon, 18 Jul 2022 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658129005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AyRDAHIYVCxK+pONjaATciqFqbXJ1csHVeHyH1nIUIg=;
 b=RxKgNtVDpREVJPuKpW1IRzcCSmK4gjO8vbipotK9vUmbC7tVmWj5+zMakTBzdTDhb4uwEN
 A6XxSdNeDqdZUridGaHs3Yg1We20U4+khSfz7cAcMXH94d6PBbONMSBnFws5YEPGuxp6ZP
 c4wPSMnbDXTWpeRkJuMRzgY4i931gF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658129005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AyRDAHIYVCxK+pONjaATciqFqbXJ1csHVeHyH1nIUIg=;
 b=jecSKdfBDj4oNjXb17D8ZMQDAqg1xL+t6ggeXz03VdmAdnP4gC12OZtcxJui86CQXrEgIv
 kaAlJyKxG/3GC3Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B5EC13A37;
 Mon, 18 Jul 2022 07:23:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GDjSBW0K1WKjcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 07:23:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH v2 05/11] fbdev: Convert drivers to aperture helpers
Date: Mon, 18 Jul 2022 09:23:16 +0200
Message-Id: <20220718072322.8927-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718072322.8927-1-tzimmermann@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
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

Convert fbdev drivers from fbdev's remove_conflicting_framebuffers() to
the framework-independent aperture_remove_conflicting_devices(). Calling
this function will also remove conflicting DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/staging/sm750fb/sm750.c       | 15 +++++----------
 drivers/video/fbdev/aty/radeon_base.c | 17 ++++-------------
 drivers/video/fbdev/hyperv_fb.c       |  6 ++++--
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dbd1159a2ef0..ce04c38f6afd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/errno.h>
@@ -987,22 +988,16 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
 
 static int lynxfb_kick_out_firmware_fb(struct pci_dev *pdev)
 {
-	struct apertures_struct *ap;
+	resource_size_t base = pci_resource_start(pdev, 0);
+	resource_size_t size = pci_resource_len(pdev, 0);
 	bool primary = false;
 
-	ap = alloc_apertures(1);
-	if (!ap)
-		return -ENOMEM;
-
-	ap->ranges[0].base = pci_resource_start(pdev, 0);
-	ap->ranges[0].size = pci_resource_len(pdev, 0);
 #ifdef CONFIG_X86
 	primary = pdev->resource[PCI_ROM_RESOURCE].flags &
 					IORESOURCE_ROM_SHADOW;
 #endif
-	remove_conflicting_framebuffers(ap, "sm750_fb1", primary);
-	kfree(ap);
-	return 0;
+
+	return aperture_remove_conflicting_devices(base, size, primary, "sm750_fb1");
 }
 
 static int lynxfb_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index b311c07fe66d..e5e362b8c9da 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -54,6 +54,7 @@
 
 #include "radeonfb.h"
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -2239,20 +2240,10 @@ static const struct bin_attribute edid2_attr = {
 
 static int radeon_kick_out_firmware_fb(struct pci_dev *pdev)
 {
-	struct apertures_struct *ap;
+	resource_size_t base = pci_resource_start(pdev, 0);
+	resource_size_t size = pci_resource_len(pdev, 0);
 
-	ap = alloc_apertures(1);
-	if (!ap)
-		return -ENOMEM;
-
-	ap->ranges[0].base = pci_resource_start(pdev, 0);
-	ap->ranges[0].size = pci_resource_len(pdev, 0);
-
-	remove_conflicting_framebuffers(ap, KBUILD_MODNAME, false);
-
-	kfree(ap);
-
-	return 0;
+	return aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME, false);
 }
 
 static int radeonfb_pci_register(struct pci_dev *pdev,
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 886c564787f1..a944a6620527 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -45,6 +45,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/vmalloc.h>
@@ -1074,8 +1075,9 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	info->screen_size = dio_fb_size;
 
 getmem_done:
-	remove_conflicting_framebuffers(info->apertures,
-					KBUILD_MODNAME, false);
+	aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
+					    info->apertures->ranges[0].size,
+					    KBUILD_MODNAME, false);
 
 	if (gen2vm) {
 		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
-- 
2.36.1

