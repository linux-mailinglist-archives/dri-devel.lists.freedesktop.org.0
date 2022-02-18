Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96B4BB5AF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373F910F0F2;
	Fri, 18 Feb 2022 09:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE5510F0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:33:39 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5C6701F37D;
 Fri, 18 Feb 2022 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645176818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hGTH3kNBiBRWdFvAIl/Tn00ApW2CGol4TAqB/yXCwcw=;
 b=YxgsQyuLqZEqurPTkBAQhKhWuF34XKCmC5/K/Vltvn+ofUOuHgYRr1UbZaKvBQpMdru3TN
 dMKagn9r02rAd4mHlyf44N0Kq5fR74i3WrGqH1FMSprvgufekLoxw/K8jgDZffC0d2n51P
 CREbrNUsevoRYj5Lkd5IdxOUTWvcBO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645176818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hGTH3kNBiBRWdFvAIl/Tn00ApW2CGol4TAqB/yXCwcw=;
 b=ruGiu15hZbT9ixT20f8tSO3cY0t981R/XeUPHM4/hD7MLI15J0nNgcqnk925wuY7ysujRZ
 zxsLl6QdorVKTzDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 06A5EA3B87;
 Fri, 18 Feb 2022 09:33:37 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
Date: Fri, 18 Feb 2022 10:33:34 +0100
Message-Id: <20220218093334.24830-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
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
Cc: David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Michal Suchanek <msuchanek@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-video@atrey.karlin.mff.cuni.cz, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since switch to simpledrm VESA graphic modes are no longer available
with legacy BIOS.

The x86 realmode boot code enables the VESA graphic modes when option
FB_BOOT_VESA_SUPPORT is enabled.

To enable use of VESA modes with simpledrm in legacy BIOS boot mode drop
dependency of BOOT_VESA_SUPPORT on FB, also drop the FB_ prefix, and
select the option when simpledrm is built-in on x86.

Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/x86/boot/video-vesa.c   | 4 ++--
 drivers/gpu/drm/tiny/Kconfig | 1 +
 drivers/video/fbdev/Kconfig  | 9 ++++-----
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
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 712e0004e96e..1bc30c64ed15 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -54,6 +54,7 @@ config DRM_GM12U320
 config DRM_SIMPLEDRM
 	tristate "Simple framebuffer driver"
 	depends on DRM && MMU
+	select BOOT_VESA_SUPPORT if X86 && DRM_SIMPLEDRM = y
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
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

