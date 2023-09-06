Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90950793F45
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731EB89C49;
	Wed,  6 Sep 2023 14:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA5D89C49
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:48:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E378223E0;
 Wed,  6 Sep 2023 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694011683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Xszo7pVQPpJh90SLFXOt6v5MNEZ/ZQ3nkgwWLVKnV3E=;
 b=VnvrsjwdldkLT17VDCpbL3NG7Oy+CIPU7/5bo8GBz/XkAo+GqnyaqKuGPlibTul1z1J6x4
 tYhUEG+3pErCzHf03/eCEfEJWO6G4BH25TZ8fkilYuPd7DFRMqvt9JDPKevskE8fU7nQrt
 v4TxktDxvpRcuRwgRewsDKxJuLOr2yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694011683;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Xszo7pVQPpJh90SLFXOt6v5MNEZ/ZQ3nkgwWLVKnV3E=;
 b=hSuIDwDftuch5IMFzYWbOYpDgDGgJx9OauQALOjjevzDFMLOAPxjPb3awmGulXWXbSipr6
 kE73v3Zybw2dBnAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B4BD1346C;
 Wed,  6 Sep 2023 14:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NzaxBSOR+GSNSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 14:48:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de
Subject: [PATCH v2 0/5] ppc, fbdev: Clean up fbdev mmap helper
Date: Wed,  6 Sep 2023 16:35:01 +0200
Message-ID: <20230906144801.25297-1-tzimmermann@suse.de>
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
refactor the implemnetation for PowerPC. This change has been discussed
at [1] in the context of refactoring fbdev's mmap code.

The first two patches update fbdev and replace fbdev's fb_pgprotect()
with fb_pgprot_device() on all architectures. The new helper's stream-
lined interface enables more refactoring within fbdev's mmap
implementation.

Patches 3 to 5 adapt PowerPC's internal interfaces to provide
phys_mem_access_prot() that works without struct file. Neither the
architecture code or fbdev helpers need the parameter.

v2:
	* reorder patches to simplify merging (Michael)

[1] https://lore.kernel.org/linuxppc-dev/5501ba80-bdb0-6344-16b0-0466a950f82c@suse.com/

Thomas Zimmermann (5):
  fbdev: Avoid file argument in fb_pgprotect()
  fbdev: Replace fb_pgprotect() with fb_pgprot_device()
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

