Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E1A5F2D2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE3F10E858;
	Thu, 13 Mar 2025 11:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HDUwsku5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B862510E852
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741866293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdALik7flTFVSWTVblU8JKKGGV2JCoENkhxrfjNtUxw=;
 b=HDUwsku52T2ebFubb0fL46MZQa2MunEfwZq4PVi6xPrrywjQMxaQopf8+f5zCYoAxteEB3
 xaqk19lBYLT07dKklUnp691mkZuPMOxrSDdrxwt/7JWnnNAZVaKwAyHG7FmjJalo3EXW7g
 UU+C01IG94XqG+FyGX1MKTgk+UhH2ls=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-WkKzRCgdOYuWXod6SA8bTQ-1; Thu, 13 Mar 2025 07:44:52 -0400
X-MC-Unique: WkKzRCgdOYuWXod6SA8bTQ-1
X-Mimecast-MFC-AGG-ID: WkKzRCgdOYuWXod6SA8bTQ_1741866291
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-391425471d6so306814f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 04:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741866291; x=1742471091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdALik7flTFVSWTVblU8JKKGGV2JCoENkhxrfjNtUxw=;
 b=VqiZYk9T9gRtvbA6MEAAtUkXfKfKMmEhqu6oxe3ByVWNHqIS15dY9rzmgLM41r5BPT
 W8w4Voh7qVtfPGGeIMtSIAgpVtiOuAOcFJZLTnQwyRFAb73D6Ht9TzySpkgET1lluqjL
 6UyhSPG/YC0VAfYXHVcgiL4bTNONmZW135fwxXqKHA4EEY4cFIpHeZIBkgP66QexcgvY
 lAT6TWKEzhRMDPUsYC3TMaVbpNFSkvkuPElASMCtaal88L/P3+i3n4IMiAjbcwvSEcS2
 Z5Gs26Ism0s0GYRMMmlpjGwyULzZwDUx4/UizSoR9iWpVq5aO2uUpTVBVhN7eNAi8m5U
 ANlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQiHPkIzZALbZjsUuahyEOeLyEqcIMnbQbbJb3BwD4UQSZMrALWgrZQPNQwPlV1aPi0lE06KhiLm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoypPC61+8icNBS9Eaf7O04Dd8xbMTFReVHqZ6SzasI7z1yDl4
 e8Y2q6pSSunNWO9cdlwDDP15tptGX4C2VfKgYfJL5+0EpieIbthJnVYeExU/fQ49nktU7MuaqYj
 SXC96ScBxhOl8qO13ui1mUdyG3RixKSbPOY4N/Vsp24Amv2RUiAygdYp6nXq1YAmGdw==
X-Gm-Gg: ASbGncu6cREStGSQZmmwt8GLRMUj/Kw4/fnACCJJ0G8r59tcAJ+t1gMvGyLZ/dXD1om
 2TU7kQ6CD6hv/PbLZQAgFii9g83mmQicnMOp94o4ZbsIJ6N5Y+TrWbnT1EnXumIvZrklSwZ2dFW
 hCWSkNN+pg4ruSYxhUij46LirSfkodbUtrywlvqcp+wVr+nvQpIfs61z4mA2Zbh7RCgZMNU7RPv
 cOQ71HCfIapXWmc8yA8YmjJCS8HRnmHXzTwN9NiTY3SWQ1sgZSRZosbY0fAKDw76oOe3UTBAGGu
 wfrEnWoDMjlU08PKWPGS
X-Received: by 2002:a5d:64a4:0:b0:391:a74:d7dc with SMTP id
 ffacd0b85a97d-39132db7543mr19148421f8f.50.1741866291545; 
 Thu, 13 Mar 2025 04:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc68icOs2UFLsGvYM02K+KaAXrxdUkEYYl5CYIXnV4BsTbvYwzMB6bzWlvY18H1nYSqaV5qQ==
X-Received: by 2002:a5d:64a4:0:b0:391:a74:d7dc with SMTP id
 ffacd0b85a97d-39132db7543mr19148405f8f.50.1741866291178; 
 Thu, 13 Mar 2025 04:44:51 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 04:44:50 -0700 (PDT)
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
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 10/14] s390: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:25 +0000
Message-Id: <20250313114329.284104-11-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YyG9zHC0n9FBRT1FJgiZt7uFHLdj5hGVc6t0mhebhCw_1741866291
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
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/s390/include/asm/bug.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index c500d45fb465..44d4e9f24ae0 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,6 +8,15 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
@@ -17,10 +26,12 @@
 		".section __bug_table,\"aw\"\n"			\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.34.1

