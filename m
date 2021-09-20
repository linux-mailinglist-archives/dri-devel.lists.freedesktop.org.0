Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662FF411427
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 14:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0AB6E4C1;
	Mon, 20 Sep 2021 12:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1476E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 12:17:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D66860EB2;
 Mon, 20 Sep 2021 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632140252;
 bh=KgTqk1gSTq17sQT/2tIQgwIKULSbIMoi53KBq2fW1bw=;
 h=From:To:Cc:Subject:Date:From;
 b=S0yyYRkmJHq1+qDL8ZMbCZT0fIEQ/79B++xY98bOEQ05Ux3e22PN4f1rO2iIwFMzG
 Y/cLzh4fqW/UcPRWCQTFIvrCuunbeBdGRzy6ZDkUm6LP7wChwjTVNIJ3lMMwYEmUnt
 pLIyxSqmbr77LMoBcYD0cIhqvAs6CY/1DD7B6c/aSIsrxqzeNtiWXEakMpAVtRVgPB
 tQlKRY945gh/WYlSO0voQFNWapSWM6cPRskOVU4nyXhqK4OA/fWUCYfA/lbcyaaXeO
 G9HVPDd+5xbB59TOUdI0nUAnt5RZrVuFyv672T3dIybnrXF8N0cix53CRyqAjyY8Tc
 E9iyAT2kq5grg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 "David S. Miller" <davem@davemloft.net>
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
Subject: [PATCH] agp: define proper stubs for empty helpers
Date: Mon, 20 Sep 2021 14:17:19 +0200
Message-Id: <20210920121728.94045-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The empty unmap_page_from_agp() macro causes a warning when
building with 'make W=1' on a couple of architectures:

drivers/char/agp/generic.c: In function 'agp_generic_destroy_page':
drivers/char/agp/generic.c:1265:28: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
 1265 |   unmap_page_from_agp(page);

Change the definitions to a 'do { } while (0)' construct to
make these more reliable.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/include/asm/agp.h  | 4 ++--
 arch/powerpc/include/asm/agp.h | 4 ++--
 arch/sparc/include/asm/agp.h   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/include/asm/agp.h b/arch/parisc/include/asm/agp.h
index cb04470e63d0..14ae54cfd368 100644
--- a/arch/parisc/include/asm/agp.h
+++ b/arch/parisc/include/asm/agp.h
@@ -8,8 +8,8 @@
  *
  */
 
-#define map_page_into_agp(page)		/* nothing */
-#define unmap_page_from_agp(page)	/* nothing */
+#define map_page_into_agp(page)		do { } while (0)
+#define unmap_page_from_agp(page)	do { } while (0)
 #define flush_agp_cache()		mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */
diff --git a/arch/powerpc/include/asm/agp.h b/arch/powerpc/include/asm/agp.h
index b29b1186f819..6b6485c988dd 100644
--- a/arch/powerpc/include/asm/agp.h
+++ b/arch/powerpc/include/asm/agp.h
@@ -5,8 +5,8 @@
 
 #include <asm/io.h>
 
-#define map_page_into_agp(page)
-#define unmap_page_from_agp(page)
+#define map_page_into_agp(page) do {} while (0)
+#define unmap_page_from_agp(page) do {} while (0)
 #define flush_agp_cache() mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */
diff --git a/arch/sparc/include/asm/agp.h b/arch/sparc/include/asm/agp.h
index efe0d6a12e5a..2d0ff84cee3f 100644
--- a/arch/sparc/include/asm/agp.h
+++ b/arch/sparc/include/asm/agp.h
@@ -4,9 +4,9 @@
 
 /* dummy for now */
 
-#define map_page_into_agp(page)
-#define unmap_page_from_agp(page)
-#define flush_agp_cache() mb()
+#define map_page_into_agp(page)		do { } while (0)
+#define unmap_page_from_agp(page)	do { } while (0)
+#define flush_agp_cache()		mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */
 #define alloc_gatt_pages(order)		\
-- 
2.29.2

