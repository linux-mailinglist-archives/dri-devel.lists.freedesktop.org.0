Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAEA95C466
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 06:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179A810EC1F;
	Fri, 23 Aug 2024 04:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bqn5haid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87DD10EC27;
 Fri, 23 Aug 2024 04:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724388828; x=1755924828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9WWRRj1RW5kY9EJCtnqTP5B0OgZazgRaMjqrj4rNtn4=;
 b=Bqn5haid8BvI8oFCQpwSYC0nP/jx1i3Y8sSOHiSiKBim37SGk+ZbQBEU
 zphS7pB37h9UL23f5YJ+OVKHXXB17AONa4mgE3I1Abf/A+If0LsCJDDxK
 spgOZoZgMnzCc0rYvMLdKEKMqP9Dbm4tsMHSQDL+9Sk+HUwSTGcnFe7fe
 iKfUCE0JL9zI+ch8yypJFZ0+xTGpOlc3U0o9iRbyyodQM3Otyx+PSNs6t
 M4AvbgYVEeMe8fnICU7bmxePUFOYfGYhiq1LnFMfNEZRCCfzcnr+H49Gi
 BrzRHjnbWa0OXKsVw0wGKmlJw1gSxR5PWkadJI21SHGxRSF+i5qHsh8/z A==;
X-CSE-ConnectionGUID: sLeG0EyaQSqSB85oz4CfCQ==
X-CSE-MsgGUID: ptSAgMzXQbeaHIgp+4b9+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26709252"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="26709252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 21:53:47 -0700
X-CSE-ConnectionGUID: eYjq4NBBSKGLzLe+DIUC3A==
X-CSE-MsgGUID: +mBTDfe2SbOh1JKq+tok2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66608948"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 21:53:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH v3 1/2] dma-buf: Split out dma fence array create into alloc
 and arm functions
Date: Thu, 22 Aug 2024 21:54:42 -0700
Message-Id: <20240823045443.2132118-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823045443.2132118-1-matthew.brost@intel.com>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
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

Useful to preallocate dma fence array and then arm in path of reclaim or
a dma fence.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 81 ++++++++++++++++++++++---------
 include/linux/dma-fence-array.h   |  7 +++
 2 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index c74ac197d5fe..b03e0a87a5cd 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -144,36 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
 EXPORT_SYMBOL(dma_fence_array_ops);
 
 /**
- * dma_fence_array_create - Create a custom fence array
+ * dma_fence_array_alloc - Allocate a custom fence array
+ * @num_fences:		[in]	number of fences to add in the array
+ *
+ * Return dma fence array on success, NULL on failure
+ */
+struct dma_fence_array *dma_fence_array_alloc(int num_fences)
+{
+	struct dma_fence_array *array;
+
+	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
+}
+EXPORT_SYMBOL(dma_fence_array_alloc);
+
+/**
+ * dma_fence_array_arm - Arm a custom fence array
+ * @array:		[in]	dma fence array to arm
  * @num_fences:		[in]	number of fences to add in the array
  * @fences:		[in]	array containing the fences
  * @context:		[in]	fence context to use
  * @seqno:		[in]	sequence number to use
  * @signal_on_any:	[in]	signal on any fence in the array
  *
- * Allocate a dma_fence_array object and initialize the base fence with
- * dma_fence_init().
- * In case of error it returns NULL.
- *
- * The caller should allocate the fences array with num_fences size
- * and fill it with the fences it wants to add to the object. Ownership of this
- * array is taken and dma_fence_put() is used on each fence on release.
- *
- * If @signal_on_any is true the fence array signals if any fence in the array
- * signals, otherwise it signals when all fences in the array signal.
+ * Implementation of @dma_fence_array_create without allocation. Useful to arm a
+ * preallocated dma fence fence in the path of reclaim or dma fence signaling.
  */
-struct dma_fence_array *dma_fence_array_create(int num_fences,
-					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any)
+void dma_fence_array_arm(struct dma_fence_array *array,
+			 int num_fences,
+			 struct dma_fence **fences,
+			 u64 context, unsigned seqno,
+			 bool signal_on_any)
 {
-	struct dma_fence_array *array;
-
-	WARN_ON(!num_fences || !fences);
-
-	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
-	if (!array)
-		return NULL;
+	WARN_ON(!array || !num_fences || !fences);
 
 	array->num_fences = num_fences;
 
@@ -200,6 +202,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	 */
 	while (num_fences--)
 		WARN_ON(dma_fence_is_container(fences[num_fences]));
+}
+EXPORT_SYMBOL(dma_fence_array_arm);
+
+/**
+ * dma_fence_array_create - Create a custom fence array
+ * @num_fences:		[in]	number of fences to add in the array
+ * @fences:		[in]	array containing the fences
+ * @context:		[in]	fence context to use
+ * @seqno:		[in]	sequence number to use
+ * @signal_on_any:	[in]	signal on any fence in the array
+ *
+ * Allocate a dma_fence_array object and initialize the base fence with
+ * dma_fence_init().
+ * In case of error it returns NULL.
+ *
+ * The caller should allocate the fences array with num_fences size
+ * and fill it with the fences it wants to add to the object. Ownership of this
+ * array is taken and dma_fence_put() is used on each fence on release.
+ *
+ * If @signal_on_any is true the fence array signals if any fence in the array
+ * signals, otherwise it signals when all fences in the array signal.
+ */
+struct dma_fence_array *dma_fence_array_create(int num_fences,
+					       struct dma_fence **fences,
+					       u64 context, unsigned seqno,
+					       bool signal_on_any)
+{
+	struct dma_fence_array *array;
+
+	array = dma_fence_array_alloc(num_fences);
+	if (!array)
+		return NULL;
+
+	dma_fence_array_arm(array, num_fences, fences,
+			    context, seqno, signal_on_any);
 
 	return array;
 }
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 29c5650c1038..3466ffc4b803 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -79,6 +79,13 @@ to_dma_fence_array(struct dma_fence *fence)
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
 	     ++(index), fence = dma_fence_array_next(head, index))
 
+struct dma_fence_array *dma_fence_array_alloc(int num_fences);
+void dma_fence_array_arm(struct dma_fence_array *array,
+			 int num_fences,
+			 struct dma_fence **fences,
+			 u64 context, unsigned seqno,
+			 bool signal_on_any);
+
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno,
-- 
2.34.1

