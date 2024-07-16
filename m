Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C559326A9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32ED10E6B4;
	Tue, 16 Jul 2024 12:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXpIBmHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCE010E6BC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso38414295e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133328; x=1721738128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R4XKMo6PcIsN1NU2X9Ju+jAqvZQVMa6cn2WexiIEtmQ=;
 b=FXpIBmHfJysZ6R+AuICX38qAOnmZtAwW/hz8zBBgSdaJ3hiEZOkoyH7wiPzIeKbg5P
 p0HlxN9ITZk7OZKgCKz67MgLULkfpAQH4mbSmRzKTRtUYf4Tj11MY3+5I98BTCSxwVqc
 JvpsyPd5OV8U2FAimEwKBXYA732IHnFJyrqv0EqhtsOKE2pGcW5gs0LoSKBWqRJ44f+2
 NKGJXm4X7nfEzXSVpy5bV3uIl9z9JCER4jtDI0o2WrLkWfM9PsiFF5AIi25TNgUXTuGc
 Tkcg/1U7O82pctA7yDZKKR2cDqkqPu1st6WMUs91dZeXsuLufU6YRFYJvhWcN9UWdwPk
 FMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133328; x=1721738128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R4XKMo6PcIsN1NU2X9Ju+jAqvZQVMa6cn2WexiIEtmQ=;
 b=XlZbuVptsVj5xjtAvrdyOz6vU9ZGLG/XToSiCkwrbP6gljHELsFY2f015xQ4RasGqJ
 Oye8Xh0BneMzLDjplsRZUQFC4FqIX1MceLI6hZ4y4f1IOZ/O3Rsu8Qw3HL1ChYKXIpCd
 y9kDWxFeAstR/fO7rXzXoGLE9PXZmRgU2WEggcvKifEXN5Zi/7coLlSUiF3KSHlhrYWE
 tTTXn9WGvhnTz8nePgKbKkGu+FNidJ4mSfeyALB0xlog2WB+ZF84TYDWkD9BBEiNz4S+
 HZgxfaK+c1Qv8DUEHjcoQGmrXjj7dp/1ca/8PSi4crUSifQqcxEMH8pRpNPP9zlWadCo
 +QsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtfM2EtAgeT3gJXdQUFMH2OZL5yV6s/pjqRNk+ISDub44dps/yz1bJXaZBwvFJPLZSJ0E0VB6ZlflSzsdtCUtPivJz6kJe6K/ELiHcvUy4
X-Gm-Message-State: AOJu0Yykj/hi+S2zB64Xt27jocxv8PWLKgTUhqAUHHYfit6N8gU6BZJL
 JthDoRxwXmVxlHoJ/9UcBGCTrRlAthT26Sr3NnudckQPOWkmNoFb
X-Google-Smtp-Source: AGHT+IHfxfZIPH9jScn/uBtee15hO+5c00l54xb71naoU29PXyjEO4S6EPI8bMF7BXlvWTBOPeYqnA==
X-Received: by 2002:a05:600c:3109:b0:426:5b21:97fa with SMTP id
 5b1f17b1804b1-427ba6f389emr16218465e9.29.1721133327510; 
 Tue, 16 Jul 2024 05:35:27 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/ttm: revert "Export ttm_bo_get_unless_zero()"
Date: Tue, 16 Jul 2024 14:35:17 +0200
Message-Id: <20240716123519.1884-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This reverts commit 24dc64c1ba5c3ef0463d59fef6df09336754188d.

Shouldn't be needed by drivers any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c          |  1 +
 drivers/gpu/drm/ttm/ttm_bo_internal.h | 48 +++++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_util.c     |  2 ++
 drivers/gpu/drm/ttm/ttm_device.c      |  1 +
 include/drm/ttm/ttm_bo.h              | 18 ----------
 5 files changed, 52 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_bo_internal.h

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0131ec802066..fe4638ec0976 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -45,6 +45,7 @@
 #include <linux/dma-resv.h>
 
 #include "ttm_module.h"
+#include "ttm_bo_internal.h"
 
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
new file mode 100644
index 000000000000..6a7305efd778
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2018 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#ifndef _TTM_BO_INTERNAL_H_
+#define _TTM_BO_INTERNAL_H_
+
+#include <drm/ttm/ttm_bo.h>
+
+/**
+ * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
+ * its refcount has already reached zero.
+ * @bo: The buffer object.
+ *
+ * Used to reference a TTM buffer object in lookups where the object is removed
+ * from the lookup structure during the destructor and for RCU lookups.
+ *
+ * Returns: @bo if the referencing was successful, NULL otherwise.
+ */
+static inline __must_check struct ttm_buffer_object *
+ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
+{
+	if (!kref_get_unless_zero(&bo->kref))
+		return NULL;
+	return bo;
+}
+
+#endif
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3c07f4712d5c..f7143384ef1c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -37,6 +37,8 @@
 
 #include <drm/drm_cache.h>
 
+#include "ttm_bo_internal.h"
+
 struct ttm_transfer_obj {
 	struct ttm_buffer_object base;
 	struct ttm_buffer_object *bo;
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7cc4954c1bc..2e7fa3a11dc0 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -36,6 +36,7 @@
 #include <drm/ttm/ttm_placement.h>
 
 #include "ttm_module.h"
+#include "ttm_bo_internal.h"
 
 /*
  * ttm_global_mutex - protecting the global state
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index d1a732d56259..31ec7fd34eeb 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -239,24 +239,6 @@ static inline void ttm_bo_get(struct ttm_buffer_object *bo)
 	kref_get(&bo->kref);
 }
 
-/**
- * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
- * its refcount has already reached zero.
- * @bo: The buffer object.
- *
- * Used to reference a TTM buffer object in lookups where the object is removed
- * from the lookup structure during the destructor and for RCU lookups.
- *
- * Returns: @bo if the referencing was successful, NULL otherwise.
- */
-static inline __must_check struct ttm_buffer_object *
-ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
-{
-	if (!kref_get_unless_zero(&bo->kref))
-		return NULL;
-	return bo;
-}
-
 /**
  * ttm_bo_reserve:
  *
-- 
2.34.1

