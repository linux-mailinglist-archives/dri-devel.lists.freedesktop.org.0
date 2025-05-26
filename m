Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7057AC405E
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F1D10E2D1;
	Mon, 26 May 2025 13:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MGM2s/zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB7710E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748266101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPlt4ytZ6F2hvn0V4PkuFNl5i8ajyUihcCaYhF+iFpQ=;
 b=MGM2s/zsTevNq8B8sZZ3VvKz82NEU6wxR72R98BbGILdveJGHj/JDHLrtWgvmT5WKlX9fe
 0j6CycVonIilZSOlblfJ28TOUsfvvJviU0C7gMPMF300AtRN72EyPpGpBLl40zik2M4Lxl
 3fOqZySjlnLayf9GBLuBnOm4y1SP+24=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-zkXmFg10N9aMBYc4t7kKvA-1; Mon, 26 May 2025 09:28:19 -0400
X-MC-Unique: zkXmFg10N9aMBYc4t7kKvA-1
X-Mimecast-MFC-AGG-ID: zkXmFg10N9aMBYc4t7kKvA_1748266099
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a375938404so1493695f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748266099; x=1748870899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oPlt4ytZ6F2hvn0V4PkuFNl5i8ajyUihcCaYhF+iFpQ=;
 b=e9CWx0hI5UYrWjpG+d2S3ZPRgbSL0hs5IIMl58B1FmBr9YG2kC7m7Okp8sv//gh50E
 A/roWLMf8lgAcrr+3eLfAeKM8zs/+AStsLb34PeTYrvYZE9aM3n7SnQApkUeyk5/5app
 lPwyoIK1gxmPFH+eBcbG/AY4NUxZmyjTrf0ShmTD38kT/0xi+Ts4HWPqR0KphAF+qZPF
 q55FgzTRV8AQUxp4ujpCRUNcmltRXFHGu2yhXX4Np6jo+Q8wp4vDq7BLjU5f2JEraZZQ
 SEQ8VScL5pG61ngNxpIGdDDUyKmDZoz4I/EAsD/CykcwIaMNrZbcrOZHBRVWCidxdN0y
 7FvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9PWJm0+keoGIUc3fTLBJ6HUrYP9X/GvGWaw+LJ0m1rTU1kql24QM4E45iT+KIgZqYo65eQXOZtg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCpeIveuiHP0bO63G9zGaBKGH5XLeth2fVLstz0by6QZc7W9MM
 VJEfFZ4Cu/bUFpaiAph6i4HxMl02RbCjMo56hBkybFBw818nzPMlHfDG9e7LG3tNa+5gsIWXPJR
 JMbl0eCll+sNCKeRDOEtpTxRgAO3Ho37WZjyTYUgJ9ZA600wusoHCNL/j5cNt40BPKcw18A==
X-Gm-Gg: ASbGncveAVgjFxVxMhQU5DFK5EucnKOL4cEsu7B5OJvTI59Ty89uRAwFyaKYyDgIr6q
 Sd2IcujTi9j52aX2ZM8wTO/MIxCatBe03dIFX+8ht0ClXz/jJUkfpH5OfY23FdxlmybL4XiBoxY
 6mysJElL2iNELpsANVfHokbOvjyS/gtNNiycerZINQi6zn7ZigV8BbMlWCJgk3V4hX/WQjl8kbK
 ZrwRMJmrcQ5p9omLRrwPrWXQ1h6Dl1lgkj2atb7g06Hq2GUDI9nENAORwIT+k+REZs4QXLhN2sV
 e69NRRMIONbtHwvZ
X-Received: by 2002:a05:6000:430c:b0:3a4:dd63:4aec with SMTP id
 ffacd0b85a97d-3a4dd634cfcmr1564312f8f.48.1748266098624; 
 Mon, 26 May 2025 06:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfQ14aemGGVrnyyULM4fmrilLUTKS/3ULR87fBB6DJGO5nAXb+suetmJzZdWhNA46LzsMX5w==
X-Received: by 2002:a05:6000:430c:b0:3a4:dd63:4aec with SMTP id
 ffacd0b85a97d-3a4dd634cfcmr1564292f8f.48.1748266098242; 
 Mon, 26 May 2025 06:28:18 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 06:28:17 -0700 (PDT)
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
Subject: [PATCH v5 2/5] bug/kunit: Suppressing warning backtraces reduced
 impact on WARN*() sites
Date: Mon, 26 May 2025 13:27:52 +0000
Message-Id: <20250526132755.166150-3-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rxgoAfjUFcoILG0dqqXIG5lN7d_7NwQNqoCK6gvGisU_1748266099
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

KUnit support is not consistently present across distributions, some
include it in their stock kernels, while others do not.
While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
features, the fact that some distros ship with KUnit enabled means it's
important to minimize the runtime impact of this patch.
To that end, this patch introduces a counter for the number of
suppressed symbols and skips execution of __kunit_is_suppressed_warning()
entirely when no symbols are currently being suppressed.

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 include/asm-generic/bug.h | 21 ++++++++++++++-------
 include/kunit/bug.h       |  1 +
 lib/kunit/bug.c           |  4 ++++
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 3cc8cb100ccd..c5587820bd8c 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -62,7 +62,8 @@ struct bug_entry {
  */
 #ifndef HAVE_ARCH_BUG
 #define BUG() do { \
-	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
+	if (suppressed_symbols_cnt &&					\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
 		printk("BUG: failure at %s:%d/%s()!\n", __FILE__,	\
 			__LINE__, __func__);				\
 		barrier_before_unreachable();				\
@@ -99,7 +100,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #ifndef __WARN_FLAGS
 #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
 #define __WARN_printf(taint, arg...) do {				\
-		if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
+		if (suppressed_symbols_cnt &&				\
+		    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
 			instrumentation_begin();			\
 			warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);\
 			instrumentation_end();				\
@@ -108,7 +110,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #else
 #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(taint, arg...) do {				\
-		if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
+		if (suppressed_symbols_cnt &&				\
+		    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
 			instrumentation_begin();			\
 			__warn_printk(arg);				\
 			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE |		\
@@ -118,7 +121,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 	} while (0)
 #define WARN_ON_ONCE(condition) ({				\
 	int __ret_warn_on = !!(condition);			\
-	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
+	if (unlikely(__ret_warn_on) && suppressed_symbols_cnt &&\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__))		\
 		__WARN_FLAGS(BUGFLAG_ONCE |			\
 			     BUGFLAG_TAINT(TAINT_WARN));	\
 	unlikely(__ret_warn_on);				\
@@ -130,7 +134,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #ifndef WARN_ON
 #define WARN_ON(condition) ({						\
 	int __ret_warn_on = !!(condition);				\
-	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
+	if (unlikely(__ret_warn_on) && suppressed_symbols_cnt &&	\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
 		__WARN();						\
 	unlikely(__ret_warn_on);					\
 })
@@ -147,7 +152,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 
 #define WARN_TAINT(condition, taint, format...) ({			\
 	int __ret_warn_on = !!(condition);				\
-	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
+	if (unlikely(__ret_warn_on) && suppressed_symbols_cnt &&	\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
 		__WARN_printf(taint, format);				\
 	unlikely(__ret_warn_on);					\
 })
@@ -166,7 +172,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #else /* !CONFIG_BUG */
 #ifndef HAVE_ARCH_BUG
 #define BUG() do {		\
-	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
+	if (suppressed_symbols_cnt &&					\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
 		do {} while (1);					\
 		unreachable();						\
 	}								\
diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 9a4eff2897e9..3256e3f2c165 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -23,6 +23,7 @@ struct __suppressed_warning {
 	const char *function;
 	int counter;
 };
+extern int suppressed_symbols_cnt;
 
 void __kunit_start_suppress_warning(struct __suppressed_warning *warning);
 void __kunit_end_suppress_warning(struct __suppressed_warning *warning);
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index 4da9ae478f25..5beaee1049eb 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -11,15 +11,19 @@
 #include <linux/list.h>
 
 static LIST_HEAD(suppressed_warnings);
+int suppressed_symbols_cnt = 0;
+EXPORT_SYMBOL_GPL(suppressed_symbols_cnt);
 
 void __kunit_start_suppress_warning(struct __suppressed_warning *warning)
 {
+	suppressed_symbols_cnt++;
 	list_add(&warning->node, &suppressed_warnings);
 }
 EXPORT_SYMBOL_GPL(__kunit_start_suppress_warning);
 
 void __kunit_end_suppress_warning(struct __suppressed_warning *warning)
 {
+	suppressed_symbols_cnt--;
 	list_del(&warning->node);
 }
 EXPORT_SYMBOL_GPL(__kunit_end_suppress_warning);
-- 
2.34.1

