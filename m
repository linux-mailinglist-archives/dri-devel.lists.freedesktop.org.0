Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3161FD05BD6
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823F510E7C0;
	Thu,  8 Jan 2026 19:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZQUrmuZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECC410E7C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:06:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B50C443B0;
 Thu,  8 Jan 2026 19:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7590DC19422;
 Thu,  8 Jan 2026 19:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767899200;
 bh=nzkCwsYo4b20ZD3Dg3Ci0saP2LNe+hBoDY7LvPoafDU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZQUrmuZUAIXASltmI09sCLTXiPuug9i4TFSqpzr7L1WWuFGZ4Bxu6ScceNJ2fQ+5u
 vuh022c2OwinCp6Un4cS0wz+cHY+wKssUi1bZNUYV+5SKjhiFCx0V7eyavnwCKH0QI
 XhHtym/ayZteu/GQrY//YsLdGPhQdMVpk7Rj9mJyO7wDd+EDBddcCfu1dvzO9Woy8h
 9hVISMZANQu57KBjoj+N9ngXWEEwWZiiC8d9XfNkL6yoFTt3l5uo67MQz6VHWj8Xum
 n/U8VVTJzemMtrvVY+85OtY/2H9dU+FcO5y0ztF4eSCIarIXUSse3eRz4UN+14HDff
 eh3NA7SaW8XCQ==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 08 Jan 2026 20:04:55 +0100
Subject: [PATCH v3 7/7] video/logo: move logo selection logic to Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-custom-logo-v3-7-5a7aada7a6d4@kernel.org>
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7766; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=nzkCwsYo4b20ZD3Dg3Ci0saP2LNe+hBoDY7LvPoafDU=;
 b=kA0DAAoW0WQ+QNd/fbMByyZiAGlgACChcyB7YL8uiNRjHPdqejgYmigUouC4A88ON+6plTHQj
 oiRBAAWCgA5FiEEpncJCyCIcUtWwv050WQ+QNd/fbMFAmlgACAbFIAAAAAABAAObWFudTIsMi41
 KzEuMTEsMiwyAAoJENFkPkDXf32zXEoBALMvjYYk235x956rzCqIvRS8OJex8HXyGIBgTFYlJcD
 fAQCHP5mayWiMiEnS5tA3Q9Pdv/dVGC9vrvpN7I5QF1UBAg==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

Now that the path to the logo file can be directly entered in Kbuild,
there is no more need to handle all the logo file selection in the
Makefile and the C files.

The only exception is the logo_spe_clut224 which is only used by the
Cell processor (found for example in the Playstation 3) [1]. This
extra logo uses its own different image which shows up on a separate
line just below the normal logo. Because the extra logo uses a
different image, it can not be factorized under the custom logo logic.

Move all the logo file selection logic to Kbuild (except from the
logo_spe_clut224.ppm), this done, clean-up the C code to only leave
one entry for each logo type (monochrome, 16-colors and 224-colors).

[1] Cell SPE logos
Link: https://lore.kernel.org/all/20070710122702.765654000@pademelon.sonytel.be/

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
**Changelog**

v1 -> v2:

  - By removing the logo_spe_clut224.o target from the Makefile, v1
    also removed the logo_spe_clut224 object which is still being
    referenced in

      arch/powerpc/platforms/cell/spu_base.c

    Restore the logo_spe_clut224.o target.

Link: https://lore.kernel.org/all/20251230-custom-logo-v1-6-4736374569ee@kernel.org/
---
 drivers/video/logo/Kconfig  | 43 +++++++------------------------------------
 drivers/video/logo/Makefile | 13 -------------
 drivers/video/logo/logo.c   | 41 ++++-------------------------------------
 include/linux/linux_logo.h  |  7 -------
 4 files changed, 11 insertions(+), 93 deletions(-)

diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
index 413ddb4be15e..34ee207e5e77 100644
--- a/drivers/video/logo/Kconfig
+++ b/drivers/video/logo/Kconfig
@@ -25,6 +25,7 @@ config LOGO_LINUX_MONO
 config LOGO_LINUX_MONO_FILE
 	string "Monochrome logo .pbm file"
 	depends on LOGO_LINUX_MONO
+	default "drivers/video/logo/logo_superh_mono.pbm" if SUPERH
 	default "drivers/video/logo/logo_linux_mono.pbm"
 	help
 	  Takes a path to a monochromatic logo in the portable pixmap file
@@ -42,6 +43,7 @@ config LOGO_LINUX_VGA16
 config LOGO_LINUX_VGA16_FILE
 	string "16-color logo .ppm file"
 	depends on LOGO_LINUX_VGA16
+	default "drivers/video/logo/logo_superh_vga16.ppm" if SUPERH
 	default "drivers/video/logo/logo_linux_vga16.ppm"
 	help
 	  Takes a path to a logo in the portable pixmap file format (.ppm),
@@ -61,6 +63,11 @@ config LOGO_LINUX_CLUT224
 config LOGO_LINUX_CLUT224_FILE
 	string "224-color logo .ppm file"
 	depends on LOGO_LINUX_CLUT224
+	default "drivers/video/logo/logo_dec_clut224.ppm" if MACH_DECSTATION || ALPHA
+	default "drivers/video/logo/logo_parisc_clut224.ppm" if PARISC
+	default "drivers/video/logo/logo_sgi_clut224.ppm" if SGI_IP22 || SGI_IP27 || SGI_IP32
+	default "drivers/video/logo/logo_sun_clut224.ppm" if SPARC
+	default "drivers/video/logo/logo_superh_clut224.ppm" if SUPERH
 	default "drivers/video/logo/logo_linux_clut224.ppm"
 	help
 	  Takes a path to a 224-color logo in the portable pixmap file
@@ -71,40 +78,4 @@ config LOGO_LINUX_CLUT224_FILE
 
 	    magick source_image -compress none -colors 224 destination.ppm
 
-config LOGO_DEC_CLUT224
-	bool "224-color Digital Equipment Corporation Linux logo"
-	depends on MACH_DECSTATION || ALPHA
-	default y
-
-
-config LOGO_PARISC_CLUT224
-	bool "224-color PA-RISC Linux logo"
-	depends on PARISC
-	default y
-
-config LOGO_SGI_CLUT224
-	bool "224-color SGI Linux logo"
-	depends on SGI_IP22 || SGI_IP27 || SGI_IP32
-	default y
-
-config LOGO_SUN_CLUT224
-	bool "224-color Sun Linux logo"
-	depends on SPARC
-	default y
-
-config LOGO_SUPERH_MONO
-	bool "Black and white SuperH Linux logo"
-	depends on SUPERH
-	default y
-
-config LOGO_SUPERH_VGA16
-	bool "16-color SuperH Linux logo"
-	depends on SUPERH
-	default y
-
-config LOGO_SUPERH_CLUT224
-	bool "224-color SuperH Linux logo"
-	depends on SUPERH
-	default y
-
 endif # LOGO
diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index e2b7605fa8e3..937b37d3b6c7 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -5,13 +5,6 @@ obj-$(CONFIG_LOGO)			+= logo.o
 obj-$(CONFIG_LOGO_LINUX_MONO)		+= logo_linux_mono.o
 obj-$(CONFIG_LOGO_LINUX_VGA16)		+= logo_linux_vga16.o
 obj-$(CONFIG_LOGO_LINUX_CLUT224)	+= logo_linux_clut224.o
-obj-$(CONFIG_LOGO_DEC_CLUT224)		+= logo_dec_clut224.o
-obj-$(CONFIG_LOGO_PARISC_CLUT224)	+= logo_parisc_clut224.o
-obj-$(CONFIG_LOGO_SGI_CLUT224)		+= logo_sgi_clut224.o
-obj-$(CONFIG_LOGO_SUN_CLUT224)		+= logo_sun_clut224.o
-obj-$(CONFIG_LOGO_SUPERH_MONO)		+= logo_superh_mono.o
-obj-$(CONFIG_LOGO_SUPERH_VGA16)		+= logo_superh_vga16.o
-obj-$(CONFIG_LOGO_SUPERH_CLUT224)	+= logo_superh_clut224.o
 
 obj-$(CONFIG_SPU_BASE)			+= logo_spe_clut224.o
 
@@ -32,12 +25,6 @@ $(obj)/logo_linux_vga16.c: $(CONFIG_LOGO_LINUX_VGA16_FILE) $(obj)/pnmtologo FORC
 $(obj)/logo_linux_clut224.c: $(CONFIG_LOGO_LINUX_CLUT224_FILE) $(obj)/pnmtologo FORCE
 	$(call if_changed,logo,clut224)
 
-$(obj)/%.c: $(src)/%.pbm $(obj)/pnmtologo FORCE
-	$(call if_changed,logo,mono)
-
-$(obj)/%_vga16.c: $(src)/%_vga16.ppm $(obj)/pnmtologo FORCE
-	$(call if_changed,logo,vga16)
-
 $(obj)/%_clut224.c: $(src)/%_clut224.ppm $(obj)/pnmtologo FORCE
 	$(call if_changed,logo,clut224)
 
diff --git a/drivers/video/logo/logo.c b/drivers/video/logo/logo.c
index b4eb4f3489a0..91535f8848da 100644
--- a/drivers/video/logo/logo.c
+++ b/drivers/video/logo/logo.c
@@ -48,54 +48,21 @@ const struct linux_logo * __ref fb_find_logo(int depth)
 	if (nologo || logos_freed)
 		return NULL;
 
-	if (depth >= 1) {
 #ifdef CONFIG_LOGO_LINUX_MONO
-		/* Generic Linux logo */
+	if (depth >= 1)
 		logo = &logo_linux_mono;
 #endif
-#ifdef CONFIG_LOGO_SUPERH_MONO
-		/* SuperH Linux logo */
-		logo = &logo_superh_mono;
-#endif
-	}
 	
-	if (depth >= 4) {
 #ifdef CONFIG_LOGO_LINUX_VGA16
-		/* Generic Linux logo */
+	if (depth >= 4)
 		logo = &logo_linux_vga16;
 #endif
-#ifdef CONFIG_LOGO_SUPERH_VGA16
-		/* SuperH Linux logo */
-		logo = &logo_superh_vga16;
-#endif
-	}
 	
-	if (depth >= 8) {
 #ifdef CONFIG_LOGO_LINUX_CLUT224
-		/* Generic Linux logo */
+	if (depth >= 8)
 		logo = &logo_linux_clut224;
 #endif
-#ifdef CONFIG_LOGO_DEC_CLUT224
-		/* DEC Linux logo on MIPS/MIPS64 or ALPHA */
-		logo = &logo_dec_clut224;
-#endif
-#ifdef CONFIG_LOGO_PARISC_CLUT224
-		/* PA-RISC Linux logo */
-		logo = &logo_parisc_clut224;
-#endif
-#ifdef CONFIG_LOGO_SGI_CLUT224
-		/* SGI Linux logo on MIPS/MIPS64 */
-		logo = &logo_sgi_clut224;
-#endif
-#ifdef CONFIG_LOGO_SUN_CLUT224
-		/* Sun Linux logo */
-		logo = &logo_sun_clut224;
-#endif
-#ifdef CONFIG_LOGO_SUPERH_CLUT224
-		/* SuperH Linux logo */
-		logo = &logo_superh_clut224;
-#endif
-	}
+
 	return logo;
 }
 EXPORT_SYMBOL_GPL(fb_find_logo);
diff --git a/include/linux/linux_logo.h b/include/linux/linux_logo.h
index 1f04adc853a9..1e727a2cb4c1 100644
--- a/include/linux/linux_logo.h
+++ b/include/linux/linux_logo.h
@@ -33,13 +33,6 @@ struct linux_logo {
 extern const struct linux_logo logo_linux_mono;
 extern const struct linux_logo logo_linux_vga16;
 extern const struct linux_logo logo_linux_clut224;
-extern const struct linux_logo logo_dec_clut224;
-extern const struct linux_logo logo_parisc_clut224;
-extern const struct linux_logo logo_sgi_clut224;
-extern const struct linux_logo logo_sun_clut224;
-extern const struct linux_logo logo_superh_mono;
-extern const struct linux_logo logo_superh_vga16;
-extern const struct linux_logo logo_superh_clut224;
 extern const struct linux_logo logo_spe_clut224;
 
 extern const struct linux_logo *fb_find_logo(int depth);

-- 
2.52.0

