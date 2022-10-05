Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D75F4F86
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 07:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DD710E171;
	Wed,  5 Oct 2022 05:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6A10E133;
 Wed,  5 Oct 2022 05:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664948315; x=1696484315;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mGaWEEZE0S/7w42fed7WHB3+LeeYDw0sKKMowasi5ZA=;
 b=GvWylcURBf3pE0kT/wv6iGT7CMG0J+CVM5RbB6PCNw6TtcYozv85rJKw
 xV5pKQqw005w9XV4Z5Z4MGQAPbDZuw+KVduTGv7Z3alYbF9NDyKkgWrdF
 hiosnwkPNhFP3djlOv7OPlGPEeye49t6rwDIMPyKdMfwMrOp4V7dX1dzV
 WETRJb+HnMhF+Lrk3TYQ+BH5OE8JrnkJlu3K0QxwKXapPtZzDSXsUpahj
 pPHERIVgnny6ee8xg9drlKXdH0SG9mQFlziSEREeVUnRNAomPrf4bNkPM
 r0JGBMHrzuHtP+/8VBt8p6S4XjGuzu0f8nAjT3JfzDFRZIqdr+PhgMFiH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="282803140"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="282803140"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 22:38:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="799389625"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="799389625"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 22:38:34 -0700
Date: Tue, 4 Oct 2022 22:38:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 14/16] drm/i915/vm_bind: Handle persistent vmas in execbuf3
Message-ID: <20221005053811.GB1773@nvishwa1-DESK>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-15-niranjana.vishwanathapura@intel.com>
 <f9bdd880-d14e-cca7-ab9f-53e6535b4522@intel.com>
 <20221002062842.GN22224@nvishwa1-DESK>
 <a60eec17-b46b-e367-40fa-6d85e9fc63de@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a60eec17-b46b-e367-40fa-6d85e9fc63de@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 03, 2022 at 09:36:38AM +0100, Matthew Auld wrote:
>On 02/10/2022 07:28, Niranjana Vishwanathapura wrote:
>>On Fri, Sep 30, 2022 at 10:47:48AM +0100, Matthew Auld wrote:
>>>On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
>>>>Handle persistent (VM_BIND) mappings during the request submission
>>>>in the execbuf3 path.
>>>>
>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>><niranjana.vishwanathapura@intel.com>
>>>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>---
>>>> .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 188 +++++++++++++++++-
>>>> 1 file changed, 187 insertions(+), 1 deletion(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>>>index 92af88bc8deb..1aeeff5e8540 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>>>@@ -19,6 +19,7 @@
>>>> #include "i915_gem_vm_bind.h"
>>>> #include "i915_trace.h"
>>>>+#define __EXEC3_HAS_PIN            BIT_ULL(33)
>>>> #define __EXEC3_ENGINE_PINNED        BIT_ULL(32)
>>>> #define __EXEC3_INTERNAL_FLAGS        (~0ull << 32)
>>>>@@ -42,7 +43,9 @@
>>>>  * execlist. Hence, no support for implicit sync.
>>>>  *
>>>>  * The new execbuf3 ioctl only works in VM_BIND mode and the 
>>>>VM_BIND mode only
>>>>- * works with execbuf3 ioctl for submission.
>>>>+ * works with execbuf3 ioctl for submission. All BOs mapped on 
>>>>that VM (through
>>>>+ * VM_BIND call) at the time of execbuf3 call are deemed 
>>>>required for that
>>>>+ * submission.
>>>>  *
>>>>  * The execbuf3 ioctl directly specifies the batch addresses 
>>>>instead of as
>>>>  * object handles as in execbuf2 ioctl. The execbuf3 ioctl will 
>>>>also not
>>>>@@ -58,6 +61,13 @@
>>>>  * So, a lot of code supporting execbuf2 ioctl, like 
>>>>relocations, VA evictions,
>>>>  * vma lookup table, implicit sync, vma active reference 
>>>>tracking etc., are not
>>>>  * applicable for execbuf3 ioctl.
>>>>+ *
>>>>+ * During each execbuf submission, request fence is added to 
>>>>all VM_BIND mapped
>>>>+ * objects with DMA_RESV_USAGE_BOOKKEEP. The 
>>>>DMA_RESV_USAGE_BOOKKEEP usage will
>>>>+ * prevent over sync (See enum dma_resv_usage). Note that 
>>>>DRM_I915_GEM_WAIT and
>>>>+ * DRM_I915_GEM_BUSY ioctls do not check for 
>>>>DMA_RESV_USAGE_BOOKKEEP usage and
>>>>+ * hence should not be used for end of batch check. Instead, 
>>>>the execbuf3
>>>>+ * timeline out fence should be used for end of batch check.
>>>>  */
>>>> /**
>>>>@@ -127,6 +137,23 @@ eb_find_vma(struct i915_address_space *vm, 
>>>>u64 addr)
>>>>     return i915_gem_vm_bind_lookup_vma(vm, va);
>>>> }
>>>>+static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>>>>+{
>>>>+    struct i915_vma *vma, *vn;
>>>>+
>>>>+    /**
>>>>+     * Move all unbound vmas back into vm_bind_list so that they are
>>>>+     * revalidated.
>>>>+     */
>>>>+    spin_lock(&vm->vm_rebind_lock);
>>>>+    list_for_each_entry_safe(vma, vn, &vm->vm_rebind_list, 
>>>>vm_rebind_link) {
>>>>+        list_del_init(&vma->vm_rebind_link);
>>>>+        if (!list_empty(&vma->vm_bind_link))
>>>>+            list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
>>>>+    }
>>>>+    spin_unlock(&vm->vm_rebind_lock);
>>>>+}
>>>>+
>>>> static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>>> {
>>>>     unsigned int i, current_batch = 0;
>>>>@@ -141,14 +168,121 @@ static int eb_lookup_vma_all(struct 
>>>>i915_execbuffer *eb)
>>>>         ++current_batch;
>>>>     }
>>>>+    eb_scoop_unbound_vma_all(eb->context->vm);
>>>>+
>>>>+    return 0;
>>>>+}
>>>>+
>>>>+static int eb_lock_vma_all(struct i915_execbuffer *eb)
>>>>+{
>>>>+    struct i915_address_space *vm = eb->context->vm;
>>>>+    struct i915_vma *vma;
>>>>+    int err;
>>>>+
>>>>+    err = i915_gem_object_lock(eb->context->vm->root_obj, &eb->ww);
>>>>+    if (err)
>>>>+        return err;
>>>>+
>>>>+    list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>>>+                non_priv_vm_bind_link) {
>>>>+        err = i915_gem_object_lock(vma->obj, &eb->ww);
>>>>+        if (err)
>>>>+            return err;
>>>>+    }
>>>>+
>>>>     return 0;
>>>> }
>>>>+static void eb_release_persistent_vma_all(struct i915_execbuffer *eb,
>>>>+                      bool final)
>>>>+{
>>>>+    struct i915_address_space *vm = eb->context->vm;
>>>>+    struct i915_vma *vma, *vn;
>>>>+
>>>>+    lockdep_assert_held(&vm->vm_bind_lock);
>>>>+
>>>>+    if (!(eb->args->flags & __EXEC3_HAS_PIN))
>>>>+        return;
>>>>+
>>>>+    assert_object_held(vm->root_obj);
>>>>+
>>>>+    list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link)
>>>>+        __i915_vma_unpin(vma);
>>>>+
>>>>+    eb->args->flags &= ~__EXEC3_HAS_PIN;
>>>>+    if (!final)
>>>>+        return;
>>>>+
>>>>+    list_for_each_entry_safe(vma, vn, &vm->vm_bind_list, vm_bind_link)
>>>>+        if (i915_vma_verify_bind_complete(vma))
>>>>+            list_move_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>>>+}
>>>>+
>>>> static void eb_release_vma_all(struct i915_execbuffer *eb, bool final)
>>>> {
>>>>+    eb_release_persistent_vma_all(eb, final);
>>>>     eb_unpin_engine(eb);
>>>> }
>>>>+static int eb_reserve_fence_for_persistent_vma_all(struct 
>>>>i915_execbuffer *eb)
>>>>+{
>>>>+    struct i915_address_space *vm = eb->context->vm;
>>>>+    struct i915_vma *vma;
>>>>+    int ret;
>>>>+
>>>>+    ret = dma_resv_reserve_fences(vm->root_obj->base.resv, 1);
>>>>+    if (ret)
>>>>+        return ret;
>>>>+
>>>>+    list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>>>+                non_priv_vm_bind_link) {
>>>>+        ret = dma_resv_reserve_fences(vma->obj->base.resv, 1);
>>>>+        if (ret)
>>>>+            return ret;
>>>>+    }
>>>>+
>>>>+    return 0;
>>>>+}
>>>>+
>>>>+static int eb_validate_persistent_vma_all(struct i915_execbuffer *eb)
>>>>+{
>>>>+    struct i915_address_space *vm = eb->context->vm;
>>>>+    struct i915_vma *vma, *last_pinned_vma = NULL;
>>>>+    int ret = 0;
>>>>+
>>>>+    lockdep_assert_held(&vm->vm_bind_lock);
>>>>+    assert_object_held(vm->root_obj);
>>>>+
>>>>+    ret = eb_reserve_fence_for_persistent_vma_all(eb);
>>>>+    if (ret)
>>>>+        return ret;
>>>>+
>>>>+    if (list_empty(&vm->vm_bind_list))
>>>>+        return 0;
>>>>+
>>>>+    list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>>>+        u64 pin_flags = vma->start | PIN_OFFSET_FIXED | PIN_USER;
>>>>+
>>>>+        ret = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
>>>>+        if (ret)
>>>>+            break;
>>>>+
>>>>+        last_pinned_vma = vma;
>>>>+    }
>>>>+
>>>>+    if (ret && last_pinned_vma) {
>>>>+        list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>>>+            __i915_vma_unpin(vma);
>>>>+            if (vma == last_pinned_vma)
>>>>+                break;
>>>>+        }
>>>>+    } else if (last_pinned_vma) {
>>>>+        eb->args->flags |= __EXEC3_HAS_PIN;
>>>>+    }
>>>>+
>>>>+    return ret;
>>>>+}
>>>>+
>>>> /*
>>>>  * Using two helper loops for the order of which requests / 
>>>>batches are created
>>>>  * and added the to backend. Requests are created in order from 
>>>>the parent to
>>>>@@ -161,8 +295,43 @@ static void eb_release_vma_all(struct 
>>>>i915_execbuffer *eb, bool final)
>>>> #define for_each_batch_create_order(_eb) \
>>>>     for (unsigned int i = 0; i < (_eb)->num_batches; ++i)
>>>>+static void __eb_persistent_add_shared_fence(struct 
>>>>drm_i915_gem_object *obj,
>>>>+                         struct dma_fence *fence)
>>>>+{
>>>>+    dma_resv_add_fence(obj->base.resv, fence, DMA_RESV_USAGE_BOOKKEEP);
>>>>+    obj->write_domain = 0;
>>>>+    obj->read_domains |= I915_GEM_GPU_DOMAINS;
>>>>+    obj->mm.dirty = true;
>>>>+}
>>>>+
>>>>+static void eb_persistent_add_shared_fence(struct i915_execbuffer *eb)
>>>>+{
>>>>+    struct i915_address_space *vm = eb->context->vm;
>>>>+    struct dma_fence *fence;
>>>>+    struct i915_vma *vma;
>>>>+
>>>>+    fence = eb->composite_fence ? eb->composite_fence :
>>>>+        &eb->requests[0]->fence;
>>>>+
>>>>+    __eb_persistent_add_shared_fence(vm->root_obj, fence);
>>>>+    list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>>>+                non_priv_vm_bind_link)
>>>>+        __eb_persistent_add_shared_fence(vma->obj, fence);
>>>
>>>See: 842d9346b2fd ("drm/i915: Individualize fences before adding 
>>>to dma_resv obj"). Do we not need something similar?
>>>
>>
>>I don't fully get it. Looks like in normal case, request's fences are
>>not dma_fence_array type and we reserve eb->num_batches fences and
>>we add one fence per each of eb->num_batches requests.
>>What is the use case of having dma_fence_array and this individualization
>>of fences? I just don't get it be looking at code.
>>
>>I am not sure if such scenario applies for execbuf3 path (which is
>>much leaner). Also, I am only adding the fence of the last request to be
>>executed under the assumption that all other requests would be completed
>>befor that. If that is not ture, then we need to add the fence of all
>>requests. But that is a different question here.
>
>I think it just means that we can't do add_fence(fence), where fence 
>is a "container", which AFAIK is the case for the composite_fence 
>above, where we can have multiple batches per execbuf. The concern 
>here is that this then triggers the 
>WARN_ON(dma_fence_is_container(fence)) in add_fence(). There seem to 
>be IGTs for this (multi-bb or so), but they are using execbuf2.
>

Ok, got it thanks. It is easy to add support in the code. But need to port
the IGT as well to check. Will work on that.

Regards,
Niranjana

>>
>>Niranjana
>>
>>>>+}
>>>>+
>>>>+static void eb_move_all_persistent_vma_to_active(struct 
>>>>i915_execbuffer *eb)
>>>>+{
>>>>+    /* Add fence to BOs dma-resv fence list */
>>>>+    eb_persistent_add_shared_fence(eb);
>>>>+}
>>>>+
>>>> static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>>> {
>>>>+    lockdep_assert_held(&eb->context->vm->vm_bind_lock);
>>>>+    assert_object_held(eb->context->vm->root_obj);
>>>>+
>>>>+    eb_move_all_persistent_vma_to_active(eb);
>>>>+
>>>>     /* Unconditionally flush any chipset caches (for streaming 
>>>>writes). */
>>>>     intel_gt_chipset_flush(eb->gt);
>>>>@@ -478,6 +647,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>>>     mutex_lock(&eb.context->vm->vm_bind_lock);
>>>>+lookup_vmas:
>>>>     err = eb_lookup_vma_all(&eb);
>>>>     if (err) {
>>>>         eb_release_vma_all(&eb, true);
>>>>@@ -494,6 +664,22 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>>>     /* only throttle once, even if we didn't need to throttle */
>>>>     throttle = false;
>>>>+    err = eb_lock_vma_all(&eb);
>>>>+    if (err)
>>>>+        goto err_validate;
>>>>+
>>>>+    /**
>>>>+     * No object unbinds possible once the objects are locked. So,
>>>>+     * check for any unbinds here, which needs to be scooped up.
>>>>+     */
>>>>+    if (!list_empty(&eb.context->vm->vm_rebind_list)) {
>>>>+        eb_release_vma_all(&eb, true);
>>>>+        i915_gem_ww_ctx_fini(&eb.ww);
>>>>+        goto lookup_vmas;
>>>>+    }
>>>>+
>>>>+    err = eb_validate_persistent_vma_all(&eb);
>>>>+
>>>> err_validate:
>>>>     if (err == -EDEADLK) {
>>>>         eb_release_vma_all(&eb, false);
