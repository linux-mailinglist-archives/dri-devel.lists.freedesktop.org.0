Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63433B18E1F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 13:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C7410E11B;
	Sat,  2 Aug 2025 11:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PnZWtb5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B0F10E11B
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 11:04:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F357AA559EB;
 Sat,  2 Aug 2025 11:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13482C4CEEF;
 Sat,  2 Aug 2025 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754132668;
 bh=RvvqUhC+UfRuk8J9nsZJ+DKXPVlzN7atw9EhZE6QMJw=;
 h=Date:From:To:Subject:From;
 b=PnZWtb5LE5Glzfcx4zWnTCqAenMhae+/2K0T1CyS92hPJQAbZXL2jBBMMvSTn5FM1
 G+emXgVw86A82LWcGr0YoAsZ6ZBUFkWkA2VpaTvEYbA+/Xe0gjaelIlmb7kzhLrA6K
 rwQ334VrvLrKS+y3tY3GqkcfRaYBZQPA0lg9vFVUPuoXYm/IeY4bV56uFEBcsPXgJh
 +WoIvXhy0s3jfgw3EZdLDOHRzmGQhw20/xdxu9mc3zBIHhbFDWRXhlVw7pr7EyxRRy
 iBvTBzCJdN5oEEVeqBqiMLVlWZQgU699hp4du287lXtHmt5K8IDZjuUIN1oB0AruyM
 C+JFV15uDL7yQ==
Date: Sat, 2 Aug 2025 13:04:24 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and updates for v6.17-rc1
Message-ID: <aI3wuBNWPyKhHbnC@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

please pull the fbdev fixes and updates for 6.17-rc1:

One potential buffer overflow fix in the framebuffer registration function,
some fixes for the imxfb, nvidiafb and simplefb drivers, and a bunch of
cleanups for fbcon, kyrofb and svgalib.

Thanks,
Helge

----------------------------------------------------------------
The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.17-rc1

for you to fetch changes up to 81b96e4aef9592493873507eec52eca68f0721ac:

  fbcon: Use 'bool' where appopriate (2025-07-27 19:56:52 +0200)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.17-rc1:

Framework fixes:
- fix potential buffer overflow in do_register_framebuffer() [Yongzhen Zhang]

Driver fixes:
- imxfb: prevent null-ptr-deref [Chenyuan Yang]
- nvidiafb: fix build on 32-bit ARCH=um [Johannes Berg]
- nvidiafb: add depends on HAS_IOPORT [Randy Dunlap]
- simplefb: Use of_reserved_mem_region_to_resource() for "memory-region" [Rob Herring]

Cleanups:
- fbcon: various code cleanups wrt blinking [Ville Syrjälä]
- kyrofb: Convert to devm_*() functions [Giovanni Di Santi]
- svgalib: Coding style cleanups [Darshan R.]
- Fix typo in Kconfig text for FB_DEVICE [Daniel Palmer]

----------------------------------------------------------------
Chenyuan Yang (1):
      fbdev: imxfb: Check fb_add_videomode to prevent null-ptr-deref

Daniel Palmer (1):
      fbdev: Fix typo in Kconfig text for FB_DEVICE

Darshan R. (1):
      fbdev: svgalib: Clean up coding style

Giovanni Di Santi (3):
      fbdev: kyro: Add missing PCI memory region request
      fbdev: kyro: Use devm_ioremap() for mmio registers
      fbdev: kyro: Use devm_ioremap_wc() for screen mem

Johannes Berg (1):
      fbdev: nvidiafb: fix build on 32-bit ARCH=um

Randy Dunlap (1):
      fbdev: nvidiafb: add depends on HAS_IOPORT

Rob Herring (Arm) (1):
      fbdev: simplefb: Use of_reserved_mem_region_to_resource() for "memory-region"

Ville Syrjälä (4):
      fbcon: fbcon_cursor_noblink -> fbcon_cursor_blink
      fbcon: fbcon_is_inactive() -> fbcon_is_active()
      fbcon: Introduce get_{fg,bg}_color()
      fbcon: Use 'bool' where appopriate

Yongzhen Zhang (1):
      fbdev: fix potential buffer overflow in do_register_framebuffer()

 drivers/video/fbdev/Kconfig           |  2 +-
 drivers/video/fbdev/core/Kconfig      |  2 +-
 drivers/video/fbdev/core/fbcon.c      | 77 ++++++++++++++++------------
 drivers/video/fbdev/core/fbmem.c      |  3 ++
 drivers/video/fbdev/core/svgalib.c    | 95 ++++++++++++++++-------------------
 drivers/video/fbdev/imxfb.c           |  9 +++-
 drivers/video/fbdev/kyro/fbdev.c      | 24 ++++-----
 drivers/video/fbdev/nvidia/nv_local.h |  2 +-
 drivers/video/fbdev/simplefb.c        | 17 ++-----
 9 files changed, 116 insertions(+), 115 deletions(-)
