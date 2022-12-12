Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2660D64AB79
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BE510E2AE;
	Mon, 12 Dec 2022 23:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C593210E2BB;
 Mon, 12 Dec 2022 23:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670886939; x=1702422939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UBS1pSFrUvWSQGeSGImJsb42i6XwSG2Dy0x6b5AZQy0=;
 b=HgmFPrTWspgJGIbY1FgwVIiBl1RpLwUW0fo1I1TYtfa68hK0KX4Bbg9q
 Fy/IxmcVGbhXSBe7bCLDb3Nn8xvA8y5vLVQv5vW+guyFGidUQpPTlb86Y
 bGubZJpXhGID12aIZ8JoPlfB6EgpKeyeYRCUZRjo8wPC/O2UYksitYorH
 BHK825QmixxlASeAN7ciR5XBlCVBEuptNVAKJWu4zZLXebkckJsgSE3b+
 27wTbgWP7fsYUyCEjnSE+aK4AF8E6iWq4ZmaesGqeUCCYAxZNhN5TLBDN
 MfqNaTa7ljTnexHuU+b0Y9jsWCNrsEmIgpIV21PcXoPRyULT10zb47bUh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380196415"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="380196415"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679090374"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="679090374"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:39 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 22/23] drm/i915/vm_bind: Properly build persistent map sg
 table
Date: Mon, 12 Dec 2022 15:15:26 -0800
Message-Id: <20221212231527.2384-23-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Properly build the sg table for persistent mapping which can
be partial map of the underlying object. Ensure the sg pages
are properly set for page backed regions. The dump capture
support requires this for page backed regions.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 120 +++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 7f23adcfb253..d092a86123ae 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1328,6 +1328,120 @@ intel_partial_pages(const struct i915_gtt_view *view,
 	return ERR_PTR(ret);
 }
 
+static unsigned int
+intel_copy_dma_sg(struct sg_table *src_st, struct sg_table *dst_st,
+		  u64 offset, u64 length, bool dry_run)
+{
+	struct scatterlist *dst_sg, *src_sg;
+	unsigned int i, len, nents = 0;
+
+	dst_sg = dst_st->sgl;
+	for_each_sgtable_dma_sg(src_st, src_sg, i) {
+		if (sg_dma_len(src_sg) <= offset) {
+			offset -= sg_dma_len(src_sg);
+			continue;
+		}
+
+		nents++;
+		len = min(sg_dma_len(src_sg) - offset, length);
+		if (!dry_run) {
+			sg_dma_address(dst_sg) = sg_dma_address(src_sg) + offset;
+			sg_dma_len(dst_sg) = len;
+			dst_sg = sg_next(dst_sg);
+		}
+
+		length -= len;
+		offset = 0;
+		if (!length)
+			break;
+	}
+	WARN_ON_ONCE(length);
+
+	return nents;
+}
+
+static unsigned int
+intel_copy_sg(struct sg_table *src_st, struct sg_table *dst_st,
+	      u64 offset, u64 length, bool dry_run)
+{
+	struct scatterlist *dst_sg, *src_sg;
+	unsigned int i, len, nents = 0;
+
+	dst_sg = dst_st->sgl;
+	for_each_sgtable_sg(src_st, src_sg, i) {
+		if (src_sg->length <= offset) {
+			offset -= src_sg->length;
+			continue;
+		}
+
+		nents++;
+		len = min(src_sg->length - offset, length);
+		if (!dry_run) {
+			unsigned long pfn;
+
+			pfn = page_to_pfn(sg_page(src_sg)) + offset / PAGE_SIZE;
+			sg_set_page(dst_sg, pfn_to_page(pfn), len, 0);
+			dst_sg = sg_next(dst_sg);
+		}
+
+		length -= len;
+		offset = 0;
+		if (!length)
+			break;
+	}
+	WARN_ON_ONCE(length);
+
+	return nents;
+}
+
+static noinline struct sg_table *
+intel_persistent_partial_pages(const struct i915_gtt_view *view,
+			       struct drm_i915_gem_object *obj)
+{
+	u64 offset = view->partial.offset << PAGE_SHIFT;
+	struct sg_table *st, *obj_st = obj->mm.pages;
+	u64 length = view->partial.size << PAGE_SHIFT;
+	struct scatterlist *sg;
+	unsigned int nents;
+	int ret = -ENOMEM;
+
+	st = kmalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		goto err_st_alloc;
+
+	/* Get required sg_table size */
+	nents = intel_copy_dma_sg(obj_st, st, offset, length, true);
+	if (i915_gem_object_has_struct_page(obj)) {
+		unsigned int pg_nents;
+
+		pg_nents = intel_copy_sg(obj_st, st, offset, length, true);
+		if (nents < pg_nents)
+			nents = pg_nents;
+	}
+
+	ret = sg_alloc_table(st, nents, GFP_KERNEL);
+	if (ret)
+		goto err_sg_alloc;
+
+	/* Build sg_table for specified <offset, length> section */
+	intel_copy_dma_sg(obj_st, st, offset, length, false);
+	if (i915_gem_object_has_struct_page(obj))
+		intel_copy_sg(obj_st, st, offset, length, false);
+
+	/* Mark last sg */
+	sg = st->sgl;
+	while (sg_next(sg))
+		sg = sg_next(sg);
+	sg_mark_end(sg);
+
+	return st;
+
+err_sg_alloc:
+	kfree(st);
+err_st_alloc:
+	return ERR_PTR(ret);
+}
+
 static int
 __i915_vma_get_pages(struct i915_vma *vma)
 {
@@ -1360,7 +1474,11 @@ __i915_vma_get_pages(struct i915_vma *vma)
 		break;
 
 	case I915_GTT_VIEW_PARTIAL:
-		pages = intel_partial_pages(&vma->gtt_view, vma->obj);
+		if (i915_vma_is_persistent(vma))
+			pages = intel_persistent_partial_pages(&vma->gtt_view,
+							       vma->obj);
+		else
+			pages = intel_partial_pages(&vma->gtt_view, vma->obj);
 		break;
 	}
 
-- 
2.21.0.rc0.32.g243a4c7e27

