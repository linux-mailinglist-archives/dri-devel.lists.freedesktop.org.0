Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF688AC73
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1379A10EA28;
	Mon, 25 Mar 2024 17:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V24BFVdw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323DA10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:52:59 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e46dcd8feaso1757850b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711389178; x=1711993978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTOeGU6FQqXFkFqXhTXI5f43XSJm9vhCGcg9SgmVgjc=;
 b=V24BFVdwfxLpofhEmlEzcj3feqkiTPmLVRIQW7DrnnaoqYFIWQed2JwbZjoPUvDonM
 vWeM4XDmm0LM7rDe+9l/cVLkiZHn4P1MoktSznQ1v0PAevt4GNnsRz+gJG/KXdml8C7l
 Q5YVOYFZfyrR+xOj4Xq/o3QOfY3g1mnxOSRGn/Gib2PsM60t5mdyvy0f8ZCSM12j7xZU
 BbnSH/eMVdRn4evq4TZumeoQJRs6ktb+gVwC2atJxwCndL4WFiv5N4e1XbqYet3Z0h+/
 XoSp4WhUuvNdx2xRADxjjIKzr2D6pSZvzQ9Tmn7Qrk3A13HuyxbyfcDOmfPzv9SU0dV6
 58GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711389178; x=1711993978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FTOeGU6FQqXFkFqXhTXI5f43XSJm9vhCGcg9SgmVgjc=;
 b=fsIxQYBf1CF0KaVyk+Ml+U6gIKj01FVSiszftO1u/kT2jStIwPvRmuQCsLaDIuv4hU
 ToVBowR8vi9X5oMbTHZUtM5uGxo4vut4tZ8seKVGFkvscc1ZkjXIcqYBxdLRm6fiZwuz
 IZl7mhDAPD1NezsU1GaP+7sPNqLEIkRpkRgoyOaU+iNPkJiL9btcpFLbWpEyF6hylfjH
 oSxiT8SSpCnkgTeaO3O/Lprt/ZkNoDsN0Dufh/NIvB5X3mb8lV51pPytXRCp9ad0Hy57
 q697lzq+WbbyENaVx50UJkzAYr+OrkPelYHTN/CefrQp6I9HpC5gzNF/lxwsp0No2xVt
 HO7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFmObeCSkZTSkJtIwO9WbguaIs9P4zuVqUTRpGfleGXDVgxk18q0M7Afe/BdFlMOYUzDQK5CGIKYzkAxPe7EB13wVMa7kYtZsgemK6nQ8a
X-Gm-Message-State: AOJu0YxslM5Q/uUcKLcnZynb/HoX4i9yivrYoCOcI3ONpHbQHQWJsjvx
 pP5ipsM5WYdAI47VYCrbIR3Xfiqgg3YeEiMPHG2+323/WPqRUhKo
X-Google-Smtp-Source: AGHT+IHUF5/gztmPtcgdfhPMYdq4be7TA0gGRpEdurcbuiSF4hiBELhPQZ43z3ayY8PxmvtmmRl6tQ==
X-Received: by 2002:a05:6a00:990:b0:6e7:b3c4:43a4 with SMTP id
 u16-20020a056a00099000b006e7b3c443a4mr8121119pfg.25.1711389178489; 
 Mon, 25 Mar 2024 10:52:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r6-20020aa78b86000000b006ea92de360esm4522577pfd.93.2024.03.25.10.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:52:58 -0700 (PDT)
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
 netdev@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2 02/14] kunit: bug: Count suppressed warning backtraces
Date: Mon, 25 Mar 2024 10:52:36 -0700
Message-Id: <20240325175248.1499046-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
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

Count suppressed warning backtraces to enable code which suppresses
warning backtraces to check if the expected backtrace(s) have been
observed.

Using atomics for the backtrace count resulted in build errors on some
architectures due to include file recursion, so use a plain integer
for now.

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index bd0fe047572b..72e9fb23bbd5 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -20,6 +20,7 @@
 struct __suppressed_warning {
 	struct list_head node;
 	const char *function;
+	int counter;
 };
 
 void __start_suppress_warning(struct __suppressed_warning *warning);
@@ -28,7 +29,7 @@ bool __is_suppressed_warning(const char *function);
 
 #define DEFINE_SUPPRESSED_WARNING(func)	\
 	struct __suppressed_warning __kunit_suppress_##func = \
-		{ .function = __stringify(func) }
+		{ .function = __stringify(func), .counter = 0 }
 
 #define START_SUPPRESSED_WARNING(func) \
 	__start_suppress_warning(&__kunit_suppress_##func)
@@ -39,12 +40,16 @@ bool __is_suppressed_warning(const char *function);
 #define IS_SUPPRESSED_WARNING(func) \
 	__is_suppressed_warning(func)
 
+#define SUPPRESSED_WARNING_COUNT(func) \
+	(__kunit_suppress_##func.counter)
+
 #else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define START_SUPPRESSED_WARNING(func)
 #define END_SUPPRESSED_WARNING(func)
 #define IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 #endif /* __ASSEMBLY__ */
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index f93544d7a9d1..13b3d896c114 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -32,8 +32,10 @@ bool __is_suppressed_warning(const char *function)
 		return false;
 
 	list_for_each_entry(warning, &suppressed_warnings, node) {
-		if (!strcmp(function, warning->function))
+		if (!strcmp(function, warning->function)) {
+			warning->counter++;
 			return true;
+		}
 	}
 	return false;
 }
-- 
2.39.2

