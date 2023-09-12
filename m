Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC579D2BA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 15:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2638C10E040;
	Tue, 12 Sep 2023 13:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391C10E040
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 13:50:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D06A8215E6;
 Tue, 12 Sep 2023 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694526651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jfsfCbmV4CKGMsiOpxVuXT74O5izS3toa2d723Akmmw=;
 b=m64W3uS2e57d3w4nffiJw2Fh7RVuCjr7bt3J7GNJYSsYTztKgQqHhgk+45ttX69+ok4VVh
 yw99bbZNMAnHVuSsmonUkgR2O2L9e14Mofs81IpcD5l45rxYbx5zcOxWmbHcFcOYwP/nct
 o5C2uHBJHXRzpiqUOohiTj85xw8bFlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694526651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jfsfCbmV4CKGMsiOpxVuXT74O5izS3toa2d723Akmmw=;
 b=IeqafxgshLUoUAVGjmtdVjMjQk111anVIYX6bOmlE+8+ZaBBtGpsXakjueIXBxBxqhg67j
 VlS2K9Xq+v6m1vDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 934DD139DB;
 Tue, 12 Sep 2023 13:50:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 55MhI7tsAGVKQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Sep 2023 13:50:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de
Subject: [PATCH v4 0/5] ppc, fbdev: Clean up fbdev mmap helper
Date: Tue, 12 Sep 2023 15:48:58 +0200
Message-ID: <20230912135050.17155-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
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
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up and rename fb_pgprotect() to work without struct file. Then
refactor the implementation for PowerPC. This change has been discussed
at [1] in the context of refactoring fbdev's mmap code.

The first two patches update fbdev and replace fbdev's fb_pgprotect()
with pgprot_framebuffer() on all architectures. The new helper's stream-
lined interface enables more refactoring within fbdev's mmap
implementation.

Patches 3 to 5 adapt PowerPC's internal interfaces to provide
phys_mem_access_prot() that works without struct file. Neither the
architecture code or fbdev helpers need the parameter.

v4:
	* fix commit message (Christophe)
v3:
	* rename fb_pgrotect() to pgprot_framebuffer() (Arnd)
v2:
	* reorder patches to simplify merging (Michael)

[1] https://lore.kernel.org/linuxppc-dev/5501ba80-bdb0-6344-16b0-0466a950f82c@suse.com/

Thomas Zimmermann (5):
  fbdev: Avoid file argument in fb_pgprotect()
  fbdev: Replace fb_pgprotect() with pgprot_framebuffer()
  arch/powerpc: Remove trailing whitespaces
  arch/powerpc: Remove file parameter from phys_mem_access_prot code
  arch/powerpc: Call internal __phys_mem_access_prot() in fbdev code

 arch/ia64/include/asm/fb.h                | 15 +++++++--------
 arch/m68k/include/asm/fb.h                | 19 ++++++++++---------
 arch/mips/include/asm/fb.h                | 11 +++++------
 arch/powerpc/include/asm/book3s/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/fb.h             | 13 +++++--------
 arch/powerpc/include/asm/machdep.h        | 13 ++++++-------
 arch/powerpc/include/asm/nohash/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/pci.h            |  4 +---
 arch/powerpc/kernel/pci-common.c          |  3 +--
 arch/powerpc/mm/mem.c                     |  8 ++++----
 arch/sparc/include/asm/fb.h               | 15 +++++++++------
 arch/x86/include/asm/fb.h                 | 10 ++++++----
 arch/x86/video/fbdev.c                    | 15 ++++++++-------
 drivers/video/fbdev/core/fb_chrdev.c      |  3 ++-
 include/asm-generic/fb.h                  | 12 ++++++------
 15 files changed, 86 insertions(+), 75 deletions(-)

-- 
2.42.0

