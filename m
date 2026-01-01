Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CECED1DF
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 16:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3318A10E590;
	Thu,  1 Jan 2026 15:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QbSW8z3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0410E590
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 15:25:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 18DCA43C46;
 Thu,  1 Jan 2026 15:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8A5C4CEF7;
 Thu,  1 Jan 2026 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767281149;
 bh=NkRsGfvIL1/OvrkR6mZatfZNK7t07Oc97Uf1iGkvo2I=;
 h=From:Subject:Date:To:Cc:From;
 b=QbSW8z3lPEubz6E+cuS/nRuQwyJwKYodiekZR4X+hPA15ji05N41SAA0JmL/6ILm/
 UHkoq7oiPYbzjG6zTNBAEpOKWF9jssGCoipdKXqnd4Y53k37y44Tz8C8uOD57ZeNmc
 NDEB0PFqnDrQ2LdBOWp4gs1lx+iiWFy2mzGZvByiIC65o/UL7FdcM+WK6HYILVyFTc
 VeUaK/Xd5Vb6hTYx3CGMzdrAmnIs+Cw96BOSo08HXGwuIFy2OSBv0OyKfI99rFukSX
 dB6oHinQ9n7ynZzEOVXRINhaAA3KN0OhgORJMF6Roag88zfP1Pff2vFe0TRX6c3Urv
 kIkOdlXNPiFmw==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH v2 0/6] video/logo: allow custom boot logo and simplify logic
Date: Thu, 01 Jan 2026 16:25:14 +0100
Message-Id: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqRVmkC/1XMQQ7CIBCF4as0sxYDQwupK+9humjolBIrGFCia
 bi72Lhx+U/mfRskio4SnJoNImWXXPA18NCAWUZvibmpNiDHTiBqZp7pEW5sDTawXuI0S6FGjgb
 q4h5pdq9duwy1F1d/43vHs/hef47kf04WjLNWSyV126me6Hyl6Gk9hmhhKKV8AAQhLDKnAAAA
X-Change-ID: 20251227-custom-logo-932df316a02c
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=NkRsGfvIL1/OvrkR6mZatfZNK7t07Oc97Uf1iGkvo2I=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJlhEx9fcXPXcCtQu9Tl+yNGaWW2QFelZ//JFfHHGB89n
 BS65XtTx0QWBjEuBksxRZZl5ZzcCh2F3mGH/lrCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjpAJgMXpwBM9Y1ORoa9UyYfjjk9535u5aMd+1uZH9v/DOfWyvg2SZDXoYDlgUYvwz+9Lfq7/rF
 xnHqzvW72U+9WjcvG5twMQotjX16+ymvrf54fAA==
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
are to be removed in patch #6 and patch #6 simplify the logic as
explained above.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changes in v2:

  - By removing the logo_spe_clut224.o target from the Makefile, v1
    also removed the logo_spe_clut224 object which is still being
    referenced in

      arch/powerpc/platforms/cell/spu_base.c

    Restore the logo_spe_clut224.o target.

Link to v1: https://lore.kernel.org/r/20251230-custom-logo-v1-0-4736374569ee@kernel.org

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
 drivers/video/logo/Kconfig               | 83 ++++++++++++++++++--------------
 drivers/video/logo/Makefile              | 27 +++++------
 drivers/video/logo/logo.c                | 46 ++----------------
 include/linux/linux_logo.h               |  8 ---
 15 files changed, 63 insertions(+), 127 deletions(-)
---
base-commit: b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
change-id: 20251227-custom-logo-932df316a02c

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

