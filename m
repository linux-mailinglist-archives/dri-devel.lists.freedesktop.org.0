Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BF390B29
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFA6EB4D;
	Tue, 25 May 2021 21:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0796EB46
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:02 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d16so24585570pfn.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfEYaaEsri34UVrh87VwS0D4/LmhE0dmCO8raqQLSuw=;
 b=sIWRMHVcSTGqlQ8A5aUaxSGn7Cp2nYjSQ9mVEnOuUCBxi09XAYbFh7rqdSuQEiLYPI
 8naTIn9vr1+6YFglNQWZFdoWXstVKQR8tcTiCeeqXTvzmYMA1S2iAOW2x4t1a6TZTEYk
 bTuwnhJYGq4uBWbOJl2rewnDFbA4rrl5/M3tmrZ+hPEAIaLZn6XX3ZYeZsB8JcLiECyH
 6BITRi09v3/vVL0lchWxnAD5JL5wOEO3x+e3xTDbR3cf9oIgGqSVBv8eNEecwuUMusHH
 Sqff4lbScgzlD+PNq2/H5n2NHk3wwTi4NsRt7eTwAC5lJPvg1gn2ltfVaJItvlDpk1XK
 jFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfEYaaEsri34UVrh87VwS0D4/LmhE0dmCO8raqQLSuw=;
 b=K180GX7m13Yc6aXUwd1W6eO0UUIMRvPmdj+7DY1caaBYsnXnvfSUBpaHPdl0xli2C6
 ickwd7dPA3TbmLWCZCAxbG3p3M0wg/DncMn65infPIsStgKWY8OUHOdDa7pj9wmiHvij
 ztbZHdpiPQGwLuZYjI1qvNSPyk+dFzaPnl+5rX48GUoOExentvRhlw7Nw1Ce+KCRZRKv
 Zbq8UhrzpiQ8xTwRMbHXxwMXRd6ZizGzhFZIsDJZZT0cyhdwIcYaqkEPuT00hgE92EIR
 8xjcdgT2s2fyUegNntR2nWtza9p8NIn3COvv3wxTBUYJ95xhEtUHvGm6WlHQ+wR8SS2I
 qoMQ==
X-Gm-Message-State: AOAM5319KWh8iAFhq3Ob3fXtDGf9Mf6wzOOVn6J6dJoWhCultdldSDQw
 w6k8PO1fi3DcsnUIM5D90uP9UBMd/OSelw==
X-Google-Smtp-Source: ABdhPJxhkdOiX/X3Zg+JCtwbbjuCzzEVQK0zBHufXro4yy8UMrPBITNg9CYq+RtXhLOwgW07SfGvzg==
X-Received: by 2002:a63:4287:: with SMTP id
 p129mr21351106pga.230.1621977481615; 
 Tue, 25 May 2021 14:18:01 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:18:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] dma-buf: Add dma_fence_array_for_each (v2)
Date: Tue, 25 May 2021 16:17:47 -0500
Message-Id: <20210525211753.1086069-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525211753.1086069-1-jason@jlekstrand.net>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
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
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

