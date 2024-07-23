Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5793A073
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802AD10E5A7;
	Tue, 23 Jul 2024 12:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KLgdr/yK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1A510E5A5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso40627405e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737077; x=1722341877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoCfEIkyVorkoZeWDN4wqEB5XnZUJFR8yriQryFtpcM=;
 b=KLgdr/yKJ49pb0MGzNlaZFpVQedmDpmuYcHGT+decjpQPTw+eFe856DcyLzjf52iAx
 sIE7WrFrNfKADpID0lFvimglTJXTJHgDxh/nXpFzCAEiEzUEUClFwYgU2FsQLTSc6Vzl
 AHP0DToiSD2Cpp/0mFzN4hGYnF9OnwvgAiENwjPradCs9IC5jLw114dXy2Ocid7Ga1K8
 E8I2wmKwM0O3dJt53tTppO1L/s/Y8ptLM+iUqg9dqYdGJFKWHcdltEcHU+PPdpoYXnPA
 /b3fyGh+ieqHIGGL/w7+d5QbyJBT08bG72YTQiMb+PGjcGhED6qofOPmx73PEdXtXlAj
 Wkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737077; x=1722341877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JoCfEIkyVorkoZeWDN4wqEB5XnZUJFR8yriQryFtpcM=;
 b=Cuh+Qoaiq6D04Z6nTi+mrcJ5wwatiFn0swB4dyvzNGlhZWtKnYMs0fkZwJQ/3wLN9o
 LkOovxgioG+tqcACHn1SAJbo6rWk/rjsu8I6zOYYYVP79HPsIfM2j5W57PeCJdDgf3Wy
 U6HPDZHknjAQAFdb683bEPW2NnjVd0wSoKzVLgLeXeN4QHugzQDS2jzIu/sq1u8QCeWn
 2DxR/D5D67Z9jxi01tR3eK6kKPIqgTJM0I/6CAi5gNp2QFbCmrMa9eLdHnCQtVKV8jBl
 sd4uXy6l/9HIdnG0h4pt4tZgbk9G1rbnUA72lbuxbJiRbRILLfy5f/odHEWaTtBXyavD
 i1ag==
X-Gm-Message-State: AOJu0YwgSVpF6qe3FGkqyWNI6p4ahV6Sh8onctBKVoqQeXu9RIwYWJPT
 6qETSlMdN5d7e0b3BLE7z5SFl+kz4dSWT2I33kvbrhlwpzt9SWJg
X-Google-Smtp-Source: AGHT+IGBPtEKMpqHRFJEuokGxhGho/YIUFf65gKsGTM/y3OqSGpFqiAWt2wMf4I5zs+inXrhTk8NTw==
X-Received: by 2002:a05:600c:34d6:b0:426:6688:2421 with SMTP id
 5b1f17b1804b1-427dc52303emr54437745e9.11.1721737076767; 
 Tue, 23 Jul 2024 05:17:56 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/ttm: revert "Export ttm_bo_get_unless_zero()"
Date: Tue, 23 Jul 2024 14:17:48 +0200
Message-Id: <20240723121750.2086-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

