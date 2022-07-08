Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308856B9DC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 14:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD671136A4;
	Fri,  8 Jul 2022 12:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9891136A4;
 Fri,  8 Jul 2022 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657284032; x=1688820032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W1nl69tR3JR8MQopkC6quWrpLQVU8vavqeC5o8dyFY8=;
 b=WRhoNOa4ShbYvCEVFqE6yoD/0FbLXPm5QQ30aThhufTUsrcfLUjwmT/c
 h8rOWsht6hrPbzT4LY8o/5onKkPcnH4ISjGctLHnudm6S+q+yfjJOHqa6
 vfw9nDd7sXpGii0VQUrvN8GqdXokflgLjvEHsVkBBzog4X1jiT6E6QfzX
 a5HQPQN7U5aOZzGhGB0nXtKEgqpvehw2/Q4ihVxINsaY5JJuIrEmr708D
 JNlW6M4GUReZUG3+PLwfKTrhZL5dL5/0F3Ua1LJbALtP/RB90duv/b/AQ
 hHa3JneobYVT/3Eu2Ux/RiZSDHCEjdofglg5KKa1aeFLMU3FQdSqfy6ym A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285012906"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="285012906"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:40:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="770773006"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:40:31 -0700
Date: Fri, 8 Jul 2022 05:40:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 09/10] drm/i915/vm_bind: Skip vma_lookup for persistent vmas
Message-ID: <20220708124012.GQ14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-10-niranjana.vishwanathapura@intel.com>
 <24b042a19d705c91103dd9e740cf36f5a58c99a9.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24b042a19d705c91103dd9e740cf36f5a58c99a9.camel@linux.intel.com>
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

On Tue, Jul 05, 2022 at 10:57:17AM +0200, Thomas Hellström wrote:
>On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
>> vma_lookup is tied to segment of the object instead of section
>> of VA space. Hence, it do not support aliasing (ie., multiple
>> bindings to the same section of the object).
>> Skip vma_lookup for persistent vmas as it supports aliasing.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_vma.c | 19 ++++++++++++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index 6adb013579be..9aa38b772b5b 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -197,6 +197,10 @@ vma_create(struct drm_i915_gem_object *obj,
>>                 __set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
>>         }
>>  
>> +       if (!i915_vma_is_ggtt(vma) &&
>> +           (view && view->type == I915_GGTT_VIEW_PARTIAL))
>> +               goto skip_rb_insert;
>> +
>
>Rather than guessing that a vma with this signature is a persistent
>vma, which is confusing to the reader, could we have an argument saying
>we want to create a persistent vma?

Yah, sounds good. We probably can even check for vm->vm_bind_mode here
instead of passing a new argument. I think i915 won't create any
internal vmas for this VM, so, should be good to check vm->vm_bind_mode.

>
>>         rb = NULL;
>>         p = &obj->vma.tree.rb_node;
>>         while (*p) {
>> @@ -221,6 +225,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>         rb_link_node(&vma->obj_node, rb, p);
>>         rb_insert_color(&vma->obj_node, &obj->vma.tree);
>>  
>> +skip_rb_insert:
>>         if (i915_vma_is_ggtt(vma))
>>                 /*
>>                  * We put the GGTT vma at the start of the vma-list,
>> followed
>> @@ -292,13 +297,16 @@ i915_vma_instance(struct drm_i915_gem_object
>> *obj,
>>                   struct i915_address_space *vm,
>>                   const struct i915_ggtt_view *view)
>>  {
>> -       struct i915_vma *vma;
>> +       struct i915_vma *vma = NULL;
>>  
>>         GEM_BUG_ON(!kref_read(&vm->ref));
>>  
>> -       spin_lock(&obj->vma.lock);
>> -       vma = i915_vma_lookup(obj, vm, view);
>> -       spin_unlock(&obj->vma.lock);
>> +       if (i915_is_ggtt(vm) || !view ||
>> +           view->type != I915_GGTT_VIEW_PARTIAL) {
>
>Same here?

We probably can remove this code and have vm_bind ioctl directly
call vma_create.

Niranjana

>
>/Thomas
>
>
>> +               spin_lock(&obj->vma.lock);
>> +               vma = i915_vma_lookup(obj, vm, view);
>> +               spin_unlock(&obj->vma.lock);
>> +       }
>>  
>>         /* vma_create() will resolve the race if another creates the
>> vma */
>>         if (unlikely(!vma))
>> @@ -1670,7 +1678,8 @@ static void release_references(struct i915_vma
>> *vma, bool vm_ddestroy)
>>  
>>         spin_lock(&obj->vma.lock);
>>         list_del(&vma->obj_link);
>> -       if (!RB_EMPTY_NODE(&vma->obj_node))
>> +       if (!i915_vma_is_persistent(vma) &&
>> +           !RB_EMPTY_NODE(&vma->obj_node))
>>                 rb_erase(&vma->obj_node, &obj->vma.tree);
>>  
>>         spin_unlock(&obj->vma.lock);
>
