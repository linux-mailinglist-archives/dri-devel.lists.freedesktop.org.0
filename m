Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34BA961C41
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71E710E444;
	Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPqhhLTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8095D10E43F;
 Wed, 28 Aug 2024 02:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813288; x=1756349288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4NcHhht7R85hRcl43GBO0i1KlziGSyVufpAc1OriAU=;
 b=LPqhhLTWAp6JMJOOM7E5FE8UEkh3UYjP83Y98zdbGALzHcH6Ds5uMNOo
 gfMr4IsnTm94W+e19Sq5AOJUM/qgvacXKFNow/QQxvxeGaqjPxhzzGUAR
 otoLYjzxCD6LayYiOTrG9o9FJIE0DL+j1D71kA2mmWljhKqSDU/EfoDf7
 gET+xpR5W5NbNIWcBLflwDKaEMlB9SQ2kefHBGXn8rpoSCgaQml6891p8
 kycP849wwyPBTVy1iZYOzGLLdCuPR0zesngPFh1GUMqX2mqjZwT/juhDx
 QE3oXG/8TZiy8hjpNOuZE+utTIb3Cadk/PbITNfMBoq8J85vN13Hs+nSa g==;
X-CSE-ConnectionGUID: R4ptwx9jTGOyYp+blpkqiA==
X-CSE-MsgGUID: VxWdaxNWTD+v7auPvufuZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251846"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:07 -0700
X-CSE-ConnectionGUID: OjqwvTI+QxGQ623af+GINg==
X-CSE-MsgGUID: QG7qk4vRQjmjBmsL1Lj36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224584"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 01/28] dma-buf: Split out dma fence array create into
 alloc and arm functions
Date: Tue, 27 Aug 2024 19:48:34 -0700
Message-Id: <20240828024901.2582335-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

v2:
 - s/arm/init (Christian)
 - Drop !array warn (Christian)

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 78 ++++++++++++++++++++++---------
 include/linux/dma-fence-array.h   |  6 +++
 2 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index c74ac197d5fe..0659e6b29b3c 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -144,37 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
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
+ * dma_fence_array_init - Arm a custom fence array
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
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any)
 {
-	struct dma_fence_array *array;
-
 	WARN_ON(!num_fences || !fences);
 
-	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
-	if (!array)
-		return NULL;
-
 	array->num_fences = num_fences;
 
 	spin_lock_init(&array->lock);
@@ -200,6 +201,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	 */
 	while (num_fences--)
 		WARN_ON(dma_fence_is_container(fences[num_fences]));
+}
+EXPORT_SYMBOL(dma_fence_array_init);
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
+	dma_fence_array_init(array, num_fences, fences,
+			     context, seqno, signal_on_any);
 
 	return array;
 }
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 29c5650c1038..079b3dec0a16 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -79,6 +79,12 @@ to_dma_fence_array(struct dma_fence *fence)
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
 	     ++(index), fence = dma_fence_array_next(head, index))
 
+struct dma_fence_array *dma_fence_array_alloc(int num_fences);
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any);
+
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno,
-- 
2.34.1

