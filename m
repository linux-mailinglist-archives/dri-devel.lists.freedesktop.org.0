Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920BAC9BE3
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 19:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7724910E2F9;
	Sat, 31 May 2025 17:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JgQd6BcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE1810E2F9
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 17:13:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 340CD6000A;
 Sat, 31 May 2025 17:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A448C4CEE3;
 Sat, 31 May 2025 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748711615;
 bh=WlJNuiE+C9mhjb6dd0QzBTMplOmQ0UM3DzsGqoxwTyE=;
 h=Date:From:To:Subject:From;
 b=JgQd6BcDzdLrL6qzYhrttppJeaI0GY/PdGr8PBpKyN0HXXNL8MFk25yHN1bIpDBmU
 33UJYBOdeJugeHPrNul0ZQ3Qb9rpqqhAHpuWtSW/J0cH3B/nE1b8+M6CmLEf0zPFUs
 wuXMko98VD3gDbaVGplhWRhB7ATqfoYvCBv4Q5NFvOaN2WewfjhB72Lk7aZwz/ayPD
 TmLy0gVTP3uheYOtQHInDlTbE+zYeDRpYxewAThmj2qiQ9CnpKpcB3Iqp+2S6jf28r
 tU2LcKa85PdqGUE5N6+fuQh+IKraFjneu1Fd0H7A/ivCDKDXp3YIU2jORyiwVXkz5l
 MXIOkvlPNuoRg==
Date: Sat, 31 May 2025 19:13:31 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates for v6.16-rc1
Message-ID: <aDs4uwcxU_M4mpVE@carbonx1>
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

please pull the fbdev fixes and updates for 6.16-rc1:

Many small but important fixes for special cases in the fbdev, fbcon and vgacon
code, some smaller code cleanups in the nvidiafb, arkfb, atyfb and viafb drivers
and two spelling fixes.

Thanks!
Helge

PS: All patches have been sitting in for-next for at least two days (the
majority of patches since weeks). I did a rebase because fast-forward merging
with head didn't work.

----------------------------------------------------------------
The following changes since commit 0f70f5b08a47a3bc1a252e5f451a137cde7c98ce:

  Merge tag 'pull-automount' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs (2025-05-30 15:38:29 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.16-rc1

for you to fetch changes up to 05f6e183879d9785a3cdf2f08a498bc31b7a20aa:

  fbdev: Fix fb_set_var to prevent null-ptr-deref in fb_videomode_to_var (2025-05-31 10:24:02 +0200)

----------------------------------------------------------------
fbdev fixes and updates for 6.16-rc1:

Various bug fixes for corner cases which were found with Syzkaller,
Svace and other tools by various people and teams (e.g. Linux Verification Center):
    fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_videomode_to_var [Murad Masimov]
    fbdev: Fix fb_set_var to prevent null-ptr-deref in fb_videomode_to_var [Murad Masimov]
    fbdev: core: fbcvt: avoid division by 0 in fb_cvt_hperiod() [Sergey Shtylyov]
    fbcon: Make sure modelist not set on unregistered console [Kees Cook]
    vgacon: Add check for vc_origin address range in vgacon_scroll() [GONG Ruiqi]

Minor coding fixes in:
    nvidiafb, arkfb, atyfb, viafb.

Spelling fixes in:
    sstfb.rst and carminefb.

----------------------------------------------------------------
Andy Shevchenko (1):
      fbdev: atyfb: Remove unused PCI vendor ID

Bartosz Golaszewski (1):
      fbdev: via: use new GPIO line value setter callbacks

Colin Ian King (1):
      fbdev: carminefb: Fix spelling mistake of CARMINE_TOTAL_DIPLAY_MEM

GONG Ruiqi (1):
      vgacon: Add check for vc_origin address range in vgacon_scroll()

Kees Cook (2):
      fbdev: arkfb: Cast ics5342_init() allocation type
      fbcon: Make sure modelist not set on unregistered console

Murad Masimov (2):
      fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_videomode_to_var
      fbdev: Fix fb_set_var to prevent null-ptr-deref in fb_videomode_to_var

Rujra Bhatt (1):
      fbdev: sstfb.rst: Fix spelling mistake

Sergey Shtylyov (1):
      fbdev: core: fbcvt: avoid division by 0 in fb_cvt_hperiod()

Zijun Hu (1):
      fbdev: nvidiafb: Correct const string length in nvidiafb_setup()

 Documentation/fb/sstfb.rst          |  2 +-
 drivers/video/console/vgacon.c      |  2 +-
 drivers/video/fbdev/arkfb.c         |  5 +++--
 drivers/video/fbdev/carminefb.c     |  8 ++++----
 drivers/video/fbdev/carminefb.h     |  2 +-
 drivers/video/fbdev/core/fbcon.c    |  7 ++++++-
 drivers/video/fbdev/core/fbcvt.c    |  2 +-
 drivers/video/fbdev/core/fbmem.c    | 22 ++++++++++++++--------
 drivers/video/fbdev/nvidia/nvidia.c |  2 +-
 drivers/video/fbdev/via/via-gpio.c  | 10 +++++-----
 include/video/mach64.h              |  3 ---
 11 files changed, 37 insertions(+), 28 deletions(-)
