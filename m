Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817FC51DA13
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDA410ED8B;
	Fri,  6 May 2022 14:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09A10EC17
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:10:14 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id d6so8836511ede.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uiDlM0yXbBn7pRczM7ux0sta62NjRvpxOMouExurmFs=;
 b=Pv2oOvOdB6W3udvQmqvIntw73cwkFIDb6pXy2yYOui5YXCguLVulSKMSI4v0V06G7U
 Stkh08GBK3HEjd4Exe3JXkGF5PJXJqIn7ulaEyHIykbtBzrt+9WlyRaDLR+Ug6ikVoUd
 cCrOM5Wx+5K6ym37ynGk5B3r5JBHpHLx8iIJqlwq+gNGJr1tJ//tx9EbDpHNAw9MsIkr
 Dnqr22k2P288LoWIlEVS/l4DXJ9UxSy9KbGvVNTufh9O7hF4jXG5PUBzIKiQ4W5gsYMP
 ZwfS/MrT+LM3U8lgoIcfLPGtuEYUi0/R+7nmJM3XjuP/xlyJ/tTflA31x8G05ep7x5sZ
 oRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uiDlM0yXbBn7pRczM7ux0sta62NjRvpxOMouExurmFs=;
 b=kdqw0p1uUFrf5AhEyCo0XY2oIS64SFmdxkfTVd+pJNSCzNQ9aTEYsumgYlyJY5RUMj
 dOrxBVCt1NY7pjQogMgf0gfZtEohxFj+quo1VbUNu9FJ1ZSMHHjY9gD92GW8hHcNXc6k
 cCioRPMk0Qdp+UTssSVxd+T1aM3R8bae+dtaNUdWSevKsNwsYjAU0N5f1GzdYTqxzc7H
 X1bZHl/FzdgzkVE7zxsFsqYVjZe8SOSmIxZVxtHJoK4cfYHWLQvPBj3ge0ojUIIZ1vXu
 vXiyBcHNdxiadjb7SIPiK6/UvPM95oYXoJKsHjKPtaUOvoJuwU95HnxvCE6wJkF5OtZd
 N/kQ==
X-Gm-Message-State: AOAM5329BI02utLBJNUihlhUm0DNwNKfchCvxqWokTonBN51MnFK6teB
 1rllg6LnHcvJiBRFMX+SKQg=
X-Google-Smtp-Source: ABdhPJxqu2GjMyg51GfQcFQkwkQnG68ocxvbsKfkraagbqJs7BuNYUKBFhTm+9gk//o2RggAa7g7iQ==
X-Received: by 2002:a05:6402:1254:b0:426:2439:ceb7 with SMTP id
 l20-20020a056402125400b004262439ceb7mr3605473edw.47.1651846212408; 
 Fri, 06 May 2022 07:10:12 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 jx3-20020a170907760300b006f3ef214e22sm1915415ejc.136.2022.05.06.07.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:10:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH 2/5] dma-buf: cleanup dma_fence_unwrap implementation
Date: Fri,  6 May 2022 16:10:06 +0200
Message-Id: <20220506141009.18047-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506141009.18047-1-christian.koenig@amd.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
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

