Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EA092D1D4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC3E10E786;
	Wed, 10 Jul 2024 12:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/PGfq5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC4410E782
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:09 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-58b447c519eso7940701a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615388; x=1721220188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1DzdNUe/Ry+da5QYCBOVa0efIY5B5o+i0CSMZqA5OQg=;
 b=m/PGfq5qxwvhjEJIdhbcD/ShNnC9tQH/+FosrRCO7YWsOeHeHaIgcw8J5MylaqxE0m
 DwG8MVLEUJhIXCF75SUTEthkbKotDwOChH/FXIn82HwLi6QZM8yeQUXs5/gMeCKzz7uR
 Yez/2z46fc2FF2akXIUyd4SZJW/cnx8W24+K8AZeDiTqgzQLe8bHd0LePJuvo2eSu/YU
 dFiFZCOSljco0TJOfMMIbVRi9fNRoHKzyFpqmSFmE1cQQs68GNlq03jy7vKqxcIVhNk3
 Y/xvZKj5hyKnLz9KxK13uAVZB+nxj8Xl/cHcQKqMhYjDfmuVIvJt6HKNsBSG/4WOoZF+
 RWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615388; x=1721220188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DzdNUe/Ry+da5QYCBOVa0efIY5B5o+i0CSMZqA5OQg=;
 b=bnvB0o+a9aeDQKuyuT0EuR0Wyhy4jkD19Gy7IHq3V6L7HSAjVkoCrJUY84Y1B27qKq
 gR32OLOisT8CdsunAlq1mdKSEtzWW2RPZPsPngXRPyUGJgoTEmK+v3kqq1e9NnPMfaWw
 VvJPYqloAQ394092mAvXmu9yt5GMVvNok2nRgJUnkzBicyiw/znEoCiQW5Q19AbXBEq0
 PTekZckhM5O5P3ArkWxNIhzl7wSpY6OJQZ6m/wV+9m4Tjy2q9TJ52k0wRv4+yc13FkzB
 pu/XEaHf3snUUlNsv8tvVJSpyEVZZSLKiabukgTT3ZpFCCSzHAIKWcPGV9IwU8i2TqzV
 jbhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9WxgTsDXYuoWHtcSg9WCG6KYaHz9+SIKG8kW0uyNSjTqLYrA++gORJSbA+11qLkD6qp6sfroSjSaPJVt2N8rnLOvzhb4owTlhN0dvWfJW
X-Gm-Message-State: AOJu0YyShxKcLgWh7xZ1yrGWQUSMdPFF8403ndV+0BnVj9ThOEkD/hr4
 YFUIjGXFKK25UuP+Gqorg+XzFcywboqutpScphfmjkumfItIBmp2xXD0+ykIIHE=
X-Google-Smtp-Source: AGHT+IEO/7Rs+ElVcB2Dn2I6s+rMvLeAoJT1biIVqHe5lojvLlj2OKUE9Xh7iebQn1CiZ76NdMolng==
X-Received: by 2002:a05:6402:3551:b0:586:57c:2373 with SMTP id
 4fb4d7f45d1cf-594b6eda294mr4697588a12.0.1720615387101; 
 Wed, 10 Jul 2024 05:43:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal header
Date: Wed, 10 Jul 2024 14:42:58 +0200
Message-Id: <20240710124301.1628-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710124301.1628-1-christian.koenig@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
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

That is something drivers really shouldn't mess with.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      |  1 +
 drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +
 drivers/gpu/drm/ttm/ttm_bo_util.h | 67 +++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h          | 35 ----------------
 4 files changed, 70 insertions(+), 35 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_bo_util.h

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0131ec802066..41bee8696e69 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -45,6 +45,7 @@
 #include <linux/dma-resv.h>
 
 #include "ttm_module.h"
+#include "ttm_bo_util.h"
 
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3c07f4712d5c..03e28e3d0d03 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -37,6 +37,8 @@
 
 #include <drm/drm_cache.h>
 
+#include "ttm_bo_util.h"
+
 struct ttm_transfer_obj {
 	struct ttm_buffer_object base;
 	struct ttm_buffer_object *bo;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h b/drivers/gpu/drm/ttm/ttm_bo_util.h
new file mode 100644
index 000000000000..c19b50809208
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/**************************************************************************
+ * Copyright 2024 Advanced Micro Devices, Inc.
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
+ **************************************************************************/
+#ifndef _TTM_BO_UTIL_H_
+#define _TTM_BO_UTIL_H_
+
+struct ww_acquire_ctx;
+
+struct ttm_buffer_object;
+struct ttm_operation_ctx;
+struct ttm_lru_walk;
+
+/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
+struct ttm_lru_walk_ops {
+	/**
+	 * process_bo - Process this bo.
+	 * @walk: struct ttm_lru_walk describing the walk.
+	 * @bo: A locked and referenced buffer object.
+	 *
+	 * Return: Negative error code on error, User-defined positive value
+	 * (typically, but not always, size of the processed bo) on success.
+	 * On success, the returned values are summed by the walk and the
+	 * walk exits when its target is met.
+	 * 0 also indicates success, -EBUSY means this bo was skipped.
+	 */
+	s64 (*process_bo)(struct ttm_lru_walk *walk,
+			  struct ttm_buffer_object *bo);
+};
+
+/**
+ * struct ttm_lru_walk - Structure describing a LRU walk.
+ */
+struct ttm_lru_walk {
+	/** @ops: Pointer to the ops structure. */
+	const struct ttm_lru_walk_ops *ops;
+	/** @ctx: Pointer to the struct ttm_operation_ctx. */
+	struct ttm_operation_ctx *ctx;
+	/** @ticket: The struct ww_acquire_ctx if any. */
+	struct ww_acquire_ctx *ticket;
+	/** @tryock_only: Only use trylock for locking. */
+	bool trylock_only;
+};
+
+s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
+			   struct ttm_resource_manager *man, s64 target);
+
+#endif
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index d1a732d56259..5f7c967222a2 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -194,41 +194,6 @@ struct ttm_operation_ctx {
 	uint64_t bytes_moved;
 };
 
-struct ttm_lru_walk;
-
-/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
-struct ttm_lru_walk_ops {
-	/**
-	 * process_bo - Process this bo.
-	 * @walk: struct ttm_lru_walk describing the walk.
-	 * @bo: A locked and referenced buffer object.
-	 *
-	 * Return: Negative error code on error, User-defined positive value
-	 * (typically, but not always, size of the processed bo) on success.
-	 * On success, the returned values are summed by the walk and the
-	 * walk exits when its target is met.
-	 * 0 also indicates success, -EBUSY means this bo was skipped.
-	 */
-	s64 (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
-};
-
-/**
- * struct ttm_lru_walk - Structure describing a LRU walk.
- */
-struct ttm_lru_walk {
-	/** @ops: Pointer to the ops structure. */
-	const struct ttm_lru_walk_ops *ops;
-	/** @ctx: Pointer to the struct ttm_operation_ctx. */
-	struct ttm_operation_ctx *ctx;
-	/** @ticket: The struct ww_acquire_ctx if any. */
-	struct ww_acquire_ctx *ticket;
-	/** @tryock_only: Only use trylock for locking. */
-	bool trylock_only;
-};
-
-s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
-			   struct ttm_resource_manager *man, s64 target);
-
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
-- 
2.34.1

