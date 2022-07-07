Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A271456A726
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 17:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF4E112E7B;
	Thu,  7 Jul 2022 15:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0BB10EFEF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 15:39:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 31916219F2;
 Thu,  7 Jul 2022 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657208398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4vZ5bqCfIkwqM9philRuQdabqYFiE7l8C2Z/WBk+CRs=;
 b=XrmZeKlk8nIFeVcnen2WkP1lYO+G3PKWD4+69OoesWQ2uZQK5/+IabAX4M849tzAGewc6W
 F7/1K196CyzbrZ7koXb+oGjpy8QXiEaMD2grHp0TgHlC+EnssG5WPUx5TBlzkFwjv4QF/3
 yBawnDrOuZUmPyVef2xxiwlsAkf4p/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657208398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4vZ5bqCfIkwqM9philRuQdabqYFiE7l8C2Z/WBk+CRs=;
 b=mOElHapcEpoTN5jeCTInBT6zi/k8X5ON5DK5Cd2LrCUjdyYkFowxp+qjcXONWyyoBuXqc/
 H4B/iCu7bmlqySCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01C5813A33;
 Thu,  7 Jul 2022 15:39:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sboEO03+xmI9UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:39:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH 00/11] fbdev: Maintain device ownership with aperture helpers
Date: Thu,  7 Jul 2022 17:39:41 +0200
Message-Id: <20220707153952.32264-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fbdev firmware drivers acquire ownership of framebuffer I/O ranges and
hand them over to native drivers during the boot process. Re-implement
this mechanism with aperture helpers and remove the respective fbdev
code.

This change allows to perform hand-over from DRM firmware drivers. In a
later patchset, device ownership can be moved from DRM and fbdev entirely
into aperture helpers.

Patches 1 and 4 are cleanups.

Patches 2 and 3 integrate EGA/VGA support into sysfb, although it's not
clear if the x86 architecture code actually still supports VGA graphics
mode.

Patches 5 to 10 replace fbdev's ownership management with aperture
helpers. This includes removal of conflicting framebuffer drivers,
removal of conflicting VGA drivers and registration of fbdev firmware
devices. Notably, many PCI-based fbdev drivers failed to remove firmware
devices until now; and therefore probably haven't worked correctly for
some time.

Patch 11 removes the implementation of fbdev ownership management.

The patchset has been tested by handing over device ownership between
firmware and native drivers of DRM and fbdev in various combinations.

Thomas Zimmermann (11):
  fbdev: Remove trailing whitespaces
  fbdev/vga16fb: Create EGA/VGA devices in sysfb code
  fbdev/vga16fb: Auto-generate module init/exit code
  fbdev/core: Remove remove_conflicting_pci_framebuffers()
  fbdev: Convert drivers to aperture helpers
  fbdev: Remove conflicting devices on PCI bus
  video/aperture: Disable and unregister sysfb devices via aperture
    helpers
  video: Provide constants for VGA I/O range
  video/aperture: Remove conflicting VGA devices, if any
  fbdev: Acquire framebuffer apertures for firmware devices
  fbdev: Remove conflict-handling code

 drivers/firmware/sysfb.c                     |   4 +
 drivers/staging/sm750fb/sm750.c              |  15 +-
 drivers/video/aperture.c                     |  69 ++--
 drivers/video/fbdev/arkfb.c                  |   5 +
 drivers/video/fbdev/asiliantfb.c             |   5 +
 drivers/video/fbdev/aty/aty128fb.c           |  57 ++--
 drivers/video/fbdev/aty/atyfb_base.c         |   7 +-
 drivers/video/fbdev/aty/radeon_base.c        |  83 +++--
 drivers/video/fbdev/carminefb.c              |   5 +
 drivers/video/fbdev/chipsfb.c                |  13 +-
 drivers/video/fbdev/cirrusfb.c               |   5 +
 drivers/video/fbdev/core/fbmem.c             | 176 ++---------
 drivers/video/fbdev/cyber2000fb.c            |   5 +
 drivers/video/fbdev/geode/gx1fb_core.c       |   5 +
 drivers/video/fbdev/geode/gxfb_core.c        |   5 +
 drivers/video/fbdev/geode/lxfb_core.c        |   5 +
 drivers/video/fbdev/gxt4500.c                |   5 +
 drivers/video/fbdev/hyperv_fb.c              |   6 +-
 drivers/video/fbdev/i740fb.c                 |   5 +
 drivers/video/fbdev/i810/i810_main.c         | 315 ++++++++++---------
 drivers/video/fbdev/imsttfb.c                |  36 ++-
 drivers/video/fbdev/intelfb/intelfbdrv.c     |   5 +
 drivers/video/fbdev/kyro/fbdev.c             |   5 +
 drivers/video/fbdev/matrox/matroxfb_base.c   |   5 +
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   |   5 +
 drivers/video/fbdev/neofb.c                  |  41 +--
 drivers/video/fbdev/nvidia/nvidia.c          |   7 +-
 drivers/video/fbdev/pm2fb.c                  |   5 +
 drivers/video/fbdev/pm3fb.c                  |   5 +
 drivers/video/fbdev/pvr2fb.c                 |   5 +
 drivers/video/fbdev/riva/fbdev.c             |  67 ++--
 drivers/video/fbdev/s3fb.c                   |   5 +
 drivers/video/fbdev/savage/savagefb_driver.c |   5 +
 drivers/video/fbdev/sis/sis_main.c           |   5 +
 drivers/video/fbdev/skeletonfb.c             | 210 +++++++------
 drivers/video/fbdev/sm712fb.c                |   5 +
 drivers/video/fbdev/sstfb.c                  |  43 +--
 drivers/video/fbdev/sunxvr2500.c             |   5 +
 drivers/video/fbdev/sunxvr500.c              |   5 +
 drivers/video/fbdev/tdfxfb.c                 |   5 +
 drivers/video/fbdev/tgafb.c                  |  17 +-
 drivers/video/fbdev/tridentfb.c              |   5 +
 drivers/video/fbdev/vermilion/vermilion.c    |   7 +-
 drivers/video/fbdev/vga16fb.c                | 191 +++++------
 drivers/video/fbdev/via/via-core.c           |   5 +
 drivers/video/fbdev/vt8623fb.c               |   5 +
 include/linux/fb.h                           |   4 -
 include/video/vga.h                          |  20 +-
 48 files changed, 788 insertions(+), 735 deletions(-)


base-commit: 11d480026e922adacd274306728adb6df6dd262a
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
-- 
2.36.1

