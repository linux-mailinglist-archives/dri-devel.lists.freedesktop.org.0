Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99632A56E41
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FFE10EBFD;
	Fri,  7 Mar 2025 16:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="So9/WBJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026FF10EBEC;
 Fri,  7 Mar 2025 16:49:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72D7C5C5C85;
 Fri,  7 Mar 2025 16:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8163C4CEE7;
 Fri,  7 Mar 2025 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741366178;
 bh=T0dfwHR/2LfRy2z/ETM/K8t+pj1hKkcGhIgMcsf1tKw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=So9/WBJaQxMeS9wKNK9eH21bbk9akWGxMAX5qk576ssAsUPGdfUzWzRX6vGcPU+wa
 FODEHojLho2s/cZ1rw0/LBqDOffxxjaH3VXUkx1O38/nzxLny4RmxYNfUfnIJGfisM
 6lFU181x4L1lsEHLAOxDH7H59NzaBY0X/88AsWIVfAy7fNBk6MZRAQRPHvEzqqYGBM
 4j1CCn/rcouqkgQjMVRyZBAJEyvuGmxXmmmmQeCQCPCElpvTdE8CyVl7/WtswyBjWH
 Bx3+ECXnSwREVkOLd13NSuu1mV6ZzHNiAq0bUn/RIWqtypl9FVHNVfN0BA31e2z/BT
 eLMpyOMr4z0IQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D2C2DC28B24;
 Fri,  7 Mar 2025 16:49:37 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Sat, 08 Mar 2025 01:48:48 +0900
Subject: [PATCH v6 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-fixed-type-genmasks-v6-1-f59315e73c29@wanadoo.fr>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
In-Reply-To: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
To: Yury Norov <yury.norov@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 David Laight <David.Laight@ACULAB.COM>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=2ijCJ+qw0jfzboZxKgI8J/jy8JT43FFLJ0yuTEFM44w=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmnlTunnCv9zr3pwBOh9TGv2PYsu7/2aUZu26ULy/fMb
 zntmze/vaOUhUGMi0FWTJFlWTknt0JHoXfYob+WMHNYmUCGMHBxCsBEAhoYGX75b/xTdMR6/7yd
 ujGPpy+e6tGwMrQ95L90871uuydNsrsY/ukc/m1a1Wb/5aXU48c6mrV9DlonX/29KnX92Z5Nu7W
 uWLACAA==
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Reply-To: mailhol.vincent@wanadoo.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

In an upcoming change, GENMASK() and its friends will indirectly
depend on sizeof() which is not available in asm.

Instead of adding further complexity to __GENMASK() to make it work
for both asm and non asm, just split the definition of the two
variants.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v5 -> v6:

    - Restore the comment saying that BUILD_BUG_ON() is not available in asm
      code.

  v4 -> v5:

    - Use tab indentations instead of single space to separate the
      macro name from its body.

  v3 -> v4:

    - New patch in the series
---
 include/linux/bits.h | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 14fd0ca9a6cd17339dd2f69e449558312a8a001b..9c1c7ce0bba6bb09490d891904c143a5394fd512 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -19,23 +19,17 @@
  * GENMASK_ULL(39, 21) gives us the 64bit vector 0x000000ffffe00000.
  */
 #if !defined(__ASSEMBLY__)
+
 #include <linux/build_bug.h>
 #include <linux/compiler.h>
+
 #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
-#else
-/*
- * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
- * disable the input check if that is the case.
- */
-#define GENMASK_INPUT_CHECK(h, l) 0
-#endif
 
 #define GENMASK(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
 #define GENMASK_ULL(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
 
-#if !defined(__ASSEMBLY__)
 /*
  * Missing asm support
  *
@@ -48,6 +42,16 @@
  */
 #define GENMASK_U128(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U128(h, l))
-#endif
+
+#else /* defined(__ASSEMBLY__) */
+
+/*
+ * BUILD_BUG_ON_ZERO() is not available in h files included from asm files, so
+ * no input checks in assembly.
+ */
+#define GENMASK(h, l)		__GENMASK(h, l)
+#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)
+
+#endif /* !defined(__ASSEMBLY__) */
 
 #endif	/* __LINUX_BITS_H */

-- 
2.45.3


