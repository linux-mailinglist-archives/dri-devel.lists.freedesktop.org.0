Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC1CEAC37
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 23:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A2910E07F;
	Tue, 30 Dec 2025 22:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z5VIGRXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B726310E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 22:20:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6377E43D20;
 Tue, 30 Dec 2025 22:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC59C4CEFB;
 Tue, 30 Dec 2025 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767133227;
 bh=IJaOP76+q4Po8eWxi85XaZX3Oi+lXkVbhIbvvFFgqic=;
 h=From:Subject:Date:To:Cc:From;
 b=Z5VIGRXNufV6oA/WsPljHsr+gmlkjfwZaYG9DJQPUaBu0FGxhoREqrlbm4TBM3KLv
 CfTKhmnDSZnO137JKZ1fg5VJ8T0cPSjZl8ELIEA6pjHnbSS0QFon1il/Rabs5jwl7B
 wZOeNhmp7kK0YQybLCmKnHhfxq91lQGw8RGdv91eTaKBjIKZV/mJz7W8AhjmdMFefe
 4+1LFxdKc+TcBfG2RLywH1n8I0ZSuwAEADXh4HTLernp0QBZcyddFnNFz5o3MClueD
 TNQbkQcg5GZWKMn7MfR+GowTyjhfzYoUgBtykT/ah+gqYTktQsei6sBCVMFtr86/5q
 HPJSIrhj+RXAQ==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH 0/6] video/logo: allow custom boot logo and simplify logic
Date: Tue, 30 Dec 2025 23:19:59 +0100
Message-Id: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9QVGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNz3eTS4pL8XN2c/PR8XUtjo5Q0Y0OzRAOjZCWgjoKi1LTMCrBp0bG
 1tQBMQx5yXQAAAA==
X-Change-ID: 20251227-custom-logo-932df316a02c
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=IJaOP76+q4Po8eWxi85XaZX3Oi+lXkVbhIbvvFFgqic=;
 b=kA0DAAoW0WQ+QNd/fbMByyZiAGlUUBOivXxlTiBGqwSvhQaBGAfioo1F2U2Le5hGm1fquj91G
 oiRBAAWCgA5FiEEpncJCyCIcUtWwv050WQ+QNd/fbMFAmlUUBMbFIAAAAAABAAObWFudTIsMi41
 KzEuMTEsMiwyAAoJENFkPkDXf32zZ5gBANLGrkQXCzUwEdhPKb2E4i2Yx2imi+EUE0zN0wi5Wjf
 0AQCKSHCgRa1vTHRu14LQQHjgSRr1PznOL6AKA1UOC3LIBg==
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
moves all the logo selection logic to Kbuild, simplifying the Makefile
and C code.

Patch #4 and #5 do a tree-wide clean-up on the Kconfig symbols that
are to be removed in patch #6 and patch #6 simplify the logic as
explained above.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Vincent Mailhol (6):
      video/logo: remove orphan .pgm Makefile rule
      video/logo: add a type parameter to the logo makefile function
      video/logo: allow custom logo
      newport_con: depend on LOGO_LINUX_CLUT224 instead of LOGO_SGI_CLUT224
      sh: defconfig: remove CONFIG_LOGO_SUPERH_*
      video/logo: move logo selection logic to Kconfig

 arch/sh/configs/dreamcast_defconfig      |  2 -
 arch/sh/configs/ecovec24_defconfig       |  2 -
 arch/sh/configs/kfr2r09_defconfig        |  2 -
 arch/sh/configs/migor_defconfig          |  2 -
 arch/sh/configs/rts7751r2d1_defconfig    |  2 -
 arch/sh/configs/rts7751r2dplus_defconfig |  2 -
 arch/sh/configs/se7724_defconfig         |  2 -
 arch/sh/configs/se7780_defconfig         |  2 -
 arch/sh/configs/sh7785lcr_defconfig      |  3 --
 arch/sh/configs/urquell_defconfig        |  3 --
 drivers/video/console/newport_con.c      |  4 +-
 drivers/video/logo/Kconfig               | 84 ++++++++++++++++++--------------
 drivers/video/logo/Makefile              | 26 +++-------
 drivers/video/logo/logo.c                | 46 ++---------------
 include/linux/linux_logo.h               |  9 ----
 15 files changed, 61 insertions(+), 130 deletions(-)
---
base-commit: 8640b74557fc8b4c300030f6ccb8cd078f665ec8
change-id: 20251227-custom-logo-932df316a02c

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

