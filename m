Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A3AC405F
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C0B10E2E8;
	Mon, 26 May 2025 13:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Nubd1VOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB2010E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748266103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0YRJWOlICqCgS45Er6beMSN4o1Be1F4DIB5uq3fyIU=;
 b=Nubd1VOxAm5794qdTE6bXLwV/lcKbzfPjlIZS7ybN0Ybt7+OSJmcEVQfSjSME6UJHo8dyk
 o6oVI2tOqjBS4ADEB0hGJ+4/VJHG3uWE8TfALsJ4MOwcfuz18MZMKPsOuqCtcDKTV3e6zd
 06P9RLjqP1NLHbs7tSf7Gy7wA8oz3Xw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-0jbUpDlMMCqzDPt8ACNPiQ-1; Mon, 26 May 2025 09:28:22 -0400
X-MC-Unique: 0jbUpDlMMCqzDPt8ACNPiQ-1
X-Mimecast-MFC-AGG-ID: 0jbUpDlMMCqzDPt8ACNPiQ_1748266101
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a371fb826cso882765f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748266100; x=1748870900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0YRJWOlICqCgS45Er6beMSN4o1Be1F4DIB5uq3fyIU=;
 b=ELGxmo5wYu2J6GmQHt+kJVlUtd7SQmHMhlPZyZYdr7WkpkQgADCDelScJgtzKqeJGW
 fpLmSUR4APDgO+fC0wmrGnpWD7TEGm8CFspxwJrSs92sITi8OKaUUbpfhKAj6f7RVyZ0
 jc/r0SZbctcgJBpzunGtjqnIUVOzCwy1DeTD6MTdZDprOxxOjF3Li5m0ln2ZzYPU9TUo
 NQ54FwZUEIB9OS5CDdirI2YWLhIbj2BQevDzgDURHaq/Wx1aWYgBWdVCz4U8BsMmK8tY
 N3foInNSUtGRrcpum7q1BXN1sIJE6fsSeqwTgb9BTak35ni7tyCBLJrfSgOJhEUyEJE1
 tXiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzAs2+792baYX7kANjN/zUOxPJFCpT/gwnd6AOpxDPdnNBA83UPObvu4r2KRywUX3R3dR5zZhPTcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdvxGXVEfBb6XRQTwMHA+/ZyINfWxjy8xlL2x0yY16Opx4/X9S
 6kHYosCEEc+6HTGXA2ZpOCDlWAn1hIoCdGz9CnYSfiJq/uO96syJ0tWv1nDcFF9PxsgfzEWnOsZ
 iFV8jEEYZ7g2MvkGytaWSorBtn3OWIpsGVZk6jlbd2sZuzH8sdrYgKzrxOA05FUHcAnlr2Q==
X-Gm-Gg: ASbGnct0Qnwq1/+l/segzCq9N7NLRypWLGfVj+Fxfa/5OezAWIDdI7kE3FIAuLG5vlg
 m1g39k17WvWw1DzDhwBBC+rxXJ1SB1k9FtSD4lfYlKgK6iESwnQb5cir5MRiPJAbiiXkJqXGRQc
 LVFXGfF+iJRvuPlUtIOwLxvCVZPkizGWhrtROskqPuSilY5mWuYxFIkjLEO5M+VIAwjJODRYeks
 50o4KKzsFpt1RE2wMIu55/w4Vlb4+JEGhLPPyTUGKA3XbWZzLyI1o4m5r9YJfahyXX1NSor812X
 SsCWqZBfGxp62AVG
X-Received: by 2002:a05:6000:4022:b0:3a3:7638:d754 with SMTP id
 ffacd0b85a97d-3a4cb454b98mr7833513f8f.21.1748266100562; 
 Mon, 26 May 2025 06:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pOAvbuHyLjhUOMwzoRe4s1Do1fW/hrkf0UqrCoecUCHTClHzHJUHZb8Hgf3W8Hzp8xWVNA==
X-Received: by 2002:a05:6000:4022:b0:3a3:7638:d754 with SMTP id
 ffacd0b85a97d-3a4cb454b98mr7833471f8f.21.1748266100089; 
 Mon, 26 May 2025 06:28:20 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 06:28:19 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v5 3/5] Add unit tests to verify that warning backtrace
 suppression works.
Date: Mon, 26 May 2025 13:27:53 +0000
Message-Id: <20250526132755.166150-4-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XmYl1H1zFx3VXkJIjucIAvFrVfMYAAz8BjO6oWyfG6g_1748266101
X-Mimecast-Originator: redhat.com
Content-type: text/plain
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

From: Guenter Roeck <linux@roeck-us.net>

Add unit tests to verify that warning backtrace suppression works.

If backtrace suppression does _not_ work, the unit tests will likely
trigger unsuppressed backtraces, which should actually help to get
the affected architectures / platforms fixed.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 lib/kunit/Makefile                     |   3 +
 lib/kunit/backtrace-suppression-test.c | 105 +++++++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 lib/kunit/backtrace-suppression-test.c

diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 3195e861d63c..05fb19d69709 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -23,6 +23,9 @@ obj-y +=				hooks.o \
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
 obj-$(CONFIG_KUNIT_TEST) +=		platform-test.o
+ifeq ($(CONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
+obj-$(CONFIG_KUNIT_TEST) +=		backtrace-suppression-test.o
+endif
 
 # string-stream-test compiles built-in only.
 ifeq ($(CONFIG_KUNIT_TEST),y)
diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
new file mode 100644
index 000000000000..a3d5991b9b15
--- /dev/null
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for suppressing warning tracebacks
+ *
+ * Copyright (C) 2024, Guenter Roeck
+ * Author: Guenter Roeck <linux@roeck-us.net>
+ */
+
+#include <kunit/test.h>
+#include <linux/bug.h>
+
+static void backtrace_suppression_test_warn_direct(struct kunit *test)
+{
+	KUNIT_DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
+
+	KUNIT_START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
+	WARN(1, "This backtrace should be suppressed");
+	KUNIT_END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
+
+	KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_direct), 1);
+}
+
+static void trigger_backtrace_warn(void)
+{
+	WARN(1, "This backtrace should be suppressed");
+}
+
+static void backtrace_suppression_test_warn_indirect(struct kunit *test)
+{
+	KUNIT_DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn);
+
+	KUNIT_START_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	trigger_backtrace_warn();
+	KUNIT_END_SUPPRESSED_WARNING(trigger_backtrace_warn);
+
+	KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn), 1);
+}
+
+static void backtrace_suppression_test_warn_multi(struct kunit *test)
+{
+	KUNIT_DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	KUNIT_DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
+
+	KUNIT_START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
+	KUNIT_START_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	WARN(1, "This backtrace should be suppressed");
+	trigger_backtrace_warn();
+	KUNIT_END_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	KUNIT_END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
+
+	KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_multi), 1);
+	KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn), 1);
+}
+
+static void backtrace_suppression_test_warn_on_direct(struct kunit *test)
+{
+	KUNIT_DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
+
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KALLSYMS))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CONFIG_KALLSYMS");
+
+	KUNIT_START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
+	WARN_ON(1);
+	KUNIT_END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
+
+	KUNIT_EXPECT_EQ(test,
+			KUNIT_SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_on_direct), 1);
+}
+
+static void trigger_backtrace_warn_on(void)
+{
+	WARN_ON(1);
+}
+
+static void backtrace_suppression_test_warn_on_indirect(struct kunit *test)
+{
+	KUNIT_DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
+
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
+
+	KUNIT_START_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
+	trigger_backtrace_warn_on();
+	KUNIT_END_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
+
+	KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn_on), 1);
+}
+
+static struct kunit_case backtrace_suppression_test_cases[] = {
+	KUNIT_CASE(backtrace_suppression_test_warn_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_indirect),
+	KUNIT_CASE(backtrace_suppression_test_warn_multi),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
+	{}
+};
+
+static struct kunit_suite backtrace_suppression_test_suite = {
+	.name = "backtrace-suppression-test",
+	.test_cases = backtrace_suppression_test_cases,
+};
+kunit_test_suites(&backtrace_suppression_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression");
-- 
2.34.1

