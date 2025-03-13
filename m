Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367ACA5F2CF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB7410E852;
	Thu, 13 Mar 2025 11:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UhzjzNNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765F110E852
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741866291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNDdusV5kHSN69Wnsdcb+ESaCAhVWZZ95i0rdnVfZIo=;
 b=UhzjzNNlkWyKPCBgU3I7/myJZoQ/R4kROmu9b//6VZraxGHS6AhCciyKggGA20l9g79beY
 /xN8afHGR2yKYsqfLHEPA6onEHo9pa4tQ+hX7qqJ3Dio5eLOFE4Ub50RFbZn6WGIw3y3Kn
 C5jd4tTbTY0BapeU8xCd7KkGyqRY4C4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-kQXQ-vzwODOj-Pt2X0SrlQ-1; Thu, 13 Mar 2025 07:44:50 -0400
X-MC-Unique: kQXQ-vzwODOj-Pt2X0SrlQ-1
X-Mimecast-MFC-AGG-ID: kQXQ-vzwODOj-Pt2X0SrlQ_1741866289
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-391425471d6so306779f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 04:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741866289; x=1742471089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNDdusV5kHSN69Wnsdcb+ESaCAhVWZZ95i0rdnVfZIo=;
 b=F0K0HUpiM9boMGBYllZBwNl6/uMoK60yt20+gXADgpotwVJ5e8FD+jXWKNpHv4doXl
 WoyY4n1/xD7xedzRUrfsTkyfoqTjO+2dyHR4voghAgIV0fFjuQlBw6TBGbLLtr7MT7bR
 eBW0CKXhhcE/QbP9C++T/+U9pPSzL4A6g/FSY4AoyYkyJo00ZQNH68rvKYuKQpkhdDWA
 vT71IWtgd1P4x9jvliFNVPxI8zMAtuDt3rR48yBuBTi+i7TX5bpGHyCIe35leV1CmC8u
 7II+aFkgTgNwy9+ey7aLM5LYXVd2ja10mvL11A5UuD32d94DXet+80b/hRv8HpzXY+dA
 rhtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRdctIOTgkurDWdMtkl0e5cY4nsGKLPuXd6GCSTV9HDPJo4Ls80uli1AWJDxJSGDOT4/kUg83ditE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq8Wjluhy73VRDoopx/ETJ/zLLa6xap9bCNwBLOAgO9KnRnRXw
 VW6W3wKtIzSMbVzan8vb1sUVqpX+1APOfgj51n6+xwiWJtna8WQQ0gbPHumM67BTQauQ3OfkC7u
 C/qGOTP1W9xfFEBrZcvQKp7WtuE3ZtkvoS8jmTCuMgY3PvI8GmuPzteRmzXex0BfoPQ==
X-Gm-Gg: ASbGnctuMUEC/eYy0LdNVJyDKJWx/7CuVLhoPWtLdVUNBt8tB0MGu50PHb8KWe+73H8
 oSY4730obnn1DX6pDCKQcmSqJQt5rZILuWN37ptxMTwTY5R3vPuiTZ7Pq8dIQqRgAj3biQDclru
 0oH2jmB9METBtaw7zjFWMaYyi/WfukX0ijsA5PBDdlUSVLjRKOVJ8QrutnaQ8xpPV05llWNrIac
 WgAbw4GugmgDCU0xFvjJkkcGPJnK3deJLeHkn1um4moyBY1ZslyJLjYCsDFG9YJpBWjaLlXo2Rx
 NVVLxodxFbvxugCtvNvB
X-Received: by 2002:a5d:6daa:0:b0:390:fbba:e64b with SMTP id
 ffacd0b85a97d-39132d8afb7mr18596824f8f.31.1741866289396; 
 Thu, 13 Mar 2025 04:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYwocEA7kYpHNOe02FWF9uxS8M3FuzRDEqfu4GtiOXX78+oDlT7RdxLzaiu9BpsPlw7lldzQ==
X-Received: by 2002:a5d:6daa:0:b0:390:fbba:e64b with SMTP id
 ffacd0b85a97d-39132d8afb7mr18596786f8f.31.1741866289052; 
 Thu, 13 Mar 2025 04:44:49 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 04:44:48 -0700 (PDT)
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
 Helge Deller <deller@gmx.de>, Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 09/14] parisc: Add support for suppressing warning
 backtraces
Date: Thu, 13 Mar 2025 11:43:24 +0000
Message-Id: <20250313114329.284104-10-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5V23PIqDaIkELfgVglXYtb_tmMJx2Lsf2-FD1R7Gltw_1741866289
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..b59c3f7380bf 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define BUG()								\
 	do {								\
 		asm volatile("\n"					\
@@ -33,10 +42,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %c3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
 		unreachable();						\
 	} while(0)
@@ -58,10 +69,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
@@ -74,7 +87,7 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t.short %0\n"				\
-			     "\t.blockz %1-4-2\n"			\
+			     "\t.blockz %c1-(.-2b)\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
-- 
2.34.1

