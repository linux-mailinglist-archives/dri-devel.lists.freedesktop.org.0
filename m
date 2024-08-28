Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBCD961C8A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8893C10E48B;
	Wed, 28 Aug 2024 03:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gq16KGPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139810E48B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:04:23 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-71423704ef3so5001094b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814263; x=1725419063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1UnhBnsG0EZ9945TsUyg6NQ1s52ltgN7fNtAXZRUfE=;
 b=Gq16KGPyoiemwHAiCfAWhVcjwZdJ511YnZ5u+YY94qZLfsxIetDzP4icF0TGwTWR1N
 DaVUjeP4H+yGIDVZLGHeo9QzbLfp2FcAouvR/IoFdWBvUuA6aqJrzuPPo/c/hZ7aM9YX
 DOgJAkcSDs6EiXdvt/bh/ekzvECK+ZyVN3FEDsP4xENPgcV49I+iPvE/rFboqi/wwdMo
 /E9/ZHxqSxxD6AACdDw2coNnBq5pGtcT0s6NoAwvxH1UMHLYl7XOzRFDhJXV/FCRjDXM
 7fEIDdRB+x2GQawhbpzB8DiAjj9uJ22+Iu/5ZYK91AxADd6BnoaE8ZA55lSZHdIOwXoM
 u+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814263; x=1725419063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O1UnhBnsG0EZ9945TsUyg6NQ1s52ltgN7fNtAXZRUfE=;
 b=iQzD2f9FQPpr/8+YvY+/M34wiwBH1MvthbJKJrhwtGH3vLNoJ/aH6Rf3gXOFVTH0FV
 J7VXXIF7s+gENQdAD5KSzIjzTK8OSBKOWk6H3tGt2FjONrKTaDizp//k8uML3h56FDMl
 aX2pRXKDpibnYNwPSYI/yltGLdpM5Mtql1NcZG2w/S0svau1lI278ynKOI0W20+hT2yN
 WvbG8w6+lNLSNroFR6l4VtHlUGWLn1ENtQ8CQrCJhjGYkVE3vSkROhkn+5O3dPPmGwMY
 SNYTT/Ir9AJFIcpM9sa+QjMUH0RAjXj234SGntprZ0WMtF7GTbd9L2D5UOHkfLnWTunw
 ahZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAiSwEpDlkuG0BSqIGmea5LtXdF/iBe8drYXWtLbHwBsnDtmbsiRkpAvVEk3Eova/F+7fIcEcK7/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAXc2NbLBagAsyMYaE8xJ0EcB6mUgHe2evRaAx9LX8/UAJyAKS
 m2RvYHdJCA1dS8ropX2gdsHYwBY/AHrcZFyC59MnKxmDKEyx1Sxc
X-Google-Smtp-Source: AGHT+IG7QBffnYc0dCLvaTOX5KXK0mJkKlpaXmWfgPhMMu+561lRAfU2Q11Tqx0ug2HVRiltuCcmIg==
X-Received: by 2002:a05:6a20:b598:b0:1c4:b931:e2c4 with SMTP id
 adf61e73a8af0-1cc8b4bd8bamr18005852637.26.1724814263473; 
 Tue, 27 Aug 2024 20:04:23 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.04.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:04:22 -0700 (PDT)
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
Subject: [PATCH v8 6/8] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Wed, 28 Aug 2024 11:03:19 +0800
Message-Id: <20240828030321.20688-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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
 mm/util.c | 68 ++++++++++++++++++++++---------------------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 9a77a347c385..42714fe13e24 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -45,33 +45,41 @@ void kfree_const(const void *x)
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
-		/* During memcpy(), the string might be updated to a new value,
-		 * which could be longer than the string when strlen() is
-		 * called. Therefore, we need to add a NUL termimator.
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
@@ -106,19 +114,7 @@ EXPORT_SYMBOL(kstrdup_const);
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
 
@@ -192,17 +188,7 @@ EXPORT_SYMBOL(kvmemdup);
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

