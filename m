Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AA93EB7F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDC110E23D;
	Mon, 29 Jul 2024 02:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cmV0ZuPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E6410E2B7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:44:29 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-6bce380eb96so1461731a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722221069; x=1722825869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxss6iSMiIilMwCNJtHyPtBSL44EBghXiK4U5v9w5a8=;
 b=cmV0ZuPHzOS6Slvxcdied5UxTXmM2uAV3bThZWNy4i/rSUaI10HfHnaaEB0FM3w+/o
 Aq7flzyqUy5CX456tKAm7ghqDEGdOJzusn6XMEh5BjC0ATzHoojgQEahsWVPY8cbK4oN
 CRN3ghz08EfObLbiJzPdK4v1XndbPust/n8LxZ2H9z40Pht6OKdR+H+5ebYEI3MPC7gj
 ebbQczwQTuOpotrcAKP8OxEQeEPf07VZFpDARyPgjas+ieQws8xIupqF/uU66gAh06sZ
 vOexN9GPYVOMbNfGnaGZ3HsxPI4T/u8Y4Uab501A9jwTzjQWf8dD5+3xeX1g9WWh/DFU
 XnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722221069; x=1722825869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxss6iSMiIilMwCNJtHyPtBSL44EBghXiK4U5v9w5a8=;
 b=YF3VkbrDKwneCNK4s37nJwlu6WSBSBOBh4qIy32G6E4dcEHfhbIYpWDzSFJiRdApIr
 BqWA0dHTZDZdxplc2RwlbzZs69VZKrljz61ELYrGjvs2qVGxwKkVyg8YGHCKYsQVyhq5
 Djlx2NG8oy+N+la7Rqh6NPm1UIYsnQWLkATY+kQnqwTll9WgjosQlv7zr110kCH19xVu
 6yEWNNiCy4+rXKe/qdStmuw+9dky9c8zj+9J6ZANcWiyqt4sNeGvkslZYB50kJ7r8ecp
 W0F+e+JP4iriyn8K7HdXBbSqT/E8cvGkBSYpeNLSu/qaRWpxPqBtgaZ1AP+HE0qWNGAA
 KpNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEqFAyT5memgJpz/skJtbYnON2Laq3hUOtqZOZ/iCV+oDbM3W89z/AAFLzkoBHX60yNNq1rbaAD3tUwbZAbqUOz0UBgYKnh7CagGUVFHG9
X-Gm-Message-State: AOJu0YzqE7lqsU/GJdnXwW3fTIPrPI7IuAOIqDhgw/zpiE0ecCJuGwZP
 TWd2iZEJaB3ZdLcOL2W3dU51tr3OOcCNqADWhcfd8ULUTG2i5NCv
X-Google-Smtp-Source: AGHT+IG7/eKYXg7QfYOb1CdYS0BMtkGw6Mkjs56lIRKp/S/546Q1z5Hj0Wkc3TWWQHawrwJ+z6MQVw==
X-Received: by 2002:a05:6a20:1582:b0:1c4:c7ae:ecea with SMTP id
 adf61e73a8af0-1c4c7aeefb4mr1212793637.11.1722221069087; 
 Sun, 28 Jul 2024 19:44:29 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.40.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:44:28 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Simon Horman <horms@kernel.org>, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 06/11] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Mon, 29 Jul 2024 10:37:14 +0800
Message-Id: <20240729023719.1933-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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

