Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105CE43FAF9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 12:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3697D6EA4C;
	Fri, 29 Oct 2021 10:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F75D6EA42;
 Fri, 29 Oct 2021 10:41:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="316839196"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="316839196"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 03:41:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="665789610"
Received: from hohiggin-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.197.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 03:41:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v3 5/8] drm/i915: Remove resv from i915_vma
Date: Fri, 29 Oct 2021 11:40:23 +0100
Message-Id: <20211029104026.3472621-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211029104026.3472621-1-matthew.auld@intel.com>
References: <20211029104026.3472621-1-matthew.auld@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

It's just an alias to vma->obj->base.resv, no need to duplicate it.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
 drivers/gpu/drm/i915/i915_vma.c                | 9 ++++-----
 drivers/gpu/drm/i915/i915_vma.h                | 6 +++---
 drivers/gpu/drm/i915/i915_vma_types.h          | 1 -
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index ea5b7b2a4d70..9f7c6ecadb90 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1001,7 +1001,7 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 		}
 
 		if (!(ev->flags & EXEC_OBJECT_WRITE)) {
-			err = dma_resv_reserve_shared(vma->resv, 1);
+			err = dma_resv_reserve_shared(vma->obj->base.resv, 1);
 			if (err)
 				return err;
 		}
@@ -2175,7 +2175,7 @@ static int eb_parse(struct i915_execbuffer *eb)
 		goto err_trampoline;
 	}
 
-	err = dma_resv_reserve_shared(shadow->resv, 1);
+	err = dma_resv_reserve_shared(shadow->obj->base.resv, 1);
 	if (err)
 		goto err_trampoline;
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 656152daabbe..2e43d9511b28 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -116,7 +116,6 @@ vma_create(struct drm_i915_gem_object *obj,
 	vma->vm = i915_vm_get(vm);
 	vma->ops = &vm->vma_ops;
 	vma->obj = obj;
-	vma->resv = obj->base.resv;
 	vma->size = obj->base.size;
 	vma->display_alignment = I915_GTT_MIN_ALIGNMENT;
 
@@ -1032,7 +1031,7 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 
 #ifdef CONFIG_LOCKDEP
-	WARN_ON(!ww && dma_resv_held(vma->resv));
+	WARN_ON(!ww && dma_resv_held(vma->obj->base.resv));
 #endif
 
 	do {
@@ -1251,19 +1250,19 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 		}
 
 		if (fence) {
-			dma_resv_add_excl_fence(vma->resv, fence);
+			dma_resv_add_excl_fence(vma->obj->base.resv, fence);
 			obj->write_domain = I915_GEM_DOMAIN_RENDER;
 			obj->read_domains = 0;
 		}
 	} else {
 		if (!(flags & __EXEC_OBJECT_NO_RESERVE)) {
-			err = dma_resv_reserve_shared(vma->resv, 1);
+			err = dma_resv_reserve_shared(vma->obj->base.resv, 1);
 			if (unlikely(err))
 				return err;
 		}
 
 		if (fence) {
-			dma_resv_add_shared_fence(vma->resv, fence);
+			dma_resv_add_shared_fence(vma->obj->base.resv, fence);
 			obj->write_domain = 0;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 312933c06017..4033aa08d5e4 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -234,16 +234,16 @@ static inline void __i915_vma_put(struct i915_vma *vma)
 	kref_put(&vma->ref, i915_vma_release);
 }
 
-#define assert_vma_held(vma) dma_resv_assert_held((vma)->resv)
+#define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
 
 static inline void i915_vma_lock(struct i915_vma *vma)
 {
-	dma_resv_lock(vma->resv, NULL);
+	dma_resv_lock(vma->obj->base.resv, NULL);
 }
 
 static inline void i915_vma_unlock(struct i915_vma *vma)
 {
-	dma_resv_unlock(vma->resv);
+	dma_resv_unlock(vma->obj->base.resv);
 }
 
 int __must_check
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 80e93bf00f2e..8a0decb19bcc 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -178,7 +178,6 @@ struct i915_vma {
 	const struct i915_vma_ops *ops;
 
 	struct drm_i915_gem_object *obj;
-	struct dma_resv *resv; /** Alias of obj->resv */
 
 	struct sg_table *pages;
 	void __iomem *iomap;
-- 
2.26.3

