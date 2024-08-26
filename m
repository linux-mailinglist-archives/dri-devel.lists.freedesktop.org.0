Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA0595F730
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5534810E25C;
	Mon, 26 Aug 2024 16:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nohsV8zj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3E010E257;
 Mon, 26 Aug 2024 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691249; x=1756227249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mo9b4Do01eUKfFsI45Afrofw/5Dbt+h5VclaWoxLb3g=;
 b=nohsV8zjX3cyqFoF64ZgAyvdG7B+NPSWTRmk5mRWwPCthmsvMmQd264t
 xlFZPBKDnQBSJi9SJeBcS6pmdNQgTBSV2/rweGlQPTafoqjjreYS05ET7
 skKCQUa9sNGAJBry5m9kgcPxv7tNt7LP/vWLF4AHlAGZfgyanT7rlQJhW
 SHD5KQFeT8PflbWE9UHaExN/6xT/5J/v3s55/8DdYImJSDLFcH8jg4o9v
 etyCq66v20pxMn/byukT1Ua7F28SOf7MmcdjI2OneuW0K1dPwnyNIH1Fm
 ex+aRAwTbxPC3HXzRfUHwOBC/DW44W4s9qVxHNa2VsjWdCiYAe01oRSEe Q==;
X-CSE-ConnectionGUID: BzGj+9P2Sg6eQyEFyiXSHA==
X-CSE-MsgGUID: SsaBWXpZSKiO9M9ShBPJPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26923448"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="26923448"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:54:09 -0700
X-CSE-ConnectionGUID: B+5VXKv8S8GnXoaYQmKt8A==
X-CSE-MsgGUID: NmNeDeHJRVuk1YOhMgdTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62563499"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:54:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH 1/2] dma-buf: Split out dma fence array create into alloc and
 arm
Date: Mon, 26 Aug 2024 09:54:55 -0700
Message-Id: <20240826165456.2491477-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826165456.2491477-1-matthew.brost@intel.com>
References: <20240826165456.2491477-1-matthew.brost@intel.com>
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
 drivers/dma-buf/dma-fence-array.c | 19 +++++++++----------
 include/linux/dma-fence-array.h   |  9 ++++-----
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index b03e0a87a5cd..0659e6b29b3c 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -158,7 +158,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences)
 EXPORT_SYMBOL(dma_fence_array_alloc);
 
 /**
- * dma_fence_array_arm - Arm a custom fence array
+ * dma_fence_array_init - Arm a custom fence array
  * @array:		[in]	dma fence array to arm
  * @num_fences:		[in]	number of fences to add in the array
  * @fences:		[in]	array containing the fences
@@ -169,13 +169,12 @@ EXPORT_SYMBOL(dma_fence_array_alloc);
  * Implementation of @dma_fence_array_create without allocation. Useful to arm a
  * preallocated dma fence fence in the path of reclaim or dma fence signaling.
  */
-void dma_fence_array_arm(struct dma_fence_array *array,
-			 int num_fences,
-			 struct dma_fence **fences,
-			 u64 context, unsigned seqno,
-			 bool signal_on_any)
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any)
 {
-	WARN_ON(!array || !num_fences || !fences);
+	WARN_ON(!num_fences || !fences);
 
 	array->num_fences = num_fences;
 
@@ -203,7 +202,7 @@ void dma_fence_array_arm(struct dma_fence_array *array,
 	while (num_fences--)
 		WARN_ON(dma_fence_is_container(fences[num_fences]));
 }
-EXPORT_SYMBOL(dma_fence_array_arm);
+EXPORT_SYMBOL(dma_fence_array_init);
 
 /**
  * dma_fence_array_create - Create a custom fence array
@@ -235,8 +234,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	if (!array)
 		return NULL;
 
-	dma_fence_array_arm(array, num_fences, fences,
-			    context, seqno, signal_on_any);
+	dma_fence_array_init(array, num_fences, fences,
+			     context, seqno, signal_on_any);
 
 	return array;
 }
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 3466ffc4b803..079b3dec0a16 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -80,11 +80,10 @@ to_dma_fence_array(struct dma_fence *fence)
 	     ++(index), fence = dma_fence_array_next(head, index))
 
 struct dma_fence_array *dma_fence_array_alloc(int num_fences);
-void dma_fence_array_arm(struct dma_fence_array *array,
-			 int num_fences,
-			 struct dma_fence **fences,
-			 u64 context, unsigned seqno,
-			 bool signal_on_any);
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any);
 
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
-- 
2.34.1

