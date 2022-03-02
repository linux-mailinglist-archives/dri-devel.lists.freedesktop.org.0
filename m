Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D024CA20E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC47D10F433;
	Wed,  2 Mar 2022 10:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4110F431;
 Wed,  2 Mar 2022 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646216547; x=1677752547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPaf78/DtsjHiRnIm5AfyHpeIbk3o4QyZlI9z5tJbxQ=;
 b=JJAi68iqMbbOiQiPYWEbO4txDrCrHYOkFrBoEWnS2Milc4h81ByMIJS3
 3M5xBeR+buB4m1I80NU7ygDLrhfyTL4vG54bLmHr2MVII1WXjIlmc5rW+
 VNlyZ+BxavCA0NvrzBfKni+mE+0nJJSk+HK/+Ka64dXSVIjvWDnOnTuq1
 iXUWmTJN194vqB2cXmncJmNS5dcX8DWqdA6nLpxuzILTN0eP1f3bkh24D
 TYclRgLaszJ4n3Sh/Yx6qj2+Wm6KuVVDwZWZJ09Xl6P9ijDB1lt3GiSgV
 b1Hnuvzq8+/JDb0NPlM6nJ0GfHQvZHcDrfQnwUPyxeW2ZGUgA1zAwjOkQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="339798901"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="339798901"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 02:22:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="493494449"
Received: from ccrisan-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.224])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 02:22:25 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915: Remove the vma refcount
Date: Wed,  2 Mar 2022 11:21:59 +0100
Message-Id: <20220302102200.158637-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
References: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
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
 niranjana.vishwanathapura@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that i915_vma_parked() is taking the object lock on vma destruction,
and the only user of the vma refcount, i915_gem_object_unbind()
also takes the object lock, remove the vma refcount.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c       | 17 +++++++++++++----
 drivers/gpu/drm/i915/i915_vma.c       | 14 +++-----------
 drivers/gpu/drm/i915/i915_vma.h       | 14 --------------
 drivers/gpu/drm/i915/i915_vma_types.h |  1 -
 4 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index dd84ebabb50f..c26110abcc0b 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -151,14 +151,25 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 			break;
 		}
 
+		/*
+		 * Requiring the vm destructor to take the object lock
+		 * before destroying a vma would help us eliminate the
+		 * i915_vm_tryget() here, AND thus also the barrier stuff
+		 * at the end. That's an easy fix, but sleeping locks in
+		 * a kthread should generally be avoided.
+		 */
 		ret = -EAGAIN;
 		if (!i915_vm_tryget(vma->vm))
 			break;
 
-		/* Prevent vma being freed by i915_vma_parked as we unbind */
-		vma = __i915_vma_get(vma);
 		spin_unlock(&obj->vma.lock);
 
+		/*
+		 * Since i915_vma_parked() takes the object lock
+		 * before vma destruction, it won't race us here,
+		 * and destroy the vma from under us.
+		 */
+
 		if (vma) {
 			bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
 			ret = -EBUSY;
@@ -180,8 +191,6 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 					ret = i915_vma_unbind(vma);
 				}
 			}
-
-			__i915_vma_put(vma);
 		}
 
 		i915_vm_put(vma->vm);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 91538bc38110..6fd25b39748f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -122,7 +122,6 @@ vma_create(struct drm_i915_gem_object *obj,
 	if (vma == NULL)
 		return ERR_PTR(-ENOMEM);
 
-	kref_init(&vma->ref);
 	vma->ops = &vm->vma_ops;
 	vma->obj = obj;
 	vma->size = obj->base.size;
@@ -1628,15 +1627,6 @@ void i915_vma_reopen(struct i915_vma *vma)
 		__i915_vma_remove_closed(vma);
 }
 
-void i915_vma_release(struct kref *ref)
-{
-	struct i915_vma *vma = container_of(ref, typeof(*vma), ref);
-
-	i915_active_fini(&vma->active);
-	GEM_WARN_ON(vma->resource);
-	i915_vma_free(vma);
-}
-
 static void force_unbind(struct i915_vma *vma)
 {
 	if (!drm_mm_node_allocated(&vma->node))
@@ -1665,7 +1655,9 @@ static void release_references(struct i915_vma *vma, bool vm_ddestroy)
 	if (vm_ddestroy)
 		i915_vm_resv_put(vma->vm);
 
-	__i915_vma_put(vma);
+	i915_active_fini(&vma->active);
+	GEM_WARN_ON(vma->resource);
+	i915_vma_free(vma);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 67ae7341c7e0..6034991d89fe 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -222,20 +222,6 @@ void i915_vma_unlink_ctx(struct i915_vma *vma);
 void i915_vma_close(struct i915_vma *vma);
 void i915_vma_reopen(struct i915_vma *vma);
 
-static inline struct i915_vma *__i915_vma_get(struct i915_vma *vma)
-{
-	if (kref_get_unless_zero(&vma->ref))
-		return vma;
-
-	return NULL;
-}
-
-void i915_vma_release(struct kref *ref);
-static inline void __i915_vma_put(struct i915_vma *vma)
-{
-	kref_put(&vma->ref, i915_vma_release);
-}
-
 void i915_vma_destroy_locked(struct i915_vma *vma);
 void i915_vma_destroy(struct i915_vma *vma);
 
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index eac36be184e5..be6e028c3b57 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -211,7 +211,6 @@ struct i915_vma {
 	 * handles (but same file) for execbuf, i.e. the number of aliases
 	 * that exist in the ctx->handle_vmas LUT for this vma.
 	 */
-	struct kref ref;
 	atomic_t open_count;
 	atomic_t flags;
 	/**
-- 
2.34.1

