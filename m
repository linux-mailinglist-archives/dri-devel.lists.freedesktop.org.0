Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B51A38B670
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268C66F4CD;
	Thu, 20 May 2021 19:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF556F4E0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:00:15 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d78so12187221pfd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=anXzuMIsYm1tGWNuex+OiJM3FFuiX3lIbzuMyJWjWX4=;
 b=15UedR8OdeRmCzPjzghuyqjOJyDv5Dg0SbLwKnOqIYhH/XozNqMPzoiIBZ4W40biqw
 k4SGmwqlmSSbisrexdnVB76iSQElOTq5ijlxIQG7KOgxVqaWaNHyZegnieFqWZVvRne0
 qhaTZzQdBa+cZMSQn6uy7XzwN4S1OxlTtkbhPRoBB79FJYLMHuoVuuEf2vj9lQWvgAjI
 ZDwX1qbXLMCAoFupP7vNkmCUI0GVg9PRXUcfeyORvKJJKq/4Ea6BTuZOmEjvtWAZVqq+
 uCXxsoymE/XfpygayUADXyr+hcQK02tE345pMFdt8lr0flnYvoXyoHME1gIfcIgsmm7e
 IZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=anXzuMIsYm1tGWNuex+OiJM3FFuiX3lIbzuMyJWjWX4=;
 b=lvFvVgnOmBs1C4dKW2rD1SpfrxIwGDxi7kqk/PgNk8VN4Fs5Oo8fiVN7pKGo57vjJe
 em/Li6zwRAlGQrkxErvp7UoVAvJMiIwIJN/Heljf3QXb9pRlp5y9szi2hGhvo9s0sU3s
 rDQmsIwSWj0nzLSEKq1Ys7Ac2XI7dfu881uzVDKieBHFrdyvWyl/WtolJ7D7Aij6hdz8
 ywvtpav5BTuLHvyTXeimdLOTsS4HZz6zAd1A/MMyAYIWzyqCSyXnVjGYh1vv6uhIkjof
 ixL1+7O6NRRhThOrwGbJgy2Ql1sdPVmpGv+hAwQwuu2RfKU8dmCNjck9hlQJFlLRqqnA
 7sWQ==
X-Gm-Message-State: AOAM5329edG2PCHbZKnXF14QeCmWctBdb+0j1qNTVDcG4I2SF4mjgKrg
 HvkY/HEFKCg0Gq3Wwjm5vh9Xs14qm4t0xg==
X-Google-Smtp-Source: ABdhPJz2RHPTkxLw6NucIhAufwb7ZHHrCeJw1PeyKeLL3Sot5a2jDh1r/H9mr1AOaTya2H05fTksZw==
X-Received: by 2002:a63:d70f:: with SMTP id d15mr6068614pgg.397.1621537214867; 
 Thu, 20 May 2021 12:00:14 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id v2sm2455072pfm.134.2021.05.20.12.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:00:14 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] dma-buf: add dma_fence_array_for_each (v2)
Date: Thu, 20 May 2021 14:00:04 -0500
Message-Id: <20210520190007.534046-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190007.534046-1-jason@jlekstrand.net>
References: <20210520190007.534046-1-jason@jlekstrand.net>
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

