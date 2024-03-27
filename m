Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5A88F050
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 21:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BA4112012;
	Wed, 27 Mar 2024 20:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J5DnRALO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qKAtjPYe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J5DnRALO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qKAtjPYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E59112011
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 20:44:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18AAC229DB;
 Wed, 27 Mar 2024 20:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711572297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvNYpjPCMP3bY8u5dBMnCwR0tl6uUjrhgXbs0rKvAd0=;
 b=J5DnRALO8oxp1paKt25KLzQ/CWLNr0nEdbAXmUacLVmFY6BetSYDsDGtJbDgzF6nh3pI11
 bir5J0VQ5Thx0TUrKUf0lp3V6ZLwiYVhjiiZNEiGKxv5sW0Kt/jDdaBuWNiuoOGZhO7KdK
 5JSNjhEuVdoOHCc4X9YHLcIA/wtS1FI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711572297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvNYpjPCMP3bY8u5dBMnCwR0tl6uUjrhgXbs0rKvAd0=;
 b=qKAtjPYe0YZLjXfM54u9I6bl6MmSDiPCLddSbLHuhcjvV51ZGW/oSYV4yrQi3yrAwbUSek
 buJJaf1BirRZUxAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711572297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvNYpjPCMP3bY8u5dBMnCwR0tl6uUjrhgXbs0rKvAd0=;
 b=J5DnRALO8oxp1paKt25KLzQ/CWLNr0nEdbAXmUacLVmFY6BetSYDsDGtJbDgzF6nh3pI11
 bir5J0VQ5Thx0TUrKUf0lp3V6ZLwiYVhjiiZNEiGKxv5sW0Kt/jDdaBuWNiuoOGZhO7KdK
 5JSNjhEuVdoOHCc4X9YHLcIA/wtS1FI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711572297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvNYpjPCMP3bY8u5dBMnCwR0tl6uUjrhgXbs0rKvAd0=;
 b=qKAtjPYe0YZLjXfM54u9I6bl6MmSDiPCLddSbLHuhcjvV51ZGW/oSYV4yrQi3yrAwbUSek
 buJJaf1BirRZUxAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 898E313AB3;
 Wed, 27 Mar 2024 20:44:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id E2GmH0iFBGZ2FQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Mar 2024 20:44:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de, javierm@redhat.com, deller@gmx.de, sui.jingfeng@linux.dev
Cc: linux-arch@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] arch: Remove fbdev dependency from video helpers
Date: Wed, 27 Mar 2024 21:41:28 +0100
Message-ID: <20240327204450.14914-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=J5DnRALO;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qKAtjPYe
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[arndb.de,redhat.com,gmx.de,linux.dev];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[18]; MID_CONTAINS_FROM(1.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: 18AAC229DB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make architecture helpers for display functionality depend on general
video functionality instead of fbdev. This avoids the dependency on
fbdev and makes the functionality available for non-fbdev code.

Patch 1 replaces the variety of Kconfig options that control the
Makefiles with CONFIG_VIDEO. More fine-grained control of the build
can then be done within each video/ directory; see parisc for an
example.

Patch 2 replaces fb_is_primary_device() with video_is_primary_device(),
which has no dependencies on fbdev. The implementation remains identical
on all affected platforms. There's one minor change in fbcon, which is
the only caller of fb_is_primary_device().

Patch 3 renames the source and files from fbdev to video.

v2:
- improve cover letter
- rebase onto v6.9-rc1

Thomas Zimmermann (3):
  arch: Select fbdev helpers with CONFIG_VIDEO
  arch: Remove struct fb_info from video helpers
  arch: Rename fbdev header and source files

 arch/arc/include/asm/fb.h                    |  8 ------
 arch/arc/include/asm/video.h                 |  8 ++++++
 arch/arm/include/asm/fb.h                    |  6 -----
 arch/arm/include/asm/video.h                 |  6 +++++
 arch/arm64/include/asm/fb.h                  | 10 --------
 arch/arm64/include/asm/video.h               | 10 ++++++++
 arch/loongarch/include/asm/{fb.h => video.h} |  8 +++---
 arch/m68k/include/asm/{fb.h => video.h}      |  8 +++---
 arch/mips/include/asm/{fb.h => video.h}      | 12 ++++-----
 arch/parisc/Makefile                         |  2 +-
 arch/parisc/include/asm/fb.h                 | 14 -----------
 arch/parisc/include/asm/video.h              | 16 ++++++++++++
 arch/parisc/video/Makefile                   |  2 +-
 arch/parisc/video/{fbdev.c => video-sti.c}   |  9 ++++---
 arch/powerpc/include/asm/{fb.h => video.h}   |  8 +++---
 arch/powerpc/kernel/pci-common.c             |  2 +-
 arch/sh/include/asm/fb.h                     |  7 ------
 arch/sh/include/asm/video.h                  |  7 ++++++
 arch/sparc/Makefile                          |  4 +--
 arch/sparc/include/asm/{fb.h => video.h}     | 15 +++++------
 arch/sparc/video/Makefile                    |  2 +-
 arch/sparc/video/fbdev.c                     | 26 --------------------
 arch/sparc/video/video.c                     | 25 +++++++++++++++++++
 arch/x86/Makefile                            |  2 +-
 arch/x86/include/asm/fb.h                    | 19 --------------
 arch/x86/include/asm/video.h                 | 21 ++++++++++++++++
 arch/x86/video/Makefile                      |  3 ++-
 arch/x86/video/{fbdev.c => video.c}          | 21 +++++++---------
 drivers/video/fbdev/core/fbcon.c             |  2 +-
 include/asm-generic/Kbuild                   |  2 +-
 include/asm-generic/{fb.h => video.h}        | 17 +++++++------
 include/linux/fb.h                           |  2 +-
 32 files changed, 154 insertions(+), 150 deletions(-)
 delete mode 100644 arch/arc/include/asm/fb.h
 create mode 100644 arch/arc/include/asm/video.h
 delete mode 100644 arch/arm/include/asm/fb.h
 create mode 100644 arch/arm/include/asm/video.h
 delete mode 100644 arch/arm64/include/asm/fb.h
 create mode 100644 arch/arm64/include/asm/video.h
 rename arch/loongarch/include/asm/{fb.h => video.h} (86%)
 rename arch/m68k/include/asm/{fb.h => video.h} (86%)
 rename arch/mips/include/asm/{fb.h => video.h} (76%)
 delete mode 100644 arch/parisc/include/asm/fb.h
 create mode 100644 arch/parisc/include/asm/video.h
 rename arch/parisc/video/{fbdev.c => video-sti.c} (78%)
 rename arch/powerpc/include/asm/{fb.h => video.h} (76%)
 delete mode 100644 arch/sh/include/asm/fb.h
 create mode 100644 arch/sh/include/asm/video.h
 rename arch/sparc/include/asm/{fb.h => video.h} (75%)
 delete mode 100644 arch/sparc/video/fbdev.c
 create mode 100644 arch/sparc/video/video.c
 delete mode 100644 arch/x86/include/asm/fb.h
 create mode 100644 arch/x86/include/asm/video.h
 rename arch/x86/video/{fbdev.c => video.c} (66%)
 rename include/asm-generic/{fb.h => video.h} (89%)

-- 
2.44.0

