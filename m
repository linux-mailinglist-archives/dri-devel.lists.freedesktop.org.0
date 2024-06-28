Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3591BAC7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E2410EBE4;
	Fri, 28 Jun 2024 09:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ltRUuNMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9BE10EBE4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:06:02 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1f64ecb1766so2080985ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565562; x=1720170362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxss6iSMiIilMwCNJtHyPtBSL44EBghXiK4U5v9w5a8=;
 b=ltRUuNMXnYKIgPY2VoFcTXP3SxFRDBC71WF3YhmS5E5bzfBnufXdabx1V6vbyd3QfB
 +DBC9ZegdP8/U04N9y13nsfmK3xk36BFLpFJjkUHTlL2jidYSR75zN8T6u4A8W2GN6o2
 a2hhxmkf4wTvStntf0ciT/1p0TUSKFKsF/5jhcgqbKdiuJxX6kHe8CF82IU2UK784YYp
 2coBb3hJspOlRIW6xFfW9iNrxQi3WDyHV4tefiho2xFQeI32WHTpesg+n1pv4dhFIrac
 o0Y5hf+r0qusZKa1ECxY1CZQOCmlxzpIgJpXcWGqiP/sDgNEijyXNaiLnPyN6lRsBYcr
 NY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565562; x=1720170362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxss6iSMiIilMwCNJtHyPtBSL44EBghXiK4U5v9w5a8=;
 b=EtBQHKo228Kcr4EPB8Lf+kYWMJq4tJ4IyK8YjKhJXSGtWtXFgWoJA8+x6uz+Kv65jd
 UpKnQSu9BIZjRcMHp/ui4mcFk43rVORiEDQuQc3vmRSnmliZguu1w5M38BMVzBLWCycS
 suo1Fepi6L/u1zcHq1qO//Kz1nfQqU7rv1kqwS8rtwkbWjAaTc07E7cL0q1BdERL7g2z
 QQZ9XdsLxU6eFEs8m5hOBH62waheEIRU3h71buD8Vt7QkyduX9oE3oYrYaM06v8fYlta
 tTx0d102NXtimoIYmgOQsvMFCF3FODLIU7xgTOuqyqC9bqakW0ZmmioIu10UcXx3rK/Z
 GTQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUzmZsqeftkiAygGVu1PPbTPaeTAJu4JpYkb+XQ6K3oN1y1YeVxVgEUXlFeyTQFp228berTeJpHSa6RzC3hDNyXAXr8XBDFh851LiyTEvg
X-Gm-Message-State: AOJu0YwhYd9ZRm63OsNz61qCKm1WAk1/LNOWeuTctoarFn+lKJJSs86o
 SUhTmd8miAQytz5DlT+CZZs/CGpQscwaVZzhAb1aVWz4rY7ngjau
X-Google-Smtp-Source: AGHT+IF41G2qRww4DdF/h1fHsQyMDqy+U0zSGeUJQI71N0qwJDXNmrrmWplbD4mTRfu3C38uIRvv6A==
X-Received: by 2002:a17:903:18d:b0:1fa:2001:d8ff with SMTP id
 d9443c01a7336-1fa2001dad7mr177652065ad.52.1719565561588; 
 Fri, 28 Jun 2024 02:06:01 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.05.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:06:00 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 06/11] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Fri, 28 Jun 2024 17:05:12 +0800
Message-Id: <20240628090517.17994-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628090517.17994-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
 <20240628090517.17994-1-laoar.shao@gmail.com>
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
index 41c7875572ed..62a4686352b9 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -43,33 +43,40 @@ void kfree_const(const void *x)
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
@@ -104,19 +111,7 @@ EXPORT_SYMBOL(kstrdup_const);
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
 
@@ -190,17 +185,7 @@ EXPORT_SYMBOL(kvmemdup);
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

