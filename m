Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98D44E289A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884B10E435;
	Mon, 21 Mar 2022 13:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E0C10E434
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v22so6908872wra.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bamjC23Q69erk92MnMWf0J2au4NF3cEwi+aTNvqkERQ=;
 b=Wb+apWwMHz/tJQU3aak5yiCnwjcOjUnCCJqkWqlYJoJDVHxZaBR6BXWxHavSVGYU6E
 MQ8P3beSx8S1s54Hq0XL67GJlzsZpL8RquARVjudNELLPkJZy4AiqgTYgLabeslEjmvm
 y/scHcsQTnjPp+a4n3JegiT0szjBeNJsfYUBWuYE5p5VJemjBtV205HAjHjHzJoXOi98
 sf5KjPEEI6imNCoYswmJzMz0zn3WcR4T8jkY3rJqX/oUkIL8qpdIUcMr0mgVZ77Y/N1e
 YytP0wyi9D7VhSADr0LT1jyjk4RhkwEzmMvZvdsII0tMtSKWkvKDJ1KyTKvpe8PK4kVr
 Q3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bamjC23Q69erk92MnMWf0J2au4NF3cEwi+aTNvqkERQ=;
 b=hQ0fvcpiO4Lwt3rHDYkNQrrDpY56kiafopL9oRHT36dgVHxqZlbcuPlS1bLhnFYKMA
 LzD/kA7NF3kQCorZ4OmNwbDk4T8drbeGnUIyT6VXzGe7L2swLuoPxVBQ6X0IOV5l1PnT
 r6VNVL1FBwDBdLFIRIG+fGf3uJ3D6jElxofeZPfw3QdKMr3mkBuq+0FKuhyR/M5Csosz
 BS8q+f1Nucqn0rVEglKQPv200p1Ds7ZBZECbuhXE1RsDyHA/BIn1B4IEU1cjbSYMI+MP
 9Sh0oYr4FMM5XmxB/ChhZQorpwZdfAOUg/ayXyCuvI3Z/6acA/o0SWjzNQ1n04p+cguX
 niDQ==
X-Gm-Message-State: AOAM533IVCd3dDqDVhv+pIcltllt3uD4G8Vs1bMU8pxI5Yv1Aw1q6AbN
 22Oz1aJKcSi85NeFw5VMoZw=
X-Google-Smtp-Source: ABdhPJwdU1hje7h2MgxXlDBVa6ljuRH5Ln1iRWguku4k2UEA1DO9SjAempx8t7cbo5XBdWzZNIhVYA==
X-Received: by 2002:a05:6000:15cb:b0:203:d94b:bd83 with SMTP id
 y11-20020a05600015cb00b00203d94bbd83mr19390670wry.113.1647871139650; 
 Mon, 21 Mar 2022 06:58:59 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:58:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/23] dma-buf: add dma_resv_get_singleton v2
Date: Mon, 21 Mar 2022 14:58:36 +0100
Message-Id: <20220321135856.1331-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to simplify getting a single fence for all the fences in
the dma_resv object.

v2: fix ref leak in error handling

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5001e9b4420a..c09fd8da0c85 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -34,6 +34,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -650,6 +651,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
+/**
+ * dma_resv_get_singleton - Get a single fence for all the fences
+ * @obj: the reservation object
+ * @write: true if we should return all fences
+ * @fence: the resulting fence
+ *
+ * Get a single fence representing all the fences inside the resv object.
+ * Returns either 0 for success or -ENOMEM.
+ *
+ * Warning: This can't be used like this when adding the fence back to the resv
+ * object since that can lead to stack corruption when finalizing the
+ * dma_fence_array.
+ */
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence)
+{
+	struct dma_fence_array *array;
+	struct dma_fence **fences;
+	unsigned count;
+	int r;
+
+	r = dma_resv_get_fences(obj, write, &count, &fences);
+        if (r)
+		return r;
+
+	if (count == 0) {
+		*fence = NULL;
+		return 0;
+	}
+
+	if (count == 1) {
+		*fence = fences[0];
+		kfree(fences);
+		return 0;
+	}
+
+	array = dma_fence_array_create(count, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (!array) {
+		while (count--)
+			dma_fence_put(fences[count]);
+		kfree(fences);
+		return -ENOMEM;
+	}
+
+	*fence = &array->base;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
+
 /**
  * dma_resv_wait_timeout - Wait on reservation's objects
  * shared and/or exclusive fences.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 202cc65d0621..08512c1e215d 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -449,6 +449,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, bool write,
 			unsigned int *num_fences, struct dma_fence ***fences);
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

