Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA36140F79A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEB46EC42;
	Fri, 17 Sep 2021 12:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4F6EC44;
 Fri, 17 Sep 2021 12:35:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q26so14925132wrc.7;
 Fri, 17 Sep 2021 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5+u8qc2R4BG24i/iDhv9Dl7RY3z3hrt5qBrjleD7a4M=;
 b=DO+agg2OEDNAzmgjtfIQLf3/3wD5w1pe/WD3Cpyqz0W68aOLG05Std+bRdufeVNLOh
 YV5BHaNcq44k9EwUCXm3hoONsWD9mIM0HbLXYf5WLcvxDP/cj1Or0BKiSbr5PO7at+pf
 CybzRBhAwoYAKlQ/VTXD2BHEo3R0Vu4gu/mVIMCkGr+fQzGUgQY+i8RqyqGwKoEGRVl5
 Z52AK1fZGnHYlJENlBQyx+hQU+Ku6oz6ZtUpHoPcQNglhbzJm3+tfoZZARF9FftS12Km
 g0GlN6xu34ZCQWPdAR/t6Sn77CRRbcCD+yX+PW9ZYTK1ZYoYHvzcjAmGIAHHpGgw0rEz
 BmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5+u8qc2R4BG24i/iDhv9Dl7RY3z3hrt5qBrjleD7a4M=;
 b=lh7lpoTdZp3EsDsGEtdqf6BagTSoZbgnQDwgGrfs0BquQbStUwpuKmf1CtlXE6cRxW
 +Tq9a/x0bX6T3p2n5g8OHob30W0xPcCidK2LKjY569iEf+VG/vxUbNT3m82sGYXSHL1B
 FQuTO+MJ58EYkQOvSEN13daMCMF1BIUbN8HgydtoFYf8ZoY9CKwt5ZBStwPniAfFhBiz
 r8JTZTPdeuPh8aTeQM3EXOyUdrFOyn6uqs2R95dwWj6I3sCFSoZ/P2kGq9cIxF2b97iS
 VJkUWphtV5/9vHD69i/SVucDbIbsHVmCnLeIKOP/wlc4NbkGGRL+yHSwJTtB5Uwpcot4
 QcTQ==
X-Gm-Message-State: AOAM531+rVxF6+k+tb5dVLtcYh2PPauD7ZGpkMHdmDG4qiayzMhqbi1s
 Q6nX9wFzfOrDg06HS2GDLh0=
X-Google-Smtp-Source: ABdhPJx2rLT7WcIhsex2Jd1FsoSV3RqyWPtA/hnLC3xhDpUuvFYmlmwp19mPoQfF5dhm0JkNo1Yhzg==
X-Received: by 2002:adf:f543:: with SMTP id j3mr11911860wrp.287.1631882116985; 
 Fri, 17 Sep 2021 05:35:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v2
Date: Fri, 17 Sep 2021 14:34:48 +0200
Message-Id: <20210917123513.1106-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

Abstract the complexity of iterating over all the fences
in a dma_resv object.

The new loop handles the whole RCU and retry dance and
returns only fences where we can be sure we grabbed the
right one.

v2: fix accessing the shared fences while they might be freed,
    improve kerneldoc, rename _cursor to _iter, add
    dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 61 +++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 84 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 84fbe60629e3..3e77cad2c9d4 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,67 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
+ * @cursor: cursor to record the current position
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object which are not yet signaled.
+ * The returned fence has an extra local reference so will stay alive.
+ * If a concurrent modify is detected the whole iterration is started over again.
+ */
+struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
+					      bool first)
+{
+	struct dma_resv *obj = cursor->obj;
+
+	first |= read_seqcount_retry(&obj->seq, cursor->seq);
+	do {
+		/* Drop the reference from the previous round */
+		dma_fence_put(cursor->fence);
+
+		cursor->is_first = first;
+		if (first) {
+			cursor->seq = read_seqcount_begin(&obj->seq);
+			cursor->index = -1;
+			cursor->fences = dma_resv_shared_list(obj);
+
+			cursor->fence = dma_resv_excl_fence(obj);
+			if (cursor->fence &&
+			    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+				     &cursor->fence->flags))
+				cursor->fence = NULL;
+		} else {
+			cursor->fence = NULL;
+		}
+
+		if (cursor->fence) {
+			cursor->fence = dma_fence_get_rcu(cursor->fence);
+		} else if (cursor->all_fences && cursor->fences) {
+			struct dma_resv_list *fences = cursor->fences;
+
+			while (++cursor->index < fences->shared_count) {
+				cursor->fence = rcu_dereference(
+					fences->shared[cursor->index]);
+				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &cursor->fence->flags))
+					break;
+			}
+			if (cursor->index < fences->shared_count)
+				cursor->fence =
+					dma_fence_get_rcu(cursor->fence);
+			else
+				cursor->fence = NULL;
+		}
+
+		/* For the eventually next round */
+		first = true;
+	} while (read_seqcount_retry(&obj->seq, cursor->seq));
+
+	return cursor->fence;
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 9100dd3dc21f..693d16117153 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -149,6 +149,90 @@ struct dma_resv {
 	struct dma_resv_list __rcu *fence;
 };
 
+/**
+ * struct dma_resv_iter - current position into the dma_resv fences
+ *
+ * Don't touch this directly in the driver, use the accessor function instead.
+ */
+struct dma_resv_iter {
+	/** @obj: The dma_resv object we iterate over */
+	struct dma_resv *obj;
+
+	/** @all_fences: If all fences should be returned */
+	bool all_fences;
+
+	/** @fence: the currently handled fence */
+	struct dma_fence *fence;
+
+	/** @seq: sequence number to check for modifications */
+	unsigned int seq;
+
+	/** @index: index into the shared fences */
+	unsigned int index;
+
+	/** @fences: the shared fences */
+	struct dma_resv_list *fences;
+
+	/** @is_first: true if this is the first returned fence */
+	bool is_first;
+};
+
+struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
+					      bool first);
+
+/**
+ * dma_resv_iter_begin - initialize a dma_resv_iter object
+ * @cursor: The dma_resv_iter object to initialize
+ * @obj: The dma_resv object which we want to iterator over
+ * @all_fences: If all fences should be returned or just the exclusive one
+ */
+static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
+					struct dma_resv *obj,
+					bool all_fences)
+{
+	cursor->obj = obj;
+	cursor->all_fences = all_fences;
+	cursor->fence = NULL;
+}
+
+/**
+ * dma_resv_iter_end - cleanup a dma_resv_iter object
+ * @cursor: the dma_resv_iter object which should be cleaned up
+ *
+ * Make sure that the reference to the fence in the cursor is properly
+ * dropped.
+ */
+static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
+{
+	dma_fence_put(cursor->fence);
+}
+
+/**
+ * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
+ * @cursor: the cursor of the current position
+ *
+ * Returns true if the currently returned fence is the exclusive one.
+ */
+static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
+{
+	return cursor->index == -1;
+}
+
+/**
+ * dma_resv_for_each_fence_unlocked - unlocked fence iterator
+ * @cursor: a struct dma_resv_iter pointer
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object without holding the
+ * dma_resv::lock. The RCU read side lock must be hold when using this, but can
+ * be dropped and re-taken as necessary inside the loop. The cursor needs to be
+ * initialized with dma_resv_iter_begin_unlocked() and cleaned up with
+ * dma_resv_iter_end_unlocked().
+ */
+#define dma_resv_for_each_fence_unlocked(cursor, fence)			\
+	for (fence = dma_resv_iter_walk_unlocked(cursor, true);		\
+	     fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-- 
2.25.1

