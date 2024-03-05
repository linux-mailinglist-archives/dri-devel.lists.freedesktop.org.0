Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0088726C4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71B7112C35;
	Tue,  5 Mar 2024 18:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G90Kchoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8010112C31
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 18:40:47 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5d8b887bb0cso21070a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709664047; x=1710268847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4kJHu3fBz5LPQvfwmucSB/iYHSk7Pg2H6338a3feOI=;
 b=G90KchoeTA4jFt8UE7II70YI+kI1sv2SmQc2K3LhnpO5/pe3qE0Z6j/cVqugf+m7NJ
 ahNx3BavJeWVxg+f1GGJDhyZOSzmnVZcEBg1e1Owzejko5ZmvVWOLQVM68RjvxBzYuxx
 aSjfFg6/ME6PAEKtTdjDhzb/IwXQmc7sAn6BwMkVC9/z/WinhpaP3/FxzoxnOLmAUtfC
 vZNlEqryDv8P7PpFpUxumBdxif7G7OIL3zbkh7Rrpw5MhR7z3vEjZFZSWLdZlS08SKpP
 GeLe8AaPY2A1lCqYhej+axRP9mh8WcRpzCkE9eB6oSx/nVgY0wzUdhZct+9IjHol0QGU
 +QKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709664047; x=1710268847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y4kJHu3fBz5LPQvfwmucSB/iYHSk7Pg2H6338a3feOI=;
 b=oQoOlKcxCOB2ZP5tWHZk2b6o6Lg76jGbHOzs8EU4IPwZAypInSUUix/CQUBP9GBIeu
 vXzNpBtMQcKqknsq4ACqw1fdQV+mB/sg6lvr89pHfUq5EPfyfYy7nD5WM2hxPbyMrCQq
 vcVahXW4C/mj3gVDvUmN/0Xwa21fzGZ/sMSpDWczaeBv2jfbOk/fSbFj6MVk53tzylyd
 +gLjRcIJFon+5vyLbhDXgJbeRSAfb4k2gBeddA2oeDl3erH4llv3Monnk4f0aHkDPdIp
 z5cKWO84LKKSXqm6O1S3WSnUkh/SUJnkXwi6A6fFeL39O6dfvoimWcL2st5ko/QAjHzf
 vnPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRrYt0c2tib6YalbhzqpvcBct/r7sUbbyGijnq2bg83we0XrZvH5xXpUyKHcA57VFKDwdBVC2F+5SU9tTnIXipW+ZsrSI8Hha3Ph9VFhBw
X-Gm-Message-State: AOJu0Yw5EOrUdaSx7djuAhRwy6XqkhoDQYQhdNBqNyFyjDB+iaA6UKns
 fkOcPLinVi3Bm0H6MqkBKfZ483aAsqX0SnyHATClY7Ug5CPWIr4x
X-Google-Smtp-Source: AGHT+IGTfVPApclyxUmAiyfZJFqyRfWQG5YrbUAWT/3uN8yhUmW/yeT/8jOIW+3RMo740Xw+nhtrew==
X-Received: by 2002:a17:90a:fb81:b0:29a:f0eb:221f with SMTP id
 cp1-20020a17090afb8100b0029af0eb221fmr10745887pjb.10.1709664047094; 
 Tue, 05 Mar 2024 10:40:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a3d0800b00299be0e00c1sm13136391pjc.33.2024.03.05.10.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:40:46 -0800 (PST)
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 3/5] x86: Add support for suppressing warning tracebacks
Date: Tue,  5 Mar 2024 10:40:31 -0800
Message-Id: <20240305184033.425294-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
References: <20240305184033.425294-1-linux@roeck-us.net>
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

Add support for selectively suppressing WARNING tracebacks to x86.
This requires adding the function triggering tracebacks to the __bug_table
object section.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..8e45143fa676 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -21,6 +21,15 @@
 # define __BUG_REL(val)	".long " __stringify(val) " - ."
 #endif
 
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
 #define _BUG_FLAGS(ins, flags, extra)					\
@@ -29,12 +38,13 @@ do {									\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
+		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
+		     "\t.word %c2"        "\t# bug_entry::line\n"	\
+		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
+		     "\t.org 2b+%c4\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -80,7 +90,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);		\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2

