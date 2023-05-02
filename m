Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D812F6F4468
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE4E10E34E;
	Tue,  2 May 2023 13:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE45810E34E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 13:02:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B905921F7C;
 Tue,  2 May 2023 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683032545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4/HqMKMsbulxem0YZHptZtjI0v2zedDTIGVljFbx4A0=;
 b=0/jQzGQjxcsbLoXKHnJlmsUT3JVv9NcXNh8VApsEzclPgvqXiOMOMMUZX42s6shx2N3wH5
 WKHaUtVeQypvLRNNq5+GiVa4PzEli+F2Vu0ozdPBwnWfJ7TE/B8ck8OEhS+oYSIR6iBLCA
 bcVHsdu2aNC7jCqqUglALcBQKHVFWvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683032545;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4/HqMKMsbulxem0YZHptZtjI0v2zedDTIGVljFbx4A0=;
 b=pr+0WmwF1A765+pq5Lr5jvAUfbVCp6UWP2ciA0hJDFgk5xiDi/CqmkpdDug/1NYyvo/HBE
 9l77+O3JrXAysKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58447134FB;
 Tue,  2 May 2023 13:02:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tiGhFOEJUWRYTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 02 May 2023 13:02:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
Subject: [PATCH v3 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Date: Tue,  2 May 2023 15:02:17 +0200
Message-Id: <20230502130223.14719-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(was: fbdev: Use regular I/O function for framebuffers)

Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
depends on the architecture, but they are all equivalent to regular
I/O functions of similar names. So use regular functions instead and
move all helpers into <asm-generic/fb.h>

The first patch a simple whitespace cleanup.

Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
will go away patches 2 to 4 prepare include statements in the various
drivers. Source files that use regular I/O helpers, such as readl(),
now include <linux/io.h>. Source files that use framebuffer I/O
helpers, such as fb_readl(), also include <asm/fb.h>.

Patch 5 replaces the architecture-based if-else branching in 
<linux/fb.h> by helpers in <asm-generic/fb.h>. All helpers use Linux'
existing I/O functions.

Patch 6 harmonizes naming among fbdev and existing I/O functions.

The patchset has been built for a variety of platforms, such as x86-64,
arm, aarch64, ppc64, parisc, m64k, mips and sparc.

v3:
	* add the new helpers in <asm-generic/fb.h>
	* support reordering and native byte order (Geert, Arnd)
v2:
	* use Linux I/O helpers (Sam, Arnd)

Thomas Zimmermann (6):
  fbdev/matrox: Remove trailing whitespaces
  ipu-v3: Include <linux/io.h>
  fbdev: Include <linux/io.h> in various drivers
  fbdev: Include <linux/io.h> via <asm/fb.h>
  fbdev: Move framebuffer I/O helpers into <asm/fb.h>
  fbdev: Rename fb_mem*() helpers

 drivers/gpu/ipu-v3/ipu-prv.h                |   1 +
 drivers/video/fbdev/arcfb.c                 |   1 +
 drivers/video/fbdev/arkfb.c                 |   2 +
 drivers/video/fbdev/aty/atyfb.h             |   2 +
 drivers/video/fbdev/aty/mach64_cursor.c     |   4 +-
 drivers/video/fbdev/chipsfb.c               |   3 +-
 drivers/video/fbdev/cirrusfb.c              |   2 +
 drivers/video/fbdev/core/cfbcopyarea.c      |   2 +-
 drivers/video/fbdev/core/cfbfillrect.c      |   1 +
 drivers/video/fbdev/core/cfbimgblt.c        |   1 +
 drivers/video/fbdev/core/fbmem.c            |   4 +-
 drivers/video/fbdev/core/svgalib.c          |   3 +-
 drivers/video/fbdev/cyber2000fb.c           |   2 +
 drivers/video/fbdev/ep93xx-fb.c             |   2 +
 drivers/video/fbdev/hgafb.c                 |   3 +-
 drivers/video/fbdev/hitfb.c                 |   2 +-
 drivers/video/fbdev/kyro/fbdev.c            |   5 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c |   8 +-
 drivers/video/fbdev/matrox/matroxfb_base.h  |   6 +-
 drivers/video/fbdev/pm2fb.c                 |   3 +
 drivers/video/fbdev/pm3fb.c                 |   2 +
 drivers/video/fbdev/pvr2fb.c                |   4 +-
 drivers/video/fbdev/s3fb.c                  |   2 +
 drivers/video/fbdev/sm712fb.c               |   2 +
 drivers/video/fbdev/sstfb.c                 |   4 +-
 drivers/video/fbdev/stifb.c                 |   6 +-
 drivers/video/fbdev/tdfxfb.c                |   5 +-
 drivers/video/fbdev/tridentfb.c             |   2 +
 drivers/video/fbdev/vga16fb.c               |   3 +-
 drivers/video/fbdev/vt8623fb.c              |   2 +
 drivers/video/fbdev/wmt_ge_rops.c           |   2 +
 include/asm-generic/fb.h                    | 102 ++++++++++++++++++++
 include/linux/fb.h                          |  53 ----------
 33 files changed, 167 insertions(+), 79 deletions(-)

-- 
2.40.1

