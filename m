Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D715569A16
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 07:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE28910E32E;
	Thu,  7 Jul 2022 05:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160510E32E;
 Thu,  7 Jul 2022 05:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657173433; x=1688709433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zU3T8c7APQ39VrfPRTlfrFq0LR12bsC8IiTVuAhn1H0=;
 b=bKGZallp7uPOj9xmcJgG9fmwJtpDXGtCYl8KsXhiwbAczUQHSkHIEcoD
 Fs5etkXJhBVc3g7MCeUE7FXOvEv+pSIcGNN32G2P/sHsgZj6riHyaoX5d
 RKWxwI8dPxSqdXvpKPHkk+YPtfHYK64WhyuU9DnCaETWkd9m27+9JazF6
 hd5ndf5BeubPf/cA6mTKwYGGlYgufp8SA5xBbkCLUo/OxQvbUs/AzjkLl
 SyepELdWQV+CSnyYzvyOVwjXFSk8IIJsNiPKsOV5QDagAiz4htIqySGyg
 t8KfEBCvtIKVqCwH+bF29/qVaHPCUy6lr4KQguNPZYLs86d8ktjcUnHyj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="266967798"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="266967798"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:57:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="650991067"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:57:12 -0700
Date: Wed, 6 Jul 2022 22:56:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 10/10] drm/i915/vm_bind: Fix vm->vm_bind_mutex and
 vm->mutex nesting
Message-ID: <20220707055651.GO14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-11-niranjana.vishwanathapura@intel.com>
 <549c2e3253f847aabcc7366c9d5efa582e51f8e8.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <549c2e3253f847aabcc7366c9d5efa582e51f8e8.camel@linux.intel.com>
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

On Tue, Jul 05, 2022 at 10:40:56AM +0200, Thomas Hellström wrote:
>On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
>> VM_BIND functionality maintain that vm->vm_bind_mutex will never be
>> taken
>> while holding vm->mutex.
>> However, while closing 'vm', vma is destroyed while holding vm-
>> >mutex.
>> But vma releasing needs to take vm->vm_bind_mutex in order to delete
>> vma
>> from the vm_bind_list. To avoid this, destroy the vma outside vm-
>> >mutex
>> while closing the 'vm'.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>
>First, when introducing a new feature like this, we should not need to
>end the series with "Fix.." patches like this, rather whatever needs to
>be fixed should be fixed where the code was introduced.
>

Yah, makes sense.

>Second, an analogy whith linux kernel CPU mapping, could we instead
>think of the vm_bind_lock being similar to the mmap_lock, and the
>vm_mutex being similar to the i_mmap_lock, the former being used for VA
>manipulation and the latter when attaching / removing the backing store
>from the VA?
>
>Then we would not need to take the vm_bind_lock from vma destruction
>since the VA would already have been reclaimed at that point. For vm
>destruction here we'd loop over all relevant vm bind VAs under the
>vm_bind lock and call vm_unbind? Would that work?
>

Yah. Infact, in vm_unbind call, we first do VA reclaim
(i915_gem_vm_bind_remove()) under the vm_bind_lock and destroy the
vma (i915_vma_destroy()) outside the vm_bind_lock (under the object
lock). The vma destruction in vm_bind call error path is bit different,
but I think it can be handled as well.
Yah, as mentioned in other thread, doing a VA reclaim
(i915_gem_vm_bind_remove()) early during VM destruction under the
vm_bind_lock as you suggested would fit in there nicely.

Niranjana

>/Thomas
>
>
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_gtt.c | 23 ++++++++++++++++++-----
>>  1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index 4ab3bda644ff..4f707d0eb3ef 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -109,7 +109,8 @@ int map_pt_dma_locked(struct i915_address_space
>> *vm, struct drm_i915_gem_object
>>         return 0;
>>  }
>>  
>> -static void clear_vm_list(struct list_head *list)
>> +static void clear_vm_list(struct list_head *list,
>> +                         struct list_head *destroy_list)
>>  {
>>         struct i915_vma *vma, *vn;
>>  
>> @@ -138,8 +139,7 @@ static void clear_vm_list(struct list_head *list)
>>                         i915_vm_resv_get(vma->vm);
>>                         vma->vm_ddestroy = true;
>>                 } else {
>> -                       i915_vma_destroy_locked(vma);
>> -                       i915_gem_object_put(obj);
>> +                       list_move_tail(&vma->vm_link, destroy_list);
>>                 }
>>  
>>         }
>> @@ -147,16 +147,29 @@ static void clear_vm_list(struct list_head
>> *list)
>>  
>>  static void __i915_vm_close(struct i915_address_space *vm)
>>  {
>> +       struct i915_vma *vma, *vn;
>> +       struct list_head list;
>> +
>> +       INIT_LIST_HEAD(&list);
>> +
>>         mutex_lock(&vm->mutex);
>>  
>> -       clear_vm_list(&vm->bound_list);
>> -       clear_vm_list(&vm->unbound_list);
>> +       clear_vm_list(&vm->bound_list, &list);
>> +       clear_vm_list(&vm->unbound_list, &list);
>>  
>>         /* Check for must-fix unanticipated side-effects */
>>         GEM_BUG_ON(!list_empty(&vm->bound_list));
>>         GEM_BUG_ON(!list_empty(&vm->unbound_list));
>>  
>>         mutex_unlock(&vm->mutex);
>> +
>> +       /* Destroy vmas outside vm->mutex */
>> +       list_for_each_entry_safe(vma, vn, &list, vm_link) {
>> +               struct drm_i915_gem_object *obj = vma->obj;
>> +
>> +               i915_vma_destroy(vma);
>> +               i915_gem_object_put(obj);
>> +       }
>>  }
>>  
>>  /* lock the vm into the current ww, if we lock one, we lock all */
>
