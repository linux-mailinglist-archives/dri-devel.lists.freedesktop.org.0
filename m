Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322E568F36
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 18:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690F511B6E6;
	Wed,  6 Jul 2022 16:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B6D11B714;
 Wed,  6 Jul 2022 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657125161; x=1688661161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=apH7cvSP8zNkafmYTS3wTM5vvy5KeT1npzS5hESnNw4=;
 b=PQQEZBwik1QsrAGgnR/s9zjbxyAVQVndNM3y8rPTVFZh9pEVytrGpYIW
 PwQPNMutMty1VWfXONUYCNocE1lsG1KYcj6tobWPpo2Ly6t7LQ60i8ILL
 7ZBT4ADB1d1Bieh8x1gxwc0/xgyzs91OHeMo2vRdSdI4ADxLeuuaQiobr
 Ukd2lzyG0LxsDpFQIQR8B3NXjHTBQKbYos8wHMwUpBOlQeyW03QY2sklT
 F/dnJkaCALxkR3K8QTRAa2F/nP2h3CLdJ60OoKMDCq4jedYY8wnrRykWW
 Mw2ZP//mUWF44gyzWvHSRn0urKjFR1vflCYb/AiljqDIcC8yT8xmcQcL/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="266834437"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="266834437"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 09:31:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="543469722"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 09:31:36 -0700
Date: Wed, 6 Jul 2022 22:03:21 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 10/10] drm/i915/vm_bind: Fix vm->vm_bind_mutex and
 vm->mutex nesting
Message-ID: <20220706163320.GA26303@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-11-niranjana.vishwanathapura@intel.com>
 <549c2e3253f847aabcc7366c9d5efa582e51f8e8.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <549c2e3253f847aabcc7366c9d5efa582e51f8e8.camel@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-05 at 10:40:56 +0200, Thomas Hellström wrote:
> On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
> > VM_BIND functionality maintain that vm->vm_bind_mutex will never be
> > taken
> > while holding vm->mutex.
> > However, while closing 'vm', vma is destroyed while holding vm-
> > >mutex.
> > But vma releasing needs to take vm->vm_bind_mutex in order to delete
> > vma
> > from the vm_bind_list. To avoid this, destroy the vma outside vm-
> > >mutex
> > while closing the 'vm'.
> > 
> > Signed-off-by: Niranjana Vishwanathapura
> 
> First, when introducing a new feature like this, we should not need to
> end the series with "Fix.." patches like this, rather whatever needs to
> be fixed should be fixed where the code was introduced.
Thanks Thomas for the review. I will fix it.
> 
> Second, an analogy whith linux kernel CPU mapping, could we instead
> think of the vm_bind_lock being similar to the mmap_lock, and the
> vm_mutex being similar to the i_mmap_lock, the former being used for VA
> manipulation and the latter when attaching / removing the backing store
> from the VA?
> 
> Then we would not need to take the vm_bind_lock from vma destruction
> since the VA would already have been reclaimed at that point. For vm
> destruction here we'd loop over all relevant vm bind VAs under the
> vm_bind lock and call vm_unbind? Would that work?

Sounds reasonable. I will try this locking approach.

Ram
> 
> /Thomas
> 
> 
> > <niranjana.vishwanathapura@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gtt.c | 23 ++++++++++++++++++-----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > index 4ab3bda644ff..4f707d0eb3ef 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > @@ -109,7 +109,8 @@ int map_pt_dma_locked(struct i915_address_space
> > *vm, struct drm_i915_gem_object
> >         return 0;
> >  }
> >  
> > -static void clear_vm_list(struct list_head *list)
> > +static void clear_vm_list(struct list_head *list,
> > +                         struct list_head *destroy_list)
> >  {
> >         struct i915_vma *vma, *vn;
> >  
> > @@ -138,8 +139,7 @@ static void clear_vm_list(struct list_head *list)
> >                         i915_vm_resv_get(vma->vm);
> >                         vma->vm_ddestroy = true;
> >                 } else {
> > -                       i915_vma_destroy_locked(vma);
> > -                       i915_gem_object_put(obj);
> > +                       list_move_tail(&vma->vm_link, destroy_list);
> >                 }
> >  
> >         }
> > @@ -147,16 +147,29 @@ static void clear_vm_list(struct list_head
> > *list)
> >  
> >  static void __i915_vm_close(struct i915_address_space *vm)
> >  {
> > +       struct i915_vma *vma, *vn;
> > +       struct list_head list;
> > +
> > +       INIT_LIST_HEAD(&list);
> > +
> >         mutex_lock(&vm->mutex);
> >  
> > -       clear_vm_list(&vm->bound_list);
> > -       clear_vm_list(&vm->unbound_list);
> > +       clear_vm_list(&vm->bound_list, &list);
> > +       clear_vm_list(&vm->unbound_list, &list);
> >  
> >         /* Check for must-fix unanticipated side-effects */
> >         GEM_BUG_ON(!list_empty(&vm->bound_list));
> >         GEM_BUG_ON(!list_empty(&vm->unbound_list));
> >  
> >         mutex_unlock(&vm->mutex);
> > +
> > +       /* Destroy vmas outside vm->mutex */
> > +       list_for_each_entry_safe(vma, vn, &list, vm_link) {
> > +               struct drm_i915_gem_object *obj = vma->obj;
> > +
> > +               i915_vma_destroy(vma);
> > +               i915_gem_object_put(obj);
> > +       }
> >  }
> >  
> >  /* lock the vm into the current ww, if we lock one, we lock all */
> 
