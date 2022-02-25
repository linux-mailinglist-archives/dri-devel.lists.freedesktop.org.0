Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C574C5014
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D190D10E981;
	Fri, 25 Feb 2022 20:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B73910E98A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 20:51:41 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1A74B1F386;
 Fri, 25 Feb 2022 20:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645822299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwSV9X9cBAL7jKPsCDtGJI+oXYu/I6gPphK0UyD/Has=;
 b=m1uc5nS25JuKFCqOvCHavPwuu+t5jJyl73fSytjg24NcyCXacu9e2XLnmQgvMAaUC6gQZo
 TzyUA8hq/E5thj5TvF24f5GqNYwfVPHUg/K60CIBV2j9V4+RLKZv+5u2fgKzmrqFg3GOA2
 tJG327HYtXOma6xvhudueQzLPp69a9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645822299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwSV9X9cBAL7jKPsCDtGJI+oXYu/I6gPphK0UyD/Has=;
 b=YTrlcG7ONp1HOlLCNbnGGjhp3zvZ6EY56aaFhcO32THvCp/NGL4dFrPGWZaf60TmFUm3J5
 U49E1X2P9AkInlDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id D6B6BA3B8B;
 Fri, 25 Feb 2022 20:51:38 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v4 2/3] sysfb: Enable boot time VESA graphic mode selection
Date: Fri, 25 Feb 2022 21:51:34 +0100
Message-Id: <948c39940a4e99f5b43bdbcbe537faae71a43e1d.1645822213.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
References: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
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
Cc: linux-efi@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Herrmann <dh.herrmann@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Michal Suchanek <msuchanek@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since switch to simplefb/simpledrm VESA graphic mode selection with vga=
kernel parameter is no longer available with legacy BIOS.

The x86 realmode boot code enables the VESA graphic modes when option
FB_BOOT_VESA_SUPPORT is enabled.

This option is selected by vesafb but not simplefb/simpledrm.

To enable use of VESA modes with simplefb in legacy BIOS boot mode drop
dependency of BOOT_VESA_SUPPORT on FB, also drop the FB_ prefix. Select
the option from sysfb rather than the drivers that depend on it.

The BOOT_VESA_SUPPORT is not specific to framebuffer but rather to x86
platform, move it from fbdev to x86 Kconfig.

Fixes: e3263ab389a7 ("x86: provide platform-devices for boot-framebuffers")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Acked-by: Borislav Petkov <bp@suse.de>
---
v2: Select BOOT_VESA_SUPPORT from simplefb rather than simpledrm. The
simpledrm driver uses the firmware provided video modes only indirectly
through simplefb, and both can be enabled independently.
v3: Move BOOT_VESA_SUPPORT from fbdev to x86
v4: Select BOOT_VESA_SUPPORT from sysfb rather than individial sysfb based drivers.
---
 arch/x86/Kconfig            |  6 ++++++
 arch/x86/boot/video-vesa.c  |  4 ++--
 drivers/firmware/Kconfig    |  1 +
 drivers/video/fbdev/Kconfig | 12 ++----------
 4 files changed, 11 insertions(+), 12 deletions(-)

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
index 5265eca74ba1..be42ae6f079e 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -218,6 +218,7 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 
 config SYSFB
 	bool
+	select BOOT_VESA_SUPPORT
 
 config SYSFB_SIMPLEFB
 	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 907c305caf27..0e25434a71e1 100644
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
@@ -627,7 +620,6 @@ config FB_VESA
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT
 	select SYSFB
 	help
 	  This is the frame buffer device driver for generic VESA 2.0
@@ -1053,7 +1045,7 @@ config FB_INTEL
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT if FB_INTEL = y
+	select BOOT_VESA_SUPPORT if FB_INTEL = y
 	depends on !DRM_I915
 	help
 	  This driver supports the on-board graphics built in to the Intel
@@ -1380,7 +1372,7 @@ config FB_SIS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BOOT_VESA_SUPPORT if FB_SIS = y
+	select BOOT_VESA_SUPPORT if FB_SIS = y
 	select FB_SIS_300 if !FB_SIS_315
 	help
 	  This is the frame buffer device driver for the SiS 300, 315, 330
-- 
2.34.1

