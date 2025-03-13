Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2FA5F2C6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001A510E860;
	Thu, 13 Mar 2025 11:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P26OCPpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7183F10E85C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741866277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
 b=P26OCPpzOuhxQE8KWiEgBd3nhP/JeccjmTAdj5OKFTGDfIlf+Bu1kwOa1MCTYul8hVnPMF
 JsOFsfB6aviKGy6e/61RweMy+PRVWuV6HIUbQk2YRFIggUNdyMMIvaIn1fYLJC+vkDlEXt
 Ae3iok1GDqb1Q4OkgPARaCvrvkM/bLU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-Z7BcJdheO22E4n5Qjar6rg-1; Thu, 13 Mar 2025 07:44:34 -0400
X-MC-Unique: Z7BcJdheO22E4n5Qjar6rg-1
X-Mimecast-MFC-AGG-ID: Z7BcJdheO22E4n5Qjar6rg_1741866273
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf44b66f7so4302145e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 04:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741866273; x=1742471073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
 b=kkPU2taYY4/LiXgThDu3vvqBg3VMKlrKiSNGraNZG4+IznmQkbIRi6LjAoQCq2JWFF
 HcfAbvbzC3/l7uGu6MZ3SUCyVWuPVUl7q4pVEHVLiZKIPZl2VoTytmcnjxmvUoxsQ2C9
 6c97MF8LcW9Aqv19Sghuy47SIb+X5wRF6gHq6poSmD5o/2Y/Lt1rnOpfbAl7TZaBgqAs
 lIuTVdhwn/UsTxV5UDm9qN3zToSXEbwvoui24m+QZKHKxjJuL2JrP9GPp4b2IidYVTW7
 q3T0ALXvY/pF1q0Sl6PLSQLFT7psrAvTFpvufYCBfm5jB0iTqwQlUgifV+k049JZLPV+
 xIDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj7Xufr845BiYNxL3mu5sN/rHujKbYJpJIrf3IObQkUF1GVDypDcPQrcbNz/HJEcaNxF2kL7e65cE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFj/UR5Nvt5zub9VOY6ryXWJnDcsYBE3wk0QOlHQHFxQl7Uhz5
 6qze2eR3MOLIOJOFhO/+bOIHD9Hm+YRlTyGahllchYvsQt2oKdzqm+RHd1gpeW6rU4c/+E6nYGZ
 ebYfhOVhf5fbqq+CBBA5fJCUZW2eO73IoMf8zc4ALEol9Y+JaXkNThfaNtoV4wtNIuw==
X-Gm-Gg: ASbGncuBedZd3yCVUBni2Yxjbq0g9Zjww54Zt0I9L933/bA61+MCIxEIDl6d64zmNyB
 di/kyFF5XA7MDZ1PdRsJCfPqvNd4O5uPp0QEzRDk7SX2y2yUI5d5v5ZAdch6D75P6A+Di5YsNX5
 sYbBZ2XhSae9QoeQiTabzPPj8KZ3yO3kzvT6hfLptVAVsz0F5p05LFB3cz6qAQ1Btcw/99VmWEi
 76ybGOcNGrfJjnG5irlkRVYa0A2/dwB5qKd1t5IhlwxGT+C0fl9YBGyDurQx8RE5Hwxt1N4PjcT
 DeBiPSEhSv5WI/uKSiDD
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id
 5b1f17b1804b1-43cea40af7amr174500755e9.31.1741866273494; 
 Thu, 13 Mar 2025 04:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs6EAEForVjkecQAM8kbehVzhKfM/0tK/SxXfrbXe4b06Gjm7InnzRnhjTKgVzk9sVgzkBAA==
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id
 5b1f17b1804b1-43cea40af7amr174500265e9.31.1741866273039; 
 Thu, 13 Mar 2025 04:44:33 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 04:44:32 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
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
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 02/14] kunit: bug: Count suppressed warning backtraces
Date: Thu, 13 Mar 2025 11:43:17 +0000
Message-Id: <20250313114329.284104-3-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UAgFOllQt7c0DeB0LttHO6fDKhwAAPIEV1SbM_xT-Es_1741866273
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
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 0a8e62c1fcaf..44efa7d5c902 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -20,6 +20,7 @@
 struct __suppressed_warning {
 	struct list_head node;
 	const char *function;
+	int counter;
 };
 
 void __kunit_start_suppress_warning(struct __suppressed_warning *warning);
@@ -28,7 +29,7 @@ bool __kunit_is_suppressed_warning(const char *function);
 
 #define DEFINE_SUPPRESSED_WARNING(func)	\
 	struct __suppressed_warning __kunit_suppress_##func = \
-		{ .function = __stringify(func) }
+		{ .function = __stringify(func), .counter = 0 }
 
 #define KUNIT_START_SUPPRESSED_WARNING(func) \
 	__kunit_start_suppress_warning(&__kunit_suppress_##func)
@@ -39,12 +40,16 @@ bool __kunit_is_suppressed_warning(const char *function);
 #define KUNIT_IS_SUPPRESSED_WARNING(func) \
 	__kunit_is_suppressed_warning(func)
 
+#define SUPPRESSED_WARNING_COUNT(func) \
+	(__kunit_suppress_##func.counter)
+
 #else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define KUNIT_START_SUPPRESSED_WARNING(func)
 #define KUNIT_END_SUPPRESSED_WARNING(func)
 #define KUNIT_IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 #endif /* __ASSEMBLY__ */
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index 351f9a595a71..84c05b1a9e8b 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -32,8 +32,10 @@ bool __kunit_is_suppressed_warning(const char *function)
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
2.34.1

