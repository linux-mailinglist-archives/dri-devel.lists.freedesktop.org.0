Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC6DA73DCE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C810C89DC0;
	Thu, 27 Mar 2025 18:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cj00G1Og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6999310E150
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:12:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 01CF661129;
 Thu, 27 Mar 2025 18:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BE0C4CEDD;
 Thu, 27 Mar 2025 18:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743098622;
 bh=9VZOAXx/d9thBrRCm1kFaimEoDhr6dDMpDpBp/UEu+E=;
 h=Date:From:To:Subject:From;
 b=Cj00G1OgoTLTdXxflb9ciyXt14vo+6lN9My/syU8OBAC0Hq0MUQAKTJ2DnJxk8RGz
 Pa//UMVmqYffc8gkv0lXy28dAlB8tdxJOc322rvc1Z4K35HIqVMUwjLnZBsfCYqnTV
 GHbbcUFKDb7qREOd4ZkV2zyiumHRw2f6/YnQxNLKI/biyVSWwU/GgqVXS9kial3HGq
 F5pV7++9BBDEhW/GYyBsSOk/guVXmwUAzqlWxEBs6DA4gC+5niOOc2cxV+6CK0TXkR
 YP8gWYzkQdEl98OKpoAqOAAHNFs2aHfga6Q2m5kQBRSBW0vt0l9sO6LNlckDIRKstM
 bmRG/1pVVb2tg==
Date: Thu, 27 Mar 2025 19:03:38 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates for v6.15-rc1
Message-ID: <Z-WS-lDPPmxnbG3W@carbonx1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

please pull some updates regarding fbdev for 6.15-rc1:

The fbcon packed pixel drawing routines have been refactored to bring the
implementations for system and I/O memory in sync.  The other patches add some
parameter checks, static attribute groups for sysfs entries and console fixes.

Thanks,
Helge

----------------------------------------------------------------
The following changes since commit f6e0150b2003fb2b9265028a618aa1732b3edc8f:

  Merge tag 'mtd/for-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux (2025-03-26 10:28:36 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.15-rc1

for you to fetch changes up to 86d16cd12efa547ed43d16ba7a782c1251c80ea8:

  fbdev: fsl-diu-fb: add missing device_remove_file() (2025-03-26 22:39:21 +0100)

----------------------------------------------------------------
fbdev fixes and updates for 6.15-rc1:

This includes a major refactoring of the fbcon packed pixel drawing routines,
contributed by Zsolt Kajtar.  The original version duplicated more or less the
same algorithms for both system and i/o memory.  The new implementation is more
robust, both implementations are now feature complete (e.g. pixel order
reversing now supported by both), behaves the same way as it uses the identical
code for both variants and adds support for foreign endian framebuffers.

The other fixes and cleanups are:
- dummycon: only build module if there are users and fix rows/cols (Arnd Bergmann)
- mdacon: rework dependency list (Arnd Bergmann)
- lcdcfb, fsl-diu-fb, fbcon: Fix registering and removing of sysfs (Shixiong Ou)
- sm501fb: Add some geometry checks (Danila Chernetsov)
- omapfb: Remove unused code, add value checks (Leonid Arapov)
- au1100fb: Clean up variable assignment (Markus Elfring)
- pxafb: use devm_kmemdup*()  (Raag Jadav)

----------------------------------------------------------------
Arnd Bergmann (3):
      dummycon: only build module if there are users
      dummycon: fix default rows/cols
      mdacon: rework dependency list

Danila Chernetsov (1):
      fbdev: sm501fb: Add some geometry checks.

Leonid Arapov (2):
      fbdev: omapfb: Remove writeback deadcode
      fbdev: omapfb: Add 'plane' value check

Markus Elfring (1):
      fbdev: au1100fb: Move a variable assignment behind a null pointer check

Raag Jadav (1):
      fbdev: pxafb: use devm_kmemdup*()

Shixiong Ou (4):
      fbdev: lcdcfb: Register sysfs groups through driver core
      fbdev: Register sysfs groups through device_add_group
      fbcon: Use static attribute groups for sysfs entries
      fbdev: fsl-diu-fb: add missing device_remove_file()

Zsolt Kajtar (6):
      fbdev: core: tileblit: Implement missing margin clearing for tileblit
      fbcon: Use correct erase colour for clearing in fbcon
      fbdev: mach64_cursor: Remove fb_draw.h includes
      fbdev: wmt_ge_rops: Remove fb_draw.h includes
      fbdev: Refactoring the fbcon packed pixel drawing routines
      MAINTAINERS: Add contact info for fbdev packed pixel drawing

 MAINTAINERS                                  |  16 +
 drivers/video/console/Kconfig                |   9 +-
 drivers/video/fbdev/aty/mach64_cursor.c      |   7 +-
 drivers/video/fbdev/au1100fb.c               |   4 +-
 drivers/video/fbdev/core/Kconfig             |  10 +-
 drivers/video/fbdev/core/bitblit.c           |   5 +-
 drivers/video/fbdev/core/cfbcopyarea.c       | 428 +----------------------
 drivers/video/fbdev/core/cfbfillrect.c       | 362 +-------------------
 drivers/video/fbdev/core/cfbimgblt.c         | 357 +------------------
 drivers/video/fbdev/core/cfbmem.h            |  43 +++
 drivers/video/fbdev/core/fb_copyarea.h       | 405 ++++++++++++++++++++++
 drivers/video/fbdev/core/fb_draw.h           | 274 +++++++--------
 drivers/video/fbdev/core/fb_fillrect.h       | 280 +++++++++++++++
 drivers/video/fbdev/core/fb_imageblit.h      | 495 +++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.c             |  79 ++---
 drivers/video/fbdev/core/fbcon.h             |  38 +-
 drivers/video/fbdev/core/fbcon_ccw.c         |   5 +-
 drivers/video/fbdev/core/fbcon_cw.c          |   5 +-
 drivers/video/fbdev/core/fbcon_ud.c          |   5 +-
 drivers/video/fbdev/core/fbsysfs.c           |  69 ++--
 drivers/video/fbdev/core/syscopyarea.c       | 369 +-------------------
 drivers/video/fbdev/core/sysfillrect.c       | 324 +-----------------
 drivers/video/fbdev/core/sysimgblt.c         | 333 +-----------------
 drivers/video/fbdev/core/sysmem.h            |  39 +++
 drivers/video/fbdev/core/tileblit.c          |  45 ++-
 drivers/video/fbdev/fsl-diu-fb.c             |   1 +
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c |  15 +-
 drivers/video/fbdev/pxafb.c                  |  23 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c       |  29 +-
 drivers/video/fbdev/sm501fb.c                |   7 +
 drivers/video/fbdev/wmt_ge_rops.c            |  30 +-
 31 files changed, 1670 insertions(+), 2441 deletions(-)
 create mode 100644 drivers/video/fbdev/core/cfbmem.h
 create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
 create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
 create mode 100644 drivers/video/fbdev/core/fb_imageblit.h
 create mode 100644 drivers/video/fbdev/core/sysmem.h
