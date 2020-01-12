Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0C13872D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 18:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9B889449;
	Sun, 12 Jan 2020 17:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BC489449
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 17:15:27 +0000 (UTC)
Received: from ramsan ([84.195.182.253])
 by baptiste.telenet-ops.be with bizsmtp
 id pVFN2100D5USYZQ01VFNDa; Sun, 12 Jan 2020 18:15:24 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iqgpe-0008HY-Ab; Sun, 12 Jan 2020 18:15:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iqgpe-0005qj-9J; Sun, 12 Jan 2020 18:15:22 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] fbdev: c2p: Use BUILD_BUG() instead of custom solution
Date: Sun, 12 Jan 2020 18:15:21 +0100
Message-Id: <20200112171521.22443-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the call to the custom non-existing function by a standard
BUILD_BUG() invocation.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/c2p_core.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/c2p_core.h b/drivers/video/fbdev/c2p_core.h
index 45a6d895a7d7208e..cf5f1ebce65e6afd 100644
--- a/drivers/video/fbdev/c2p_core.h
+++ b/drivers/video/fbdev/c2p_core.h
@@ -12,6 +12,8 @@
  *  for more details.
  */
 
+#include <linux/build_bug.h>
+
 
     /*
      *  Basic transpose step
@@ -27,8 +29,6 @@ static inline void _transp(u32 d[], unsigned int i1, unsigned int i2,
 }
 
 
-extern void c2p_unsupported(void);
-
 static __always_inline u32 get_mask(unsigned int n)
 {
 	switch (n) {
@@ -48,7 +48,7 @@ static __always_inline u32 get_mask(unsigned int n)
 		return 0x0000ffff;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 	return 0;
 }
 
@@ -91,7 +91,7 @@ static __always_inline void transp8(u32 d[], unsigned int n, unsigned int m)
 		return;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 }
 
 
@@ -118,7 +118,7 @@ static __always_inline void transp4(u32 d[], unsigned int n, unsigned int m)
 		return;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 }
 
 
@@ -138,7 +138,7 @@ static __always_inline void transp4x(u32 d[], unsigned int n, unsigned int m)
 		return;
 	}
 
-	c2p_unsupported();
+	BUILD_BUG();
 }
 
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
