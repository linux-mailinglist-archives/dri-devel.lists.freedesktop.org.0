Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D597AABBC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1068A10E630;
	Fri, 22 Sep 2023 08:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D9410E632
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 08:06:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87CFD21A5F;
 Fri, 22 Sep 2023 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695369999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3QG+Cze+W0LpO1aDFCtgFLHS4SODZxsd/R/X5eIOTlU=;
 b=pElCaexwLmft9z34QjV0bzmtxtKzDsDLCxo5VgIM6UI0sFPwl3B9ji5o80pjtcOwa4U7DX
 rTm1e+a3Q3iSDWTA1jH2VUxsM/mBWEdpKFWZHkt9u4FYSB8bltOMPvvuR6RfdnQ9oE7grP
 Dmu7x3q2h9eEwGAFpV/U5jojyMyX9UY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695369999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3QG+Cze+W0LpO1aDFCtgFLHS4SODZxsd/R/X5eIOTlU=;
 b=gmwV4JxQlf2vKildHti7H7hkuL2p+5TVGx5H4GNtJdTiifsS19PFTdlL4bc1ui9KBPCMAo
 zXG3/ru7KMV/IgBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43B4913597;
 Fri, 22 Sep 2023 08:06:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n/+oDw9LDWXuMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Sep 2023 08:06:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de, javierm@redhat.com
Subject: [PATCH v5 0/5] ppc, fbdev: Clean up fbdev mmap helper
Date: Fri, 22 Sep 2023 10:04:54 +0200
Message-ID: <20230922080636.26762-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v5:
	* improve commit descriptions (Javier)
	* add missing tags (Geert)
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


base-commit: f8d21cb17a99b75862196036bb4bb93ee9637b74
-- 
2.42.0

