Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E388AC7C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B0D10EA34;
	Mon, 25 Mar 2024 17:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cMPH9HJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED10510E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:53:14 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1df01161b39so36243705ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711389194; x=1711993994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YzJYq0fkceHof/EPazly4M40tZRXgMzxd6Hp1cFk9M=;
 b=cMPH9HJW6N5IdPMsjk06GSU7SuJX/ccVI6abM4zQcPWt0LtxSuvDeIjdzePEPgfS7s
 oEGDMGVl1mzSplmO/gV8iNJdey0HPZ5yqSlyNpnMVH7cIyH5eaCCs+6F4BZtekWGUF6n
 +idBVyGsAkxX36PQhDz0LevkRLDrtJ+DGE79Wsvt+g/5aaaeSRLHm3MM7cNFWdlCOxnu
 W1m7yuo49dIninjfg6H423viXiwu7IfxMaBUhUoLYU4VNQOzqk9OpiDmQht7ZUL0Y5+g
 maVPKVeiRP4kD6ujBo2D7fCGzAAosWf2yqfx2hM3HbhblS/Yi1kYc/EJeIFf+fRNb2Gi
 L55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711389194; x=1711993994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/YzJYq0fkceHof/EPazly4M40tZRXgMzxd6Hp1cFk9M=;
 b=hRrMmLVq/j7BfX/crxTvK8PoneU81fZU0anhgHcu8Rk6BF9v4UOYYRUCu5pxmsUNEL
 3WMO+x/vsrGDBG/Nxmj+8eahDFNWWn856Vn8LuMAwJIQ+qyEH0NB01DeOhgdp0rAwUGr
 Vn/nx7mIYTKQKQK1wG9J4yO/yyPWadz+DN5R7NUSMaFkgT3jV4JTMM4Vt/Rlw9vR+Knu
 gsp74Iu5bt0FS91JAa/retWXIhzDWgpu4MK1PjmuUnAAdPnLt9+ZajAFMrvKTm7dntcr
 a8o+Acg7sczsmayTEhpnQ3f9y49t/51K/QmaRcVGaucu54JnfZMzWqzsWup5QlFasGsn
 nX/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIbQcOP8E6vaxQ+OVC6D295vhV9ytQoc4el83v5hPNEtfJU9v0syZkzN2LsgPo8BCILHe/ER/pbWwpRzsapxzUHqsjllP6f9n0Bg6uXvGp
X-Gm-Message-State: AOJu0Yy599MvknnGURE0EdEdTUC8mhkCccwcEX/3Zz98HBpF9NeVgvb2
 nTlbCUHIgsVJyNTdWD1LYAc/MZXyaEs7HlmBK7a5GaY4/TwaCAt2
X-Google-Smtp-Source: AGHT+IH4L5pCyOM7/NriCMnotw9B9wTRd/QlGQsY00iVlUfB3rIc/3hcXxQD6OWxPS5Q16CPFVorBg==
X-Received: by 2002:a17:902:b495:b0:1de:faa5:552 with SMTP id
 y21-20020a170902b49500b001defaa50552mr8062370plr.56.1711389194428; 
 Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170902c10100b001db8a5ea0a3sm4986539pli.94.2024.03.25.10.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
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
Subject: [PATCH v2 12/14] sh: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:46 -0700
Message-Id: <20240325175248.1499046-13-linux@roeck-us.net>
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
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..470ce6567d20 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-	"\t.short %O2, %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	__BUG_FUNC_PTR				\
+	"\t.short %O3, %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b\n"			\
-	"\t.short %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	"\t.short %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG()						\
 do {							\
 	__asm__ __volatile__ (				\
@@ -47,6 +62,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__), "i" (0),		\
 		   "i" (sizeof(struct bug_entry)));	\
 	unreachable();					\
@@ -60,6 +76,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
@@ -85,6 +102,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_UNWINDER),		\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.39.2

