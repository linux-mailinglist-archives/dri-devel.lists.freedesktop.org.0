Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B9CD21FF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 23:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0667110F0F3;
	Fri, 19 Dec 2025 22:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qi2gCD/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3013310F0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 22:40:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16528402FC;
 Fri, 19 Dec 2025 22:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18457C113D0;
 Fri, 19 Dec 2025 22:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766184044;
 bh=uAEpBNv+CmgIxmDyHDHgY/r2XzHv2JsQOvxnxQ6j1fI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Qi2gCD/zXBNO6PpRplvsyMGPz4YlZ4NQsZq6oJc4WREI1MKf9btW+c0LqUWho8zCy
 fMUJ9C7ItN8pdGW9Gg8DiDfbpfqgCcS0ceHQLNXiPQ1xDlDri08JV54M9xr8hrLRgk
 xbKpWZrLZMJaAP7JqFYbI0RPXwx7nswt3hlY7Sp99Ul9uCbLKS6kyqRnA0Mhpep8mN
 qgMibLS2l3Fk/tPA5vPv08KDPTLUA9HhCHBEIuCvJN1dU9uux0k8V0nSUmjz4OaiEC
 MubUbbeHUPFKXNiwdNWROxW4MWuMXgCraVGscMz47UftT+HOFKoj4U3Sz2V/nftcZL
 ibYGLe4brERxg==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Fri, 19 Dec 2025 23:39:48 +0100
Subject: [PATCH v2 4/4] minmax: remove useless cast in __is_nonneg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
References: <20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org>
In-Reply-To: <20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=uAEpBNv+CmgIxmDyHDHgY/r2XzHv2JsQOvxnxQ6j1fI=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJmuVzxNZFtvnF3k4jDx27zFjimNTiyq3zXCrI4nRH1+V
 dqSvLm1YyILgxgXg6WYIsuyck5uhY5C77BDfy1h5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Qx0gk4GLUwCm+qE0w1/pFp3T5387dN47sNlnk0aYYfO5KfZrjk1svKgoPkVqdfY1RoatvjXXS3i
 WnCzmPbUxuFEsZoJjz2mdlXX9B/btOBj4dRYnAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

The function like macro __is_nonneg() casts its argument to (long long)
in an attempt to silence -Wtype-limits warnings on unsigned values.

But this workaround is incomplete as proven here:

  $ cat foo.c
  #include <linux/minmax.h>

  int foo(unsigned int a)
  {
  	return __is_nonneg(a);
  }
  $ make CFLAGS_KERNEL="-Wtype-limits" foo.o
    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    CC      foo.o
  foo.c: In function 'foo':
  ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
     68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
        |                                                         ^~
  ./include/linux/compiler.h:350:50: note: in definition of macro 'statically_true'
    350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
        |                                                  ^
  foo.c:5:16: note: in expansion of macro '__is_nonneg'
      5 |         return __is_nonneg(a);
        |                ^~~~~~~~~~~
  ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
     68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
        |                                                         ^~
  ./include/linux/compiler.h:350:57: note: in definition of macro 'statically_true'
    350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
        |                                                         ^
  foo.c:5:16: note: in expansion of macro '__is_nonneg'
      5 |         return __is_nonneg(a);
        |                ^~~~~~~~~~~

And because -Wtype-limits is now globally disabled, such a workaround
now becomes useless. Remove the __is_nonneg()'s cast and its related
comment.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changelog:

  v1 -> v2: new patch
---
 include/linux/minmax.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index a0158db54a04..3e2e3e539ba1 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -52,9 +52,6 @@
 /*
  * Check whether a signed value is always non-negative.
  *
- * A cast is needed to avoid any warnings from values that aren't signed
- * integer types (in which case the result doesn't matter).
- *
  * On 64-bit any integer or pointer type can safely be cast to 'long long'.
  * But on 32-bit we need to avoid warnings about casting pointers to integers
  * of different sizes without truncating 64-bit values so 'long' or 'long long'
@@ -65,7 +62,7 @@
  * but they are handled by the !is_signed_type() case).
  */
 #if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__
-#define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
+#define __is_nonneg(ux) statically_true((ux) >= 0)
 #else
 #define __is_nonneg(ux) statically_true( \
 	(typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)

-- 
2.51.2

