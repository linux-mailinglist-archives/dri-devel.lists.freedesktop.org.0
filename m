Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B6C7EC071
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AC710E51C;
	Wed, 15 Nov 2023 10:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE48D10E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 10:29:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74ACA204E3;
 Wed, 15 Nov 2023 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700044196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AScGBOOVRsIdNjA3ofDprTsJoTZ679DbuhovRxn5FnI=;
 b=ADl91A1L6z6+kgq+YQV0MWVVxtFl8oNYX5XPnRpbxn3HIBKdOgoixMge43hVPUMd/xk20l
 I78kukNcaWo+Wzb/PfcVAys70AvNBlLrGAbJe9nhgBErMXZjYn1g7SArb327UesPC1LXuU
 T2k5C/K/8xMhLTh0okcqUCmGfAq5Lmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700044196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AScGBOOVRsIdNjA3ofDprTsJoTZ679DbuhovRxn5FnI=;
 b=bToUZgHS5uA5zv7kPlkZ7Ud3JJimhs68X16aDXnYy0fo88jARXJijWTgdBJ62btd9GZwCL
 O553xePN0uNZpkDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53F0C13592;
 Wed, 15 Nov 2023 10:29:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4C55E6SdVGV+UAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:29:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 00/32] fbdev: Modularize helpers for struct fb_ops
Date: Wed, 15 Nov 2023 11:19:05 +0100
Message-ID: <20231115102954.7102-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-3.00)[-1.000]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the remaining fbdev drivers to use fbdev's helpers macros
for struct fb_ops. Then push the current default code for file-I/O
operations into a module and remove it as default. Each driver now
selects the helpers its needs for file I/O and drawing to its
framebuffer. If no helper has been set for an operation in struct
fb_ops, the operation is unsupported. Once applied, fbdev drivers
will not include unnecessary helper code. The helpers will also be
more robust against mis-use.

The first 2 patches are bug fixes. Patches 3 to 26 modify fbdev
drivers to set up their fb_ops structures correctly and select the
necessary helpers.

Patches 27 and 28 do a few additional minor cleanups.

Patches 29 to 32 move all helpers for struct fb_ops into modules
and drop the default. Helpers also warn if they operate on the
wrong type of framebuffer memory. Framebuffers in I/O memory and
system memory can only be used with the correct helper functions.

Thomas Zimmermann (32):
  fbdev/acornfb: Fix name of fb_ops initializer macro
  fbdev/sm712fb: Use correct initializer macros for struct fb_ops
  fbdev/vfb: Set FBINFO_VIRTFB flag
  fbdev/vfb: Initialize fb_ops with fbdev macros
  fbdev/arcfb: Set FBINFO_VIRTFB flag
  fbdev/arcfb: Use generator macros for deferred I/O
  auxdisplay/cfag12864bfb: Set FBINFO_VIRTFB flag
  auxdisplay/cfag12864bfb: Initialize fb_ops with fbdev macros
  auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
  auxdisplay/ht16k33: Initialize fb_ops with fbdev macros
  hid/picolcd_fb: Set FBINFO_VIRTFB flag
  fbdev/sh_mobile_lcdcfb: Set FBINFO_VIRTFB flag
  fbdev/sh_mobile_lcdcfb: Initialize fb_ops with fbdev macros
  fbdev/smscufx: Select correct helpers
  fbdev/udlfb: Select correct helpers
  fbdev/au1200fb: Set FBINFO_VIRTFB flag
  fbdev/au1200fb: Initialize fb_ops with fbdev macros
  fbdev/ps3fb: Set FBINFO_VIRTFB flag
  fbdev/ps3fb: Initialize fb_ops with fbdev macros
  media/ivtvfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/clps711x-fb: Initialize fb_ops with fbdev macros
  fbdev/vt8500lcdfb: Initialize fb_ops with fbdev macros
  fbdev/wm8505fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/cyber2000fb: Initialize fb_ops with fbdev macros
  staging/sm750fb: Declare fb_ops as constant
  staging/sm750fb: Initialize fb_ops with fbdev macros
  fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
  fbdev: Remove trailing whitespaces
  fbdev: Push pgprot_decrypted() into mmap implementations
  fbdev: Move default fb_mmap code into helper function
  fbdev: Warn on incorrect framebuffer access
  fbdev: Remove default file-I/O implementations

 drivers/auxdisplay/Kconfig                    |  10 +-
 drivers/auxdisplay/cfag12864bfb.c             |  10 +-
 drivers/auxdisplay/ht16k33.c                  |  10 +-
 drivers/hid/hid-picolcd_fb.c                  |   1 +
 drivers/media/pci/ivtv/Kconfig                |   4 +-
 drivers/media/pci/ivtv/ivtvfb.c               |   6 +-
 drivers/staging/sm750fb/sm750.c               |  65 ++++++++--
 drivers/video/fbdev/Kconfig                   |  50 ++------
 drivers/video/fbdev/acornfb.c                 |   2 +-
 drivers/video/fbdev/amba-clcd.c               |   2 +
 drivers/video/fbdev/arcfb.c                   | 114 +++++-------------
 drivers/video/fbdev/au1100fb.c                |   2 +
 drivers/video/fbdev/au1200fb.c                |  11 +-
 drivers/video/fbdev/clps711x-fb.c             |   4 +-
 drivers/video/fbdev/core/Kconfig              |   7 +-
 drivers/video/fbdev/core/Makefile             |   2 +-
 drivers/video/fbdev/core/cfbcopyarea.c        |   3 +
 drivers/video/fbdev/core/cfbfillrect.c        |   3 +
 drivers/video/fbdev/core/cfbimgblt.c          |   3 +
 drivers/video/fbdev/core/fb_chrdev.c          |  68 ++---------
 drivers/video/fbdev/core/fb_defio.c           |   2 +
 drivers/video/fbdev/core/fb_io_fops.c         |  36 ++++++
 drivers/video/fbdev/core/fb_sys_fops.c        |   6 +
 drivers/video/fbdev/core/syscopyarea.c        |   3 +
 drivers/video/fbdev/core/sysfillrect.c        |   3 +
 drivers/video/fbdev/core/sysimgblt.c          |   3 +
 drivers/video/fbdev/cyber2000fb.c             |   9 +-
 drivers/video/fbdev/ep93xx-fb.c               |   2 +
 drivers/video/fbdev/gbefb.c                   |   2 +
 drivers/video/fbdev/omap/omapfb_main.c        |   2 +
 .../video/fbdev/omap2/omapfb/omapfb-main.c    |   2 +
 drivers/video/fbdev/ps3fb.c                   |  11 +-
 drivers/video/fbdev/sa1100fb.c                |   2 +
 drivers/video/fbdev/sbuslib.c                 |   5 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  16 +--
 drivers/video/fbdev/sm712fb.c                 |   6 +-
 drivers/video/fbdev/smscufx.c                 |   2 +
 drivers/video/fbdev/udlfb.c                   |   2 +
 drivers/video/fbdev/vermilion/vermilion.c     |   2 +
 drivers/video/fbdev/vfb.c                     |  10 +-
 drivers/video/fbdev/vt8500lcdfb.c             |   4 +-
 drivers/video/fbdev/wm8505fb.c                |   2 +
 include/linux/fb.h                            |  11 +-
 43 files changed, 254 insertions(+), 266 deletions(-)


base-commit: ab54663d6cd21c6748f91c1cc0fe3456d4e38ce6
-- 
2.42.0

