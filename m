Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 260933EFBBB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F486E430;
	Wed, 18 Aug 2021 06:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CC86E419
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:24 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c17so1171058plz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRODLTs8x0Qtm/Ptv5tWUChhln5VJpkNvKJjBk8/td0=;
 b=XzrlZ/y5zwdpS/YJfRaa7Pon4GvdH7CLIrvdHg1SwgGSYlKhjRZ3TGVbYl9Uz2EMR6
 DmEOD2KhxAa3t0uuDB86CMHd3fOUJumBVJBOXOji0V55L+ZC8vnyAlvKeCi+xG9eP7b+
 sNyj58Ru/pj7AqU9rwaxc3vtA/ktDXFAaliyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRODLTs8x0Qtm/Ptv5tWUChhln5VJpkNvKJjBk8/td0=;
 b=iCRjgIV4tRpdOlxlosLOsWra4THghX+6jalna8uAHQ0fmt3+9EXCYzCSvIwCSRfIoD
 rywpzvS9hucnAg93SaEiiyBPJ4MyW1MZrBihBlv3jVtOuvj35SqAvB1LlsTFoyLDkoTM
 +Fc8623EOrePOJUKQAoaXhxi4yMn5skD0nHew75mZOYc9Zaqvn8QZbNNzayBQaEmASZr
 I7TvjQ5oXcLFZgEy96+qXEH0IhxifnvT8hpZcUthdI7uF3wR7qNvJU4AwwAXxz74zIR+
 0dAHH0V8oW5fcSVNBt3LZb9qGda9PCB/H8BC+TS1oiJdrRpsbtVcPiW1HuK3j75y0UDT
 NcGg==
X-Gm-Message-State: AOAM5310gg+SyyQPNHrLhhMPbrH2HBWP48fRr7n+ND0v01Nn3pW5FoxP
 BoNnOar43dDq7EvtDi6giuxXUg==
X-Google-Smtp-Source: ABdhPJw2O2kfFvEOnoehfcZ59jDqdYXp3MteV8gF92EfkMnChHRROnoigwIWoeiy+ab3LBtOKRgccQ==
X-Received: by 2002:a17:90a:9f93:: with SMTP id
 o19mr7581672pjp.166.1629267264063; 
 Tue, 17 Aug 2021 23:14:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j13sm5326102pgp.29.2021.08.17.23.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Sedat Dilek <sedat.dilek@gmail.com>, Will Deacon <will@kernel.org>,
 Marco Elver <elver@google.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 25/63] compiler_types.h: Remove __compiletime_object_size()
Date: Tue, 17 Aug 2021 23:04:55 -0700
Message-Id: <20210818060533.3569517-26-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2922; h=from:subject;
 bh=MDjEPu+0JYKYu2Xmf51UoTuGhtFMUlaN8gkl0rN2LiE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMjfBwoewCUYNgCuB0jumG0NCJivrA+YgTkE1KH
 MccXxVSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjIwAKCRCJcvTf3G3AJm3mEA
 C1cBGrrgs2la3rIyvrEHW+BRoF9MD1FEFa9+24jUy+7EhTKj5KuskH2wadAz6TmifU9D+cLgGgfC/n
 amHBb++ivEXxSJhc4y91umgpxGq1S8LFyrlOWOgZqtGNwFOE4L+A6hPQOzVfQqImZrKbUsXQiOTxQF
 7grjdlvdZoEFDWPebAGQTCgPQNbtVYVKWoz7N0rUF0q+U6KKngVHIiryXSBI7/jo7JX1xs7kwTa5yb
 j5ABB3DV0p5m3h+eGdK/o4dtNK3lb7ccrpoMB2vKnfDPiunmk9/NFQdWQDhhPGB20LOuYWqb2DMI5F
 8ra6j3oQzxzlnAmyDYk0Ooa7tUqhfIXEiH7BoEFHO1Labygo8HuW7nnfy2MT+oXLprIG0my4K40djX
 27uS65O8HaTRBABOICKEnhMZCAjtBXHZrTzmpy/IjAFCLLdhJ/jhsknAVr4PuO4MNgfpjTce+yDc2f
 q9P+f7KqhEZTR5/XfPySXV6MEI82XEMO1yyRrSeCAUKNaSpY90jIcOl+jIvBSF1AlFB5Heg/LRjEc5
 2Rgx7CjVAVaOJW15x45Insq5iN40SQ3HKQy3SVHVdQwKifffNqMWgk4LPRATYF7inKbMWmxUlWu57e
 y9Y+fqktoIPFyiL5IUhAbNoDS4ngHbm3l04H/saAMuvQX3Z78YJ6a+2ACeqw==
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

Since all compilers support __builtin_object_size(), and there is only
one user of __compiletime_object_size, remove it to avoid the needless
indirection. This lets Clang reason about check_copy_size() correctly.

Link: https://github.com/ClangBuiltLinux/linux/issues/1179
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler-gcc.h   | 2 --
 include/linux/compiler_types.h | 4 ----
 include/linux/thread_info.h    | 2 +-
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index cb9217fc60af..01985821944b 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -41,8 +41,6 @@
 
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
 
-#define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
-
 #define __compiletime_warning(message) __attribute__((__warning__(message)))
 #define __compiletime_error(message) __attribute__((__error__(message)))
 
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index e4ea86fc584d..c43308b0a9a9 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -290,10 +290,6 @@ struct ftrace_likely_data {
 	(sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
 	 sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
 
-/* Compile time object size, -1 for unknown */
-#ifndef __compiletime_object_size
-# define __compiletime_object_size(obj) -1
-#endif
 #ifndef __compiletime_warning
 # define __compiletime_warning(message)
 #endif
diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index 0999f6317978..ad0c4e041030 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -203,7 +203,7 @@ static inline void copy_overflow(int size, unsigned long count)
 static __always_inline __must_check bool
 check_copy_size(const void *addr, size_t bytes, bool is_source)
 {
-	int sz = __compiletime_object_size(addr);
+	int sz = __builtin_object_size(addr, 0);
 	if (unlikely(sz >= 0 && sz < bytes)) {
 		if (!__builtin_constant_p(bytes))
 			copy_overflow(sz, bytes);
-- 
2.30.2

