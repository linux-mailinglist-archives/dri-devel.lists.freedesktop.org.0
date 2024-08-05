Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3A94799F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 12:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC17110E183;
	Mon,  5 Aug 2024 10:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxiTBRxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC5B10E183;
 Mon,  5 Aug 2024 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722853598; x=1754389598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uNAY0tVEcFKTilptJ249r4wrRR09B8GAal+Dv99OI8E=;
 b=hxiTBRxlh4kbIs5ckzheXblqQCFegDa9NAZ5wDDmcOs8tSZh2O7Uth3Y
 tHkByW+sQGFyN0x6QS2FbwSUL62taqb+clCSvHua9RmnFrl2ZDYyO0VF+
 1UiItsKjovZtZR4b4ayr4X5EotxwfASuWQK3BocS2ruXOdD+t1Xn7L0C1
 5fVAqu2kBg3NTSLRNhWNG5sG0X8q1wL8iWbCqjUiJ7+rReC96EALnT31b
 w4PQCqFjXX3cGd0X1tAog6cfpLa+mSHj+27P55wPSAHq8mle1Yg0Uaka7
 XjwtRdPmKyNdEhsAyENSb+UGZrBEPXZLUzubVUvJkMZnjXwCclIcSxRed g==;
X-CSE-ConnectionGUID: AL0XCxzASI+kcyR4b/Y3Sw==
X-CSE-MsgGUID: 6Z20izcdRrqihzCwoJpmZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20948820"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20948820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 03:26:38 -0700
X-CSE-ConnectionGUID: es2pxAGjTO+WxePLzK/vOg==
X-CSE-MsgGUID: lN8AgKg5Q2Wy2kc6IRzeZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="93647630"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 03:26:33 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 2/2] drm/i915/gem: Fix Virtual Memory mapping boundaries
 calculation
Date: Mon,  5 Aug 2024 11:25:54 +0100
Message-ID: <20240805102554.154464-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805102554.154464-1-andi.shyti@linux.intel.com>
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
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

Calculating the size of the mapped area as the lesser value
between the requested size and the actual size does not consider
the partial mapping offset. This can cause page fault access.

Fix the calculation of the starting and ending addresses, the
total size is now deduced from the difference between the end and
start addresses.

Additionally, the calculations have been rewritten in a clearer
and more understandable form.

Fixes: c58305af1835 ("drm/i915: Use remap_io_mapping() to prefault all PTE in a single pass")
Reported-by: Jann Horn <jannh@google.com>
Co-developed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v4.9+
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 62 +++++++++++++++++++++---
 1 file changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index ce10dd259812..35e0798d254a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -290,6 +290,48 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 	return i915_error_to_vmf_fault(err);
 }
 
+static void set_address_limits(struct vm_area_struct *area,
+			       struct i915_vma *vma,
+			       unsigned long obj_offset,
+			       resource_size_t gmadr_start,
+			       unsigned long *start_vaddr,
+			       unsigned long *end_vaddr,
+			       unsigned long *pfn)
+{
+	unsigned long vm_start, vm_end, vma_size; /* user's memory parameters */
+	long start, end; /* memory boundaries */
+
+	/*
+	 * Let's move into the ">> PAGE_SHIFT"
+	 * domain to be sure not to lose bits
+	 */
+	vm_start = area->vm_start >> PAGE_SHIFT;
+	vm_end = area->vm_end >> PAGE_SHIFT;
+	vma_size = vma->size >> PAGE_SHIFT;
+
+	/*
+	 * Calculate the memory boundaries by considering the offset
+	 * provided by the user during memory mapping and the offset
+	 * provided for the partial mapping.
+	 */
+	start = vm_start;
+	start -= obj_offset;
+	start += vma->gtt_view.partial.offset;
+	end = start + vma_size;
+
+	start = max_t(long, start, vm_start);
+	end = min_t(long, end, vm_end);
+
+	/* Let's move back into the "<< PAGE_SHIFT" domain */
+	*start_vaddr = (unsigned long)start << PAGE_SHIFT;
+	*end_vaddr = (unsigned long)end << PAGE_SHIFT;
+
+	*pfn = (gmadr_start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
+	*pfn += (*start_vaddr - area->vm_start) >> PAGE_SHIFT;
+	*pfn += obj_offset - vma->gtt_view.partial.offset;
+
+}
+
 static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 {
 #define MIN_CHUNK_PAGES (SZ_1M >> PAGE_SHIFT)
@@ -302,14 +344,18 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	bool write = area->vm_flags & VM_WRITE;
 	struct i915_gem_ww_ctx ww;
+	unsigned long obj_offset;
+	unsigned long start, end; /* memory boundaries */
 	intel_wakeref_t wakeref;
 	struct i915_vma *vma;
 	pgoff_t page_offset;
+	unsigned long pfn;
 	int srcu;
 	int ret;
 
-	/* We don't use vmf->pgoff since that has the fake offset */
+	obj_offset = area->vm_pgoff - drm_vma_node_start(&mmo->vma_node);
 	page_offset = (vmf->address - area->vm_start) >> PAGE_SHIFT;
+	page_offset += obj_offset;
 
 	trace_i915_gem_object_fault(obj, page_offset, true, write);
 
@@ -402,12 +448,16 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	if (ret)
 		goto err_unpin;
 
+	/*
+	 * Dump all the necessary parameters in this function to perform the
+	 * arithmetic calculation for the virtual address start and end and
+	 * the PFN (Page Frame Number).
+	 */
+	set_address_limits(area, vma, obj_offset, ggtt->gmadr.start,
+			   &start, &end, &pfn);
+
 	/* Finally, remap it using the new GTT offset */
-	ret = remap_io_mapping(area,
-			       area->vm_start + (vma->gtt_view.partial.offset << PAGE_SHIFT),
-			       (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT,
-			       min_t(u64, vma->size, area->vm_end - area->vm_start),
-			       &ggtt->iomap);
+	ret = remap_io_mapping(area, start, pfn, end - start, &ggtt->iomap);
 	if (ret)
 		goto err_fence;
 
-- 
2.45.2

