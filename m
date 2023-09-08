Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42217990C2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8010E942;
	Fri,  8 Sep 2023 20:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D787010E942
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694203374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4V6bm459ozDimu1heDZpH+ZMi6MrCIxlIoO52rIEKGg=;
 b=BQBkhuZ9PfiOe6bAp4ii50nJSvvprmCN0nxVwUHdHNj8vDjT1em2vA1MhJOwsedmCLrqtB
 hc7g5BoP2Ko9ERPWVqUT4NTzBU7oVdmr+/ZG2Qmu8reKmvuv1BfEc2vwoKKFHrtw1KLPsJ
 jeqaPkz2cxswM2VrR7b1AtrWytEL9yk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-E_gHtRQjPS-k06S2-S3B8Q-1; Fri, 08 Sep 2023 16:02:52 -0400
X-MC-Unique: E_gHtRQjPS-k06S2-S3B8Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4059b5c3dd0so3340401cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 13:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694203372; x=1694808172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4V6bm459ozDimu1heDZpH+ZMi6MrCIxlIoO52rIEKGg=;
 b=hZw25tQfpeGeDsN+ZSZUVbYMuZ8pTpO68OX4xn/PG388xdegKDCxkUUDjS2FAWgb1z
 04fYj/XBUvncf/Xx4GHoOGPNZao7a5b8b0c93nMI+pzw6fFVfGzf67HHVfiVwZV1VJE7
 PbEYeLNmC6rLOHB8yR2ueamn7Pd1JFwWofFn3GRZ/EtcSQ8uHsB6UAc1vcJCIy4fFQZR
 WkA0/hvl9emBskG58tu0UAT0hycE71eIphMSwaHgxhK+BnN9kgxY8ecT3zL0jQtjgT4q
 fJSfJCx1S5wH5aFLottmaPILWDqGEouJKyZuB/M3Xkg3QXwvTpRe0AUZOv3nX12VFVDf
 k6jw==
X-Gm-Message-State: AOJu0YxdClDs3zOciIJfR01gBGPayKNGOG3tmzwT5xZYB8nFDgVBrzMj
 +t1xfya8KRfmk7mtjouTBgOM9JH4kBZ8ZdYcEdJO8F1bgPlE3YCre7DIOsCGa758xnSbETKYsTm
 qGq6oMlWQOCDXKqWXWHWk5p6n/8A7
X-Received: by 2002:a05:622a:1997:b0:40f:da40:88a with SMTP id
 u23-20020a05622a199700b0040fda40088amr3927389qtc.4.1694203372361; 
 Fri, 08 Sep 2023 13:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUR/6fW5sKr+U41wFGsfMKmuUv8vxb4fBBYTs7l3DnJhhPgBBiRmpLahG272yCMwIEUruJgg==
X-Received: by 2002:a05:622a:1997:b0:40f:da40:88a with SMTP id
 u23-20020a05622a199700b0040fda40088amr3927365qtc.4.1694203372058; 
 Fri, 08 Sep 2023 13:02:52 -0700 (PDT)
Received: from fedorinator.redhat.com
 ([2001:9e8:32da:e500:513e:fbe9:e455:ae67])
 by smtp.gmail.com with ESMTPSA id
 x19-20020ac85393000000b0041511b21a7csm262984qtp.40.2023.09.08.13.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 13:02:51 -0700 (PDT)
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
Subject: [PATCH v2 1/5] string.h: add array-wrappers for (v)memdup_user()
Date: Fri,  8 Sep 2023 21:59:40 +0200
Message-ID: <93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694202430.git.pstanner@redhat.com>
References: <cover.1694202430.git.pstanner@redhat.com>
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
---
 include/linux/string.h | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index dbfc66400050..8c9fc76c7154 100644
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
+	if (unlikely(check_mul_overflow(n, size, &nbytes)))
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
+	if (unlikely(check_mul_overflow(n, size, &nbytes)))
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

