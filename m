Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AEC95F74B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 19:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D13E10E263;
	Mon, 26 Aug 2024 17:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdYt4yA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC8910E252;
 Mon, 26 Aug 2024 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691650; x=1756227650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4NcHhht7R85hRcl43GBO0i1KlziGSyVufpAc1OriAU=;
 b=GdYt4yA3hKzFdOWTO8EEw5xhY/fsOTYFLc/vd3GJEYoDNaPrVdP/gV1g
 QjRJzg8/dd7JkwS/JX4aRBj4pj93fRxru4TawFIpMOfNgXSeBSfY/V40D
 GAPuIrpR5Wlld+t8mw5PBjv2xewavvVHYP8FQZePa/isfpdTo74ACJPtP
 OAZaARlYjJ/1xm+EsA/LOaHpHkP+I2cOqcLNkc1kBtB8tPLc0GdL/Ww5Y
 Yh/s/crhdIC6QGSnNkvpikjND6sv3m8RTse983IB2Orb4zqPrh3Z1b2NB
 c0flK/yNZq7Hr6S1QLXZllZyXbL6x7djefGWWU46eeNeyfyiLYl83nVDq A==;
X-CSE-ConnectionGUID: HW44WFToQcmWwNSfz0c3EQ==
X-CSE-MsgGUID: s2n36qSKToeAneqBbwzTCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22997992"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="22997992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:00:50 -0700
X-CSE-ConnectionGUID: tP0j6q0iTUy0GUeqhaclUg==
X-CSE-MsgGUID: aq43GtrdSCSn8KGNQvgBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62247120"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:00:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v2 1/2] dma-buf: Split out dma fence array create into alloc
 and arm functions
Date: Mon, 26 Aug 2024 10:01:43 -0700
Message-Id: <20240826170144.2492062-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826170144.2492062-1-matthew.brost@intel.com>
References: <20240826170144.2492062-1-matthew.brost@intel.com>
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

