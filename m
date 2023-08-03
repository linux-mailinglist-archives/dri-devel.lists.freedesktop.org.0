Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA676F23B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 20:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178A10E651;
	Thu,  3 Aug 2023 18:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453A110E049
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 18:40:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E8B232189D;
 Thu,  3 Aug 2023 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691088037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OtTqFXBQhlrG+PZAvHxivPSqb0Fo/vxr7QReG0BjreQ=;
 b=uqV8yhMEb4iL193tfXjqv5+X4ARxnhBjn/KyK/krKa931N538DnrW6jSuuJbdPMnqVWEz6
 rG1Lwbat9vFKhDkieHbSaBNKRflX54LJgot4HF7ACTyA3TL1Jl/ubURaeNxTelysKhUcL8
 tfSLHdEolxQ8h09FzS78SYwc1diPX+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691088037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OtTqFXBQhlrG+PZAvHxivPSqb0Fo/vxr7QReG0BjreQ=;
 b=du5u9+OHtnBg+RMsEpDMTVwG8N1kRebeeHEvq+egzUBYpUTgNJW0CiqTllKzfzFEcZEXR+
 FAn2X86CkwCkf6AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE7491333C;
 Thu,  3 Aug 2023 18:40:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7zagKaX0y2TLGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Aug 2023 18:40:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v3 00/47] fbdev: Use I/O helpers
Date: Thu,  3 Aug 2023 20:35:25 +0200
Message-ID: <20230803184034.6456-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most fbdev drivers operate on I/O memory. And most of those use the
default implementations for file I/O and console drawing. Convert all
these low-hanging fruits to the fb_ops initializer macro and Kconfig
token for fbdev I/O helpers.

The fbdev I/O helpers are easily grep-able. In a later patch, they can
be left to empty values if the rsp. functionality, such as file I/O or
console, has been disabled.

There are no functional changes. The helpers set the defaults that
the drivers already use. The fb_io_*() functions that the initializer
macro sets are the defaults if struct fb_ops.fb_read or .fb_write are
NULL. After all drivers have been updated to set them explicitly, the
defaults can be dropped and the functions can be made optional.

v3:
	* use _IOMEM_ in commit message
v2:
	* updated to use _IOMEM_ tokens

Thomas Zimmermann (47):
  media/vivid: Use fbdev I/O helpers
  fbdev/acornfb: Use fbdev I/O helpers
  fbdev/asiliantfb: Use fbdev I/O helpers
  fbdev/atmel_lcdfb: Use fbdev I/O helpers
  fbdev/aty128fb: Use fbdev I/O helpers
  fbdev/carminefb: Use fbdev I/O helpers
  fbdev/chipsfb: Use fbdev I/O helpers
  fbdev/da8xx-fb: Use fbdev I/O helpers
  fbdev/efifb: Use fbdev I/O helpers
  fbdev/fm2fb: Use fbdev I/O helpers
  fbdev/fsl-diu-fb: Use fbdev I/O helpers
  fbdev/g364fb: Use fbdev I/O helpers
  fbdev/geode/gx1fb: Use fbdev I/O helpers
  fbdev/geode/gxfb: Use fbdev I/O helpers
  fbdev/geode/lxfb: Use fbdev I/O helpers
  fbdev/goldfishfb: Use fbdev I/O helpers
  fbdev/grvga: Use fbdev I/O helpers
  fbdev/gxt4500: Use fbdev I/O helpers
  fbdev/i740fb: Use fbdev I/O helpers
  fbdev/imxfb: Use fbdev I/O helpers
  fbdev/kyro: Use fbdev I/O helpers
  fbdev/macfb: Use fbdev I/O helpers
  fbdev/maxinefb: Use fbdev I/O helpers
  fbdev/mb862xxfb: Use fbdev I/O helpers
  fbdev/mmpfb: Use fbdev I/O helpers
  fbdev/mx3fb: Use fbdev I/O helpers
  fbdev/ocfb: Use fbdev I/O helpers
  fbdev/offb: Use fbdev I/O helpers
  fbdev/omapfb: Use fbdev I/O helpers
  fbdev/platinumfb: Use fbdev I/O helpers
  fbdev/pmag-aa-fb: Use fbdev I/O helpers
  fbdev/pmag-ba-fb: Use fbdev I/O helpers
  fbdev/pmagb-b-fb: Use fbdev I/O helpers
  fbdev/pxa168fb: Use fbdev I/O helpers
  fbdev/pxafb: Use fbdev I/O helpers
  fbdev/q40fb: Use fbdev I/O helpers
  fbdev/s3cfb: Use fbdev I/O helpers
  fbdev/sh7760fb: Use fbdev I/O helpers
  fbdev/simplefb: Use fbdev I/O helpers
  fbdev/sstfb: Use fbdev I/O helpers
  fbdev/sunxvr1000: Use fbdev I/O helpers
  fbdev/sunxvr2500: Use fbdev I/O helpers
  fbdev/uvesafb: Use fbdev I/O helpers
  fbdev/valkyriefb: Use fbdev I/O helpers
  fbdev/vesafb: Use fbdev I/O helpers
  fbdev/xilinxfb: Use fbdev I/O helpers
  vfio-dev/mdpy-fb: Use fbdev I/O helpers

 drivers/media/test-drivers/vivid/Kconfig     |   4 +-
 drivers/media/test-drivers/vivid/vivid-osd.c |   4 +-
 drivers/video/fbdev/Kconfig                  | 160 +++++--------------
 drivers/video/fbdev/acornfb.c                |   4 +-
 drivers/video/fbdev/asiliantfb.c             |   4 +-
 drivers/video/fbdev/atmel_lcdfb.c            |   4 +-
 drivers/video/fbdev/aty/aty128fb.c           |   4 +-
 drivers/video/fbdev/carminefb.c              |   5 +-
 drivers/video/fbdev/chipsfb.c                |   4 +-
 drivers/video/fbdev/da8xx-fb.c               |   4 +-
 drivers/video/fbdev/efifb.c                  |   4 +-
 drivers/video/fbdev/fm2fb.c                  |   4 +-
 drivers/video/fbdev/fsl-diu-fb.c             |   4 +-
 drivers/video/fbdev/g364fb.c                 |   4 +-
 drivers/video/fbdev/geode/Kconfig            |  12 +-
 drivers/video/fbdev/geode/gx1fb_core.c       |   5 +-
 drivers/video/fbdev/geode/gxfb_core.c        |   5 +-
 drivers/video/fbdev/geode/lxfb_core.c        |   5 +-
 drivers/video/fbdev/goldfishfb.c             |   4 +-
 drivers/video/fbdev/grvga.c                  |   4 +-
 drivers/video/fbdev/gxt4500.c                |   4 +-
 drivers/video/fbdev/i740fb.c                 |   4 +-
 drivers/video/fbdev/imxfb.c                  |   4 +-
 drivers/video/fbdev/kyro/fbdev.c             |   4 +-
 drivers/video/fbdev/macfb.c                  |   4 +-
 drivers/video/fbdev/maxinefb.c               |   4 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   |   4 +-
 drivers/video/fbdev/mmp/fb/Kconfig           |   4 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c           |   4 +-
 drivers/video/fbdev/mx3fb.c                  |   4 +-
 drivers/video/fbdev/ocfb.c                   |   4 +-
 drivers/video/fbdev/offb.c                   |   4 +-
 drivers/video/fbdev/omap/Kconfig             |   4 +-
 drivers/video/fbdev/omap/omapfb_main.c       |   4 +-
 drivers/video/fbdev/platinumfb.c             |   4 +-
 drivers/video/fbdev/pmag-aa-fb.c             |   4 +-
 drivers/video/fbdev/pmag-ba-fb.c             |   4 +-
 drivers/video/fbdev/pmagb-b-fb.c             |   4 +-
 drivers/video/fbdev/pxa168fb.c               |   4 +-
 drivers/video/fbdev/pxafb.c                  |   4 +-
 drivers/video/fbdev/q40fb.c                  |   4 +-
 drivers/video/fbdev/s3c-fb.c                 |   4 +-
 drivers/video/fbdev/sh7760fb.c               |   4 +-
 drivers/video/fbdev/simplefb.c               |   4 +-
 drivers/video/fbdev/sstfb.c                  |   4 +-
 drivers/video/fbdev/sunxvr1000.c             |   4 +-
 drivers/video/fbdev/sunxvr2500.c             |   4 +-
 drivers/video/fbdev/uvesafb.c                |   4 +-
 drivers/video/fbdev/valkyriefb.c             |   4 +-
 drivers/video/fbdev/vesafb.c                 |   4 +-
 drivers/video/fbdev/xilinxfb.c               |   4 +-
 samples/Kconfig                              |   4 +-
 samples/vfio-mdev/mdpy-fb.c                  |   4 +-
 53 files changed, 94 insertions(+), 286 deletions(-)


base-commit: 194cd63362db9ed2cbdd3deaa7a8752b86d95f3b
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
prerequisite-patch-id: 9e45f32f01ebd4d3a927038e52b91a389673b9bb
prerequisite-patch-id: b0b735b6e10a12816cea5ea15e3292c6342ed2f2
prerequisite-patch-id: 3997b2a71240d34ccf6990cf133cad39d4efc8f4
prerequisite-patch-id: d64b3896ffd91137df0c4311a8b7aa0d5fa40a11
prerequisite-patch-id: 5c8669f6947f5a44d19f4f8bd36b77c31163eda7
-- 
2.41.0

