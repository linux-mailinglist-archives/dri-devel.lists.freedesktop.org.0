Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0577D6260
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B33110E563;
	Wed, 25 Oct 2023 07:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595CB10E55E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:24:05 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7faa:e55:54a:cff])
 by xavier.telenet-ops.be with bizsmtp
 id 27Q32B0085Uc89d017Q3JX; Wed, 25 Oct 2023 09:24:03 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qvYFA-007Sbt-43;
 Wed, 25 Oct 2023 09:24:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qvYFG-00Bs65-UF;
 Wed, 25 Oct 2023 09:24:02 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v3 1/9] intel: improve checks for big-endian
Date: Wed, 25 Oct 2023 09:23:41 +0200
Message-Id: <8d8973cf288f774220642563afedffb0508a208b.1698217235.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698217235.git.geert@linux-m68k.org>
References: <cover.1698217235.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  - sparc64-linux-gnu-gcc does not define __BIG_ENDIAN__ or SPARC, but
    does define __sparc__, hence replace the check for SPARC by a check
    for __sparc__,
  - powerpc{,64,64}-linux-gnu-gcc does not define __ppc__ or __ppc64__,
    but does define __BIG_ENDIAN__.
    powerpc64le-linux-gnu-gcc does not define __ppc__ or __ppc64__, but
    does define __LITTLE_ENDIAN__.
    Hence remove the checks for __ppc__ and __ppc64__.
  - arm-linux-gnueabi-gcc and aarch64-linux-gnu-gcc do not define
    __BIG_ENDIAN__ for targets in big-endian mode, but do define
    __ARM_BIG_ENDIAN, so add a check for the latter,
  - m68k-linux-gnu-gcc does not define __BIG_ENDIAN__, but does define
    __mc68000__, so add a check for the latter,
  - mips{,64}-linux-gnu{,abi64}-gcc does not define __BIG_ENDIAN__, but
    does define __MIPSEB__, so add a check for the latter,
  - s390x-linux-gnu-gcc does not define __BIG_ENDIAN__, but does define
    __s390__, so add a check for the latter,
  - hppa{,64}-linux-gnu-gcc, microblaze-linux-gcc, and sh4-linux-gnu-gcc
    in big-endian mode do define __BIG_ENDIAN__, and thus should work
    out-of-the-box.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - No changes,

v2:
  - Add arm, aarch64, microblaze, s390, and sh.
---
 intel/uthash.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/intel/uthash.h b/intel/uthash.h
index 45d1f9fc12a1d6f9..a8465f23ff9fbcac 100644
--- a/intel/uthash.h
+++ b/intel/uthash.h
@@ -648,7 +648,7 @@ do {
 #define MUR_PLUS2_ALIGNED(p) (((unsigned long)p & 3UL) == 2UL)
 #define MUR_PLUS3_ALIGNED(p) (((unsigned long)p & 3UL) == 3UL)
 #define WP(p) ((uint32_t*)((unsigned long)(p) & ~3UL))
-#if (defined(__BIG_ENDIAN__) || defined(SPARC) || defined(__ppc__) || defined(__ppc64__))
+#if (defined(__BIG_ENDIAN__) || defined(__ARM_BIG_ENDIAN) || defined(__mc68000__) || defined(__MIPSEB__) || defined(__s390__) || defined(__sparc__))
 #define MUR_THREE_ONE(p) ((((*WP(p))&0x00ffffff) << 8) | (((*(WP(p)+1))&0xff000000) >> 24))
 #define MUR_TWO_TWO(p)   ((((*WP(p))&0x0000ffff) <<16) | (((*(WP(p)+1))&0xffff0000) >> 16))
 #define MUR_ONE_THREE(p) ((((*WP(p))&0x000000ff) <<24) | (((*(WP(p)+1))&0xffffff00) >>  8))
-- 
2.34.1

