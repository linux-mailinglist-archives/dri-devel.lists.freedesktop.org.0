Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5094E4E7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB9610E046;
	Mon, 12 Aug 2024 02:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fMMK63Ju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F25B10E046
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:31:12 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fc52394c92so36128185ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429872; x=1724034672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mY4VRCvd9L4i067FYJCdAQbgb2obGf5r9hy8hsyaNQ4=;
 b=fMMK63Ju/1ww8Icml5ZqNmJaWEY5mjbCYeUzuY0LLHrA+rX7/IR8v3y3WokaPcTXuj
 ZdH1fy/kHyN/DndLPnOPgD9J2M67v1SDbs++u/FXeXy2oz4/pf3UpcBap7uELwweb6J+
 NO21TAJogE2lFKUlj1srfByhmsNfWi91cJXIz0dSWQ0Oc30+9TyAATSByk0GNmj60xK5
 ZtZ5b1eK0pqmJeKTyWgHVilFnJbLf+pgNkY7Ch4k6/faTVKN+e/OUaRT1c514rfzDBBb
 6FtHz0bsndFCaOMhVJMfDBf6M0OICz3eyq6sJ1rPSGeex4unN9SWrJs+jfsHnNcikv8Q
 rjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429872; x=1724034672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mY4VRCvd9L4i067FYJCdAQbgb2obGf5r9hy8hsyaNQ4=;
 b=sXBKxI3Bk5dGJKcT229b3sIsOLzRgsRLAqurFOfSpmwRH2PGT/AGNES8MqEvs/EfRs
 AweIVlQpPrFRhXepqZ/GIvpj/aLBhUi7RqC4Y16fzsZgtWjQbwCQmSoAJdDH6hHvexu4
 Je8q9lKWDGQ7eF1HIQSJTM/cecPOi0T3vjKbxV9V+Dd1E87ZtLIK6Ai5khXrlXHOPqJP
 dHU1YniP4l4aqsQsYoEIcZ7DNhto4BQXUy0NzhB89VrQFlgNWKtVUhzyRh9gjuA4cCbS
 +x5hZEIKgmKxkHQ+pOzNYxfth7svnScXbtqQ9uQmkJNnpKYDhfZg2aNBeej/TUaTfj5G
 6ZnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4w6l0iIq2J13XGmh/aB/t6ZrC+tt6IqkQJ6FXTG3WrJGTcbgcZbNQKsi+VS8qp2CFFWleIDEf+uwj3hcqaBGvEmgOnfOSexfqriwjIQKV
X-Gm-Message-State: AOJu0YzXbm7gtCIcsmzocaTLzWU/yGPCZf0YSrfGT9rtmnKkE4Fm5NmR
 8Ggo24S0F4MD+1uEnIyyd8nZNH8Xs3Hisd8mJCoqQu+5udnWZYhN
X-Google-Smtp-Source: AGHT+IGDYbe0RTpouvyRH8j57LNI0ygI4N2QpIwMJo/CclCqBa2C0H4JAnlCXTMiS2Sh5vz84U44EQ==
X-Received: by 2002:a17:902:dac3:b0:1fb:48c6:a2b0 with SMTP id
 d9443c01a7336-200ae4dbc8amr93864745ad.5.1723429872026; 
 Sun, 11 Aug 2024 19:31:12 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.31.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:31:11 -0700 (PDT)
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
Subject: [PATCH v6 6/9] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Mon, 12 Aug 2024 10:29:30 +0800
Message-Id: <20240812022933.69850-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240812022933.69850-1-laoar.shao@gmail.com>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
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

