Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01F7425AF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47C910E18D;
	Thu, 29 Jun 2023 12:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1D10E18D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 12:19:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D30A41FD64;
 Thu, 29 Jun 2023 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688041195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4OXpvb/zG5KxleDjQO59blDnCWqFfIAhLgAtrL7NVY=;
 b=i9tojsqES2QC/qquHYUduiHTvKM/o2z/RvVrScPmnss/Wdpfc1J8AgYAxsShSe/L6fYT9Y
 7FKNYHoHceSj+8mLJIQHIb+BY/XjPBkp5yhtd0KOIYPXpIqSZ6hSLBi6xqY1JazJYIi+Eb
 gaKXUb1B5TosrsgCJYwvoV7PpYW+BMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688041195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4OXpvb/zG5KxleDjQO59blDnCWqFfIAhLgAtrL7NVY=;
 b=I9+YCVJOZ9ZGuHYgzDJK7LoqYWQPRbVAa5291fSN3Cmi2kbDsJnhF71kCDmXLS5Vh94PSm
 QiCAtZG1UTuNHQDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D5F813A43;
 Thu, 29 Jun 2023 12:19:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CJvwEet2nWRlVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:19:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 01/12] efi: Do not include <linux/screen_info.h> from EFI
 header
Date: Thu, 29 Jun 2023 13:45:40 +0200
Message-ID: <20230629121952.10559-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The header file <linux/efi.h> does not need anything from
<linux/screen_info.h>. Declare struct screen_info and remove
the include statements. Update a number of source files that
require struct screen_info's definition.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm/kernel/efi.c                         | 2 ++
 arch/arm64/kernel/efi.c                       | 1 +
 drivers/firmware/efi/libstub/efi-stub-entry.c | 2 ++
 drivers/firmware/efi/libstub/screen_info.c    | 2 ++
 include/linux/efi.h                           | 3 ++-
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/efi.c b/arch/arm/kernel/efi.c
index e2b9d2618c672..e94655ef16bb3 100644
--- a/arch/arm/kernel/efi.c
+++ b/arch/arm/kernel/efi.c
@@ -5,6 +5,8 @@
 
 #include <linux/efi.h>
 #include <linux/memblock.h>
+#include <linux/screen_info.h>
+
 #include <asm/efi.h>
 #include <asm/mach/map.h>
 #include <asm/mmu_context.h>
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index baab8dd3ead3c..3afbe503b066f 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -9,6 +9,7 @@
 
 #include <linux/efi.h>
 #include <linux/init.h>
+#include <linux/screen_info.h>
 
 #include <asm/efi.h>
 #include <asm/stacktrace.h>
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index cc4dcaea67fa6..2f1902e5d4075 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/efi.h>
+#include <linux/screen_info.h>
+
 #include <asm/efi.h>
 
 #include "efistub.h"
diff --git a/drivers/firmware/efi/libstub/screen_info.c b/drivers/firmware/efi/libstub/screen_info.c
index 4be1c4d1f922b..a51ec201ca3cb 100644
--- a/drivers/firmware/efi/libstub/screen_info.c
+++ b/drivers/firmware/efi/libstub/screen_info.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/efi.h>
+#include <linux/screen_info.h>
+
 #include <asm/efi.h>
 
 #include "efistub.h"
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 571d1a6e1b744..360895a5572c0 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -24,10 +24,11 @@
 #include <linux/range.h>
 #include <linux/reboot.h>
 #include <linux/uuid.h>
-#include <linux/screen_info.h>
 
 #include <asm/page.h>
 
+struct screen_info;
+
 #define EFI_SUCCESS		0
 #define EFI_LOAD_ERROR		( 1 | (1UL << (BITS_PER_LONG-1)))
 #define EFI_INVALID_PARAMETER	( 2 | (1UL << (BITS_PER_LONG-1)))
-- 
2.41.0

