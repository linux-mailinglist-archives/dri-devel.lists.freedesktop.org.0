Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB710577C81
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 09:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBFBAB7FC;
	Mon, 18 Jul 2022 07:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61EAB7B3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 163E4344A3;
 Mon, 18 Jul 2022 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658129005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0UJimd9fyq8CYzpqv47+SgrzzQqeRywR1knN7O2qBA=;
 b=Gi3yBVgHIJmRphkhkxYDAYEWvfG6ADvl1sWGcRlZffGxBECgThKwcgl2qSGiPPfio3+QiO
 QkwWMdrQZZue+kFYmuWqfcxpEr6bUM1PHpR6b0B+2vCSJH8/FiGWfK7m+1rybMjPnTa7s+
 gTcFiBvdUPRhGO1BMRHorcki/JYk9M8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658129005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0UJimd9fyq8CYzpqv47+SgrzzQqeRywR1knN7O2qBA=;
 b=UQCmYMNd03JFMCsc3DLLKaNfgDpX+DiXNZMnUzen0V9GW1sxNo2A+KGFoh0B/Hm2C5h7Wv
 abntUdvkbgTdy9Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E23FE13AB6;
 Mon, 18 Jul 2022 07:23:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KD2CNmwK1WKjcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 07:23:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH v2 04/11] fbdev/core: Remove
 remove_conflicting_pci_framebuffers()
Date: Mon, 18 Jul 2022 09:23:15 +0200
Message-Id: <20220718072322.8927-5-tzimmermann@suse.de>
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

Remove remove_conflicting_pci_framebuffers() and implement similar
functionality in aperture_remove_conflicting_pci_device(), which was
the only caller. Removes an otherwise unused interface and streamlines
the aperture helper. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/aperture.c         | 30 ++++++++++++--------
 drivers/video/fbdev/core/fbmem.c | 48 --------------------------------
 include/linux/fb.h               |  2 --
 3 files changed, 18 insertions(+), 62 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 538f2d40acda..f42a0d8bc211 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -321,30 +321,36 @@ EXPORT_SYMBOL(aperture_remove_conflicting_devices);
  */
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
 {
+	bool primary = false;
 	resource_size_t base, size;
 	int bar, ret;
 
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-#if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, name);
-	if (ret)
-		return ret;
+#ifdef CONFIG_X86
+	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
 #endif
-	ret = vga_remove_vgacon(pdev);
-	if (ret)
-		return ret;
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
 			continue;
+
 		base = pci_resource_start(pdev, bar);
 		size = pci_resource_len(pdev, bar);
-		aperture_detach_devices(base, size);
+		ret = aperture_remove_conflicting_devices(base, size, primary, name);
+		if (ret)
+			break;
 	}
 
+	if (ret)
+		return ret;
+
+	/*
+	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+	 * otherwise the vga fbdev driver falls over.
+	 */
+	ret = vga_remove_vgacon(pdev);
+	if (ret)
+		return ret;
+
 	return 0;
 
 }
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index c4a18322dee9..877de85309f3 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1787,54 +1787,6 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 }
 EXPORT_SYMBOL(remove_conflicting_framebuffers);
 
-/**
- * remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
- * @pdev: PCI device
- * @name: requesting driver name
- *
- * This function removes framebuffer devices (eg. initialized by firmware)
- * using memory range configured for any of @pdev's memory bars.
- *
- * The function assumes that PCI device with shadowed ROM drives a primary
- * display and so kicks out vga16fb.
- */
-int remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name)
-{
-	struct apertures_struct *ap;
-	bool primary = false;
-	int err, idx, bar;
-
-	for (idx = 0, bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-			continue;
-		idx++;
-	}
-
-	ap = alloc_apertures(idx);
-	if (!ap)
-		return -ENOMEM;
-
-	for (idx = 0, bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-			continue;
-		ap->ranges[idx].base = pci_resource_start(pdev, bar);
-		ap->ranges[idx].size = pci_resource_len(pdev, bar);
-		pci_dbg(pdev, "%s: bar %d: 0x%lx -> 0x%lx\n", __func__, bar,
-			(unsigned long)pci_resource_start(pdev, bar),
-			(unsigned long)pci_resource_end(pdev, bar));
-		idx++;
-	}
-
-#ifdef CONFIG_X86
-	primary = pdev->resource[PCI_ROM_RESOURCE].flags &
-					IORESOURCE_ROM_SHADOW;
-#endif
-	err = remove_conflicting_framebuffers(ap, name, primary);
-	kfree(ap);
-	return err;
-}
-EXPORT_SYMBOL(remove_conflicting_pci_framebuffers);
-
 /**
  *	register_framebuffer - registers a frame buffer device
  *	@fb_info: frame buffer info structure
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 07fcd0e56682..b91c77016560 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -615,8 +615,6 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
-extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-					       const char *name);
 extern int remove_conflicting_framebuffers(struct apertures_struct *a,
 					   const char *name, bool primary);
 extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
-- 
2.36.1

