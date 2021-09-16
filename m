Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D540D897
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286486ECF0;
	Thu, 16 Sep 2021 11:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FFC6ECE7;
 Thu, 16 Sep 2021 11:30:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q26so8904738wrc.7;
 Thu, 16 Sep 2021 04:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvxszxniiDuLPK7ez/G/j9ZGFeJ7+aNuFyP3PTamFmA=;
 b=Ebm6l+S5zGYRm+mYirnUX1/rv/7TQNjYFbOczwcl4ZCg6lXJa4a0fBx1DJFLixCens
 LP6f6mgaYj7FKFG69WGoTPtLt5qFnALKToGfNFF3HXly2BxXSeEYopAv/LjYfmvq6gEF
 +AxPpQiVO3jAEgwR/9AC9o/OwtL50yBV0zCiHqyyGOG25M2nTDzG882d91TlHfBLBJLK
 +kO7AVylZyExtf2+1lLm+1thc8pwvenRGrrA9H9on0gKwWcniMY7ZT6gfF3lvUd7IxKN
 ABhe0ivG8MhTRjCKZ7KjW3M5x/0JMgcb9tUlOvuiM1YAoc7Srpf5urk/ikW8HBEll7ly
 YG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvxszxniiDuLPK7ez/G/j9ZGFeJ7+aNuFyP3PTamFmA=;
 b=z1H4gzvM1NtXAceEQnzAr41vIswChK+5SmmEW6gQl/UYuI6SsnlVRFYGgUUPuNMbeR
 LHlkteIwr+147UQetyrIrWXd2JQecyHkBN/e2oRMnxFVY7BWQruP3+xj1P5EU4gl44DG
 ATS33DmlxrmLWT6ixXAUzOWVqmfKJUrkpTNgk2mhFVdIMirb3h5rLO3Fe9HwDK3sf8Wq
 BeTRKnj8nMExwea7rRzF6jLVMeKmklf6jUXG1395ogxBF79Sfht6lIhxxocbAlc3m/3q
 CswNT/EgMrnSRB7UEVQWoQQLUuT7iyeeAyGA99FMd/CXXWXXR6UOn4DVOXvnE3MkQuXH
 XXWQ==
X-Gm-Message-State: AOAM530P7Jz9/9Av4QveuZ6mjzwiMnHwLOjxonjB8JyN1RLxdreq1TWb
 0TmQrz/Cw2CYTqarCYWT3Hw=
X-Google-Smtp-Source: ABdhPJw2AFfKvpFgu+qFhyozZnxS9E0qTFCZL9JeXXoTGV9kPZNklKxgFBNmFrCAKv/6dEkVIeW0Qg==
X-Received: by 2002:a5d:5610:: with SMTP id l16mr5549144wrv.102.1631791847816; 
 Thu, 16 Sep 2021 04:30:47 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 02/26] dma-buf: add dma_resv_for_each_fence
Date: Thu, 16 Sep 2021 13:30:18 +0200
Message-Id: <20210916113042.3631-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

A simpler version of the iterator to be used when the dma_resv object is
locked.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 18 ++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 77083170ec3b..bbf36a08ced0 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,43 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_walk - walk over fences in a dma_resv obj
+ * @obj: the dma_resv object
+ * @cursor: cursor to record the current position
+ * @all_fences: true returns also the shared fences
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * dma_resv::lock.
+ */
+struct dma_fence *dma_resv_walk(struct dma_resv *obj,
+				struct dma_resv_iter *cursor,
+				bool all_fences, bool first)
+{
+	dma_resv_assert_held(obj);
+
+	cursor->is_first = first;
+	if (first) {
+		struct dma_fence *fence;
+
+		cursor->index = -1;
+		cursor->fences = dma_resv_shared_list(obj);
+
+		fence = dma_resv_excl_fence(obj);
+		if (fence)
+			return fence;
+	}
+
+	if (!all_fences || !cursor->fences ||
+	    ++cursor->index >= cursor->fences->shared_count)
+		return NULL;
+
+	return rcu_dereference_protected(cursor->fences->shared[cursor->index],
+					 dma_resv_held(obj));
+}
+EXPORT_SYMBOL_GPL(dma_resv_walk);
+
 /**
  * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
  * @obj: the dma_resv object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 1cd686384c71..6761512ba662 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -168,6 +168,21 @@ struct dma_resv_iter {
 	bool is_first;
 };
 
+/**
+ * dma_resv_for_each_fence - fence iterator
+ * @obj: a dma_resv object pointer
+ * @cursor: a struct dma_resv_iter pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object while holding the
+ * dma_resv::lock. @all_fences controls if the shared fences are returned as
+ * well.
+ */
+#define dma_resv_for_each_fence(obj, cursor, all_fences, fence)		  \
+	for (fence = dma_resv_walk(obj, cursor, all_fences, true); fence; \
+	     fence = dma_resv_walk(obj, cursor, all_fences, false))
+
 /**
  * dma_resv_for_each_fence_unlocked - fence iterator
  * @obj: a dma_resv object pointer
@@ -413,6 +428,9 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+struct dma_fence *dma_resv_walk(struct dma_resv *obj,
+				struct dma_resv_iter *cursor,
+				bool first, bool all_fences);
 struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
 					 struct dma_resv_iter *cursor,
 					 bool first, bool all_fences);
-- 
2.25.1

