Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7DD4A5A3A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5648B10E8D8;
	Tue,  1 Feb 2022 10:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC9A10E8D2;
 Tue,  1 Feb 2022 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712106; x=1675248106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lafdENp5VMg2KolE8JDfQYnhZ3qZatoal2K4MpZtTas=;
 b=dvRInFZSYcav5pYHuc4LktycQ8t0HTU9ZzV721Hb1eTc//Ts69iXi66D
 7/f8xn7h6f4gecHfmGmy7DBEQqPD0SMZuqaWnT+lOJFzVFgrwoElJxs/K
 1Jg0kjYA00M05lsiIt4J69uY9XCwW63fVWNIoAaNL6UDYkwg0bPdeIyP9
 vBcrKSU8D1qqbSDBoGRUfkmduSm9Wm23hca44RSVPh9P1J28fVK4wNLfj
 8TAn+3hMwRUaIlS6d3J1ebq/1M5FTq9KAjCkIcYxu6B30WLTPjU/DN9Hm
 FncSd0EoPu2bg1W/2wCWVgfFd0JNRgCn7+IcwlroG3pNHDASNQkT4aMFA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020556"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011138"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:42 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 05/19] drm/i915/gtt: allow overriding the pt alignment
Date: Tue,  1 Feb 2022 16:11:18 +0530
Message-Id: <20220201104132.3050-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
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
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

On some platforms we have alignment restrictions when accessing LMEM
from the GTT. In the next patch few patches we need to be able to modify
the page-tables directly via the GTT itself.

Suggested-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.h   | 10 +++++++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c | 16 ++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index e6ce0be6d484..2c62411eb52c 100644
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
@@ -591,7 +599,7 @@ void free_scratch(struct i915_address_space *vm);
 
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

