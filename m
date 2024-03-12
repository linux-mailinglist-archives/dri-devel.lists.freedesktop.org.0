Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7378799B4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B30112F47;
	Tue, 12 Mar 2024 17:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b1dwyhz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA9C112F38
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:46 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso43842505ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710263026; x=1710867826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6JeHPuNf2fPfe8/IgMEBFCbi+8s7x8ZP+Ypz6wTBFE=;
 b=b1dwyhz3SpGOYvwHv4vkHX9eFrCWypP5klKvve4jOnM74gtaA7q27vc4cJiDji2iIb
 V6DnNXaPuGfw4SMNt+OszYgqaFJJdXKizOQscsjS/Prf14ma0HU6RlCqcKM1iuUXleSs
 rrrRuc+21IK89zihh4QQELk3ryIpnO57JckvVbyaCrFUD7fklt6DWWQyAgcAr/+1IJ9J
 UZYxqWx2AuV+XT2zEJbKWfsS7P/DRzc8YfyJc9tgfjRgxhmt25XFnjCjJW91aPXcJ1Dp
 rtFtKWT8ZuApBtz4Jfwg1Jx+coYgVfAoxjFSkrhryIFhYiQ7NTDDirzeinJ/8LC0kpnQ
 HKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710263026; x=1710867826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f6JeHPuNf2fPfe8/IgMEBFCbi+8s7x8ZP+Ypz6wTBFE=;
 b=LgzD6NvWaCSfC+/3v2iMOyGa0zDhWFgcvgIBln7rwudsXUiIQJLISSTG2KsDKhPe/s
 IMPw0dIYcGrPLfcBQsMV3MnfpmADgR7NZm3rFvAwuZ8SFznmNUZhegOCprgA2yczMOFW
 1SF2TCCzaOCCK+ioH/r0017fK6ziko2jGyyMGNulTtgs98W1vpb6VmVzaY1TpXTDjIPx
 NnS/JXfdqD5viO/APGQPxx52d/cjGw5kRu1q0BJJVt5l8wyAmycobvmR13hlCNt2z4JH
 ysAFZL51t/sGUDnKjjds1H7Uh582QN5Z2EVrEfkXnEF3Jof+4JpAQ7Tjbzus7lGKCyeD
 QDDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHhaUfF7bE4avQDkwFjZR5+SfP+XT4QZLWNsB0UvfPtAXisyHu7o/zhNo3pmayZG2LPoEY5fT1IgT+Gko2sGVnghSFL5kmw4xS8cc1xtri
X-Gm-Message-State: AOJu0Yz6YOfDOOnorB6qyhmkxaeNsIehqvV8bkhZcGfxNwnu2+Jl70OR
 mmEtYkKTLt4foCnwQ3SxPkbZufwwAKQcKUeqrH3c03DN2lfGfasa
X-Google-Smtp-Source: AGHT+IFeKRBmX0VW7sv5rUHfZ0tynia7OwMdWO6tHkvskc+E+k+IhaoGejd1DMN70lLMBnMgohEXxQ==
X-Received: by 2002:a17:903:483:b0:1dc:fba1:1522 with SMTP id
 jj3-20020a170903048300b001dcfba11522mr6685263plb.41.1710263026027; 
 Tue, 12 Mar 2024 10:03:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902f1ca00b001dd75d4c78csm7006194plc.221.2024.03.12.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:44 -0700 (PDT)
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
Subject: [PATCH 14/14] powerpc: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:09 -0700
Message-Id: <20240312170309.2546362-15-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/powerpc/include/asm/bug.h | 37 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1db485aacbd9..330d4983f90e 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -14,6 +14,9 @@
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
 	 .4byte 5002f - .
+#if IS_ENABLED(CONFIG_KUNIT)
+	 .4byte 0
+#endif
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -32,30 +35,46 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLY__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
+/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3,%4 to be FILE, __func__, LINE, flags
+   and sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.4byte %1 - .\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
+	__BUG_FUNC_PTR				\
+	"	.short %2, %3\n"		\
+	".org 2b+%4\n"				\
 	".previous\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
+	"	.short %3\n"			\
+	".org 2b+%4\n"				\
 	".previous\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG_ENTRY(insn, flags, ...)			\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
+		: : "i" (__FILE__), "i" (__BUG_FUNC),	\
+		  "i" (__LINE__),			\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
@@ -80,7 +99,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(PPC_TLNEI " %5, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -90,7 +109,7 @@
 		if (__ret_warn_on)				\
 			__WARN();				\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+		BUG_ENTRY(PPC_TLNEI " %5, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 			  "r" (__ret_warn_on));	\
 	}							\
-- 
2.39.2

