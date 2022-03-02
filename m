Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B84CAFB3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 21:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8A10E22C;
	Wed,  2 Mar 2022 20:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA9310E38B;
 Wed,  2 Mar 2022 20:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646252827; x=1677788827;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K3q8zRml+UKFd50zEJLFV+JzMMvJ4PJNZMpO3zrnSEg=;
 b=HxF7b5GKOcKdax/K0lWtn0lIOdfv31hk3SvJOgFa4CYoxlPrSQ+6uuhh
 SD1rA+RkoZ+UYTJDe5g+Yof+AaLRmhi9msBc6jfcBxtF/JJduwugazA+k
 egYCIPZk7OjIFQ+49NUT4G8raDJ79uYZv0ciXny5Yw2JBqQ/PkruDd5Ci
 YzHZOtgRgpER7UA95IDYOcBviwFxoKqmSrfITR/RNZEi86nFDBEqH8xrt
 7cf7UNPgIr5kxAqrtNPNzSEtElS5t5f9puWc0IkkyykwZ43iPTOzzcRsp
 Gti59gNS1wviDWRi4hJPYMIcrbO5/4LF7weyNuTs4hDfQE/1xZUlIIbJc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253693188"
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="253693188"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 12:27:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="535529576"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 12:27:06 -0800
Date: Wed, 2 Mar 2022 12:29:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/i915/gem: Remove some unnecessary code
Message-ID: <20220302202923.GF25117@nvishwa1-DESK>
References: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
 <20220302102200.158637-4-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302102200.158637-4-thomas.hellstrom@linux.intel.com>
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

On Wed, Mar 02, 2022 at 11:22:00AM +0100, Thomas Hellström wrote:
>The test for vma should always return true, and when assigning -EBUSY
>to ret, the variable should already have that value.
>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/i915/i915_gem.c | 32 ++++++++++++++------------------
> 1 file changed, 14 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>index c26110abcc0b..9747924cc57b 100644
>--- a/drivers/gpu/drm/i915/i915_gem.c
>+++ b/drivers/gpu/drm/i915/i915_gem.c
>@@ -118,6 +118,7 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
> 			   unsigned long flags)
> {
> 	struct intel_runtime_pm *rpm = &to_i915(obj->base.dev)->runtime_pm;
>+	bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
> 	LIST_HEAD(still_in_list);
> 	intel_wakeref_t wakeref;
> 	struct i915_vma *vma;
>@@ -170,26 +171,21 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
> 		 * and destroy the vma from under us.
> 		 */
>
>-		if (vma) {
>-			bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
>-			ret = -EBUSY;
>-			if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
>-				assert_object_held(vma->obj);
>-				ret = i915_vma_unbind_async(vma, vm_trylock);
>-			}
>+		ret = -EBUSY;
>+		if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
>+			assert_object_held(vma->obj);
>+			ret = i915_vma_unbind_async(vma, vm_trylock);
>+		}
>
>-			if (ret == -EBUSY && (flags & I915_GEM_OBJECT_UNBIND_ACTIVE ||
>-					      !i915_vma_is_active(vma))) {
>-				if (vm_trylock) {
>-					if (mutex_trylock(&vma->vm->mutex)) {
>-						ret = __i915_vma_unbind(vma);
>-						mutex_unlock(&vma->vm->mutex);
>-					} else {
>-						ret = -EBUSY;
>-					}
>-				} else {
>-					ret = i915_vma_unbind(vma);
>+		if (ret == -EBUSY && (flags & I915_GEM_OBJECT_UNBIND_ACTIVE ||
>+				      !i915_vma_is_active(vma))) {
>+			if (vm_trylock) {
>+				if (mutex_trylock(&vma->vm->mutex)) {
>+					ret = __i915_vma_unbind(vma);
>+					mutex_unlock(&vma->vm->mutex);
> 				}
>+			} else {
>+				ret = i915_vma_unbind(vma);
> 			}
> 		}

Looks good to me.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
>-- 
>2.34.1
>
