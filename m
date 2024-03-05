Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B08726C7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8442112C31;
	Tue,  5 Mar 2024 18:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtAhhtBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782FA112C33
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 18:40:49 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dd2dca2007so7460135ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 10:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709664049; x=1710268849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENga0JZ5rPZBACTN6wZjT+Dt35XTgUy/8PrYsu9aECA=;
 b=jtAhhtBKERV7EIwiLx33Bg0Q14fmmvBWUjLBk5Tb1VYExyH7Zq90hKY3M+hNGxF59K
 wE3ze7c8nDbQZtwzhlMI2tP33Dumcy7mKcPasbNWTl7kYTfkGr7icSCX6sd6K2p7+weF
 W8eCF8BRSoTpIx4Zl9V0BVfl6u7/Rbeoa89dpfZRBatC5h6Y77IeOKgbPKIp7LV6h8ap
 3D2c9+nrp76GAxgnTxdn3MFHGmLybgucFsViKCWcf39r2/uvkFAxwV6xRiG1c+576MN9
 iPRUQWiXNbpDmOmMr7wSJ9w3jxizmlwOgoTMRp6SOLyMUAJpe1c1c/9wOVhfIKZsbDtI
 xhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709664049; x=1710268849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ENga0JZ5rPZBACTN6wZjT+Dt35XTgUy/8PrYsu9aECA=;
 b=oLZ5m7MZVoQMn6WMFjPmE4KaJ2BtrC5C9NVL5vC7uwCz92Knm/2UoIGMC0KfSuKhFX
 BeBg/dk/4mlkkw6RwwklSTQ27YdqXFuQ7MEKC68riMB4Tzv8FO5DxqRCYfiFYGd8+KvP
 mA7A3OE01mYlWAhF+2vOymRaDwKQF8+YlfnPtGlnZ5YwcFrn917yS4Esq3+A8iG6qefj
 UgwI71SffEDzSCUxcN+ZubThoyZbjCk+OzNibIncheWd5wx6u6A0sAryxkrEfgR3TQrj
 HN9mNL9il+UVtWRPW3KUsFN9RemxU777F3Bwk5yE+zecfRLFTOocd6h+Fv69VG4HSjNB
 kKGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl0gLLCthu/rNMiEL2HMp62u+x3ctjLdqygwvpk2HWSgPrFxQW3mGCv+rkDmqisIKiW1YzswdlJkUJwwQTYI4fvw9pRMr87l0czzir9i8f
X-Gm-Message-State: AOJu0YxVHmt2rDnRz8PvgEB8peJY01H4/9nyfmlELLC2rKz2/QAEZwWw
 QR+HXexWF+yPgAvk11tBgEVPaSJ5I+bni6pqDnc2wudXqxTlUoqq
X-Google-Smtp-Source: AGHT+IGaNADSHdFncEfR/LWfbyCwmjp0o5rxbAapZy8J6iNa5dKZ3vsRFEkgrPD+a1CNTYdARh80Yg==
X-Received: by 2002:a17:903:2406:b0:1db:a6b9:a311 with SMTP id
 e6-20020a170903240600b001dba6b9a311mr3070617plo.41.1709664048799; 
 Tue, 05 Mar 2024 10:40:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a170902e75000b001dc6b99af70sm10896612plf.108.2024.03.05.10.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:40:47 -0800 (PST)
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
Subject: [RFC PATCH 4/5] arm64: Add support for suppressing warning tracebacks
Date: Tue,  5 Mar 2024 10:40:32 -0800
Message-Id: <20240305184033.425294-5-linux@roeck-us.net>
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

Add support for selectively suppressing WARNING tracebacks to arm64.
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
 arch/arm64/include/asm/asm-bug.h | 29 +++++++++++++++++++----------
 arch/arm64/include/asm/bug.h     |  8 +++++++-
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index c762038ba400..6884089a7191 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -8,36 +8,45 @@
 #include <asm/brk-imm.h>
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
-#define __BUGVERBOSE_LOCATION(file, line)			\
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)	.long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
+#define __BUGVERBOSE_LOCATION(file, func, line)		\
 		.pushsection .rodata.str,"aMS",@progbits,1;	\
 	14472:	.string file;					\
 		.popsection;					\
 								\
 		.long 14472b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
 #else
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
 
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY(flags, func)			\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)		\
+		.short flags;				\
 		.popsection;				\
 	14471:
 #else
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #endif
 
-#define ASM_BUG_FLAGS(flags)				\
-	__BUG_ENTRY(flags)				\
+#define ASM_BUG_FLAGS(flags, func)			\
+	__BUG_ENTRY(flags, func)			\
 	brk	BUG_BRK_IMM
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
 
 #endif /* __ASM_ASM_BUG_H */
diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
index 28be048db3f6..044c5e24a17d 100644
--- a/arch/arm64/include/asm/bug.h
+++ b/arch/arm64/include/asm/bug.h
@@ -11,8 +11,14 @@
 
 #include <asm/asm-bug.h>
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)				\
-	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
 
 #define BUG() do {					\
 	__BUG_FLAGS(0);					\
-- 
2.39.2

