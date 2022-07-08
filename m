Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244E56BA2C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 14:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467F113456;
	Fri,  8 Jul 2022 12:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9533511353B;
 Fri,  8 Jul 2022 12:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657285054; x=1688821054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FM1Ov/ecuKxknUy77REgUD4Al9mQmtXIYm8Xi55sT6A=;
 b=SNmkMf5v7R7iBzdRvC6hc9OKaQVWB7vpAFr2Hphwls4hz11jv8/8ZPAB
 OW/BGEiFNSAYwN4GGEEX6ugau/g3OAuu9RhC1DxeApQT1mTvayynTYsk1
 IHmX6A0W59az6B3Uy2zSMBwM4A7lwB+OGbGH18c9nvmLQlGOyBynEomOx
 rPxfgyYdKDNqU1FOzw1AftFBobe4M5ZVwrImrmLNMHyjRAK9mbvL8OeCe
 e2YFMRjcsJZIh3uwL6MIx8y1Np6n1DwzYzHGJkxdODCRQTy7O8jYug9VN
 F3OXKKZGZ/XsY48FthbwSNWg1ZxOCc54sAnzr8Yc+IjTs8foWgtLYbvaz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="264053535"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="264053535"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:57:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="736330668"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:57:33 -0700
Date: Fri, 8 Jul 2022 05:57:14 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 02/10] drm/i915/vm_bind: Bind and unbind mappings
Message-ID: <20220708125713.GS14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-3-niranjana.vishwanathapura@intel.com>
 <8a21c7a72aeb74f80bd471496c3dcd7b6dcd1df1.camel@linux.intel.com>
 <20220707054307.GM14039@nvishwa1-DESK>
 <cdb3671475c35b3ee8e847d9af4639b75b9c936c.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdb3671475c35b3ee8e847d9af4639b75b9c936c.camel@linux.intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 10:14:38AM +0200, Thomas Hellström wrote:
>On Wed, 2022-07-06 at 22:43 -0700, Niranjana Vishwanathapura wrote:
>> On Wed, Jul 06, 2022 at 06:21:03PM +0200, Thomas Hellström wrote:
>> > On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
>> > > Bind and unbind the mappings upon VM_BIND and VM_UNBIND calls.
>> > >
>> > > Signed-off-by: Niranjana Vishwanathapura
>> > > <niranjana.vishwanathapura@intel.com>
>> > > Signed-off-by: Prathap Kumar Valsan
>> > > <prathap.kumar.valsan@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/i915/Makefile                 |   1 +
>> > >  drivers/gpu/drm/i915/gem/i915_gem_create.c    |  10 +-
>> > >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
>> > >  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  38 +++
>> > >  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 233
>> > > ++++++++++++++++++
>> > >  drivers/gpu/drm/i915/gt/intel_gtt.c           |   7 +
>> > >  drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
>> > >  drivers/gpu/drm/i915/i915_driver.c            |  11 +-
>> > >  drivers/gpu/drm/i915/i915_vma.c               |   7 +-
>> > >  drivers/gpu/drm/i915/i915_vma.h               |   2 -
>> > >  drivers/gpu/drm/i915/i915_vma_types.h         |   8 +
>> > >  11 files changed, 318 insertions(+), 10 deletions(-)
>> > >  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> > >  create mode 100644
>> > > drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> > >
>> > > diff --git a/drivers/gpu/drm/i915/Makefile
>> > > b/drivers/gpu/drm/i915/Makefile
>> > > index 522ef9b4aff3..4e1627e96c6e 100644
>> > > --- a/drivers/gpu/drm/i915/Makefile
>> > > +++ b/drivers/gpu/drm/i915/Makefile
>> > > @@ -165,6 +165,7 @@ gem-y += \
>> > >         gem/i915_gem_ttm_move.o \
>> > >         gem/i915_gem_ttm_pm.o \
>> > >         gem/i915_gem_userptr.o \
>> > > +       gem/i915_gem_vm_bind_object.o \
>> > >         gem/i915_gem_wait.o \
>> > >         gem/i915_gemfs.o
>> > >  i915-y += \
>> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> > > b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> > > index 33673fe7ee0a..927a87e5ec59 100644
>> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> > > @@ -15,10 +15,10 @@
>> > >  #include "i915_trace.h"
>> > >  #include "i915_user_extensions.h"
>> > >  
>> > > -static u32 object_max_page_size(struct intel_memory_region
>> > > **placements,
>> > > -                               unsigned int n_placements)
>> > > +u32 i915_gem_object_max_page_size(struct intel_memory_region
>> > > **placements,
>> >
>> > Kerneldoc.
>>
>> This is an existing function that is being modified. As I
>> mentioned in other thread, we probably need a prep patch early
>> in this series to add missing kernel-docs in i915 which this
>> patch series would later update.
>
>Here we make a static function extern, which according to the patch
>submission guidelines, mandates a kerneloc comment, so it's not so much
>that the function is modified. We should be fine adding kerneldoc in
>the patch that makes the function extern.
>

Ok, sounds good.

>
>>
>> >
>> > > +                                 unsigned int n_placements)
>> > >  {
>> > > -       u32 max_page_size = 0;
>> > > +       u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>> > >         int i;
>> > >  
>> > >         for (i = 0; i < n_placements; i++) {
>> > > @@ -28,7 +28,6 @@ static u32 object_max_page_size(struct
>> > > intel_memory_region **placements,
>> > >                 max_page_size = max_t(u32, max_page_size, mr-
>> > > > min_page_size);
>> > >         }
>> > >  
>> > > -       GEM_BUG_ON(!max_page_size);
>> > >         return max_page_size;
>> > >  }
>> >
>> > Should this change be separated out? It's not immediately clear to
>> > a
>> > reviewer why it is included.
>>
>> It is being removed as max_page_size now has a non-zero default
>> value and hence this check is not valid anymore.
>
>But that in itself deserves an explanation in the patch commit message.
>So that's why I wondered whether it wouldn't be better to separate it
>out?

Yah, we can have this change in a separate patch before we introduce
VM_BIND feature.

>
>>
>> >
>> > >  
>> > > @@ -99,7 +98,8 @@ __i915_gem_object_create_user_ext(struct
>> > > drm_i915_private *i915, u64 size,
>> > >  
>> > >         i915_gem_flush_free_objects(i915);
>> > >  
>> > > -       size = round_up(size, object_max_page_size(placements,
>> > > n_placements));
>> > > +       size = round_up(size,
>> > > i915_gem_object_max_page_size(placements,
>> > > +                                                          
>> > > n_placements));
>> > >         if (size == 0)
>> > >                 return ERR_PTR(-EINVAL);
>> > >  
>> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> > > b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> > > index 6f0a3ce35567..650de2224843 100644
>> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> > > @@ -47,6 +47,8 @@ static inline bool
>> > > i915_gem_object_size_2big(u64
>> > > size)
>> > >  }
>> > >  
>> > >  void i915_gem_init__objects(struct drm_i915_private *i915);
>> > > +u32 i915_gem_object_max_page_size(struct intel_memory_region
>> > > **placements,
>> > > +                                 unsigned int n_placements);
>> > >  
>> > >  void i915_objects_module_exit(void);
>> > >  int i915_objects_module_init(void);
>> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> > > b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> > > new file mode 100644
>> > > index 000000000000..642cdb559f17
>> > > --- /dev/null
>> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> > > @@ -0,0 +1,38 @@
>> > > +/* SPDX-License-Identifier: MIT */
>> > > +/*
>> > > + * Copyright © 2022 Intel Corporation
>> > > + */
>> > > +
>> > > +#ifndef __I915_GEM_VM_BIND_H
>> > > +#define __I915_GEM_VM_BIND_H
>> > > +
>> > > +#include "i915_drv.h"
>> > > +
>> > > +#define assert_vm_bind_held(vm)   lockdep_assert_held(&(vm)-
>> > > > vm_bind_lock)
>> > > +
>> > > +static inline void i915_gem_vm_bind_lock(struct
>> > > i915_address_space
>> > > *vm)
>> > > +{
>> > > +       mutex_lock(&vm->vm_bind_lock);
>> > > +}
>> > > +
>> > > +static inline int
>> > > +i915_gem_vm_bind_lock_interruptible(struct i915_address_space
>> > > *vm)
>> > > +{
>> > > +       return mutex_lock_interruptible(&vm->vm_bind_lock);
>> > > +}
>> > > +
>> > > +static inline void i915_gem_vm_bind_unlock(struct
>> > > i915_address_space
>> > > *vm)
>> > > +{
>> > > +       mutex_unlock(&vm->vm_bind_lock);
>> > > +}
>> > > +
>> >
>> > Kerneldoc for the inlines.
>> >
>> > > +struct i915_vma *
>> > > +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64
>> > > va);
>> > > +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool
>> > > release_obj);
>> > > +int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>> > > +                        struct drm_i915_gem_vm_bind *va,
>> > > +                        struct drm_file *file);
>> > > +int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
>> > > +                          struct drm_i915_gem_vm_unbind *va);
>> > > +
>> > > +#endif /* __I915_GEM_VM_BIND_H */
>> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> > > b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> > > new file mode 100644
>> > > index 000000000000..43ceb4dcca6c
>> > > --- /dev/null
>> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> > > @@ -0,0 +1,233 @@
>> > > +// SPDX-License-Identifier: MIT
>> > > +/*
>> > > + * Copyright © 2022 Intel Corporation
>> > > + */
>> > > +
>> > > +#include <linux/interval_tree_generic.h>
>> > > +
>> > > +#include "gem/i915_gem_vm_bind.h"
>> > > +#include "gt/gen8_engine_cs.h"
>> > > +
>> > > +#include "i915_drv.h"
>> > > +#include "i915_gem_gtt.h"
>> > > +
>> > > +#define START(node) ((node)->start)
>> > > +#define LAST(node) ((node)->last)
>> > > +
>> > > +INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
>> > > +                    START, LAST, static inline, i915_vm_bind_it)
>> > > +
>> > > +#undef START
>> > > +#undef LAST
>> > > +
>> > > +/**
>> > > + * DOC: VM_BIND/UNBIND ioctls
>> > > + *
>> > > + * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind
>> > > GEM
>> > > buffer
>> > > + * objects (BOs) or sections of a BOs at specified GPU virtual
>> > > addresses on a
>> > > + * specified address space (VM). Multiple mappings can map to
>> > > the
>> > > same physical
>> > > + * pages of an object (aliasing). These mappings (also referred
>> > > to
>> > > as persistent
>> > > + * mappings) will be persistent across multiple GPU submissions
>> > > (execbuf calls)
>> > > + * issued by the UMD, without user having to provide a list of
>> > > all
>> > > required
>> > > + * mappings during each submission (as required by older execbuf
>> > > mode).
>> > > + *
>> > > + * The VM_BIND/UNBIND calls allow UMDs to request a timeline out
>> > > fence for
>> > > + * signaling the completion of bind/unbind operation.
>> > > + *
>> > > + * VM_BIND feature is advertised to user via
>> > > I915_PARAM_VM_BIND_VERSION.
>> > > + * User has to opt-in for VM_BIND mode of binding for an address
>> > > space (VM)
>> > > + * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND
>> > > extension.
>> > > + *
>> > > + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
>> > > concurrently
>> > > + * are not ordered. Furthermore, parts of the VM_BIND/UNBIND
>> > > operations can be
>> > > + * done asynchronously, when valid out fence is specified.
>> > > + *
>> > > + * VM_BIND locking order is as below.
>> > > + *
>> > > + * 1) Lock-A: A vm_bind mutex will protect vm_bind lists. This
>> > > lock
>> > > is taken in
>> > > + *    vm_bind/vm_unbind ioctl calls, in the execbuf path and
>> > > while
>> > > releasing the
>> > > + *    mapping.
>> > > + *
>> > > + *    In future, when GPU page faults are supported, we can
>> > > potentially use a
>> > > + *    rwsem instead, so that multiple page fault handlers can
>> > > take
>> > > the read
>> > > + *    side lock to lookup the mapping and hence can run in
>> > > parallel.
>> > > + *    The older execbuf mode of binding do not need this lock.
>> > > + *
>> > > + * 2) Lock-B: The object's dma-resv lock will protect i915_vma
>> > > state
>> > > and needs
>> > > + *    to be held while binding/unbinding a vma in the async
>> > > worker
>> > > and while
>> > > + *    updating dma-resv fence list of an object. Note that
>> > > private
>> > > BOs of a VM
>> > > + *    will all share a dma-resv object.
>> > > + *
>> > > + *    The future system allocator support will use the HMM
>> > > prescribed locking
>> > > + *    instead.
>> >
>> > I don't think the last sentence is relevant for this series. Also,
>> > are
>> > there any other mentions for Locks A, B and C? If not, can we ditch
>> > that naming?
>>
>> It is taken from design rfc :). Yah, I think better to remove it and
>> probably the lock names and make it more specific to the
>> implementation
>> in this patch series.
>
>Ah, OK, if it's taken from the RFC and is an established naming in
>documentation that will remain, then it's fine with me. Perhaps with a
>pointer added to that doc that will help the reader.

sounds good.

>
>>
>> >
>> > > + *
>> > > + * 3) Lock-C: Spinlock/s to protect some of the VM's lists like
>> > > the
>> > > list of
>> > > + *    invalidated vmas (due to eviction and userptr
>> > > invalidation)
>> > > etc.
>> > > + */
>> > > +
>> > > +struct i915_vma *
>> > > +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64
>> > > va)
>> >
>> > Kerneldoc for the extern functions.
>> >
>> >
>> > > +{
>> > > +       struct i915_vma *vma, *temp;
>> > > +
>> > > +       assert_vm_bind_held(vm);
>> > > +
>> > > +       vma = i915_vm_bind_it_iter_first(&vm->va, va, va);
>> > > +       /* Working around compiler error, remove later */
>> >
>> > Is this still relevant? What compiler error is seen here?

I don't remember what error it was and I am no longer seeing it.
May be it got fixed in latest kernel. We can remove this work around.

>> >
>> > > +       if (vma)
>> > > +               temp = i915_vm_bind_it_iter_next(vma, va + vma-
>> > > >size,
>> > > -1);
>> > > +       return vma;
>> > > +}
>> > > +
>> > > +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool
>> > > release_obj)
>> > > +{
>> > > +       assert_vm_bind_held(vma->vm);
>> > > +
>> > > +       if (!list_empty(&vma->vm_bind_link)) {
>> > > +               list_del_init(&vma->vm_bind_link);
>> > > +               i915_vm_bind_it_remove(vma, &vma->vm->va);
>> > > +
>> > > +               /* Release object */
>> > > +               if (release_obj)
>> > > +                       i915_vma_put(vma);
>> >
>> > i915_vma_put() here is confusing. Can we use i915_gem_object_put()
>> > to
>> > further make it clear that the persistent vmas actually take a
>> > reference on the object?
>> >
>>
>> makes sense.
>>
>> > > +       }
>> > > +}
>> > > +
>> > > +int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
>> > > +                          struct drm_i915_gem_vm_unbind *va)
>> > > +{
>> > > +       struct drm_i915_gem_object *obj;
>> > > +       struct i915_vma *vma;
>> > > +       int ret;
>> > > +
>> > > +       va->start = gen8_noncanonical_addr(va->start);
>> > > +       ret = i915_gem_vm_bind_lock_interruptible(vm);
>> > > +       if (ret)
>> > > +               return ret;
>> > > +
>> > > +       vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>> > > +       if (!vma) {
>> > > +               ret = -ENOENT;
>> > > +               goto out_unlock;
>> > > +       }
>> > > +
>> > > +       if (vma->size != va->length)
>> > > +               ret = -EINVAL;
>> > > +       else
>> > > +               i915_gem_vm_bind_remove(vma, false);
>> > > +
>> > > +out_unlock:
>> > > +       i915_gem_vm_bind_unlock(vm);
>> > > +       if (ret || !vma)
>> > > +               return ret;
>> > > +
>> > > +       /* Destroy vma and then release object */
>> > > +       obj = vma->obj;
>> > > +       ret = i915_gem_object_lock(obj, NULL);
>> > > +       if (ret)
>> > > +               return ret;
>> >
>> > This call never returns an error and we could GEM_WARN_ON(...), or
>> > (void) to annotate that the return value is wilfully ignored.
>> >
>>
>> makes sense.
>>
>> > > +
>> > > +       i915_vma_destroy(vma);
>> > > +       i915_gem_object_unlock(obj);
>> > > +       i915_gem_object_put(obj);
>> > > +
>> > > +       return 0;
>> > > +}
>> > > +
>> > > +static struct i915_vma *vm_bind_get_vma(struct
>> > > i915_address_space
>> > > *vm,
>> > > +                                       struct
>> > > drm_i915_gem_object
>> > > *obj,
>> > > +                                       struct
>> > > drm_i915_gem_vm_bind
>> > > *va)
>> > > +{
>> > > +       struct i915_ggtt_view view;
>> > > +       struct i915_vma *vma;
>> > > +
>> > > +       va->start = gen8_noncanonical_addr(va->start);
>> > > +       vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>> > > +       if (vma)
>> > > +               return ERR_PTR(-EEXIST);
>> > > +
>> > > +       view.type = I915_GGTT_VIEW_PARTIAL;
>> > > +       view.partial.offset = va->offset >> PAGE_SHIFT;
>> > > +       view.partial.size = va->length >> PAGE_SHIFT;
>> >
>> > IIRC, this vma view is not handled correctly in the vma code, that
>> > only
>> > understands views for ggtt bindings.
>> >
>>
>> This patch series extends the partial view to ppgtt also.
>> Yah, the naming is still i915_ggtt_view, but I am hoping we can fix
>> the
>> name in a follow up patch later.
>
>Hmm, I somehow thought that the vma page adjustment was a NOP on ppgtt
>and only done on ggtt. But that's indeed not the case. Yes, then this
>is ok. We need to remember, though, that if we're going to use the
>existing vma async unbinding functionality, we'd need to attach the vma
>pages to the vma resource.

Yah. Given that vmas (and hence vma_resource) makes their on sg_table
from that of vma->obj (in this case through intel_partial_pages()),
the 'view' is not relavant after that. So, I think we should be good.

>
>
>>
>> >
>> > > +       vma = i915_vma_instance(obj, vm, &view);
>> > > +       if (IS_ERR(vma))
>> > > +               return vma;
>> > > +
>> > > +       vma->start = va->start;
>> > > +       vma->last = va->start + va->length - 1;
>> > > +
>> > > +       return vma;
>> > > +}
>> > > +
>> > > +int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>> > > +                        struct drm_i915_gem_vm_bind *va,
>> > > +                        struct drm_file *file)
>> > > +{
>> > > +       struct drm_i915_gem_object *obj;
>> > > +       struct i915_vma *vma = NULL;
>> > > +       struct i915_gem_ww_ctx ww;
>> > > +       u64 pin_flags;
>> > > +       int ret = 0;
>> > > +
>> > > +       if (!vm->vm_bind_mode)
>> > > +               return -EOPNOTSUPP;
>> > > +
>> > > +       obj = i915_gem_object_lookup(file, va->handle);
>> > > +       if (!obj)
>> > > +               return -ENOENT;
>> > > +
>> > > +       if (!va->length ||
>> > > +           !IS_ALIGNED(va->offset | va->length,
>> > > +                       i915_gem_object_max_page_size(obj-
>> > > > mm.placements,
>> > > +                                                     obj-
>> > > > mm.n_placements)) ||
>> > > +           range_overflows_t(u64, va->offset, va->length, obj-
>> > > > base.size)) {
>> > > +               ret = -EINVAL;
>> > > +               goto put_obj;
>> > > +       }
>> > > +
>> > > +       ret = i915_gem_vm_bind_lock_interruptible(vm);
>> > > +       if (ret)
>> > > +               goto put_obj;
>> > > +
>> > > +       vma = vm_bind_get_vma(vm, obj, va);
>> > > +       if (IS_ERR(vma)) {
>> > > +               ret = PTR_ERR(vma);
>> > > +               goto unlock_vm;
>> > > +       }
>> > > +
>> > > +       i915_gem_ww_ctx_init(&ww, true);
>> > > +       pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER;
>> > > +retry:
>> > > +       ret = i915_gem_object_lock(vma->obj, &ww);
>> > > +       if (ret)
>> > > +               goto out_ww;
>> > > +
>> > > +       ret = i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
>> > > +       if (ret)
>> > > +               goto out_ww;
>> > > +
>> > > +       /* Make it evictable */
>> > > +       __i915_vma_unpin(vma);
>> >
>> > A considerable effort has been put into avoiding short term vma
>> > pins in
>> > i915. We should add an interface like i915_vma_bind_ww() that
>> > avoids
>> > the pin altoghether.
>>
>> Currently in i915 driver VA managment and device page table bindings
>> are tightly coupled. i915_vma_pin_ww() does the both VA allocation
>> and
>> biding. And we also interpret VA being allocated (drm_mm node
>> allocated)
>> also as vma is bound.
>>
>> Decoupling it would be ideal but I think it needs to be carefully
>> done
>> in a separate patch series to not cause any regression.
>
>So the idea would be not to decouple these, but to just avoid pinning
>the vma in the process.

Well, we need the i915_vma_insert() as well (not just the bind).
I think the best and the only option we have today is i915_vma_pin_ww().
I think that slicing it falls into the bucket of decoupling as I mentioned
above. May be we can take this on later?

Niranjana

>
>
>>
>> >
>> > > +
>> > > +       list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>> > > +       i915_vm_bind_it_insert(vma, &vm->va);
>> > > +
>> > > +       /* Hold object reference until vm_unbind */
>> > > +       i915_gem_object_get(vma->obj);
>> > > +out_ww:
>> > > +       if (ret == -EDEADLK) {
>> > > +               ret = i915_gem_ww_ctx_backoff(&ww);
>> > > +               if (!ret)
>> > > +                       goto retry;
>> > > +       }
>> > > +
>> > > +       if (ret)
>> > > +               i915_vma_destroy(vma);
>> > > +
>> > > +       i915_gem_ww_ctx_fini(&ww);
>> >
>> > Could use for_i915_gem_ww()?
>> >
>>
>> Yah, I think it is a better idea to use it.
>>
>> > > +unlock_vm:
>> > > +       i915_gem_vm_bind_unlock(vm);
>> > > +put_obj:
>> > > +       i915_gem_object_put(obj);
>> > > +       return ret;
>> > > +}
>> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> > > b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> > > index b67831833c9a..135dc4a76724 100644
>> > > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> > > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> > > @@ -176,6 +176,8 @@ int i915_vm_lock_objects(struct
>> > > i915_address_space *vm,
>> > >  void i915_address_space_fini(struct i915_address_space *vm)
>> > >  {
>> > >         drm_mm_takedown(&vm->mm);
>> > > +       GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>> > > +       mutex_destroy(&vm->vm_bind_lock);
>> > >  }
>> > >  
>> > >  /**
>> > > @@ -282,6 +284,11 @@ void i915_address_space_init(struct
>> > > i915_address_space *vm, int subclass)
>> > >  
>> > >         INIT_LIST_HEAD(&vm->bound_list);
>> > >         INIT_LIST_HEAD(&vm->unbound_list);
>> > > +
>> > > +       vm->va = RB_ROOT_CACHED;
>> > > +       INIT_LIST_HEAD(&vm->vm_bind_list);
>> > > +       INIT_LIST_HEAD(&vm->vm_bound_list);
>> > > +       mutex_init(&vm->vm_bind_lock);
>> > >  }
>> > >  
>> > >  void *__px_vaddr(struct drm_i915_gem_object *p)
>> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> > > b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> > > index c812aa9708ae..d4a6ce65251d 100644
>> > > --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> > > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> > > @@ -259,6 +259,15 @@ struct i915_address_space {
>> > >          */
>> > >         struct list_head unbound_list;
>> > >  
>> > > +       /**
>> > > +        * List of VM_BIND objects.
>> > > +        */
>> >
>> > Proper kerneldoc + intel locking guidelines comments, please.
>> >
>> > > +       struct mutex vm_bind_lock;  /* Protects vm_bind lists */
>> > > +       struct list_head vm_bind_list;
>> > > +       struct list_head vm_bound_list;
>> > > +       /* va tree of persistent vmas */
>> > > +       struct rb_root_cached va;
>> > > +
>> > >         /* Global GTT */
>> > >         bool is_ggtt:1;
>> > >  
>> > > diff --git a/drivers/gpu/drm/i915/i915_driver.c
>> > > b/drivers/gpu/drm/i915/i915_driver.c
>> > > index ccf990dfd99b..776ab7844f60 100644
>> > > --- a/drivers/gpu/drm/i915/i915_driver.c
>> > > +++ b/drivers/gpu/drm/i915/i915_driver.c
>> > > @@ -68,6 +68,7 @@
>> > >  #include "gem/i915_gem_ioctls.h"
>> > >  #include "gem/i915_gem_mman.h"
>> > >  #include "gem/i915_gem_pm.h"
>> > > +#include "gem/i915_gem_vm_bind.h"
>> > >  #include "gt/intel_gt.h"
>> > >  #include "gt/intel_gt_pm.h"
>> > >  #include "gt/intel_rc6.h"
>> > > @@ -1783,13 +1784,16 @@ static int i915_gem_vm_bind_ioctl(struct
>> > > drm_device *dev, void *data,
>> > >  {
>> > >         struct drm_i915_gem_vm_bind *args = data;
>> > >         struct i915_address_space *vm;
>> > > +       int ret;
>> > >  
>> > >         vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>> > >         if (unlikely(!vm))
>> > >                 return -ENOENT;
>> > >  
>> > > +       ret = i915_gem_vm_bind_obj(vm, args, file);
>> > > +
>> > >         i915_vm_put(vm);
>> > > -       return -EINVAL;
>> > > +       return ret;
>> > >  }
>> > >  
>> > >  static int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void
>> > > *data,
>> > > @@ -1797,13 +1801,16 @@ static int
>> > > i915_gem_vm_unbind_ioctl(struct
>> > > drm_device *dev, void *data,
>> > >  {
>> > >         struct drm_i915_gem_vm_unbind *args = data;
>> > >         struct i915_address_space *vm;
>> > > +       int ret;
>> > >  
>> > >         vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>> > >         if (unlikely(!vm))
>> > >                 return -ENOENT;
>> > >  
>> > > +       ret = i915_gem_vm_unbind_obj(vm, args);
>> > > +
>> > >         i915_vm_put(vm);
>> > > -       return -EINVAL;
>> > > +       return ret;
>> > >  }
>> > >  
>> > >  static const struct drm_ioctl_desc i915_ioctls[] = {
>> > > diff --git a/drivers/gpu/drm/i915/i915_vma.c
>> > > b/drivers/gpu/drm/i915/i915_vma.c
>> > > index 43339ecabd73..d324e29cef0a 100644
>> > > --- a/drivers/gpu/drm/i915/i915_vma.c
>> > > +++ b/drivers/gpu/drm/i915/i915_vma.c
>> > > @@ -29,6 +29,7 @@
>> > >  #include "display/intel_frontbuffer.h"
>> > >  #include "gem/i915_gem_lmem.h"
>> > >  #include "gem/i915_gem_tiling.h"
>> > > +#include "gem/i915_gem_vm_bind.h"
>> > >  #include "gt/intel_engine.h"
>> > >  #include "gt/intel_engine_heartbeat.h"
>> > >  #include "gt/intel_gt.h"
>> > > @@ -234,6 +235,7 @@ vma_create(struct drm_i915_gem_object *obj,
>> > >         spin_unlock(&obj->vma.lock);
>> > >         mutex_unlock(&vm->mutex);
>> > >  
>> > > +       INIT_LIST_HEAD(&vma->vm_bind_link);
>> > >         return vma;
>> > >  
>> > >  err_unlock:
>> > > @@ -290,7 +292,6 @@ i915_vma_instance(struct drm_i915_gem_object
>> > > *obj,
>> > >  {
>> > >         struct i915_vma *vma;
>> > >  
>> > > -       GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
>> > >         GEM_BUG_ON(!kref_read(&vm->ref));
>> > >  
>> > >         spin_lock(&obj->vma.lock);
>> > > @@ -1660,6 +1661,10 @@ static void release_references(struct
>> > > i915_vma
>> > > *vma, bool vm_ddestroy)
>> > >  
>> > >         spin_unlock(&obj->vma.lock);
>> > >  
>> > > +       i915_gem_vm_bind_lock(vma->vm);
>> > > +       i915_gem_vm_bind_remove(vma, true);
>> > > +       i915_gem_vm_bind_unlock(vma->vm);
>> > > +
>> >
>> > The vm might be destroyed at this point already.
>> >
>>
>> Ah, due to async vma resource release...
>>
>> > From what I understand we can destroy the vma from three call
>> > sites:
>> > 1) VM_UNBIND -> The vma has already been removed from the vm_bind
>> > address space,
>> > 2) object destruction -> since the vma has an object reference
>> > while in
>> > the vm_bind address space, it must also have been removed from the
>> > address space if called from object destruction.
>> > 3) vm destruction. Suggestion is to call VM_UNBIND from under the
>> > vm_bind lock early in vm destruction.
>> >
>> > Then the above added code can be removed and replaced with an
>> > assert
>> > that the vm_bind address space RB_NODE is indeed empty.
>> >
>>
>> ...yah, makes sense to move this code to early in VM destruction than
>> here.
>>
>> Niranjana
>>
>> >
>> > >         spin_lock_irq(&gt->closed_lock);
>> > >         __i915_vma_remove_closed(vma);
>> > >         spin_unlock_irq(&gt->closed_lock);
>> > > diff --git a/drivers/gpu/drm/i915/i915_vma.h
>> > > b/drivers/gpu/drm/i915/i915_vma.h
>> > > index 88ca0bd9c900..dcb49f79ff7e 100644
>> > > --- a/drivers/gpu/drm/i915/i915_vma.h
>> > > +++ b/drivers/gpu/drm/i915/i915_vma.h
>> > > @@ -164,8 +164,6 @@ i915_vma_compare(struct i915_vma *vma,
>> > >  {
>> > >         ptrdiff_t cmp;
>> > >  
>> > > -       GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
>> > > -
>> > >         cmp = ptrdiff(vma->vm, vm);
>> > >         if (cmp)
>> > >                 return cmp;
>> > > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
>> > > b/drivers/gpu/drm/i915/i915_vma_types.h
>> > > index be6e028c3b57..b6d179bdbfa0 100644
>> > > --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> > > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> > > @@ -289,6 +289,14 @@ struct i915_vma {
>> > >         /** This object's place on the active/inactive lists */
>> > >         struct list_head vm_link;
>> > >  
>> > > +       struct list_head vm_bind_link; /* Link in persistent VMA
>> > > list
>> > > */
>> > > +
>> > > +       /** Interval tree structures for persistent vma */
>> >
>> > Proper kerneldoc.
>> >
>> > > +       struct rb_node rb;
>> > > +       u64 start;
>> > > +       u64 last;
>> > > +       u64 __subtree_last;
>> > > +
>> > >         struct list_head obj_link; /* Link in the object's VMA
>> > > list
>> > > */
>> > >         struct rb_node obj_node;
>> > >         struct hlist_node obj_hash;
>> >
>> > Thanks,
>> > Thomas
>> >
>
