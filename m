Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C51395A53
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C827B6E8FC;
	Mon, 31 May 2021 12:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AF26E8F6;
 Mon, 31 May 2021 12:20:03 +0000 (UTC)
IronPort-SDR: UgFjZ7eVO7yxKaX5TrN7mqdCKnOxb/pCGyAy5TM3p7E/ocLTONMjQhcUlnFWZKTjT4Qu9oSzvi
 FSFLdvS6BA9Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="183027460"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="183027460"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:03 -0700
IronPort-SDR: 0dg/8kT9KMn5uIsTH/ZPJ6Rco2Ke5JYsm7KWyUvgH1E30Cm393ihtXFYZ/xocISlbuSc2ozHTH
 T7ilmVEGZDEA==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="473903818"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:02 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 03/15] drm/i915: Fix i915_sg_page_sizes to record dma
 segments rather than physical pages
Date: Mon, 31 May 2021 14:19:28 +0200
Message-Id: <20210531121940.267032-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
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

