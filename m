Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B529646EFE5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F6B10F059;
	Thu,  9 Dec 2021 16:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595F489123;
 Thu,  9 Dec 2021 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064790; x=1670600790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbUtA5aW3wGaiPYniYGCTLc4GOkr49yscbbi241/UiM=;
 b=BzyNYYXKbWL0k8LMv8BrVZ7wo0YHOxabLFRm1Sufp0LIpLRCWXmEeu9f
 RJGCVBKvk5sVmbbt9OzED5aYk9SMpMhQDsT8YX+oiReEPMJ9r2FkVKbkJ
 8FIji3BByxQSL65jZL0wn/yDr6PXeucRkiKR55A7NzcBY05rV5PAw271z
 I3a1GY0rf2cqXytqHiYj/zXZNn+O6cmns+3bKCthOs0uhx9SYroJueJdO
 MMidhXwMWPlsilID+cjECmZCQvBWP5snGBilEww09vY+RmSdcI/SApL/d
 xYFqhDwGjRbZrgnDnGwRKAc4WByAca4t6LlME583fTdk212ObH6fyEcQr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917003"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917003"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535206"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:11 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 08/16] drm/i915/gtt: allow overriding the pt alignment
Date: Thu,  9 Dec 2021 21:15:25 +0530
Message-Id: <20211209154533.4084-9-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209154533.4084-1-ramalingam.c@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
index 01e9a98846fb..5ca5caa667b8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -199,6 +199,14 @@ void *__px_vaddr(struct drm_i915_gem_object *p);
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
@@ -586,7 +594,7 @@ void free_scratch(struct i915_address_space *vm);
 
 struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz);
 struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz);
-struct i915_page_table *alloc_pt(struct i915_address_space *vm);
+struct i915_page_table *alloc_pt(struct i915_address_space *vm, int sz);
 struct i915_page_directory *alloc_pd(struct i915_address_space *vm);
 struct i915_page_directory *__alloc_pd(int npde);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index b8238f5bc8b1..3c90aea25072 100644
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
@@ -219,17 +219,25 @@ int i915_vm_alloc_pt_stash(struct i915_address_space *vm,
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

