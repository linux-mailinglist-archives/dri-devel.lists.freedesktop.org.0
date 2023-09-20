Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC21E7A8060
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFF410E4A1;
	Wed, 20 Sep 2023 12:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A68210E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695213406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJRnSvDMQADh3Wr31msjxxHMdDRAXuX2nElLtMGFtqc=;
 b=O8hwweB/dpy+qu7PiJQ0FPoKbA1n4iR1HSUIcHb9O/jXQTWqqwNNu2GuBbRUWciRZXbLXH
 tf4QCM3CHeER2D/L6RMfBjjNlkm2vSPS+gMz5mN5HH3N0AhJRqfXw58RVQv1DEDSfBqnVl
 KODu+tb2EdHXe3LB+lJHPXFcXKrsteQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-otuqMiLUM2-470CQ33MicA-1; Wed, 20 Sep 2023 08:36:42 -0400
X-MC-Unique: otuqMiLUM2-470CQ33MicA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ade76f4a44so68122866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 05:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695213401; x=1695818201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJRnSvDMQADh3Wr31msjxxHMdDRAXuX2nElLtMGFtqc=;
 b=WqKer9s3vtCfTRZ+BgTx85DzjGOC4Vgnb5NwdD7KD/4iNUCTtY8iGxpIYd/hrnQV3V
 g+XL09oLY/ibTILSVr6B4N1tFgJPY9Re2PAzsdeim1yAHuV4QnMAEH5nQ9+znK86K2Al
 nEjeu/4Q6XC/eoIFeS2wOTcQFQ/JJMm8m0zLS0M59Ir+I+ZgibN+Cu6nDqWtj0/gLvbi
 o6nVBc/YcJJMgwgEoDj3087r/yASB2nDHsHp9tFG2Ag2JkQK7LSTpbV8mKq5HDkJBTfZ
 +tAKtb5JjMo+QpRi6XZ8nU7zY93mt42ZYpKizkR3qKm5R3pCssMYZsfM85Ai/1iYwVEJ
 Pydw==
X-Gm-Message-State: AOJu0YxaCUZMBZAbmb78lB8cuxXoSR4OxXIuJRNSb/sC/i7o/h0udhTs
 uZaY2NFGJQkh8BvFpg54OxLoyku0hcq9tOKSbvEq/FUDUmk1ZPOHgSquyfkIWEXwxuH4dJOKSXU
 1h34UVV6eo81S3ySLITuC+CMQO06d
X-Received: by 2002:a17:906:196:b0:9a5:9f3c:961f with SMTP id
 22-20020a170906019600b009a59f3c961fmr1815583ejb.3.1695213401709; 
 Wed, 20 Sep 2023 05:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERwQ2SjAJQSsC9ZRe6AiF2nzMLomaRThlvgCuHfKcv/TAIMXpcfLWGpl0wj1aEZwFhaqVjcw==
X-Received: by 2002:a17:906:196:b0:9a5:9f3c:961f with SMTP id
 22-20020a170906019600b009a59f3c961fmr1815563ejb.3.1695213401348; 
 Wed, 20 Sep 2023 05:36:41 -0700 (PDT)
Received: from fedorinator.. ([2a01:599:906:7772:a505:d891:dcff:9565])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a170906191200b0098e42bef736sm9348305eje.176.2023.09.20.05.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 05:36:37 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: [PATCH v3 1/5] string.h: add array-wrappers for (v)memdup_user()
Date: Wed, 20 Sep 2023 14:36:09 +0200
Message-ID: <20230920123612.16914-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920123612.16914-2-pstanner@redhat.com>
References: <20230920123612.16914-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, user array duplications are sometimes done without an
overflow check. Sometimes the checks are done manually; sometimes the
array size is calculated with array_size() and sometimes by calculating
n * size directly in code.

Introduce wrappers for arrays for memdup_user() and vmemdup_user() to
provide a standardized and safe way for duplicating user arrays.

This is both for new code as well as replacing usage of (v)memdup_user()
in existing code that uses, e.g., n * size to calculate array sizes.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 include/linux/string.h | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index dbfc66400050..debf4ef1098f 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -5,7 +5,9 @@
 #include <linux/compiler.h>	/* for inline */
 #include <linux/types.h>	/* for size_t */
 #include <linux/stddef.h>	/* for NULL */
+#include <linux/err.h>		/* for ERR_PTR() */
 #include <linux/errno.h>	/* for E2BIG */
+#include <linux/overflow.h>	/* for check_mul_overflow() */
 #include <linux/stdarg.h>
 #include <uapi/linux/string.h>
 
@@ -14,6 +16,44 @@ extern void *memdup_user(const void __user *, size_t);
 extern void *vmemdup_user(const void __user *, size_t);
 extern void *memdup_user_nul(const void __user *, size_t);
 
+/**
+ * memdup_array_user - duplicate array from user space
+ * @src: source address in user space
+ * @n: number of array members to copy
+ * @size: size of one array member
+ *
+ * Return: an ERR_PTR() on failure. Result is physically
+ * contiguous, to be freed by kfree().
+ */
+static inline void *memdup_array_user(const void __user *src, size_t n, size_t size)
+{
+	size_t nbytes;
+
+	if (check_mul_overflow(n, size, &nbytes))
+		return ERR_PTR(-EOVERFLOW);
+
+	return memdup_user(src, nbytes);
+}
+
+/**
+ * vmemdup_array_user - duplicate array from user space
+ * @src: source address in user space
+ * @n: number of array members to copy
+ * @size: size of one array member
+ *
+ * Return: an ERR_PTR() on failure. Result may be not
+ * physically contiguous. Use kvfree() to free.
+ */
+static inline void *vmemdup_array_user(const void __user *src, size_t n, size_t size)
+{
+	size_t nbytes;
+
+	if (check_mul_overflow(n, size, &nbytes))
+		return ERR_PTR(-EOVERFLOW);
+
+	return vmemdup_user(src, nbytes);
+}
+
 /*
  * Include machine specific inline routines
  */
-- 
2.41.0

