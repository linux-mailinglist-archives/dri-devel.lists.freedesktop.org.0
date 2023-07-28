Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EF7674D1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE2810E758;
	Fri, 28 Jul 2023 18:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F0010E219
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:22:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C0BF21892;
 Fri, 28 Jul 2023 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690568556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9xhX/d0nOfcA8qfj6H2EWd8nVvr6t6TOcGSyy7Z6zD4=;
 b=RQ3HSvcZyfM+2BUVtTgAA4ueCI0+q6Q+uiolZfqwnFwpqHOAnHQl4T8I4vJ0pk0OkwdMMm
 u6SHVOBOHDQWiwc19fHKtAKTozXF4VCA3tefHLAN5kRSXQTFznhC+rWLxpd4AFZlG9qbYN
 j4yCV7M6HeD4KZcPJNFbfcT8/Uc8VQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690568556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9xhX/d0nOfcA8qfj6H2EWd8nVvr6t6TOcGSyy7Z6zD4=;
 b=peACJPHExXeBvbK16dt3LKUcn3oBHF6g2LfMr/JVEUcIWslGUeexgmQmOGeOTrnGmMrLoL
 H+kCuy5hud4acWDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3268913276;
 Fri, 28 Jul 2023 18:22:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Fp1PC2wHxGQ3CwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jul 2023 18:22:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH 00/47] fbdev: Use I/O helpers
Date: Fri, 28 Jul 2023 18:39:43 +0200
Message-ID: <20230728182234.10680-1-tzimmermann@suse.de>
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
be left to empty values if the rsp. funtionality, such as file I/O or
console, has been disabled.

There are no functional changes. The helpers set the defaults that
the drivers already use.

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
  fbdev/pmag-b-fb: Use fbdev I/O helpers
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


base-commit: fba8a13ec9ae1a7175cc0dda7235b3d2df0f0f90
-- 
2.41.0

