Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93885E2B1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461AB10E7ED;
	Wed, 21 Feb 2024 16:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD33910E7E3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:14:36 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56AE8220C9;
 Wed, 21 Feb 2024 16:14:35 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id ABB70139D1;
 Wed, 21 Feb 2024 16:14:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id qF+xKGoh1mVrYwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Feb 2024 16:14:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de, javierm@redhat.com, deller@gmx.de, suijingfeng@loongson.cn
Cc: linux-arch@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/3] arch: Remove struct fb_info from video helpers
Date: Wed, 21 Feb 2024 17:05:25 +0100
Message-ID: <20240221161431.8245-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221161431.8245-1-tzimmermann@suse.de>
References: <20240221161431.8245-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 56AE8220C9
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

The per-architecture video helpers do not depend on struct fb_info
or anything else from fbdev. Remove it from the interface and replace
fb_is_primary_device() with video_is_primary_device(). The new helper
is similar in functionality, but can operate on non-fbdev devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/parisc/include/asm/fb.h     |  8 +++++---
 arch/parisc/video/fbdev.c        |  9 +++++----
 arch/sparc/include/asm/fb.h      |  7 ++++---
 arch/sparc/video/fbdev.c         | 17 ++++++++---------
 arch/x86/include/asm/fb.h        |  8 +++++---
 arch/x86/video/fbdev.c           | 18 +++++++-----------
 drivers/video/fbdev/core/fbcon.c |  2 +-
 include/asm-generic/fb.h         | 11 ++++++-----
 8 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/arch/parisc/include/asm/fb.h b/arch/parisc/include/asm/fb.h
index 658a8a7dc5312..ed2a195a3e762 100644
--- a/arch/parisc/include/asm/fb.h
+++ b/arch/parisc/include/asm/fb.h
@@ -2,11 +2,13 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-struct fb_info;
+#include <linux/types.h>
+
+struct device;
 
 #if defined(CONFIG_STI_CORE)
-int fb_is_primary_device(struct fb_info *info);
-#define fb_is_primary_device fb_is_primary_device
+bool video_is_primary_device(struct device *dev);
+#define video_is_primary_device video_is_primary_device
 #endif
 
 #include <asm-generic/fb.h>
diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
index e4f8ac99fc9e0..540fa0c919d59 100644
--- a/arch/parisc/video/fbdev.c
+++ b/arch/parisc/video/fbdev.c
@@ -5,12 +5,13 @@
  * Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  */
 
-#include <linux/fb.h>
 #include <linux/module.h>
 
 #include <video/sticore.h>
 
-int fb_is_primary_device(struct fb_info *info)
+#include <asm/fb.h>
+
+bool video_is_primary_device(struct device *dev)
 {
 	struct sti_struct *sti;
 
@@ -21,6 +22,6 @@ int fb_is_primary_device(struct fb_info *info)
 		return true;
 
 	/* return true if it's the default built-in framebuffer driver */
-	return (sti->dev == info->device);
+	return (sti->dev == dev);
 }
-EXPORT_SYMBOL(fb_is_primary_device);
+EXPORT_SYMBOL(video_is_primary_device);
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 24440c0fda490..07f0325d6921c 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -3,10 +3,11 @@
 #define _SPARC_FB_H_
 
 #include <linux/io.h>
+#include <linux/types.h>
 
 #include <asm/page.h>
 
-struct fb_info;
+struct device;
 
 #ifdef CONFIG_SPARC32
 static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
@@ -18,8 +19,8 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 #define pgprot_framebuffer pgprot_framebuffer
 #endif
 
-int fb_is_primary_device(struct fb_info *info);
-#define fb_is_primary_device fb_is_primary_device
+bool video_is_primary_device(struct device *dev);
+#define video_is_primary_device video_is_primary_device
 
 static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
index bff66dd1909a4..e46f0499c2774 100644
--- a/arch/sparc/video/fbdev.c
+++ b/arch/sparc/video/fbdev.c
@@ -1,26 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/console.h>
-#include <linux/fb.h>
+#include <linux/device.h>
 #include <linux/module.h>
 
+#include <asm/fb.h>
 #include <asm/prom.h>
 
-int fb_is_primary_device(struct fb_info *info)
+bool video_is_primary_device(struct device *dev)
 {
-	struct device *dev = info->device;
-	struct device_node *node;
+	struct device_node *node = dev->of_node;
 
 	if (console_set_on_cmdline)
-		return 0;
+		return false;
 
-	node = dev->of_node;
 	if (node && node == of_console_device)
-		return 1;
+		return true;
 
-	return 0;
+	return false;
 }
-EXPORT_SYMBOL(fb_is_primary_device);
+EXPORT_SYMBOL(video_is_primary_device);
 
 MODULE_DESCRIPTION("Sparc fbdev helpers");
 MODULE_LICENSE("GPL");
diff --git a/arch/x86/include/asm/fb.h b/arch/x86/include/asm/fb.h
index c3b9582de7efd..999db33792869 100644
--- a/arch/x86/include/asm/fb.h
+++ b/arch/x86/include/asm/fb.h
@@ -2,17 +2,19 @@
 #ifndef _ASM_X86_FB_H
 #define _ASM_X86_FB_H
 
+#include <linux/types.h>
+
 #include <asm/page.h>
 
-struct fb_info;
+struct device;
 
 pgprot_t pgprot_framebuffer(pgprot_t prot,
 			    unsigned long vm_start, unsigned long vm_end,
 			    unsigned long offset);
 #define pgprot_framebuffer pgprot_framebuffer
 
-int fb_is_primary_device(struct fb_info *info);
-#define fb_is_primary_device fb_is_primary_device
+bool video_is_primary_device(struct device *dev);
+#define video_is_primary_device video_is_primary_device
 
 #include <asm-generic/fb.h>
 
diff --git a/arch/x86/video/fbdev.c b/arch/x86/video/fbdev.c
index 1dd6528cc947c..4d87ce8e257fe 100644
--- a/arch/x86/video/fbdev.c
+++ b/arch/x86/video/fbdev.c
@@ -7,7 +7,6 @@
  *
  */
 
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
@@ -25,20 +24,17 @@ pgprot_t pgprot_framebuffer(pgprot_t prot,
 }
 EXPORT_SYMBOL(pgprot_framebuffer);
 
-int fb_is_primary_device(struct fb_info *info)
+bool video_is_primary_device(struct device *dev)
 {
-	struct device *device = info->device;
-	struct pci_dev *pci_dev;
+	struct pci_dev *pdev;
 
-	if (!device || !dev_is_pci(device))
-		return 0;
+	if (!dev_is_pci(dev))
+		return false;
 
-	pci_dev = to_pci_dev(device);
+	pdev = to_pci_dev(dev);
 
-	if (pci_dev == vga_default_device())
-		return 1;
-	return 0;
+	return (pdev == vga_default_device());
 }
-EXPORT_SYMBOL(fb_is_primary_device);
+EXPORT_SYMBOL(video_is_primary_device);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 1183e7a871f8b..25277852f326d 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2941,7 +2941,7 @@ void fbcon_remap_all(struct fb_info *info)
 static void fbcon_select_primary(struct fb_info *info)
 {
 	if (!map_override && primary_device == -1 &&
-	    fb_is_primary_device(info)) {
+	    video_is_primary_device(info->device)) {
 		int i;
 
 		printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index 6ccabb400aa66..4788c1e1c6bc0 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -10,8 +10,9 @@
 #include <linux/io.h>
 #include <linux/mm_types.h>
 #include <linux/pgtable.h>
+#include <linux/types.h>
 
-struct fb_info;
+struct device;
 
 #ifndef pgprot_framebuffer
 #define pgprot_framebuffer pgprot_framebuffer
@@ -23,11 +24,11 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 }
 #endif
 
-#ifndef fb_is_primary_device
-#define fb_is_primary_device fb_is_primary_device
-static inline int fb_is_primary_device(struct fb_info *info)
+#ifndef video_is_primary_device
+#define video_is_primary_device video_is_primary_device
+static inline bool video_is_primary_device(struct device *dev)
 {
-	return 0;
+	return false;
 }
 #endif
 
-- 
2.43.0

