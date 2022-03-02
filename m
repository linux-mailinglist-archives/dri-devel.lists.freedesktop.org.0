Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DCB4C9ED1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2387510F112;
	Wed,  2 Mar 2022 08:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8432B10F110;
 Wed,  2 Mar 2022 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646208063; x=1677744063;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izXYCjBkp+KfAvxzV3A4VpsYnU4MhuiXcpOtYt+bYB4=;
 b=Dhdk23x51RAbkUa7pFW9PmtQZXSVx2/uLDxckjeQKF/t9d6P7EoPjf94
 eH6rveZLqL5IdQ3KpN3xXOxF5D8CvVL6bjuIfthn4OIFus5ps+s4xgntF
 kV80Lvg7qeJHr52uWCvyXLK9S0BQIoMrfa1rQw+gcI2LsAFO6EKhwe8Ke
 iwMocPkc0RpimsuNf3/gt0IygfYCMCPgkv8L1dft6HDUvI4r9pBF7Tin0
 gb7QpsLmXBULVsV6zyYJc7iR9+OGUSTQBJd1BKB3WUmdyzCyKPznTefRb
 A6AuZDu+xxLDG0Mm5aqPcOrHZ6UPzoqSQXN0yMA1kx44ioI0Fd5F8MZu8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253067138"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="253067138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 00:01:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="508112556"
Received: from ccrisan-mobl3.ger.corp.intel.com (HELO [10.249.254.224])
 ([10.249.254.224])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 00:01:01 -0800
Message-ID: <c5e1aed90c4055962c444499e83c49087940d159.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915: Remove the vm open count
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Wed, 02 Mar 2022 09:00:53 +0100
In-Reply-To: <20220302034543.GE25117@nvishwa1-DESK>
References: <20220222171030.690214-1-thomas.hellstrom@linux.intel.com>
 <20220222171030.690214-2-thomas.hellstrom@linux.intel.com>
 <20220302034543.GE25117@nvishwa1-DESK>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-03-01 at 19:45 -0800, Niranjana Vishwanathapura wrote:
> On Tue, Feb 22, 2022 at 06:10:30PM +0100, Thomas Hellström wrote:
> > vms are not getting properly closed. Rather than fixing that,
> > Remove the vm open count and instead rely on the vm refcount.
> > 
> > The vm open count existed solely to break the strong references the
> > vmas had on the vms. Now instead make those references weak and
> > ensure vmas are destroyed when the vm is destroyed.
> > 
> > Unfortunately if the vm destructor and the object destructor both
> > wants to destroy a vma, that may lead to a race in that the vm
> > destructor just unbinds the vma and leaves the actual vma
> > destruction
> > to the object destructor. However in order for the object
> > destructor
> > to ensure the vma is unbound it needs to grab the vm mutex. In
> > order
> > to keep the vm mutex alive until the object destructor is done with
> > it, somewhat hackishly grab a vm_resv refcount that is released
> > late
> > in the vma destruction process, when the vm mutex is no longer
> > needed.
> > 
> > Cc: <dri-devel@lists.freedesktop.org>
> > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_dpt.c      |  2 +-
> > drivers/gpu/drm/i915/gem/i915_gem_context.c   | 29 ++-----
> > .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++
> > .../gpu/drm/i915/gem/selftests/mock_context.c |  5 +-
> > drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  2 +-
> > drivers/gpu/drm/i915/gt/intel_ggtt.c          | 25 ++----
> > drivers/gpu/drm/i915/gt/intel_gtt.c           | 48 ++++++++---
> > drivers/gpu/drm/i915/gt/intel_gtt.h           | 56 ++++--------
> > drivers/gpu/drm/i915/gt/selftest_execlists.c  | 86 +++++++++-------
> > ---
> > drivers/gpu/drm/i915/i915_gem.c               |  6 +-
> > drivers/gpu/drm/i915/i915_vma.c               | 55 ++++++++----
> > drivers/gpu/drm/i915/i915_vma_resource.c      |  2 +-
> > drivers/gpu/drm/i915/i915_vma_resource.h      |  6 ++
> > drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
> > drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
> > 15 files changed, 179 insertions(+), 160 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c
> > b/drivers/gpu/drm/i915/display/intel_dpt.c
> > index c2f8f853db90..6920669bc571 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> > @@ -298,5 +298,5 @@ void intel_dpt_destroy(struct
> > i915_address_space *vm)
> > {
> >         struct i915_dpt *dpt = i915_vm_to_dpt(vm);
> > 
> > -       i915_vm_close(&dpt->vm);
> > +       i915_vm_put(&dpt->vm);
> > }
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index ebbac2ea0833..41404f043741 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1440,8 +1440,6 @@ static void set_closed_name(struct
> > i915_gem_context *ctx)
> > 
> > static void context_close(struct i915_gem_context *ctx)
> > {
> > -       struct i915_address_space *vm;
> > -
> >         /* Flush any concurrent set_engines() */
> >         mutex_lock(&ctx->engines_mutex);
> >         unpin_engines(__context_engines_static(ctx));
> > @@ -1453,19 +1451,6 @@ static void context_close(struct
> > i915_gem_context *ctx)
> > 
> >         set_closed_name(ctx);
> > 
> > -       vm = ctx->vm;
> > -       if (vm) {
> > -               /* i915_vm_close drops the final reference, which
> > is a bit too
> > -                * early and could result in surprises with
> > concurrent
> > -                * operations racing with thist ctx close. Keep a
> > full reference
> > -                * until the end.
> > -                */
> > -               i915_vm_get(vm);
> > -               i915_vm_close(vm);
> > -       }
> > -
> > -       ctx->file_priv = ERR_PTR(-EBADF);
> > -
> >         /*
> >          * The LUT uses the VMA as a backpointer to unref the
> > object,
> >          * so we need to clear the LUT before we close all the VMA
> > (inside
> > @@ -1473,6 +1458,8 @@ static void context_close(struct
> > i915_gem_context *ctx)
> >          */
> >         lut_close(ctx);
> > 
> > +       ctx->file_priv = ERR_PTR(-EBADF);
> > +
> >         spin_lock(&ctx->i915->gem.contexts.lock);
> >         list_del(&ctx->link);
> >         spin_unlock(&ctx->i915->gem.contexts.lock);
> > @@ -1571,12 +1558,8 @@ i915_gem_create_context(struct
> > drm_i915_private *i915,
> >                 }
> >                 vm = &ppgtt->vm;
> >         }
> > -       if (vm) {
> > -               ctx->vm = i915_vm_open(vm);
> > -
> > -               /* i915_vm_open() takes a reference */
> > -               i915_vm_put(vm);
> > -       }
> > +       if (vm)
> > +               ctx->vm = vm;
> > 
> >         mutex_init(&ctx->engines_mutex);
> >         if (pc->num_user_engines >= 0) {
> > @@ -1626,7 +1609,7 @@ i915_gem_create_context(struct
> > drm_i915_private *i915,
> >         free_engines(e);
> > err_vm:
> >         if (ctx->vm)
> > -               i915_vm_close(ctx->vm);
> > +               i915_vm_put(ctx->vm);
> > err_ctx:
> >         kfree(ctx);
> >         return ERR_PTR(err);
> > @@ -1810,7 +1793,7 @@ static int get_ppgtt(struct
> > drm_i915_file_private *file_priv,
> >         if (err)
> >                 return err;
> > 
> > -       i915_vm_open(vm);
> > +       i915_vm_get(vm);
> > 
> >         GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned
> > ppgtt */
> >         args->value = id;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index ae6805b37806..4a0af90546cf 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -2688,6 +2688,11 @@ eb_select_engine(struct i915_execbuffer *eb)
> >         if (err)
> >                 goto err;
> > 
> > +       if (!i915_vm_tryget(ce->vm)) {
> > +               err = -ENOENT;
> > +               goto err;
> > +       }
> > +
> >         eb->context = ce;
> >         eb->gt = ce->engine->gt;
> > 
> > @@ -2711,6 +2716,7 @@ eb_put_engine(struct i915_execbuffer *eb)
> > {
> >         struct intel_context *child;
> > 
> > +       i915_vm_put(eb->context->vm);
> >         intel_gt_pm_put(eb->gt);
> >         for_each_child(eb->context, child)
> >                 intel_context_put(child);
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > index c0a8ef368044..5675b04dfa33 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > @@ -41,8 +41,7 @@ mock_context(struct drm_i915_private *i915,
> >                 if (!ppgtt)
> >                         goto err_free;
> > 
> > -               ctx->vm = i915_vm_open(&ppgtt->vm);
> > -               i915_vm_put(&ppgtt->vm);
> > +               ctx->vm = &ppgtt->vm;
> >         }
> > 
> >         mutex_init(&ctx->engines_mutex);
> > @@ -58,7 +57,7 @@ mock_context(struct drm_i915_private *i915,
> > 
> > err_vm:
> >         if (ctx->vm)
> > -               i915_vm_close(ctx->vm);
> > +               i915_vm_put(ctx->vm);
> > err_free:
> >         kfree(ctx);
> >         return NULL;
> > diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > index d657ffd6c86a..b40c965cfae0 100644
> > --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > @@ -318,7 +318,7 @@ int gen6_ppgtt_pin(struct i915_ppgtt *base,
> > struct i915_gem_ww_ctx *ww)
> >         struct gen6_ppgtt *ppgtt = to_gen6_ppgtt(base);
> >         int err;
> > 
> > -       GEM_BUG_ON(!atomic_read(&ppgtt->base.vm.open));
> > +       GEM_BUG_ON(!kref_read(&ppgtt->base.vm.ref));
> > 
> >         /*
> >          * Workaround the limited maximum vma->pin_count and the
> > aliasing_ppgtt
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > index 536b0995b595..cb694fe8586e 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > @@ -125,7 +125,7 @@ static bool needs_idle_maps(struct
> > drm_i915_private *i915)
> > void i915_ggtt_suspend_vm(struct i915_address_space *vm)
> > {
> >         struct i915_vma *vma, *vn;
> > -       int open;
> > +       int save_skip_rewrite;
> > 
> >         drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
> > 
> > @@ -135,7 +135,8 @@ void i915_ggtt_suspend_vm(struct
> > i915_address_space *vm)
> >         mutex_lock(&vm->mutex);
> > 
> >         /* Skip rewriting PTE on VMA unbind. */
> > -       open = atomic_xchg(&vm->open, 0);
> > +       save_skip_rewrite = vm->skip_pte_rewrite;
> > +       vm->skip_pte_rewrite = true;
> > 
> >         list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link)
> > {
> >                 struct drm_i915_gem_object *obj = vma->obj;
> > @@ -153,16 +154,14 @@ void i915_ggtt_suspend_vm(struct
> > i915_address_space *vm)
> >                          */
> >                         i915_gem_object_get(obj);
> > 
> > -                       atomic_set(&vm->open, open);
> >                         mutex_unlock(&vm->mutex);
> > 
> >                         i915_gem_object_lock(obj, NULL);
> > -                       open = i915_vma_unbind(vma);
> > +                       GEM_WARN_ON(i915_vma_unbind(vma));
> >                         i915_gem_object_unlock(obj);
> > -
> > -                       GEM_WARN_ON(open);
> > -
> >                         i915_gem_object_put(obj);
> > +
> > +                       vm->skip_pte_rewrite = save_skip_rewrite;
> 
> This skip_pte_rewrite method to convey information to
> i915_vma_unbind()
> seems bit hacky to me. But the earlier vm->open setting/resetting
> here
> was also hacky anyway. So, should be Ok.
> Any thoughts on how to clean it up in future?

Hm. Agreed it's hacky. I guess the proper method is to add an argument
to i915_vma_unbind() if necessary. Will add a comment to that.

> 
> >                         goto retry;
> >                 }
> > 
> > @@ -178,7 +177,7 @@ void i915_ggtt_suspend_vm(struct
> > i915_address_space *vm)
> > 
> >         vm->clear_range(vm, 0, vm->total);
> > 
> > -       atomic_set(&vm->open, open);
> > +       vm->skip_pte_rewrite = save_skip_rewrite;
> > 
> >         mutex_unlock(&vm->mutex);
> > }
> > @@ -772,13 +771,13 @@ static void ggtt_cleanup_hw(struct i915_ggtt
> > *ggtt)
> > {
> >         struct i915_vma *vma, *vn;
> > 
> > -       atomic_set(&ggtt->vm.open, 0);
> > -
> >         flush_workqueue(ggtt->vm.i915->wq);
> >         i915_gem_drain_freed_objects(ggtt->vm.i915);
> > 
> >         mutex_lock(&ggtt->vm.mutex);
> > 
> > +       ggtt->vm.skip_pte_rewrite = true;
> > +
> >         list_for_each_entry_safe(vma, vn, &ggtt->vm.bound_list,
> > vm_link) {
> >                 struct drm_i915_gem_object *obj = vma->obj;
> >                 bool trylock;
> > @@ -1306,16 +1305,12 @@ bool i915_ggtt_resume_vm(struct
> > i915_address_space *vm)
> > {
> >         struct i915_vma *vma;
> >         bool write_domain_objs = false;
> > -       int open;
> > 
> >         drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
> > 
> >         /* First fill our portion of the GTT with scratch pages */
> >         vm->clear_range(vm, 0, vm->total);
> > 
> > -       /* Skip rewriting PTE on VMA unbind. */
> > -       open = atomic_xchg(&vm->open, 0);
> > -
> >         /* clflush objects bound into the GGTT and rebind them. */
> >         list_for_each_entry(vma, &vm->bound_list, vm_link) {
> >                 struct drm_i915_gem_object *obj = vma->obj;
> > @@ -1332,8 +1327,6 @@ bool i915_ggtt_resume_vm(struct
> > i915_address_space *vm)
> >                 }
> >         }
> > 
> > -       atomic_set(&vm->open, open);
> > -
> >         return write_domain_objs;
> > }
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > index 4363848f7411..ff402653938a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > @@ -95,32 +95,52 @@ int map_pt_dma_locked(struct i915_address_space
> > *vm, struct drm_i915_gem_object
> >         return 0;
> > }
> > 
> > -void __i915_vm_close(struct i915_address_space *vm)
> > +static void clear_vm_list(struct list_head *list)
> > {
> >         struct i915_vma *vma, *vn;
> > 
> > -       if (!atomic_dec_and_mutex_lock(&vm->open, &vm->mutex))
> > -               return;
> > -
> > -       list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link)
> > {
> > +       list_for_each_entry_safe(vma, vn, list, vm_link) {
> >                 struct drm_i915_gem_object *obj = vma->obj;
> > 
> >                 if (!kref_get_unless_zero(&obj->base.refcount)) {
> >                         /*
> >                          * Unbind the dying vma to ensure the
> > bound_list
> >                          * is completely drained. We leave the
> > destruction to
> > -                        * the object destructor.
> > +                        * the object destructor to avoid the vma
> > +                        * disappearing under it.
> >                          */
> >                         atomic_and(~I915_VMA_PIN_MASK, &vma-
> > >flags);
> >                         WARN_ON(__i915_vma_unbind(vma));
> > +
> > +                       /* Remove from the unbound list */
> > +                       list_del_init(&vma->vm_link);
> 
> Looks like it gets deleted from the unbind list during
> i915_vma_destroy.
> Why do we need to do it here?

It's mainly for the case where __i915_vma_unbind() moves it from the
bound list to the unbound list, so we will encounter it again when the
function is run for that list. Also we want to assert that the lists
are definitely clean after the clear_vm_list operations.

> 
> > +
> > +                       /*
> > +                        * Delay the vm and vm mutex freeing until
> > the
> > +                        * object is done with destruction.
> > +                        */
> > +                       i915_vm_resv_get(vma->vm);
> > +                       vma->vm_ddestroy = true;
> > +
> 
> I am wondering if we really need this vm_ddestroy mechanism.
> Can we call i915_gem_object_put() after i915_vm_put() in
> i915_vma_parked?
> Are there other call flows that can cause this?

Anytime a gem_object_put() races with a vm_put(). (There is an igt
called vm_close_race or something similar). I can't see how we can get
around this.

> 
> >                         continue;
> > +               } else {
> > +                       i915_vma_destroy_locked(vma);
> > +                       i915_gem_object_put(obj);
> >                 }
> > 
> > -               /* Keep the obj (and hence the vma) alive as _we_
> > destroy it */
> > -               i915_vma_destroy_locked(vma);
> > -               i915_gem_object_put(obj);
> 
> We don't need to shove it under the else as the 'if' statement has a
> 'continue'
> at the end. Checkpatch suggests that if there were a 'return' at the
> end of 'if'
> statement (not sure about 'continue').

Indeed. Will either skip the continue or the else.

> 
> >         }
> > +}
> > +
> > +static void __i915_vm_close(struct i915_address_space *vm)
> > +{
> > +       mutex_lock(&vm->mutex);
> > +
> > +       clear_vm_list(&vm->bound_list);
> > +       clear_vm_list(&vm->unbound_list);
> > +
> > +       /* Check for must-fix unanticipated side-effects */
> >         GEM_BUG_ON(!list_empty(&vm->bound_list));
> > +       GEM_BUG_ON(!list_empty(&vm->unbound_list));
> > 
> >         mutex_unlock(&vm->mutex);
> > }
> > @@ -142,7 +162,6 @@ int i915_vm_lock_objects(struct
> > i915_address_space *vm,
> > void i915_address_space_fini(struct i915_address_space *vm)
> > {
> >         drm_mm_takedown(&vm->mm);
> > -       mutex_destroy(&vm->mutex);
> > }
> > 
> > /**
> > @@ -150,7 +169,8 @@ void i915_address_space_fini(struct
> > i915_address_space *vm)
> >  * @kref: Pointer to the &i915_address_space.resv_ref member.
> >  *
> >  * This function is called when the last lock sharer no longer
> > shares the
> > - * &i915_address_space._resv lock.
> > + * &i915_address_space._resv lock, and also if we raced when
> > + * destroying a vma by the vma destruction
> >  */
> > void i915_vm_resv_release(struct kref *kref)
> > {
> > @@ -158,6 +178,8 @@ void i915_vm_resv_release(struct kref *kref)
> >                 container_of(kref, typeof(*vm), resv_ref);
> > 
> >         dma_resv_fini(&vm->_resv);
> > +       mutex_destroy(&vm->mutex);
> > +
> >         kfree(vm);
> > }
> > 
> > @@ -166,6 +188,8 @@ static void __i915_vm_release(struct
> > work_struct *work)
> >         struct i915_address_space *vm =
> >                 container_of(work, struct i915_address_space,
> > release_work);
> > 
> > +       __i915_vm_close(vm);
> > +
> >         /* Synchronize async unbinds. */
> >         i915_vma_resource_bind_dep_sync_all(vm);
> > 
> > @@ -199,7 +223,6 @@ void i915_address_space_init(struct
> > i915_address_space *vm, int subclass)
> > 
> >         vm->pending_unbind = RB_ROOT_CACHED;
> >         INIT_WORK(&vm->release_work, __i915_vm_release);
> > -       atomic_set(&vm->open, 1);
> > 
> >         /*
> >          * The vm->mutex must be reclaim safe (for use in the
> > shrinker).
> > @@ -243,6 +266,7 @@ void i915_address_space_init(struct
> > i915_address_space *vm, int subclass)
> >         vm->mm.head_node.color = I915_COLOR_UNEVICTABLE;
> > 
> >         INIT_LIST_HEAD(&vm->bound_list);
> > +       INIT_LIST_HEAD(&vm->unbound_list);
> > }
> > 
> > void *__px_vaddr(struct drm_i915_gem_object *p)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > index 9d83c2d3959c..4529b5e9f6e6 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > @@ -240,15 +240,6 @@ struct i915_address_space {
> > 
> >         unsigned int bind_async_flags;
> > 
> > -       /*
> > -        * Each active user context has its own address space (in
> > full-ppgtt).
> > -        * Since the vm may be shared between multiple contexts, we
> > count how
> > -        * many contexts keep us "open". Once open hits zero, we
> > are closed
> > -        * and do not allow any new attachments, and proceed to
> > shutdown our
> > -        * vma and page directories.
> > -        */
> > -       atomic_t open;
> > -
> >         struct mutex mutex; /* protects vma and our lists */
> > 
> >         struct kref resv_ref; /* kref to keep the reservation lock
> > alive. */
> > @@ -263,6 +254,11 @@ struct i915_address_space {
> >          */
> >         struct list_head bound_list;
> > 
> > +       /**
> > +        * List of vmas not yet bound or evicted.
> > +        */
> > +       struct list_head unbound_list;
> > +
> >         /* Global GTT */
> >         bool is_ggtt:1;
> > 
> > @@ -272,6 +268,9 @@ struct i915_address_space {
> >         /* Some systems support read-only mappings for GGTT and/or
> > PPGTT */
> >         bool has_read_only:1;
> > 
> > +       /* Skip pte rewrite on unbind for suspend. Protected by
> > @mutex */
> > +       bool skip_pte_rewrite:1;
> > +
> >         u8 top;
> >         u8 pd_shift;
> >         u8 scratch_order;
> > @@ -446,6 +445,17 @@ i915_vm_get(struct i915_address_space *vm)
> >         return vm;
> > }
> > 
> > +static inline struct i915_address_space *
> > +i915_vm_tryget(struct i915_address_space *vm)
> > +{
> > +       return kref_get_unless_zero(&vm->ref) ? vm : NULL;
> > +}
> > +
> > +static inline void assert_vm_alive(struct i915_address_space *vm)
> > +{
> > +       GEM_BUG_ON(!kref_read(&vm->ref));
> > +}
> > +
> > /**
> >  * i915_vm_resv_get - Obtain a reference on the vm's reservation
> > lock
> >  * @vm: The vm whose reservation lock we want to share.
> > @@ -476,34 +486,6 @@ static inline void i915_vm_resv_put(struct
> > i915_address_space *vm)
> >         kref_put(&vm->resv_ref, i915_vm_resv_release);
> > }
> > 
> > -static inline struct i915_address_space *
> > -i915_vm_open(struct i915_address_space *vm)
> > -{
> > -       GEM_BUG_ON(!atomic_read(&vm->open));
> > -       atomic_inc(&vm->open);
> > -       return i915_vm_get(vm);
> > -}
> > -
> > -static inline bool
> > -i915_vm_tryopen(struct i915_address_space *vm)
> > -{
> > -       if (atomic_add_unless(&vm->open, 1, 0))
> > -               return i915_vm_get(vm);
> > -
> > -       return false;
> > -}
> > -
> > -void __i915_vm_close(struct i915_address_space *vm);
> > -
> > -static inline void
> > -i915_vm_close(struct i915_address_space *vm)
> > -{
> > -       GEM_BUG_ON(!atomic_read(&vm->open));
> > -       __i915_vm_close(vm);
> > -
> > -       i915_vm_put(vm);
> > -}
> > -
> > void i915_address_space_init(struct i915_address_space *vm, int
> > subclass);
> > void i915_address_space_fini(struct i915_address_space *vm);
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > index e10da897e07a..401f71973238 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > @@ -1735,15 +1735,9 @@ static int live_preempt(void *arg)
> >         enum intel_engine_id id;
> >         int err = -ENOMEM;
> > 
> > -       if (igt_spinner_init(&spin_hi, gt))
> > -               return -ENOMEM;
> > -
> > -       if (igt_spinner_init(&spin_lo, gt))
> > -               goto err_spin_hi;
> > -
> >         ctx_hi = kernel_context(gt->i915, NULL);
> >         if (!ctx_hi)
> > -               goto err_spin_lo;
> > +               return -ENOMEM;
> >         ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
> > 
> >         ctx_lo = kernel_context(gt->i915, NULL);
> > @@ -1751,6 +1745,12 @@ static int live_preempt(void *arg)
> >                 goto err_ctx_hi;
> >         ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
> > 
> > +       if (igt_spinner_init(&spin_hi, gt))
> > +               goto err_ctx_lo;
> > +
> > +       if (igt_spinner_init(&spin_lo, gt))
> > +               goto err_spin_hi;
> > +
> >         for_each_engine(engine, gt, id) {
> >                 struct igt_live_test t;
> >                 struct i915_request *rq;
> > @@ -1760,14 +1760,14 @@ static int live_preempt(void *arg)
> > 
> >                 if (igt_live_test_begin(&t, gt->i915, __func__,
> > engine->name)) {
> >                         err = -EIO;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 rq = spinner_create_request(&spin_lo, ctx_lo,
> > engine,
> >                                             MI_ARB_CHECK);
> >                 if (IS_ERR(rq)) {
> >                         err = PTR_ERR(rq);
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 i915_request_add(rq);
> > @@ -1776,7 +1776,7 @@ static int live_preempt(void *arg)
> >                         GEM_TRACE_DUMP();
> >                         intel_gt_set_wedged(gt);
> >                         err = -EIO;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 rq = spinner_create_request(&spin_hi, ctx_hi,
> > engine,
> > @@ -1784,7 +1784,7 @@ static int live_preempt(void *arg)
> >                 if (IS_ERR(rq)) {
> >                         igt_spinner_end(&spin_lo);
> >                         err = PTR_ERR(rq);
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 i915_request_add(rq);
> > @@ -1793,7 +1793,7 @@ static int live_preempt(void *arg)
> >                         GEM_TRACE_DUMP();
> >                         intel_gt_set_wedged(gt);
> >                         err = -EIO;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 igt_spinner_end(&spin_hi);
> > @@ -1801,19 +1801,19 @@ static int live_preempt(void *arg)
> > 
> >                 if (igt_live_test_end(&t)) {
> >                         err = -EIO;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> >         }
> > 
> >         err = 0;
> > -err_ctx_lo:
> > -       kernel_context_close(ctx_lo);
> > -err_ctx_hi:
> > -       kernel_context_close(ctx_hi);
> > err_spin_lo:
> >         igt_spinner_fini(&spin_lo);
> > err_spin_hi:
> >         igt_spinner_fini(&spin_hi);
> > +err_ctx_lo:
> > +       kernel_context_close(ctx_lo);
> > +err_ctx_hi:
> > +       kernel_context_close(ctx_hi);
> >         return err;
> > }
> > 
> > @@ -1827,20 +1827,20 @@ static int live_late_preempt(void *arg)
> >         enum intel_engine_id id;
> >         int err = -ENOMEM;
> > 
> > -       if (igt_spinner_init(&spin_hi, gt))
> > -               return -ENOMEM;
> > -
> > -       if (igt_spinner_init(&spin_lo, gt))
> > -               goto err_spin_hi;
> > -
> >         ctx_hi = kernel_context(gt->i915, NULL);
> >         if (!ctx_hi)
> > -               goto err_spin_lo;
> > +               return -ENOMEM;
> > 
> >         ctx_lo = kernel_context(gt->i915, NULL);
> >         if (!ctx_lo)
> >                 goto err_ctx_hi;
> > 
> > +       if (igt_spinner_init(&spin_hi, gt))
> > +               goto err_ctx_lo;
> > +
> > +       if (igt_spinner_init(&spin_lo, gt))
> > +               goto err_spin_hi;
> > +
> >         /* Make sure ctx_lo stays before ctx_hi until we trigger
> > preemption. */
> >         ctx_lo->sched.priority = 1;
> > 
> > @@ -1853,14 +1853,14 @@ static int live_late_preempt(void *arg)
> > 
> >                 if (igt_live_test_begin(&t, gt->i915, __func__,
> > engine->name)) {
> >                         err = -EIO;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 rq = spinner_create_request(&spin_lo, ctx_lo,
> > engine,
> >                                             MI_ARB_CHECK);
> >                 if (IS_ERR(rq)) {
> >                         err = PTR_ERR(rq);
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 i915_request_add(rq);
> > @@ -1874,7 +1874,7 @@ static int live_late_preempt(void *arg)
> >                 if (IS_ERR(rq)) {
> >                         igt_spinner_end(&spin_lo);
> >                         err = PTR_ERR(rq);
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 i915_request_add(rq);
> > @@ -1897,19 +1897,19 @@ static int live_late_preempt(void *arg)
> > 
> >                 if (igt_live_test_end(&t)) {
> >                         err = -EIO;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> >         }
> > 
> >         err = 0;
> > -err_ctx_lo:
> > -       kernel_context_close(ctx_lo);
> > -err_ctx_hi:
> > -       kernel_context_close(ctx_hi);
> > err_spin_lo:
> >         igt_spinner_fini(&spin_lo);
> > err_spin_hi:
> >         igt_spinner_fini(&spin_hi);
> > +err_ctx_lo:
> > +       kernel_context_close(ctx_lo);
> > +err_ctx_hi:
> > +       kernel_context_close(ctx_hi);
> >         return err;
> > 
> > err_wedged:
> > @@ -1917,7 +1917,7 @@ static int live_late_preempt(void *arg)
> >         igt_spinner_end(&spin_lo);
> >         intel_gt_set_wedged(gt);
> >         err = -EIO;
> > -       goto err_ctx_lo;
> > +       goto err_spin_lo;
> > }
> > 
> > struct preempt_client {
> > @@ -3381,12 +3381,9 @@ static int live_preempt_timeout(void *arg)
> >         if (!intel_has_reset_engine(gt))
> >                 return 0;
> > 
> > -       if (igt_spinner_init(&spin_lo, gt))
> > -               return -ENOMEM;
> > -
> >         ctx_hi = kernel_context(gt->i915, NULL);
> >         if (!ctx_hi)
> > -               goto err_spin_lo;
> > +               return -ENOMEM;
> >         ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
> > 
> >         ctx_lo = kernel_context(gt->i915, NULL);
> > @@ -3394,6 +3391,9 @@ static int live_preempt_timeout(void *arg)
> >                 goto err_ctx_hi;
> >         ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
> > 
> > +       if (igt_spinner_init(&spin_lo, gt))
> > +               goto err_ctx_lo;
> > +
> >         for_each_engine(engine, gt, id) {
> >                 unsigned long saved_timeout;
> >                 struct i915_request *rq;
> > @@ -3405,21 +3405,21 @@ static int live_preempt_timeout(void *arg)
> >                                             MI_NOOP); /* preemption
> > disabled */
> >                 if (IS_ERR(rq)) {
> >                         err = PTR_ERR(rq);
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 i915_request_add(rq);
> >                 if (!igt_wait_for_spinner(&spin_lo, rq)) {
> >                         intel_gt_set_wedged(gt);
> >                         err = -EIO;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 rq = igt_request_alloc(ctx_hi, engine);
> >                 if (IS_ERR(rq)) {
> >                         igt_spinner_end(&spin_lo);
> >                         err = PTR_ERR(rq);
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 /* Flush the previous CS ack before changing
> > timeouts */
> > @@ -3439,7 +3439,7 @@ static int live_preempt_timeout(void *arg)
> >                         intel_gt_set_wedged(gt);
> >                         i915_request_put(rq);
> >                         err = -ETIME;
> > -                       goto err_ctx_lo;
> > +                       goto err_spin_lo;
> >                 }
> > 
> >                 igt_spinner_end(&spin_lo);
> > @@ -3447,12 +3447,12 @@ static int live_preempt_timeout(void *arg)
> >         }
> > 
> >         err = 0;
> > +err_spin_lo:
> > +       igt_spinner_fini(&spin_lo);
> > err_ctx_lo:
> >         kernel_context_close(ctx_lo);
> > err_ctx_hi:
> >         kernel_context_close(ctx_hi);
> > -err_spin_lo:
> > -       igt_spinner_fini(&spin_lo);
> >         return err;
> > }
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_gem.c
> > b/drivers/gpu/drm/i915/i915_gem.c
> > index bb65563296b5..9d5a95dc58e1 100644
> > --- a/drivers/gpu/drm/i915/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/i915_gem.c
> > @@ -138,8 +138,6 @@ int i915_gem_object_unbind(struct
> > drm_i915_gem_object *obj,
> >         while (!ret && (vma = list_first_entry_or_null(&obj-
> > >vma.list,
> >                                                        struct
> > i915_vma,
> >                                                        obj_link)))
> > {
> > -               struct i915_address_space *vm = vma->vm;
> > -
> >                 list_move_tail(&vma->obj_link, &still_in_list);
> >                 if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
> >                         continue;
> > @@ -150,7 +148,7 @@ int i915_gem_object_unbind(struct
> > drm_i915_gem_object *obj,
> >                 }
> > 
> >                 ret = -EAGAIN;
> > -               if (!i915_vm_tryopen(vm))
> > +               if (!i915_vm_tryget(vma->vm))
> >                         break;
> > 
> >                 /* Prevent vma being freed by i915_vma_parked as we
> > unbind */
> > @@ -182,7 +180,7 @@ int i915_gem_object_unbind(struct
> > drm_i915_gem_object *obj,
> >                         __i915_vma_put(vma);
> >                 }
> > 
> > -               i915_vm_close(vm);
> > +               i915_vm_put(vma->vm);
> >                 spin_lock(&obj->vma.lock);
> >         }
> >         list_splice_init(&still_in_list, &obj->vma.list);
> > diff --git a/drivers/gpu/drm/i915/i915_vma.c
> > b/drivers/gpu/drm/i915/i915_vma.c
> > index 9c1582a473c6..f67186d0df31 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > @@ -46,7 +46,7 @@ static inline void assert_vma_held_evict(const
> > struct i915_vma *vma)
> >          * This is the only exception to the requirement of the
> > object lock
> >          * being held.
> >          */
> > -       if (atomic_read(&vma->vm->open))
> > +       if (kref_read(&vma->vm->ref))
> >                 assert_object_held_shared(vma->obj);
> > }
> > 
> > @@ -112,6 +112,7 @@ vma_create(struct drm_i915_gem_object *obj,
> >         struct i915_vma *pos = ERR_PTR(-E2BIG);
> >         struct i915_vma *vma;
> >         struct rb_node *rb, **p;
> > +       int err;
> > 
> >         /* The aliasing_ppgtt should never be used directly! */
> >         GEM_BUG_ON(vm == &vm->gt->ggtt->alias->vm);
> > @@ -121,7 +122,6 @@ vma_create(struct drm_i915_gem_object *obj,
> >                 return ERR_PTR(-ENOMEM);
> > 
> >         kref_init(&vma->ref);
> > -       vma->vm = i915_vm_get(vm);
> >         vma->ops = &vm->vma_ops;
> >         vma->obj = obj;
> >         vma->size = obj->base.size;
> > @@ -137,6 +137,8 @@ vma_create(struct drm_i915_gem_object *obj,
> >         }
> > 
> >         INIT_LIST_HEAD(&vma->closed_link);
> > +       INIT_LIST_HEAD(&vma->obj_link);
> > +       RB_CLEAR_NODE(&vma->obj_node);
> > 
> >         if (view && view->type != I915_GGTT_VIEW_NORMAL) {
> >                 vma->ggtt_view = *view;
> > @@ -162,8 +164,16 @@ vma_create(struct drm_i915_gem_object *obj,
> > 
> >         GEM_BUG_ON(!IS_ALIGNED(vma->size, I915_GTT_PAGE_SIZE));
> > 
> > -       spin_lock(&obj->vma.lock);
> > +       err = mutex_lock_interruptible(&vm->mutex);
> > +       if (err) {
> > +               pos = ERR_PTR(err);
> > +               goto err_vma;
> > +       }
> > 
> > +       vma->vm = vm;
> > +       list_add_tail(&vma->vm_link, &vm->unbound_list);
> > +
> > +       spin_lock(&obj->vma.lock);
> >         if (i915_is_ggtt(vm)) {
> >                 if (unlikely(overflows_type(vma->size, u32)))
> >                         goto err_unlock;
> > @@ -221,13 +231,15 @@ vma_create(struct drm_i915_gem_object *obj,
> >                 list_add_tail(&vma->obj_link, &obj->vma.list);
> > 
> >         spin_unlock(&obj->vma.lock);
> > +       mutex_unlock(&vm->mutex);
> > 
> >         return vma;
> > 
> > err_unlock:
> >         spin_unlock(&obj->vma.lock);
> > +       list_del_init(&vma->vm_link);
> > +       mutex_unlock(&vm->mutex);
> > err_vma:
> > -       i915_vm_put(vm);
> >         i915_vma_free(vma);
> >         return pos;
> > }
> > @@ -278,7 +290,7 @@ i915_vma_instance(struct drm_i915_gem_object
> > *obj,
> >         struct i915_vma *vma;
> > 
> >         GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
> > -       GEM_BUG_ON(!atomic_read(&vm->open));
> > +       GEM_BUG_ON(!kref_read(&vm->ref));
> > 
> >         spin_lock(&obj->vma.lock);
> >         vma = i915_vma_lookup(obj, vm, view);
> > @@ -321,7 +333,6 @@ static void __vma_release(struct dma_fence_work
> > *work)
> >                 i915_gem_object_put(vw->pinned);
> > 
> >         i915_vm_free_pt_stash(vw->vm, &vw->stash);
> > -       i915_vm_put(vw->vm);
> >         if (vw->vma_res)
> >                 i915_vma_resource_put(vw->vma_res);
> > }
> > @@ -837,7 +848,7 @@ i915_vma_insert(struct i915_vma *vma, struct
> > i915_gem_ww_ctx *ww,
> >         GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> >         GEM_BUG_ON(!i915_gem_valid_gtt_space(vma, color));
> > 
> > -       list_add_tail(&vma->vm_link, &vma->vm->bound_list);
> > +       list_move_tail(&vma->vm_link, &vma->vm->bound_list);
> > 
> >         return 0;
> > }
> > @@ -853,7 +864,7 @@ i915_vma_detach(struct i915_vma *vma)
> >          * vma, we can drop its hold on the backing storage and
> > allow
> >          * it to be reaped by the shrinker.
> >          */
> > -       list_del(&vma->vm_link);
> > +       list_move_tail(&vma->vm_link, &vma->vm->unbound_list);
> > }
> > 
> > static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
> > @@ -1314,8 +1325,7 @@ int i915_vma_pin_ww(struct i915_vma *vma,
> > struct i915_gem_ww_ctx *ww,
> >                         goto err_rpm;
> >                 }
> > 
> > -               work->vm = i915_vm_get(vma->vm);
> > -
> > +               work->vm = vma->vm;
> >                 dma_fence_work_chain(&work->base, moving);
> > 
> >                 /* Allocate enough page directories to used PTE */
> > @@ -1563,7 +1573,6 @@ void i915_vma_release(struct kref *ref)
> > {
> >         struct i915_vma *vma = container_of(ref, typeof(*vma),
> > ref);
> > 
> > -       i915_vm_put(vma->vm);
> >         i915_active_fini(&vma->active);
> >         GEM_WARN_ON(vma->resource);
> >         i915_vma_free(vma);
> > @@ -1579,7 +1588,7 @@ static void force_unbind(struct i915_vma
> > *vma)
> >         GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
> > }
> > 
> > -static void release_references(struct i915_vma *vma)
> > +static void release_references(struct i915_vma *vma, bool
> > vm_ddestroy)
> > {
> >         struct drm_i915_gem_object *obj = vma->obj;
> > 
> > @@ -1589,10 +1598,14 @@ static void release_references(struct
> > i915_vma *vma)
> >         list_del(&vma->obj_link);
> >         if (!RB_EMPTY_NODE(&vma->obj_node))
> >                 rb_erase(&vma->obj_node, &obj->vma.tree);
> > +
> >         spin_unlock(&obj->vma.lock);
> > 
> >         __i915_vma_remove_closed(vma);
> > 
> > +       if (vm_ddestroy)
> > +               i915_vm_resv_put(vma->vm);
> > +
> >         __i915_vma_put(vma);
> > }
> > 
> > @@ -1626,15 +1639,21 @@ void i915_vma_destroy_locked(struct
> > i915_vma *vma)
> >         lockdep_assert_held(&vma->vm->mutex);
> > 
> >         force_unbind(vma);
> > -       release_references(vma);
> > +       list_del_init(&vma->vm_link);
> > +       release_references(vma, false);
> > }
> > 
> > void i915_vma_destroy(struct i915_vma *vma)
> > {
> > +       bool vm_ddestroy;
> > +
> >         mutex_lock(&vma->vm->mutex);
> >         force_unbind(vma);
> > +       list_del_init(&vma->vm_link);
> > +       vm_ddestroy = vma->vm_ddestroy;
> > +       vma->vm_ddestroy = false;
> >         mutex_unlock(&vma->vm->mutex);
> > -       release_references(vma);
> > +       release_references(vma, vm_ddestroy);
> > }
> > 
> > void i915_vma_parked(struct intel_gt *gt)
> > @@ -1652,7 +1671,7 @@ void i915_vma_parked(struct intel_gt *gt)
> >                 if (!kref_get_unless_zero(&obj->base.refcount))
> >                         continue;
> > 
> > -               if (!i915_vm_tryopen(vm)) {
> > +               if (!i915_vm_tryget(vm)) {
> >                         i915_gem_object_put(obj);
> >                         continue;
> >                 }
> > @@ -1678,7 +1697,7 @@ void i915_vma_parked(struct intel_gt *gt)
> >                 }
> > 
> >                 i915_gem_object_put(obj);
> > -               i915_vm_close(vm);
> > +               i915_vm_put(vm);
> >         }
> > }
> > 
> > @@ -1829,7 +1848,9 @@ struct dma_fence *__i915_vma_evict(struct
> > i915_vma *vma, bool async)
> > 
> >         /* If vm is not open, unbind is a nop. */
> >         vma_res->needs_wakeref = i915_vma_is_bound(vma,
> > I915_VMA_GLOBAL_BIND) &&
> > -               atomic_read(&vma->vm->open);
> > +               kref_read(&vma->vm->ref);
> > +       vma_res->skip_pte_rewrite = !kref_read(&vma->vm->ref) ||
> > +               vma->vm->skip_pte_rewrite;
> 
> So, the idea here page table entries gets cleared during VM release
> (which is under way),
> so we don't have to do it for this vma here?
> 
> Niranjana
> 
> >         trace_i915_vma_unbind(vma);
> > 
> >         unbind_fence = i915_vma_resource_unbind(vma_res);
> > diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c
> > b/drivers/gpu/drm/i915/i915_vma_resource.c
> > index 57ae92ba8af1..27c55027387a 100644
> > --- a/drivers/gpu/drm/i915/i915_vma_resource.c
> > +++ b/drivers/gpu/drm/i915/i915_vma_resource.c
> > @@ -178,7 +178,7 @@ static void
> > i915_vma_resource_unbind_work(struct work_struct *work)
> >         bool lockdep_cookie;
> > 
> >         lockdep_cookie = dma_fence_begin_signalling();
> > -       if (likely(atomic_read(&vm->open)))
> > +       if (likely(!vma_res->skip_pte_rewrite))
> >                 vma_res->ops->unbind_vma(vm, vma_res);
> > 
> >         dma_fence_end_signalling(lockdep_cookie);
> > diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h
> > b/drivers/gpu/drm/i915/i915_vma_resource.h
> > index 25913913baa6..5d8427caa2ba 100644
> > --- a/drivers/gpu/drm/i915/i915_vma_resource.h
> > +++ b/drivers/gpu/drm/i915/i915_vma_resource.h
> > @@ -62,6 +62,11 @@ struct i915_page_sizes {
> >  * deferred to a work item awaiting unsignaled fences. This is a
> > hack.
> >  * (dma_fence_work uses a fence flag for this, but this seems
> > slightly
> >  * cleaner).
> > + * @needs_wakeref: Whether a wakeref is needed during unbind.
> > Since we can't
> > + * take a wakeref in the dma-fence signalling critical path, it
> > needs to be
> > + * taken when the unbind is scheduled.
> > + * @skip_pte_rewrite: During ggtt suspend and vm takedown pte
> > rewriting
> > + * needs to be skipped for unbind.
> >  *
> >  * The lifetime of a struct i915_vma_resource is from a binding
> > request to
> >  * the actual possible asynchronous unbind has completed.
> > @@ -113,6 +118,7 @@ struct i915_vma_resource {
> >         bool allocated:1;
> >         bool immediate_unbind:1;
> >         bool needs_wakeref:1;
> > +       bool skip_pte_rewrite:1;
> > };
> > 
> > bool i915_vma_resource_hold(struct i915_vma_resource *vma_res,
> > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
> > b/drivers/gpu/drm/i915/i915_vma_types.h
> > index 88370dadca82..eac36be184e5 100644
> > --- a/drivers/gpu/drm/i915/i915_vma_types.h
> > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> > @@ -271,6 +271,13 @@ struct i915_vma {
> > #define I915_VMA_PAGES_ACTIVE (BIT(24) | 1)
> >         atomic_t pages_count; /* number of active binds to the
> > pages */
> > 
> > +       /**
> > +        * Whether we hold a reference on the vm dma_resv lock to
> > temporarily
> > +        * block vm freeing until the vma is destroyed.
> > +        * Protected by the vm mutex.
> > +        */
> > +       bool vm_ddestroy;
> > +
> >         /**
> >          * Support different GGTT views into the same object.
> >          * This means there can be multiple VMA mappings per object
> > and per VM.
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > index ca4ed9dd909b..272560ece32e 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > @@ -1204,7 +1204,7 @@ static int exercise_ppgtt(struct
> > drm_i915_private *dev_priv,
> >                 goto out_free;
> >         }
> >         GEM_BUG_ON(offset_in_page(ppgtt->vm.total));
> > -       GEM_BUG_ON(!atomic_read(&ppgtt->vm.open));
> > +       assert_vm_alive(&ppgtt->vm);
> > 
> >         err = func(&ppgtt->vm, 0, ppgtt->vm.total, end_time);
> > 
> > @@ -1437,7 +1437,7 @@ static void track_vma_bind(struct i915_vma
> > *vma)
> >         vma->resource->bi.pages = vma->pages;
> > 
> >         mutex_lock(&vma->vm->mutex);
> > -       list_add_tail(&vma->vm_link, &vma->vm->bound_list);
> > +       list_move_tail(&vma->vm_link, &vma->vm->bound_list);
> >         mutex_unlock(&vma->vm->mutex);
> > }
> > 
> > -- 
> > 2.34.1
> > 


