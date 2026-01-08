Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788DD05BB5
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5114910E7B1;
	Thu,  8 Jan 2026 19:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AZolaFoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C5910E7B1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:06:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 202AB60136;
 Thu,  8 Jan 2026 19:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B0AC116D0;
 Thu,  8 Jan 2026 19:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767899174;
 bh=RPMonMH2s9bh+J9vQq/TOhDfStoxkPr8FIo46AL/EEg=;
 h=From:Subject:Date:To:Cc:From;
 b=AZolaFoOkk3pfNxSV468LelnfbaNrPyocJMJx1WQj2JyAW4aBr96fs31JYClARTIA
 JbStswFEbTBFnkA8bX5nDByP530ed4KdtGsg0xPV0lOalXX+znJlltEXVUZqBdbAVE
 YgT0DWAtfx1eRFCysOEkOs8VsMecTtv7bNwWGWHE8z3OGViES77OuXTpWdPYOkFhfm
 tf9mt9DQ4T6iraUPK3ARei3Sueq6n1PoCBwnL6C8ZE/Xc4WVnLur4ZrzL24K7ap4Jf
 pabhO9XuwAaWKNxAOIRlnQpJy4FXF0q6l2Fec5IDy8+WWd9Kdqo2SxkiC08FQ9j+r7
 p4p1zp7z592cw==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH v3 0/7] video/logo: allow custom boot logo and simplify logic
Date: Thu, 08 Jan 2026 20:04:48 +0100
Message-Id: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAND/X2kC/1WMyw6CMBBFf4V0bc10CuWx8j+MCyxTaERqWm00h
 H+3EF2wPDf3nJkF8pYCa7KZeYo2WDclkIeM6aGdeuK2S8wQsBCIJdev8HR3Prre8VpiZ6RQLaB
 myXh4Mva91c6XxINNX//Z4lGs668jYdeJggPPS6lkmReqJjrdyE80Hp3v2RqK+JcVCBB7GZNcE
 WlQnbmaqtjJy7J8AdXLAFPkAAAA
X-Change-ID: 20251227-custom-logo-932df316a02c
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=RPMonMH2s9bh+J9vQq/TOhDfStoxkPr8FIo46AL/EEg=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJkJDJwdkT3vu+Yt9Fr4bqpp2go9M7ufUy5E+xc8yDS9d
 o5h0hS+joksDGJcDJZiiizLyjm5FToKvcMO/bWEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWATAYuTgGY6ooAhn/25Qc7d51TEbEVs+FeZXh5zdWnJzcUMN1alXecRyt6+omzjAyNfpNFZV9
 ZB0jrf3FQaTSIkr+5zd4oc9mzdtFYx/r6SiYA
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

This series allows the user to replace the default kernel boot logo by
a custom one directly in the kernel configuration. This makes it
easier to customise the boot logo without the need to modify the
sources and allows such customisation to remain persistent after
applying the configuration to another version of the kernel.

Patch #1 and #2 are clean-up and preparation while patch #3 is the
main feature of this series: making the boot logo customisable.

While working on this, I realised that managing the logo file directly
in Kbuild allows us to simplify how we handle the different existing
variants of the Tux logo. This series thus ends with a clean-up which
moves all the logo selection logic to Kbuild except from one special
case (details in the patch description), simplifying the Makefile and
the C code.

Patch #4 and #5 do a tree-wide clean-up on the Kconfig symbols that
are to be removed in patch #7. Patch #6 removes the Macintosh 68k logo
which is conflicting with our simplification plans. Patch #7 finally
simplifies the logic as explained above.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changes in v3:

  - v2 broke the logo selection for m68k resulting in the MAC logo
    replacing the default logo on some machine where it shouldn't.
    v3 resolves the conflict by removing that logo.

  - Typo fix in patch #4 description.

Link to v2: https://lore.kernel.org/r/20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org

Changes in v2:

  - By removing the logo_spe_clut224.o target from the Makefile, v1
    also removed the logo_spe_clut224 object which is still being
    referenced in

      arch/powerpc/platforms/cell/spu_base.c

    Restore the logo_spe_clut224.o target.

Link to v1: https://lore.kernel.org/r/20251230-custom-logo-v1-0-4736374569ee@kernel.org

---
Vincent Mailhol (7):
      video/logo: remove orphan .pgm Makefile rule
      video/logo: add a type parameter to the logo makefile function
      video/logo: allow custom logo
      newport_con: depend on LOGO_LINUX_CLUT224 instead of LOGO_SGI_CLUT224
      sh: defconfig: remove CONFIG_LOGO_SUPERH_*
      video/logo: remove logo_mac_clut224
      video/logo: move logo selection logic to Kconfig

 arch/sh/configs/dreamcast_defconfig      |    2 -
 arch/sh/configs/ecovec24_defconfig       |    2 -
 arch/sh/configs/kfr2r09_defconfig        |    2 -
 arch/sh/configs/migor_defconfig          |    2 -
 arch/sh/configs/rts7751r2d1_defconfig    |    2 -
 arch/sh/configs/rts7751r2dplus_defconfig |    2 -
 arch/sh/configs/se7724_defconfig         |    2 -
 arch/sh/configs/se7780_defconfig         |    2 -
 arch/sh/configs/sh7785lcr_defconfig      |    3 -
 arch/sh/configs/urquell_defconfig        |    3 -
 drivers/video/console/newport_con.c      |    4 +-
 drivers/video/logo/Kconfig               |   82 +-
 drivers/video/logo/Makefile              |   29 +-
 drivers/video/logo/logo.c                |   46 +-
 drivers/video/logo/logo_mac_clut224.ppm  | 1604 ------------------------------
 include/linux/linux_logo.h               |    8 -
 16 files changed, 63 insertions(+), 1732 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20251227-custom-logo-932df316a02c

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

