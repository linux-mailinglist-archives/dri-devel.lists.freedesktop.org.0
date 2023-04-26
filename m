Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D46EF4DD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 15:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8858610E981;
	Wed, 26 Apr 2023 13:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E125D10E985
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 13:04:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2B2A1FDC9;
 Wed, 26 Apr 2023 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682514263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZvaBzh3f/aiqD52UlKjdoNF7+qwuUVn7MUgqdP2D7Nw=;
 b=UUB5WwTLuJwXSoCTJ3K7FRWI3bAowE0MAQQnTQ8Woqr9jGn3KSm4fv+l+btYHt/SEzCsD6
 E6Tz3qvcxaYsO0Ane3YO3a66YgThKstJIJ4Lgjadjm2nGBl3KNTyxPMpou9Mnyuqc/adAL
 KiMTTGQM90NhVMGC3ytJZ9AIyukntHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682514263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZvaBzh3f/aiqD52UlKjdoNF7+qwuUVn7MUgqdP2D7Nw=;
 b=5Y5kjboljw7Gn1Hlnhprb8RfDWvqxVjp+TudZAikLk9S5eG7QO9FJaa/ij7yCLSwcYk6Zr
 niVmZqqNbyCVxQAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86AF6138F0;
 Wed, 26 Apr 2023 13:04:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eEa6H1YhSWSBMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 13:04:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de
Subject: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Date: Wed, 26 Apr 2023 15:04:15 +0200
Message-Id: <20230426130420.19942-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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

Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
depends on the architecture. It's still all located in fbdev's main
header file <linux/fb.h>. Move all of it into each archtecture's
<asm/fb.h>, with shared code in <asm-generic/fb.h>.

The first patch a simple whitespace cleanup.

Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
will go away patches 2 to 4 prepare include statements in the various
drivers. Source files that use regular I/O helpers, such as readl(),
now include <linux/io.h>. Source files that use framebuffer I/O
helpers, such as fb_readl(), now include <asm/fb.h>. The latter now
includes <linux/io.h> internally.

Patch 5 moves the framebuffer I/O helpers from <linux/fb.h> into
the various architecture headers. The common case, where the framebuffer
is located in I/O memory, serves as the generic implemenation.

The patchset has been built for a variety of platforms, such as x86-64,
arm, aarch64, ppc64, parisc, m64k, mips and sparc.

Thomas Zimmermann (5):
  fbdev/matrox: Remove trailing whitespaces
  ipu-v3: Include <linux/io.h>
  fbdev: Include <linux/io.h> in various drivers
  fbdev: Include <linux/io.h> via <asm/fb.h>
  fbdev: Move framebuffer I/O helpers into <asm/fb.h>

 arch/arc/include/asm/fb.h                   | 29 +++++++
 arch/ia64/include/asm/fb.h                  | 28 +++++++
 arch/loongarch/include/asm/fb.h             | 29 +++++++
 arch/m68k/include/asm/fb.h                  | 29 +++++++
 arch/sparc/include/asm/fb.h                 | 77 +++++++++++++++++
 drivers/gpu/ipu-v3/ipu-prv.h                |  1 +
 drivers/video/fbdev/arcfb.c                 |  1 +
 drivers/video/fbdev/arkfb.c                 |  2 +
 drivers/video/fbdev/aty/atyfb.h             |  2 +
 drivers/video/fbdev/aty/mach64_cursor.c     |  2 +-
 drivers/video/fbdev/chipsfb.c               |  1 +
 drivers/video/fbdev/cirrusfb.c              |  2 +
 drivers/video/fbdev/core/cfbcopyarea.c      |  2 +-
 drivers/video/fbdev/core/cfbfillrect.c      |  1 +
 drivers/video/fbdev/core/cfbimgblt.c        |  1 +
 drivers/video/fbdev/core/svgalib.c          |  3 +-
 drivers/video/fbdev/cyber2000fb.c           |  2 +
 drivers/video/fbdev/ep93xx-fb.c             |  2 +
 drivers/video/fbdev/hgafb.c                 |  3 +-
 drivers/video/fbdev/hitfb.c                 |  2 +-
 drivers/video/fbdev/kyro/fbdev.c            |  3 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c |  8 +-
 drivers/video/fbdev/matrox/matroxfb_base.h  |  6 +-
 drivers/video/fbdev/pm2fb.c                 |  3 +
 drivers/video/fbdev/pm3fb.c                 |  2 +
 drivers/video/fbdev/pvr2fb.c                |  2 +
 drivers/video/fbdev/s3fb.c                  |  2 +
 drivers/video/fbdev/sm712fb.c               |  2 +
 drivers/video/fbdev/sstfb.c                 |  2 +-
 drivers/video/fbdev/stifb.c                 |  2 +
 drivers/video/fbdev/tdfxfb.c                |  3 +-
 drivers/video/fbdev/tridentfb.c             |  2 +
 drivers/video/fbdev/vga16fb.c               |  3 +-
 drivers/video/fbdev/vt8623fb.c              |  2 +
 drivers/video/fbdev/wmt_ge_rops.c           |  2 +
 include/asm-generic/fb.h                    | 93 +++++++++++++++++++++
 include/linux/fb.h                          | 53 ------------
 37 files changed, 340 insertions(+), 69 deletions(-)

-- 
2.40.0

