Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725A5A767B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FFD10E1E1;
	Wed, 31 Aug 2022 06:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE3E10E1E1;
 Wed, 31 Aug 2022 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661926985; x=1693462985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=45NSiJE+ej6SC8m+HsoGdDY9G5mjrpbWu1qDQNwh+MU=;
 b=WegOt4IRRJMFb6GmisGm82Ae4m3iX8iMXmLErJ5JUoPQMCGOA4Dxig6l
 mOgyhXJSllClSODNyJs1gZ2kFaoEtzSwTOPgYCYAP6WwvR834oBDLnajh
 j3FmoJX730JGT/EAE5REn43EhrHSQrrf/U19ZtrGQx9GxqJs9gSkfUsDD
 TrLhqtdr7fVgO6lJx1mfF5+18cT7zw63DJIz33mk3IFBwLrzZ82sV9sQL
 YN/XpKg4NP1L4yYQ85aRiSLggkSILfFj0YrAATm8MXLxxFDVzhxERavF6
 +KXPZhWhHgwRcFxA42RsYaea3/NYxlTh5dRKwv49g6AE/9byOx02DHdvW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="275784801"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="275784801"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:23:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="641727177"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:23:04 -0700
Date: Tue, 30 Aug 2022 23:22:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [RFC PATCH v3 08/17] drm/i915/vm_bind: Add out fence support
Message-ID: <20220831062242.GE10283@nvishwa1-DESK>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-9-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220827194403.6495-9-andi.shyti@linux.intel.com>
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
Cc: Ramalingam C <ramalingampc2008@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 09:43:54PM +0200, Andi Shyti wrote:
>From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Add support for handling out fence of vm_bind call.
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  3 +
> .../drm/i915/gem/i915_gem_vm_bind_object.c    | 82 +++++++++++++++++++
> drivers/gpu/drm/i915/i915_vma.c               |  6 +-
> drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
> 4 files changed, 97 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>index ebc493b7dafc1..d65e6e4fb3972 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>@@ -18,4 +18,7 @@ int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
> 			     struct drm_file *file);
>
> void i915_gem_vm_unbind_vma_all(struct i915_address_space *vm);
>+void i915_vm_bind_signal_fence(struct i915_vma *vma,
>+			       struct dma_fence * const fence);
>+
> #endif /* __I915_GEM_VM_BIND_H */
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>index 3b45529fe8d4c..e57b9c492a7f9 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>@@ -5,6 +5,8 @@
>
> #include <linux/interval_tree_generic.h>
>
>+#include <drm/drm_syncobj.h>
>+
> #include "gem/i915_gem_vm_bind.h"
> #include "gem/i915_gem_context.h"
> #include "gt/gen8_engine_cs.h"
>@@ -109,6 +111,67 @@ void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
> 	}
> }
>
>+static int i915_vm_bind_add_fence(struct drm_file *file, struct i915_vma *vma,
>+				  u32 handle, u64 point)
>+{
>+	struct drm_syncobj *syncobj;
>+
>+	syncobj = drm_syncobj_find(file, handle);
>+	if (!syncobj) {
>+		DRM_DEBUG("Invalid syncobj handle provided\n");
>+		return -ENOENT;
>+	}
>+
>+	/*
>+	 * For timeline syncobjs we need to preallocate chains for
>+	 * later signaling.
>+	 */
>+	if (point) {
>+		vma->vm_bind_fence.chain_fence = dma_fence_chain_alloc();
>+		if (!vma->vm_bind_fence.chain_fence) {
>+			drm_syncobj_put(syncobj);
>+			return -ENOMEM;
>+		}
>+	} else {
>+		vma->vm_bind_fence.chain_fence = NULL;
>+	}
>+	vma->vm_bind_fence.syncobj = syncobj;
>+	vma->vm_bind_fence.value = point;
>+
>+	return 0;
>+}
>+
>+static void i915_vm_bind_put_fence(struct i915_vma *vma)
>+{
>+	if (!vma->vm_bind_fence.syncobj)
>+		return;
>+
>+	drm_syncobj_put(vma->vm_bind_fence.syncobj);
>+	dma_fence_chain_free(vma->vm_bind_fence.chain_fence);
>+}
>+
>+void i915_vm_bind_signal_fence(struct i915_vma *vma,
>+			       struct dma_fence * const fence)
>+{
>+	struct drm_syncobj *syncobj = vma->vm_bind_fence.syncobj;
>+
>+	if (!syncobj)
>+		return;
>+
>+	if (vma->vm_bind_fence.chain_fence) {
>+		drm_syncobj_add_point(syncobj,
>+				      vma->vm_bind_fence.chain_fence,
>+				      fence, vma->vm_bind_fence.value);
>+		/*
>+		 * The chain's ownership is transferred to the
>+		 * timeline.
>+		 */
>+		vma->vm_bind_fence.chain_fence = NULL;
>+	} else {
>+		drm_syncobj_replace_fence(syncobj, fence);
>+	}
>+}
>+
> static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
> 				  struct i915_vma *vma,
> 				  struct drm_i915_gem_vm_unbind *va)
>@@ -243,6 +306,15 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> 		goto unlock_vm;
> 	}
>
>+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
>+		ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
>+					     va->fence.value);
>+		if (ret)
>+			goto put_vma;
>+	}
>+
>+	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER;

Setting pin_flags should part of patch #4.

>+
> 	for_i915_gem_ww(&ww, ret, true) {
> retry:
> 		ret = i915_gem_object_lock(vma->obj, &ww);
>@@ -267,12 +339,22 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> 			ret = i915_gem_ww_ctx_backoff(&ww);
> 			if (!ret)
> 				goto retry;
>+

Redundent white space. remove.

> 		} else {
> 			/* Hold object reference until vm_unbind */
> 			i915_gem_object_get(vma->obj);
> 		}
> 	}
>
>+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
>+		i915_vm_bind_put_fence(vma);
>+
>+put_vma:
>+	if (ret && vma) {
>+		i915_vma_set_freed(vma);
>+		i915_vma_destroy(vma);
>+	}
>+

I think destroying vma upon error should be part of patch #4.

Niranjana

> unlock_vm:
> 	mutex_unlock(&vm->vm_bind_lock);
>
>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>index 0eb7727d62a6f..6ca37ce2b35a8 100644
>--- a/drivers/gpu/drm/i915/i915_vma.c
>+++ b/drivers/gpu/drm/i915/i915_vma.c
>@@ -1542,8 +1542,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> err_vma_res:
> 	i915_vma_resource_free(vma_res);
> err_fence:
>-	if (work)
>+	if (work) {
>+		if (i915_vma_is_persistent(vma))
>+			i915_vm_bind_signal_fence(vma, &work->base.dma);
>+
> 		dma_fence_work_commit_imm(&work->base);
>+	}
> err_rpm:
> 	if (wakeref)
> 		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>index 5483ccf0c82c7..8bf870a0f689b 100644
>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>@@ -318,6 +318,13 @@ struct i915_vma {
> 	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
> 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>
>+	/** Timeline fence for vm_bind completion notification */
>+	struct {
>+		struct drm_syncobj *syncobj;
>+		u64 value;
>+		struct dma_fence_chain *chain_fence;
>+	} vm_bind_fence;
>+
> 	/** Interval tree structures for persistent vma */
>
> 	/** @rb: node for the interval tree of vm for persistent vmas */
>-- 
>2.34.1
>
