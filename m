Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415DB63BABC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 08:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E257610E379;
	Tue, 29 Nov 2022 07:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9213E10E37B;
 Tue, 29 Nov 2022 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669706809; x=1701242809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ATbpzE21bUgi1CT4bnkBwjF3MKF981/2hkOwl52mfP8=;
 b=M1/LGYUb4LodUIJoJMfERcczEVoZYNvJABgdIo/8Jn3oKqmWHK75oV0v
 4HlGUgDZCAot/+IiR1IL8S0ArdOh8d3mhVanz9HOxmASZ5HsfYq2wa/nj
 8bx/fvRT8O7JtGA3aMdFLE+0BSSDn9r/n6KzBavAcF/4HsJK70/hhxR1s
 +McH07gXFX9kf3gCLO5H0JjQkoXDK6Uj4hLoGlmEiJBFymlSIYiNghr6S
 4I0H23dLAr/RNDDKSOlqIz3oF9doBJIMqHwOIIIMdX6RH9IXbfvPgCwXP
 +CW0w/zbYdydAXZX0PdaDVBtXhFMUkCz0E0gVkBZOYH1vi6QAuwuYkSaD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295418393"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295418393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674525617"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="674525617"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:47 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 21/22] drm/i915/vm_bind: Properly build persistent map sg
 table
Date: Mon, 28 Nov 2022 23:26:34 -0800
Message-Id: <20221129072635.847-22-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
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
index 1b9033865768..68a9ac77b4f2 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1298,6 +1298,120 @@ intel_partial_pages(const struct i915_gtt_view *view,
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
@@ -1330,7 +1444,11 @@ __i915_vma_get_pages(struct i915_vma *vma)
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

