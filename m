Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3C97B21A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 17:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C0D10E058;
	Tue, 17 Sep 2024 15:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oyoHUmUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9E210E058
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 15:45:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BE940A41C69;
 Tue, 17 Sep 2024 15:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3638C4CEC5;
 Tue, 17 Sep 2024 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726587945;
 bh=KWtkj0GL9S0bCz/hrLAjMTZkpobKDEnlNQquUiw4hWY=;
 h=Date:From:To:Subject:From;
 b=oyoHUmUG6QRDskcwLX+4a6Eqfo/Upl5AQkkSjeX1VjqxVTLJL0fQHCOPlog1RQxVf
 r0O7kcDy6igsh7DiMv2Cbbdf88Xnv2xaG8wic2albBDExAHsVA20Ao7iSKmvyttN/1
 dGI6kwau+KG7F0tWiO75IUSQ7wIvl8QNGB3i2YUgkiQF+omNFhgjTkSBRUhNdIOO+1
 HwatWXJF/gKnQC+LDylCrl+4sEsL6Ley9DrJuZWRCNrjV5Yq8kWfOTDg2om8ACtKNr
 0syy7bBb0ZAXOoipRCA7yeUSt01LYbpo6hm4mzvlisy1Yn03EDp7lTMUQiPVKDcT+J
 8XZ6uOC36ieMg==
Date: Tue, 17 Sep 2024 17:45:40 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and cleanups for v6.12-rc1
Message-ID: <ZumkJA3zfB8AhDsF@carbonx1>
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

please pull some updates and cleanups for the fbdev drivers for kernel 6.12-rc1.
This patchset includes a crashfix for xen and a possible use-after-free fix in pxafb.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.12-rc1

for you to fetch changes up to de5e89b6654ea0b021a5737e0f55fc6bed625550:

  fbdev: omapfb: Fix typo in comment (2024-09-11 20:53:04 +0200)

----------------------------------------------------------------
fbdev fixes and updates for 6.12-rc1:

- video: Reduce code when CONFIG_HAS_IOPORT=n
- xenfb: Fix crash by assigning fb_info->device
- pxafb: Fix possible use after free in pxafb_task()
- efifb: Introduce and use new devm_register_framebuffer() function
- mmpfb: Utilize devm_clk_get_enabled() helpers
- various typo fixes and code cleanups

----------------------------------------------------------------
Andrew Kreimer (1):
      fbdev: omapfb: Fix typo in comment

Chen Ni (3):
      fbdev: pxa3xx-gcu: Convert comma to semicolon
      fbdev: imsttfb: convert comma to semicolon
      fbdev: hyperv_fb: Convert comma to semicolon

Christophe JAILLET (3):
      fbdev: hpfb: Fix an error handling path in hpfb_dio_probe()
      fbdev: omapfb: panel-sony-acx565akm: Simplify show_cabc_available_modes()
      fbdev: omapfb: Use sysfs_emit_at() to simplify code

Jason Andryuk (1):
      fbdev: xen-fbfront: Assign fb_info->device

Kaixin Wang (1):
      fbdev: pxafb: Fix possible use after free in pxafb_task()

Niklas Schnelle (1):
      video: Handle HAS_IOPORT dependencies

Thomas Weiﬂschuh (4):
      fbdev: Introduce devm_register_framebuffer()
      fbdev: efifb: Register sysfs groups through driver core
      fbdev: efifb: Use devm_register_framebuffer()
      fbdev: efifb: Use driver-private screen_info for sysfs

ying zuxin (1):
      fbdev: mmp: Use devm_clk_get_enabled() helpers

 drivers/video/fbdev/core/fbmem.c                   | 30 +++++++++++
 drivers/video/fbdev/efifb.c                        | 27 +++-------
 drivers/video/fbdev/hpfb.c                         |  1 +
 drivers/video/fbdev/hyperv_fb.c                    |  2 +-
 drivers/video/fbdev/imsttfb.c                      |  4 +-
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c              |  6 +--
 drivers/video/fbdev/omap/omapfb_main.c             | 36 ++++++--------
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 15 +++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi.h        |  2 +-
 drivers/video/fbdev/pxa3xx-gcu.c                   |  4 +-
 drivers/video/fbdev/pxafb.c                        |  1 +
 drivers/video/fbdev/xen-fbfront.c                  |  1 +
 include/linux/fb.h                                 |  1 +
 include/video/vga.h                                | 58 ++++++++++++++++------
 14 files changed, 111 insertions(+), 77 deletions(-)
