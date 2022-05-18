Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343652BBA7
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 15:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085F910EEAA;
	Wed, 18 May 2022 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A3A10ED0D;
 Wed, 18 May 2022 13:58:50 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id z2so4028970ejj.3;
 Wed, 18 May 2022 06:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uiDlM0yXbBn7pRczM7ux0sta62NjRvpxOMouExurmFs=;
 b=LFXRFLR/Td4Ykw1nHV7QPzoyyW6y7rY0m9w4QZLgy7xhlynqeu7aueIRmst/PreZOM
 xCmMkXJYRgqJbgMbrPVXhgjJqcNq6Fr8Va9BoHy9pKSDrO4uh/Mf8R/d4h+GwXXJLwX+
 LOgACH+fVluM84w4TdbLSLTtuvW7JoXxCbYD7K84PvDbdtmBarzutppV/uc/lytz5VIV
 bL7HyLqYJ33smHVaui2M+ak1yjyayvEuVNn1OPlC/ehtkMqyi8wSUo4ekzVjfAWOPRJH
 ate2Tws5XMiEQ7MUdf/Z9PmXE/AsRJys0j/CBWgyWvudkYkhnlGvBrUsqf9LSAwycYE/
 vM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uiDlM0yXbBn7pRczM7ux0sta62NjRvpxOMouExurmFs=;
 b=ajZ8F9Dsxmig9JdYwptHrv+mzETC2G4x0znKMqGejkkjxMsratnl+TqgLcskw7/NG1
 xIyYEDmZ4Ub9PjdbQPLaxAkyvB/GwW5u9En6VIbhOYnT/Is6+fN1Pwm3GMjYCdfQCETq
 JZbWPFZF7I1ZdTU0JkiYWUJCJ536DWji5RMhRGwXLLJbucdup67hUesbhXLms0EfiP1C
 3XlmGAGWlqZg0w3lEqu8fxvg6/AEmG8M/CV26VoiAhNrmBRChcXGtX5bWbGYfSkmXa6Q
 xRMb+VF3QUVi+sbhymEve31aQfP0tvEWdPdMXNWRvn77nxKc6qnFPti8DR1mNVY6jnoH
 x8ow==
X-Gm-Message-State: AOAM5309xlp/OwbxfAEZpqK5SbZEhqXE2NyeKkxIvEtvF5f0wc+yZYDY
 dva7LxcWK8zN+EV/G6Jh04c/dBs8CbA=
X-Google-Smtp-Source: ABdhPJw8QfyOBqw6XppTLSQenvTBLXvgT3nIprTdB/vViBh7hMhGAAtAsL1GzU6pXzVNldulGictOg==
X-Received: by 2002:a17:907:6d15:b0:6fd:d985:889b with SMTP id
 sa21-20020a1709076d1500b006fdd985889bmr24971122ejc.753.1652882329317; 
 Wed, 18 May 2022 06:58:49 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042aaacd4edasm1388917edt.26.2022.05.18.06.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:58:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] dma-buf: cleanup dma_fence_unwrap implementation
Date: Wed, 18 May 2022 15:58:41 +0200
Message-Id: <20220518135844.3338-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518135844.3338-1-christian.koenig@amd.com>
References: <20220518135844.3338-1-christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the code from the inline functions into exported functions.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/Makefile           |  2 +-
 drivers/dma-buf/dma-fence-unwrap.c | 59 ++++++++++++++++++++++++++++++
 include/linux/dma-fence-unwrap.h   | 52 ++------------------------
 3 files changed, 64 insertions(+), 49 deletions(-)
 create mode 100644 drivers/dma-buf/dma-fence-unwrap.c

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 4c9eb53ba3f8..70ec901edf2c 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-resv.o
+	 dma-fence-unwrap.o dma-resv.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
new file mode 100644
index 000000000000..711be125428c
--- /dev/null
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * dma-fence-util: misc functions for dma_fence objects
+ *
+ * Copyright (C) 2022 Advanced Micro Devices, Inc.
+ * Authors:
+ *	Christian König <christian.koenig@amd.com>
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
+#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-unwrap.h>
+
+/* Internal helper to start new array iteration, don't use directly */
+static struct dma_fence *
+__dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
+{
+	cursor->array = dma_fence_chain_contained(cursor->chain);
+	cursor->index = 0;
+	return dma_fence_array_first(cursor->array);
+}
+
+/**
+ * dma_fence_unwrap_first - return the first fence from fence containers
+ * @head: the entrypoint into the containers
+ * @cursor: current position inside the containers
+ *
+ * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
+ * first fence.
+ */
+struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
+					 struct dma_fence_unwrap *cursor)
+{
+	cursor->chain = dma_fence_get(head);
+	return __dma_fence_unwrap_array(cursor);
+}
+EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
+
+/**
+ * dma_fence_unwrap_next - return the next fence from a fence containers
+ * @cursor: current position inside the containers
+ *
+ * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
+ * the next fence from them.
+ */
+struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
+{
+	struct dma_fence *tmp;
+
+	++cursor->index;
+	tmp = dma_fence_array_next(cursor->array, cursor->index);
+	if (tmp)
+		return tmp;
+
+	cursor->chain = dma_fence_chain_walk(cursor->chain);
+	return __dma_fence_unwrap_array(cursor);
+}
+EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index 77e335a1bcac..e7c219da4ed7 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * fence-chain: chain fences together in a timeline
- *
  * Copyright (C) 2022 Advanced Micro Devices, Inc.
  * Authors:
  *	Christian König <christian.koenig@amd.com>
@@ -10,8 +8,7 @@
 #ifndef __LINUX_DMA_FENCE_UNWRAP_H
 #define __LINUX_DMA_FENCE_UNWRAP_H
 
-#include <linux/dma-fence-chain.h>
-#include <linux/dma-fence-array.h>
+struct dma_fence;
 
 /**
  * struct dma_fence_unwrap - cursor into the container structure
@@ -33,50 +30,9 @@ struct dma_fence_unwrap {
 	unsigned int index;
 };
 
-/* Internal helper to start new array iteration, don't use directly */
-static inline struct dma_fence *
-__dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
-{
-	cursor->array = dma_fence_chain_contained(cursor->chain);
-	cursor->index = 0;
-	return dma_fence_array_first(cursor->array);
-}
-
-/**
- * dma_fence_unwrap_first - return the first fence from fence containers
- * @head: the entrypoint into the containers
- * @cursor: current position inside the containers
- *
- * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
- * first fence.
- */
-static inline struct dma_fence *
-dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
-{
-	cursor->chain = dma_fence_get(head);
-	return __dma_fence_unwrap_array(cursor);
-}
-
-/**
- * dma_fence_unwrap_next - return the next fence from a fence containers
- * @cursor: current position inside the containers
- *
- * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
- * the next fence from them.
- */
-static inline struct dma_fence *
-dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
-{
-	struct dma_fence *tmp;
-
-	++cursor->index;
-	tmp = dma_fence_array_next(cursor->array, cursor->index);
-	if (tmp)
-		return tmp;
-
-	cursor->chain = dma_fence_chain_walk(cursor->chain);
-	return __dma_fence_unwrap_array(cursor);
-}
+struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
+					 struct dma_fence_unwrap *cursor);
+struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
 
 /**
  * dma_fence_unwrap_for_each - iterate over all fences in containers
-- 
2.25.1

