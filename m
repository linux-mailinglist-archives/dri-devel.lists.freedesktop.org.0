Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074838F4AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B8C6E96A;
	Mon, 24 May 2021 21:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815E76E956
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:00:06 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 29so9906204pgu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 14:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEI1C6i8BkmXab/e/DARv5l0X9UQ4/4Roo0c4c+CbmM=;
 b=WtOEvzCBa9GuoRNl2Mwa6M1tZtIRfup2tPy9pz+FBLDehfxATNaCPvFznXaab2uIZ0
 IYHGCh61hLsxFQYkAbYeHL5i//ra2oID/DFYXzfr+YR0RMomrZedBhqyGsdP6X9//6nZ
 MVEBcjZwqN8RpLhaazOtGvdosKj47yDbLXu1Q+lo/hfTDgOtNGHdGfZE/gf5rNytbRRt
 3bBtxne/QIkgifOhnvltIVtTpdHagyckUHXeBZq/iBmUVFSQa+yrarcMvdONkKjceHzA
 wlfJcauQRfy223cIfSc5MmxChgS1zU4oPvmJtrjuWnxBlFAhKsPrMqgDzYmPuLztEp03
 vjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEI1C6i8BkmXab/e/DARv5l0X9UQ4/4Roo0c4c+CbmM=;
 b=qJeHuPTBFYIY87w8zGpATIk88/B1sXUwMVFfMjNNb81+RekoXCt4dFNa73KF7Y3ua7
 73SZsPvNkmZ7ZPFSOn+bcekZRuX7WzBBpUonmpi0oqNxa8O+PnHsODpz/0LAb07yHlVh
 J0PZd+7PRaX+m9hKeMQBsVRPLge/e3gNlbdKgST/y9jtmYR54X8atJH45dVnGNr0cOS1
 nxcOu0tCY/462FyM32gtyKhdv6OczF8tayW5kuQ+hkH16quv6x7a3hvN/UJXg69Cbl2Y
 REUNtUtyjgIj9z/CqHijhX1htHWi2hDoFd2/bJZ0rlBzbsiCu0apMzuIe0U0fq2dtGk8
 vx5g==
X-Gm-Message-State: AOAM530qtQC6Y1+z22IrGuDF25ejFdi0APlD2Ij5ZQ5wU83WUXloIOp0
 ZQemuwbz/3PtS/diVnOfwErPs0rjIcRnXw==
X-Google-Smtp-Source: ABdhPJxYdK//zTGTA7iwS2YhdLwIgOuYxBAkydScQ8Iqa1vwZTfW8/t5sSlPt8bSA/wZawKPa7vETQ==
X-Received: by 2002:a62:81c5:0:b029:2d9:367b:b84a with SMTP id
 t188-20020a6281c50000b02902d9367bb84amr26790841pfd.32.1621890005431; 
 Mon, 24 May 2021 14:00:05 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id c195sm12354958pfb.144.2021.05.24.14.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 14:00:04 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] dma-buf: add dma_fence_array_for_each (v2)
Date: Mon, 24 May 2021 15:59:49 -0500
Message-Id: <20210524205954.872814-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524205954.872814-1-jason@jlekstrand.net>
References: <20210524205954.872814-1-jason@jlekstrand.net>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Add a helper to iterate over all fences in a dma_fence_array object.

v2 (Jason Ekstrand)
 - Return NULL from dma_fence_array_first if head == NULL.  This matches
   the iterator behavior of dma_fence_chain_for_each in that it iterates
   zero times if head == NULL.
 - Return NULL from dma_fence_array_next if index > array->num_fences.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   | 17 +++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index d3fbd950be944..2ac1afc697d0f 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
 	return true;
 }
 EXPORT_SYMBOL(dma_fence_match_context);
+
+struct dma_fence *dma_fence_array_first(struct dma_fence *head)
+{
+	struct dma_fence_array *array;
+
+	if (!head)
+		return NULL;
+
+	array = to_dma_fence_array(head);
+	if (!array)
+		return head;
+
+	return array->fences[0];
+}
+EXPORT_SYMBOL(dma_fence_array_first);
+
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index)
+{
+	struct dma_fence_array *array = to_dma_fence_array(head);
+
+	if (!array || index >= array->num_fences)
+		return NULL;
+
+	return array->fences[index];
+}
+EXPORT_SYMBOL(dma_fence_array_next);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 303dd712220fd..588ac8089dd61 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_array, base);
 }
 
+/**
+ * dma_fence_array_for_each - iterate over all fences in array
+ * @fence: current fence
+ * @index: index into the array
+ * @head: potential dma_fence_array object
+ *
+ * Test if @array is a dma_fence_array object and if yes iterate over all fences
+ * in the array. If not just iterate over the fence in @array itself.
+ */
+#define dma_fence_array_for_each(fence, index, head)			\
+	for (index = 0, fence = dma_fence_array_first(head); fence;	\
+	     ++(index), fence = dma_fence_array_next(head, index))
+
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno,
@@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
+struct dma_fence *dma_fence_array_first(struct dma_fence *head);
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index);
+
 #endif /* __LINUX_DMA_FENCE_ARRAY_H */
-- 
2.31.1

