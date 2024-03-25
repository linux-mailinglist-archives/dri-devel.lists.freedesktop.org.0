Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF188AC7F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1271710EA38;
	Mon, 25 Mar 2024 17:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nbWThds9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED94810E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:53:13 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5a4a102145fso2050970eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711389193; x=1711993993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
 b=nbWThds9Xn38NKDS38BZUMfhD9b+pVD+whvDFnsHOxiaGAjXWfwDzk01T2iVdQT+JM
 Iwsf2Xywa6M09iqafrQre3iub7f4GplINFtH+gWe8e5St7ekqtLY4Cr786SsQL3wTcAm
 FcuLt1VkAqP0+0uqY1z4dVRBJgUaJ6Mj3BqzzR7oQqWqUj9pAUvrv2dvR4Ynme1qgMDI
 FyIji6t7d60G/VoyVKiMoINzwPvVlKZoyXbL6aoGwUnbLnAeQXRjrJK1Gu7woUMomSBc
 8reRdRZtVrOsFbhhAbRWQYauULhmseZ4bsHoRFP3KAO/f+Kew0lnnraP3x13dhCZqTv6
 9flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711389193; x=1711993993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
 b=SSuMCrGFVV6OOJH5pAQTmvxizJpxaQQbrWH7I5XnkTSMAZej8C4Eovvd+hv3fTzyY8
 /IQORqpGvRAcsOeQmmyHocLv27wzOcPg7JawM/HJe7xT6a0T6xg5ZGCIgs1qxbs/KxSb
 iG7KwDjCrz7Zh57deaqn3UgBCil3IRg5O/qcUm5op4TyynCNttJ2/MIIMf0NkYGngQJH
 KGGh0dk9uXzFeEuO5K+PLqpuU5HAYL/fHjR7pYJGHmdD7S8xGMDEdiBzQtYPmac0PwOb
 qGOKjRn075V0ddvrleWc2yHnbPItWGrkrXeVK4fCscXBmj9g1R9+DnDCQeAUKRPsYwsd
 E7Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9dirwPjfI96xGpUem3omDRAWcnjvhbJereomT/4lSSVTZ3wbAx0c606keBehX2iUCnuGG9iUl7gNdI60fxkgYRqyRHuG3xP7e7gQ66NRL
X-Gm-Message-State: AOJu0Ywl6WEotuiUdLk6vzkUZPJ+7HP8JPiHwHi7jt/3Y6Wn9vSw0G63
 TWm79VQ9rqsYT4TOVmsj21cY9y0Kie4hXkq2JrGdpBdjzNiVM/wO
X-Google-Smtp-Source: AGHT+IGv1aIgA06o9Fu8TIRgx/HOB3QdMC5g6WhXly0xhlmCYycmN3i4bcD6kTp8Utc1wDwGC1lc7A==
X-Received: by 2002:a05:6358:fac6:b0:17f:729a:8562 with SMTP id
 ts6-20020a056358fac600b0017f729a8562mr2827009rwb.3.1711389192937; 
 Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w189-20020a6362c6000000b005e438ea2a5asm6051492pgb.53.2024.03.25.10.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
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
Subject: [PATCH v2 11/14] s390: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:45 -0700
Message-Id: <20240325175248.1499046-12-linux@roeck-us.net>
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
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

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

