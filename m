Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983464CB1A3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 22:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B40210E25C;
	Wed,  2 Mar 2022 21:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E485A10E4ED;
 Wed,  2 Mar 2022 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646258365; x=1677794365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yawzHkXCNEi4OGTe3ZX3h2CkuTgqHVGcefmuT5KID7w=;
 b=F+YLpV5jfW4i2IZDDncHmV68nIu58aCh7JyMi8ymvprGXKrEJHsjJoMe
 IXLCKJNMTDWdhfWxsUcPnWB59z63Ay7uBzY2SVjQngtRaDKSGN3EI3UqN
 rDXPPpoSroqF5Ly8DUWo+K7V1AD3F5R88I/97yV6ldnAn1kNrgN+fG5YZ
 mUm9Ve7ffOqh+yWtdhLM106cTS0kPVlNt9xHHwzqmP4/gR7dVbHk2AO4Q
 RaOphA9t4wVEktr8GDbZ7YhoF20vDpJzdRsYuGq4wX5IetU7CltSwdpU0
 w2zkk0KANFgIrBDKGfr58RmWqJg7i0ynlDkNwOAR/hr1WX1eUe0mkjALO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237024883"
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="237024883"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 13:59:24 -0800
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="641858442"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 13:59:24 -0800
Date: Wed, 2 Mar 2022 14:01:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915: Remove the vma refcount
Message-ID: <20220302220139.GH25117@nvishwa1-DESK>
References: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
 <20220302102200.158637-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302102200.158637-3-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 11:21:59AM +0100, Thomas Hellström wrote:
>Now that i915_vma_parked() is taking the object lock on vma destruction,
>and the only user of the vma refcount, i915_gem_object_unbind()
>also takes the object lock, remove the vma refcount.
>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/i915/i915_gem.c       | 17 +++++++++++++----
> drivers/gpu/drm/i915/i915_vma.c       | 14 +++-----------
> drivers/gpu/drm/i915/i915_vma.h       | 14 --------------
> drivers/gpu/drm/i915/i915_vma_types.h |  1 -
> 4 files changed, 16 insertions(+), 30 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>index dd84ebabb50f..c26110abcc0b 100644
>--- a/drivers/gpu/drm/i915/i915_gem.c
>+++ b/drivers/gpu/drm/i915/i915_gem.c
>@@ -151,14 +151,25 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
> 			break;
> 		}
>
>+		/*
>+		 * Requiring the vm destructor to take the object lock
>+		 * before destroying a vma would help us eliminate the
>+		 * i915_vm_tryget() here, AND thus also the barrier stuff
>+		 * at the end. That's an easy fix, but sleeping locks in
>+		 * a kthread should generally be avoided.
>+		 */
> 		ret = -EAGAIN;
> 		if (!i915_vm_tryget(vma->vm))
> 			break;
>
>-		/* Prevent vma being freed by i915_vma_parked as we unbind */
>-		vma = __i915_vma_get(vma);
> 		spin_unlock(&obj->vma.lock);
>
>+		/*
>+		 * Since i915_vma_parked() takes the object lock
>+		 * before vma destruction, it won't race us here,
>+		 * and destroy the vma from under us.
>+		 */
>+
> 		if (vma) {
> 			bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
> 			ret = -EBUSY;
>@@ -180,8 +191,6 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
> 					ret = i915_vma_unbind(vma);
> 				}
> 			}
>-
>-			__i915_vma_put(vma);
> 		}
>
> 		i915_vm_put(vma->vm);

One issue still left in i915_gem_object_unbind is that it temporarily removes
vmas from the obj->vma.list and adds back later as vma needs to be unbind outside
the obj->vma.lock spinlock. This is an issue for other places where we iterate
over the obj->vma.list. i915_debugfs_describe_obj is one such case (upcoming
vm_bind will be another) that iterates over this list.
What is the plan here? Do we need to take object lock while iterating over the
list?

But this just something I noticed and not related to this patch.
This patch looks good to me.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
 

>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>index 91538bc38110..6fd25b39748f 100644
>--- a/drivers/gpu/drm/i915/i915_vma.c
>+++ b/drivers/gpu/drm/i915/i915_vma.c
>@@ -122,7 +122,6 @@ vma_create(struct drm_i915_gem_object *obj,
> 	if (vma == NULL)
> 		return ERR_PTR(-ENOMEM);
>
>-	kref_init(&vma->ref);
> 	vma->ops = &vm->vma_ops;
> 	vma->obj = obj;
> 	vma->size = obj->base.size;
>@@ -1628,15 +1627,6 @@ void i915_vma_reopen(struct i915_vma *vma)
> 		__i915_vma_remove_closed(vma);
> }
>
>-void i915_vma_release(struct kref *ref)
>-{
>-	struct i915_vma *vma = container_of(ref, typeof(*vma), ref);
>-
>-	i915_active_fini(&vma->active);
>-	GEM_WARN_ON(vma->resource);
>-	i915_vma_free(vma);
>-}
>-
> static void force_unbind(struct i915_vma *vma)
> {
> 	if (!drm_mm_node_allocated(&vma->node))
>@@ -1665,7 +1655,9 @@ static void release_references(struct i915_vma *vma, bool vm_ddestroy)
> 	if (vm_ddestroy)
> 		i915_vm_resv_put(vma->vm);
>
>-	__i915_vma_put(vma);
>+	i915_active_fini(&vma->active);
>+	GEM_WARN_ON(vma->resource);
>+	i915_vma_free(vma);
> }
>
> /**
>diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>index 67ae7341c7e0..6034991d89fe 100644
>--- a/drivers/gpu/drm/i915/i915_vma.h
>+++ b/drivers/gpu/drm/i915/i915_vma.h
>@@ -222,20 +222,6 @@ void i915_vma_unlink_ctx(struct i915_vma *vma);
> void i915_vma_close(struct i915_vma *vma);
> void i915_vma_reopen(struct i915_vma *vma);
>
>-static inline struct i915_vma *__i915_vma_get(struct i915_vma *vma)
>-{
>-	if (kref_get_unless_zero(&vma->ref))
>-		return vma;
>-
>-	return NULL;
>-}
>-
>-void i915_vma_release(struct kref *ref);
>-static inline void __i915_vma_put(struct i915_vma *vma)
>-{
>-	kref_put(&vma->ref, i915_vma_release);
>-}
>-
> void i915_vma_destroy_locked(struct i915_vma *vma);
> void i915_vma_destroy(struct i915_vma *vma);
>
>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>index eac36be184e5..be6e028c3b57 100644
>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>@@ -211,7 +211,6 @@ struct i915_vma {
> 	 * handles (but same file) for execbuf, i.e. the number of aliases
> 	 * that exist in the ctx->handle_vmas LUT for this vma.
> 	 */
>-	struct kref ref;
> 	atomic_t open_count;
> 	atomic_t flags;
> 	/**
>-- 
>2.34.1
>
