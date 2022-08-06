Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A243758B6F7
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 18:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E3010EEA2;
	Sat,  6 Aug 2022 16:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E32311295A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 16:34:48 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id n207so667408iod.7
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 09:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Gfq1n/wuYgapIwbivtKUtRCvzAKVIdhDjqRnf46x0Zc=;
 b=Vas8N6w1SplzilUVraZNJ7Gn2whSKVUI+4nwDcCg8hlUFVGmzTMTMXtRz1xzVqHnsX
 JTh5rMQSDl8MW1SNjE2Kn+cf8IC/CaDMfV+9VlsH6TTQesN3ruC7OkSOA2vZgU8UZXuR
 9rCgjwW5jwKCQlDwFSAIDGj0n/b53tkc6tOGSqxGknbj7sQHnGH6Eg9XEO6SQqCG0dhf
 xT8gk/pyo696iUt1k+8qsJ/KWXKGgEonmSDRy0+fLH2TH7y030aVu0ZNz+49s1ZMv6WZ
 2GBwwRs2m8Y3L4Z1wSZIUNmNRolfskSk17NvQIcEFvFvtVRHqM0jhDIpC4lA2k6BPT3m
 UBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Gfq1n/wuYgapIwbivtKUtRCvzAKVIdhDjqRnf46x0Zc=;
 b=BEpREaEJgbO8zgrRTtbkshGbom1DH7ovNWAdPEu4XQ4CtODm7gzsu264GvoXfExvnT
 rNSuvgzdd+ZfTGlyxMPlO9mCZ//0ggoDVFDUKHPyvuBkot55HnD5/VVQfOW4qOeykCB6
 1/9M9IoJPNOAMj2xAdC+iP3BiVHhXkrM2zi2/k292c39mQYXM/Ko5PL7t1S5JzMiAy/2
 trkihIVDaqYakCk8PFx9ZnoGhbilWYjOgUYMMh6Jmzfwu0TiuaJU8+7qN7Q2Cp1pbIsO
 1iE6vCQn2Hab9wekjQhFGEvm2THwfQ1FFddjawmw2OlFjdkWh5+1UrO/9A7DF4+XmMJ0
 0cVw==
X-Gm-Message-State: ACgBeo3KdSvzw1bLCZw9hgPBmdVfhsb4hC64mR7PGSg2h7ov0QFLdUgI
 tVbgS5DOSkrZx9P2hMvmDy8=
X-Google-Smtp-Source: AA6agR5VHPa/gp2mHXXeXdVPZoY2As+2KWqxdCYnLrSVe7XS5PAFDuNNeELshvUvAg17WEQIzkBjnQ==
X-Received: by 2002:a05:6638:3f16:b0:33f:52fb:3e28 with SMTP id
 ck22-20020a0566383f1600b0033f52fb3e28mr5128085jab.46.1659803688166; 
 Sat, 06 Aug 2022 09:34:48 -0700 (PDT)
Received: from nergzd-desktop.localdomain (tor-exit-50.for-privacy.net.
 [185.220.101.50]) by smtp.gmail.com with ESMTPSA id
 a20-20020a056e020e1400b002de6fa0d0c0sm2908009ilk.63.2022.08.06.09.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 09:34:47 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] efi: earlycon: Add support for generic framebuffers
 and move to console subsystem
Date: Sat,  6 Aug 2022 19:32:24 +0300
Message-Id: <20220806163255.10404-4-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220806163255.10404-1-markuss.broks@gmail.com>
References: <20220806163255.10404-1-markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add early console support for generic linear framebuffer devices.
This driver supports probing from cmdline early parameters
or from the device-tree using information in simple-framebuffer node.
The EFI functionality should be retained in whole.
The driver was disabled on ARM because of a bug in early_ioremap
implementation on ARM and on IA64 because of lack of early_memremap_prot.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  12 +-
 MAINTAINERS                                   |   5 +
 drivers/firmware/efi/Kconfig                  |   7 +-
 drivers/firmware/efi/Makefile                 |   1 -
 drivers/firmware/efi/earlycon.c               | 246 --------------
 drivers/video/console/Kconfig                 |  11 +
 drivers/video/console/Makefile                |   1 +
 drivers/video/console/earlycon.c              | 305 ++++++++++++++++++
 8 files changed, 332 insertions(+), 256 deletions(-)
 delete mode 100644 drivers/firmware/efi/earlycon.c
 create mode 100644 drivers/video/console/earlycon.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8090130b544b0701237a7b657a29c83c000a60f4..bccb1ac8978eb5cf7e2bb20834b1881b27040666 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1281,12 +1281,9 @@
 			specified address. The serial port must already be
 			setup and configured. Options are not yet supported.
 
-		efifb,[options]
+		efifb
 			Start an early, unaccelerated console on the EFI
-			memory mapped framebuffer (if available). On cache
-			coherent non-x86 systems that use system memory for
-			the framebuffer, pass the 'ram' option so that it is
-			mapped with the correct attributes.
+			memory mapped framebuffer (if available).
 
 		linflex,<addr>
 			Use early console provided by Freescale LINFlexD UART
@@ -1294,6 +1291,11 @@
 			address must be provided, and the serial port must
 			already be setup and configured.
 
+		simplefb,<addr>,<width>x<height>x<bpp>
+			Use early console with simple framebuffer that is
+			pre-initialized by firmware. A valid base address,
+			width, height and pixel size must be provided.
+
 	earlyprintk=	[X86,SH,ARM,M68k,S390]
 			earlyprintk=vga
 			earlyprintk=sclp
diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83d2aa3e60ccc4cfa8ee16df09ef579bf..af8b8e289483b6a264d477145061bd0e0ba34a25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7033,6 +7033,11 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/anttip/media_tree.git
 F:	drivers/media/tuners/e4000*
 
+EARLY CONSOLE FRAMEBUFFER DRIVER
+M:	Markuss Broks <markuss.broks@gmail.com>
+S:	Maintained
+F:	drivers/video/console/earlycon.c
+
 EARTH_PT1 MEDIA DRIVER
 M:	Akihiro Tsukada <tskd08@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 7aa4717cdcac46f91dd202f868c463388eb02735..ea76ccfb9bcd8ba44ddca06052eaa442ed6c30f7 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -259,10 +259,9 @@ config EFI_DISABLE_PCI_DMA
 	  may be used to override this option.
 
 config EFI_EARLYCON
-	def_bool y
-	depends on SERIAL_EARLYCON && !ARM && !IA64
-	select FONT_SUPPORT
-	select ARCH_USE_MEMREMAP_PROT
+	bool "EFI early console support"
+	select FB_EARLYCON
+	default y
 
 config EFI_CUSTOM_SSDT_OVERLAYS
 	bool "Load custom ACPI SSDT overlay from an EFI variable"
diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index c02ff25dd47707090a2ab86ee4f330e467f878f5..64eea61fbb43d76ec2d5416d467dfbb9aa21bda0 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -44,6 +44,5 @@ obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
 riscv-obj-$(CONFIG_EFI)			:= efi-init.o riscv-runtime.o
 obj-$(CONFIG_RISCV)			+= $(riscv-obj-y)
 obj-$(CONFIG_EFI_CAPSULE_LOADER)	+= capsule-loader.o
-obj-$(CONFIG_EFI_EARLYCON)		+= earlycon.o
 obj-$(CONFIG_UEFI_CPER_ARM)		+= cper-arm.o
 obj-$(CONFIG_UEFI_CPER_X86)		+= cper-x86.o
diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
deleted file mode 100644
index a52236e11e5f73ddea5bb1f42ca2ca7c42425dab..0000000000000000000000000000000000000000
--- a/drivers/firmware/efi/earlycon.c
+++ /dev/null
@@ -1,246 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2013 Intel Corporation; author Matt Fleming
- */
-
-#include <linux/console.h>
-#include <linux/efi.h>
-#include <linux/font.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/serial_core.h>
-#include <linux/screen_info.h>
-
-#include <asm/early_ioremap.h>
-
-static const struct console *earlycon_console __initdata;
-static const struct font_desc *font;
-static u32 efi_x, efi_y;
-static u64 fb_base;
-static bool fb_wb;
-static void *efi_fb;
-
-/*
- * EFI earlycon needs to use early_memremap() to map the framebuffer.
- * But early_memremap() is not usable for 'earlycon=efifb keep_bootcon',
- * memremap() should be used instead. memremap() will be available after
- * paging_init() which is earlier than initcall callbacks. Thus adding this
- * early initcall function early_efi_map_fb() to map the whole EFI framebuffer.
- */
-static int __init efi_earlycon_remap_fb(void)
-{
-	/* bail if there is no bootconsole or it has been disabled already */
-	if (!earlycon_console || !(earlycon_console->flags & CON_ENABLED))
-		return 0;
-
-	efi_fb = memremap(fb_base, screen_info.lfb_size,
-			  fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
-
-	return efi_fb ? 0 : -ENOMEM;
-}
-early_initcall(efi_earlycon_remap_fb);
-
-static int __init efi_earlycon_unmap_fb(void)
-{
-	/* unmap the bootconsole fb unless keep_bootcon has left it enabled */
-	if (efi_fb && !(earlycon_console->flags & CON_ENABLED))
-		memunmap(efi_fb);
-	return 0;
-}
-late_initcall(efi_earlycon_unmap_fb);
-
-static __ref void *efi_earlycon_map(unsigned long start, unsigned long len)
-{
-	pgprot_t fb_prot;
-
-	if (efi_fb)
-		return efi_fb + start;
-
-	fb_prot = fb_wb ? PAGE_KERNEL : pgprot_writecombine(PAGE_KERNEL);
-	return early_memremap_prot(fb_base + start, len, pgprot_val(fb_prot));
-}
-
-static __ref void efi_earlycon_unmap(void *addr, unsigned long len)
-{
-	if (efi_fb)
-		return;
-
-	early_memunmap(addr, len);
-}
-
-static void efi_earlycon_clear_scanline(unsigned int y)
-{
-	unsigned long *dst;
-	u16 len;
-
-	len = screen_info.lfb_linelength;
-	dst = efi_earlycon_map(y*len, len);
-	if (!dst)
-		return;
-
-	memset(dst, 0, len);
-	efi_earlycon_unmap(dst, len);
-}
-
-static void efi_earlycon_scroll_up(void)
-{
-	unsigned long *dst, *src;
-	u16 len;
-	u32 i, height;
-
-	len = screen_info.lfb_linelength;
-	height = screen_info.lfb_height;
-
-	for (i = 0; i < height - font->height; i++) {
-		dst = efi_earlycon_map(i*len, len);
-		if (!dst)
-			return;
-
-		src = efi_earlycon_map((i + font->height) * len, len);
-		if (!src) {
-			efi_earlycon_unmap(dst, len);
-			return;
-		}
-
-		memmove(dst, src, len);
-
-		efi_earlycon_unmap(src, len);
-		efi_earlycon_unmap(dst, len);
-	}
-}
-
-static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
-{
-	const u32 color_black = 0x00000000;
-	const u32 color_white = 0x00ffffff;
-	const u8 *src;
-	int m, n, bytes;
-	u8 x;
-
-	bytes = BITS_TO_BYTES(font->width);
-	src = font->data + c * font->height * bytes + h * bytes;
-
-	for (m = 0; m < font->width; m++) {
-		n = m % 8;
-		x = *(src + m / 8);
-		if ((x >> (7 - n)) & 1)
-			*dst = color_white;
-		else
-			*dst = color_black;
-		dst++;
-	}
-}
-
-static void
-efi_earlycon_write(struct console *con, const char *str, unsigned int num)
-{
-	struct screen_info *si;
-	unsigned int len;
-	const char *s;
-	void *dst;
-
-	si = &screen_info;
-	len = si->lfb_linelength;
-
-	while (num) {
-		unsigned int linemax;
-		unsigned int h, count = 0;
-
-		for (s = str; *s && *s != '\n'; s++) {
-			if (count == num)
-				break;
-			count++;
-		}
-
-		linemax = (si->lfb_width - efi_x) / font->width;
-		if (count > linemax)
-			count = linemax;
-
-		for (h = 0; h < font->height; h++) {
-			unsigned int n, x;
-
-			dst = efi_earlycon_map((efi_y + h) * len, len);
-			if (!dst)
-				return;
-
-			s = str;
-			n = count;
-			x = efi_x;
-
-			while (n-- > 0) {
-				efi_earlycon_write_char(dst + x*4, *s, h);
-				x += font->width;
-				s++;
-			}
-
-			efi_earlycon_unmap(dst, len);
-		}
-
-		num -= count;
-		efi_x += count * font->width;
-		str += count;
-
-		if (num > 0 && *s == '\n') {
-			efi_x = 0;
-			efi_y += font->height;
-			str++;
-			num--;
-		}
-
-		if (efi_x + font->width > si->lfb_width) {
-			efi_x = 0;
-			efi_y += font->height;
-		}
-
-		if (efi_y + font->height > si->lfb_height) {
-			u32 i;
-
-			efi_y -= font->height;
-			efi_earlycon_scroll_up();
-
-			for (i = 0; i < font->height; i++)
-				efi_earlycon_clear_scanline(efi_y + i);
-		}
-	}
-}
-
-static int __init efi_earlycon_setup(struct earlycon_device *device,
-				     const char *opt)
-{
-	struct screen_info *si;
-	u16 xres, yres;
-	u32 i;
-
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
-		return -ENODEV;
-
-	fb_base = screen_info.lfb_base;
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		fb_base |= (u64)screen_info.ext_lfb_base << 32;
-
-	fb_wb = opt && !strcmp(opt, "ram");
-
-	si = &screen_info;
-	xres = si->lfb_width;
-	yres = si->lfb_height;
-
-	/*
-	 * efi_earlycon_write_char() implicitly assumes a framebuffer with
-	 * 32 bits per pixel.
-	 */
-	if (si->lfb_depth != 32)
-		return -ENODEV;
-
-	font = get_default_font(xres, yres, -1, -1);
-	if (!font)
-		return -ENODEV;
-
-	efi_y = rounddown(yres, font->height) - font->height;
-	for (i = 0; i < (yres - efi_y) / font->height; i++)
-		efi_earlycon_scroll_up();
-
-	device->con->write = efi_earlycon_write;
-	earlycon_console = device->con;
-	return 0;
-}
-EARLYCON_DECLARE(efifb, efi_earlycon_setup);
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 40c50fa2dd70c33a1549141b15e6cba721352d2d..8052507e058fce37f5a51058e58ae2eb10d9669a 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -69,6 +69,17 @@ config DUMMY_CONSOLE_ROWS
 	  monitor.
 	  Select 25 if you use a 640x480 resolution by default.
 
+config FB_EARLYCON
+	bool "Generic framebuffer early console"
+	depends on SERIAL_EARLYCON && !ARM && !IA64
+	select FONT_SUPPORT
+	select ARCH_USE_MEMREMAP_PROT
+	help
+	  Say Y here if you want early console support for firmware established
+	  linear framebuffer. Unless you are using EFI framebuffer, you need to
+	  specify framebuffer geometry and address in device-tree or in kernel
+	  command line.
+
 config FRAMEBUFFER_CONSOLE
 	bool "Framebuffer Console support"
 	depends on FB && !UML
diff --git a/drivers/video/console/Makefile b/drivers/video/console/Makefile
index db07b784bd2ccdcbffde933926ed5cee2bbbc7d4..7818faee587fc9c40b429617cfa224c0ccbc557c 100644
--- a/drivers/video/console/Makefile
+++ b/drivers/video/console/Makefile
@@ -9,4 +9,5 @@ obj-$(CONFIG_STI_CONSOLE)         += sticon.o sticore.o
 obj-$(CONFIG_VGA_CONSOLE)         += vgacon.o
 obj-$(CONFIG_MDA_CONSOLE)         += mdacon.o
 
+obj-$(CONFIG_FB_EARLYCON)         += earlycon.o
 obj-$(CONFIG_FB_STI)              += sticore.o
diff --git a/drivers/video/console/earlycon.c b/drivers/video/console/earlycon.c
new file mode 100644
index 0000000000000000000000000000000000000000..54436587e3db90034652dcc144669dca91b863d5
--- /dev/null
+++ b/drivers/video/console/earlycon.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2013 Intel Corporation; author Matt Fleming
+ * Copyright (C) 2022 Markuss Broks <markuss.broks@gmail.com>
+ */
+
+#include <asm/early_ioremap.h>
+#include <linux/console.h>
+#include <linux/efi.h>
+#include <linux/font.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/serial_core.h>
+#include <linux/screen_info.h>
+
+struct fb_earlycon {
+	u32 x, y, curr_x, curr_y, depth, stride;
+	size_t size;
+	phys_addr_t phys_base;
+	void __iomem *virt_base;
+};
+
+static const struct console *earlycon_console __initconst;
+static struct fb_earlycon info;
+static const struct font_desc *font;
+
+static int __init simplefb_earlycon_remap_fb(void)
+{
+	unsigned long mapping;
+	/* bail if there is no bootconsole or it has been disabled already */
+	if (!earlycon_console || !(earlycon_console->flags & CON_ENABLED))
+		return 0;
+
+	if (region_intersects(info.phys_base, info.size,
+			      IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE) == REGION_INTERSECTS)		
+		mapping = MEMREMAP_WB;
+	else
+		mapping = MEMREMAP_WC;
+
+	info.virt_base = memremap(info.phys_base, info.size, mapping);
+
+	return info.virt_base ? 0 : -ENOMEM;
+}
+early_initcall(simplefb_earlycon_remap_fb);
+
+static int __init simplefb_earlycon_unmap_fb(void)
+{
+	/* unmap the bootconsole fb unless keep_bootcon has left it enabled */
+	if (info.virt_base && !(earlycon_console->flags & CON_ENABLED))
+		memunmap(info.virt_base);
+	return 0;
+}
+late_initcall(simplefb_earlycon_unmap_fb);
+
+static __ref void *simplefb_earlycon_map(unsigned long start, unsigned long len)
+{
+	pgprot_t fb_prot;
+
+	if (info.virt_base)
+		return info.virt_base + start;
+
+	fb_prot = PAGE_KERNEL;
+	return early_memremap_prot(info.phys_base + start, len, pgprot_val(fb_prot));
+}
+
+static __ref void simplefb_earlycon_unmap(void *addr, unsigned long len)
+{
+	if (info.virt_base)
+		return;
+
+	early_memunmap(addr, len);
+}
+
+static void simplefb_earlycon_clear_scanline(unsigned int y)
+{
+	unsigned long *dst;
+	u16 len;
+
+	len = info.stride;
+	dst = simplefb_earlycon_map(y * len, len);
+	if (!dst)
+		return;
+
+	memset(dst, 0, len);
+	simplefb_earlycon_unmap(dst, len);
+}
+
+static void simplefb_earlycon_scroll_up(void)
+{
+	unsigned long *dst, *src;
+	u16 len;
+	u32 i, height;
+
+	len = info.stride;
+	height = info.y;
+
+	for (i = 0; i < height - font->height; i++) {
+		dst = simplefb_earlycon_map(i * len, len);
+		if (!dst)
+			return;
+
+		src = simplefb_earlycon_map((i + font->height) * len, len);
+		if (!src) {
+			simplefb_earlycon_unmap(dst, len);
+			return;
+		}
+
+		memmove(dst, src, len);
+
+		simplefb_earlycon_unmap(src, len);
+		simplefb_earlycon_unmap(dst, len);
+	}
+}
+
+static void simplefb_earlycon_write_char(u8 *dst, unsigned char c, unsigned int h)
+{
+	const u8 *src;
+	int m, n, bytes;
+	u8 x;
+
+	bytes = BITS_TO_BYTES(font->width);
+	src = font->data + c * font->height * bytes + h * bytes;
+
+	for (m = 0; m < font->width; m++) {
+		n = m % 8;
+		x = *(src + m / 8);
+		if ((x >> (7 - n)) & 1)
+			memset(dst, 0xff, (info.depth / 8));
+		else
+			memset(dst, 0, (info.depth / 8));
+		dst += (info.depth / 8);
+	}
+}
+
+static void
+simplefb_earlycon_write(struct console *con, const char *str, unsigned int num)
+{
+	unsigned int len;
+	const char *s;
+	void *dst;
+
+	len = info.stride;
+
+	while (num) {
+		unsigned int linemax;
+		unsigned int h, count = 0;
+
+		for (s = str; *s && *s != '\n'; s++) {
+			if (count == num)
+				break;
+			count++;
+		}
+
+		linemax = (info.x - info.curr_x) / font->width;
+		if (count > linemax)
+			count = linemax;
+
+		for (h = 0; h < font->height; h++) {
+			unsigned int n, x;
+
+			dst = simplefb_earlycon_map((info.curr_y + h) * len, len);
+			if (!dst)
+				return;
+
+			s = str;
+			n = count;
+			x = info.curr_x;
+
+			while (n-- > 0) {
+				simplefb_earlycon_write_char(dst + (x * 4), *s, h);
+				x += font->width;
+				s++;
+			}
+
+			simplefb_earlycon_unmap(dst, len);
+		}
+
+		num -= count;
+		info.curr_x += count * font->width;
+		str += count;
+
+		if (num > 0 && *s == '\n') {
+			info.curr_x = 0;
+			info.curr_y += font->height;
+			str++;
+			num--;
+		}
+
+		if (info.curr_x + font->width > info.x) {
+			info.curr_x = 0;
+			info.curr_y += font->height;
+		}
+
+		if (info.curr_y + font->height > info.y) {
+			u32 i;
+
+			info.curr_y -= font->height;
+			simplefb_earlycon_scroll_up();
+
+			for (i = 0; i < font->height; i++)
+				simplefb_earlycon_clear_scanline(info.curr_y + i);
+		}
+	}
+}
+
+static int __init simplefb_earlycon_setup_common(struct earlycon_device *device,
+						 const char *opt)
+{
+	int i;
+
+	info.size = info.x * info.y * (info.depth / 8);
+
+	font = get_default_font(info.x, info.y, -1, -1);
+	if (!font)
+		return -ENODEV;
+
+	info.curr_y = rounddown(info.y, font->height) - font->height;
+	for (i = 0; i < (info.y - info.curr_y) / font->height; i++)
+		simplefb_earlycon_scroll_up();
+
+	device->con->write = simplefb_earlycon_write;
+	earlycon_console = device->con;
+	return 0;
+}
+
+static int __init simplefb_earlycon_setup(struct earlycon_device *device,
+					  const char *opt)
+{
+	struct uart_port *port = &device->port;
+	int ret;
+
+	if (!port->mapbase)
+		return -ENODEV;
+
+	info.phys_base = port->mapbase;
+
+	ret = sscanf(device->options, "%ux%ux%u", &info.x, &info.y, &info.depth);
+	if (ret != 3)
+		return -ENODEV;
+
+	info.stride = info.x * (info.depth / 8);
+
+	return simplefb_earlycon_setup_common(device, opt);
+}
+
+EARLYCON_DECLARE(simplefb, simplefb_earlycon_setup);
+
+#ifdef CONFIG_EFI_EARLYCON
+static int __init simplefb_earlycon_setup_efi(struct earlycon_device *device,
+					      const char *opt)
+{
+	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
+		return -ENODEV;
+
+	info.phys_base = screen_info.lfb_base;
+	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		info.phys_base |= (u64)screen_info.ext_lfb_base << 32;
+
+	info.x = screen_info.lfb_width;
+	info.y = screen_info.lfb_height;
+	info.depth = screen_info.lfb_depth;
+	info.stride = screen_info.lfb_linelength;
+
+	return simplefb_earlycon_setup_common(device, opt);
+}
+
+EARLYCON_DECLARE(efifb, simplefb_earlycon_setup_efi);
+#endif
+
+#ifdef CONFIG_OF_EARLY_FLATTREE
+static int __init simplefb_earlycon_setup_of(struct earlycon_device *device,
+					     const char *opt)
+{
+	struct uart_port *port = &device->port;
+	const __be32 *val;
+
+	if (!port->mapbase)
+		return -ENODEV;
+
+	info.phys_base = port->mapbase;
+
+	val = of_get_flat_dt_prop(device->offset, "width", NULL);
+	if (!val)
+		return -ENODEV;
+	info.x = be32_to_cpu(*val);
+
+	val = of_get_flat_dt_prop(device->offset, "height", NULL);
+	if (!val)
+		return -ENODEV;
+	info.y = be32_to_cpu(*val);
+
+	val = of_get_flat_dt_prop(device->offset, "stride", NULL);
+	if (!val)
+		return -ENODEV;
+	info.stride = be32_to_cpu(*val);
+	info.depth = (info.stride / info.x) * 8;
+
+	return simplefb_earlycon_setup_common(device, opt);
+}
+
+OF_EARLYCON_DECLARE(simplefb, "simple-framebuffer", simplefb_earlycon_setup_of);
+#endif
-- 
2.37.0

