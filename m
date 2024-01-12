Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7778E82C30B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 16:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D985410EB3F;
	Fri, 12 Jan 2024 15:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62CA10EB3F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 15:48:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E4B8B616B9;
 Fri, 12 Jan 2024 15:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F028DC433F1;
 Fri, 12 Jan 2024 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705074526;
 bh=LjNh32+q3C0+BqK8BlI5tSSM8lb3tGzw35+W/e7lDGA=;
 h=Date:From:To:Subject:From;
 b=UwfzX2mEQlMs7lKRKyPel2evCsbDKSF3FUJWhz2ja/dq05Zf8E2LeyAKqtghulLpq
 ZdITG9xio8wsxb3aEbE66gvbl7xwWfvDC8zdLdBfbo6nDoRr5K/2FYDwTMSP+1aTXO
 yUapVQDcRnDBzXNxRRXJVIhKYuatcVQScCr1aNn99StcNxluNspXVxAkY7wkvGptIm
 oD7706f5h6O5euzgYr+ywxiZRoCebK5twcPV36/yj6KaSt08ogPP1B41RPoh9XIAT/
 zB0rf6PqQbiPbnenPeiqIGWpAWP/2mdtPBD3Fp/wfdd8IEze9+H8kGf9NSFQSPu3qL
 GoUDR079kJFZw==
Date: Fri, 12 Jan 2024 16:48:41 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@redhat.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev fixes and updates for v6.8-rc1
Message-ID: <ZaFfWY-bB_b9dGrO@carbonx1>
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

please pull the fbdev changes for kernel 6.8-rc1.

Three fbdev drivers (~8500 lines of code) will be dropped:
The Carillo Ranch fbdev driver is for an Intel product which was never shipped,
and for the intelfb and the amba-clcd drivers the drm drivers can be used
instead. 

The other code changes are minor:
Some fb_deferred_io flushing fixes, imxfb margin fixes and stifb cleanups.

Please note that there is a merge conflict with the drm tree for those files:
- drivers/video/fbdev/amba-clcd.c
- drivers/video/fbdev/vermilion/vermilion.c
They were modified in the drm tree, but deleted in the fbdev tree.
In case you don't want to deal with this upcoming merge conflict I offer
to resend a rebased pull request after you pulled drm.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit de927f6c0b07d9e698416c5b287c521b07694cac:

  Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux (2024-01-10 18:18:20 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.8-rc1

for you to fetch changes up to 689237ab37c59b9909bc9371d7fece3081683fba:

  fbdev/intelfb: Remove driver (2024-01-12 12:38:37 +0100)

----------------------------------------------------------------
fbdev fixes and cleanups for 6.8-rc1:

- Remove intelfb fbdev driver (Thomas Zimmermann)
- Remove amba-clcd fbdev driver (Linus Walleij)
- Remove vmlfb Carillo Ranch fbdev driver (Matthew Wilcox)
- fb_deferred_io flushing fixes (Nam Cao)
- imxfb code fixes and cleanups (Dario Binacchi)
- stifb primary screen detection cleanups (Thomas Zimmermann)

----------------------------------------------------------------
Colin Ian King (1):
      video/logo: use %u format specifier for unsigned int values

Dario Binacchi (11):
      fbdev: imxfb: fix left margin setting
      fbdev: imxfb: move PCR bitfields near their offset
      fbdev: imxfb: use BIT, FIELD_{GET,PREP} and GENMASK macros
      fbdev: imxfb: replace some magic numbers with constants
      fbdev: imxfb: add missing SPDX tag
      fbdev: imxfb: drop ftrace-like logging
      fbdev: imxfb: add missing spaces after ','
      fbdev: imxfb: Fix style warnings relating to printk()
      fbdev: imxfb: use __func__ for function name
      fbdev: imxfb: add '*/' on a separate line in block comment
      fbdev: mmp: Fix typo and wording in code comment

Linus Walleij (1):
      fbdev: amba-clcd: Delete the old CLCD driver

Matthew Wilcox (Oracle) (1):
      fbdev: Remove support for Carillo Ranch driver

Nam Cao (2):
      fbdev: flush deferred work in fb_deferred_io_fsync()
      fbdev: flush deferred IO before closing

Randy Dunlap (1):
      fbdev: hgafb: fix kernel-doc comments

Stanislav Kinsburskii (1):
      fbdev: fsl-diu-fb: Fix sparse warning due to virt_to_phys() prototype change

Thomas Zimmermann (10):
      video/sticore: Store ROM device in STI struct
      fbdev/stifb: Allocate fb_info instance with framebuffer_alloc()
      arch/parisc: Detect primary video device from device instance
      video/sticore: Remove info field from STI struct
      fbdev/sis: Remove dependency on screen_info
      drm/hyperv: Remove firmware framebuffers with aperture helper
      fbdev/hyperv_fb: Remove firmware framebuffers with aperture helpers
      firmware/sysfb: Clear screen_info state after consuming it
      fbdev/hyperv_fb: Do not clear global screen_info
      fbdev/intelfb: Remove driver

 Documentation/fb/index.rst                         |    1 -
 Documentation/fb/intelfb.rst                       |  155 --
 Documentation/userspace-api/ioctl/ioctl-number.rst |    1 -
 MAINTAINERS                                        |   12 -
 arch/parisc/video/fbdev.c                          |    2 +-
 drivers/Makefile                                   |    3 +-
 drivers/firmware/sysfb.c                           |   14 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    8 +-
 drivers/video/backlight/Kconfig                    |    7 -
 drivers/video/backlight/Makefile                   |    1 -
 drivers/video/backlight/cr_bllcd.c                 |  264 ---
 drivers/video/fbdev/Kconfig                        |   72 -
 drivers/video/fbdev/Makefile                       |    2 -
 drivers/video/fbdev/amba-clcd.c                    |  984 ---------
 drivers/video/fbdev/core/fb_defio.c                |    8 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |    2 +-
 drivers/video/fbdev/hgafb.c                        |   13 +-
 drivers/video/fbdev/hyperv_fb.c                    |   20 +-
 drivers/video/fbdev/imxfb.c                        |  179 +-
 drivers/video/fbdev/intelfb/Makefile               |    8 -
 drivers/video/fbdev/intelfb/intelfb.h              |  382 ----
 drivers/video/fbdev/intelfb/intelfb_i2c.c          |  209 --
 drivers/video/fbdev/intelfb/intelfbdrv.c           | 1680 ----------------
 drivers/video/fbdev/intelfb/intelfbhw.c            | 2115 --------------------
 drivers/video/fbdev/intelfb/intelfbhw.h            |  609 ------
 drivers/video/fbdev/mmp/hw/mmp_spi.c               |    2 +-
 drivers/video/fbdev/sis/sis_main.c                 |   37 -
 drivers/video/fbdev/stifb.c                        |  109 +-
 drivers/video/fbdev/vermilion/Makefile             |    6 -
 drivers/video/fbdev/vermilion/cr_pll.c             |  195 --
 drivers/video/fbdev/vermilion/vermilion.c          | 1173 -----------
 drivers/video/fbdev/vermilion/vermilion.h          |  245 ---
 drivers/video/logo/pnmtologo.c                     |    6 +-
 drivers/video/sticore.c                            |    5 +
 include/linux/amba/clcd-regs.h                     |   87 -
 include/linux/amba/clcd.h                          |  290 ---
 include/video/sticore.h                            |    6 +-
 37 files changed, 208 insertions(+), 8704 deletions(-)
 delete mode 100644 Documentation/fb/intelfb.rst
 delete mode 100644 drivers/video/backlight/cr_bllcd.c
 delete mode 100644 drivers/video/fbdev/amba-clcd.c
 delete mode 100644 drivers/video/fbdev/intelfb/Makefile
 delete mode 100644 drivers/video/fbdev/intelfb/intelfb.h
 delete mode 100644 drivers/video/fbdev/intelfb/intelfb_i2c.c
 delete mode 100644 drivers/video/fbdev/intelfb/intelfbdrv.c
 delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.c
 delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.h
 delete mode 100644 drivers/video/fbdev/vermilion/Makefile
 delete mode 100644 drivers/video/fbdev/vermilion/cr_pll.c
 delete mode 100644 drivers/video/fbdev/vermilion/vermilion.c
 delete mode 100644 drivers/video/fbdev/vermilion/vermilion.h
 delete mode 100644 include/linux/amba/clcd-regs.h
 delete mode 100644 include/linux/amba/clcd.h
