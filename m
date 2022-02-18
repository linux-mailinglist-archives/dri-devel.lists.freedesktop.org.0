Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5594BBFE3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A4110E8A8;
	Fri, 18 Feb 2022 18:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC6D10E887;
 Fri, 18 Feb 2022 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210085; x=1676746085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qylx3PcVcQZ/5xYAjaCOuzD/Pb9x0ArWVZ36SE6s75w=;
 b=eXWDflC3a4YZ4cNITCViKApqPDq307LvdwsyKFYz2zBqFXvT/jspM0aH
 gw98b9MkFlvF8zllOiElWb/TE9KyKR2RGbj8xgE142S4BPIs1eu1nAt4+
 rQePWmVLT0SdTuopgNagHRFwHpeg0npftUoKprS2zBXXWu4YRrWegnP+q
 NQOoWEcbtx9hhbAlWDxp9fhurI9cZ7V7Xz4u0S29HxOv9Dgy/+aRbAS9C
 NN1Vv4pnKO2BwoDe8R5p1AQTvMIBpKa8fbh9uJ3mdbahiFmBRvLxTLxWo
 ysg5kWKyylLWdsUNBRgzcItFAj2lFSWeM9sjuPOxNbiC3G8kRyy0aSNdA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238592999"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238592999"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489642266"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:02 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/15] drm/i915/gtt: allow overriding the pt alignment
Date: Sat, 19 Feb 2022 00:17:46 +0530
Message-Id: <20220218184752.7524-10-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
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
 lucas.demarchi@intel.com, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

On some platforms we have alignment restrictions when accessing LMEM
from the GTT. In the next few patches we need to be able to modify the
page-tables directly via the GTT itself.

Suggested-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.h   | 10 +++++++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c | 16 ++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 5e038cef0d9f..9d83c2d3959c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -200,6 +200,14 @@ void *__px_vaddr(struct drm_i915_gem_object *p);
 struct i915_vm_pt_stash {
 	/* preallocated chains of page tables/directories */
 	struct i915_page_table *pt[2];
+	/*
+	 * Optionally override the alignment/size of the physical page that
+	 * contains each PT. If not set defaults back to the usual
+	 * I915_GTT_PAGE_SIZE_4K. This does not influence the other paging
+	 * structures. MUST be a power-of-two. ONLY applicable on discrete
+	 * platforms.
+	 */
+	int pt_sz;
 };
 
 struct i915_vma_ops {
@@ -595,7 +603,7 @@ void free_scratch(struct i915_address_space *vm);
 
 struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz);
 struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz);
-struct i915_page_table *alloc_pt(struct i915_address_space *vm);
+struct i915_page_table *alloc_pt(struct i915_address_space *vm, int sz);
 struct i915_page_directory *alloc_pd(struct i915_address_space *vm);
 struct i915_page_directory *__alloc_pd(int npde);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 043652dc6892..d91e2beb7517 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -12,7 +12,7 @@
 #include "gen6_ppgtt.h"
 #include "gen8_ppgtt.h"
 
-struct i915_page_table *alloc_pt(struct i915_address_space *vm)
+struct i915_page_table *alloc_pt(struct i915_address_space *vm, int sz)
 {
 	struct i915_page_table *pt;
 
@@ -20,7 +20,7 @@ struct i915_page_table *alloc_pt(struct i915_address_space *vm)
 	if (unlikely(!pt))
 		return ERR_PTR(-ENOMEM);
 
-	pt->base = vm->alloc_pt_dma(vm, I915_GTT_PAGE_SIZE_4K);
+	pt->base = vm->alloc_pt_dma(vm, sz);
 	if (IS_ERR(pt->base)) {
 		kfree(pt);
 		return ERR_PTR(-ENOMEM);
@@ -221,17 +221,25 @@ int i915_vm_alloc_pt_stash(struct i915_address_space *vm,
 			   u64 size)
 {
 	unsigned long count;
-	int shift, n;
+	int shift, n, pt_sz;
 
 	shift = vm->pd_shift;
 	if (!shift)
 		return 0;
 
+	pt_sz = stash->pt_sz;
+	if (!pt_sz)
+		pt_sz = I915_GTT_PAGE_SIZE_4K;
+	else
+		GEM_BUG_ON(!IS_DGFX(vm->i915));
+
+	GEM_BUG_ON(!is_power_of_2(pt_sz));
+
 	count = pd_count(size, shift);
 	while (count--) {
 		struct i915_page_table *pt;
 
-		pt = alloc_pt(vm);
+		pt = alloc_pt(vm, pt_sz);
 		if (IS_ERR(pt)) {
 			i915_vm_free_pt_stash(vm, stash);
 			return PTR_ERR(pt);
-- 
2.20.1

