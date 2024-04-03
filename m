Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1B2897034
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 15:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20B2112AF7;
	Wed,  3 Apr 2024 13:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z8xB1rQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85DF112AF3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 13:20:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e0411c0a52so54171605ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712150401; x=1712755201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
 b=Z8xB1rQ/qHsWg1azgWHgE1GEryVZ1Uq13Fbt3zo0LJLjq63Wp/uqrnKqR8KGyAce1A
 UfgreA7svpBa+ynwX57RPF4j6ZraTfppW9H8s0xxjTmwYAPsMp88twE8kLjiPZ3+wGSl
 ua8ILn/McVXRNiXd6bN9rMbswn8ddQKYMoik8pf5em4yd1PLg19et9jj6KNZm80Ir2bG
 s9Sbs6JE5dE/XWuZ3uKJ0dmSObss48gthav4qOIc5RiFPA2x1rx7RiR9PVrSjd6p4/pm
 vs/iHDiddITNwxSRtbqbm8vsHdRtvHdnB6G6I2NRKb65GwT9YvNC38HuEFP8DRWyGFVU
 Opvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712150401; x=1712755201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
 b=ZVwZACAXejUXDuOENpg3+Pnt9de+7lVFvvp21GFNNGR5LCozv5OAQRjbl+0VaYBPpk
 2O4wX54l5iyXxXEXxFMRxadvPqAoQqnzo3gbGQtS7tEEEb4bpjHL/SOL7o3T4Sacz4xz
 piL3hPOWRR8jmZAdEO9JhWNizeDiUGojWUsyBVCvTFrZeyOx720nSm9ep8RMUtg9oboB
 gpO+fvZQ//Hxq3miykk7ZETv5H8nkbsI/QTA1zslWYiMCpX0CEVrej7nZ6cD7Gr/kesz
 M59aOqTeN70sOJWRGpZeiP63wNfR5XLbzAfFbfzkJUQVjCV6Ynmq2FzC6Tf4CAkcgIl8
 hmzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYptsRGtKsERvaKDiqNocPMiBy3Gi/sJ9WNRDYu9l2FLMJPDc6X5gUlPUp7WrbWgGTGquhBw9221BE46ltKa2qBh2q09uMNrWiPZnKLcbg
X-Gm-Message-State: AOJu0Yzm8wXf85l6iq3RbAneFr++x047pzFXm1ugPPMJl9+BlMugcvmU
 O9noZ/bCSTgK5ZuRXZCzGy+F4ViEYloNRZO43d7lgtx0E+wfMQdX
X-Google-Smtp-Source: AGHT+IEMqe589WW9yt5k/lfzrxxoDYVpXeSOxtyZyHF9LDTCjhOnJNt1j89G1vs1iICWdJ7uWy226Q==
X-Received: by 2002:a17:902:bb16:b0:1e0:b871:53f1 with SMTP id
 im22-20020a170902bb1600b001e0b87153f1mr12301982plb.31.1712150401114; 
 Wed, 03 Apr 2024 06:20:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902a38300b001e2461c52c6sm9309915pla.149.2024.04.03.06.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 06:20:00 -0700 (PDT)
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
 netdev@vger.kernel.org, x86@kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH v3 11/15] s390: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:32 -0700
Message-Id: <20240403131936.787234-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
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
---
v2:
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

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
2.39.2

