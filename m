Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B772C6567
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D076ED22;
	Fri, 27 Nov 2020 12:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0036ECEE;
 Fri, 27 Nov 2020 12:11:52 +0000 (UTC)
IronPort-SDR: iuzskKT09+mOWLAN2g0+MkOv3lpeYXGFhIgA88jgVZq6uzSAITRy5YHruOecCrFe9oQ1nl4Kol
 Xuga40KmEWAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092959"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092959"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:51 -0800
IronPort-SDR: 6cOu9ZH6uaj+5lF5Awn33KEqHYu6N9PKFMmcap8xPb3cA3z6I3rfn7hqgpf9pl5BJkMcewA+Z+
 FV98e4PZpjnQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029899"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:50 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 136/162] drm/i915: create and destroy dummy vma
Date: Fri, 27 Nov 2020 12:06:52 +0000
Message-Id: <20201127120718.454037-137-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

Functions for window_blt_copy defined to create and destroy
the dummy vmas for virtual memory, which dont have any associated
objects.

These dummy vmas are used at window_blt_copy festure to associated to
set of pages and create ptes at runtime and submit it for blt copy.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 38 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h |  6 ++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 59fe82af48b2..5537950e310f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -100,6 +100,44 @@ static void __i915_vma_retire(struct i915_active *ref)
 	i915_vma_put(active_to_vma(ref));
 }
 
+struct i915_vma *
+i915_alloc_window_vma(struct drm_i915_private *i915,
+		      struct i915_address_space *vm, u64 size,
+		      u64 min_page_size)
+{
+	struct i915_vma *vma;
+
+	vma = i915_vma_alloc();
+	if (!vma)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&vma->ref);
+	mutex_init(&vma->pages_mutex);
+	vma->vm = i915_vm_get(vm);
+	vma->ops = &vm->vma_ops;
+	vma->obj = NULL;
+	vma->resv = NULL;
+	vma->size = size;
+	vma->display_alignment = I915_GTT_MIN_ALIGNMENT;
+	vma->page_sizes.sg = min_page_size;
+
+	i915_active_init(&vma->active, __i915_vma_active, __i915_vma_retire);
+	INIT_LIST_HEAD(&vma->closed_link);
+
+	GEM_BUG_ON(!IS_ALIGNED(vma->size, I915_GTT_PAGE_SIZE));
+	GEM_BUG_ON(i915_is_ggtt(vm));
+
+	return vma;
+}
+
+void i915_destroy_window_vma(struct i915_vma *vma)
+{
+	i915_active_fini(&vma->active);
+	i915_vm_put(vma->vm);
+	mutex_destroy(&vma->pages_mutex);
+	i915_vma_free(vma);
+}
+
 static struct i915_vma *
 vma_create(struct drm_i915_gem_object *obj,
 	   struct i915_address_space *vm,
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 2db4f25b8d5f..f595fe706010 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -44,6 +44,12 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
 		  struct i915_address_space *vm,
 		  const struct i915_ggtt_view *view);
 
+struct i915_vma *
+i915_alloc_window_vma(struct drm_i915_private *i915,
+		      struct i915_address_space *vm, u64 size,
+		      u64 min_page_size);
+void i915_destroy_window_vma(struct i915_vma *vma);
+
 void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 #define I915_VMA_RELEASE_MAP BIT(0)
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
