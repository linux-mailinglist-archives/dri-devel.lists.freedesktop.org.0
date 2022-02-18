Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44894BB745
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5AF10F093;
	Fri, 18 Feb 2022 10:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E1010F093
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:51:46 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DF376219A4;
 Fri, 18 Feb 2022 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645181504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4VLD7m5wPL60NKvEVAhzGCIMJAD3yDjimzKOIw9AfQ=;
 b=D0eJ9PaqOgtHeGTiKBuoEhKfsPuPKQBnQzAafDJq/raOVBdWs7WwshxaJbKgVX+//y89pp
 TjZttL/Kl6Tq37vrP6fGLqePcxICqWSJnfX5dPk0Eb20iwhrAgQGS+XzRYq7WP+3YaeI3S
 g2HkUYDKQE64m2RLXzPI0yWhpyoS/vE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645181504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4VLD7m5wPL60NKvEVAhzGCIMJAD3yDjimzKOIw9AfQ=;
 b=GqODA8jnl4slVGzgXEuZUW5KUXxvUMaPS1Xelv1BTSB9U2qBWEW+CF9e2RFiOJd79MENfB
 bzz+VxtDeeCp3LBA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 7F135A3B83;
 Fri, 18 Feb 2022 10:51:44 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] simplefb: Enable boot time VESA graphic mode selection.
Date: Fri, 18 Feb 2022 11:51:38 +0100
Message-Id: <20220218105138.5384-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <14dd85f1-21b1-2ff7-3491-466c077210e6@suse.de>
References: <14dd85f1-21b1-2ff7-3491-466c077210e6@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Herrmann <dh.herrmann@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Michal Suchanek <msuchanek@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Simon Trimmer <simont@opensource.cirrus.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since switch to simplefb/simpledrm VESA graphic modes are no longer
available with legacy BIOS.

The x86 realmode boot code enables the VESA graphic modes when option
FB_BOOT_VESA_SUPPORT is enabled.

To enable use of VESA modes with simpledrm in legacy BIOS boot mode drop
dependency of BOOT_VESA_SUPPORT on FB, also drop the FB_ prefix, and
select the option when simpledrm is built-in on x86.

Fixes: e3263ab389a7 ("x86: provide platform-devices for boot-framebuffers")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2: Select BOOT_VESA_SUPPORT from simplefb rather than simpledrm. The
simpledrm driver uses the firmware provided video modes only indirectly
through simplefb, and both can be enabled independently.
---
 arch/x86/boot/video-vesa.c  | 4 ++--
 drivers/firmware/Kconfig    | 1 +
 drivers/video/fbdev/Kconfig | 9 ++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/boot/video-vesa.c b/arch/x86/boot/video-vesa.c
index 7e185977a984..c2c6d35e3a43 100644
--- a/arch/x86/boot/video-vesa.c
+++ b/arch/x86/boot/video-vesa.c
@@ -83,7 +83,7 @@ static int vesa_probe(void)
 			   (vminfo.memory_layout == 4 ||
 			    vminfo.memory_layout == 6) &&
 			   vminfo.memory_planes == 1) {
-#ifdef CONFIG_FB_BOOT_VESA_SUPPORT
+#ifdef CONFIG_BOOT_VESA_SUPPORT
 			/* Graphics mode, color, linear frame buffer
 			   supported.  Only register the mode if
 			   if framebuffer is configured, however,
@@ -121,7 +121,7 @@ static int vesa_set_mode(struct mode_info *mode)
 	if ((vminfo.mode_attr & 0x15) == 0x05) {
 		/* It's a supported text mode */
 		is_graphic = 0;
-#ifdef CONFIG_FB_BOOT_VESA_SUPPORT
+#ifdef CONFIG_BOOT_VESA_SUPPORT
 	} else if ((vminfo.mode_attr & 0x99) == 0x99) {
 		/* It's a graphics mode with linear frame buffer */
 		is_graphic = 1;
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 75cb91055c17..8053c75b8645 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -224,6 +224,7 @@ config SYSFB
 config SYSFB_SIMPLEFB
 	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
 	depends on SYSFB
+	select BOOT_VESA_SUPPORT if X86
 	help
 	  Firmwares often provide initial graphics framebuffers so the BIOS,
 	  bootloader or kernel can show basic video-output during boot for
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 6ed5e608dd04..4f3be9b7a520 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -66,9 +66,8 @@ config FB_DDC
 	select I2C_ALGOBIT
 	select I2C
 
-config FB_BOOT_VESA_SUPPORT
+config BOOT_VESA_SUPPORT
 	bool
-	depends on FB
 	help
 	  If true, at least one selected framebuffer driver can take advantage
 	  of VESA video modes set at an early boot stage via the vga= parameter.
@@ -627,7 +626,7 @@ config FB_VESA
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT
+	select BOOT_VESA_SUPPORT
 	help
 	  This is the frame buffer device driver for generic VESA 2.0
 	  compliant graphic cards. The older VESA 1.2 cards are not supported.
@@ -1051,7 +1050,7 @@ config FB_INTEL
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT if FB_INTEL = y
+	select BOOT_VESA_SUPPORT if FB_INTEL = y
 	depends on !DRM_I915
 	help
 	  This driver supports the on-board graphics built in to the Intel
@@ -1378,7 +1377,7 @@ config FB_SIS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT if FB_SIS = y
+	select BOOT_VESA_SUPPORT if FB_SIS = y
 	select FB_SIS_300 if !FB_SIS_315
 	help
 	  This is the frame buffer device driver for the SiS 300, 315, 330
-- 
2.31.1

