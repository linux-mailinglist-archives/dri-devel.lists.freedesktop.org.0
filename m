Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E58C382EEC
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381716E97E;
	Mon, 17 May 2021 14:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529316E974
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:38 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t3so7080379edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1zNbi6Zov5OYz29vP/UsO9tmrckTut+qHanO+zcMqco=;
 b=V+YrANUYUxA9c50Gf9575OacevsMRuvTkCvptwSpMvXe/ph6GQvQulfxJYdgZd4elh
 u+RyRrxLLHyRnoxpyPRTCJtTpwvE264nsh+1Rju9SUte82wQbSlqxzZbRcAiDn6EkDdz
 a2S57n13tsjdahBwdkJl2Pi/RAirbIcHiYY+ZUfZ5XrwweVU/a7lBaerv+vY9LB7durO
 Lt5r3FLPDpdBqQPxQcjG6V+TtlH8Enm9RBf6auN9Hq77y5ixUEDcJFXEUvJwSCBnT+PE
 J8kE9SBsJ4l9DsHYGedcMqkONY/YqgYr1UWCQrgn7ETgIagIPkpEfdfWjoP/V3WPTrJX
 2m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zNbi6Zov5OYz29vP/UsO9tmrckTut+qHanO+zcMqco=;
 b=LNZeVDAzpF1cbx1rY7McUY4CD5nJH/r75I5bl5vtEcbz9YVXccEC9+TisFgnwoYDWq
 u5UTfK0SRb+q4bmBu32cpGNyRPGnTcgCCWGqCwrmgWD97VxR7+grsrjngvfoz8/ODUCm
 14g3ir05BKmT/x8+YbF6mD8IBHgGytgkHfJQDrGnIah/GzpZ/NiZ0IcT+fWmsshRnkwe
 r8e4+ftxNa/Kc9lWOzLIJT82NCKUUBxNgin6djUcULu8TrlI/YDegK1lHVx/WO7LHfeB
 WAu96Zew9acQuQMV3qeHbT9TEsd2i/pWdssdrlmPx5hCvSJmpz/2KiHkn3J3clOlfzAu
 M6Ww==
X-Gm-Message-State: AOAM533FpKnhWO2mZUtfFwCf+SRVhtN3u+D7mnqH6RlTJssXMB3jvscG
 jkhbrsX7BvRKzEWGdsSuIpwLywicB7s=
X-Google-Smtp-Source: ABdhPJwo8xhvc8W4MpvI1YqHJWCvCeVqxiVKMDwnP49ZcwDru0vLad3g1Dr8OWskPCHxsSYJ3yxqXw==
X-Received: by 2002:aa7:c84a:: with SMTP id g10mr251078edt.326.1621260696552; 
 Mon, 17 May 2021 07:11:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/11] dma-buf: add dma_resv_list_fence helper
Date: Mon, 17 May 2021 16:11:24 +0200
Message-Id: <20210517141129.2225-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

Instead of repeating the access check over and over again.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b1a1a31dc009..49f3c1009821 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -93,6 +93,22 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 	kfree_rcu(list, rcu);
 }
 
+/**
+ * dma_resv_list_fence - return fence for index
+ * @obj: the reservation object
+ * @list: list to get the fence from
+ * @idx: index into the fence array
+ *
+ * Return the fence at the specified index double checking that either the rcu
+ * read side or the dma_resv object is held.
+ */
+static struct dma_fence *dma_resv_list_fence(struct dma_resv *obj,
+					     struct dma_resv_list *list,
+					     unsigned int idx)
+{
+	return rcu_dereference_check(list->shared[idx], dma_resv_held(obj));
+}
+
 /**
  * dma_resv_init - initialize a reservation object
  * @obj: the reservation object
@@ -171,8 +187,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 	for (i = 0, j = 0, k = max; i < (old ? old->shared_count : 0); ++i) {
 		struct dma_fence *fence;
 
-		fence = rcu_dereference_protected(old->shared[i],
-						  dma_resv_held(obj));
+		fence = dma_resv_list_fence(obj, old, i);
 		if (dma_fence_is_signaled(fence))
 			RCU_INIT_POINTER(new->shared[--k], fence);
 		else
@@ -194,13 +209,8 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 		return 0;
 
 	/* Drop the references to the signaled fences */
-	for (i = k; i < max; ++i) {
-		struct dma_fence *fence;
-
-		fence = rcu_dereference_protected(new->shared[i],
-						  dma_resv_held(obj));
-		dma_fence_put(fence);
-	}
+	for (i = k; i < max; ++i)
+		dma_fence_put(dma_resv_list_fence(obj, new, i));
 	kfree_rcu(old, rcu);
 
 	return 0;
@@ -251,8 +261,7 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	for (i = 0; i < count; ++i) {
 
-		old = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(obj));
+		old = dma_resv_list_fence(obj, fobj, i);
 		if (old->context == fence->context ||
 		    dma_fence_is_signaled(old))
 			goto replace;
@@ -303,8 +312,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	/* inplace update, no shared fences */
 	while (i--)
-		dma_fence_put(rcu_dereference_protected(old->shared[i],
-						dma_resv_held(obj)));
+		dma_fence_put(dma_resv_list_fence(obj, old, i));
 
 	dma_fence_put(old_fence);
 }
@@ -350,7 +358,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 			struct dma_fence __rcu **dst;
 			struct dma_fence *fence;
 
-			fence = rcu_dereference(src_list->shared[i]);
+			fence = dma_resv_list_fence(src, src_list, i);
 			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				     &fence->flags))
 				continue;
@@ -459,7 +467,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 			shared = nshared;
 			shared_count = fobj ? fobj->shared_count : 0;
 			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
+				shared[i] = dma_resv_list_fence(obj, fobj, i);
 				if (!dma_fence_get_rcu(shared[i]))
 					break;
 			}
@@ -543,7 +551,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 		for (i = 0; !fence && i < shared_count; ++i) {
 			struct dma_fence *lfence;
 
-			lfence = rcu_dereference(fobj->shared[i]);
+			lfence = dma_resv_list_fence(obj, fobj, i);
 			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				     &lfence->flags))
 				continue;
@@ -629,7 +637,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 		for (i = 0; i < shared_count; ++i) {
 			struct dma_fence *fence;
 
-			fence = rcu_dereference(fobj->shared[i]);
+			fence = dma_resv_list_fence(obj, fobj, i);
 			ret = dma_resv_test_signaled_single(fence);
 			if (ret < 0)
 				goto retry;
-- 
2.25.1

