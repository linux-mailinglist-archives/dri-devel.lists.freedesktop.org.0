Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF86CEAC4F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 23:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F2910E962;
	Tue, 30 Dec 2025 22:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UfhEbz2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD7C10E962
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 22:20:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D558360051;
 Tue, 30 Dec 2025 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BECFC113D0;
 Tue, 30 Dec 2025 22:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767133236;
 bh=BRZrgSxN1NJzubewUZVXvkoGwaDjniOa8PxjKgCPGas=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UfhEbz2QPsUeopf7kJoN85E+yVT31HPyzjYszz8w54Sg/btk0DRAT/BN7DSmv1aw1
 1Ggjjej7LC1Z67sHUpbOCJvZbzzgFiRIbcCvCJXA/FiO5uGfS0XCzoYWpIOttvPIID
 hNx9fGUnfgXaOhC3CIvhio5xiARWDfIxzSA9rQJONyhxU1TrUO5/Opf52EMvfg5dNP
 1ewM/o3pfWFA8pSETVgTkdbOh6XTdGvm13tFKZhTeU1G5CphSMs+tjppuXAX2EzLMb
 z36gBrn7i9dxTKENr6SSSegFzO2IjD1S2iXbFbhHkLaeEjc9QesH/c4oyDVshxv9Di
 w3Z1LR99+3s0w==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Tue, 30 Dec 2025 23:20:02 +0100
Subject: [PATCH 3/6] video/logo: allow custom logo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-custom-logo-v1-3-4736374569ee@kernel.org>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
In-Reply-To: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4512; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=BRZrgSxN1NJzubewUZVXvkoGwaDjniOa8PxjKgCPGas=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJkhATKNumqpPQ0p0gtYZ3vb8nxRXPfW2u42S9ukvmjdo
 H/OjOkdE1kYxLgYLMUUWZaVc3IrdBR6hx36awkzh5UJZIi0SAMDELAw8OUm5pUa6RjpmWob6hka
 6gCZDFycAjDVZgsYGY4vSuF/y577JeLfrucfftjcyW22kUj2Xdkf/VF1wp7L3q8Z/oqUSJ2eMGl
 Zq5/sCk/r6ded8w4+eFUSunJz5jPOv3FLzrABAA==
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

Some people like to replace the default Tux boot logo by an image of
their own. There exist a few tutorials here [1] and there [2]. But
this requires modifying the sources which is a bit cumbersome.

Add a string entry in Kbuild for each of the logo categories
(monochrome, 16-colors, 224-colors). The string entry takes a path to
a .pbm or .ppm image allowing the user to more easily provide a custom
logo without having to modify the sources.

Add an help entry with a short hint on how to convert images to the
portable pixmap file format.

Update the Makefile accordingly. When converted to .c file, the logo
will have one of these fixed file name:

  - logo_linux_mono.c
  - logo_linux_vga16.c
  - logo_linux_clut224.c:

depending on the image type and this regardless of the name of the
.pgm/.ppm source filename. This will allow for further simplifications
in an upcoming change.

[1] ArmadeuS Project wiki -- Linux Boot Logo
Link: https://www.armadeus.org/wiki/index.php?title=Linux_Boot_Logo

[2] Timesys -- How To Use a Custom Boot Logo / Splash Screen
Link: https://linuxlink.timesys.com/docs/wiki/engineering/HOWTO_Use_a_custom_boot_logo

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 drivers/video/logo/Kconfig  | 41 +++++++++++++++++++++++++++++++++++++++++
 drivers/video/logo/Makefile | 11 ++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
index ce6bb753522d..1d1651c067a1 100644
--- a/drivers/video/logo/Kconfig
+++ b/drivers/video/logo/Kconfig
@@ -22,14 +22,55 @@ config LOGO_LINUX_MONO
 	bool "Standard black and white Linux logo"
 	default y
 
+config LOGO_LINUX_MONO_FILE
+	string "Monochrome logo .pbm file"
+	depends on LOGO_LINUX_MONO
+	default "drivers/video/logo/logo_linux_mono.pbm"
+	help
+	  Takes a path to a monochromatic logo in the portable pixmap file
+	  format (.pbm). This defaults to the Tux penguin.
+
+	  For example, the below ImageMagick command can be used to reduce
+	  an image to black and white and convert it into a pbm file:
+
+	    magick source_image -compress none destination.pbm
+
 config LOGO_LINUX_VGA16
 	bool "Standard 16-color Linux logo"
 	default y
 
+config LOGO_LINUX_VGA16_FILE
+	string "16-color logo .ppm file"
+	depends on LOGO_LINUX_VGA16
+	default "drivers/video/logo/logo_linux_vga16.ppm"
+	help
+	  Takes a path to a logo in the portable pixmap file format (.ppm),
+	  using the 16 colors from the drivers/video/logo/clut_vga16.ppm
+	  palette. This defaults to the Tux penguin.
+
+	  For example, the below ImageMagick command can be used to reduce an
+	  image to the VGA 16 colors palette and convert into a ppm file:
+
+	    magick source_image -compress none \
+	      -remap drivers/video/logo/clut_vga16.ppm destination.ppm
+
 config LOGO_LINUX_CLUT224
 	bool "Standard 224-color Linux logo"
 	default y
 
+config LOGO_LINUX_CLUT224_FILE
+	string "224-color logo .ppm file"
+	depends on LOGO_LINUX_CLUT224
+	default "drivers/video/logo/logo_linux_clut224.ppm"
+	help
+	  Takes a path to a 224-color logo in the portable pixmap file
+	  format (.ppm). This defaults to the Tux penguin.
+
+	  For example, the below ImageMagick command can be used to reduce
+	  an image palette to 224 colors and convert it into a ppm file:
+
+	    magick source_image -compress none -colors 224 destination.ppm
+
 config LOGO_DEC_CLUT224
 	bool "224-color Digital Equipment Corporation Linux logo"
 	depends on MACH_DECSTATION || ALPHA
diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index 3f249e9dcf37..ac8e9da3f51a 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -22,7 +22,16 @@ hostprogs := pnmtologo
 
 # Create commands like "pnmtologo -t mono -n logo_mac_mono -o ..."
 quiet_cmd_logo = LOGO    $@
-      cmd_logo = $(obj)/pnmtologo -t $2 -n $* -o $@ $<
+      cmd_logo = $(obj)/pnmtologo -t $2 -n $(basename $(notdir $@)) -o $@ $<
+
+$(obj)/logo_linux_mono.c: $(CONFIG_LOGO_LINUX_MONO_FILE) $(obj)/pnmtologo FORCE
+	$(call if_changed,logo,mono)
+
+$(obj)/logo_linux_vga16.c: $(CONFIG_LOGO_LINUX_VGA16_FILE) $(obj)/pnmtologo FORCE
+	$(call if_changed,logo,vga16)
+
+$(obj)/logo_linux_clut224.c: $(CONFIG_LOGO_LINUX_CLUT224_FILE) $(obj)/pnmtologo FORCE
+	$(call if_changed,logo,clut224)
 
 $(obj)/%.c: $(src)/%.pbm $(obj)/pnmtologo FORCE
 	$(call if_changed,logo,mono)

-- 
2.51.2

