Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0616B294C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8817310E813;
	Thu,  9 Mar 2023 16:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC7C10E038
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BE3422143;
 Thu,  9 Mar 2023 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JSy3IOe6HAwVADCc+hI/Uqf0bdfoESCu+tTk0BOF+MI=;
 b=bz6qb5Bx+kU6fy0DFJbxLODvavLeoLYfrzPhmOW97GSASjQRENThgOtkikza8AonRjLEQt
 VivNH1ZGrAtanmx/1nvdrWvKpcklJsLhopsdlO1oqE1E2Q89r2fVzrienGO/l7Vgq8iaD9
 4zv0CpykPLR0A/c2eQ86nhFq9hg/8M8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JSy3IOe6HAwVADCc+hI/Uqf0bdfoESCu+tTk0BOF+MI=;
 b=llMqymtgLc4cOviOVHdyzcRHtQ68ua2MXLLsY8y3soHCsPeOViZQmNAQQMsy09U8KYaLuf
 tnkykul4AHXu9tBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B40C1391B;
 Thu,  9 Mar 2023 16:02:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id go3iAfwCCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 000/101] fbdev: Fix memory leak in option parsing
Date: Thu,  9 Mar 2023 17:00:20 +0100
Message-Id: <20230309160201.5163-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce struct option_iter and helpers to parse command-line
options with comma-separated key-value pairs. Then convert fbdev
drivers to the new interface. Fixes a memory leak in the parsing of
the video= option.

Before commit 73ce73c30ba9 ("fbdev: Transfer video= option strings to
caller; clarify ownership"), a call to fb_get_options() either
returned an internal string or a duplicated string; hence ownership of
the string's memory buffer was not well defined, but depended on how
users specified the video= option on the kernel command line. For
global settings, the caller owned the returned memory and for per-driver
settings, fb_get_options() owned the memory. As calling drivers were
unable to detect the case, they had no option but to leak the the memory.

Commit 73ce73c30ba9 ("fbdev: Transfer video= option strings to caller;
clarify ownership") changed semantics to caller-owned strings. Drivers
still leaked the memory, but at least ownership was clear.

This patchset fixes the memory leak and changes string ownership back
to fb_get_options(). Patch 1 introduces struct option_iter and a few
helpers. The interface takes an option string, such as video=, in the
common form value1,key2:value2,value3 etc and returns the individual
comma-separated pairs. Various modules use this pattern, so the code
is located under lib/.

Patches 2 to 100 go through fbdev drivers and convert them to the new
interface. This often requires a number of cleanups. A driver would
typically refer to the option string's video mode. Such strings are now
copied to driver-allocated memory so that drivers don't refer directly
to the option string's memory. The option iterator then replaces manual
parsing loops based on strsep(","). All driver-allocated memory is
released by removing the device or unloading the module.

Patch 101 finally changes the ownership of the option string to be
internal to fb_get_option(); thereby fixing the memory leak. The option
iterator holds its own copy of the string and is not affected by the
change.

Most fbdev drivers only support to parse option strings if they are
built-in. I assume that's because of the original fuzzy semantics of
fb_get_options(). A later patchset could change the driver to respect
video= settings in any configuration.

v2:
	* use kstrdup()/kfree() for video strings (Geert, Timur)
	* fix iterator docs (Randy)
	* update iterator interface

Thomas Zimmermann (101):
  lib: Add option iterator
  fbdev/68328fb: Remove trailing whitespaces
  fbdev/68328fb: Remove unused option string
  fbdev/acornfb: Only init fb_info once
  fbdev/acornfb: Parse option string with struct option_iter
  fbdev/amifb: Duplicate video-mode option string
  fbdev/amifb: Parse option string with struct option_iter
  fbdev/arkfb: Duplicate video-mode option string
  fbdev/atafb: Duplicate video-mode option string
  fbdev/atafb: Parse option string with struct option_iter
  fbdev/aty: Duplicate video-mode option string
  fbdev/aty: Parse option string with struct option_iter
  fbdev/au1100fb: Parse option string with struct option_iter
  fbdev/au1200fb: Parse option string with struct option_iter
  fbdev/cirrusfb: Duplicate video-mode option string
  fbdev/cirrusfb: Parse option string with struct option_iter
  fbdev/controlfb: Remove trailing whitespaces
  fbdev/controlfb: Parse option string with struct option_iter
  fbdev/cyber2000fb: Parse option string with struct option_iter
  fbdev/efifb: Parse option string with struct option_iter
  fbdev/fm2fb: Parse option string with struct option_iter
  fbdev/fsl-diu-fb: Duplicate video-mode option string
  fbdev/fsl-diu-fb: Parse option string with struct option_iter
  fbdev/gbefb: Duplicate video-mode option string
  fbdev/gbefb: Parse option string with struct option_iter
  fbdev/geode: Duplicate video-mode option string
  fbdev/geode: Parse option string with struct option_iter
  fbdev/grvga: Duplicate video-mode option string
  fbdev/grvga: Parse option string with struct option_iter
  fbdev/gxt4500: Duplicate video-mode option string
  fbdev/hyperv_fb: Duplicate video-mode option string
  fbdev/i740fb: Duplicate video-mode option string
  fbdev/i740fb: Parse option string with struct option_iter
  fbdev/i810: Duplicate video-mode option string
  fbdev/i810: Parse option string with struct option_iter
  fbdev/imsttfb: Parse option string with struct option_iter
  fbdev/intelfb: Duplicate video-mode option string
  fbdev/intelfb: Parse option string with struct option_iter
  fbdev/imxfb: Duplicate video-mode option string
  fbdev/imxfb: Parse option string with struct option_iter
  fbdev/kyrofb: Duplicate video-mode option string
  fbdev/kyrofb: Parse option string with struct option_iter
  fbdev/macfb: Remove trailing whitespaces
  fbdev/macfb: Parse option string with struct option_iter
  fbdev/matroxfb: Parse option string with struct option_iter
  fbdev/mx3fb: Duplicate video-mode option string
  fbdev/mx3fb: Parse option string with struct option_iter
  fbdev/neofb: Duplicate video-mode option string
  fbdev/neofb: Parse option string with struct option_iter
  fbdev/nvidiafb: Duplicate video-mode option string
  fbdev/nvidiafb: Parse option string with struct option_iter
  fbdev/ocfb: Duplicate video-mode option string
  fbdev/ocfb: Parse option string with struct option_iter
  fbdev/omapfb: Parse option string with struct option_iter
  fbdev/platinumfb: Remove trailing whitespaces
  fbdev/platinumfb: Parse option string with struct option_iter
  fbdev/pm2fb: Duplicate video-mode option string
  fbdev/pm2fb: Parse option string with struct option_iter
  fbdev/pm3fb: Duplicate video-mode option string
  fbdev/pm3fb: Parse option string with struct option_iter
  fbdev/ps3fb: Duplicate video-mode option string
  fbdev/ps3fb: Parse option string with struct option_iter
  fbdev/pvr2fb: Duplicate video-mode option string
  fbdev/pvr2fb: Parse option string with struct option_iter
  fbdev/pxafb: Parse option string with struct option_iter
  fbdev/rivafb: Duplicate video-mode option string
  fbdev/rivafb: Parse option string with struct option_iter
  fbdev/s3fb: Duplicate video-mode option string
  fbdev/s3fb: Parse option string with struct option_iter
  fbdev/savagefb: Duplicate video-mode option string
  fbdev/savagefb: Parse option string with struct option_iter
  fbdev/sisfb: Constify mode string
  fbdev/sisfb: Parse option string with struct option_iter
  fbdev/skeletonfb: Parse option string with struct option_iter
  fbdev/sm712fb: Duplicate video-mode option string
  fbdev/sstfb: Duplicate video-mode option string
  fbdev/sstfb: Parse option string with struct option_iter
  fbdev/stifb: Remove trailing whitespaces
  fbdev/stifb: Constify option string
  fbdev/tdfxfb: Duplicate video-mode option string
  fbdev/tdfxfb: Parse option string with struct option_iter
  fbdev/tgafb: Duplicate video-mode option string
  fbdev/tgafb: Parse option string with struct option_iter
  fbdev/tmiofb: Remove unused option string
  fbdev/tridentfb: Duplicate video-mode option string
  fbdev/tridentfb: Parse option string with struct option_iter
  fbdev/uvesafb: Duplicate video-mode option string
  fbdev/uvesafb: Parse option string with struct option_iter
  fbdev/valkyriefb: Remove trailing whitespaces
  fbdev/valkyriefb: Parse option string with struct option_iter
  fbdev/vermilion: Remove unused option string
  fbdev/vesafb: Parse option string with struct option_iter
  fbdev/vfb: Remove trailing whitespaces
  fbdev/vfb: Duplicate video-mode option string
  fbdev/vfb: Parse option string with struct option_iter
  fbdev/viafb: Parse option string with struct option_iter
  fbdev/vt8623fb: Duplicate video-mode option string
  staging/sm750fb: Release g_settings in module-exit function
  staging/sm750fb: Duplicate video-mode option string
  staging/sm750fb: Parse option string with struct option_iter
  fbdev: Constify option strings

 Documentation/core-api/kernel-api.rst        |   9 ++
 drivers/staging/sm750fb/sm750.c              |  63 ++++----
 drivers/video/fbdev/68328fb.c                |  24 +--
 drivers/video/fbdev/acornfb.c                |  23 ++-
 drivers/video/fbdev/amifb.c                  |  23 +--
 drivers/video/fbdev/arkfb.c                  |  10 +-
 drivers/video/fbdev/atafb.c                  |  21 +--
 drivers/video/fbdev/aty/aty128fb.c           |  22 ++-
 drivers/video/fbdev/aty/atyfb_base.c         |  23 ++-
 drivers/video/fbdev/aty/radeon_base.c        |  26 +--
 drivers/video/fbdev/au1100fb.c               |  13 +-
 drivers/video/fbdev/au1200fb.c               |  15 +-
 drivers/video/fbdev/cirrusfb.c               |  30 ++--
 drivers/video/fbdev/controlfb.c              |  47 +++---
 drivers/video/fbdev/core/fb_cmdline.c        |  13 +-
 drivers/video/fbdev/core/modedb.c            |   8 +-
 drivers/video/fbdev/cyber2000fb.c            |  17 +-
 drivers/video/fbdev/efifb.c                  |  44 ++---
 drivers/video/fbdev/ep93xx-fb.c              |   2 +-
 drivers/video/fbdev/fm2fb.c                  |  14 +-
 drivers/video/fbdev/fsl-diu-fb.c             |  24 +--
 drivers/video/fbdev/gbefb.c                  |  23 +--
 drivers/video/fbdev/geode/gx1fb_core.c       |  16 +-
 drivers/video/fbdev/geode/gxfb_core.c        |  23 +--
 drivers/video/fbdev/geode/lxfb_core.c        |  25 +--
 drivers/video/fbdev/grvga.c                  |  18 ++-
 drivers/video/fbdev/gxt4500.c                |  13 +-
 drivers/video/fbdev/hyperv_fb.c              |  18 ++-
 drivers/video/fbdev/i740fb.c                 |  26 +--
 drivers/video/fbdev/i810/i810_main.c         |  26 ++-
 drivers/video/fbdev/imsttfb.c                |  16 +-
 drivers/video/fbdev/imxfb.c                  |  21 +--
 drivers/video/fbdev/intelfb/intelfbdrv.c     |  23 ++-
 drivers/video/fbdev/kyro/fbdev.c             |  21 ++-
 drivers/video/fbdev/macfb.c                  |  26 +--
 drivers/video/fbdev/matrox/matroxfb_base.c   |  19 +--
 drivers/video/fbdev/mx3fb.c                  |  23 ++-
 drivers/video/fbdev/neofb.c                  |  26 +--
 drivers/video/fbdev/nvidia/nvidia.c          |  26 ++-
 drivers/video/fbdev/ocfb.c                   |  21 ++-
 drivers/video/fbdev/omap/omapfb_main.c       |  15 +-
 drivers/video/fbdev/platinumfb.c             |  44 ++---
 drivers/video/fbdev/pm2fb.c                  |  25 +--
 drivers/video/fbdev/pm3fb.c                  |  27 ++--
 drivers/video/fbdev/ps3fb.c                  |  28 ++--
 drivers/video/fbdev/pvr2fb.c                 |  32 ++--
 drivers/video/fbdev/pxafb.c                  |  18 ++-
 drivers/video/fbdev/riva/fbdev.c             |  26 ++-
 drivers/video/fbdev/s3fb.c                   |  27 ++--
 drivers/video/fbdev/savage/savagefb_driver.c |  20 ++-
 drivers/video/fbdev/sis/sis_main.c           |  24 +--
 drivers/video/fbdev/skeletonfb.c             |  17 +-
 drivers/video/fbdev/sm712fb.c                |  12 +-
 drivers/video/fbdev/sstfb.c                  |  25 +--
 drivers/video/fbdev/stifb.c                  | 162 +++++++++----------
 drivers/video/fbdev/tdfxfb.c                 |  21 ++-
 drivers/video/fbdev/tgafb.c                  |  30 ++--
 drivers/video/fbdev/tmiofb.c                 |  24 +--
 drivers/video/fbdev/tridentfb.c              |  27 ++--
 drivers/video/fbdev/uvesafb.c                |  21 ++-
 drivers/video/fbdev/valkyriefb.c             |  30 ++--
 drivers/video/fbdev/vermilion/vermilion.c    |   7 +-
 drivers/video/fbdev/vesafb.c                 |  16 +-
 drivers/video/fbdev/vfb.c                    |  35 ++--
 drivers/video/fbdev/via/viafbdev.c           |  15 +-
 drivers/video/fbdev/vt8623fb.c               |  11 +-
 include/linux/cmdline.h                      |  36 +++++
 include/linux/fb.h                           |   2 +-
 lib/Makefile                                 |   2 +-
 lib/cmdline_iter.c                           | 109 +++++++++++++
 70 files changed, 1087 insertions(+), 682 deletions(-)
 create mode 100644 include/linux/cmdline.h
 create mode 100644 lib/cmdline_iter.c

-- 
2.39.2

