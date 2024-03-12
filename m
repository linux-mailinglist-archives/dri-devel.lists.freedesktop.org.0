Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66228799B5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7066112F48;
	Tue, 12 Mar 2024 17:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P8lkbcH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9C5112F2E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:44 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1dd6198c4e2so41209375ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710263023; x=1710867823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mb4FmIopiSO+/3QwXjaWJkazatuyJXVbnhhdOwFBf/s=;
 b=P8lkbcH3HhLLvrMGvwFb1Qfo6leO6g3bzxEw563oPA64lJq9I/NhrSvlPG7vkj2Ii3
 +S3ipSt1/67l+mPQmKZETzyi+Uibw0NqgmZKH17MJVX/kSTeoL3SwnIHJ17kJzhSaRDw
 ohf5p3IBDA09jjPbhVwbAwarmhJIGdKscNzlEunFG2WRHfRRY2aICqEvtQWkYphsLQQE
 drZZ5DXg9Ng8GIjHnR8mL5h+paN9lw6UgNrZRC5kswgDIVIeNJweIJowEfQYE9iTONiY
 2wkiRNIim0HrsdkF2E5mzz6VQ2XoLR+ePFJ6+LL240IJ8LEKdUjGLtqVaZwHzOr8q5B+
 vgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710263024; x=1710867824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mb4FmIopiSO+/3QwXjaWJkazatuyJXVbnhhdOwFBf/s=;
 b=GDXVYFA21ZBL8EVBnsIYJw9XOBD16e92IfZPmSeJfgvjXyriCRb2spO9lPqqntcj+U
 C/EGeiRxovG1rI8yvUTK4/g+Q1wIlAIzpupNypzFj/jFa9s7RJys+6xhtcck/seokpTz
 yCUjePX+c5Neo/FmXaje1oNZHQmV1yR3OjY7P01r2j0Kcb55aZZOyLb+pjYIJJMBLK9p
 BVKO+Te0VodrXxKQA8tTKk/l3cq9LTLauIs6gaAkY1SdrSOjWJ4jKA6fWunDhnp6hDs8
 RYSkfCkdb6CsTmURp5VCYuXCyqJLRafDVRFPxXa4Njsx+TCYnsQczxdyK/jeKLdra7TF
 v0bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Omhe2jmkmbiGB+u18oYsd2ouQFVs6ANKtd6Nrh5H/6Mu0ZRVMYjFal88DiM9+XELP18Y39MUJB5FlCOZpllDAu5q1I/Om5wJpYXQA9zK
X-Gm-Message-State: AOJu0YyEjuTowmwI0y0jAwBNi7OZuBEOa+gEhBMpc1YiQ+FOwrfuVuaR
 xpodD8vXkKlZe8FJ4awCqx7mArqluCeFMcv4zJzpAVIB4CSvUcN4
X-Google-Smtp-Source: AGHT+IESK+W76sbv32507e8vr+AETbi9zHy7dM6LrGga9gr4qnmj+9kyX8nY1a/g+A7cAY64N5ru0w==
X-Received: by 2002:a17:902:edd0:b0:1dc:a8aa:3c86 with SMTP id
 q16-20020a170902edd000b001dca8aa3c86mr9530991plk.5.1710263023689; 
 Tue, 12 Mar 2024 10:03:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a170902d11100b001dca68b97d3sm6991774plw.44.2024.03.12.10.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:43 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/14] riscv: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:08 -0700
Message-Id: <20240312170309.2546362-14-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..8955ee5c1c27 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -30,26 +30,39 @@
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
 #else
-#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%1)
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	__BUG_REL(%0) "\n\t"		\
+	__BUG_FUNC_PTR "\n\t"		\
+	RISCV_SHORT " %2\n\t"		\
+	RISCV_SHORT " %3"
 #else
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	RISCV_SHORT " %3"
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ (					\
@@ -58,10 +71,11 @@ do {								\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
 			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
+			".org 2b + %4\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (__FILE__), "i" (__BUG_FUNC),		\
+		  "i" (__LINE__),				\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-- 
2.39.2

