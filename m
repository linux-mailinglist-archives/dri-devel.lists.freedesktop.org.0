Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044F911892
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3082910E879;
	Fri, 21 Jun 2024 02:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dFQGGlNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E010E879
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:31:41 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7041ed475acso1455859b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937101; x=1719541901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIxIpX3fSDij30wx/6pUEm1wGM6JrlT5xZ3d0lBG2nM=;
 b=dFQGGlNObsylBcm/kYiOeyEHczbvQCShmAK7ZMqTBWk++3CvKBrvk4S47339aV4h8m
 lZ6KQuuLovPjL6bZ24IY6yugEhCF+dB5INFr0WO17uGl9u4TM3F2AkTX1vKJzdE0fIxN
 QyXrHYJtkHdYsv6mS4HglDRYg2B25/SnZBP6kKioDQ0QPAOAJGsobK7DEUwB2iXcWjic
 nnwfiXdsamUqvasaP4zErxyb+gXpcs8Yugbw9mUFy+dbcF/3P9NETarogNDUvqLW390F
 fsHA93lz12p5wc0OvGRHmdWklvB3TfRzJlZrS6edlRRLtDY3p5P68zU1jHefJ0ZIeuXy
 1e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937101; x=1719541901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIxIpX3fSDij30wx/6pUEm1wGM6JrlT5xZ3d0lBG2nM=;
 b=f7BUCXuY2oWRmSF4ZpQZrvDsxEjEr0I5JcRW1dMsj/dlRjIe5pZPDvYmKxBwdK4esU
 aHqJizoRxLbYC+Ps0q+RoVE9JqJF5gpXF37/BVd4IjtJqCP4FnEpEG1WBBDVTP7h31i7
 zmSLXJVo5Hr93MOYr2OExYO+URaba60N2mwsX0rLkEbJ5t2DQeMP0dLY7P55vUhVXcAU
 n1BV1jjHUCTNEBX/NI3mt94cJIyYeyHyuV+SZpYDZ6UQt0gXUjuixVDIhIw5an/ncPJu
 2yMiZciiKgCpaLxfQX3H6yko77A2Mt0Z8wZ/eevvy6nws7yhmr4NOOwcrarUlnLroVe7
 53Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnx2nJi4CxTGKnY+K+6K1iYOJ9uxKER+9ZoX9S/CdTnt12zg1HxuvMrDSVNZtoe77ugswnEDXGPRe7wEV8WoELXIFLeu0ZC8AoceGJpJI+
X-Gm-Message-State: AOJu0YxrxRjHB37rrhK9laBOFrGf0SaHqGfTtoE2KNJvf1gYL3MvaTmc
 qlok4NC8gWB/eRgPZYe5amPQI/rHFGW/Og+pHs6olPN3ZUdb/95T
X-Google-Smtp-Source: AGHT+IGYNoV/DB/o6zRof24rJ6xmZEwxYI9LpBEDyg5OiYjfuVgaYmaCgemL5OUn4y/KnIdaoKGjig==
X-Received: by 2002:a05:6a00:2f43:b0:704:2d64:747 with SMTP id
 d2e1a72fcca58-70629c1dcdbmr6929306b3a.7.1718937100840; 
 Thu, 20 Jun 2024 19:31:40 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.31.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:31:40 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3 06/11] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Fri, 21 Jun 2024 10:29:54 +0800
Message-Id: <20240621022959.9124-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240621022959.9124-1-laoar.shao@gmail.com>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
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
let's introduce a common help __kstrndup().

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 mm/internal.h | 24 ++++++++++++++++++++++++
 mm/util.c     | 27 ++++-----------------------
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index b2c75b12014e..fd87f685739b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1521,4 +1521,28 @@ static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
 void workingset_update_node(struct xa_node *node);
 extern struct list_lru shadow_nodes;
 
+/**
+ * __kstrndup - Create a NUL-terminated string from @s, which might be unterminated.
+ * @s: The data to stringify
+ * @len: The size of the data, including the null terminator
+ * @gfp: the GFP mask used in the kmalloc() call when allocating memory
+ *
+ * Return: newly allocated copy of @s with NUL-termination or %NULL in
+ * case of error
+ */
+static __always_inline char *__kstrndup(const char *s, size_t len, gfp_t gfp)
+{
+	char *buf;
+
+	buf = kmalloc_track_caller(len, gfp);
+	if (!buf)
+		return NULL;
+
+	memcpy(buf, s, len);
+	/* Ensure the buf is always NUL-terminated, regardless of @s. */
+	buf[len - 1] = '\0';
+	return buf;
+}
+
+
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/util.c b/mm/util.c
index 41c7875572ed..d9135c5fdf7f 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -58,17 +58,8 @@ char *kstrdup(const char *s, gfp_t gfp)
 	if (!s)
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
-	return buf;
+	len = strlen(s);
+	return __kstrndup(s, len + 1, gfp);
 }
 EXPORT_SYMBOL(kstrdup);
 
@@ -111,12 +102,7 @@ char *kstrndup(const char *s, size_t max, gfp_t gfp)
 		return NULL;
 
 	len = strnlen(s, max);
-	buf = kmalloc_track_caller(len+1, gfp);
-	if (buf) {
-		memcpy(buf, s, len);
-		buf[len] = '\0';
-	}
-	return buf;
+	return __kstrndup(s, len + 1, gfp);
 }
 EXPORT_SYMBOL(kstrndup);
 
@@ -195,12 +181,7 @@ char *kmemdup_nul(const char *s, size_t len, gfp_t gfp)
 	if (!s)
 		return NULL;
 
-	buf = kmalloc_track_caller(len + 1, gfp);
-	if (buf) {
-		memcpy(buf, s, len);
-		buf[len] = '\0';
-	}
-	return buf;
+	return __kstrndup(s, len + 1, gfp);
 }
 EXPORT_SYMBOL(kmemdup_nul);
 
-- 
2.39.1

