Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B4477617
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B81510E331;
	Thu, 16 Dec 2021 15:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97D310E2C3;
 Thu, 16 Dec 2021 15:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639669153; x=1671205153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JUlEZzy3n+HHkCKPiBekNvFYRwWew6xIaXeNoJcpdRU=;
 b=LEOAEfvKkZ/o4JQmrR6fw2gYkCvtiBvtDeHRWmXdoohGan36g0U5JLcr
 5geA2Wy5sDGH7nM6j03gtzHwkRgT4q49kIl9ZXefs14h6yYGfyv9Dit1B
 KOqAP5M91RbMFrSCD2vCb2jiAnvrid3MCwtXrU3qBiDF7qyUNf7mEhqLb
 F4PDulSGMNJ4VA9eH6n4y1FI6FkjhVwbrvFKBIjq3+NEpzln+13S34tiG
 CBVJLHaOUutpF8bAgQALqPsNMMYlprH2IwShgclMqoNJ+CGnMThJ4cOiX
 2KW6qIpg46HZXy+iU9jXv0LI9l92ueYVOJObg/+Kjbq3g4zktYYEGgrlS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="238261407"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="238261407"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:39:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="611507325"
Received: from yshchyok-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.121])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:39:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/i915/gtt: allow overriding the pt alignment
Date: Thu, 16 Dec 2021 15:38:45 +0000
Message-Id: <20211216153847.185820-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216153847.185820-1-matthew.auld@intel.com>
References: <20211216153847.185820-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
2.31.1

