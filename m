Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFABE4D08E8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858D210E282;
	Mon,  7 Mar 2022 20:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C104410E284
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by albert.telenet-ops.be with bizsmtp
 id 3Ytm2700A1Yj8bA06Ytmfi; Mon, 07 Mar 2022 21:53:46 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKMU-0036UX-1G; Mon, 07 Mar 2022 21:53:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKMT-0034o1-GF; Mon, 07 Mar 2022 21:53:45 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC libdrm 1/2] intel: Improve checks for big-endian
Date: Mon,  7 Mar 2022 21:53:41 +0100
Message-Id: <9a2d5522f15688981783c5f113563c2bb562568d.1646684158.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646684158.git.geert@linux-m68k.org>
References: <cover.1646684158.git.geert@linux-m68k.org>
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
  - mips{,64}-linux-gnu{,abi64}-gcc does not define __BIG_ENDIAN__, but
    does define __MIPSEB__, so add a check for the latter,
  - m68k-linux-gnu-gcc does not define __BIG_ENDIAN__, but does define
    __mc68000__, so add a check for the latter,
  - hppa{,64}-linux-gnu-gcc defines __BIG_ENDIAN__, and thus should work
    out-of-the-box.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Untested due to lack of hardware.
---
 intel/uthash.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/intel/uthash.h b/intel/uthash.h
index 45d1f9fc12a1d6f9..0f5480be6e8ca033 100644
--- a/intel/uthash.h
+++ b/intel/uthash.h
@@ -648,7 +648,7 @@ do {
 #define MUR_PLUS2_ALIGNED(p) (((unsigned long)p & 3UL) == 2UL)
 #define MUR_PLUS3_ALIGNED(p) (((unsigned long)p & 3UL) == 3UL)
 #define WP(p) ((uint32_t*)((unsigned long)(p) & ~3UL))
-#if (defined(__BIG_ENDIAN__) || defined(SPARC) || defined(__ppc__) || defined(__ppc64__))
+#if (defined(__BIG_ENDIAN__) || defined(__sparc__) || defined(__mc68000__) || defined(__MIPSEB__))
 #define MUR_THREE_ONE(p) ((((*WP(p))&0x00ffffff) << 8) | (((*(WP(p)+1))&0xff000000) >> 24))
 #define MUR_TWO_TWO(p)   ((((*WP(p))&0x0000ffff) <<16) | (((*(WP(p)+1))&0xffff0000) >> 16))
 #define MUR_ONE_THREE(p) ((((*WP(p))&0x000000ff) <<24) | (((*(WP(p)+1))&0xffffff00) >>  8))
-- 
2.25.1

