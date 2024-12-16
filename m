Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58939F2B1B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 08:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAED910E3CB;
	Mon, 16 Dec 2024 07:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HdkQy7oC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p69LG1d5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HdkQy7oC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p69LG1d5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F337310E31F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 07:45:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB7611F390;
 Mon, 16 Dec 2024 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734335100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD7mTtz72Sv2grRn+B7JUzJryWswc38BBZ3a0gJC8a0=;
 b=HdkQy7oCLAsElvhTgnALI74T885zzbFKUvnIbAwdmFIt9DsKd7ezE+HZAeNLoNnm3DQnAR
 U4BLDqxSZ9v6j6cN3akQxnW3vqq9Ewwihwk4YPRO78aLacCN9Ri/6EeXU2u6X9RalZaw/5
 n0/JYWE6jy38MU09iJOAg3AIOsnsjOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734335100;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD7mTtz72Sv2grRn+B7JUzJryWswc38BBZ3a0gJC8a0=;
 b=p69LG1d5pkb8fkvgduMfp3XEAhIlzjzrhczhWc/0+uiDLZDFsGDtpc5f1hDVhfMoFsIVQq
 YdylvGyc86S959Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734335100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD7mTtz72Sv2grRn+B7JUzJryWswc38BBZ3a0gJC8a0=;
 b=HdkQy7oCLAsElvhTgnALI74T885zzbFKUvnIbAwdmFIt9DsKd7ezE+HZAeNLoNnm3DQnAR
 U4BLDqxSZ9v6j6cN3akQxnW3vqq9Ewwihwk4YPRO78aLacCN9Ri/6EeXU2u6X9RalZaw/5
 n0/JYWE6jy38MU09iJOAg3AIOsnsjOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734335100;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD7mTtz72Sv2grRn+B7JUzJryWswc38BBZ3a0gJC8a0=;
 b=p69LG1d5pkb8fkvgduMfp3XEAhIlzjzrhczhWc/0+uiDLZDFsGDtpc5f1hDVhfMoFsIVQq
 YdylvGyc86S959Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F83713A62;
 Mon, 16 Dec 2024 07:45:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iDsEGnzaX2egZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 07:45:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, arnd@arndb.de, deller@gmx.de,
 jani.nikula@linux.intel.com, christophe.leroy@csgroup.eu, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Date: Mon, 16 Dec 2024 08:42:47 +0100
Message-ID: <20241216074450.8590-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216074450.8590-1-tzimmermann@suse.de>
References: <20241216074450.8590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,linux.intel.com,csgroup.eu,ffwll.ch,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
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

Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
only controls backlight support within fbdev core code and data
structures.

Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
select it explicitly. Fixes warnings about recursive dependencies,
such as

error: recursive dependency detected!
	symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
	symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
	symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
	symbol FB_DEVICE depends on FB_CORE
	symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
	symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
	symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE

BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
it is the correct approach in any case. For most drivers, backlight
support is also configurable separately.

v3:
- Select BACKLIGHT_CLASS_DEVICE in PowerMac defconfigs (Christophe)
- Fix PMAC_BACKLIGHT module dependency corner cases (Christophe)
v2:
- s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
- Fix fbdev driver-dependency corner case (Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/powerpc/configs/pmac32_defconfig |  1 +
 arch/powerpc/configs/ppc6xx_defconfig |  1 +
 drivers/auxdisplay/Kconfig            |  2 +-
 drivers/macintosh/Kconfig             |  1 +
 drivers/staging/fbtft/Kconfig         |  1 +
 drivers/video/fbdev/Kconfig           | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig      |  3 +--
 7 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 57ded82c2840..e8b3f67bf3f5 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -208,6 +208,7 @@ CONFIG_FB_ATY=y
 CONFIG_FB_ATY_CT=y
 CONFIG_FB_ATY_GX=y
 CONFIG_FB_3DFX=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 4d77e17541e9..ca0c90e95837 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -716,6 +716,7 @@ CONFIG_FB_TRIDENT=m
 CONFIG_FB_SM501=m
 CONFIG_FB_IBM_GXT4500=y
 CONFIG_LCD_PLATFORM=m
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 21545ffba065..8934e6ad5772 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -489,7 +489,7 @@ config IMG_ASCII_LCD
 
 config HT16K33
 	tristate "Holtek Ht16K33 LED controller with keyscan"
-	depends on FB && I2C && INPUT
+	depends on FB && I2C && INPUT && BACKLIGHT_CLASS_DEVICE
 	select FB_SYSMEM_HELPERS
 	select INPUT_MATRIXKMAP
 	select FB_BACKLIGHT
diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index fb38f684444f..d00e713c1092 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -120,6 +120,7 @@ config PMAC_MEDIABAY
 config PMAC_BACKLIGHT
 	bool "Backlight control for LCD screens"
 	depends on PPC_PMAC && ADB_PMU && FB = y && (BROKEN || !PPC64)
+	depends on BACKLIGHT_CLASS_DEVICE=y
 	select FB_BACKLIGHT
 	help
 	  Say Y here to enable Macintosh specific extensions of the generic
diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 77ab44362f16..dcf6a70455cc 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -3,6 +3,7 @@ menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
 	depends on FB_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index de035071fedb..55c6686f091e 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -649,6 +649,7 @@ config FB_S1D13XXX
 config FB_ATMEL
 	tristate "AT91 LCD Controller support"
 	depends on FB && OF && HAVE_CLK && HAS_IOMEM
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on HAVE_FB_ATMEL || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_IOMEM_HELPERS
@@ -660,7 +661,6 @@ config FB_ATMEL
 config FB_NVIDIA
 	tristate "nVidia Framebuffer Support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
 config FB_NVIDIA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_NVIDIA
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -707,7 +709,6 @@ config FB_NVIDIA_BACKLIGHT
 config FB_RIVA
 	tristate "nVidia Riva support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -747,6 +748,8 @@ config FB_RIVA_DEBUG
 config FB_RIVA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RIVA
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RIVA
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -934,7 +937,6 @@ config FB_MATROX_MAVEN
 config FB_RADEON
 	tristate "ATI Radeon display support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_RADEON_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -960,6 +962,8 @@ config FB_RADEON_I2C
 config FB_RADEON_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RADEON
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RADEON
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -975,7 +979,6 @@ config FB_RADEON_DEBUG
 config FB_ATY128
 	tristate "ATI Rage128 display support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_ATY128_BACKLIGHT
 	select FB_IOMEM_HELPERS
 	select FB_MACMODES if PPC_PMAC
 	help
@@ -989,6 +992,8 @@ config FB_ATY128
 config FB_ATY128_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_ATY128
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY128
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -999,7 +1004,6 @@ config FB_ATY
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BACKLIGHT if FB_ATY_BACKLIGHT
 	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC
 	select FB_ATY_CT if SPARC64 && PCI
@@ -1040,6 +1044,8 @@ config FB_ATY_GX
 config FB_ATY_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_ATY
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1528,6 +1534,7 @@ config FB_SH_MOBILE_LCDC
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on SUPERH || COMPILE_TEST
 	depends on FB_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	select FB_DEFERRED_IO
 	select FB_DMAMEM_HELPERS
@@ -1793,6 +1800,7 @@ config FB_SSD1307
 	tristate "Solomon SSD1307 framebuffer support"
 	depends on FB && I2C
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
 	help
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 0ab8848ba2f1..d554d8c543d4 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -183,9 +183,8 @@ config FB_SYSMEM_HELPERS_DEFERRED
 	select FB_SYSMEM_HELPERS
 
 config FB_BACKLIGHT
-	tristate
+	bool
 	depends on FB
-	select BACKLIGHT_CLASS_DEVICE
 
 config FB_MODE_HELPERS
 	bool "Enable Video Mode Handling Helpers"
-- 
2.47.1

