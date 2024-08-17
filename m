Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40795550B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC51310E871;
	Sat, 17 Aug 2024 02:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TRX92LVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449710E871
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:57:41 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20203988f37so14318835ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863461; x=1724468261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mY4VRCvd9L4i067FYJCdAQbgb2obGf5r9hy8hsyaNQ4=;
 b=TRX92LVcPpudXkes2Rmuht1UVapKsKc9JCYjln1Xp0MIYfy7e4XcQybLnrZGhuR8tf
 1AwJnSuqxUZszsy84/eV7/etxB5yK+p+tfpbat4jAgfKolFODgg7L4pWuDQq0TrlKcy9
 xBt4MIzYnAPoU7kS5TqUex+sP7L3ibwEbQN/ZR5nEUP4Hc7nvI2XRm2GWBbFUyFudgd+
 9cfQRime4MCMnL7loZv542Y+5kfF5k/+PxbjuFxaytRGl6iwuz1f223nrkzXYmNbkJVu
 GeEavQZnSx11ktNDFUW4W9rI6PjYpSKN/BcpmPMA+d5+t4QzWvOo3CSokLHhn4Syboud
 dtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863461; x=1724468261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mY4VRCvd9L4i067FYJCdAQbgb2obGf5r9hy8hsyaNQ4=;
 b=BFQQiA6e4tzPOBOZOfJusy5jv6RHsCjc5b+QFVlI6YZIvIgncAJWsn7/cArSNZVRzc
 9gNIZWSOBhFm1Tuj9LFvKi4ECZSZ+RGLOW3LhrBEpuSCHiXMifsWvK5k27QeIy7OTNDM
 /ZKHPUO3NSw3aobyjWHD1ApXhJCs7lshPDKVdI7omNtOwhoTUjbEktEQqMvG0KfLO8le
 SsaENStxEefqbi6nTYG5cm5CJKAV+0xJfEpx7nY0AbIWU7a6/GAYEWusDeHJVd5ELroJ
 eI5K1M65DNuCSW9eeJu1EVu3YOceN+4FtS0W9nX6eptHgDAWzxWw84WDvU1PoNwsSRtQ
 PiPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoSU+4apc1ArU1DI6wLuOMar+hKiJEsMhIMQDymWQAsfcxZTYi8wteAWmZrNUvkR2fr8hCEd8Tfb9K/2/oJjoO86CR/xQMrvYo7hLccPgw
X-Gm-Message-State: AOJu0Yycxg2ZQmMwmLPYENJTnR9d8GaFEXOv8dB3xh4hXC60+tkeDKGU
 wUjCPGiMJGiS7GGFInSL6Y7IAJZ0pPyilOOufOPV9nbAFRvsf8LI
X-Google-Smtp-Source: AGHT+IEL7YdwJrnU7j+3S0kOHwdlHJumXPs1OdWAsSouquvh+afE8cHfhlG2TFnMxzOYJRDIWJjJ4Q==
X-Received: by 2002:a17:902:e549:b0:202:100f:7b9b with SMTP id
 d9443c01a7336-202100f7d6amr36403685ad.35.1723863461337; 
 Fri, 16 Aug 2024 19:57:41 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.57.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:57:40 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Simon Horman <horms@kernel.org>, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v7 6/8] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Sat, 17 Aug 2024 10:56:22 +0800
Message-Id: <20240817025624.13157-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240817025624.13157-1-laoar.shao@gmail.com>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
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

These three functions follow the same pattern. To deduplicate the code,
let's introduce a common helper __kmemdup_nul().

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
---
 mm/util.c | 67 +++++++++++++++++++++----------------------------------
 1 file changed, 26 insertions(+), 41 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 4542d8a800d9..310c7735c617 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -45,33 +45,40 @@ void kfree_const(const void *x)
 EXPORT_SYMBOL(kfree_const);
 
 /**
- * kstrdup - allocate space for and copy an existing string
- * @s: the string to duplicate
+ * __kmemdup_nul - Create a NUL-terminated string from @s, which might be unterminated.
+ * @s: The data to copy
+ * @len: The size of the data, including the null terminator
  * @gfp: the GFP mask used in the kmalloc() call when allocating memory
  *
- * Return: newly allocated copy of @s or %NULL in case of error
+ * Return: newly allocated copy of @s with NUL-termination or %NULL in
+ * case of error
  */
-noinline
-char *kstrdup(const char *s, gfp_t gfp)
+static __always_inline char *__kmemdup_nul(const char *s, size_t len, gfp_t gfp)
 {
-	size_t len;
 	char *buf;
 
-	if (!s)
+	buf = kmalloc_track_caller(len, gfp);
+	if (!buf)
 		return NULL;
 
-	len = strlen(s) + 1;
-	buf = kmalloc_track_caller(len, gfp);
-	if (buf) {
-		memcpy(buf, s, len);
-		/* During memcpy(), the string might be updated to a new value,
-		 * which could be longer than the string when strlen() is
-		 * called. Therefore, we need to add a null termimator.
-		 */
-		buf[len - 1] = '\0';
-	}
+	memcpy(buf, s, len);
+	/* Ensure the buf is always NUL-terminated, regardless of @s. */
+	buf[len - 1] = '\0';
 	return buf;
 }
+
+/**
+ * kstrdup - allocate space for and copy an existing string
+ * @s: the string to duplicate
+ * @gfp: the GFP mask used in the kmalloc() call when allocating memory
+ *
+ * Return: newly allocated copy of @s or %NULL in case of error
+ */
+noinline
+char *kstrdup(const char *s, gfp_t gfp)
+{
+	return s ? __kmemdup_nul(s, strlen(s) + 1, gfp) : NULL;
+}
 EXPORT_SYMBOL(kstrdup);
 
 /**
@@ -106,19 +113,7 @@ EXPORT_SYMBOL(kstrdup_const);
  */
 char *kstrndup(const char *s, size_t max, gfp_t gfp)
 {
-	size_t len;
-	char *buf;
-
-	if (!s)
-		return NULL;
-
-	len = strnlen(s, max);
-	buf = kmalloc_track_caller(len+1, gfp);
-	if (buf) {
-		memcpy(buf, s, len);
-		buf[len] = '\0';
-	}
-	return buf;
+	return s ? __kmemdup_nul(s, strnlen(s, max) + 1, gfp) : NULL;
 }
 EXPORT_SYMBOL(kstrndup);
 
@@ -192,17 +187,7 @@ EXPORT_SYMBOL(kvmemdup);
  */
 char *kmemdup_nul(const char *s, size_t len, gfp_t gfp)
 {
-	char *buf;
-
-	if (!s)
-		return NULL;
-
-	buf = kmalloc_track_caller(len + 1, gfp);
-	if (buf) {
-		memcpy(buf, s, len);
-		buf[len] = '\0';
-	}
-	return buf;
+	return s ? __kmemdup_nul(s, len + 1, gfp) : NULL;
 }
 EXPORT_SYMBOL(kmemdup_nul);
 
-- 
2.43.5

