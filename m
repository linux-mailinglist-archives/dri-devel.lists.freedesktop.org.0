Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958738B674
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48216F4D5;
	Thu, 20 May 2021 19:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008326F4E1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:00:17 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 10so13077575pfl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JuaG/BidSZXh1NIW8tFbFo97027kFqsbTA19/V++Rgk=;
 b=WG9DiH8O7sLXK4CWcruWcojt7h65g8A2MFehorDByRczhAFtdI7rXp/Kokd8xGrgBE
 cy67uBG9Uj7rilVh4LF5HwzS6N8G6pDkS7nKO3mtfctoNXS8ddnmsoFV9kR2b32MUogt
 +8ktGcCwBHpECQfB5vTRk1hbeefFidYEXtENGKqkvtb7DPjO+011R0CcV4ANJeXOeo4u
 sHm8AWjEAnwAThBtsf6rRnXZAzM9CMDr+BKC6cMq8YLrAxxN//c7dAza2yLaldiLqt7V
 g99y7vTxx3NGlPOnfq63V6OyW7DmwRw8toyczLVGYGXLVtOpUN2iOhv34qP9lQ1PVrxd
 dB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JuaG/BidSZXh1NIW8tFbFo97027kFqsbTA19/V++Rgk=;
 b=P7/bgP2am7ZyxjIv4i8ib/LbNAJxbglkgiEcHPutxKp/dXryLUbzAj8U+6eN7og9ww
 kVfu+DukHNDzvC2llkyhUR0iO3Z+e32//3GEwwj9vtbkpbvN12VS8shNQ+R9G/p2oZWg
 8JN/3AQcgSvOq1jyvsudJ3lKc6ykU/nmAVCSWDf2ItDcK6BBiMehiNTTQVBavqc0aIuk
 t0SsnXeWnHx3R21UBD34VIYo5eguj9zza7hyrrIhjd//DZ+DfqqK/3QgFEh9BWP+//B3
 KSLm/4TPdPFQVXlYpNyB+496VvRiPXzDJozFfYrtk8Xln02XAaYOHCslf8FrP0eSVNRH
 5Giw==
X-Gm-Message-State: AOAM533azMi/zQ7obbG2xk/wzRYHkvphPpgE1b00O7QAEj4ub2bfet6q
 7ksVG2UKW6tctdeJ19a7TryhtrYmcQ4/oA==
X-Google-Smtp-Source: ABdhPJwMJt6rQqLW3zKPA+FaVLCJI5fUOWctC5fJ06C7EBxXecdKzP5+RzbBUSAN5DJ+Mw6sqU5gyg==
X-Received: by 2002:a63:e30d:: with SMTP id f13mr5981115pgh.201.1621537216615; 
 Thu, 20 May 2021 12:00:16 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id v2sm2455072pfm.134.2021.05.20.12.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:00:16 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] dma-buf: add dma_resv_get_singleton_rcu (v4)
Date: Thu, 20 May 2021 14:00:05 -0500
Message-Id: <20210520190007.534046-3-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to get a single fence representing
all fences in a dma_resv object.

This fence is either the only one in the object or all not
signaled fences of the object in a flatted out dma_fence_array.

v2 (Jason Ekstrand):
 - Take reference of fences both for creating the dma_fence_array and in
   the case where we return one fence.
 - Handle the case where dma_resv_get_list() returns NULL

v3 (Jason Ekstrand):
 - Add an _rcu suffix because it is read-only
 - Rewrite to use dma_resv_get_fences_rcu so it's RCU-safe
 - Add an EXPORT_SYMBOL_GPL declaration
 - Re-author the patch to Jason since very little is left of Christian
   König's original patch
 - Remove the extra fence argument

v4 (Jason Ekstrand):
 - Restore the extra fence argument

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

get_singleton
---
 drivers/dma-buf/dma-resv.c | 122 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |   3 +
 2 files changed, 125 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 6ddbeb5dfbf65..25995fc15c370 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -33,6 +33,8 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -49,6 +51,19 @@
  * write-side updates.
  */
 
+/**
+ * dma_fence_deep_dive_for_each - deep dive into the fence containers
+ * @fence: resulting fence
+ * @chain: variable for a dma_fence_chain
+ * @index: index into a dma_fence_array
+ * @head: starting point
+ *
+ * Helper to deep dive into the fence containers for flattening them.
+ */
+#define dma_fence_deep_dive_for_each(fence, chain, index, head)	\
+	dma_fence_chain_for_each(chain, head)			\
+		dma_fence_array_for_each(fence, index, chain)
+
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
@@ -517,6 +532,113 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
 
+/**
+ * dma_resv_get_singleton - get a single fence for the dma_resv object
+ * @obj: the reservation object
+ * @extra: extra fence to add to the resulting array
+ * @result: resulting dma_fence
+ *
+ * Get a single fence representing all unsignaled fences in the dma_resv object
+ * plus the given extra fence. If we got only one fence return a new
+ * reference to that, otherwise return a dma_fence_array object.
+ *
+ * RETURNS
+ * Returns -NOMEM if allocations fail, zero otherwise.
+ */
+int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,
+			       struct dma_fence **result)
+{
+	struct dma_fence **resv_fences, *fence, *chain, **fences;
+	struct dma_fence_array *array;
+	unsigned int num_resv_fences, num_fences;
+	unsigned int ret, i, j;
+
+	ret = dma_resv_get_fences_rcu(obj, NULL, &num_resv_fences, &resv_fences);
+	if (ret)
+		return ret;
+
+	num_fences = 0;
+	*result = NULL;
+
+	if (num_resv_fences == 0 && !extra)
+		return 0;
+
+	for (i = 0; i < num_resv_fences; ++i) {
+		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
+			if (dma_fence_is_signaled(fence))
+				continue;
+
+			*result = fence;
+			++num_fences;
+		}
+	}
+
+	if (extra) {
+		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
+			if (dma_fence_is_signaled(fence))
+				continue;
+
+			*result = fence;
+			++num_fences;
+		}
+	}
+
+	if (num_fences <= 1) {
+		*result = dma_fence_get(*result);
+		goto put_resv_fences;
+	}
+
+	fences = kmalloc_array(num_fences, sizeof(struct dma_fence*),
+			       GFP_KERNEL);
+	if (!fences) {
+		*result = NULL;
+		ret = -ENOMEM;
+		goto put_resv_fences;
+	}
+
+	num_fences = 0;
+	for (i = 0; i < num_resv_fences; ++i) {
+		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
+			if (!dma_fence_is_signaled(fence))
+				fences[num_fences++] = dma_fence_get(fence);
+		}
+	}
+
+	if (extra) {
+		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
+			if (dma_fence_is_signaled(fence))
+				fences[num_fences++] = dma_fence_get(fence);
+		}
+	}
+
+	if (num_fences <= 1) {
+		*result = num_fences ? fences[0] : NULL;
+		kfree(fences);
+		goto put_resv_fences;
+	}
+
+	array = dma_fence_array_create(num_fences, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (array) {
+		*result = &array->base;
+	} else {
+		*result = NULL;
+		while (num_fences--)
+			dma_fence_put(fences[num_fences]);
+		kfree(fences);
+		ret = -ENOMEM;
+	}
+
+put_resv_fences:
+	while (num_resv_fences--)
+		dma_fence_put(resv_fences[num_resv_fences]);
+	kfree(resv_fences);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dma_resv_get_singleton_rcu);
+
 /**
  * dma_resv_wait_timeout_rcu - Wait on reservation's objects
  * shared and/or exclusive fences.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index d44a77e8a7e34..d49ca263e78b4 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -285,6 +285,9 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 
+int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,
+			       struct dma_fence **result);
+
 long dma_resv_wait_timeout_rcu(struct dma_resv *obj, bool wait_all, bool intr,
 			       unsigned long timeout);
 
-- 
2.31.1

