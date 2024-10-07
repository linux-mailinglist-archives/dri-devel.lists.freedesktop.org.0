Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C8992FE6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEA010E3C1;
	Mon,  7 Oct 2024 14:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U+sMnO53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9E10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:50:41 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7e9ff6fb4c6so2437589a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312641; x=1728917441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBFkTCCgw4nKzS/UQclQt52OlK7datrkk2Sl/mMl9SE=;
 b=U+sMnO53EAWN45J9OdGH/093zboDIW+EibQtCthawDmVKXsPVhUkifytZ8OYwHRgqe
 BQEXlwFCBzVuKPd4lh0QSDBibrtik2FGFt4AG1qHkEQJn3niOumkl/vxAuEk8sjLPNx7
 NHNZAwO/JZXAMnlVrLFneTfNfbaFpsB1A1ZATOVd1bmClbJPK93emX/pozDQVdabv0j2
 QkKTpsV6bMVJ6icCCSgeJbd8Jz1g0L58jw12S4lAeW3UQ6rwwOC4oBBDvpPiXlbdJaJ2
 NpqYC8sZWxRZWr1XdgoxyzxxGnZoGI0G9ZfwZOg3Q4FAE6/75NaMP/31hcNyUkWZNyOQ
 RjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312641; x=1728917441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBFkTCCgw4nKzS/UQclQt52OlK7datrkk2Sl/mMl9SE=;
 b=qvn8mMAU77fY3ZitBiktH/DhrBdUF1jf9kliCpDuqM2Zra/cx3Hpef6vhGW4XOYV+u
 D2BbEX1+cD1nyrU841ij8/dT7wrr1r+K+fTIOegT5kqT99fBziEHQrVPo8SayUSZyt2S
 o9O3ehP2utZx+g7AD1GX1UQZTtQnms4r55FMtjQ47MtUiBjUucltYsmIlYBUGdi0tzvb
 pZWZONCXoDxvwptliqo1a0UlwrrXMYhwIV8En76wcp/AzyB8fjWeINIQwka9qwoCUe02
 EADMlJPUF9um07H/a+L/f9nGgken3ArZGBAO/TODoXZ3Jnsr1m93V7DrGzSmGBHoQW7+
 B1NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVky/FuhbadryAh1OR1dXNNcJul5vuxjR2HepT0jNdnxRoIhCkyMwsRE2UmWOYhb5yqwe0UGf6qfEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3X0pR6fzsopH0N9i5mu+Oii0YADS6W9D/NcfYhs+74eqTFSzG
 TJw9BsFctz3ATPRqEuxSvJWYFdWoX3KpMstIvf4GITtcX6vJYpI/
X-Google-Smtp-Source: AGHT+IGsy7J8upAtizdqT7cwdExa0Ot6GSfKRh917J35OaiwbZMAM2iFolVRA0oRI0wvfYtn8vWlEw==
X-Received: by 2002:a05:6a20:9f8f:b0:1d3:e4e:ff55 with SMTP id
 adf61e73a8af0-1d6dfa22f17mr20436900637.7.1728312641423; 
 Mon, 07 Oct 2024 07:50:41 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.50.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:50:40 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, keescook@chromium.org, alx@kernel.org,
 justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Simon Horman <horms@kernel.org>, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v9 6/7] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Mon,  7 Oct 2024 22:49:10 +0800
Message-Id: <20241007144911.27693-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20241007144911.27693-1-laoar.shao@gmail.com>
References: <20241007144911.27693-1-laoar.shao@gmail.com>
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
Cc: Alejandro Colomar <alx@kernel.org>
---
 mm/util.c | 69 ++++++++++++++++++++++---------------------------------
 1 file changed, 27 insertions(+), 42 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 858a9a2f57e7..c7d851c40843 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -45,34 +45,41 @@ void kfree_const(const void *x)
 EXPORT_SYMBOL(kfree_const);
 
 /**
- * kstrdup - allocate space for and copy an existing string
- * @s: the string to duplicate
+ * __kmemdup_nul - Create a NUL-terminated string from @s, which might be unterminated.
+ * @s: The data to copy
+ * @len: The size of the data, not including the NUL terminator
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
+	/* '+1' for the NUL terminator */
+	buf = kmalloc_track_caller(len + 1, gfp);
+	if (!buf)
 		return NULL;
 
-	len = strlen(s) + 1;
-	buf = kmalloc_track_caller(len, gfp);
-	if (buf) {
-		memcpy(buf, s, len);
-		/*
-		 * During memcpy(), the string might be updated to a new value,
-		 * which could be longer than the string when strlen() is
-		 * called. Therefore, we need to add a NUL terminator.
-		 */
-		buf[len - 1] = '\0';
-	}
+	memcpy(buf, s, len);
+	/* Ensure the buf is always NUL-terminated, regardless of @s. */
+	buf[len] = '\0';
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
+	return s ? __kmemdup_nul(s, strlen(s), gfp) : NULL;
+}
 EXPORT_SYMBOL(kstrdup);
 
 /**
@@ -107,19 +114,7 @@ EXPORT_SYMBOL(kstrdup_const);
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
+	return s ? __kmemdup_nul(s, strnlen(s, max), gfp) : NULL;
 }
 EXPORT_SYMBOL(kstrndup);
 
@@ -193,17 +188,7 @@ EXPORT_SYMBOL(kvmemdup);
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
+	return s ? __kmemdup_nul(s, len, gfp) : NULL;
 }
 EXPORT_SYMBOL(kmemdup_nul);
 
-- 
2.43.5

