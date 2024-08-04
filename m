Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD1946D3E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7A910E0A0;
	Sun,  4 Aug 2024 07:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jq/rr7Tx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442A110E0A0
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:58:21 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1fd69e44596so33007395ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758301; x=1723363101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bS0UkRamrVL5XCR4Rnj9cLPm9Cl+fEpiyHi/lwqSnvY=;
 b=Jq/rr7TxlxrNR0ucv8scxKPHIpEH2dUnNMdUsq/6ErJ7rpplt2IYtMw+K9aekprA9e
 m/kUW+x1atZYfik6H90y6y2pw/kmYzpS1urspaURcga5DmqR49h0cAlvecFokiP1mzcj
 oXqp+hxhBD0yezMbCkdcfJ0OeDZ3jaxcep+ud6zgOxrzD8cneZE4DFe7wOpbTZh6f69h
 G5Ca/SVy6KT9TUGRu7y4VkJfSI1PocJ52+OxlMCeosQyrVbsuw4RQRID4hNEYadHbSIf
 oJDBdJQb64rROnvUYqMK39zZUUACverOS5YPrWOw3FEKEwlgzEfX2VmNFSVYzjHwpmAa
 6jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758301; x=1723363101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bS0UkRamrVL5XCR4Rnj9cLPm9Cl+fEpiyHi/lwqSnvY=;
 b=Pv262d1QnfYeuUjdl6dMrY2tIXT3j60srEVLnhOSCOsSBJw8rZA0vYMKhZRsX2dj0U
 LFgv7fiNADSFi1qQYHVkaTgX7ZXIklB3+HcLRKcFidmZvAGJoINgYwprjU0yWzm1PO5B
 O+rJMIEzlr8f43oERuuTpC5XPnVZkFffnaP0/y65oDTHDEic5CX16g+M8SQytFjzPSxs
 6JNBpjU+GfhPbGpLMdzhgxGJhkojQsl35x5yq3NqDznaxvWy3GqpDqxGWSLeOu9Skdf/
 QRSTZJMz+CQ9IXzswBd0FFgzAmXGeA5sBuCQJc041agTh7DZF+xt7Z+sxZCF8+JWeapF
 hjwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH9rEOinFarfRKvl0E56YPyKLbnUMtFA622CkCO4ChqIUsDpXDyRglidk6dmO4XCe2Rd6VPX/zthQpWXsQpZ5nSNWcNRVasnkcEXySBqVc
X-Gm-Message-State: AOJu0YzKRivY3VzbGnWbtX94R86kQHF7hHXR3oomB/6nYvIZVXubr26Z
 uyyABY3xAHnIhJi4EZmmJWx/gO2vmYu7vSHFUlfFzPA3p7LmTscY
X-Google-Smtp-Source: AGHT+IEGtCQCVMnQCKfJ0+BIkhT35+DpDH9a54ylBrsi080HAExdi6zY8c1ZJxWy2ZwMLSFkL3dmww==
X-Received: by 2002:a17:903:1cb:b0:1fd:7ff5:c673 with SMTP id
 d9443c01a7336-1ff523ef0dfmr156564885ad.2.1722758300691; 
 Sun, 04 Aug 2024 00:58:20 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.58.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:58:20 -0700 (PDT)
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
Subject: [PATCH v5 6/9] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
Date: Sun,  4 Aug 2024 15:56:16 +0800
Message-Id: <20240804075619.20804-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240804075619.20804-1-laoar.shao@gmail.com>
References: <20240804075619.20804-1-laoar.shao@gmail.com>
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
index 912d64ede234..2c5addabd6f7 100644
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
2.34.1

