Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E14961C45
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B656610E450;
	Wed, 28 Aug 2024 02:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEVscTMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E64C10E440;
 Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813289; x=1756349289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6srlCMSGxAXdO4Bj6bo4VXVuLaCivCvijEQZeZRRPp8=;
 b=VEVscTMGpGKMuGUqLBReFtG7XX4XI6Kmj31Td2LKNtVs2kh+60EsPQoK
 Q5QsQ0Q3vSVhMpQ1PSBrCC6Ezqo9crtmz2QHcuiHKQJw1srzWEeV2Ek81
 2bP32AqjHa88XyK26o4YfV7+1ep65+rp7wgzxtBe7hgwa0Jv9Q8DMk9zi
 8qnOkLaMeaIujR0h2IW4zVtxI04ZCQLzPNGKXfv2X3AJ3233PoKZfuYLe
 0SXmX6pypcPbYM7DlMpt2PWXsf27ZH7au0u5hfsWKxCDGrYgvIXBiEj+q
 0t+SerASsjShVMv0KLGnDXQiaaHEJt6fZP6v1+a4gJhQWDPcrQ3oD7BzD w==;
X-CSE-ConnectionGUID: z91zPE0fQquVocjAcnr2/w==
X-CSE-MsgGUID: dz3r/koaRmSY2sDjAx6wuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251880"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251880"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
X-CSE-ConnectionGUID: ZJ7reUp2RjGYp+zcpdiWWw==
X-CSE-MsgGUID: OhfE2StHSn+hj6OR4fEYNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224608"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 08/28] drm/xe: Add dma_addr res cursor
Date: Tue, 27 Aug 2024 19:48:41 -0700
Message-Id: <20240828024901.2582335-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Useful for SVM ranges in SRAM and programing page tables.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 50 +++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index dca374b6521c..3df630af9252 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -43,7 +43,9 @@ struct xe_res_cursor {
 	u64 remaining;
 	void *node;
 	u32 mem_type;
+	unsigned int order;
 	struct scatterlist *sgl;
+	const dma_addr_t *dma_addr;
 	struct drm_buddy *mm;
 };
 
@@ -70,6 +72,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 				struct xe_res_cursor *cur)
 {
 	cur->sgl = NULL;
+	cur->dma_addr = NULL;
 	if (!res)
 		goto fallback;
 
@@ -160,11 +163,43 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 	cur->start = start;
 	cur->remaining = size;
 	cur->size = 0;
+	cur->dma_addr = NULL;
 	cur->sgl = sg->sgl;
 	cur->mem_type = XE_PL_TT;
 	__xe_res_sg_next(cur);
 }
 
+/**
+ * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
+ *
+ * @dma_addr: dma_addr array to walk
+ * @start: Start of the range
+ * @size: Size of the range
+ * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
+ * @cur: cursor object to initialize
+ *
+ * Start walking over the range of allocations between @start and @size.
+ */
+static inline void xe_res_first_dma(const dma_addr_t *dma_addr,
+				    u64 start, u64 size,
+				    unsigned int order,
+				    struct xe_res_cursor *cur)
+{
+	XE_WARN_ON(start);
+	XE_WARN_ON(!dma_addr);
+	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
+		   !IS_ALIGNED(size, PAGE_SIZE));
+
+	cur->node = NULL;
+	cur->start = start;
+	cur->remaining = size;
+	cur->size = PAGE_SIZE << order;
+	cur->dma_addr = dma_addr;
+	cur->order = order;
+	cur->sgl = NULL;
+	cur->mem_type = XE_PL_TT;
+}
+
 /**
  * xe_res_next - advance the cursor
  *
@@ -191,6 +226,13 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		return;
 	}
 
+	if (cur->dma_addr) {
+		cur->size = (PAGE_SIZE << cur->order) -
+			(size - cur->size);
+		cur->start += size;
+		return;
+	}
+
 	if (cur->sgl) {
 		cur->start += size;
 		__xe_res_sg_next(cur);
@@ -232,6 +274,12 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
  */
 static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
 {
-	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start : cur->start;
+	if (cur->dma_addr)
+		return cur->dma_addr[cur->start >> (PAGE_SHIFT + cur->order)] +
+			(cur->start & ((PAGE_SIZE << cur->order) - 1));
+	else if (cur->sgl)
+		return sg_dma_address(cur->sgl) + cur->start;
+	else
+		return cur->start;
 }
 #endif
-- 
2.34.1

