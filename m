Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543428799A0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1B210F95F;
	Tue, 12 Mar 2024 17:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TGHw/KIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A03610E789
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:19 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dd68d4cff1so32062565ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710262999; x=1710867799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3Kc+Yh+XQ4llosDDGAwX/2k1FGi6g14GWlRJRORANM=;
 b=TGHw/KIxdrbcnplBHRcBHV5bU9j4lSkjNj959sNJaUqp7WpF9Nv08CiZtDIWhnghZJ
 zSnw15KPyTZk/XCa/oQaj1oejtzsLNvWZ6aNNPwAX26TgFAkArSYXe4NG0KHDIv8eX7h
 i9eJBs2ws3tBX3wqts/cx8LUiz8XFbQuZCxBqSvxn/5KeaRoxCC4T1QqNM+z+sqgwaDE
 pQZjfpTo6DZLxNpc2OQRZiEi/Cq7b0GMsi8xM5tpeDtuukluyhPQ57IHZlrUg17G2I+L
 wxpmetYc7yNKl4Jh9BqWlFmT3CHN9zteDmSaLWup75LxNOrVtUkFcniNPRDoBeK8cd4/
 jTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710262999; x=1710867799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R3Kc+Yh+XQ4llosDDGAwX/2k1FGi6g14GWlRJRORANM=;
 b=aIK6dzs70W+NqQoEHzeGZ4WeRo3ONklYZ0Rqy+MaSgO5CU5GRGfs7dWkcuRFplg9dA
 UH1g3dLG4+ykCeZQ7KmG9kXw3Pjym2rXJ3soLEvv19g3JMb+t2usta2CfiMiF7hMP1el
 g4AEZgF/Y74JZoc7bh36DaXlHfYUioxUw6Jq71CXEuvoiQBDmEwAg/VWf283PoaX5LIh
 j2CCV8e/y4pmLij/ByntQViKsJaoFpLgQdEopC+zPWPWoe1lOXh+zoXVhmHHg/dOgHP2
 eb/qd2mzzX/ooddAuYhBewuL/rlQZ7aKidgDVfQYKgKk38eD9AVsLNDV5NSkBR17gU+D
 9i5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWGD0r8ARVGb0+27ls1ScByl1OiDqIcp640VdxEAIg2bT8Mm/89UJnyk08ITosTkS9DBBcsBbfHrAJliNiqnr2rRCJpYH1DgWliDPA8pZA
X-Gm-Message-State: AOJu0YwVmq7tCsMQBKnEaR88pdJcC9TVu4KqT541xt81TjISP1EfF88g
 15b0GVNUKH/rjbCO+eFPbfiIFPyEnkSJ327+OKYnBe/wDRczZHac
X-Google-Smtp-Source: AGHT+IEtMqO0igDV/OJPl9l/q0X7vf8EgJ9VbKv7ARIuPeUFcb0gEvMyJN5DQCEgr2SoDMnFKNIL1A==
X-Received: by 2002:a17:902:7b95:b0:1dc:418f:890b with SMTP id
 w21-20020a1709027b9500b001dc418f890bmr8936395pll.40.1710262998624; 
 Tue, 12 Mar 2024 10:03:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902b78400b001dcc3a46a6bsm6883069pls.262.2024.03.12.10.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:18 -0700 (PDT)
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
 netdev@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/14] kunit: bug: Count suppressed warning backtraces
Date: Tue, 12 Mar 2024 10:02:57 -0700
Message-Id: <20240312170309.2546362-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 1e34da961599..2097a854ac8c 100644
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
 #else /* CONFIG_KUNIT */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define START_SUPPRESSED_WARNING(func)
 #define END_SUPPRESSED_WARNING(func)
 #define IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT */
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

