Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE03EFB0E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63726E3FE;
	Wed, 18 Aug 2021 06:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F876E405
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:06:03 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id j1so1924030pjv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=24kJIAEB6l7w/rhOBw7zIER4xYF+Qa9/jIWUD7WdGH8=;
 b=CAUQzirnqpaXsXvaOdsMkZHpuIpR3JhaBPR3ggeDgaq18XJdg2yqZnMCtyB/cc27j3
 BZ5GJkqG5ou8T5gobo5mo/ZBkQ/dTaPrBm9NhLud7PzgXgmMF3l0zcwK/JcOFM6/b+XF
 nM/3QdEhrpGIxmU5xIPT00h7TLrBixDXsWwdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=24kJIAEB6l7w/rhOBw7zIER4xYF+Qa9/jIWUD7WdGH8=;
 b=iTr1B0L1EOJ/Bc1DTkHQKwBdJgAt9RzPX1H1F1/NRf7uGfdlphocaDIABCDQpyWjLY
 HUqB46lz7+rTFchm0gb1FFsh5kXhJVrBDCM0dr7NEMyHNlhUR39B2FXCs0K5PU/VmF+x
 7WB4Lwe7okeRQAS/evvinu2iHqjaAVfoSCWbpULEefineRqXHlLH68K9MjVfzspOuUW/
 LJ53/IjWOsnhqtkibs47swKejQzf16m0QIU+U9iDZvmGuVTO3PvAstGuWsidoqOPo7My
 7PXKTFTPCd3dAD4RNlddgP3C3/dEh3Gb//veUpMHrU1KSyzVwlcQLjcd24jFaA0ydogL
 ANiw==
X-Gm-Message-State: AOAM533ygtfBecEVr/rl5YVZ0g4gsrP2o9xO4DBuk178/Okk2T6FLfc4
 s+lv0Rhb5yqrw6d7jn60GPl1Og==
X-Google-Smtp-Source: ABdhPJw9tsazysLIZ4O0HIEYqZJyN/LtFV1XCD5WQBCwUvHyi+03vebL9EIRXOwVxHVE2g9yDaoK1Q==
X-Received: by 2002:a17:90a:17a8:: with SMTP id
 q37mr4764229pja.177.1629266763527; 
 Tue, 17 Aug 2021 23:06:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r16sm4015029pje.10.2021.08.17.23.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:06:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 35/63] fortify: Detect struct member overflows in memmove()
 at compile-time
Date: Tue, 17 Aug 2021 23:05:05 -0700
Message-Id: <20210818060533.3569517-36-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3921; h=from:subject;
 bh=Sc9iLSXfmFAQB6MEpEEuTn+7NF3Srx3T0CPKcvxZXTU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMldDKLxaagYEOz2y02LQlqkNv+irs+MsEpzkMu
 3MdrhsSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJQAKCRCJcvTf3G3AJvDuD/
 wKE56AIL4EP7Vjz/QS5YbzobA7gkvOJu4dByH3vGhD9uwSz2raqgiS3N5zizAS9MSzKWvBQ85esh09
 6sm/qa0W3g3z2D8hmZ9qQxrmxx9p6YL6HNlmwGIzYzeaTmzot8reJM1FI2V5fY1FoCKnId33EqbK06
 vqaiAkMJyUkqy2YrdaS/D/HgN0HLmJDdiroxYBt1R8yVDAYBjyJvrr/8wk9JyAVLKiYY/jIfyWbg2c
 E5+sdvJ/2KKN5V6glg0K8IYFw4en5EXtjm44p7v2bhXKdErI0NqzapP+ztt5zhbTW8RzB7WZkbDp07
 M0C/0rGk9rC34jGkNKto2nWPpipLIdU/eyZamr4A1LpeEA9hoguUtw/AAdnoO8mpdh7lGfxJZSHpqI
 Xg1U7m/fXv3nA1hWCphA2+k4XAdbf8fEQXSNPaEjroJbLDdocMcTLm01NCjGJ1X1xWeJ7tfjMvYNVc
 GbnZyJ47Ronjn0frwpKfRajoJfHpRFabO0kCXXgg+hxxb4UFvycYPsT3STVNF3NOHjyT9TUYT5VFW+
 goL1hLcifbtfSqElh/fEtLY2DakkjO1Dml7F0gtwpJ0l15ZJmjLRtJXZ9RQ64AvLssTCVqTOwdf0YU
 CxAFNcJrYg9+l28nNI8luHr7I5sEMyS1JBVMEIMDHSgcoWOw+oBMyQU79SwQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

As done for memcpy(), also update memmove() to use the same tightened
compile-time checks under CONFIG_FORTIFY_SOURCE.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/boot/compressed/misc.c               |  3 ++-
 arch/x86/lib/memcpy_32.c                      |  1 +
 include/linux/fortify-string.h                | 21 ++++---------------
 .../read_overflow2_field-memmove.c            |  5 +++++
 .../write_overflow_field-memmove.c            |  5 +++++
 5 files changed, 17 insertions(+), 18 deletions(-)
 create mode 100644 lib/test_fortify/read_overflow2_field-memmove.c
 create mode 100644 lib/test_fortify/write_overflow_field-memmove.c

diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 743f13ea25c1..83ff4354970e 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -34,10 +34,11 @@
  * try to define their own functions if these are not defined as macros.
  */
 #define memzero(s, n)	memset((s), 0, (n))
+#ifndef memmove
 #define memmove		memmove
-
 /* Functions used by the included decompressor code below. */
 void *memmove(void *dest, const void *src, size_t n);
+#endif
 
 /*
  * This is set up by the setup-routine at boot-time
diff --git a/arch/x86/lib/memcpy_32.c b/arch/x86/lib/memcpy_32.c
index e565d1c9019e..f19b7fd07f04 100644
--- a/arch/x86/lib/memcpy_32.c
+++ b/arch/x86/lib/memcpy_32.c
@@ -4,6 +4,7 @@
 
 #undef memcpy
 #undef memset
+#undef memmove
 
 __visible void *memcpy(void *to, const void *from, size_t n)
 {
diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 25943442f532..0120d463ba33 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -307,22 +307,10 @@ __FORTIFY_INLINE void fortify_memcpy_chk(__kernel_size_t size,
 		__builtin_object_size(p, 0), __builtin_object_size(q, 0), \
 		__builtin_object_size(p, 1), __builtin_object_size(q, 1), \
 		memcpy)
-
-__FORTIFY_INLINE void *memmove(void *p, const void *q, __kernel_size_t size)
-{
-	size_t p_size = __builtin_object_size(p, 0);
-	size_t q_size = __builtin_object_size(q, 0);
-
-	if (__builtin_constant_p(size)) {
-		if (p_size < size)
-			__write_overflow();
-		if (q_size < size)
-			__read_overflow2();
-	}
-	if (p_size < size || q_size < size)
-		fortify_panic(__func__);
-	return __underlying_memmove(p, q, size);
-}
+#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,			\
+		__builtin_object_size(p, 0), __builtin_object_size(q, 0), \
+		__builtin_object_size(p, 1), __builtin_object_size(q, 1), \
+		memmove)
 
 extern void *__real_memscan(void *, int, __kernel_size_t) __RENAME(memscan);
 __FORTIFY_INLINE void *memscan(void *p, int c, __kernel_size_t size)
@@ -411,7 +399,6 @@ __FORTIFY_INLINE char *strcpy(char *p, const char *q)
 /* Don't use these outside the FORITFY_SOURCE implementation */
 #undef __underlying_memchr
 #undef __underlying_memcmp
-#undef __underlying_memmove
 #undef __underlying_memset
 #undef __underlying_strcat
 #undef __underlying_strcpy
diff --git a/lib/test_fortify/read_overflow2_field-memmove.c b/lib/test_fortify/read_overflow2_field-memmove.c
new file mode 100644
index 000000000000..6cc2724c8f62
--- /dev/null
+++ b/lib/test_fortify/read_overflow2_field-memmove.c
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define TEST	\
+	memmove(large, instance.buf, sizeof(instance.buf) + 1)
+
+#include "test_fortify.h"
diff --git a/lib/test_fortify/write_overflow_field-memmove.c b/lib/test_fortify/write_overflow_field-memmove.c
new file mode 100644
index 000000000000..377fcf9bb2fd
--- /dev/null
+++ b/lib/test_fortify/write_overflow_field-memmove.c
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define TEST	\
+	memmove(instance.buf, large, sizeof(instance.buf) + 1)
+
+#include "test_fortify.h"
-- 
2.30.2

