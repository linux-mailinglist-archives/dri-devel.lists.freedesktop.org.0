Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FAC4BBCFD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277E610EEE7;
	Fri, 18 Feb 2022 16:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1CD10F033
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 16:04:45 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 292B7210E5;
 Fri, 18 Feb 2022 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645200284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIVcCgCTUoNfrlDbIxcNqaydrcBIQu4poVRFpF/GnA4=;
 b=c8xX1dJN/jW1X4017fu3kzeO9XdQ/rqYvo0vSCpT/vYkjvZJqC3TnCoFXsgVCVJ7MKFEEr
 ZdzyOi6dP2lTWAezAA0FYyeYSZrMFCerq1RY5WeZP+2LQb9jPv30GuKAzfFxqA23OgsVq6
 qJodMrzWB1QMeKQP/jv729Eo5+6X9y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645200284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIVcCgCTUoNfrlDbIxcNqaydrcBIQu4poVRFpF/GnA4=;
 b=RbMZVYc2yY2G1mJYHFa1WTyH53eB1wo60u/MFWDFOjQKcziXohigfThCj8T6nSicH/1pia
 gqfB8S3gd0O8cGBQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 603D3A3B8C;
 Fri, 18 Feb 2022 16:04:43 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
Date: Fri, 18 Feb 2022 17:04:36 +0100
Message-Id: <20220218160436.23211-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
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
Cc: David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
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

To enable use of VESA modes with simplefb in legacy BIOS boot mode drop
dependency of BOOT_VESA_SUPPORT on FB, also drop the FB_ prefix, and
select the option when simplefb enabled on x86.

The BOOT_VESA_SUPPORT is not specific to framebuffer but rather to x86
platform, move it from fbdev to x86 Kconfig.

Fixes: e3263ab389a7 ("x86: provide platform-devices for boot-framebuffers")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2: Select BOOT_VESA_SUPPORT from simplefb rather than simpledrm. The
simpledrm driver uses the firmware provided video modes only indirectly
through simplefb, and both can be enabled independently.
v3: Move BOOT_VESA_SUPPORT from fbdev to x86
---
 arch/x86/Kconfig            |  6 ++++++
 arch/x86/boot/video-vesa.c  |  4 ++--
 drivers/firmware/Kconfig    |  1 +
 drivers/video/fbdev/Kconfig | 13 +++----------
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9f5bd41bf660..cceb1aab0486 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -942,6 +942,12 @@ config GART_IOMMU
 
 	  If unsure, say Y.
 
+config BOOT_VESA_SUPPORT
+	bool
+	help
+	  If true, at least one selected framebuffer driver can take advantage
+	  of VESA video modes set at an early boot stage via the vga= parameter.
+
 config MAXSMP
 	bool "Enable Maximum number of SMP Processors and NUMA Nodes"
 	depends on X86_64 && SMP && DEBUG_KERNEL
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
index 75cb91055c17..ad64f3a6f54f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -224,6 +224,7 @@ config SYSFB
 config SYSFB_SIMPLEFB
 	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
 	depends on SYSFB
+	select BOOT_VESA_SUPPORT
 	help
 	  Firmwares often provide initial graphics framebuffers so the BIOS,
 	  bootloader or kernel can show basic video-output during boot for
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 6ed5e608dd04..5bdd303b5268 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -66,13 +66,6 @@ config FB_DDC
 	select I2C_ALGOBIT
 	select I2C
 
-config FB_BOOT_VESA_SUPPORT
-	bool
-	depends on FB
-	help
-	  If true, at least one selected framebuffer driver can take advantage
-	  of VESA video modes set at an early boot stage via the vga= parameter.
-
 config FB_CFB_FILLRECT
 	tristate
 	depends on FB
@@ -627,7 +620,7 @@ config FB_VESA
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT
+	select BOOT_VESA_SUPPORT
 	help
 	  This is the frame buffer device driver for generic VESA 2.0
 	  compliant graphic cards. The older VESA 1.2 cards are not supported.
@@ -1051,7 +1044,7 @@ config FB_INTEL
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT if FB_INTEL = y
+	select BOOT_VESA_SUPPORT if FB_INTEL = y
 	depends on !DRM_I915
 	help
 	  This driver supports the on-board graphics built in to the Intel
@@ -1378,7 +1371,7 @@ config FB_SIS
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

