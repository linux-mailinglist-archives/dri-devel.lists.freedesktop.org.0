Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA3394170
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E006F46C;
	Fri, 28 May 2021 10:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA966EEB0;
 Fri, 28 May 2021 10:57:59 +0000 (UTC)
IronPort-SDR: TmMD3+bz6+1c9Od8Hbz9btSUfo9DkoKsOFfcg7L0OTNEUtuQWBLZU/0QWIsJsfoj/O2Rf0Lkjk
 f175c8RPFDMQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="266821812"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="266821812"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:57:59 -0700
IronPort-SDR: jx3UcLplddu/FzE7Zs/QvEmkmwfJJ+i63z1Ldl0pMjzxL32ElUicqD0Ml9MBd4msig5f2HXsHM
 WLnv/E9/tyXA==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="477885195"
Received: from jdahlin-mobl1.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.92])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:57:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/15] drm/i915: Fix i915_sg_page_sizes to record dma
 segments rather than physical pages
Date: Fri, 28 May 2021 12:57:32 +0200
Message-Id: <20210528105744.58271-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
References: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All users of this function actually want the dma segment sizes, but that's
not what's calculated. Fix that and rename the function to
i915_sg_dma_sizes to reflect what's calculated.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  2 +-
 drivers/gpu/drm/i915/i915_scatterlist.h     | 16 ++++++++++++----
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index ccede73c6465..616c3a2f1baf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -209,7 +209,7 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	sg_page_sizes = i915_sg_page_sizes(pages->sgl);
+	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
 
 	__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 51a05e62875d..be72ad0634ba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -207,7 +207,7 @@ static int i915_gem_object_shmem_to_phys(struct drm_i915_gem_object *obj)
 
 err_xfer:
 	if (!IS_ERR_OR_NULL(pages)) {
-		unsigned int sg_page_sizes = i915_sg_page_sizes(pages->sgl);
+		unsigned int sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
 
 		__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index a657b99ec760..602f0ed983ec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -173,7 +173,7 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 		goto err;
 	}
 
-	sg_page_sizes = i915_sg_page_sizes(st->sgl);
+	sg_page_sizes = i915_sg_dma_sizes(st->sgl);
 
 	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
 
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 9cb26a224034..b96baad66a3a 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -101,15 +101,23 @@ static inline struct scatterlist *__sg_next(struct scatterlist *sg)
 	     (((__iter).curr += PAGE_SIZE) >= (__iter).max) ?		\
 	     (__iter) = __sgt_iter(__sg_next((__iter).sgp), false), 0 : 0)
 
-static inline unsigned int i915_sg_page_sizes(struct scatterlist *sg)
+/**
+ * i915_sg_dma_sizes - Record the dma segment sizes of a scatterlist
+ * @sg: The scatterlist
+ *
+ * Return: An unsigned int with segment sizes logically or'ed together.
+ * A caller can use this information to determine what hardware page table
+ * entry sizes can be used to map the memory represented by the scatterlist.
+ */
+static inline unsigned int i915_sg_dma_sizes(struct scatterlist *sg)
 {
 	unsigned int page_sizes;
 
 	page_sizes = 0;
-	while (sg) {
+	while (sg && sg_dma_len(sg)) {
 		GEM_BUG_ON(sg->offset);
-		GEM_BUG_ON(!IS_ALIGNED(sg->length, PAGE_SIZE));
-		page_sizes |= sg->length;
+		GEM_BUG_ON(!IS_ALIGNED(sg_dma_len(sg), PAGE_SIZE));
+		page_sizes |= sg_dma_len(sg);
 		sg = __sg_next(sg);
 	}
 
-- 
2.31.1

