Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CDA7FA07B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2892910E271;
	Mon, 27 Nov 2023 13:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A027110E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4406921DB0;
 Mon, 27 Nov 2023 13:17:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DE2A132A6;
 Mon, 27 Nov 2023 13:17:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mIAkBsyWZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 00/32] fbdev: Modularize helpers for struct fb_ops
Date: Mon, 27 Nov 2023 14:15:29 +0100
Message-ID: <20231127131655.4020-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Score: 5.58
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de; dkim=none;
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: 4406921DB0
X-Spam-Flag: NO
X-Spam-Level: *****
X-Spamd-Result: default: False [5.58 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.14)[-0.689];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_SPAM_LONG(0.92)[0.264];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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

v2:
	* warn once if I/O callbacks are missing (Javier)

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
 include/linux/fb.h                            |  16 ++-
 43 files changed, 259 insertions(+), 266 deletions(-)

-- 
2.43.0

